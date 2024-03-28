Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FD88FE77
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5079410FE32;
	Thu, 28 Mar 2024 11:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mFU4EWgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CDB10FE32
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:59:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B24A661717;
 Thu, 28 Mar 2024 11:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF4FC43390;
 Thu, 28 Mar 2024 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711627157;
 bh=8tDAHUDVfUVkniIhz2Tjlxyx9+yhjE02ZhpIawN3e88=;
 h=From:To:Cc:Subject:Date:From;
 b=mFU4EWgfLkursYUxABDp9NsVLp90HdFN3faN6m/bgMh+UFLqHeoWncr753xBJjsJ4
 X4d8z9pPBJng4tSxlbFZMtPQ4c+WILU9TySRjYPDSLvyu8e9bpbT4YQJedwQ3s2XEc
 PsO8smAb94iIYyflRDvCcmlo0iKyA8Vjpr3OX45g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lee@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de,
 "Ricardo B. Marliere" <ricardo@marliere.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/2] video: backlight: make backlight_class constant
Date: Thu, 28 Mar 2024 12:59:06 +0100
Message-ID: <2024032805-putdown-mushy-a0f9@gregkh>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Lines: 99
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=/aKgYyLp0Ixe4eLFmIE3xueHTfYuhhXATaHPaS0rmDA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDGms0Z17LUtTKjdU+utYFJ/gXeDZFML8gy2gcbVQF4P6f
 pacubUdsSwMgkwMsmKKLF+28RzdX3FI0cvQ9jTMHFYmkCEMXJwCMBHrRwzzvRJX//9SM8Uj8ERD
 xJWextUsf03dGBacODbL4ZtbYOoHf5cm9XNW5TftP28FAA==
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
memory, so move the backlight_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: "Ricardo B. Marliere" <ricardo@marliere.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebased on 6.9-rc1

 drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 86e1cdc8e369..d2feaebfd84a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -317,8 +317,6 @@ static ssize_t scale_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(scale);
 
-static struct class *backlight_class;
-
 #ifdef CONFIG_PM_SLEEP
 static int backlight_suspend(struct device *dev)
 {
@@ -369,6 +367,12 @@ static struct attribute *bl_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(bl_device);
 
+static const struct class backlight_class = {
+	.name = "backlight",
+	.dev_groups = bl_device_groups,
+	.pm = &backlight_class_dev_pm_ops,
+};
+
 /**
  * backlight_force_update - tell the backlight subsystem that hardware state
  *   has changed
@@ -418,7 +422,7 @@ struct backlight_device *backlight_device_register(const char *name,
 	mutex_init(&new_bd->update_lock);
 	mutex_init(&new_bd->ops_lock);
 
-	new_bd->dev.class = backlight_class;
+	new_bd->dev.class = &backlight_class;
 	new_bd->dev.parent = parent;
 	new_bd->dev.release = bl_device_release;
 	dev_set_name(&new_bd->dev, "%s", name);
@@ -510,7 +514,7 @@ struct backlight_device *backlight_device_get_by_name(const char *name)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_name(backlight_class, name);
+	dev = class_find_device_by_name(&backlight_class, name);
 
 	return dev ? to_backlight_device(dev) : NULL;
 }
@@ -678,7 +682,7 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 {
 	struct device *dev;
 
-	dev = class_find_device(backlight_class, NULL, node, of_parent_match);
+	dev = class_find_device(&backlight_class, NULL, node, of_parent_match);
 
 	return dev ? to_backlight_device(dev) : NULL;
 }
@@ -746,20 +750,19 @@ EXPORT_SYMBOL(devm_of_find_backlight);
 
 static void __exit backlight_class_exit(void)
 {
-	class_destroy(backlight_class);
+	class_unregister(&backlight_class);
 }
 
 static int __init backlight_class_init(void)
 {
-	backlight_class = class_create("backlight");
-	if (IS_ERR(backlight_class)) {
-		pr_warn("Unable to create backlight class; errno = %ld\n",
-			PTR_ERR(backlight_class));
-		return PTR_ERR(backlight_class);
+	int ret;
+
+	ret = class_register(&backlight_class);
+	if (ret) {
+		pr_warn("Unable to create backlight class; errno = %d\n", ret);
+		return ret;
 	}
 
-	backlight_class->dev_groups = bl_device_groups;
-	backlight_class->pm = &backlight_class_dev_pm_ops;
 	INIT_LIST_HEAD(&backlight_dev_list);
 	mutex_init(&backlight_dev_list_mutex);
 	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);
-- 
2.44.0

