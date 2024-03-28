Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A764088FE75
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B9910E615;
	Thu, 28 Mar 2024 11:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U4+g4GQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2510E615
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CD1461476;
 Thu, 28 Mar 2024 11:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7ECC433F1;
 Thu, 28 Mar 2024 11:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711627154;
 bh=9nsT8fHj6sfhBsSfZYt5q8FpfT54bgl+bVhOjsgfDiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U4+g4GQdOI6JToTQkRHWdWTqomcGll7yLt+UMv38d5WYMs7CYWMlXSGWwWS+GXRWn
 E8rNGB2bF5M6qZeTCO962l/Gu8iv/sp0pxla4/rG5uA/oNrmQo8f6d+8PldC6mVSke
 goJdaRrlpo305xugrT+1jCSmim3dZtZivhEyBEX0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lee@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de,
 "Ricardo B. Marliere" <ricardo@marliere.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/2] video: backlight: lcd: make lcd_class constant
Date: Thu, 28 Mar 2024 12:59:07 +0100
Message-ID: <2024032809-enchanted-conducive-3677@gregkh>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <2024032805-putdown-mushy-a0f9@gregkh>
References: <2024032805-putdown-mushy-a0f9@gregkh>
MIME-Version: 1.0
Lines: 79
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=yCsQQAr22nUmFXlA9JkgS4sO+euLEjucK5Uqyl8x3Co=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDGms0b2bl367zNNasmV5Vp74ykaFDXN3nwrnmXJCq/RL3
 iH/kNo1HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARiwaGeer+U79vdj98eRl7
 jsrWsiL3d57bFzIsWOcevdJ+kufkX1N47hx/1/LLXfduHQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ricardo B. Marliere" <ricardo@marliere.net>

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the lcd_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: "Ricardo B. Marliere" <ricardo@marliere.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebased on 6.9-rc1

 drivers/video/backlight/lcd.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 77c5cb2a44e2..ba4771cbd781 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -159,8 +159,6 @@ static ssize_t max_contrast_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_contrast);
 
-static struct class *lcd_class;
-
 static void lcd_device_release(struct device *dev)
 {
 	struct lcd_device *ld = to_lcd_device(dev);
@@ -175,6 +173,11 @@ static struct attribute *lcd_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(lcd_device);
 
+static const struct class lcd_class = {
+	.name = "lcd",
+	.dev_groups = lcd_device_groups,
+};
+
 /**
  * lcd_device_register - register a new object of lcd_device class.
  * @name: the name of the new object(must be the same as the name of the
@@ -202,7 +205,7 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 	mutex_init(&new_ld->ops_lock);
 	mutex_init(&new_ld->update_lock);
 
-	new_ld->dev.class = lcd_class;
+	new_ld->dev.class = &lcd_class;
 	new_ld->dev.parent = parent;
 	new_ld->dev.release = lcd_device_release;
 	dev_set_name(&new_ld->dev, "%s", name);
@@ -318,19 +321,19 @@ EXPORT_SYMBOL(devm_lcd_device_unregister);
 
 static void __exit lcd_class_exit(void)
 {
-	class_destroy(lcd_class);
+	class_unregister(&lcd_class);
 }
 
 static int __init lcd_class_init(void)
 {
-	lcd_class = class_create("lcd");
-	if (IS_ERR(lcd_class)) {
-		pr_warn("Unable to create backlight class; errno = %ld\n",
-			PTR_ERR(lcd_class));
-		return PTR_ERR(lcd_class);
+	int ret;
+
+	ret = class_register(&lcd_class);
+	if (ret) {
+		pr_warn("Unable to create backlight class; errno = %d\n", ret);
+		return ret;
 	}
 
-	lcd_class->dev_groups = lcd_device_groups;
 	return 0;
 }
 
-- 
2.44.0

