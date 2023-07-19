Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25018758FF7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B009210E421;
	Wed, 19 Jul 2023 08:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503FE10E418
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeeOgXhUO/vClYx94S4+R9MkQtXVmG+u/hRQc6B/8fg=;
 b=d6uEi9HUdNjZeMUpogctaZvirH4Rwk4vuwwJD8JOYcHEQ9evu2GBBN1ajFhEoEkB6c3QNb
 iw07YhXS8rGvomr5Vr/lMTBoQwa3w+ACM6wHswz/xDe0KTWYsxgmo/5Wt0ijBA/K0Igcmz
 re3OknbIEeEjblbrj6ekNf2vWVZztI8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-oL5vPIFoMsmh1SmbOQahxQ-1; Wed, 19 Jul 2023 04:15:58 -0400
X-MC-Unique: oL5vPIFoMsmh1SmbOQahxQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso3827914f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754557; x=1690359357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeeOgXhUO/vClYx94S4+R9MkQtXVmG+u/hRQc6B/8fg=;
 b=kwW/8YOQpvNgl41Ldi2QVtrq9mSIu6YYefFKPEed7Rg3jHgF4pwjVc+Ibz0NgMChO3
 vABdtknvctltvBZlPv2bzrR5Hu5x/Iby2/rZuMrc8H3g+BUtwDuNJb6HN17Qt73k5GAM
 XXv/eh3mjo/QIw897jrHenIIgEkh5x3uUtjeWQ4YR25fPM9SaOkTRs3cQb/WbtjKStA8
 Sg41S8KCNfdVswucMACc/7gg7E53i5e+R2erRiIicfyIOpPwkjx63OF5tKR7FIooWlAg
 Tv+XrJuuIFJaO/WTs22dzyAo6Stv5xBIaAOk7/nMd2EKJU6JieZxL0zvAY3iBFQXPmwV
 GAuw==
X-Gm-Message-State: ABy/qLb2GRq2+T+fAZ0tzwsVhlXcMwcxvNyCavzJgthsk6GXrD+OwxDh
 Pfy8tyW20N0fXOwdviqJasDtsF0NN1N/eanfs/ibdv2YSFFpHQyWudme/1mcnosr1Uz1mIOxchI
 DJQKX0TzziH09hqxlOaLDFAI3dxFn
X-Received: by 2002:adf:d092:0:b0:314:220d:7 with SMTP id
 y18-20020adfd092000000b00314220d0007mr3554059wrh.45.1689754557218; 
 Wed, 19 Jul 2023 01:15:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGY2y+prWD5XWLGQGaYZwypVJIFXzKlEB9j8IG51gxmAdkABEIdv/HLlPZUPrtR3g7NYLDxrQ==
X-Received: by 2002:adf:d092:0:b0:314:220d:7 with SMTP id
 y18-20020adfd092000000b00314220d0007mr3554049wrh.45.1689754556937; 
 Wed, 19 Jul 2023 01:15:56 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0031423a8f4f7sm4574354wrv.56.2023.07.19.01.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
Date: Wed, 19 Jul 2023 10:15:37 +0200
Message-ID: <20230719081544.741051-4-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719081544.741051-1-javierm@redhat.com>
References: <20230719081544.741051-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: x86@kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
drivers are needed (e.g: only to have support for framebuffer consoles).

The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
and so it can only be enabled if that dependency is enabled as well.

That means fbdev drivers have to be explicitly disabled if users want to
enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.

This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
allowing CONFIG_FB to be disabled (and automatically disabling all the
fbdev drivers).

Nothing from fb_backlight.o and fbmon.o is used by the DRM fbdev emulation
layer so these two objects can be compiled out when CONFIG_FB is disabled.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
---

Changes in v6:
- Fix link error when CONFIG_FB_CORE=y and CONFIG_FB=m (Arnd Bergmann).

Changes in v5:
- Fix ifdef guard check in drivers/video/backlight/backlight.c (Arnd Bergmann).

Changes in v4:
- Fix menuconfig hierarchy that was broken in v3 (Arnd Bergmann).

Changes in v3:
- Really make a hidden symbol by removing the prompt (Arnd Bergmann).
- Change FB_CORE to config instead of menuconfig (Arnd Bergmann).
- Keep "depends on FB" for FIRMWARE_EDID (Arnd Bergmann).
- Compile out fb_backlight.o and fbmon.o that are only needed for FB
  (Arnd Bergmann).
- Make FB_DEVICE to depend on FB_CORE instead of selecting it.

Changes in v2:
- Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
  FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
- Don't change the fb.o object name (Arnd Bergmann).
- Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).

 arch/x86/Makefile                   |  2 +-
 arch/x86/video/Makefile             |  2 +-
 drivers/video/backlight/backlight.c |  6 +++---
 drivers/video/console/Kconfig       |  2 +-
 drivers/video/fbdev/Kconfig         | 10 ++++++++--
 drivers/video/fbdev/core/Kconfig    | 30 ++++++++++++++++-------------
 drivers/video/fbdev/core/Makefile   | 10 ++++++----
 7 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b39975977c03..89a02e69be5f 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -259,7 +259,7 @@ drivers-$(CONFIG_PCI)            += arch/x86/pci/
 # suspend and hibernation support
 drivers-$(CONFIG_PM) += arch/x86/power/
 
-drivers-$(CONFIG_FB) += arch/x86/video/
+drivers-$(CONFIG_FB_CORE) += arch/x86/video/
 
 ####
 # boot loader support. Several targets are kept for legacy purposes
diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
index 11640c116115..5ebe48752ffc 100644
--- a/arch/x86/video/Makefile
+++ b/arch/x86/video/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_FB)               += fbdev.o
+obj-$(CONFIG_FB_CORE)		+= fbdev.o
diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 9a885d398c22..86e1cdc8e369 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -79,8 +79,8 @@ static const char *const backlight_scale_types[] = {
 	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
 };
 
-#if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
-			   defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
+#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
+				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
 /*
  * fb_notifier_callback
  *
@@ -155,7 +155,7 @@ static inline int backlight_register_fb(struct backlight_device *bd)
 static inline void backlight_unregister_fb(struct backlight_device *bd)
 {
 }
-#endif /* CONFIG_FB */
+#endif /* CONFIG_FB_CORE */
 
 static void backlight_generate_event(struct backlight_device *bd,
 				     enum backlight_update_reason reason)
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index a2a88d42edf0..1b5a319971ed 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -72,7 +72,7 @@ config DUMMY_CONSOLE_ROWS
 
 config FRAMEBUFFER_CONSOLE
 	bool "Framebuffer Console support"
-	depends on FB && !UML
+	depends on FB_CORE && !UML
 	select VT_HW_CONSOLE_BINDING
 	select CRC32
 	select FONT_SUPPORT
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ed881d5b3ee0..c0b0419e98b6 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -4,9 +4,9 @@
 #
 
 menuconfig FB
-	tristate "Support for frame buffer devices"
+	tristate "Support for frame buffer device drivers"
+	select FB_CORE
 	select FB_NOTIFY
-	select VIDEO_CMDLINE
 	help
 	  The frame buffer device provides an abstraction for the graphics
 	  hardware. It represents the frame buffer of some video hardware and
@@ -30,6 +30,12 @@ menuconfig FB
 	  <http://www.munted.org.uk/programming/Framebuffer-HOWTO-1.3.html> for more
 	  information.
 
+	  This enables support for native frame buffer device (fbdev) drivers.
+
+	  The DRM subsystem provides support for emulated frame buffer devices
+	  on top of KMS drivers, but this option allows legacy fbdev drivers to
+	  be enabled as well.
+
 	  Say Y here and to the driver for your graphics board below if you
 	  are compiling a kernel for a non-x86 architecture.
 
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index fd3b7f5b4b7a..528e4dd2199c 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -3,6 +3,10 @@
 # fbdev core configuration
 #
 
+config FB_CORE
+	select VIDEO_CMDLINE
+	tristate
+
 config FB_NOTIFY
 	bool
 
@@ -23,7 +27,7 @@ config FIRMWARE_EDID
 
 config FB_DEVICE
 	bool "Provide legacy /dev/fb* device"
-	depends on FB
+	depends on FB_CORE
 	default y
 	help
 	  Say Y here if you want the legacy /dev/fb* device file and
@@ -39,7 +43,7 @@ config FB_DDC
 
 config FB_CFB_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -47,7 +51,7 @@ config FB_CFB_FILLRECT
 
 config FB_CFB_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -55,7 +59,7 @@ config FB_CFB_COPYAREA
 
 config FB_CFB_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -63,7 +67,7 @@ config FB_CFB_IMAGEBLIT
 
 config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
-	depends on FB
+	depends on FB_CORE
 	help
 	  Allow generic frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
@@ -71,7 +75,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 
 config FB_SYS_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -79,7 +83,7 @@ config FB_SYS_FILLRECT
 
 config FB_SYS_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -87,7 +91,7 @@ config FB_SYS_COPYAREA
 
 config FB_SYS_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -126,22 +130,22 @@ endchoice
 
 config FB_SYS_FOPS
 	tristate
-	depends on FB
+	depends on FB_CORE
 
 config FB_DEFERRED_IO
 	bool
-	depends on FB
+	depends on FB_CORE
 
 config FB_IO_HELPERS
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
 
 config FB_SYS_HELPERS
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
 	select FB_SYS_FOPS
@@ -149,7 +153,7 @@ config FB_SYS_HELPERS
 
 config FB_SYS_HELPERS_DEFERRED
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_DEFERRED_IO
 	select FB_SYS_HELPERS
 
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 9150bafd9e89..edfde2948e5c 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
-obj-$(CONFIG_FB)                  += fb.o
-fb-y                              := fb_backlight.o \
-                                     fb_info.o \
-                                     fbmem.o fbmon.o fbcmap.o \
+obj-$(CONFIG_FB_CORE)             += fb.o
+fb-y                              := fb_info.o \
+                                     fbmem.o fbcmap.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
+ifdef CONFIG_FB
+fb-y                              += fb_backlight.o fbmon.o
+endif
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 fb-$(CONFIG_FB_DEVICE)            += fb_chrdev.o \
                                      fb_procfs.o \
-- 
2.41.0

