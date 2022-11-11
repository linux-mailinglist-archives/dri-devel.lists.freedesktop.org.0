Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE36625B46
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16EC10E173;
	Fri, 11 Nov 2022 13:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DFA10E171
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 13:30:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5968D225E2;
 Fri, 11 Nov 2022 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668173427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsmIe2itMalpnjTqx7F0j8Kfs1ig+xRa9vcNN5sjkcw=;
 b=RjRGAmsV+cVg4JBos+BFFb4OcmgUtRzC9O/gVkTyKex+Q3Kj8FChwwA/bRcqNsUwA8hSPF
 vNKnGcjkd8lX7AselIwurgVxneNuAlWiJ1bilpkG5pzEXIvWw96Iolzq3KYy2b14SNokkr
 MbccM7/+GdUPv3kjsCj+CCeVM/7DN90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668173427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsmIe2itMalpnjTqx7F0j8Kfs1ig+xRa9vcNN5sjkcw=;
 b=SLcHbxD1/kWSxf3dE0PIkOHr+kKVJwtvQYkDBn1Hz1Ziqv+J5oso8CEsIN97KtThqyMUr6
 YOTQceH9gPsn0ZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2493313273;
 Fri, 11 Nov 2022 13:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iG8UCHNObmPCbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Nov 2022 13:30:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	javierm@redhat.com
Subject: [PATCH v2 2/2] fbdev: Add support for the nomodeset kernel parameter
Date: Fri, 11 Nov 2022 14:30:24 +0100
Message-Id: <20221111133024.9897-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221111133024.9897-1-tzimmermann@suse.de>
References: <20221111133024.9897-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support the kernel's nomodeset parameter for all PCI-based fbdev
drivers that use aperture helpers to remove other, hardware-agnostic
graphics drivers.

The parameter is a simple way of using the firmware-provided scanout
buffer if the hardware's native driver is broken. The same effect
could be achieved with per-driver options, but the importance of the
graphics output for many users makes a single, unified approach
worthwhile.

With nomodeset specified, the fbdev driver module will not load. This
unifies behavior with similar DRM drivers. In DRM helpers, modules
first check the nomodeset parameter before registering the PCI
driver. As fbdev has no such module helpers, we have to modify each
driver individually.

The name 'nomodeset' is slightly misleading, but has been chosen for
historical reasons. Several drivers implemented it before it became a
general option for DRM. So keeping the existing name was preferred over
introducing a new one.

v2:
	* print a warning if a driver does not init (Helge)
	* wrap video_firmware_drivers_only() in helper

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/staging/sm750fb/Kconfig              |  1 +
 drivers/staging/sm750fb/sm750.c              |  3 ++
 drivers/video/fbdev/Kconfig                  | 37 ++++++++++++++++++++
 drivers/video/fbdev/arkfb.c                  |  5 +++
 drivers/video/fbdev/asiliantfb.c             |  3 ++
 drivers/video/fbdev/aty/aty128fb.c           |  5 +++
 drivers/video/fbdev/aty/atyfb_base.c         |  5 +++
 drivers/video/fbdev/aty/radeon_base.c        |  5 +++
 drivers/video/fbdev/carminefb.c              |  3 ++
 drivers/video/fbdev/chipsfb.c                |  3 ++
 drivers/video/fbdev/cirrusfb.c               |  5 +++
 drivers/video/fbdev/core/fbmem.c             | 15 ++++++++
 drivers/video/fbdev/cyber2000fb.c            |  6 +++-
 drivers/video/fbdev/geode/Kconfig            |  3 ++
 drivers/video/fbdev/geode/gx1fb_core.c       |  5 +++
 drivers/video/fbdev/geode/gxfb_core.c        |  5 +++
 drivers/video/fbdev/geode/lxfb_core.c        |  5 +++
 drivers/video/fbdev/gxt4500.c                |  3 ++
 drivers/video/fbdev/hyperv_fb.c              |  4 ++-
 drivers/video/fbdev/i740fb.c                 |  5 +++
 drivers/video/fbdev/i810/i810_main.c         |  6 ++++
 drivers/video/fbdev/imsttfb.c                |  5 +++
 drivers/video/fbdev/intelfb/intelfbdrv.c     |  3 ++
 drivers/video/fbdev/kyro/fbdev.c             |  5 +++
 drivers/video/fbdev/matrox/matroxfb_base.c   |  3 ++
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c   |  3 ++
 drivers/video/fbdev/neofb.c                  |  5 +++
 drivers/video/fbdev/nvidia/nvidia.c          |  5 +++
 drivers/video/fbdev/pm2fb.c                  |  5 +++
 drivers/video/fbdev/pm3fb.c                  |  5 +++
 drivers/video/fbdev/pvr2fb.c                 |  5 +++
 drivers/video/fbdev/riva/fbdev.c             |  5 +++
 drivers/video/fbdev/s3fb.c                   |  5 +++
 drivers/video/fbdev/savage/savagefb_driver.c |  3 ++
 drivers/video/fbdev/sis/sis_main.c           |  5 +++
 drivers/video/fbdev/skeletonfb.c             |  5 +++
 drivers/video/fbdev/sm712fb.c                |  3 ++
 drivers/video/fbdev/sstfb.c                  |  3 ++
 drivers/video/fbdev/sunxvr2500.c             |  3 ++
 drivers/video/fbdev/sunxvr500.c              |  3 ++
 drivers/video/fbdev/tdfxfb.c                 |  5 +++
 drivers/video/fbdev/tgafb.c                  |  5 +++
 drivers/video/fbdev/tridentfb.c              |  5 +++
 drivers/video/fbdev/vermilion/vermilion.c    |  5 +++
 drivers/video/fbdev/via/via-core.c           |  3 ++
 drivers/video/fbdev/vt8623fb.c               |  5 +++
 include/linux/fb.h                           |  9 +++++
 47 files changed, 246 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/Kconfig b/drivers/staging/sm750fb/Kconfig
index 8c0d8a873d5b0..acb6c08d09dce 100644
--- a/drivers/staging/sm750fb/Kconfig
+++ b/drivers/staging/sm750fb/Kconfig
@@ -6,6 +6,7 @@ config FB_SM750
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for the Silicon Motion SM750 chip
 	  with 2D accelearion and dual head support.
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 168ae2e9005d7..effc7fcc3703f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1168,6 +1168,9 @@ static int __init lynxfb_init(void)
 {
 	char *option;
 
+	if (fb_modesetting_disabled("sm750fb"))
+		return -ENODEV;
+
 #ifdef MODULE
 	option = g_option;
 #else
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a98987aa27846..71019b167f8b0 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -227,6 +227,7 @@ config FB_CIRRUS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This enables support for Cirrus Logic GD542x/543x based boards on
 	  Amiga: SD64, Piccolo, Picasso II/II+, Picasso IV, or EGS Spectrum.
@@ -245,6 +246,7 @@ config FB_PM2
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for cards based on
 	  the 3D Labs Permedia, Permedia 2 and Permedia 2V chips.
@@ -340,6 +342,7 @@ config FB_CYBER2000
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This enables support for the Integraphics CyberPro 20x0 and 5000
 	  VGA chips used in the Rebel.com Netwinder and other machines.
@@ -504,6 +507,7 @@ config FB_CT65550
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Chips & Technologies
 	  65550 graphics chip in PowerBooks.
@@ -514,6 +518,7 @@ config FB_ASILIANT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Asiliant 69030 chipset
 
@@ -522,6 +527,7 @@ config FB_IMSTT
 	depends on (FB = y) && PCI
 	select FB_CFB_IMAGEBLIT
 	select FB_MACMODES if PPC_PMAC
+	select VIDEO_NOMODESET
 	help
 	  The IMS Twin Turbo is a PCI-based frame buffer card bundled with
 	  many Macintosh and compatible computers.
@@ -585,6 +591,7 @@ config FB_TGA
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select BITREVERSE
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for generic TGA and SFB+
 	  graphic cards.  These include DEC ZLXp-E1, -E2 and -E3 PCI cards,
@@ -777,6 +784,7 @@ config FB_XVR500
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-500 and similar
 	  graphics cards based upon the 3DLABS Wildcat chipset.  The driver
@@ -790,6 +798,7 @@ config FB_XVR2500
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the framebuffer device for the Sun XVR-2500 and similar
 	  graphics cards based upon the 3DLABS Wildcat chipset.  The driver
@@ -816,6 +825,7 @@ config FB_PVR2
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a PowerVR 2 card in your box.  If you plan to
 	  run linux on your Dreamcast, you will have to say Y here.
@@ -881,6 +891,7 @@ config FB_NVIDIA
 	select FB_CFB_IMAGEBLIT
 	select BITREVERSE
 	select VGASTATE
+	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the nVidia chips, TNT
 	  and newer. For very old chipsets, such as the RIVA128, then use
@@ -928,6 +939,7 @@ config FB_RIVA
 	select FB_CFB_IMAGEBLIT
 	select BITREVERSE
 	select VGASTATE
+	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the nVidia Riva/Geforce
 	  chips.
@@ -972,6 +984,7 @@ config FB_I740
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select VGASTATE
+	select VIDEO_NOMODESET
 	select FB_DDC
 	help
 	  This driver supports graphics cards based on Intel740 chip.
@@ -984,6 +997,7 @@ config FB_I810
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select VGASTATE
+	select VIDEO_NOMODESET
 	help
 	  This driver supports the on-board graphics built in to the Intel 810
 	  and 815 chipsets.  Say Y if you have and plan to use such a board.
@@ -1034,6 +1048,7 @@ config FB_LE80578
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This driver supports the LE80578 (Vermilion Range) chipset
 
@@ -1051,6 +1066,7 @@ config FB_INTEL
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select BOOT_VESA_SUPPORT if FB_INTEL = y
+	select VIDEO_NOMODESET
 	depends on !DRM_I915
 	help
 	  This driver supports the on-board graphics built in to the Intel
@@ -1088,6 +1104,7 @@ config FB_MATROX
 	select FB_CFB_IMAGEBLIT
 	select FB_TILEBLITTING
 	select FB_MACMODES if PPC_PMAC
+	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a Matrox Millennium, Matrox Millennium II,
 	  Matrox Mystique, Matrox Mystique 220, Matrox Productiva G100, Matrox
@@ -1208,6 +1225,7 @@ config FB_RADEON
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_MACMODES if PPC
+	select VIDEO_NOMODESET
 	help
 	  Choose this option if you want to use an ATI Radeon graphics card as
 	  a framebuffer device.  There are both PCI and AGP versions.  You
@@ -1247,6 +1265,7 @@ config FB_ATY128
 	select FB_CFB_IMAGEBLIT
 	select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
 	select FB_MACMODES if PPC_PMAC
+	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the ATI Rage128 chips.
 	  Say Y if you have such a graphics board and read
@@ -1271,6 +1290,7 @@ config FB_ATY
 	select FB_BACKLIGHT if FB_ATY_BACKLIGHT
 	select FB_MACMODES if PPC
 	select FB_ATY_CT if SPARC64 && PCI
+	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the ATI Mach64 chips.
 	  Say Y if you have such a graphics board.
@@ -1321,6 +1341,7 @@ config FB_S3
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
+	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for graphics boards with S3 Trio / S3 Virge chip.
@@ -1341,6 +1362,7 @@ config FB_SAVAGE
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select VGASTATE
+	select VIDEO_NOMODESET
 	help
 	  This driver supports notebooks and computers with S3 Savage PCI/AGP
 	  chips.
@@ -1379,6 +1401,7 @@ config FB_SIS
 	select FB_CFB_IMAGEBLIT
 	select BOOT_VESA_SUPPORT if FB_SIS = y
 	select FB_SIS_300 if !FB_SIS_315
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the SiS 300, 315, 330
 	  and 340 series as well as XGI V3XT, V5, V8, Z7 graphics chipsets.
@@ -1408,6 +1431,7 @@ config FB_VIA
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select I2C_ALGOBIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for Graphics chips of VIA
 	  UniChrome (Pro) Family (CLE266,PM800/CN400,P4M800CE/P4M800Pro/
@@ -1447,6 +1471,7 @@ config FB_NEOMAGIC
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select VGASTATE
+	select VIDEO_NOMODESET
 	help
 	  This driver supports notebooks with NeoMagic PCI chips.
 	  Say Y if you have such a graphics card.
@@ -1460,6 +1485,7 @@ config FB_KYRO
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a STG4000 / Kyro / PowerVR 3 based
 	  graphics board.
@@ -1474,6 +1500,7 @@ config FB_3DFX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_MODE_HELPERS
+	select VIDEO_NOMODESET
 	help
 	  This driver supports graphics boards with the 3Dfx Banshee,
 	  Voodoo3 or VSA-100 (aka Voodoo4/5) chips. Say Y if you have
@@ -1503,6 +1530,7 @@ config FB_VOODOO1
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Say Y here if you have a 3Dfx Voodoo Graphics (Voodoo1/sst1) or
 	  Voodoo2 (cvg) based graphics card.
@@ -1524,6 +1552,7 @@ config FB_VT8623
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
+	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for CastleRock integrated graphics core in the
@@ -1537,6 +1566,7 @@ config FB_TRIDENT
 	select FB_CFB_IMAGEBLIT
 	select FB_DDC
 	select FB_MODE_HELPERS
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for Trident PCI/AGP chipsets.
 	  Supported chipset families are TGUI 9440/96XX, 3DImage, Blade3D
@@ -1560,6 +1590,7 @@ config FB_ARK
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
+	select VIDEO_NOMODESET
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
 	help
 	  Driver for PCI graphics boards with ARK 2000PV chip
@@ -1571,6 +1602,7 @@ config FB_PM3
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the 3DLabs Permedia3
 	  chipset, used in Formac ProFormance III, 3DLabs Oxygen VX1 &
@@ -1583,6 +1615,7 @@ config FB_CARMINE
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  This is the frame buffer device driver for the Fujitsu Carmine chip.
 	  The driver provides two independent frame buffer devices.
@@ -1961,6 +1994,7 @@ config FB_IBM_GXT4500
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Say Y here to enable support for the IBM GXT4000P/6000P and
 	  GXT4500P/6500P display adaptor based on Raster Engine RC1000,
@@ -2101,6 +2135,7 @@ config FB_MB862XX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for Fujitsu Carmine/Coral-P(A)/Lime controllers.
 
@@ -2188,6 +2223,7 @@ config FB_HYPERV
 	select FB_CFB_IMAGEBLIT
 	select FB_DEFERRED_IO
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
+	select VIDEO_NOMODESET
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
@@ -2230,6 +2266,7 @@ config FB_SM712
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Frame buffer driver for the Silicon Motion SM710, SM712, SM721
 	  and SM722 chips.
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 5f8fec9e5fd4d..60a96fdb5dd8e 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1187,7 +1187,12 @@ static int __init arkfb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("arkfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("arkfb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 3818437a8f691..8383468f55775 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -616,6 +616,9 @@ static struct pci_driver asiliantfb_driver = {
 
 static int __init asiliantfb_init(void)
 {
+	if (fb_modesetting_disabled("asiliantfb"))
+		return -ENODEV;
+
 	if (fb_get_options("asiliantfb", NULL))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 57e398fe7a81c..dd31b9d7d337c 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2503,7 +2503,12 @@ static int aty128fb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("aty128fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("aty128fb", &option))
 		return -ENODEV;
 	aty128fb_setup(option);
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index b3463d1371520..0ccf5d401ecbc 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3965,7 +3965,12 @@ static int __init atyfb_init(void)
 	int err1 = 1, err2 = 1;
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("atyfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("atyfb", &option))
 		return -ENODEV;
 	atyfb_setup(option);
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 8b28c9bddd974..657064227de84 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2607,7 +2607,12 @@ static int __init radeonfb_init (void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("radeonfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("radeonfb", &option))
 		return -ENODEV;
 	radeonfb_setup(option);
diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index 4651b48a87f93..4ae21dbdb8caa 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -773,6 +773,9 @@ static struct pci_driver carmine_pci_driver = {
 
 static int __init carminefb_init(void)
 {
+	if (fb_modesetting_disabled("carminefb"))
+		return -ENODEV;
+
 	if (!(fb_displays &
 		(CARMINE_USE_DISPLAY0 | CARMINE_USE_DISPLAY1))) {
 		printk(KERN_ERR "If you disable both displays than you don't "
diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index f1c1c95c1fdf0..cc37ec3f8fc1f 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -506,6 +506,9 @@ static struct pci_driver chipsfb_driver = {
 
 int __init chips_init(void)
 {
+	if (fb_modesetting_disabled("chipsfb"))
+		return -ENODEV;
+
 	if (fb_get_options("chipsfb", NULL))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index b08bee43779ae..ba45e2147c52a 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2359,7 +2359,12 @@ static int __init cirrusfb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("cirrusfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("cirrusfb", &option))
 		return -ENODEV;
 	cirrusfb_setup(option);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1e70d8c676533..3a6c8458eb8d5 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -40,6 +40,7 @@
 
 #include <asm/fb.h>
 
+#include <video/nomodeset.h>
 #include <video/vga.h>
 
     /*
@@ -1844,4 +1845,18 @@ int fb_new_modelist(struct fb_info *info)
 	return 0;
 }
 
+#if defined(CONFIG_VIDEO_NOMODESET)
+bool fb_modesetting_disabled(const char *drvname)
+{
+	bool fwonly = video_firmware_drivers_only();
+
+	if (fwonly)
+		pr_warn("Driver %s not loading because of nomodeset parameter\n",
+			drvname);
+
+	return fwonly;
+}
+EXPORT_SYMBOL(fb_modesetting_disabled);
+#endif
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 31ff1da82c052..38c0a6866d760 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -48,7 +48,6 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
-
 #ifdef __arm__
 #include <asm/mach-types.h>
 #endif
@@ -1878,7 +1877,12 @@ static int __init cyber2000fb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
 
+	if (fb_modesetting_disabled("CyberPro"))
+		return -ENODEV;
+
+#ifndef MODULE
 	if (fb_get_options("cyber2000fb", &option))
 		return -ENODEV;
 	cyber2000fb_setup(option);
diff --git a/drivers/video/fbdev/geode/Kconfig b/drivers/video/fbdev/geode/Kconfig
index ac9c860592aaf..2f8f0fb1dae2f 100644
--- a/drivers/video/fbdev/geode/Kconfig
+++ b/drivers/video/fbdev/geode/Kconfig
@@ -15,6 +15,7 @@ config FB_GEODE_LX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode LX processors.
@@ -30,6 +31,7 @@ config FB_GEODE_GX
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode GX processors.
@@ -45,6 +47,7 @@ config FB_GEODE_GX1
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select VIDEO_NOMODESET
 	help
 	  Framebuffer driver for the display controller integrated into the
 	  AMD Geode GX1 processor.
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 1514c653a84fb..9c942001ac103 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -446,7 +446,12 @@ static int __init gx1fb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("gx1fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("gx1fb", &option))
 		return -ENODEV;
 	gx1fb_setup(option);
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 2527bd80ec5f5..8e05e76de0759 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -511,7 +511,12 @@ static int __init gxfb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("gxfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("gxfb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 9d26592dbfce9..8130e9eee2b4b 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -647,7 +647,12 @@ static int __init lxfb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("lxfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("lxfb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 0dcef4bec8d7c..5f42d3d9d6cef 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -779,6 +779,9 @@ static struct pci_driver gxt4500_driver = {
 
 static int gxt4500_init(void)
 {
+	if (fb_modesetting_disabled("gxt4500"))
+		return -ENODEV;
+
 #ifndef MODULE
 	if (fb_get_options("gxt4500", &mode_option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 072ce07ba9e05..d8edb5635f773 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -59,7 +59,6 @@
 
 #include <linux/hyperv.h>
 
-
 /* Hyper-V Synthetic Video Protocol definitions and structures */
 #define MAX_VMBUS_PKT_SIZE 0x4000
 
@@ -1363,6 +1362,9 @@ static int __init hvfb_drv_init(void)
 {
 	int ret;
 
+	if (fb_modesetting_disabled("hyper_fb"))
+		return -ENODEV;
+
 	ret = vmbus_driver_register(&hvfb_drv);
 	if (ret != 0)
 		return ret;
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index b795f6503cb67..3860b137b86a9 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1285,7 +1285,12 @@ static int __init i740fb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("i740fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("i740fb", &option))
 		return -ENODEV;
 	i740fb_setup(option);
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index ff09f8c20bfcb..85abb65f07d7d 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -2143,6 +2143,9 @@ static int i810fb_init(void)
 {
 	char *option = NULL;
 
+	if (fb_modesetting_disabled("i810fb"))
+		return -ENODEV;
+
 	if (fb_get_options("i810fb", &option))
 		return -ENODEV;
 	i810fb_setup(option);
@@ -2159,6 +2162,9 @@ static int i810fb_init(void)
 
 static int i810fb_init(void)
 {
+	if (fb_modesetting_disabled("i810fb"))
+		return -ENODEV;
+
 	hsync1 *= 1000;
 	hsync2 *= 1000;
 
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index d7edb9c5d3a3f..bea45647184e1 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1617,7 +1617,12 @@ static int __init imsttfb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("imsttfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("imsttfb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index d4a2891a9a7ac..0a9e5067b2010 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -389,6 +389,9 @@ static int __init intelfb_init(void)
 	if (idonly)
 		return -ENODEV;
 
+	if (fb_modesetting_disabled("intelfb"))
+		return -ENODEV;
+
 #ifndef MODULE
 	if (fb_get_options("intelfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index b4b93054c5208..0596573ef1400 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -789,7 +789,12 @@ static int __init kyrofb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("kyrofb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("kyrofb", &option))
 		return -ENODEV;
 	kyrofb_setup(option);
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 775d34115e2df..0d3cee7ae7268 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -2314,6 +2314,9 @@ static void __init matroxfb_init_params(void) {
 static int __init matrox_init(void) {
 	int err;
 
+	if (fb_modesetting_disabled("matroxfb"))
+		return -ENODEV;
+
 	matroxfb_init_params();
 	err = pci_register_driver(&matroxfb_driver);
 	dev = -1;	/* accept all new devices... */
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index 90c79e8c11570..a236fc9101484 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -1181,6 +1181,9 @@ static int mb862xxfb_init(void)
 {
 	int ret = -ENODEV;
 
+	if (fb_modesetting_disabled(DRV_NAME))
+		return -ENODEV;
+
 #if defined(CONFIG_FB_MB862XX_LIME)
 	ret = platform_driver_register(&of_platform_mb862xxfb_driver);
 #endif
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 93a2d2d1abe8f..39d8cdef5c97a 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -2209,7 +2209,12 @@ static int __init neofb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("neofb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("neofb", &option))
 		return -ENODEV;
 	neofb_setup(option);
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 329e2e8133c69..1960916098d46 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1521,7 +1521,12 @@ static int nvidiafb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("nvidiafb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("nvidiafb", &option))
 		return -ENODEV;
 	nvidiafb_setup(option);
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 7da715d31a933..0823c9de859a0 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1799,7 +1799,12 @@ static int __init pm2fb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("pm2fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("pm2fb", &option))
 		return -ENODEV;
 	pm2fb_setup(option);
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index ba69846d444f5..b46a471df9ae8 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -1540,7 +1540,12 @@ static int __init pm3fb_init(void)
 	 */
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("pm3fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("pm3fb", &option))
 		return -ENODEV;
 	pm3fb_setup(option);
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index b73ad14efa201..6888127a5eb88 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1082,7 +1082,12 @@ static int __init pvr2fb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("pvr2fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("pvr2fb", &option))
 		return -ENODEV;
 	pvr2fb_setup(option);
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 0ea74e28f9152..644278146d3b7 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2165,7 +2165,12 @@ static int rivafb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("rivafb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("rivafb", &option))
 		return -ENODEV;
 	rivafb_setup(option);
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 7713274bd04c2..7d257489edcc2 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1558,7 +1558,12 @@ static int __init s3fb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("s3fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("s3fb", &option))
 		return -ENODEV;
 	s3fb_setup(option);
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index b7818b652698f..4a27b68798bf5 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2556,6 +2556,9 @@ static int __init savagefb_init(void)
 
 	DBG("savagefb_init");
 
+	if (fb_modesetting_disabled("savagefb"))
+		return -ENODEV;
+
 	if (fb_get_options("savagefb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 1c197c3f95381..cfba776afcea6 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6588,7 +6588,12 @@ static int __init sisfb_init(void)
 {
 #ifndef MODULE
 	char *options = NULL;
+#endif
+
+	if (fb_modesetting_disabled("sisfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if(fb_get_options("sisfb", &options))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index a10f1057293b4..40c130ab6b38d 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -987,7 +987,12 @@ static int __init xxxfb_init(void)
 	 */
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("xxxfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("xxxfb", &option))
 		return -ENODEV;
 	xxxfb_setup(option);
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 3baf33635e65f..b528776c76125 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1756,6 +1756,9 @@ static int __init sm712fb_init(void)
 {
 	char *option = NULL;
 
+	if (fb_modesetting_disabled("sm712fb"))
+		return -ENODEV;
+
 	if (fb_get_options("sm712fb", &option))
 		return -ENODEV;
 	if (option && *option)
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index a56b24288566b..da296b2ab54a3 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1503,6 +1503,9 @@ static int sstfb_init(void)
 {
 	char *option = NULL;
 
+	if (fb_modesetting_disabled("sstfb"))
+		return -ENODEV;
+
 	if (fb_get_options("sstfb", &option))
 		return -ENODEV;
 	sstfb_setup(option);
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index f4059529c6024..2cab4b9be68aa 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -247,6 +247,9 @@ static struct pci_driver s3d_driver = {
 
 static int __init s3d_init(void)
 {
+	if (fb_modesetting_disabled("s3d"))
+		return -ENODEV;
+
 	if (fb_get_options("s3d", NULL))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index b0c8cf0c535a4..6ec358af12560 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -430,6 +430,9 @@ static struct pci_driver e3d_driver = {
 
 static int __init e3d_init(void)
 {
+	if (fb_modesetting_disabled("e3d"))
+		return -ENODEV;
+
 	if (fb_get_options("e3d", NULL))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 592a913d07189..d17e5e1472aa6 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1632,7 +1632,12 @@ static int __init tdfxfb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("tdfxfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("tdfxfb", &option))
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 251dbd282f5ed..14d37c49633c6 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -1597,7 +1597,12 @@ static int tgafb_init(void)
 	int status;
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("tgafb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("tgafb", &option))
 		return -ENODEV;
 	tgafb_setup(option);
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 219ce72923370..6099b9768ba16 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1811,7 +1811,12 @@ static int __init tridentfb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("tridentfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("tridentfb", &option))
 		return -ENODEV;
 	tridentfb_setup(option);
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index 82b36dbb5b1a9..1465fb7b619e1 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -1057,7 +1057,12 @@ static int __init vmlfb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("vmlfb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options(MODULE_NAME, &option))
 		return -ENODEV;
 #endif
diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 2ee8fcae08dfb..32a6399b080b1 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -725,6 +725,9 @@ static int __init via_core_init(void)
 {
 	int ret;
 
+	if (fb_modesetting_disabled("viafb"))
+		return -ENODEV;
+
 	ret = viafb_init();
 	if (ret)
 		return ret;
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 49b9f148d3a17..034333ee6e455 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -920,7 +920,12 @@ static int __init vt8623fb_init(void)
 
 #ifndef MODULE
 	char *option = NULL;
+#endif
+
+	if (fb_modesetting_disabled("vt8623fb"))
+		return -ENODEV;
 
+#ifndef MODULE
 	if (fb_get_options("vt8623fb", &option))
 		return -ENODEV;
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index bcb8658f5b64d..e6b8e7ad7ac80 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -803,6 +803,15 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
 			const struct fb_videomode *default_mode,
 			unsigned int default_bpp);
 
+#if defined(CONFIG_VIDEO_NOMODESET)
+bool fb_modesetting_disabled(const char *drvname);
+#else
+bool fb_modesetting_disabled(const char *drvname)
+{
+	return false;
+}
+#endif
+
 /* Convenience logging macros */
 #define fb_err(fb_info, fmt, ...)					\
 	pr_err("fb%d: " fmt, (fb_info)->node, ##__VA_ARGS__)
-- 
2.38.0

