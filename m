Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844A2104BB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8EE6E853;
	Wed,  1 Jul 2020 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC946E3B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:16:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so25100392ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7/jf6iskdniTzEnZUnWGVVNcVP/qHfzghErMkcYKrI=;
 b=eRDYz8Af3Y6euS1TibxYdASJGDq3VMjusT+reg7W83QwN6iS5cczzeL7lRZmIlOdeh
 +yxCgS4h4GUhkLfqEsJ8zC/1ye2DZLjRSuDL1Jb7fIVw+dV3KkbFeNcDoKF1BqYEQdvP
 Ezz2+XZb8Eo8+9HKpa8NhW/9EdsOEmlEebOX4A0WuU8krf87ml3nFcZT0q/h/zGE2MmT
 v0ALd1Jr+CabNSulFfmxAYSvyfuohUdk6m3pb744fWQhzufx5KW+LMP4GRovZDYl2FIT
 3AZ6Xnh2nC94N145k/0zPM+Jm9gVq6CWjU7S82XxRBtRH3ho3ILvRptaFxjqGTCdtCOX
 zy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7/jf6iskdniTzEnZUnWGVVNcVP/qHfzghErMkcYKrI=;
 b=agz9gnlJYHhUp0xgp1ruts7EPO3uQNXSugu2PxeYOqbIohNrILQP4aZndWzanLuANX
 RKOc2ASzKK+1sWq9YGF/LtaNX8Ei7rQmUuj5ci9H2ZZsgjfyVEB1Tt2KDfoWCTRg5byY
 BHAy8xlRJxiizm4S7WKv3r4wZe+LhFQNg8e1+ZIpoweG26TJPMn1mDA56q7QdwfFKavo
 qNykB5l5k2Se7f2gY4xv32m8A50ctl432IuOkCjctAU0gHAy2CerpwcDGuwZP7Iva1z7
 eDA+fwBGJkz5qSOcde654CwOewU92QU5V22J+j8CDMC4OY0CPwqzs0Tq+0gWW2dgeOQS
 PJgw==
X-Gm-Message-State: AOAM532w5Wh3WF0J23fiC1440QPXi3mFKNotyVJgQCH39RBbcyAGOm8I
 Y7s/ffBkIzRVxdqEwD2EPuA=
X-Google-Smtp-Source: ABdhPJyvXbSFIlwy/fqehI8pJT5nQ8DL+Dt/RKHyIvne+LI9aF8jQ0bM9Z5mZc3y2fy7CQthFoOeHA==
X-Received: by 2002:a05:651c:107a:: with SMTP id
 y26mr11354430ljm.59.1593569792401; 
 Tue, 30 Jun 2020 19:16:32 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id i2sm1296892lji.59.2020.06.30.19.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:16:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v9 1/2] of_graph: add of_graph_is_present()
Date: Wed,  1 Jul 2020 05:16:16 +0300
Message-Id: <20200701021617.12030-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701021617.12030-1-digetx@gmail.com>
References: <20200701021617.12030-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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

This patch adds of_graph_is_present() which returns true if given
device-tree node contains OF graph port.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
 include/linux/of_graph.h |  6 +++++
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6a5760f0d6cd..e12b8b491837 100644
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
+ * of_graph_is_present() - check graph's presence
+ * @node: pointer to a device_node checked for the graph's presence
+ *
+ * Return: True if @node has a port or ports sub-node, false otherwise.
+ */
+bool of_graph_is_present(const struct device_node *node)
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
+EXPORT_SYMBOL(of_graph_is_present);
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
index 01038a6aade0..4d7756087b6b 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -38,6 +38,7 @@ struct of_endpoint {
 	     child = of_graph_get_next_endpoint(parent, child))
 
 #ifdef CONFIG_OF
+bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
@@ -56,6 +57,11 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
 					     u32 port, u32 endpoint);
 #else
 
+static inline bool of_graph_is_present(const struct device_node *node)
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
