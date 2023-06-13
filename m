Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4AE72E0D8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E810E399;
	Tue, 13 Jun 2023 11:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCD410E372
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9D59223F6;
 Tue, 13 Jun 2023 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMUGFh9KCquNJbPnqKzA8txyr6JzjJHDw8DvJ5I8F9w=;
 b=zBqHXggDzswbHXBGA4Dzm0nOK51LWutn1yhE3ToelLVuCQdVV/rPas7ghLFJkD0LVNz+Mw
 5J37Iyy9ATrI5jeX92dGpwxQTq3u27L2phGvaVkbLk2UQzGy6IkUCSFq6Pyp8U5WfFIwMk
 93lDno6hUc/clsweR5LvP7ybJWkcTpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMUGFh9KCquNJbPnqKzA8txyr6JzjJHDw8DvJ5I8F9w=;
 b=HTGJXuDo0zhxlHgvG9IWXpKR61rAHngCIlXFnkUhXo1ueJ13V8j7W6Z68Et2KyCOeS9ALL
 ymnRUAHbwAqitvDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6836013483;
 Tue, 13 Jun 2023 11:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8H2NGJBOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 38/38] fbdev: Make support for userspace interfaces
 configurable
Date: Tue, 13 Jun 2023 13:07:13 +0200
Message-ID: <20230613110953.24176-39-tzimmermann@suse.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
device optional. If the new option has not been selected, fbdev
does not create files in devfs, sysfs or procfs.

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

v3:
	* effect -> affect in Kconfig help (Daniel)
v2:
	* set FB_DEVICE default to y (Geert)
	* comment on {get,put}_device() (Sam)
	* Kconfig fixes (Sam)
	* add TODO item about FB_DEVICE dependencies (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/gpu/todo.rst               | 13 ++++++++
 drivers/staging/fbtft/Kconfig            |  1 +
 drivers/video/fbdev/Kconfig              | 13 ++++++++
 drivers/video/fbdev/core/Makefile        |  7 +++--
 drivers/video/fbdev/core/fb_internal.h   | 38 ++++++++++++++++++++++++
 drivers/video/fbdev/omap2/omapfb/Kconfig |  2 +-
 include/linux/fb.h                       |  2 ++
 7 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 68bdafa0284f5..f226f934ca5af 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -452,6 +452,19 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Remove driver dependencies on FB_DEVICE
+---------------------------------------
+
+A number of fbdev drivers provide attributes via sysfs and therefore depend
+on CONFIG_FB_DEVICE to be selected. Review each driver and attempt to make
+any dependencies on CONFIG_FB_DEVICE optional. At the minimum, the respective
+code in the driver could be conditionalized via ifdef CONFIG_FB_DEVICE. Not
+all drivers might be able to drop CONFIG_FB_DEVICE.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Starter
+
 
 Core refactorings
 =================
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 4d29e8c1014e0..5dda3c65a38e7 100644
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
index f82357d4f84da..fc51dd7342879 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -57,6 +57,16 @@ config FIRMWARE_EDID
 	  combination with certain motherboards and monitors are known to
 	  suffer from this problem.
 
+config FB_DEVICE
+	bool "Provide legacy /dev/fb* device"
+	depends on FB
+	default y
+	help
+	  Say Y here if you want the legacy /dev/fb* device file and
+	  interfaces within sysfs anc procfs. It is only required if you
+	  have userspace programs that depend on fbdev for graphics output.
+	  This does not affect the framebuffer console. If unsure, say N.
+
 config FB_DDC
 	tristate
 	depends on FB
@@ -1545,6 +1555,7 @@ config FB_3DFX_I2C
 config FB_VOODOO1
 	tristate "3Dfx Voodoo Graphics (sst1) support"
 	depends on FB && PCI
+	depends on FB_DEVICE
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -1863,6 +1874,7 @@ config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on FB_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
@@ -1932,6 +1944,7 @@ config FB_SMSCUFX
 config FB_UDL
 	tristate "Displaylink USB Framebuffer support"
 	depends on FB && USB
+	depends on FB_DEVICE
 	select FB_MODE_HELPERS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index eea5938f74238..9150bafd9e899 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -2,12 +2,13 @@
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
 fb-y                              := fb_backlight.o \
-                                     fb_chrdev.o \
                                      fb_info.o \
-                                     fb_procfs.o \
-                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
+                                     fbmem.o fbmon.o fbcmap.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
+fb-$(CONFIG_FB_DEVICE)            += fb_chrdev.o \
+                                     fb_procfs.o \
+                                     fbsysfs.o
 
 ifeq ($(CONFIG_FRAMEBUFFER_CONSOLE),y)
 fb-y				  += fbcon.o bitblit.o softcursor.o
diff --git a/drivers/video/fbdev/core/fb_internal.h b/drivers/video/fbdev/core/fb_internal.h
index 0b43c0cd50968..4c8d509a00265 100644
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
@@ -19,11 +29,39 @@ struct fb_info *get_fb_info(unsigned int idx);
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
+	/*
+	 * Acquire a reference on the parent device to avoid
+	 * unplug operations behind our back. With the fbdev
+	 * device enabled, this is performed within register_device().
+	 */
+	get_device(fb_info->device);
+
+	return 0;
+}
+static inline void fb_device_destroy(struct fb_info *fb_info)
+{
+	/* Undo the get_device() from fb_device_create() */
+	put_device(fb_info->device);
+}
+#endif
 
 #endif
diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index 69f9cb03507ef..21069fdb7cc21 100644
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
index 541a0e3ce21f4..40ed1028160c0 100644
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
2.41.0

