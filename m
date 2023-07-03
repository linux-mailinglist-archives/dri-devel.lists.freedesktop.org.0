Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36902746604
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63110E24B;
	Mon,  3 Jul 2023 23:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0462A10E24A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLDMtsQ7x8sK8Yp4yXeZqors8D/LGiL+rTQqlGxqvwY=;
 b=TDob6jxXRum21xyW1YVtUhk769+p3F/dWb4G/wKl07jvFP8CJqA/mlkT1V98lT0YgVlvA1
 NlmiMG92wfui0QChMmzqZ7awYvlQX4yAusee+XZ0F3BFcfWq/Uze/Bs4WOBGfGhdSiUhtd
 vBIK5zaeSiyPfz/lamdVMDkOczzftQ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-_6_1IfCtMwOGdJxpCbsRWA-1; Mon, 03 Jul 2023 19:05:48 -0400
X-MC-Unique: _6_1IfCtMwOGdJxpCbsRWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbaade0c71so31072425e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425547; x=1691017547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLDMtsQ7x8sK8Yp4yXeZqors8D/LGiL+rTQqlGxqvwY=;
 b=GDGTtaZGYfNI042w8c8zSx+eo8UryIhqKCcnc/tLN+TXITMLVayGgR7YfVrV66egiZ
 IMS8WFUVd7upV3c14qLN7h71PKnvZQkw7/YkiQw8VBu9XuLbvCPyY1D1ZV2xGbje7rWf
 cK9GYU6D7t0vru55YS65ww155k18XLl5MyBGiiXTDDZuf432UCqaTDD0kJJX2SRCAa4C
 LrMS8cZPdkMHI7GlNmjBZ0Os3ff8o5pJvsweqjySm0uaxY+MIUt+hfbFBmsrIA0RXeuA
 FaQ3vDkOe5P5wQXwSqWZXL6bQY5KBAHr9uEN6CfLKLlvWSilRfifmTqxv8GGsHu5ZfBB
 5f7A==
X-Gm-Message-State: AC+VfDz/5ozkSN++RZG5EyLRlhFbafYKsXWeXNDtbewhESJQwbwwZYYZ
 oDJ+6oprsaV8cocVGM6km6pEtU56CswH/5XP2hIuCxR/Jt50hFVHSYSTRw0/fXVkot6rxMbFFOk
 GKXAPYVE2whjTmvXyXV8zIgg1I7cg
X-Received: by 2002:a1c:4c08:0:b0:3fb:b8a6:33f9 with SMTP id
 z8-20020a1c4c08000000b003fbb8a633f9mr9977069wmf.0.1688425546946; 
 Mon, 03 Jul 2023 16:05:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lYdF3dqf9fAKeuNwNXf1SRGWV/yMOjcbQ+VJIzZ7uwkyrMAhz7mBxt/2leHZW9fKjrXxnUQ==
X-Received: by 2002:a1c:4c08:0:b0:3fb:b8a6:33f9 with SMTP id
 z8-20020a1c4c08000000b003fbb8a633f9mr9977053wmf.0.1688425546709; 
 Mon, 03 Jul 2023 16:05:46 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
Date: Tue,  4 Jul 2023 01:05:28 +0200
Message-ID: <20230703230534.997525-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703230534.997525-1-javierm@redhat.com>
References: <20230703230534.997525-1-javierm@redhat.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
---

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

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 10 ++++++++--
 drivers/video/fbdev/core/Kconfig  | 30 +++++++++++++++++-------------
 drivers/video/fbdev/core/Makefile |  8 ++++----
 6 files changed, 32 insertions(+), 22 deletions(-)

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
index 06199f044546..179e728aff5d 100644
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
index 8e308d12c57b..15ce529d579a 100644
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
index 9150bafd9e89..2cd213716c12 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,10 +1,10 @@
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
+fb-$(CONFIG_FB)                   += fb_backlight.o fbmon.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 fb-$(CONFIG_FB_DEVICE)            += fb_chrdev.o \
                                      fb_procfs.o \
-- 
2.41.0

