Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382731F8FBA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDA46E2B6;
	Mon, 15 Jun 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CEC89E0D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:21 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c12so8130731lfc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AU8aHNXSJicC/3mJ6DI0lDrv2zkNv1iB0kltJtsuQAw=;
 b=EuuwpiMkbbMKMls8xVM/R+dW4jTSovpLjRK+sPtMRrFMpHoHw/kpM0xivjB5l+3Wu3
 XcUOjOxZDNoxCm9oFseCYWGMQ4vKztSVSKaiiekr0ZHPjmq71USjRbt3J8TPe3Km7Gqj
 86xW1PapknQ65as28VSKdVfcrouIaRfG8tcHkG1XO8H0q1TQP2ev6QgYkXmf6yzttsN1
 3+Qt1QJ4OnQcEEPRzCq/I/qpa7toX5wmOqFyYeMQJA8iqB8HECwkI+b4byv4eW8aSFdx
 DUVNa2qUVBn5Ue4ihyiX2OKpG5BslNmisbchP8GEm4WR8NFbkSb1bIk8yMxj4seYeMQ+
 BnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AU8aHNXSJicC/3mJ6DI0lDrv2zkNv1iB0kltJtsuQAw=;
 b=OvMSxD0toNIiWtqUfjxlhu0QRo9STebClyjpJsyrlyU58csxTiByXsFxYJUmu+fnX0
 Wm2HjYZy6YBgMfc1bO7/dxpjWIwMedypQ9jFybr92hmxIgIxl+zKeLawcAa28TtyXLzp
 uBanfSvhh+AxLCAndTs+eUM+rmMOUFP5Wmz9byWR7+sw7o4Hn0DX5s94oavFsxhwQJSm
 NAgWMN4toQrVLbmYRIPtjIE+Rguu+Ywvju7YB/wIoaKB/0JrqcS0dKHoIYK808i8Lo1x
 N8+899b1XdkdZF003IlJzjnhRU9B2rVTET2nzoPiZBdStfTKA/87SgOy4vXVAC+GDcbN
 N00Q==
X-Gm-Message-State: AOAM532oQSbtE49HygCE9/ZZwLnDvfkfXOYSse5QXqXIrnyUHGuxYfv4
 W4DLc8MYpKblphNWP2EavBI=
X-Google-Smtp-Source: ABdhPJzCKQtPD6hDheFX6eXjxf0eeSg/hLqj0WyObz6WVWCknsTBezAKbLQH2/+sU3UDZqxB0Q3JGg==
X-Received: by 2002:a19:356:: with SMTP id 83mr11724834lfd.179.1592155399430; 
 Sun, 14 Jun 2020 10:23:19 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:18 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 1/6] of_graph: add of_graph_get_local_port()
Date: Sun, 14 Jun 2020 20:22:29 +0300
Message-Id: <20200614172234.8856-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614172234.8856-1-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some case, like a DRM display code for example, it's useful to silently
check whether port node exists at all in a device-tree before proceeding
with parsing the graph.

This patch adds of_graph_get_local_port() which returns pointer to a local
port node, or NULL if graph isn't specified in a device-tree for a given
device node.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/property.c    | 32 +++++++++++++++++++++++---------
 include/linux/of_graph.h |  7 +++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 1f2086f4e7ce..05c5f619b8bb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -608,15 +608,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 	 * parent port node.
 	 */
 	if (!prev) {
-		struct device_node *node;
-
-		node = of_get_child_by_name(parent, "ports");
-		if (node)
-			parent = node;
-
-		port = of_get_child_by_name(parent, "port");
-		of_node_put(node);
-
+		port = of_graph_get_local_port(parent);
 		if (!port) {
 			pr_err("graph: no port node found in %pOF\n", parent);
 			return NULL;
@@ -765,6 +757,28 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
 }
 EXPORT_SYMBOL(of_graph_get_remote_port);
 
+/**
+ * of_graph_get_local_port() - get local port node
+ * @node: pointer to a local endpoint device_node
+ *
+ * Return: First local port node associated with local endpoint node linked
+ *	   to @node. Use of_node_put() on it when done.
+ */
+struct device_node *of_graph_get_local_port(const struct device_node *node)
+{
+	struct device_node *ports, *port;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (ports)
+		node = ports;
+
+	port = of_get_child_by_name(node, "port");
+	of_node_put(ports);
+
+	return port;
+}
+EXPORT_SYMBOL(of_graph_get_local_port);
+
 int of_graph_get_endpoint_count(const struct device_node *np)
 {
 	struct device_node *endpoint;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 01038a6aade0..1fdeb72c7765 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -54,6 +54,7 @@ struct device_node *of_graph_get_remote_port_parent(
 struct device_node *of_graph_get_remote_port(const struct device_node *node);
 struct device_node *of_graph_get_remote_node(const struct device_node *node,
 					     u32 port, u32 endpoint);
+struct device_node *of_graph_get_local_port(const struct device_node *node);
 #else
 
 static inline int of_graph_parse_endpoint(const struct device_node *node,
@@ -116,6 +117,12 @@ static inline struct device_node *of_graph_get_remote_node(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_local_port(
+					const struct device_node *node)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_OF */
 
 #endif /* __LINUX_OF_GRAPH_H */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
