Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1647746606
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770E10E251;
	Mon,  3 Jul 2023 23:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927610E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688425549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytjztKBchoEvkVL0L2ZNLjWuHPbCVbw9mTADb8BljqM=;
 b=O2j+GuTCKPohADrOrTf2FHp8yQus4/BDTL+Fl0CYIB2B5GlsLkJKk8kKysou/LjncYKDGg
 1pTdgVujarx57IOOAuS+RvTfsHzlA6LTWTEL1tP1wpk7OkqEmS86CE2NB//0yuHAe8fa0i
 0q3OPTeTp6JuZUSI6ZbehgjUSJVa3f0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-K8PA9iEbNvq1G6JGng0mOA-1; Mon, 03 Jul 2023 19:05:45 -0400
X-MC-Unique: K8PA9iEbNvq1G6JGng0mOA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso2463151f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 16:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425544; x=1691017544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytjztKBchoEvkVL0L2ZNLjWuHPbCVbw9mTADb8BljqM=;
 b=WGo6VAnLWA+6L2fy0rD/pcSrkb/BBK+erDRBOVth9Z7vMKKCvN1Ln5HCsjOY4vu04x
 u0lm/uxUIc/qHKmUZXAmSvrJjkFLWXVyNrs0Kds8+T2pwyhrGQ8LXEGJyNnQgefWNtsa
 D7JDVvFN2czFZBJdpPobItiDMVQj0UdjZNYvZEuLTPxLeAMEhKCV4V51kgiXgM5fG6VI
 TK19DrwiCSTXRJZABfYmNXzNWyNBlHY+BJQO7A6R60fSvCF79k5OGmZ8Ryjpul4Fkj4Y
 XFw2pb2MyvCrndhjCZDOmmRCBpSvZ5y3ZiTSyNTqSi6MGaZL/3Y3ajGBGZVSio5/7KXY
 uM0A==
X-Gm-Message-State: ABy/qLZy+cTQXCRYYrVbA0xQMQfpI9RTqTGeUpTYsfqhLD/C1F898NrT
 YEM0lI4Dgn/Pi6i05/U1qkVTFzmyzx2yOSWqsYy35m/ka3eD6ok//73HyiD1qf2SqCFBYBPr0OX
 R4EdFe667xN1N+xMGVRP6hT9MwQYD
X-Received: by 2002:a5d:554d:0:b0:314:824:3777 with SMTP id
 g13-20020a5d554d000000b0031408243777mr8906988wrw.48.1688425544029; 
 Mon, 03 Jul 2023 16:05:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGzsi7jw2pVMvf1cUHJuTkFvIkETnk1vKsAwCVPqrqfEA796y4p5Tm6goJkpt2WZcJLjJCgFg==
X-Received: by 2002:a5d:554d:0:b0:314:824:3777 with SMTP id
 g13-20020a5d554d000000b0031408243777mr8906981wrw.48.1688425543753; 
 Mon, 03 Jul 2023 16:05:43 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm26504465wrb.85.2023.07.03.16.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 16:05:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] fbdev: Move core fbdev symbols to a separate Kconfig
 file
Date: Tue,  4 Jul 2023 01:05:26 +0200
Message-ID: <20230703230534.997525-3-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drivers/video/fbdev/Kconfig defines both symbols for fbdev drivers and
core fbdev symbols, that can be enabled independently of the fbdev drivers.

Split the Kconfig in two, one that only has the symbols for fbdev drivers
and another one that contains the fbdev core symbols.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/Kconfig      | 203 +------------------------------
 drivers/video/fbdev/core/Kconfig | 202 ++++++++++++++++++++++++++++++
 2 files changed, 204 insertions(+), 201 deletions(-)
 create mode 100644 drivers/video/fbdev/core/Kconfig

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cecf15418632..06199f044546 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -3,9 +3,6 @@
 # fbdev configuration
 #
 
-config FB_NOTIFY
-	bool
-
 menuconfig FB
 	tristate "Support for frame buffer devices"
 	select FB_NOTIFY
@@ -42,204 +39,6 @@ menuconfig FB
 	  (e.g. an accelerated X server) and that are not frame buffer
 	  device-aware may cause unexpected results. If unsure, say N.
 
-config FIRMWARE_EDID
-	bool "Enable firmware EDID"
-	depends on FB
-	help
-	  This enables access to the EDID transferred from the firmware.
-	  On the i386, this is from the Video BIOS. Enable this if DDC/I2C
-	  transfers do not work for your driver and if you are using
-	  nvidiafb, i810fb or savagefb.
-
-	  In general, choosing Y for this option is safe.  If you
-	  experience extremely long delays while booting before you get
-	  something on your display, try setting this to N.  Matrox cards in
-	  combination with certain motherboards and monitors are known to
-	  suffer from this problem.
-
-config FB_DEVICE
-	bool "Provide legacy /dev/fb* device"
-	depends on FB
-	default y
-	help
-	  Say Y here if you want the legacy /dev/fb* device file and
-	  interfaces within sysfs anc procfs. It is only required if you
-	  have userspace programs that depend on fbdev for graphics output.
-	  This does not affect the framebuffer console. If unsure, say N.
-
-config FB_DDC
-	tristate
-	depends on FB
-	select I2C_ALGOBIT
-	select I2C
-
-config FB_CFB_FILLRECT
-	tristate
-	depends on FB
-	help
-	  Include the cfb_fillrect function for generic software rectangle
-	  filling. This is used by drivers that don't provide their own
-	  (accelerated) version.
-
-config FB_CFB_COPYAREA
-	tristate
-	depends on FB
-	help
-	  Include the cfb_copyarea function for generic software area copying.
-	  This is used by drivers that don't provide their own (accelerated)
-	  version.
-
-config FB_CFB_IMAGEBLIT
-	tristate
-	depends on FB
-	help
-	  Include the cfb_imageblit function for generic software image
-	  blitting. This is used by drivers that don't provide their own
-	  (accelerated) version.
-
-config FB_CFB_REV_PIXELS_IN_BYTE
-	bool
-	depends on FB
-	help
-	  Allow generic frame-buffer functions to work on displays with 1, 2
-	  and 4 bits per pixel depths which has opposite order of pixels in
-	  byte order to bytes in long order.
-
-config FB_SYS_FILLRECT
-	tristate
-	depends on FB
-	help
-	  Include the sys_fillrect function for generic software rectangle
-	  filling. This is used by drivers that don't provide their own
-	  (accelerated) version and the framebuffer is in system RAM.
-
-config FB_SYS_COPYAREA
-	tristate
-	depends on FB
-	help
-	  Include the sys_copyarea function for generic software area copying.
-	  This is used by drivers that don't provide their own (accelerated)
-	  version and the framebuffer is in system RAM.
-
-config FB_SYS_IMAGEBLIT
-	tristate
-	depends on FB
-	help
-	  Include the sys_imageblit function for generic software image
-	  blitting. This is used by drivers that don't provide their own
-	  (accelerated) version and the framebuffer is in system RAM.
-
-config FB_PROVIDE_GET_FB_UNMAPPED_AREA
-	bool
-	depends on FB
-	help
-	  Allow generic frame-buffer to provide get_fb_unmapped_area
-	  function to provide shareable character device support on nommu.
-
-menuconfig FB_FOREIGN_ENDIAN
-	bool "Framebuffer foreign endianness support"
-	depends on FB
-	help
-	  This menu will let you enable support for the framebuffers with
-	  non-native endianness (e.g. Little-Endian framebuffer on a
-	  Big-Endian machine). Most probably you don't have such hardware,
-	  so it's safe to say "n" here.
-
-choice
-	prompt "Choice endianness support"
-	depends on FB_FOREIGN_ENDIAN
-
-config FB_BOTH_ENDIAN
-	bool "Support for Big- and Little-Endian framebuffers"
-
-config FB_BIG_ENDIAN
-	bool "Support for Big-Endian framebuffers only"
-
-config FB_LITTLE_ENDIAN
-	bool "Support for Little-Endian framebuffers only"
-
-endchoice
-
-config FB_SYS_FOPS
-	tristate
-	depends on FB
-
-config FB_DEFERRED_IO
-	bool
-	depends on FB
-
-config FB_IO_HELPERS
-	bool
-	depends on FB
-	select FB_CFB_COPYAREA
-	select FB_CFB_FILLRECT
-	select FB_CFB_IMAGEBLIT
-
-config FB_SYS_HELPERS
-	bool
-	depends on FB
-	select FB_SYS_COPYAREA
-	select FB_SYS_FILLRECT
-	select FB_SYS_FOPS
-	select FB_SYS_IMAGEBLIT
-
-config FB_SYS_HELPERS_DEFERRED
-	bool
-	depends on FB
-	select FB_DEFERRED_IO
-	select FB_SYS_HELPERS
-
-config FB_HECUBA
-	tristate
-	depends on FB
-	depends on FB_DEFERRED_IO
-
-config FB_SVGALIB
-	tristate
-	depends on FB
-	help
-	  Common utility functions useful to fbdev drivers of VGA-based
-	  cards.
-
-config FB_MACMODES
-	tristate
-	depends on FB
-
-config FB_BACKLIGHT
-	tristate
-	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
-
-config FB_MODE_HELPERS
-	bool "Enable Video Mode Handling Helpers"
-	depends on FB
-	help
-	  This enables functions for handling video modes using the
-	  Generalized Timing Formula and the EDID parser. A few drivers rely
-	  on this feature such as the radeonfb, rivafb, and the i810fb. If
-	  your driver does not take advantage of this feature, choosing Y will
-	  just increase the kernel size by about 5K.
-
-config FB_TILEBLITTING
-	bool "Enable Tile Blitting Support"
-	depends on FB
-	help
-	  This enables tile blitting.  Tile blitting is a drawing technique
-	  where the screen is divided into rectangular sections (tiles), whereas
-	  the standard blitting divides the screen into pixels. Because the
-	  default drawing element is a tile, drawing functions will be passed
-	  parameters in terms of number of tiles instead of number of pixels.
-	  For example, to draw a single character, instead of using bitmaps,
-	  an index to an array of bitmaps will be used.  To clear or move a
-	  rectangular section of a screen, the rectangle will be described in
-	  terms of number of tiles in the x- and y-axis.
-
-	  This is particularly important to one driver, matroxfb.  If
-	  unsure, say N.
-
-comment "Frame buffer hardware drivers"
-	depends on FB
-
 config FB_GRVGA
 	tristate "Aeroflex Gaisler framebuffer support"
 	depends on FB && SPARC
@@ -2244,3 +2043,5 @@ config FB_SM712
 source "drivers/video/fbdev/omap/Kconfig"
 source "drivers/video/fbdev/omap2/Kconfig"
 source "drivers/video/fbdev/mmp/Kconfig"
+
+source "drivers/video/fbdev/core/Kconfig"
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
new file mode 100644
index 000000000000..8e308d12c57b
--- /dev/null
+++ b/drivers/video/fbdev/core/Kconfig
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# fbdev core configuration
+#
+
+config FB_NOTIFY
+	bool
+
+config FIRMWARE_EDID
+	bool "Enable firmware EDID"
+	depends on FB
+	help
+	  This enables access to the EDID transferred from the firmware.
+	  On the i386, this is from the Video BIOS. Enable this if DDC/I2C
+	  transfers do not work for your driver and if you are using
+	  nvidiafb, i810fb or savagefb.
+
+	  In general, choosing Y for this option is safe.  If you
+	  experience extremely long delays while booting before you get
+	  something on your display, try setting this to N.  Matrox cards in
+	  combination with certain motherboards and monitors are known to
+	  suffer from this problem.
+
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
+config FB_DDC
+	tristate
+	depends on FB
+	select I2C_ALGOBIT
+	select I2C
+
+config FB_CFB_FILLRECT
+	tristate
+	depends on FB
+	help
+	  Include the cfb_fillrect function for generic software rectangle
+	  filling. This is used by drivers that don't provide their own
+	  (accelerated) version.
+
+config FB_CFB_COPYAREA
+	tristate
+	depends on FB
+	help
+	  Include the cfb_copyarea function for generic software area copying.
+	  This is used by drivers that don't provide their own (accelerated)
+	  version.
+
+config FB_CFB_IMAGEBLIT
+	tristate
+	depends on FB
+	help
+	  Include the cfb_imageblit function for generic software image
+	  blitting. This is used by drivers that don't provide their own
+	  (accelerated) version.
+
+config FB_CFB_REV_PIXELS_IN_BYTE
+	bool
+	depends on FB
+	help
+	  Allow generic frame-buffer functions to work on displays with 1, 2
+	  and 4 bits per pixel depths which has opposite order of pixels in
+	  byte order to bytes in long order.
+
+config FB_SYS_FILLRECT
+	tristate
+	depends on FB
+	help
+	  Include the sys_fillrect function for generic software rectangle
+	  filling. This is used by drivers that don't provide their own
+	  (accelerated) version and the framebuffer is in system RAM.
+
+config FB_SYS_COPYAREA
+	tristate
+	depends on FB
+	help
+	  Include the sys_copyarea function for generic software area copying.
+	  This is used by drivers that don't provide their own (accelerated)
+	  version and the framebuffer is in system RAM.
+
+config FB_SYS_IMAGEBLIT
+	tristate
+	depends on FB
+	help
+	  Include the sys_imageblit function for generic software image
+	  blitting. This is used by drivers that don't provide their own
+	  (accelerated) version and the framebuffer is in system RAM.
+
+config FB_PROVIDE_GET_FB_UNMAPPED_AREA
+	bool
+	depends on FB
+	help
+	  Allow generic frame-buffer to provide get_fb_unmapped_area
+	  function to provide shareable character device support on nommu.
+
+menuconfig FB_FOREIGN_ENDIAN
+	bool "Framebuffer foreign endianness support"
+	depends on FB
+	help
+	  This menu will let you enable support for the framebuffers with
+	  non-native endianness (e.g. Little-Endian framebuffer on a
+	  Big-Endian machine). Most probably you don't have such hardware,
+	  so it's safe to say "n" here.
+
+choice
+	prompt "Choice endianness support"
+	depends on FB_FOREIGN_ENDIAN
+
+config FB_BOTH_ENDIAN
+	bool "Support for Big- and Little-Endian framebuffers"
+
+config FB_BIG_ENDIAN
+	bool "Support for Big-Endian framebuffers only"
+
+config FB_LITTLE_ENDIAN
+	bool "Support for Little-Endian framebuffers only"
+
+endchoice
+
+config FB_SYS_FOPS
+	tristate
+	depends on FB
+
+config FB_DEFERRED_IO
+	bool
+	depends on FB
+
+config FB_IO_HELPERS
+	bool
+	depends on FB
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
+
+config FB_SYS_HELPERS
+	bool
+	depends on FB
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
+
+config FB_SYS_HELPERS_DEFERRED
+	bool
+	depends on FB
+	select FB_DEFERRED_IO
+	select FB_SYS_HELPERS
+
+config FB_HECUBA
+	tristate
+	depends on FB
+	depends on FB_DEFERRED_IO
+
+config FB_SVGALIB
+	tristate
+	depends on FB
+	help
+	  Common utility functions useful to fbdev drivers of VGA-based
+	  cards.
+
+config FB_MACMODES
+	tristate
+	depends on FB
+
+config FB_BACKLIGHT
+	tristate
+	depends on FB
+	select BACKLIGHT_CLASS_DEVICE
+
+config FB_MODE_HELPERS
+	bool "Enable Video Mode Handling Helpers"
+	depends on FB
+	help
+	  This enables functions for handling video modes using the
+	  Generalized Timing Formula and the EDID parser. A few drivers rely
+	  on this feature such as the radeonfb, rivafb, and the i810fb. If
+	  your driver does not take advantage of this feature, choosing Y will
+	  just increase the kernel size by about 5K.
+
+config FB_TILEBLITTING
+	bool "Enable Tile Blitting Support"
+	depends on FB
+	help
+	  This enables tile blitting.  Tile blitting is a drawing technique
+	  where the screen is divided into rectangular sections (tiles), whereas
+	  the standard blitting divides the screen into pixels. Because the
+	  default drawing element is a tile, drawing functions will be passed
+	  parameters in terms of number of tiles instead of number of pixels.
+	  For example, to draw a single character, instead of using bitmaps,
+	  an index to an array of bitmaps will be used.  To clear or move a
+	  rectangular section of a screen, the rectangle will be described in
+	  terms of number of tiles in the x- and y-axis.
+
+	  This is particularly important to one driver, matroxfb.  If
+	  unsure, say N.
-- 
2.41.0

