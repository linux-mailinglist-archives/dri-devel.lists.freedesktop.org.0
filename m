Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C76FE200
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 17:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5395B10E4DA;
	Wed, 10 May 2023 15:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBF110E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:58:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C3AF4D2AB5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 15:48:09 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95F6AC000C;
 Wed, 10 May 2023 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1683733685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYd4H+SE761zyTPoCHwwfUTe0y6OdgwEBPBK9090C4k=;
 b=IQoZhvrgB3cVqfOcAidaOCXCDeka1k9jJNjEQCom89NHXBuF+Rd/VZQZm0xj1Lrnm+40OE
 yTnjpZ0ASEqix34tB5MCwIPGVPcluPhv33R1VUlHanMqfYx7ZZ54ok9Ay0tMHwhc5W4UTo
 mtCwLMx8QmydsfOf8fct3GR20/Y5y7E8Kw3VfjDG7oaEo66EQgJlU59n0ZWvmpMIqvTRXY
 KDjACF3kEmG21kGVtCoYBKBeLv0OlVKTst0l90iKdXXRLE079dHee+AVqQImXxMPitDZE+
 3rAq+3cRIWclHdDEhOxh5Ob/xkf2nAJFDgcrAvzZF2ZXsoIuxcrf3/h+35P0/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/5] of: module: Mutate of_device_modalias() into two helpers
Date: Wed, 10 May 2023 17:47:59 +0200
Message-Id: <20230510154803.189096-2-miquel.raynal@bootlin.com>
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

Move the content of the helper providing printable modaliases in
module.c. Call this new function from an of_device.c inline helper.

There is no functional changes. However, as a side effect, we fix the
return value of the inline helper (in the !CONFIG_OF case) which should
be a ssize_t instead of int.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/device.c       | 25 -------------------------
 drivers/of/module.c       | 19 +++++++++++++++++++
 include/linux/of.h        |  8 ++++++++
 include/linux/of_device.h | 13 ++++++++++---
 4 files changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 0f00f1b80708..45ce83a8945f 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -246,31 +246,6 @@ const void *of_device_get_match_data(const struct device *dev)
 }
 EXPORT_SYMBOL(of_device_get_match_data);
 
-/**
- * of_device_modalias - Fill buffer with newline terminated modalias string
- * @dev:	Calling device
- * @str:	Modalias string
- * @len:	Size of @str
- */
-ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len)
-{
-	ssize_t sl;
-
-	if (!dev || !dev->of_node || dev->of_node_reused)
-		return -ENODEV;
-
-	sl = of_modalias(dev->of_node, str, len - 2);
-	if (sl < 0)
-		return sl;
-	if (sl > len - 2)
-		return -ENOMEM;
-
-	str[sl++] = '\n';
-	str[sl] = 0;
-	return sl;
-}
-EXPORT_SYMBOL_GPL(of_device_modalias);
-
 /**
  * of_device_uevent - Display OF related uevent information
  * @dev:	Device to display the uevent information for
diff --git a/drivers/of/module.c b/drivers/of/module.c
index 0e8aa974f0f2..c05fb8ca575c 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -44,6 +44,25 @@ ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
 	return tsize;
 }
 
+ssize_t of_printable_modalias(const struct device_node *np, char *str, ssize_t len)
+{
+	ssize_t sl;
+
+	if (!np)
+		return -ENODEV;
+
+	sl = of_modalias(np, str, len - 2);
+	if (sl < 0)
+		return sl;
+	if (sl > len - 2)
+		return -ENOMEM;
+
+	str[sl++] = '\n';
+	str[sl] = 0;
+	return sl;
+}
+EXPORT_SYMBOL_GPL(of_printable_modalias);
+
 int of_request_module(const struct device_node *np)
 {
 	char *str;
diff --git a/include/linux/of.h b/include/linux/of.h
index 6ecde0515677..dcdd9396ac37 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -385,6 +385,8 @@ extern int of_count_phandle_with_args(const struct device_node *np,
 
 /* module functions */
 extern ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len);
+extern ssize_t of_printable_modalias(const struct device_node *np, char *str,
+				     ssize_t len);
 extern int of_request_module(const struct device_node *np);
 
 /* phandle iterator functions */
@@ -758,6 +760,12 @@ static inline ssize_t of_modalias(const struct device_node *np, char *str,
 	return -ENODEV;
 }
 
+static inline ssize_t of_printable_modalias(const struct device_node *np,
+					    char *str, ssize_t len)
+{
+	return -ENODEV;
+}
+
 static inline int of_request_module(const struct device_node *np)
 {
 	return -ENODEV;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 2c7a3d4bc775..bca66f59814a 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -26,7 +26,14 @@ static inline int of_driver_match_device(struct device *dev,
 	return of_match_device(drv->of_match_table, dev) != NULL;
 }
 
-extern ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len);
+static inline ssize_t of_device_modalias(struct device *dev, char *str,
+					 ssize_t len)
+{
+	if (!dev || !dev->of_node || dev->of_node_reused)
+		return -ENODEV;
+
+	return of_printable_modalias(dev->of_node, str, len);
+}
 
 extern void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env);
@@ -51,8 +58,8 @@ static inline int of_driver_match_device(struct device *dev,
 static inline void of_device_uevent(const struct device *dev,
 			struct kobj_uevent_env *env) { }
 
-static inline int of_device_modalias(struct device *dev,
-				     char *str, ssize_t len)
+static inline ssize_t of_device_modalias(struct device *dev,
+					 char *str, ssize_t len)
 {
 	return -ENODEV;
 }
-- 
2.34.1

