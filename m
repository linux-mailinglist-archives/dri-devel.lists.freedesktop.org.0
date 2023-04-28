Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FF6F17DD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932E910ED2B;
	Fri, 28 Apr 2023 12:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F810ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE02C20091;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blNMHwekCV0ppyAu5mIPQhdHG5yl1zziP5LX8OKPf4g=;
 b=IuBXKGo6COpyxP2Ug8JNYjK8G3huqO1i11hQjvKI2z2nXGPRhYxkqJtiFY4+CHH/VYCxWO
 QCpmEuH5GQY6q8t+abYGrxdqiEGB+IInWnwwGDFFMjseqbwIBqnUf/c73UaJliqXQyNi+5
 MFfmg6azm/fMaWnK6u/YcF6lSqN79v4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blNMHwekCV0ppyAu5mIPQhdHG5yl1zziP5LX8OKPf4g=;
 b=LMJVoV7r3WPUpEmYLlUZmPvBthMl7rbk4aUAokvqcFhbmXSumNeCtXU/60SUWXaLTcaf6e
 s7BABJCkW00X/SBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F180139C3;
 Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yIxPGhy7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:25:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 18/19] fbdev: Move I/O read and write code into helper
 functions
Date: Fri, 28 Apr 2023 14:24:51 +0200
Message-Id: <20230428122452.4856-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the existing I/O read and write code for I/O memory into
the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
default fp_ops. No functional changes.

In the near term, the new functions will be useful to the DRM
subsystem, which currently provides it's own implementation. It
can then use the shared code. In the longer term, it might make
sense to revise the I/O helper's default status and make them
opt-in by the driver. Systems that don't use them would not
contain the code any longer.

v2:
	* add detailed commit message (Javier)
	* rename fb_cfb_() to fb_io_() (Geert)
	* add fixes that got lost while moving the code (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/core/Makefile     |   2 +-
 drivers/video/fbdev/core/fb_io_fops.c | 133 ++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c      | 118 +----------------------
 include/linux/fb.h                    |  10 ++
 4 files changed, 146 insertions(+), 117 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_io_fops.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 08fabce76b74..8f0060160ffb 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
-                                     modedb.o fbcvt.o fb_cmdline.o
+                                     modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
new file mode 100644
index 000000000000..f5299d50f33b
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/fb.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+ssize_t fb_io_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *dst;
+	u8 __iomem *src;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size, trailing;
+
+	if (!info->screen_base)
+		return -ENODEV;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p >= total_size)
+		return 0;
+
+	if (count >= total_size)
+		count = total_size;
+
+	if (count + p > total_size)
+		count = total_size - p;
+
+	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
+			 GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	src = (u8 __iomem *) (info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	while (count) {
+		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+		dst = buffer;
+		fb_memcpy_fromfb(dst, src, c);
+		dst += c;
+		src += c;
+
+		trailing = copy_to_user(buf, buffer, c);
+		if (trailing == c) {
+			err = -EFAULT;
+			break;
+		}
+		c -= trailing;
+
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(buffer);
+
+	return cnt ? cnt : err;
+}
+EXPORT_SYMBOL(fb_io_read);
+
+ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	u8 *buffer, *src;
+	u8 __iomem *dst;
+	int c, cnt = 0, err = 0;
+	unsigned long total_size, trailing;
+
+	if (!info->screen_base)
+		return -ENODEV;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p > total_size)
+		return -EFBIG;
+
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+
+	if (count + p > total_size) {
+		if (!err)
+			err = -ENOSPC;
+
+		count = total_size - p;
+	}
+
+	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
+			 GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	dst = (u8 __iomem *) (info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	while (count) {
+		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+		src = buffer;
+
+		trailing = copy_from_user(src, buf, c);
+		if (trailing == c) {
+			err = -EFAULT;
+			break;
+		}
+		c -= trailing;
+
+		fb_memcpy_tofb(dst, src, c);
+		dst += c;
+		src += c;
+		*ppos += c;
+		buf += c;
+		cnt += c;
+		count -= c;
+	}
+
+	kfree(buffer);
+
+	return (cnt) ? cnt : err;
+}
+EXPORT_SYMBOL(fb_io_write);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3a80d13afd26..4035a57df116 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -761,12 +761,7 @@ static struct fb_info *file_fb_info(struct file *file)
 static ssize_t
 fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *dst;
-	u8 __iomem *src;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size, trailing;
 
 	if (!info)
 		return -ENODEV;
@@ -777,67 +772,13 @@ fb_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_read)
 		return info->fbops->fb_read(info, buf, count, ppos);
 
-	if (!info->screen_base)
-		return -ENODEV;
-
-	total_size = info->screen_size;
-
-	if (total_size == 0)
-		total_size = info->fix.smem_len;
-
-	if (p >= total_size)
-		return 0;
-
-	if (count >= total_size)
-		count = total_size;
-
-	if (count + p > total_size)
-		count = total_size - p;
-
-	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
-			 GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	src = (u8 __iomem *) (info->screen_base + p);
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	while (count) {
-		c  = (count > PAGE_SIZE) ? PAGE_SIZE : count;
-		dst = buffer;
-		fb_memcpy_fromfb(dst, src, c);
-		dst += c;
-		src += c;
-
-		trailing = copy_to_user(buf, buffer, c);
-		if (trailing == c) {
-			err = -EFAULT;
-			break;
-		}
-		c -= trailing;
-
-		*ppos += c;
-		buf += c;
-		cnt += c;
-		count -= c;
-	}
-
-	kfree(buffer);
-
-	return cnt ? cnt : err;
+	return fb_io_read(info, buf, count, ppos);
 }
 
 static ssize_t
 fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
 	struct fb_info *info = file_fb_info(file);
-	u8 *buffer, *src;
-	u8 __iomem *dst;
-	int c, cnt = 0, err = 0;
-	unsigned long total_size, trailing;
 
 	if (!info)
 		return -ENODEV;
@@ -848,62 +789,7 @@ fb_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 	if (info->fbops->fb_write)
 		return info->fbops->fb_write(info, buf, count, ppos);
 
-	if (!info->screen_base)
-		return -ENODEV;
-
-	total_size = info->screen_size;
-
-	if (total_size == 0)
-		total_size = info->fix.smem_len;
-
-	if (p > total_size)
-		return -EFBIG;
-
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-
-	if (count + p > total_size) {
-		if (!err)
-			err = -ENOSPC;
-
-		count = total_size - p;
-	}
-
-	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count,
-			 GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	dst = (u8 __iomem *) (info->screen_base + p);
-
-	if (info->fbops->fb_sync)
-		info->fbops->fb_sync(info);
-
-	while (count) {
-		c = (count > PAGE_SIZE) ? PAGE_SIZE : count;
-		src = buffer;
-
-		trailing = copy_from_user(src, buf, c);
-		if (trailing == c) {
-			err = -EFAULT;
-			break;
-		}
-		c -= trailing;
-
-		fb_memcpy_tofb(dst, src, c);
-		dst += c;
-		src += c;
-		*ppos += c;
-		buf += c;
-		cnt += c;
-		count -= c;
-	}
-
-	kfree(buffer);
-
-	return (cnt) ? cnt : err;
+	return fb_io_write(info, buf, count, ppos);
 }
 
 int
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 08cb47da71f8..ec978a4969a9 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -576,9 +576,19 @@ struct fb_info {
 extern int fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var);
 extern int fb_blank(struct fb_info *info, int blank);
+
+/*
+ * Drawing operations where framebuffer is in I/O memory
+ */
+
 extern void cfb_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 extern void cfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 extern void cfb_imageblit(struct fb_info *info, const struct fb_image *image);
+extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
+			  size_t count, loff_t *ppos);
+extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
+			   size_t count, loff_t *ppos);
+
 /*
  * Drawing operations where framebuffer is in system RAM
  */
-- 
2.40.0

