Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF030A9AB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428F66E5BE;
	Mon,  1 Feb 2021 14:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528C86E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB72AAD2E;
 Mon,  1 Feb 2021 14:25:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 2/4] drm/gma500: Drop DRM_GMA600 and DRM_GMA3600 config
 options
Date: Mon,  1 Feb 2021 15:25:32 +0100
Message-Id: <20210201142534.20364-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201142534.20364-1-tzimmermann@suse.de>
References: <20210201142534.20364-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With support for the MID-only Medfield chips removed, simply build
the complete driver if DRM_GMA500 has been selected. Anyone who wants
to enable one of the chips would probably also want the rest.

v2:
	* also drop CONFIG_DRM_GMA600

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/Kconfig   | 20 +++-------------
 drivers/gpu/drm/gma500/Makefile  | 40 +++++++++++++++-----------------
 drivers/gpu/drm/gma500/psb_drv.c |  7 +++---
 3 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index b05116f15d97..c1f6e12cd3ea 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_GMA500
-	tristate "Intel GMA5/600 KMS Framebuffer"
+	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
 	select DRM_TTM
@@ -10,19 +10,5 @@ config DRM_GMA500
 	select INPUT if ACPI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
-	  Intel GMA500 ('Poulsbo') and other Intel IMG based graphics
-	  devices.
-
-config DRM_GMA600
-	bool "Intel GMA600 support (Experimental)"
-	depends on DRM_GMA500
-	help
-	  Say yes to include support for GMA600 (Intel Moorestown/Oaktrail)
-	  platforms with LVDS ports. MIPI is not currently supported.
-
-config DRM_GMA3600
-	bool "Intel GMA3600/3650 support (Experimental)"
-	depends on DRM_GMA500
-	help
-	  Say yes to include basic support for Intel GMA3600/3650 (Intel
-	  Cedar Trail) platforms.
+	  Intel GMA500 ('Poulsbo'), Intel GMA600 (Moorestown/Oak Trail) and
+	  Intel GMA3600/3650 (Intel Cedar Trail).
diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index f7dded3784fb..0518cff60740 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -6,41 +6,39 @@
 gma500_gfx-y += \
 	  accel_2d.o \
 	  backlight.o \
+	  blitter.o \
+	  cdv_device.o \
+	  cdv_intel_crt.o \
+	  cdv_intel_display.o \
+	  cdv_intel_dp.o \
+	  cdv_intel_hdmi.o \
+	  cdv_intel_lvds.o \
 	  framebuffer.o \
 	  gem.o \
+	  gma_device.o \
+	  gma_display.o \
 	  gtt.o \
 	  intel_bios.o \
-	  intel_i2c.o \
 	  intel_gmbus.o \
+	  intel_i2c.o \
+	  mid_bios.o \
 	  mmu.o \
-	  blitter.o \
+	  oaktrail_crtc.o \
+	  oaktrail_device.o \
+	  oaktrail_hdmi.o \
+	  oaktrail_hdmi_i2c.o \
+	  oaktrail_lvds.o \
+	  oaktrail_lvds_i2c.o \
 	  power.o \
+	  psb_device.o \
 	  psb_drv.o \
-	  gma_display.o \
-	  gma_device.o \
 	  psb_intel_display.o \
 	  psb_intel_lvds.o \
 	  psb_intel_modes.o \
 	  psb_intel_sdvo.o \
-	  psb_lid.o \
 	  psb_irq.o \
-	  psb_device.o \
-	  mid_bios.o
+	  psb_lid.o
 
 gma500_gfx-$(CONFIG_ACPI) +=  opregion.o \
 
-gma500_gfx-$(CONFIG_DRM_GMA3600) +=  cdv_device.o \
-	  cdv_intel_crt.o \
-	  cdv_intel_display.o \
-	  cdv_intel_hdmi.o \
-	  cdv_intel_lvds.o \
-	  cdv_intel_dp.o
-
-gma500_gfx-$(CONFIG_DRM_GMA600) += oaktrail_device.o \
-	  oaktrail_crtc.o \
-	  oaktrail_lvds.o \
-	  oaktrail_lvds_i2c.o \
-	  oaktrail_hdmi.o \
-	  oaktrail_hdmi_i2c.o
-
 obj-$(CONFIG_DRM_GMA500) += gma500_gfx.o
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index b083b3f815b9..538974c37adb 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -51,9 +51,10 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
  *                                  N2800
  */
 static const struct pci_device_id pciidlist[] = {
+	/* Poulsbo */
 	{ 0x8086, 0x8108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
 	{ 0x8086, 0x8109, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
-#if defined(CONFIG_DRM_GMA600)
+	/* Oak Trail */
 	{ 0x8086, 0x4100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4101, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4102, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
@@ -63,8 +64,7 @@ static const struct pci_device_id pciidlist[] = {
 	{ 0x8086, 0x4106, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4107, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
-#endif
-#if defined(CONFIG_DRM_GMA3600)
+	/* Cedar Trail */
 	{ 0x8086, 0x0be0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
@@ -81,7 +81,6 @@ static const struct pci_device_id pciidlist[] = {
 	{ 0x8086, 0x0bed, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0bee, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0bef, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
-#endif
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
