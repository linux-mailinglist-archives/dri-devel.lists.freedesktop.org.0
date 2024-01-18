Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5583157B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0326A10E17E;
	Thu, 18 Jan 2024 09:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3799810E726
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:07:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CEB501F785;
 Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98FE81387C;
 Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UF0zJEvqqGWIMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 09:07:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH v2 3/3] video/nomodeset: Select nomodeset= parameter with
 CONFIG_VIDEO
Date: Thu, 18 Jan 2024 10:05:28 +0100
Message-ID: <20240118090721.7995-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118090721.7995-1-tzimmermann@suse.de>
References: <20240118090721.7995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CEB501F785
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable support for nomodeset= parameter via CONFIG_VIDEO. Both,
DRM and fbdev, already select this option. Remove the existing
option CONFIG_VIDEO_NOMODESET. Simplifies the Kconfig rules.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig           |  1 -
 drivers/staging/sm750fb/Kconfig   |  1 -
 drivers/video/Kconfig             |  4 ----
 drivers/video/Makefile            |  3 +--
 drivers/video/fbdev/Kconfig       | 37 -------------------------------
 drivers/video/fbdev/core/fbmem.c  |  2 --
 drivers/video/fbdev/geode/Kconfig |  3 ---
 include/linux/fb.h                |  7 ------
 8 files changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e519e1987613..872edb47bb53 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -20,7 +20,6 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
-	select VIDEO_NOMODESET
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index ab3d9b057d56..08bcccdd0f1c 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -6,7 +6,6 @@ config FB_SM750
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
 	  with 2D acceleration and dual head support.
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 253b129a82dc..130ebccb8338 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -22,10 +22,6 @@ config VIDEO
 	bool
 	default n
 
-config VIDEO_NOMODESET
-	bool
-	default n
-
 source "drivers/auxdisplay/Kconfig"
 
 if HAS_IOMEM
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 287c198f0c82..9eb5557911de 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -3,8 +3,7 @@
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_STI_CORE)            += sticore.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
-obj-$(CONFIG_VIDEO)               += cmdline.o
-obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
+obj-$(CONFIG_VIDEO)               += cmdline.o nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
 obj-$(CONFIG_VT)		  += console/
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d5909a9206ff..f15ba4b2f306 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -75,7 +75,6 @@ config FB_CIRRUS
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  This enables support for Cirrus Logic GD542x/543x based boards on
 	  Amiga: SD64, Piccolo, Picasso II/II+, Picasso IV, or EGS Spectrum.
@@ -95,7 +94,6 @@ config FB_PM2
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for cards based on
 	  the 3D Labs Permedia, Permedia 2 and Permedia 2V chips.
@@ -179,7 +177,6 @@ config FB_CYBER2000
 	tristate "CyberPro 2000/2010/5000 support"
 	depends on FB && PCI && (BROKEN || !SPARC64)
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This enables support for the Integraphics CyberPro 20x0 and 5000
 	  VGA chips used in the Rebel.com Netwinder and other machines.
@@ -330,7 +327,6 @@ config FB_CT65550
 	bool "Chips 65550 display support"
 	depends on (FB = y) && PPC32 && PCI
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Chips & Technologies
 	  65550 graphics chip in PowerBooks.
@@ -339,7 +335,6 @@ config FB_ASILIANT
 	bool "Asiliant (Chips) 69000 display support"
 	depends on (FB = y) && PCI
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Asiliant 69030 chipset
 
@@ -349,7 +344,6 @@ config FB_IMSTT
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC_PMAC
-	select VIDEO_NOMODESET
 	help
 	  The IMS Twin Turbo is a PCI-based frame buffer card bundled with
 	  many Macintosh and compatible computers.
@@ -414,7 +408,6 @@ config FB_TGA
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for generic TGA and SFB+
 	  graphic cards.  These include DEC ZLXp-E1, -E2 and -E3 PCI cards,
@@ -591,7 +584,6 @@ config FB_XVR500
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-500 and similar
 	  graphics cards based upon the 3DLABS Wildcat chipset.  The driver
@@ -603,7 +595,6 @@ config FB_XVR2500
 	bool "Sun XVR-2500 3DLABS Wildcat support"
 	depends on (FB = y) && PCI && SPARC64
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-2500 and similar
 	  graphics cards based upon the 3DLABS Wildcat chipset.  The driver
@@ -629,7 +620,6 @@ config FB_PVR2
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a PowerVR 2 card in your box.  If you plan to
 	  run linux on your Dreamcast, you will have to say Y here.
@@ -692,7 +682,6 @@ config FB_NVIDIA
 	select FB_IOMEM_FOPS
 	select BITREVERSE
 	select VGASTATE
-	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the nVidia chips, TNT
 	  and newer. For very old chipsets, such as the RIVA128, then use
@@ -741,7 +730,6 @@ config FB_RIVA
 	select FB_MODE_HELPERS
 	select BITREVERSE
 	select VGASTATE
-	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the nVidia Riva/Geforce
 	  chips.
@@ -784,7 +772,6 @@ config FB_I740
 	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
 	select VGASTATE
-	select VIDEO_NOMODESET
 	select FB_DDC
 	help
 	  This driver supports graphics cards based on Intel740 chip.
@@ -795,7 +782,6 @@ config FB_I810
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
 	select VGASTATE
-	select VIDEO_NOMODESET
 	help
 	  This driver supports the on-board graphics built in to the Intel 810
 	  and 815 chipsets.  Say Y if you have and plan to use such a board.
@@ -844,7 +830,6 @@ config FB_LE80578
 	depends on FB && PCI && X86
 	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This driver supports the LE80578 (Vermilion Range) chipset
 
@@ -863,7 +848,6 @@ config FB_INTEL
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
 	select BOOT_VESA_SUPPORT if FB_INTEL = y
-	select VIDEO_NOMODESET
 	depends on !DRM_I915
 	help
 	  This driver supports the on-board graphics built in to the Intel
@@ -902,7 +886,6 @@ config FB_MATROX
 	select FB_IOMEM_FOPS
 	select FB_TILEBLITTING
 	select FB_MACMODES if PPC_PMAC
-	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a Matrox Millennium, Matrox Millennium II,
 	  Matrox Mystique, Matrox Mystique 220, Matrox Productiva G100, Matrox
@@ -1025,7 +1008,6 @@ config FB_RADEON
 	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
 	select FB_MODE_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Choose this option if you want to use an ATI Radeon graphics card as
 	  a framebuffer device.  There are both PCI and AGP versions.  You
@@ -1063,7 +1045,6 @@ config FB_ATY128
 	select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
 	select FB_IOMEM_HELPERS
 	select FB_MACMODES if PPC_PMAC
-	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the ATI Rage128 chips.
 	  Say Y if you have such a graphics board and read
@@ -1089,7 +1070,6 @@ config FB_ATY
 	select FB_IOMEM_FOPS
 	select FB_MACMODES if PPC
 	select FB_ATY_CT if SPARC64 && PCI
-	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the ATI Mach64 chips.
 	  Say Y if you have such a graphics board.
@@ -1141,7 +1121,6 @@ config FB_S3
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
-	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for graphics boards with S3 Trio / S3 Virge chip.
@@ -1163,7 +1142,6 @@ config FB_SAVAGE
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
 	select VGASTATE
-	select VIDEO_NOMODESET
 	help
 	  This driver supports notebooks and computers with S3 Savage PCI/AGP
 	  chips.
@@ -1203,7 +1181,6 @@ config FB_SIS
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
 	select FB_SIS_300 if !FB_SIS_315
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the SiS 300, 315, 330
 	  and 340 series as well as XGI V3XT, V5, V8, Z7 graphics chipsets.
@@ -1234,7 +1211,6 @@ config FB_VIA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
 	select I2C_ALGOBIT
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for Graphics chips of VIA
 	  UniChrome (Pro) Family (CLE266,PM800/CN400,P4M800CE/P4M800Pro/
@@ -1275,7 +1251,6 @@ config FB_NEOMAGIC
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
 	select VGASTATE
-	select VIDEO_NOMODESET
 	help
 	  This driver supports notebooks with NeoMagic PCI chips.
 	  Say Y if you have such a graphics card.
@@ -1287,7 +1262,6 @@ config FB_KYRO
 	tristate "IMG Kyro support"
 	depends on FB && PCI
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a STG4000 / Kyro / PowerVR 3 based
 	  graphics board.
@@ -1303,7 +1277,6 @@ config FB_3DFX
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the 3Dfx Banshee,
 	  Voodoo3 or VSA-100 (aka Voodoo4/5) chips. Say Y if you have
@@ -1332,7 +1305,6 @@ config FB_VOODOO1
 	depends on FB && PCI
 	depends on FB_DEVICE
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a 3Dfx Voodoo Graphics (Voodoo1/sst1) or
 	  Voodoo2 (cvg) based graphics card.
@@ -1355,7 +1327,6 @@ config FB_VT8623
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
-	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for CastleRock integrated graphics core in the
@@ -1370,7 +1341,6 @@ config FB_TRIDENT
 	select FB_DDC
 	select FB_IOMEM_FOPS
 	select FB_MODE_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for Trident PCI/AGP chipsets.
 	  Supported chipset families are TGUI 9440/96XX, 3DImage, Blade3D
@@ -1395,7 +1365,6 @@ config FB_ARK
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
-	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for PCI graphics boards with ARK 2000PV chip
@@ -1408,7 +1377,6 @@ config FB_PM3
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the 3DLabs Permedia3
 	  chipset, used in Formac ProFormance III, 3DLabs Oxygen VX1 &
@@ -1419,7 +1387,6 @@ config FB_CARMINE
 	tristate "Fujitsu carmine frame buffer support"
 	depends on FB && PCI
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Fujitsu Carmine chip.
 	  The driver provides two independent frame buffer devices.
@@ -1701,7 +1668,6 @@ config FB_IBM_GXT4500
 	tristate "Framebuffer support for IBM GXT4000P/4500P/6000P/6500P adaptors"
 	depends on FB
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Say Y here to enable support for the IBM GXT4000P/6000P and
 	  GXT4500P/6500P display adaptor based on Raster Engine RC1000,
@@ -1819,7 +1785,6 @@ config FB_MB862XX
 	depends on FB
 	depends on PCI || (OF && PPC)
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for Fujitsu Carmine/Coral-P(A)/Lime controllers.
 
@@ -1885,7 +1850,6 @@ config FB_HYPERV
 	depends on FB && HYPERV
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
 	select FB_IOMEM_HELPERS_DEFERRED
-	select VIDEO_NOMODESET
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
@@ -1919,7 +1883,6 @@ config FB_SM712
 	tristate "Silicon Motion SM712 framebuffer support"
 	depends on FB && PCI
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for the Silicon Motion SM710, SM712, SM721
 	  and SM722 chips.
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index fc206755f5f6..48287366e0d4 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -645,7 +645,6 @@ int fb_new_modelist(struct fb_info *info)
 	return 0;
 }
 
-#if defined(CONFIG_VIDEO_NOMODESET)
 bool fb_modesetting_disabled(const char *drvname)
 {
 	bool fwonly = video_firmware_drivers_only();
@@ -657,6 +656,5 @@ bool fb_modesetting_disabled(const char *drvname)
 	return fwonly;
 }
 EXPORT_SYMBOL(fb_modesetting_disabled);
-#endif
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/geode/Kconfig b/drivers/video/fbdev/geode/Kconfig
index 9a49916e0492..3b20420cc94d 100644
--- a/drivers/video/fbdev/geode/Kconfig
+++ b/drivers/video/fbdev/geode/Kconfig
@@ -14,7 +14,6 @@ config FB_GEODE_LX
 	tristate "AMD Geode LX framebuffer support"
 	depends on FB && FB_GEODE
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode LX processors.
@@ -28,7 +27,6 @@ config FB_GEODE_GX
 	tristate "AMD Geode GX framebuffer support"
 	depends on FB && FB_GEODE
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode GX processors.
@@ -42,7 +40,6 @@ config FB_GEODE_GX1
 	tristate "AMD Geode GX1 framebuffer support"
 	depends on FB && FB_GEODE
 	select FB_IOMEM_HELPERS
-	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode GX1 processor.
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05dc9624897d..2ce2f5c2fca9 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -840,14 +840,7 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
 			const struct fb_videomode *default_mode,
 			unsigned int default_bpp);
 
-#if defined(CONFIG_VIDEO_NOMODESET)
 bool fb_modesetting_disabled(const char *drvname);
-#else
-static inline bool fb_modesetting_disabled(const char *drvname)
-{
-	return false;
-}
-#endif
 
 /*
  * Convenience logging macros
-- 
2.43.0

