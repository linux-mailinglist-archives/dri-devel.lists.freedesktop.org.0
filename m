Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE116FE1FB
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081BB10E4D3;
	Wed, 10 May 2023 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0EA10E4D3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:58:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CE82CD2B14
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:48:09 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90E59C0005;
 Wed, 10 May 2023 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1683733686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/KSDSRKpLHcB4gpgTZNIsinLN/YQM+hIOrBqkC1k88=;
 b=UyBOIGVDHTkQ8GTasBO0HB+J1Z++0S2Zw1KtqqxmwJ4aGo1ar2Fehj+YzqCd6nS9aiJGk/
 QOiyr4fDBL+t9ntTKIlFiCOfk00S5AjWG/encJ5YI4PUdlSKCTOi15hO6HQjCB5SuTe7Lh
 HQsVgBhuEYVlvDsCJN2/yLuATuL7TI7gSsZo0nBDvUt0hcSkxvutbWZGDPoR8sYKECBzoi
 PhppTuKWj0NcjNng2XItbbpsvkn1N3dXJ367S0donGgt2cQYM3f25bYfyqKFgLGxyNgUY9
 K9+1jyBXd2FOVnxVI2K6WYNswx6HUfUCQK8VyM62nc8x9N0nFQ9ABQ9+Y46jlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/5] of: module: Mutate of_device_uevent() into two helpers
Date: Wed, 10 May 2023 17:48:00 +0200
Message-Id: <20230510154803.189096-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510154803.189096-1-miquel.raynal@bootlin.com>
References: <20230510154803.189096-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the OF related logic inside of/module.c and use it from of_device.h
with an inline helper so there is no visible change from the users point
of view.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/device.c       | 42 ---------------------------------------
 drivers/of/module.c       | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/of.h        |  6 ++++++
 include/linux/of_device.h | 17 +++++++++++++---
 4 files changed, 61 insertions(+), 45 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 45ce83a8945f..5e538e1ed623 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -246,48 +246,6 @@ const void *of_device_get_match_data(const struct device *dev)
 }
 EXPORT_SYMBOL(of_device_get_match_data);
 
-/**
- * of_device_uevent - Display OF related uevent information
- * @dev:	Device to display the uevent information for
- * @env:	Kernel object's userspace event reference to fill up
- */
-void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
-{
-	const char *compat, *type;
-	struct alias_prop *app;
-	struct property *p;
-	int seen = 0;
-
-	if ((!dev) || (!dev->of_node))
-		return;
-
-	add_uevent_var(env, "OF_NAME=%pOFn", dev->of_node);
-	add_uevent_var(env, "OF_FULLNAME=%pOF", dev->of_node);
-	type = of_node_get_device_type(dev->of_node);
-	if (type)
-		add_uevent_var(env, "OF_TYPE=%s", type);
-
-	/* Since the compatible field can contain pretty much anything
-	 * it's not really legal to split it out with commas. We split it
-	 * up using a number of environment variables instead. */
-	of_property_for_each_string(dev->of_node, "compatible", p, compat) {
-		add_uevent_var(env, "OF_COMPATIBLE_%d=%s", seen, compat);
-		seen++;
-	}
-	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
-
-	seen = 0;
-	mutex_lock(&of_mutex);
-	list_for_each_entry(app, &aliases_lookup, link) {
-		if (dev->of_node == app->np) {
-			add_uevent_var(env, "OF_ALIAS_%d=%s", seen,
-				       app->alias);
-			seen++;
-		}
-	}
-	mutex_unlock(&of_mutex);
-}
-
 int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
 {
 	int sl;
diff --git a/drivers/of/module.c b/drivers/of/module.c
index c05fb8ca575c..c729675fdd04 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -8,6 +8,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include "of_private.h"
+
 ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
 {
 	const char *compat;
@@ -91,3 +93,42 @@ int of_request_module(const struct device_node *np)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_request_module);
+
+int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
+{
+	const char *compat, *type;
+	struct alias_prop *app;
+	struct property *p;
+	int seen = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	add_uevent_var(env, "OF_NAME=%pOFn", np);
+	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
+	type = of_node_get_device_type(np);
+	if (type)
+		add_uevent_var(env, "OF_TYPE=%s", type);
+
+	/* Since the compatible field can contain pretty much anything
+	 * it's not really legal to split it out with commas. We split it
+	 * up using a number of environment variables instead. */
+	of_property_for_each_string(np, "compatible", p, compat) {
+		add_uevent_var(env, "OF_COMPATIBLE_%d=%s", seen, compat);
+		seen++;
+	}
+	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
+
+	seen = 0;
+	mutex_lock(&of_mutex);
+	list_for_each_entry(app, &aliases_lookup, link) {
+		if (np == app->np) {
+			add_uevent_var(env, "OF_ALIAS_%d=%s", seen,
+				       app->alias);
+			seen++;
+		}
+	}
+	mutex_unlock(&of_mutex);
+
+	return 0;
+}
diff --git a/include/linux/of.h b/include/linux/of.h
index dcdd9396ac37..d99f33fc25d3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -388,6 +388,7 @@ extern ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
 extern ssize_t of_printable_modalias(const struct device_node *np, char *str,
 				     ssize_t len);
 extern int of_request_module(const struct device_node *np);
+extern int of_uevent(struct device_node *np, struct kobj_uevent_env *env);
 
 /* phandle iterator functions */
 extern int of_phandle_iterator_init(struct of_phandle_iterator *it,
@@ -771,6 +772,11 @@ static inline int of_request_module(const struct device_node *np)
 	return -ENODEV;
 }
 
+static inline int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
+{
+	return -ENODEV;
+}
+
 static inline int of_phandle_iterator_init(struct of_phandle_iterator *it,
 					   const struct device_node *np,
 					   const char *list_name,
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index bca66f59814a..af5ee78e0c05 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -35,7 +35,15 @@ static inline ssize_t of_device_modalias(struct device *dev, char *str,
 	return of_printable_modalias(dev->of_node, str, len);
 }
 
-extern void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
+static inline int of_device_uevent(const struct device *dev,
+				   struct kobj_uevent_env *env)
+{
+	if (!dev || !dev->of_node)
+		return -ENODEV;
+
+	return of_uevent(dev->of_node, env);
+}
+
 extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
 
 int of_dma_configure_id(struct device *dev,
@@ -55,8 +63,11 @@ static inline int of_driver_match_device(struct device *dev,
 	return 0;
 }
 
-static inline void of_device_uevent(const struct device *dev,
-			struct kobj_uevent_env *env) { }
+static inline int of_device_uevent(const struct device *dev,
+				   struct kobj_uevent_env *env)
+{
+	return -ENODEV;
+}
 
 static inline ssize_t of_device_modalias(struct device *dev,
 					 char *str, ssize_t len)
-- 
2.34.1

