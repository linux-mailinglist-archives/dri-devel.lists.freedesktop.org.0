Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82072C7A5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3FE10E283;
	Mon, 12 Jun 2023 14:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6667B10E254
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:14:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 158B320489;
 Mon, 12 Jun 2023 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686579248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHsYY4KkqinsC3hNy7+x1+/KpZqx4RkXsKhX6dnk4eY=;
 b=jR2/iHB4qwTW8cw5T8RndhShQGjz/kBlNm/Q3WAMwhn+QzfU9v5sdaHBSQrxdx1EzxnOCV
 +NBnyuOd14uMP3DedOqR4hSFmwib3XhLgDgsUmQGtTpcpGqKJRMgAkzwQzR3F3DK7tibl9
 2IuVxjG5vxgMlQGmm3UC8Kg/FWyhcQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686579248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHsYY4KkqinsC3hNy7+x1+/KpZqx4RkXsKhX6dnk4eY=;
 b=+vSEPE0vbjFbT+XQo1OHy/tbA8UN0KCOIbn/7aQErCckAUhWzsaIMk1l6EkKG36SGGfoHQ
 IzsfneIjYSC1/mCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B887413A67;
 Mon, 12 Jun 2023 14:14:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOQRLC8oh2RwGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:14:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v2 37/38] fbdev/core: Rework fb init code
Date: Mon, 12 Jun 2023 16:08:15 +0200
Message-ID: <20230612141352.29939-38-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
References: <20230612141352.29939-1-tzimmermann@suse.de>
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

Init the class "graphics" before the rest of fbdev. Later steps, such
as the sysfs code, depend on the class. Also arrange the module's exit
code in reverse order.

Unexport the global variable fb_class, which is only shared internally
within the fbdev core module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fb_internal.h |  1 +
 drivers/video/fbdev/core/fbcon.c       |  1 +
 drivers/video/fbdev/core/fbmem.c       | 52 ++++++++++----------------
 include/linux/fb.h                     |  1 -
 4 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index abe06c9da36e3..0b43c0cd50968 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -11,6 +11,7 @@ int fb_register_chrdev(void);
 void fb_unregister_chrdev(void);
 
 /* fbmem.c */
+extern struct class *fb_class;
 extern struct mutex registration_lock;
 extern struct fb_info *registered_fb[FB_MAX];
 extern int num_registered_fb;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c6c9d040bdec7..8e76bc246b387 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -78,6 +78,7 @@
 #include <asm/irq.h>
 
 #include "fbcon.h"
+#include "fb_internal.h"
 
 /*
  * FIXME: Locking
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 4edf70241a23c..ee44a46a66be1 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -44,6 +44,8 @@
 
 #define FBPIXMAPSIZE	(1024 * 8)
 
+struct class *fb_class;
+
 DEFINE_MUTEX(registration_lock);
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
 int num_registered_fb __read_mostly;
@@ -899,9 +901,6 @@ fb_blank(struct fb_info *info, int blank)
 }
 EXPORT_SYMBOL(fb_blank);
 
-struct class *fb_class;
-EXPORT_SYMBOL(fb_class);
-
 static int fb_check_foreignness(struct fb_info *fi)
 {
 	const bool foreign_endian = fi->flags & FBINFO_FOREIGN_ENDIAN;
@@ -1108,59 +1107,48 @@ void fb_set_suspend(struct fb_info *info, int state)
 }
 EXPORT_SYMBOL(fb_set_suspend);
 
-/**
- *	fbmem_init - init frame buffer subsystem
- *
- *	Initialize the frame buffer subsystem.
- *
- *	NOTE: This function is _only_ to be called by drivers/char/mem.c.
- *
- */
-
-static int __init
-fbmem_init(void)
+static int __init fbmem_init(void)
 {
 	int ret;
 
+	fb_class = class_create("graphics");
+	if (IS_ERR(fb_class)) {
+		ret = PTR_ERR(fb_class);
+		pr_err("Unable to create fb class; errno = %d\n", ret);
+		goto err_fb_class;
+	}
+
 	ret = fb_init_procfs();
 	if (ret)
-		return ret;
+		goto err_class_destroy;
 
 	ret = fb_register_chrdev();
 	if (ret)
-		goto err_chrdev;
-
-	fb_class = class_create("graphics");
-	if (IS_ERR(fb_class)) {
-		ret = PTR_ERR(fb_class);
-		pr_warn("Unable to create fb class; errno = %d\n", ret);
-		fb_class = NULL;
-		goto err_class;
-	}
+		goto err_fb_cleanup_procfs;
 
 	fb_console_init();
 
 	return 0;
 
-err_class:
-	fb_unregister_chrdev();
-err_chrdev:
+err_fb_cleanup_procfs:
 	fb_cleanup_procfs();
+err_class_destroy:
+	class_destroy(fb_class);
+err_fb_class:
+	fb_class = NULL;
 	return ret;
 }
 
 #ifdef MODULE
-module_init(fbmem_init);
-static void __exit
-fbmem_exit(void)
+static void __exit fbmem_exit(void)
 {
 	fb_console_exit();
-
+	fb_unregister_chrdev();
 	fb_cleanup_procfs();
 	class_destroy(fb_class);
-	fb_unregister_chrdev();
 }
 
+module_init(fbmem_init);
 module_exit(fbmem_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Framebuffer base");
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1988d11f78bcb..541a0e3ce21f4 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -609,7 +609,6 @@ extern int fb_new_modelist(struct fb_info *info);
 
 extern bool fb_center_logo;
 extern int fb_logo_count;
-extern struct class *fb_class;
 
 static inline void lock_fb_info(struct fb_info *info)
 {
-- 
2.41.0

