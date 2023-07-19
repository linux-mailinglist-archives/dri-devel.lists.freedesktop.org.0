Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3D758FF5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCD310E418;
	Wed, 19 Jul 2023 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67BF10E416
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689754558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pd9+AMWEkVJOiciXCYw1Tf+rzcgyczWb3kQKGEiVtIU=;
 b=Pk0gClJeVyeHWy2EwVKtofxm57It6faEBsyQkrxq0oRa0KiVAw/smLaPJbK38jsLiIPOo/
 oluU2dtxQUe6BGg3QN7wiYshr5wZ0/MNKN/pxFD7MVXjmBFHTAocmmh0w/itattwBiveO+
 FFmMxbH6+UuOJrPgXxbUrG58jeYoaCI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-6e9q0OUUP_SVEBLTWRzKZw-1; Wed, 19 Jul 2023 04:15:57 -0400
X-MC-Unique: 6e9q0OUUP_SVEBLTWRzKZw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6f97c996dso62503871fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754556; x=1690359356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pd9+AMWEkVJOiciXCYw1Tf+rzcgyczWb3kQKGEiVtIU=;
 b=Erk5vtrzCLR2eLUkdk4YJD5LpKWRzTi7nzoQ0S2zruIFcBbMlESeiaJM+9s3GeqJoa
 ECSuJtYzvdxj/eu7jEvXfqd85fg79s1Qm37joqBCfWSvxLtqe/u70u64rIenW2OP5+Bd
 8zLKXexvFGEsZxdPD2AtrXpWF6yxNSmCH9Bqg0/EzYRIbuBdUmdvyz217mqSAdykyQbF
 EFkfxptrHWakrHA6pOjCUOb8qEeUB7rdvsBoMQMR80Y2Drhkhq+9eJdVJ+LGVACNO0Pf
 4KuWZ8+PEAPhqxKtge+irLW/oCKfgvG0aGt+EKlwoU9izqny11XFT74JN/HJs9LXKrYe
 UZbg==
X-Gm-Message-State: ABy/qLYU4CosNvXqiZX4fZpXZNmT9/OjmT8CvJpZGuGqliPpkhA7wRF0
 VFtZBLJMJiZ0DPCJwqm5UO/gBOKj4hWSAyWWHkllEuDmdVP3K43mFsIzfvxbDrNvjNDmxWBM/BQ
 eoLxIUf3AcTBeRA8ucc+RF/qeEBUj
X-Received: by 2002:a19:7b15:0:b0:4fd:b223:92c with SMTP id
 w21-20020a197b15000000b004fdb223092cmr1230920lfc.60.1689754555705; 
 Wed, 19 Jul 2023 01:15:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHno/1chUJTf1rjuNnYddw5kOcRZNwehqp+4sji7Jshm1BBprwe+2OopXrx1y3MX+ycvHs8DA==
X-Received: by 2002:a19:7b15:0:b0:4fd:b223:92c with SMTP id
 w21-20020a197b15000000b004fdb223092cmr1230906lfc.60.1689754555255; 
 Wed, 19 Jul 2023 01:15:55 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b0031423a8f4f7sm4574354wrv.56.2023.07.19.01.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] fbdev: Move core fbdev symbols to a separate Kconfig
 file
Date: Wed, 19 Jul 2023 10:15:36 +0200
Message-ID: <20230719081544.741051-3-javierm@redhat.com>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Arnd Bergmann <arnd@arndb.de>
---

Changes in v6:
- Don't move FB_{HECUBA,SVGALIB,MACMODES} to config/Kcore (Arnd Bergmann).

 drivers/video/fbdev/Kconfig      | 187 +------------------------------
 drivers/video/fbdev/core/Kconfig | 186 ++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+), 185 deletions(-)
 create mode 100644 drivers/video/fbdev/core/Kconfig

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c12c166be7d1..ed881d5b3ee0 100644
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
@@ -42,153 +39,6 @@ menuconfig FB
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
 config FB_HECUBA
 	tristate
 	depends on FB
@@ -205,41 +55,6 @@ config FB_MACMODES
 	tristate
 	depends on FB
 
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
@@ -2223,3 +2038,5 @@ config FB_SM712
 source "drivers/video/fbdev/omap/Kconfig"
 source "drivers/video/fbdev/omap2/Kconfig"
 source "drivers/video/fbdev/mmp/Kconfig"
+
+source "drivers/video/fbdev/core/Kconfig"
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
new file mode 100644
index 000000000000..fd3b7f5b4b7a
--- /dev/null
+++ b/drivers/video/fbdev/core/Kconfig
@@ -0,0 +1,186 @@
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

