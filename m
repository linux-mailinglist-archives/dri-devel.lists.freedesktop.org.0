Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD4AA3D5AE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F8510E8FD;
	Thu, 20 Feb 2025 10:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="BV1BLeNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id EADDA10E8FD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2RoNr
 SjHOSnrbQWPVmn0LiRyjXkWM0htcxpHKmfkuqc=; b=BV1BLeNmH6YzL7rRbUtjE
 R542RFTSXbvkLXpOaNF4F3seYCVa+3SjrpKeZiZYcKGpEPsqiLKakUrKeOmcaGAO
 ZBzNLLjCNuUN63pG/vPcXOs8ouwGE3ou2uy7VImVeNI39cwS4rCCdln6rMDEWCoK
 quh8NXRgJ73gCAZ5LATcw0=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wDn77ML_bZnugebMw--.5396S2; 
 Thu, 20 Feb 2025 17:59:40 +0800 (CST)
From: oushixiong1025@163.com
To: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 oushixiong <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev: Register sysfs groups through device_add_group
Date: Thu, 20 Feb 2025 17:59:35 +0800
Message-Id: <20250220095935.270797-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn77ML_bZnugebMw--.5396S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF43urWUKryfJF15Jw47Jwb_yoWrWw43pr
 n3JFyFgry5WF1UGFs3uwsrX39xWw4rury5Jr9xt3yxGF43GFZrW34xAFy5A3yrGr97Jr1S
 qFsrXw18JFZF9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOZ2-UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRb5D2e28fjYegAAsH
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

From: oushixiong <oushixiong@kylinos.cn>

Use device_add_group() to simplify creation.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/video/fbdev/core/fbsysfs.c | 69 +++++++++++++++++-------------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 1b3c9958ef5c..06d75c767579 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -416,55 +416,64 @@ static ssize_t show_bl_curve(struct device *device,
 /* When cmap is added back in it should be a binary attribute
  * not a text one. Consideration should also be given to converting
  * fbdev to use configfs instead of sysfs */
-static struct device_attribute device_attrs[] = {
-	__ATTR(bits_per_pixel, S_IRUGO|S_IWUSR, show_bpp, store_bpp),
-	__ATTR(blank, S_IRUGO|S_IWUSR, show_blank, store_blank),
-	__ATTR(console, S_IRUGO|S_IWUSR, show_console, store_console),
-	__ATTR(cursor, S_IRUGO|S_IWUSR, show_cursor, store_cursor),
-	__ATTR(mode, S_IRUGO|S_IWUSR, show_mode, store_mode),
-	__ATTR(modes, S_IRUGO|S_IWUSR, show_modes, store_modes),
-	__ATTR(pan, S_IRUGO|S_IWUSR, show_pan, store_pan),
-	__ATTR(virtual_size, S_IRUGO|S_IWUSR, show_virtual, store_virtual),
-	__ATTR(name, S_IRUGO, show_name, NULL),
-	__ATTR(stride, S_IRUGO, show_stride, NULL),
-	__ATTR(rotate, S_IRUGO|S_IWUSR, show_rotate, store_rotate),
-	__ATTR(state, S_IRUGO|S_IWUSR, show_fbstate, store_fbstate),
+static DEVICE_ATTR(bits_per_pixel, 0644, show_bpp, store_bpp);
+static DEVICE_ATTR(blank, 0644, show_blank, store_blank);
+static DEVICE_ATTR(console, 0644, show_console, store_console);
+static DEVICE_ATTR(cursor, 0644, show_cursor, store_cursor);
+static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
+static DEVICE_ATTR(modes, 0644, show_modes, store_modes);
+static DEVICE_ATTR(pan, 0644, show_pan, store_pan);
+static DEVICE_ATTR(virtual_size, 0644, show_virtual, store_virtual);
+static DEVICE_ATTR(name, 0444, show_name, NULL);
+static DEVICE_ATTR(stride, 0444, show_stride, NULL);
+static DEVICE_ATTR(rotate, 0644, show_rotate, store_rotate);
+static DEVICE_ATTR(state, 0644, show_fbstate, store_fbstate);
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	__ATTR(bl_curve, S_IRUGO|S_IWUSR, show_bl_curve, store_bl_curve),
+static DEVICE_ATTR(bl_curve, 0644, show_bl_curve, store_bl_curve);
 #endif
+
+static struct attribute *fb_device_attrs[] = {
+	&dev_attr_bits_per_pixel.attr,
+	&dev_attr_blank.attr,
+	&dev_attr_console.attr,
+	&dev_attr_cursor.attr,
+	&dev_attr_mode.attr,
+	&dev_attr_modes.attr,
+	&dev_attr_pan.attr,
+	&dev_attr_virtual_size.attr,
+	&dev_attr_name.attr,
+	&dev_attr_stride.attr,
+	&dev_attr_rotate.attr,
+	&dev_attr_state.attr,
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	&dev_attr_bl_curve.attr,
+#endif
+	NULL,
+};
+
+static const struct attribute_group fb_device_attr_group = {
+	.attrs          = fb_device_attrs,
 };
 
 static int fb_init_device(struct fb_info *fb_info)
 {
-	int i, error = 0;
+	int ret;
 
 	dev_set_drvdata(fb_info->dev, fb_info);
 
 	fb_info->class_flag |= FB_SYSFS_FLAG_ATTR;
 
-	for (i = 0; i < ARRAY_SIZE(device_attrs); i++) {
-		error = device_create_file(fb_info->dev, &device_attrs[i]);
-
-		if (error)
-			break;
-	}
-
-	if (error) {
-		while (--i >= 0)
-			device_remove_file(fb_info->dev, &device_attrs[i]);
+	ret = device_add_group(fb_info->dev, &fb_device_attr_group);
+	if (ret)
 		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
-	}
 
 	return 0;
 }
 
 static void fb_cleanup_device(struct fb_info *fb_info)
 {
-	unsigned int i;
-
 	if (fb_info->class_flag & FB_SYSFS_FLAG_ATTR) {
-		for (i = 0; i < ARRAY_SIZE(device_attrs); i++)
-			device_remove_file(fb_info->dev, &device_attrs[i]);
+		device_remove_group(fb_info->dev, &fb_device_attr_group);
 
 		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
 	}
-- 
2.17.1

