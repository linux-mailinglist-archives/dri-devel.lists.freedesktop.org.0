Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59C7229AB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92710E2B9;
	Mon,  5 Jun 2023 14:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269910E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7AB61FE6F;
 Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veqp7FLvBbFrOqaEY1a/KdKb6AXkthKRPL+ACV2NoEs=;
 b=CjR3rmc79oyO0Cix3KHdMGIswDXe2xLPTlspNm+1neAKxBKNJuw1FH+FIND5pRUVj9oBfj
 0ysTZAWiXFkCl5lJaHhUgzFee6e0SdVJIQ+kHT0dTwqTqd7gSJUsSfahflCgkpHjO3k9iQ
 MPCuEXZSSTE2fu1F3dnq87G1F2zKKO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veqp7FLvBbFrOqaEY1a/KdKb6AXkthKRPL+ACV2NoEs=;
 b=CrjTdmfqGq2EedC4GU9TdFocyW9PA+Uy2sZNi9SZLOXMz7fI8n4QFXCV4ioeRhhHSuq1Ag
 fCDISs6J4XAZx7CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9089D139C8;
 Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uKlnIrf1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Date: Mon,  5 Jun 2023 16:48:12 +0200
Message-Id: <20230605144812.15241-31-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
device optional. If the new option has not been selected, fbdev
does not create a files in devfs or sysfs.

Most modern Linux systems run a DRM-based graphics stack that uses
the kernel's framebuffer console, but has otherwise deprecated fbdev
support. Yet fbdev userspace interfaces are still present.

The option makes it possible to use the fbdev subsystem as console
implementation without support for userspace. This closes potential
entry points to manipulate kernel or I/O memory via framebuffers. It
also prevents the execution of driver code via ioctl or sysfs, both
of which might allow malicious software to exploit bugs in the fbdev
code.

A small number of fbdev drivers require struct fbinfo.dev to be
initialized, usually for the support of sysfs interface. Make these
drivers depend on FB_DEVICE. They can later be fixed if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/fbtft/Kconfig            |  1 +
 drivers/video/fbdev/Kconfig              | 12 +++++++++
 drivers/video/fbdev/core/Makefile        |  7 +++---
 drivers/video/fbdev/core/fb_internal.h   | 32 ++++++++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/Kconfig |  2 +-
 include/linux/fb.h                       |  2 ++
 6 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 4d29e8c1014e..5dda3c65a38e 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -2,6 +2,7 @@
 menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
+	depends on FB_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6df9bd09454a..48d9a14f889c 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -57,6 +57,15 @@ config FIRMWARE_EDID
 	  combination with certain motherboards and monitors are known to
 	  suffer from this problem.
 
+config FB_DEVICE
+        bool "Provide legacy /dev/fb* device"
+        depends on FB
+        help
+	  Say Y here if you want the legacy /dev/fb* device file. It's
+	  only required if you have userspace programs that depend on
+	  fbdev for graphics output. This does not effect the framebuffer
+	  console.
+
 config FB_DDC
 	tristate
 	depends on FB
@@ -1545,6 +1554,7 @@ config FB_3DFX_I2C
 config FB_VOODOO1
 	tristate "3Dfx Voodoo Graphics (sst1) support"
 	depends on FB && PCI
+	depends on FB_DEVICE
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -1862,6 +1872,7 @@ config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on FB_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
@@ -1930,6 +1941,7 @@ config FB_SMSCUFX
 config FB_UDL
 	tristate "Displaylink USB Framebuffer support"
 	depends on FB && USB
+	depends on FB_DEVICE
 	select FB_MODE_HELPERS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 125d24f50c36..d5e8772620f8 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -2,12 +2,13 @@
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fb_backlight.o \
-                                     fb_devfs.o \
                                      fb_info.o \
-                                     fb_procfs.o \
-                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
+                                     fbmem.o fbmon.o fbcmap.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
+fb-$(CONFIG_FB_DEVICE)            += fb_devfs.o \
+                                     fb_procfs.o \
+                                     fbsysfs.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
 fb-y				  += fbcon.o bitblit.o softcursor.o
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 0b43c0cd5096..b8a28466db79 100644
--- a/drivers/video/fbdev/core/fb_internal.h
+++ b/drivers/video/fbdev/core/fb_internal.h
@@ -3,12 +3,22 @@
 #ifndef _FB_INTERNAL_H
 #define _FB_INTERNAL_H
 
+#include <linux/device.h>
 #include <linux/fb.h>
 #include <linux/mutex.h>
 
 /* fb_devfs.c */
+#if defined(CONFIG_FB_DEVICE)
 int fb_register_chrdev(void);
 void fb_unregister_chrdev(void);
+#else
+static inline int fb_register_chrdev(void)
+{
+	return 0;
+}
+static inline void fb_unregister_chrdev(void)
+{ }
+#endif
 
 /* fbmem.c */
 extern struct class *fb_class;
@@ -19,11 +29,33 @@ struct fb_info *get_fb_info(unsigned int idx);
 void put_fb_info(struct fb_info *fb_info);
 
 /* fb_procfs.c */
+#if defined(CONFIG_FB_DEVICE)
 int fb_init_procfs(void);
 void fb_cleanup_procfs(void);
+#else
+static inline int fb_init_procfs(void)
+{
+	return 0;
+}
+static inline void fb_cleanup_procfs(void)
+{ }
+#endif
 
 /* fbsysfs.c */
+#if defined(CONFIG_FB_DEVICE)
 int fb_device_create(struct fb_info *fb_info);
 void fb_device_destroy(struct fb_info *fb_info);
+#else
+static inline int fb_device_create(struct fb_info *fb_info)
+{
+	get_device(fb_info->device); // as in device_add()
+
+	return 0;
+}
+static inline void fb_device_destroy(struct fb_info *fb_info)
+{
+	put_device(fb_info->device); // as in device_del()
+}
+#endif
 
 #endif
diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index 69f9cb03507e..21069fdb7cc2 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,9 +5,9 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
+	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
-
 	select FB_OMAP2_DSS
 	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
 	select FB_CFB_FILLRECT
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 541a0e3ce21f..40ed1028160c 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -481,7 +481,9 @@ struct fb_info {
 
 	const struct fb_ops *fbops;
 	struct device *device;		/* This is the parent */
+#if defined(CONFIG_FB_DEVICE)
 	struct device *dev;		/* This is this fb device */
+#endif
 	int class_flag;                    /* private sysfs flags */
 #ifdef CONFIG_FB_TILEBLITTING
 	struct fb_tile_ops *tileops;    /* Tile Blitting */
-- 
2.40.1

