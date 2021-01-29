Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7FB308799
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 10:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B048A6EAB7;
	Fri, 29 Jan 2021 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024E36EAB5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:56:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91C2FAF45;
 Fri, 29 Jan 2021 09:56:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 3/5] drm/gma500: Drop DRM_GMA3600 config option
Date: Fri, 29 Jan 2021 10:56:02 +0100
Message-Id: <20210129095604.32423-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129095604.32423-1-tzimmermann@suse.de>
References: <20210129095604.32423-1-tzimmermann@suse.de>
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

With support for the MID-related chips removed, only support for
desktop chips is left in the driver. So just build the complete
driver if DRM_GMA500 has been selected. Anyone who wants to enable
the Poulsbo code would probably also want the Cedarview code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/Kconfig   | 13 +++----------
 drivers/gpu/drm/gma500/Makefile  | 25 ++++++++++++-------------
 drivers/gpu/drm/gma500/psb_drv.c |  4 ++--
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 6f41b88cf076..02de5970d490 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_GMA500
-	tristate "Intel GMA5/600 KMS Framebuffer"
+	tristate "Intel GMA500/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
 	select DRM_KMS_HELPER
 	select DRM_TTM
@@ -10,12 +10,5 @@ config DRM_GMA500
 	select INPUT if ACPI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
-	  Intel GMA500 ('Poulsbo') and other Intel IMG based graphics
-	  devices.
-
-config DRM_GMA3600
-	bool "Intel GMA3600/3650 support (Experimental)"
-	depends on DRM_GMA500
-	help
-	  Say yes to include basic support for Intel GMA3600/3650 (Intel
-	  Cedar Trail) platforms.
+	  Intel GMA500 ('Poulsbo') and Intel GMA3600/3650 (Intel
+	  Cedar Trail).
diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index b33dfef17849..04999757d402 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -6,33 +6,32 @@
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
 	  mmu.o \
-	  blitter.o \
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
-	  psb_device.o
+	  psb_lid.o
 
 gma500_gfx-$(CONFIG_ACPI) +=  opregion.o \
 
-gma500_gfx-$(CONFIG_DRM_GMA3600) +=  cdv_device.o \
-	  cdv_intel_crt.o \
-	  cdv_intel_display.o \
-	  cdv_intel_hdmi.o \
-	  cdv_intel_lvds.o \
-	  cdv_intel_dp.o
-
 obj-$(CONFIG_DRM_GMA500) += gma500_gfx.o
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index c3653975a6c4..c396324ff763 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -48,9 +48,10 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
  *                                  N2800
  */
 static const struct pci_device_id pciidlist[] = {
+	/* Poulsbo */
 	{ 0x8086, 0x8108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
 	{ 0x8086, 0x8109, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
-#if defined(CONFIG_DRM_GMA3600)
+	/* Cedartrail */
 	{ 0x8086, 0x0be0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
@@ -67,7 +68,6 @@ static const struct pci_device_id pciidlist[] = {
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
