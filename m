Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A62233059
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 12:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11166E8C3;
	Thu, 30 Jul 2020 10:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60336E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98B7CAFB4;
 Thu, 30 Jul 2020 10:29:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, lyude@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Subject: [PATCH v2 3/8] drm/mgag200: Initialize PCI registers early during
 device setup
Date: Thu, 30 Jul 2020 12:28:39 +0200
Message-Id: <20200730102844.10995-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730102844.10995-1-tzimmermann@suse.de>
References: <20200730102844.10995-1-tzimmermann@suse.de>
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

So far, PCI option registers were initialized as part of modesetting,
which is late in the process. As these registers control fundamental
operation, they should be set early.

The patch moves the PCI option handling into device register setup,
before even the device MMIO memory is being mapped. No functional
changes made.

Moving the PCI code next to the device-register setup also allows to
remove the has_sdram field from struct mga_device. The state is now
local to the init helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 32 +++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
 drivers/gpu/drm/mgag200/mgag200_mode.c | 41 --------------------------
 3 files changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index e50c682c4702..3dbb00045c24 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -60,8 +60,38 @@ static bool mgag200_has_sgram(struct mga_device *mdev)
 static int mgag200_regs_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
+	u32 option, option2;
+
+	switch (mdev->type) {
+	case G200_SE_A:
+	case G200_SE_B:
+		if (mgag200_has_sgram(mdev))
+			option |= PCI_MGA_OPTION_HARDPWMSK;
+		option2 = 0x00008000;
+		break;
+	case G200_WB:
+	case G200_EW3:
+		option = 0x41049120;
+		option2 = 0x0000b000;
+		break;
+	case G200_EV:
+		option = 0x00000120;
+		option2 = 0x0000b000;
+		break;
+	case G200_EH:
+	case G200_EH3:
+		option = 0x00000120;
+		option2 = 0x0000b000;
+		break;
+	default:
+		option = 0;
+		option2 = 0;
+	}
 
-	mdev->has_sdram = !mgag200_has_sgram(mdev);
+	if (option)
+		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION, option);
+	if (option2)
+		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION2, option2);
 
 	/* BAR 1 contains registers */
 	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 3817520bfefc..819c03cc626b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -161,7 +161,6 @@ struct mga_device {
 	size_t				vram_fb_available;
 
 	enum mga_type			type;
-	int				has_sdram;
 
 	int bpp_shifts[4];
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e0d037a7413c..3aa078e69a5a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/pci.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
@@ -877,45 +876,6 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 	WREG_ECRT(0x00, crtcext0);
 }
 
-static void mgag200_set_pci_regs(struct mga_device *mdev)
-{
-	uint32_t option = 0, option2 = 0;
-	struct drm_device *dev = &mdev->base;
-
-	switch (mdev->type) {
-	case G200_SE_A:
-	case G200_SE_B:
-		if (mdev->has_sdram)
-			option = 0x40049120;
-		else
-			option = 0x4004d120;
-		option2 = 0x00008000;
-		break;
-	case G200_WB:
-	case G200_EW3:
-		option = 0x41049120;
-		option2 = 0x0000b000;
-		break;
-	case G200_EV:
-		option = 0x00000120;
-		option2 = 0x0000b000;
-		break;
-	case G200_EH:
-	case G200_EH3:
-		option = 0x00000120;
-		option2 = 0x0000b000;
-		break;
-	case G200_ER:
-		break;
-	}
-
-	if (option)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION, option);
-
-	if (option2)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION2, option2);
-}
-
 static void mgag200_set_dac_regs(struct mga_device *mdev)
 {
 	size_t i;
@@ -988,7 +948,6 @@ static void mgag200_init_regs(struct mga_device *mdev)
 {
 	u8 crtc11, crtcext3, crtcext4, misc;
 
-	mgag200_set_pci_regs(mdev);
 	mgag200_set_dac_regs(mdev);
 
 	WREG_SEQ(2, 0x0f);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
