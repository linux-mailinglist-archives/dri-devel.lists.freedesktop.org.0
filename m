Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705E1B01FA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656486E21B;
	Mon, 20 Apr 2020 06:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD186ECB6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e25so5341325ljg.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LF9qYPsgEt1mOQlLDUJnZ056rYW87d7CQEg+TJz1Umo=;
 b=k8+tA4LgVm/G4HwuE5XkDVDgVP2w8rgA8cOUO3qaGJLBV/QXBgCtT8+izVcKJ9SH9i
 dWi5cPGfPBEnUGD0+b8pcaw3xxATY/NlnPqvP1i5I4N1CaM6L9Afkbu38qDJAW6vakzO
 UnEx4O2FNYFQ0RAo8p316b8SlGuYtPKe0V9Z0cwGQ304j80ERHW1vcnNsAOfAakWJzUt
 iCz57nV9Xj0rJ+kg9evHgr2LN1pfLSXk7KpFmDDuUS2h19N84cD63v9860QXjnrBMS36
 O0lHx8LkKbWZSa2ayFBTA7QJdRq1JzKZ5AiNLZFJ+qpFSSHT/4HzSJyQrASe9QFovvrB
 khpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LF9qYPsgEt1mOQlLDUJnZ056rYW87d7CQEg+TJz1Umo=;
 b=Rj5AE0tXbcP7c3HDoGXuF4o9Hk5/kmcEeJwEXoAYHpMOUrGo9x3dJxLXBeMF4CnkLy
 JYAsbtD+XfI29We9igIPAJdxjqJ3jCRpnyQnWl6RVFTlJ+BT9L6QPffk1yg4wGR8+H3a
 8kyzvMdm55mZxzsvSPtwvXPOPuJa7DY5jHAffXZrFWNXaiK+Pl/USNx8izBX3cPl6Hub
 Q+OpAia+/Bp8plBsOEMTWu7ZH8BNKIIrwXfqaoUPbcK3kek8hDEzv7mHel/pAfK//Q57
 y1wKCnesI7ZQ3DgZyXUYrrE3TMg+Y3mbwDqfYyqIg2tryxHTAXwPu21lGfdUkUYuk7vd
 S7yQ==
X-Gm-Message-State: AGi0PuYspKJMaOh1u9QllXq/FqoHs+NFWpdZNrT3Fxwy4vAgM7ZfqI5A
 EUSOXLeE7N1izfUTOyX2U1U=
X-Google-Smtp-Source: APiQypLOLWFYy5XnCNRUduSZevMMwv/vy951mpF50dk/aGrJ00HsLstuqzx1B3gNuIYB77wn1VAJBQ==
X-Received: by 2002:a2e:164e:: with SMTP id 14mr4869678ljw.253.1587229638510; 
 Sat, 18 Apr 2020 10:07:18 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:17 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
Date: Sat, 18 Apr 2020 20:06:58 +0300
Message-Id: <20200418170703.1583-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/property.c    | 32 +++++++++++++++++++++++---------
 include/linux/of_graph.h |  7 +++++++
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 252e4f600155..5dbeccaabb86 100644
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
