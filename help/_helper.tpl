{{- define "prod" }}
  replicas: {{ .Values.prod.replicas}}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 100%
      maxUnavailable: 25%
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: {{ .Release.Name }}-{{ .Values.env }}
        image: {{ .Values.prod.repo }}/{{ .Values.prod.image }}:{{ .Values.prod.tag  }}
        ports:
        - containerPort: 8080
{{- end }}


{{- define "qa" }}
  replicas: {{ .Values.prod.replicas}}
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 100%
      maxUnavailable: 100%
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: {{ .Release.Name }}-{{ .Values.env }}
        image: {{ .Values.qa.repo }}/{{ .Values.qa.image }}:{{ .Values.qa.tag  }}
        ports:
        - containerPort: 8080
{{- end }}
