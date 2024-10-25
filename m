Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B893A9AFE20
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385BC10EA44;
	Fri, 25 Oct 2024 09:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNlGQ73Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3A710EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:25:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso18801255e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729848345; x=1730453145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eydj5w0v0oz6L0j3WA0pwPpofo3U+INxxUSu9UDo48M=;
 b=KNlGQ73Q6aD5RoWwhLQXvAb+1eEYuYmKIYg5nci9ePofsfuPJBkZF4tRZtYoiA1e/0
 fosYGf2HgHI++l9m7JjJHGMzvoiLSKrnVAwF7pFxCvn8fU/XuZHnKdzP+onZWFUC8PNy
 +n7FyOcg7E8khaCSzcdDK9fM0ZSMFo58m4dvsVlVe98C0assNeepzsi5Xc1MEBxHSxaM
 PxDx/NmeO9omFgBIjcs+cK4BxMiV3HHgy5ZwBwaAOk4vcuZ7FAdp6U0IjQymGnef7Njg
 NRObz66ls2aN/q/fAVQsFmJs6+JeX7Z7Nabx/7gUK3KF4uLDvezW13uNASC+1UymZr5/
 vXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729848345; x=1730453145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eydj5w0v0oz6L0j3WA0pwPpofo3U+INxxUSu9UDo48M=;
 b=RNAc4/YYwCwQMMIRimTJ10m6dnV4Sa9Rnn3JzXNm+BqvkNY9P9lF2/uOxH7Igy6JRK
 Bz2MiFGN9/jTdHow947R8K+FZ7GLxswARLLAwm5q2ZtFY4zcaryE2CE4tyT/TwWzMK49
 ocrH5xRzywkPfcTReMJhdRmC4RFFdiMxHL6YxC+x2F1hmZNiIuqkN2a8oYXIsTV1j0Qm
 4Kbbx3o+QyWeFYZcNMIRR2Ok9ka74g4CDLaWe/dDhCuHqf4AvcjfG0Pp8ThInC3PRgcb
 uvqKpF2ywPgOI5EK72uNR5f5detLpx1jFqYFUzjzUiMjtSPZHp/7tPsBQeCME7EC6uXy
 RQ+w==
X-Gm-Message-State: AOJu0Ywg9gamwJ0XXl4zozdgZdIefejxo3DwyvyDNBJQgg5QoadudJuB
 IDxYtC66Qj2HW67jTRG1U1wbKGG2UsvSSXYeFMRZ8u2lz5U6jFnL
X-Google-Smtp-Source: AGHT+IHPZDbhm7xG1S8CG8Z9F8arXS9pTprIhLS887UnFxrR/4XEgJQ6SARsW1ttQYnFfDLZ1aBizg==
X-Received: by 2002:a05:600c:1e22:b0:430:5846:7582 with SMTP id
 5b1f17b1804b1-431841ee1b9mr76346145e9.7.1729848345071; 
 Fri, 25 Oct 2024 02:25:45 -0700 (PDT)
Received: from localhost.localdomain ([83.165.96.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360833asm12242175e9.39.2024.10.25.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:25:43 -0700 (PDT)
From: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, thomas.zimmermann@suse.de,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
Subject: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
Date: Fri, 25 Oct 2024 11:25:38 +0200
Message-Id: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sysfs
entries and access framebuffer device information. This patch wraps the
relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the driver to
be built and used even if CONFIG_FB_DEVICE is not selected.

The sysfs setting only controls access to certain framebuffer attributes
and is not required for the basic display functionality to work correctly.
(For information on DisplayLink devices and their Linux support, see:
https://wiki.archlinux.org/title/DisplayLink).

Tested by building with and without CONFIG_FB_DEVICE, both of which
compiled and ran without issues.

Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
---
 drivers/video/fbdev/Kconfig |  1 -
 drivers/video/fbdev/udlfb.c | 41 ++++++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ea36c6956bf3..9bf6cf74b9cb 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1588,7 +1588,6 @@ config FB_SMSCUFX
 config FB_UDL
 	tristate "Displaylink USB Framebuffer support"
 	depends on FB && USB
-	depends on FB_DEVICE
 	select FB_MODE_HELPERS
 	select FB_SYSMEM_HELPERS_DEFERRED
 	help
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 71ac9e36f67c..de4800f09dc7 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -341,10 +341,10 @@ static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	pos = (unsigned long)info->fix.smem_start + offset;
-
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
 		pos, size);
-
+#endif
 	while (size > 0) {
 		page = vmalloc_to_pfn((void *)pos);
 		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
@@ -929,10 +929,10 @@ static int dlfb_ops_open(struct fb_info *info, int user)
 		info->fbdefio = fbdefio;
 		fb_deferred_io_init(info);
 	}
-
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev, "open, user=%d fb_info=%p count=%d\n",
 		user, info, dlfb->fb_count);
-
+#endif
 	return 0;
 }
 
@@ -982,9 +982,9 @@ static int dlfb_ops_release(struct fb_info *info, int user)
 		kfree(info->fbdefio);
 		info->fbdefio = NULL;
 	}
-
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev, "release, user=%d count=%d\n", user, dlfb->fb_count);
-
+#endif
 	return 0;
 }
 
@@ -1095,10 +1095,10 @@ static int dlfb_ops_blank(int blank_mode, struct fb_info *info)
 	struct dlfb_data *dlfb = info->par;
 	char *bufptr;
 	struct urb *urb;
-
+#ifdef CONFIG_FB_DEVICE
 	dev_dbg(info->dev, "blank, mode %d --> %d\n",
 		dlfb->blank_mode, blank_mode);
-
+#endif
 	if ((dlfb->blank_mode == FB_BLANK_POWERDOWN) &&
 	    (blank_mode != FB_BLANK_POWERDOWN)) {
 
@@ -1190,7 +1190,9 @@ static int dlfb_realloc_framebuffer(struct dlfb_data *dlfb, struct fb_info *info
 		 */
 		new_fb = vmalloc(new_len);
 		if (!new_fb) {
+#ifdef CONFIG_FB_DEVICE
 			dev_err(info->dev, "Virtual framebuffer alloc failed\n");
+#endif
 			return -ENOMEM;
 		}
 		memset(new_fb, 0xff, new_len);
@@ -1213,9 +1215,11 @@ static int dlfb_realloc_framebuffer(struct dlfb_data *dlfb, struct fb_info *info
 		 */
 		if (shadow)
 			new_back = vzalloc(new_len);
+#ifdef CONFIG_FB_DEVICE
 		if (!new_back)
 			dev_info(info->dev,
 				 "No shadow/backing buffer allocated\n");
+#endif
 		else {
 			dlfb_deferred_vfree(dlfb, dlfb->backing_buffer);
 			dlfb->backing_buffer = new_back;
@@ -1247,14 +1251,14 @@ static int dlfb_setup_modes(struct dlfb_data *dlfb,
 	struct device *dev = info->device;
 	struct fb_videomode *mode;
 	const struct fb_videomode *default_vmode = NULL;
-
+#ifdef CONFIG_FB_DEVICE
 	if (info->dev) {
 		/* only use mutex if info has been registered */
 		mutex_lock(&info->lock);
 		/* parent device is used otherwise */
 		dev = info->dev;
 	}
-
+#endif
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid) {
 		result = -ENOMEM;
@@ -1375,10 +1379,10 @@ static int dlfb_setup_modes(struct dlfb_data *dlfb,
 error:
 	if (edid && (dlfb->edid != edid))
 		kfree(edid);
-
+#ifdef CONFIG_FB_DEVICE
 	if (info->dev)
 		mutex_unlock(&info->lock);
-
+#endif
 	return result;
 }
 
@@ -1597,8 +1601,10 @@ static int dlfb_parse_vendor_descriptor(struct dlfb_data *dlfb,
 static int dlfb_usb_probe(struct usb_interface *intf,
 			  const struct usb_device_id *id)
 {
+#ifdef CONFIG_FB_DEVICE
 	int i;
 	const struct device_attribute *attr;
+#endif
 	struct dlfb_data *dlfb;
 	struct fb_info *info;
 	int retval;
@@ -1701,7 +1707,7 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 			retval);
 		goto error;
 	}
-
+#ifdef CONFIG_FB_DEVICE
 	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
 		attr = &fb_device_attrs[i];
 		retval = device_create_file(info->dev, attr);
@@ -1710,17 +1716,16 @@ static int dlfb_usb_probe(struct usb_interface *intf,
 				 "failed to create '%s' attribute: %d\n",
 				 attr->attr.name, retval);
 	}
-
 	retval = device_create_bin_file(info->dev, &edid_attr);
 	if (retval)
 		dev_warn(info->device, "failed to create '%s' attribute: %d\n",
 			 edid_attr.attr.name, retval);
-
 	dev_info(info->device,
 		 "%s is DisplayLink USB device (%dx%d, %dK framebuffer memory)\n",
 		 dev_name(info->dev), info->var.xres, info->var.yres,
 		 ((dlfb->backing_buffer) ?
 		 info->fix.smem_len * 2 : info->fix.smem_len) >> 10);
+#endif
 	return 0;
 
 error:
@@ -1737,8 +1742,9 @@ static void dlfb_usb_disconnect(struct usb_interface *intf)
 {
 	struct dlfb_data *dlfb;
 	struct fb_info *info;
+#ifdef CONFIG_FB_DEVICE
 	int i;
-
+#endif
 	dlfb = usb_get_intfdata(intf);
 	info = dlfb->info;
 
@@ -1754,10 +1760,11 @@ static void dlfb_usb_disconnect(struct usb_interface *intf)
 	dlfb_free_urb_list(dlfb);
 
 	/* remove udlfb's sysfs interfaces */
+#ifdef CONFIG_FB_DEVICE
 	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
 		device_remove_file(info->dev, &fb_device_attrs[i]);
 	device_remove_bin_file(info->dev, &edid_attr);
-
+#endif
 	unregister_framebuffer(info);
 }
 
-- 
2.39.5

