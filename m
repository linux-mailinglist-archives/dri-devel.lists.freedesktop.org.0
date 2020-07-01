Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A441211CB2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678E06E512;
	Thu,  2 Jul 2020 07:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8B86E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:43:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y18so13004144lfh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vhza9ZHeiMaCPs/6QRV0zm5dqFctu0tGjnrB9xohpRY=;
 b=jjGc2Fb5f5oGDiIof5sN1xI+8DKa0bOXujnT3GO1Br5PDOxSM+kEYWhbWtKT5KjtLH
 fnuP0+B6s6RWxdH8fetIqJQVdQszj3Kfa2RgnE8R4LUfey9OsKPmnZEFR3yWv2EieCT/
 WOnNnkbm+BfX4PlRgD886yD+mYts7JB/RQ0IxOe+r5++BznYspBgwtwGsEZ22TwBjdGu
 SdrqTH8eYsF5uFcscqmUvLAtf/x6yRe/9JD2PV7HMfo8BM0dfcw0NyUG/E38vWaD30SE
 Ox5oDna49wLaCwhpIpI1Jchp6ghjDWUxnTB/ZA8SeKl37pnCrXRIOKqakZK/wm85GiNh
 YpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vhza9ZHeiMaCPs/6QRV0zm5dqFctu0tGjnrB9xohpRY=;
 b=bjjR5I9Qkn9jPbuxgB3Ct+aRdjrMlHidkeGCBcvgIxk/wNfqjgFiZgocl32K5vbD8v
 mx4jeC5JHZtzpmTKVipSm3pAm9gufrJ5l6rHXhSa7GyHA49lQwSWvTTPMpcfWCVQ08Lv
 VMNzDwThSQNwoF4k+Dx5oGZwI9Vozf40HHZ/TcCgNaXGXqA7qynychEg3QX9zRNutp1c
 cWBip5omtA2BH0NIEkBWpLNGWnnlk/SsqJd1avINfN7AdnfK+hw4IEysEkMiZAk6dw0L
 JvRZLrA6eeD/I30rZzL829YJQGEPMY32pcrG4JDHblVWo3/Ud6RrTr2sGAhbhFhEDsxj
 9eng==
X-Gm-Message-State: AOAM5324QH7PHgBULCqxraUJpz3j7DNFtzvcpcI87aQpX20H/YiID/WX
 IuWAa8Cyq/hR14y7sVDXKeM=
X-Google-Smtp-Source: ABdhPJxzWdx03z6LDNSI0qZvHK4dIxS6mE6LKiwnMXFfZ5H2XLyjhSUJJvI3F4HorF2xTzpmLloM7g==
X-Received: by 2002:ac2:44b2:: with SMTP id c18mr13714003lfm.99.1593589381631; 
 Wed, 01 Jul 2020 00:43:01 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e10sm1520881ljb.118.2020.07.01.00.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:43:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v10 1/2] of_graph: add of_graph_is_present()
Date: Wed,  1 Jul 2020 10:42:31 +0300
Message-Id: <20200701074232.13632-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701074232.13632-1-digetx@gmail.com>
References: <20200701074232.13632-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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

In some cases it's very useful to silently check whether port node exists
at all in a device-tree before proceeding with parsing the graph. The DRM
bridges code is one example of such case where absence of a graph in a
device-tree is a legit condition.

This patch adds of_graph_is_present() which returns true if given
device-tree node contains OF graph port.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/property.c    | 23 +++++++++++++++++++++++
 include/linux/of_graph.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6a5760f0d6cd..fed7229d9d9f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -29,6 +29,29 @@
 
 #include "of_private.h"
 
+/**
+ * of_graph_is_present() - check graph's presence
+ * @node: pointer to device_node containing graph port
+ *
+ * Return: True if @node has a port or ports (with a port) sub-node,
+ * false otherwise.
+ */
+bool of_graph_is_present(const struct device_node *node)
+{
+	struct device_node *ports, *port;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (ports)
+		node = ports;
+
+	port = of_get_child_by_name(node, "port");
+	of_node_put(ports);
+	of_node_put(port);
+
+	return !!port;
+}
+EXPORT_SYMBOL(of_graph_is_present);
+
 /**
  * of_property_count_elems_of_size - Count the number of elements in a property
  *
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
