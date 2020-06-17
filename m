Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408821FEC42
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7646EB19;
	Thu, 18 Jun 2020 07:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7676E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:27:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id i3so4881141ljg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctWQ9TZFDyYjy41m/bWYQmrPw1HpGYc8fpv1hjZ0KQo=;
 b=dwdklXAyAFHJ23dbH03q3jAUtq32OHCptiGtSVxoBCUYeso8+WqA8A3bizGuDPU+gv
 oHqGwfOcvTDr4l1aQqut40IA7a72w/rxkeB0xhQQt5NXh46g68JVMYBrhzcd9Cy1uS9x
 hV/RWVaPq9jgBivD97/qgxpKcTmnyfcz7zzrrlUQjjMe1G68EdaKfIpEs5OkLRaqNofe
 1WqgUDWkrCdKh3s6VS5PLcUnEvzaCp+B9WC2ztT6UnRgusIhz7Y/KNhqeZt7EROiL3in
 b5DAcTGgpErJRuq5SUt1ohcAaLk6wNFXzx35XUedJ+z8PxdU7ouvHR2/htPkD/qlhLRl
 /Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctWQ9TZFDyYjy41m/bWYQmrPw1HpGYc8fpv1hjZ0KQo=;
 b=RiEYW7w8xAVxrQqR6XQl9T9oJfkVa9YQtVwKvC8bjlmxjNxQqVmPSORHD8N12dIpcD
 Tw5FeELajK0hkqaE/WyC6X4YlNOWHlVgkPhe72EIUxjxc3Mo9zDhv08rZb2SvdJTSOJd
 NyNoRYpri0MXnifk5BweNFa68OP6e/RJe37RdTAWVpz6L8MMSTCJ6aCdwzP4y7WeYS4S
 Ybch3kYx6uVuZRuaNkuIZRoF/7+06QOm5ZrPjvwR83gmafmGQ2YlZ2z0yewNSFdGB/20
 XQ2G+8fxPO3G1OkVKEf9Iji93nrb0M+il9AcVaZz2xwIoDN/oTEVqPBKm1O/TFPE48Us
 ks3A==
X-Gm-Message-State: AOAM531J6RbPBpIxMmoOe8P8BeIAobPa9miAdgnWwWiXDRT5u1Y+X1i6
 xdCThRc+R77Jzj0vrrUZu68=
X-Google-Smtp-Source: ABdhPJwkoTaH4WuZGpqJFoZ45uqBFI0iXLbYRGzllThvZoBuBs9UOOEuxcDKPe9JyThvyYJ1kM5KiA==
X-Received: by 2002:a2e:891a:: with SMTP id d26mr710439lji.384.1592432875401; 
 Wed, 17 Jun 2020 15:27:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:27:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 1/7] of_graph: add of_graph_presents()
Date: Thu, 18 Jun 2020 01:26:57 +0300
Message-Id: <20200617222703.17080-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
with parsing of the graph.

This patch adds of_graph_presents() that returns true if given device-tree
node contains OF graph port.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
 include/linux/of_graph.h |  6 +++++
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 1f2086f4e7ce..b84ed6a7cf50 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -29,6 +29,48 @@
 
 #include "of_private.h"
 
+/**
+ * of_graph_get_first_local_port() - get first local port node
+ * @node: pointer to a local endpoint device_node
+ *
+ * Return: First local port node associated with local endpoint node linked
+ *	   to @node. Use of_node_put() on it when done.
+ */
+static struct device_node *
+of_graph_get_first_local_port(const struct device_node *node)
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
+
+/**
+ * of_graph_presents() - check graph's presence
+ * @node: pointer to a device_node checked for the graph's presence
+ *
+ * Return: True if @node has a port or ports sub-node, false otherwise.
+ */
+bool of_graph_presents(const struct device_node *node)
+{
+	struct device_node *local;
+
+	local = of_graph_get_first_local_port(node);
+	if (!local)
+		return false;
+
+	of_node_put(local);
+
+	return true;
+}
+EXPORT_SYMBOL(of_graph_presents);
+
 /**
  * of_property_count_elems_of_size - Count the number of elements in a property
  *
@@ -608,15 +650,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
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
+		port = of_graph_get_first_local_port(parent);
 		if (!port) {
 			pr_err("graph: no port node found in %pOF\n", parent);
 			return NULL;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 01038a6aade0..cc3028a0659d 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -38,6 +38,7 @@ struct of_endpoint {
 	     child = of_graph_get_next_endpoint(parent, child))
 
 #ifdef CONFIG_OF
+bool of_graph_presents(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
@@ -56,6 +57,11 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
 					     u32 port, u32 endpoint);
 #else
 
+static inline bool of_graph_presents(const struct device_node *node)
+{
+	return false;
+}
+
 static inline int of_graph_parse_endpoint(const struct device_node *node,
 					struct of_endpoint *endpoint)
 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
