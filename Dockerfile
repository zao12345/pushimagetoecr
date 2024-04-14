FROM ubuntu:latest
# Update and install necessary packages
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install openjdk-8-jdk wget && \
    apt-get clean
# Install Tomcat
RUN mkdir /usr/local/tomcat && \
    wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz -O /tmp/tomcat.tar.gz && \
    cd /tmp && tar xvfz tomcat.tar.gz && \
    cp -Rv /tmp/apache-tomcat-8.5.100/* /usr/local/tomcat/
# Create webapps directory
RUN mkdir -p /usr/local/tomcat/webapps
# Copy your web application
RUN mkdir -p /usr/local/tomcat/webapps/myapp && \
    echo "<!DOCTYPE html>" > /usr/local/tomcat/webapps/myapp/index.html && \
    echo "<html lang=\"en\">" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "<head>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "    <meta charset=\"UTF-8\">" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "    <title>Welcome to Zainab's page</title>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "</head>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "<body>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "    <header>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "        <h1>Welcome to Zainab's page</h1>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "        <p>Here is my sample webpage for the DevOps project.</p>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "    </header>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "</body>" >> /usr/local/tomcat/webapps/myapp/index.html && \
    echo "</html>" >> /usr/local/tomcat/webapps/myapp/index.html
# Expose port
EXPOSE 8080
# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
