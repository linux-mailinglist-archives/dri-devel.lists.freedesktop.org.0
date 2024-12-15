Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B29F2479
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 15:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D7C10E002;
	Sun, 15 Dec 2024 14:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="FzB742mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F2010E27A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1734274520;
 bh=3xEK3Ew0UcjU13RC8Ahx24g141JMcVwvDiJkVvI7dDs=;
 h=From:Date:Subject:To:Cc:From;
 b=FzB742mum+23K1hGje4QQ3N9tWEwlX6ynw+WpT3U3zPNNe73XNqgY5c20FDZuv4bf
 dbSLz+hRT4QsEaASSKGa+YedyP9shnB7oKjtx4PN4QUJm69HQ2UmTLxT3kVJJwqcXi
 ilB0WJ4cnQWimS+MhGx+O7yJLj6nokzPZd6R2BS0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 15:55:17 +0100
Subject: [PATCH] fbdev/udlfb: Use const 'struct bin_attribute' callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-udlfb-v1-1-40e87ed71d1f@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANTtXmcC/x3MQQqDMBAAwK/Inl0wsRrsV0QkJhu7UGLJRmkR/
 97gcS5zglBiEnhWJyQ6WHiLBaquwL1sXAnZF4Nu9ENp1aH8JAi6LUrGheNsc064+3dY0Axm8CY
 0vnU9lOCTKPD3zsfpuv75GvhEbAAAAA==
X-Change-ID: 20241215-sysfs-const-bin_attr-udlfb-7979d7f0d3c6
To: Bernie Thompson <bernie@plugable.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734274518; l=1791;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3xEK3Ew0UcjU13RC8Ahx24g141JMcVwvDiJkVvI7dDs=;
 b=OFEzKBtvvZVB9v7+uzooOqyzatRSEGsUvJckrfTOe6OjpYLkZ9OxURvAH6NDn39sP7Vgta1xk
 Gl6VtB9HKewBDEPVuGtPg9kcUt6+PLVXb2mwWfqUbIhBbWSjhZxyQds
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The sysfs core now provides callback variants that explicitly take a
const pointer. Make use of it to match the attribute definition.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/video/fbdev/udlfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 71ac9e36f67c68aa7a54dce32323047a2a9a48bf..acadf0eb450c3d76c05fcb9cc7e7c3f6dd8f31ef 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1416,7 +1416,7 @@ static ssize_t metrics_cpu_kcycles_used_show(struct device *fbdev,
 
 static ssize_t edid_show(
 			struct file *filp,
-			struct kobject *kobj, struct bin_attribute *a,
+			struct kobject *kobj, const struct bin_attribute *a,
 			 char *buf, loff_t off, size_t count) {
 	struct device *fbdev = kobj_to_dev(kobj);
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
@@ -1438,7 +1438,7 @@ static ssize_t edid_show(
 
 static ssize_t edid_store(
 			struct file *filp,
-			struct kobject *kobj, struct bin_attribute *a,
+			struct kobject *kobj, const struct bin_attribute *a,
 			char *src, loff_t src_off, size_t src_size) {
 	struct device *fbdev = kobj_to_dev(kobj);
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
@@ -1482,8 +1482,8 @@ static const struct bin_attribute edid_attr = {
 	.attr.name = "edid",
 	.attr.mode = 0666,
 	.size = EDID_LENGTH,
-	.read = edid_show,
-	.write = edid_store
+	.read_new = edid_show,
+	.write_new = edid_store
 };
 
 static const struct device_attribute fb_device_attrs[] = {

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-udlfb-7979d7f0d3c6

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

