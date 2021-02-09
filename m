Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBC314E30
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 12:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76BF6E040;
	Tue,  9 Feb 2021 11:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4C6E040
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 11:27:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FE06ADCA;
 Tue,  9 Feb 2021 11:27:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Drop DRM_GMA600 config option
Date: Tue,  9 Feb 2021 12:27:21 +0100
Message-Id: <20210209112721.3421-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/gma500/Kconfig   | 11 ++---------
 drivers/gpu/drm/gma500/Makefile  | 15 +++++++--------
 drivers/gpu/drm/gma500/psb_drv.c |  5 ++---
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index ec395658a43f..0cff20265f97 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -9,12 +9,5 @@ config DRM_GMA500
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
+	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
+	  Intel GMA3600/3650 (Cedar Trail).
diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 884ab1f9063e..ca5013246d7b 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -23,6 +23,12 @@ gma500_gfx-y += \
 	  intel_i2c.o \
 	  mid_bios.o \
 	  mmu.o \
+	  oaktrail_device.o \
+	  oaktrail_crtc.o \
+	  oaktrail_hdmi.o \
+	  oaktrail_hdmi_i2c.o \
+	  oaktrail_lvds.o \
+	  oaktrail_lvds_i2c.o \
 	  power.o \
 	  psb_device.o \
 	  psb_drv.o \
@@ -33,13 +39,6 @@ gma500_gfx-y += \
 	  psb_lid.o \
 	  psb_irq.o
 
-gma500_gfx-$(CONFIG_ACPI) +=  opregion.o \
-
-gma500_gfx-$(CONFIG_DRM_GMA600) += oaktrail_device.o \
-	  oaktrail_crtc.o \
-	  oaktrail_lvds.o \
-	  oaktrail_lvds_i2c.o \
-	  oaktrail_hdmi.o \
-	  oaktrail_hdmi_i2c.o
+gma500_gfx-$(CONFIG_ACPI) +=  opregion.o
 
 obj-$(CONFIG_DRM_GMA500) += gma500_gfx.o
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 0bcab065242c..538974c37adb 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -54,7 +54,7 @@ static const struct pci_device_id pciidlist[] = {
 	/* Poulsbo */
 	{ 0x8086, 0x8108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
 	{ 0x8086, 0x8109, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &psb_chip_ops },
-#if defined(CONFIG_DRM_GMA600)
+	/* Oak Trail */
 	{ 0x8086, 0x4100, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4101, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4102, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
@@ -64,8 +64,7 @@ static const struct pci_device_id pciidlist[] = {
 	{ 0x8086, 0x4106, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4107, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
 	{ 0x8086, 0x4108, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &oaktrail_chip_ops },
-#endif
-	/* Cedartrail */
+	/* Cedar Trail */
 	{ 0x8086, 0x0be0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
 	{ 0x8086, 0x0be2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (long) &cdv_chip_ops },
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
