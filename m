Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E750A75404B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EEC10E8BE;
	Fri, 14 Jul 2023 17:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A668910E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689355018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3RubCoS5fodtVjbVQMhDpySdYC1/vabLgYbQkOImtE=;
 b=NXOccLSVIyDl0gK86AVBg+H6GXxjofIu7/GfMbnDQKXS4/zgA52SZDkFpzz5XSyHwoAmZR
 OcvgZqQy+uPwu1/TpGHSgR7Q+LIRZV2WW+pV/Q94ZMejEB+hitvR1asjY8ytk7cgVyunQv
 A/WdMvgMIoy6EE2Fx4SDQrmYd64qukI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-fVHKsWZSP1KuJcyWdxwp1w-1; Fri, 14 Jul 2023 13:16:57 -0400
X-MC-Unique: fVHKsWZSP1KuJcyWdxwp1w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31421c900b7so1221729f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355016; x=1691947016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H3RubCoS5fodtVjbVQMhDpySdYC1/vabLgYbQkOImtE=;
 b=a4Me8JP9d1n797DtEAAuwNl2FuQRF9SGKYSocxjSII7pbCcqa2mH5zOMXHyOEgt+Zr
 nsWKBY6JLKvYaNTrX6qzgCViCrLtYoFLrRaLPnQztqSTl9EMz46IjVP4m8Kr74RnkJqP
 xV0jUTPfms0yv/n+M1KsUPPVC5FBrNVwI4FwOZ2722pvdX+mHAGsFBeatp0dAEHf7l7f
 sMQtNI/eZpLJVb5xalkzim7M1XaQ5jhe6CEjnVeYOlfftYBLjtbBPgPTjVUMruVXNf1T
 OywrX1PPZbMTpGWkleLkwg9pz9rx4XhprEuE12Ev/u+/VQYh09Y7ezzQa4/o4/44mojC
 9jHw==
X-Gm-Message-State: ABy/qLbQ7Vk2VMhW8aQXajtV3d58yvo3I+RUVkOoBQQxM1gNsFMMoenQ
 8g9V2vZlPNfbVRbCFL8hcoRX8A72t2H5z6ppaMMiYqKkoT7iC95St0OHd8yEexe7yBnPdZG50i2
 Oz3dCjVZB9WJe5zbWlXmpeOE+6ZkY
X-Received: by 2002:a5d:54c1:0:b0:314:1fdc:796d with SMTP id
 x1-20020a5d54c1000000b003141fdc796dmr4676260wrv.70.1689355015683; 
 Fri, 14 Jul 2023 10:16:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHHRAZzujl/c94U93qNlIMOzU61fF0eAqU8YJ67U+TsF0tH5w8Qj94bAtQ9nJJP8hnNd9iXZg==
X-Received: by 2002:a5d:54c1:0:b0:314:1fdc:796d with SMTP id
 x1-20020a5d54c1000000b003141fdc796dmr4676244wrv.70.1689355015281; 
 Fri, 14 Jul 2023 10:16:55 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003143cdc5949sm11620842wrm.9.2023.07.14.10.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:16:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] fbdev: Move core fbdev symbols to a separate Kconfig
 file
Date: Fri, 14 Jul 2023 19:16:30 +0200
Message-ID: <20230714171642.91185-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714171642.91185-1-javierm@redhat.com>
References: <20230714171642.91185-1-javierm@redhat.com>
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
index c12c166be7d1..ec4068abeb8e 100644
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
-	select FB_SYS_HELPERS_DEFERRED
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
@@ -2223,3 +2022,5 @@ config FB_SM712
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

