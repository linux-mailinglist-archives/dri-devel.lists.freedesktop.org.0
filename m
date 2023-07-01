Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B9744B2B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 23:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DC110E11C;
	Sat,  1 Jul 2023 21:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39B910E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688247916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVp6/k8iItY4Fh6tN5JBgOkeUtA2k8q9cd5KwLvRASM=;
 b=Ff3y/Kpqea52z+dKlDiWY0nAObnnzcs6AntGj6f851x6mnalLt43ZQPl2NuPwIfpisflLT
 DMs1jKrphO83UHiWKgwNwDr36iDCIDhokA5EOnJa0xjVWd7Gw4J0nHS1JARMl1tv3mskGC
 FkTNoXuo+8dlEPpggOriEKv8I3KAPcQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-3Z-GqHenOg2hT0sH9N6Q7Q-1; Sat, 01 Jul 2023 17:45:15 -0400
X-MC-Unique: 3Z-GqHenOg2hT0sH9N6Q7Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f9bef91aa4so18319925e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jul 2023 14:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688247914; x=1690839914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVp6/k8iItY4Fh6tN5JBgOkeUtA2k8q9cd5KwLvRASM=;
 b=cqIngyDN7qeDPFcAkqJBMnPvqZTgPUAczABgEdWaKfIN/jL2YelpwbDfHaXPcmqmVF
 SzeV5BbnYC18SCMASjWzO03DxYz4nXaicRg37z6PN39I0BAbH7LnF+KDbkn5En9FtNa5
 1tbKUoCh2YGJ36EN01XR3jpdqQvm8hMSi2uJtkxYfsFMDbx76uT8YYe0DMoz9LDYbGew
 fX5bQyK5zO15RmpFLyyR9HaOvpgf2oAoHDST4WY0Jh3x+NKHI6YiOj1C20AzUjGhXPzF
 d4FbN8u6UimpuoTy1h8frmKAvNr/UXojRHNuCfSiXW0Clm6ShLJ49zQuInkXJq4HNn7U
 wM9A==
X-Gm-Message-State: AC+VfDxWwhNyjSEjzIuorVzL/bCQ8gORMUQPzDSB5Pry0WDj6qESLJCa
 1wFv4VnUzXPYOtmBooz/mz8o6CSsMoAb2W4JpRvDdZND2Kr7IMTn+MGKYttIIm8QVDtBSBI+ydb
 1DccN5Gl+H/VOBVhuWnEYX7NdEM0U
X-Received: by 2002:a1c:7706:0:b0:3fb:b61f:c719 with SMTP id
 t6-20020a1c7706000000b003fbb61fc719mr4959576wmi.33.1688247914152; 
 Sat, 01 Jul 2023 14:45:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WtvTVFU6XcG3QtAxzUOBs4bnSkgPG7Dra6Iy7iETJyiZfrdtFMs1g1wQAz4NSuuTBGfeRFg==
X-Received: by 2002:a1c:7706:0:b0:3fb:b61f:c719 with SMTP id
 t6-20020a1c7706000000b003fbb61fc719mr4959554wmi.33.1688247913775; 
 Sat, 01 Jul 2023 14:45:13 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fbc0ea491dsm6913800wmc.40.2023.07.01.14.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 14:45:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
Date: Sat,  1 Jul 2023 23:44:50 +0200
Message-ID: <20230701214503.550549-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230701214503.550549-1-javierm@redhat.com>
References: <20230701214503.550549-1-javierm@redhat.com>
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

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Keep "depends on FB" for FB_DDC, FB_HECUBA, FB_SVGALIB, FB_MACMODES,
  FB_BACKLIGHT, FB_MODE_HELPERS and FB_TILEBLITTING (Arnd Bergmann).
- Don't change the fb.o object name (Arnd Bergmann).
- Make FB_CORE a non-visible Kconfig symbol instead (Thomas Zimmermann).

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 40 +++++++++++++++++++------------
 drivers/video/fbdev/core/Makefile |  2 +-
 5 files changed, 29 insertions(+), 19 deletions(-)

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
index cecf15418632..da6f7d588f17 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -6,8 +6,12 @@
 config FB_NOTIFY
 	bool
 
+menuconfig FB_CORE
+	tristate "Core support for frame buffer devices"
+
 menuconfig FB
-	tristate "Support for frame buffer devices"
+	tristate "Support for frame buffer device drivers"
+	select FB_CORE
 	select FB_NOTIFY
 	select VIDEO_CMDLINE
 	help
@@ -33,6 +37,12 @@ menuconfig FB
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
 
@@ -44,7 +54,7 @@ menuconfig FB
 
 config FIRMWARE_EDID
 	bool "Enable firmware EDID"
-	depends on FB
+	depends on FB_CORE
 	help
 	  This enables access to the EDID transferred from the firmware.
 	  On the i386, this is from the Video BIOS. Enable this if DDC/I2C
@@ -59,7 +69,7 @@ config FIRMWARE_EDID
 
 config FB_DEVICE
 	bool "Provide legacy /dev/fb* device"
-	depends on FB
+	select FB_CORE
 	default y
 	help
 	  Say Y here if you want the legacy /dev/fb* device file and
@@ -75,7 +85,7 @@ config FB_DDC
 
 config FB_CFB_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -83,7 +93,7 @@ config FB_CFB_FILLRECT
 
 config FB_CFB_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -91,7 +101,7 @@ config FB_CFB_COPYAREA
 
 config FB_CFB_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the cfb_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -99,7 +109,7 @@ config FB_CFB_IMAGEBLIT
 
 config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
-	depends on FB
+	depends on FB_CORE
 	help
 	  Allow generic frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
@@ -107,7 +117,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 
 config FB_SYS_FILLRECT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_fillrect function for generic software rectangle
 	  filling. This is used by drivers that don't provide their own
@@ -115,7 +125,7 @@ config FB_SYS_FILLRECT
 
 config FB_SYS_COPYAREA
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_copyarea function for generic software area copying.
 	  This is used by drivers that don't provide their own (accelerated)
@@ -123,7 +133,7 @@ config FB_SYS_COPYAREA
 
 config FB_SYS_IMAGEBLIT
 	tristate
-	depends on FB
+	depends on FB_CORE
 	help
 	  Include the sys_imageblit function for generic software image
 	  blitting. This is used by drivers that don't provide their own
@@ -162,22 +172,22 @@ endchoice
 
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
@@ -185,7 +195,7 @@ config FB_SYS_HELPERS
 
 config FB_SYS_HELPERS_DEFERRED
 	bool
-	depends on FB
+	depends on FB_CORE
 	select FB_DEFERRED_IO
 	select FB_SYS_HELPERS
 
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 9150bafd9e89..4c2e4a026d12 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
-obj-$(CONFIG_FB)                  += fb.o
+obj-$(CONFIG_FB_CORE)             += fb.o
 fb-y                              := fb_backlight.o \
                                      fb_info.o \
                                      fbmem.o fbmon.o fbcmap.o \
-- 
2.41.0

