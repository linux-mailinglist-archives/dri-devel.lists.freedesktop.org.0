Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D41F6394
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D9689C3B;
	Thu, 11 Jun 2020 08:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F3789C6C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:28:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D284AAC7;
 Thu, 11 Jun 2020 08:28:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, noralf@tronnes.org,
 chen@aspeedtech.com
Subject: [PATCH 1/3] drm/ast: Remove unused code paths for AST 1180
Date: Thu, 11 Jun 2020 10:28:07 +0200
Message-Id: <20200611082809.7838-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611082809.7838-1-tzimmermann@suse.de>
References: <20200611082809.7838-1-tzimmermann@suse.de>
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

The ast driver contains code paths for AST 1180 chips. The chip is not
supported and the rsp code has never been tested. Simplify the driver by
removing the AST 1180 code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  |  1 -
 drivers/gpu/drm/ast/ast_drv.h  |  2 -
 drivers/gpu/drm/ast/ast_main.c | 89 +++++++++++++++-------------------
 drivers/gpu/drm/ast/ast_mode.c | 10 +---
 drivers/gpu/drm/ast/ast_post.c | 10 ++--
 5 files changed, 43 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index b7ba22dddcad9..83509106f3ba9 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -59,7 +59,6 @@ static struct drm_driver driver;
 static const struct pci_device_id pciidlist[] = {
 	AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
 	AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
-	/*	AST_VGA_DEVICE(PCI_CHIP_AST1180, NULL), - don't bind to 1180 for now */
 	{0, 0, 0},
 };
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 656d591b154b3..09f2659e29118 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -52,7 +52,6 @@
 
 #define PCI_CHIP_AST2000 0x2000
 #define PCI_CHIP_AST2100 0x2010
-#define PCI_CHIP_AST1180 0x1180
 
 
 enum ast_chip {
@@ -64,7 +63,6 @@ enum ast_chip {
 	AST2300,
 	AST2400,
 	AST2500,
-	AST1180,
 };
 
 enum ast_tx_chip {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index e5398e3dabe70..f48a9f62368c0 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -142,50 +142,42 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	ast_detect_config_mode(dev, &scu_rev);
 
 	/* Identify chipset */
-	if (dev->pdev->device == PCI_CHIP_AST1180) {
-		ast->chip = AST1100;
-		DRM_INFO("AST 1180 detected\n");
-	} else {
-		if (dev->pdev->revision >= 0x40) {
-			ast->chip = AST2500;
-			DRM_INFO("AST 2500 detected\n");
-		} else if (dev->pdev->revision >= 0x30) {
-			ast->chip = AST2400;
-			DRM_INFO("AST 2400 detected\n");
-		} else if (dev->pdev->revision >= 0x20) {
-			ast->chip = AST2300;
-			DRM_INFO("AST 2300 detected\n");
-		} else if (dev->pdev->revision >= 0x10) {
-			switch (scu_rev & 0x0300) {
-			case 0x0200:
-				ast->chip = AST1100;
-				DRM_INFO("AST 1100 detected\n");
-				break;
-			case 0x0100:
-				ast->chip = AST2200;
-				DRM_INFO("AST 2200 detected\n");
-				break;
-			case 0x0000:
-				ast->chip = AST2150;
-				DRM_INFO("AST 2150 detected\n");
-				break;
-			default:
-				ast->chip = AST2100;
-				DRM_INFO("AST 2100 detected\n");
-				break;
-			}
-			ast->vga2_clone = false;
-		} else {
-			ast->chip = AST2000;
-			DRM_INFO("AST 2000 detected\n");
+	if (dev->pdev->revision >= 0x40) {
+		ast->chip = AST2500;
+		DRM_INFO("AST 2500 detected\n");
+	} else if (dev->pdev->revision >= 0x30) {
+		ast->chip = AST2400;
+		DRM_INFO("AST 2400 detected\n");
+	} else if (dev->pdev->revision >= 0x20) {
+		ast->chip = AST2300;
+		DRM_INFO("AST 2300 detected\n");
+	} else if (dev->pdev->revision >= 0x10) {
+		switch (scu_rev & 0x0300) {
+		case 0x0200:
+			ast->chip = AST1100;
+			DRM_INFO("AST 1100 detected\n");
+			break;
+		case 0x0100:
+			ast->chip = AST2200;
+			DRM_INFO("AST 2200 detected\n");
+			break;
+		case 0x0000:
+			ast->chip = AST2150;
+			DRM_INFO("AST 2150 detected\n");
+			break;
+		default:
+			ast->chip = AST2100;
+			DRM_INFO("AST 2100 detected\n");
+			break;
 		}
+		ast->vga2_clone = false;
+	} else {
+		ast->chip = AST2000;
+		DRM_INFO("AST 2000 detected\n");
 	}
 
 	/* Check if we support wide screen */
 	switch (ast->chip) {
-	case AST1180:
-		ast->support_wide_screen = true;
-		break;
 	case AST2000:
 		ast->support_wide_screen = false;
 		break;
@@ -469,15 +461,13 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (need_post)
 		ast_post_gpu(dev);
 
-	if (ast->chip != AST1180) {
-		ret = ast_get_dram_info(dev);
-		if (ret)
-			goto out_free;
-		ast->vram_size = ast_get_vram_info(dev);
-		DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
-			 ast->mclk, ast->dram_type,
-			 ast->dram_bus_width, ast->vram_size);
-	}
+	ret = ast_get_dram_info(dev);
+	if (ret)
+		goto out_free;
+	ast->vram_size = ast_get_vram_info(dev);
+	DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
+		 ast->mclk, ast->dram_type,
+		 ast->dram_bus_width, ast->vram_size);
 
 	ret = ast_mm_init(ast);
 	if (ret)
@@ -496,8 +486,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	    ast->chip == AST2200 ||
 	    ast->chip == AST2300 ||
 	    ast->chip == AST2400 ||
-	    ast->chip == AST2500 ||
-	    ast->chip == AST1180) {
+	    ast->chip == AST2500) {
 		dev->mode_config.max_width = 1920;
 		dev->mode_config.max_height = 2048;
 	} else {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 7d39b858c9f1f..be0e2250708fa 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -768,9 +768,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct ast_private *ast = crtc->dev->dev_private;
 
-	if (ast->chip == AST1180)
-		return;
-
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
 	 */
@@ -797,11 +794,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	const struct drm_format_info *format;
 	bool succ;
 
-	if (ast->chip == AST1180) {
-		DRM_ERROR("AST 1180 modesetting not supported\n");
-		return -EINVAL;
-	}
-
 	if (!state->enable)
 		return 0; /* no mode checks if CRTC is being disabled */
 
@@ -1043,7 +1035,7 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 
 		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
 		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
-		    (ast->chip == AST2500) || (ast->chip == AST1180)) {
+		    (ast->chip == AST2500)) {
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
 				return MODE_OK;
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 2d1b186197432..af0c8ebb009a1 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -58,13 +58,9 @@ bool ast_is_vga_enabled(struct drm_device *dev)
 	struct ast_private *ast = dev->dev_private;
 	u8 ch;
 
-	if (ast->chip == AST1180) {
-		/* TODO 1180 */
-	} else {
-		ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
-		return !!(ch & 0x01);
-	}
-	return false;
+	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
+
+	return !!(ch & 0x01);
 }
 
 static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
