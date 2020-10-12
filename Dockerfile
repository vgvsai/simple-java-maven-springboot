FROM openjdk:8

MAINTAINER zjnblank.top

ADD target/demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

RUN ["mkdir", "err"]
RUN ["cd", "err"]
RUN ["touch", "apperr.log"]
RUN ["cd", ".."]

VOLUME ["/err"]

#ENTRYPOINT ["java", "-jar", "/app.jar"]
ENTRYPOINT ["nohup", "java", "-jar", "-Duser.timezone=GMT+08", "/app.jar", ">/err/apperr.log", "2>&1&"]
