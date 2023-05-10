Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC46FE1FE
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35C10E4D8;
	Wed, 10 May 2023 15:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D04110E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:58:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E24D3D2EB4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:48:10 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A716FC0004;
 Wed, 10 May 2023 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1683733687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTzUAUn2/6zCa90roD3BEhvCRbYoR3aMy4PUneIBrPM=;
 b=UkiDwJ6PmmRH+dllni1nZppCO1kMi1iL8f0YSzz6HMHb6cDJPNmwTh8WsvIlDrbl1Ewpml
 JhgPduur1oojt7UZEDpsmRFpFSpSvpaIWASDDMJ5Ve+FT7l/C3A+se09IfN+emu6+OUdLi
 mZyQQ9NdIIYgn+zM3RQqh2WdLt9pnConqmEEEgHJKM1WxXbbl02tV2LlWxw+lWD8ETYa4Y
 rJjaHH7kho1KvYF9c9N1qMAtbWb7RP4uHWKLD8DsyfQuKYcJIJms84KTwMLlvgIHAdKeMM
 KDYkX8tZWSOsfDnSEnL3JVMw6pwKGJelLceNIYpxYqFT9kMWwX3JbWfPl9m3aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/5] of: module: Mutate of_device_uevent_modalias() into two
 helpers
Date: Wed, 10 May 2023 17:48:01 +0200
Message-Id: <20230510154803.189096-4-miquel.raynal@bootlin.com>
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

Let's move the logic of the former helper into module.c and use it from
an inline helper located under of_device.c. This way there is no change
for users while the logic gets moved to an OF-only file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/device.c       | 23 -----------------------
 drivers/of/module.c       | 21 +++++++++++++++++++++
 include/linux/of.h        |  7 +++++++
 include/linux/of_device.h |  9 ++++++++-
 4 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 5e538e1ed623..7909eefc650e 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -245,26 +245,3 @@ const void *of_device_get_match_data(const struct device *dev)
 	return match->data;
 }
 EXPORT_SYMBOL(of_device_get_match_data);
-
-int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
-{
-	int sl;
-
-	if ((!dev) || (!dev->of_node) || dev->of_node_reused)
-		return -ENODEV;
-
-	/* Devicetree modalias is tricky, we add it in 2 steps */
-	if (add_uevent_var(env, "MODALIAS="))
-		return -ENOMEM;
-
-	sl = of_modalias(dev->of_node, &env->buf[env->buflen-1],
-			 sizeof(env->buf) - env->buflen);
-	if (sl < 0)
-		return sl;
-	if (sl >= (sizeof(env->buf) - env->buflen))
-		return -ENOMEM;
-	env->buflen += sl;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
diff --git a/drivers/of/module.c b/drivers/of/module.c
index c729675fdd04..874f3fb8220f 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -132,3 +132,24 @@ int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
 
 	return 0;
 }
+
+int of_uevent_modalias(const struct device_node *np, struct kobj_uevent_env *env)
+{
+	int sl;
+
+	if (!np)
+		return -ENODEV;
+
+	/* Devicetree modalias is tricky, we add it in 2 steps */
+	if (add_uevent_var(env, "MODALIAS="))
+		return -ENOMEM;
+
+	sl = of_modalias(np, &env->buf[env->buflen-1],
+			 sizeof(env->buf) - env->buflen);
+	if (sl >= (sizeof(env->buf) - env->buflen))
+		return -ENOMEM;
+	env->buflen += sl;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_uevent_modalias);
diff --git a/include/linux/of.h b/include/linux/of.h
index d99f33fc25d3..203bd2895d94 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -389,6 +389,7 @@ extern ssize_t of_printable_modalias(const struct device_node *np, char *str,
 				     ssize_t len);
 extern int of_request_module(const struct device_node *np);
 extern int of_uevent(struct device_node *np, struct kobj_uevent_env *env);
+extern int of_uevent_modalias(const struct device_node *np, struct kobj_uevent_env *env);
 
 /* phandle iterator functions */
 extern int of_phandle_iterator_init(struct of_phandle_iterator *it,
@@ -777,6 +778,12 @@ static inline int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
 	return -ENODEV;
 }
 
+static inline int of_uevent_modalias(const struct device_node *np,
+				     struct kobj_uevent_env *env)
+{
+	return -ENODEV;
+}
+
 static inline int of_phandle_iterator_init(struct of_phandle_iterator *it,
 					   const struct device_node *np,
 					   const char *list_name,
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index af5ee78e0c05..5e428bcf3d63 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -44,7 +44,14 @@ static inline int of_device_uevent(const struct device *dev,
 	return of_uevent(dev->of_node, env);
 }
 
-extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
+static inline int of_device_uevent_modalias(const struct device *dev,
+					    struct kobj_uevent_env *env)
+{
+	if (!dev || !dev->of_node || dev->of_node_reused)
+		return -ENODEV;
+
+	return of_uevent_modalias(dev->of_node, env);
+}
 
 int of_dma_configure_id(struct device *dev,
 		     struct device_node *np,
-- 
2.34.1

