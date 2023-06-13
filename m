Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5C72E0DB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C328B10E38A;
	Tue, 13 Jun 2023 11:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7EB10E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 654481FD9B;
 Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAk2/6ibdZH0kfzQKlGiXlQ0sdOrgLY8cFw5r/ejdU0=;
 b=UAeqG60HF96B34Zb8zAbsUHqHdqePI2Hx+bnLL2Px0TLj8a3mnzADulBJ3wVGidBG0o4Ko
 GlRFMR0g+DavopvYU02zi+YPIXlu+Mwqsmkb89lFkWP0LZCqqiMRg6G8kWKD1l3QKjqMRm
 9Ueg7GU1QujWs6zJj1+WUvWDZd2mw1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAk2/6ibdZH0kfzQKlGiXlQ0sdOrgLY8cFw5r/ejdU0=;
 b=n/47xsMt6I3VTPwwvPdH3F4k2gEB1fB8VpAdKGbLNVTKuiWzNRDqSR0yvco+uSJm7HMV+e
 TvFvFmys1fyp9LAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 180FE13483;
 Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wPfyBI9OiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 34/38] fbdev/core: Add fb_device_{create,destroy}()
Date: Tue, 13 Jun 2023 13:07:09 +0200
Message-ID: <20230613110953.24176-35-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the logic to create and destroy fbdev devices into the new
helpers fb_device_create() and fb_device_destroy().

There was a call to fb_cleanup_device() in do_unregister_framebuffer()
that was too late. The device had already been removed at this point.
Move the call into fb_device_destroy().

Declare the helpers in the new internal header file  fb_internal.h, as
they are only used within the fbdev core module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fb_internal.h | 12 ++++++++
 drivers/video/fbdev/core/fbmem.c       | 21 +++-----------
 drivers/video/fbdev/core/fbsysfs.c     | 38 ++++++++++++++++++++++++--
 include/linux/fb.h                     |  3 --
 4 files changed, 52 insertions(+), 22 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_internal.h

diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
new file mode 100644
index 0000000000000..0b9640ae7a3d2
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _FB_INTERNAL_H
+#define _FB_INTERNAL_H
+
+struct fb_info;
+
+/* fbsysfs.c */
+int fb_device_create(struct fb_info *fb_info);
+void fb_device_destroy(struct fb_info *fb_info);
+
+#endif
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index f91ae7d4c94d6..66532774d351e 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -40,6 +40,8 @@
 #include <video/nomodeset.h>
 #include <video/vga.h>
 
+#include "fb_internal.h"
+
     /*
      *  Frame buffer device initialization and setup routines
      */
@@ -1447,14 +1449,7 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	mutex_init(&fb_info->lock);
 	mutex_init(&fb_info->mm_lock);
 
-	fb_info->dev = device_create(fb_class, fb_info->device,
-				     MKDEV(FB_MAJOR, i), NULL, "fb%d", i);
-	if (IS_ERR(fb_info->dev)) {
-		/* Not fatal */
-		printk(KERN_WARNING "Unable to create device for framebuffer %d; errno = %ld\n", i, PTR_ERR(fb_info->dev));
-		fb_info->dev = NULL;
-	} else
-		fb_init_device(fb_info);
+	fb_device_create(fb_info);
 
 	if (fb_info->pixmap.addr == NULL) {
 		fb_info->pixmap.addr = kmalloc(FBPIXMAPSIZE, GFP_KERNEL);
@@ -1515,16 +1510,9 @@ static void unlink_framebuffer(struct fb_info *fb_info)
 	if (WARN_ON(i < 0 || i >= FB_MAX || registered_fb[i] != fb_info))
 		return;
 
-	if (!fb_info->dev)
-		return;
-
-	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
-
+	fb_device_destroy(fb_info);
 	pm_vt_switch_unregister(fb_info->device);
-
 	unbind_console(fb_info);
-
-	fb_info->dev = NULL;
 }
 
 static void do_unregister_framebuffer(struct fb_info *fb_info)
@@ -1539,7 +1527,6 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	fb_destroy_modelist(&fb_info->modelist);
 	registered_fb[fb_info->node] = NULL;
 	num_registered_fb--;
-	fb_cleanup_device(fb_info);
 #ifdef CONFIG_GUMSTIX_AM200EPD
 	{
 		struct fb_event event;
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 849073f1ca067..fafe574398b01 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -8,6 +8,9 @@
 #include <linux/console.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
+#include <linux/major.h>
+
+#include "fb_internal.h"
 
 #define FB_SYSFS_FLAG_ATTR 1
 
@@ -435,7 +438,7 @@ static struct device_attribute device_attrs[] = {
 #endif
 };
 
-int fb_init_device(struct fb_info *fb_info)
+static int fb_init_device(struct fb_info *fb_info)
 {
 	int i, error = 0;
 
@@ -459,7 +462,7 @@ int fb_init_device(struct fb_info *fb_info)
 	return 0;
 }
 
-void fb_cleanup_device(struct fb_info *fb_info)
+static void fb_cleanup_device(struct fb_info *fb_info)
 {
 	unsigned int i;
 
@@ -470,3 +473,34 @@ void fb_cleanup_device(struct fb_info *fb_info)
 		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
 	}
 }
+
+int fb_device_create(struct fb_info *fb_info)
+{
+	int node = fb_info->node;
+	dev_t devt = MKDEV(FB_MAJOR, node);
+	int ret;
+
+	fb_info->dev = device_create(fb_class, fb_info->device, devt, NULL, "fb%d", node);
+	if (IS_ERR(fb_info->dev)) {
+		/* Not fatal */
+		ret = PTR_ERR(fb_info->dev);
+		pr_warn("Unable to create device for framebuffer %d; error %d\n", node, ret);
+		fb_info->dev = NULL;
+	} else {
+		fb_init_device(fb_info);
+	}
+
+	return 0;
+}
+
+void fb_device_destroy(struct fb_info *fb_info)
+{
+	dev_t devt = MKDEV(FB_MAJOR, fb_info->node);
+
+	if (!fb_info->dev)
+		return;
+
+	fb_cleanup_device(fb_info);
+	device_destroy(fb_class, devt);
+	fb_info->dev = NULL;
+}
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ce6823e157e6b..1988d11f78bcb 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -735,11 +735,8 @@ static inline bool fb_be_math(struct fb_info *info)
 #endif /* CONFIG_FB_FOREIGN_ENDIAN */
 }
 
-/* drivers/video/fbsysfs.c */
 extern struct fb_info *framebuffer_alloc(size_t size, struct device *dev);
 extern void framebuffer_release(struct fb_info *info);
-extern int fb_init_device(struct fb_info *fb_info);
-extern void fb_cleanup_device(struct fb_info *head);
 extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max);
 
 /* drivers/video/fbmon.c */
-- 
2.41.0

