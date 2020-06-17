Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A561FC83C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 10:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BCF6EAAC;
	Wed, 17 Jun 2020 08:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97B6E373
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 08:03:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE61CB123;
 Wed, 17 Jun 2020 08:03:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 4/4] drm/ast: Use per-device logging macros
Date: Wed, 17 Jun 2020 10:03:40 +0200
Message-Id: <20200617080340.29584-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617080340.29584-1-tzimmermann@suse.de>
References: <20200617080340.29584-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts the ast driver to drm_info(), drm_err() and drm_WARN_*(). No
functional changes are made.

v2:
	* also convert WARN_*() macros

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/ast/ast_main.c | 34 +++++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_mode.c | 26 +++++++++++++++-----------
 drivers/gpu/drm/ast/ast_post.c |  2 +-
 drivers/gpu/drm/ast/ast_ttm.c  |  2 +-
 4 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3edfc6c92b9a..2eab19a9056f 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -79,7 +79,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 					scu_rev)) {
 		/* We do, disable P2A access */
 		ast->config_mode = ast_use_dt;
-		DRM_INFO("Using device-tree for configuration\n");
+		drm_info(dev, "Using device-tree for configuration\n");
 		return;
 	}
 
@@ -101,7 +101,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 			/* P2A works, grab silicon revision */
 			ast->config_mode = ast_use_p2a;
 
-			DRM_INFO("Using P2A bridge for configuration\n");
+			drm_info(dev, "Using P2A bridge for configuration\n");
 
 			/* Read SCU7c (silicon revision register) */
 			ast_write32(ast, 0xf004, 0x1e6e0000);
@@ -112,7 +112,7 @@ static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 	}
 
 	/* We have a P2A bridge but it's disabled */
-	DRM_INFO("P2A bridge disabled, using default configuration\n");
+	drm_info(dev, "P2A bridge disabled, using default configuration\n");
 }
 
 static int ast_detect_chip(struct drm_device *dev, bool *need_post)
@@ -128,7 +128,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	 */
 	if (!ast_is_vga_enabled(dev)) {
 		ast_enable_vga(dev);
-		DRM_INFO("VGA not enabled on entry, requesting chip POST\n");
+		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		*need_post = true;
 	} else
 		*need_post = false;
@@ -144,36 +144,36 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	/* Identify chipset */
 	if (dev->pdev->revision >= 0x40) {
 		ast->chip = AST2500;
-		DRM_INFO("AST 2500 detected\n");
+		drm_info(dev, "AST 2500 detected\n");
 	} else if (dev->pdev->revision >= 0x30) {
 		ast->chip = AST2400;
-		DRM_INFO("AST 2400 detected\n");
+		drm_info(dev, "AST 2400 detected\n");
 	} else if (dev->pdev->revision >= 0x20) {
 		ast->chip = AST2300;
-		DRM_INFO("AST 2300 detected\n");
+		drm_info(dev, "AST 2300 detected\n");
 	} else if (dev->pdev->revision >= 0x10) {
 		switch (scu_rev & 0x0300) {
 		case 0x0200:
 			ast->chip = AST1100;
-			DRM_INFO("AST 1100 detected\n");
+			drm_info(dev, "AST 1100 detected\n");
 			break;
 		case 0x0100:
 			ast->chip = AST2200;
-			DRM_INFO("AST 2200 detected\n");
+			drm_info(dev, "AST 2200 detected\n");
 			break;
 		case 0x0000:
 			ast->chip = AST2150;
-			DRM_INFO("AST 2150 detected\n");
+			drm_info(dev, "AST 2150 detected\n");
 			break;
 		default:
 			ast->chip = AST2100;
-			DRM_INFO("AST 2100 detected\n");
+			drm_info(dev, "AST 2100 detected\n");
 			break;
 		}
 		ast->vga2_clone = false;
 	} else {
 		ast->chip = AST2000;
-		DRM_INFO("AST 2000 detected\n");
+		drm_info(dev, "AST 2000 detected\n");
 	}
 
 	/* Check if we support wide screen */
@@ -248,13 +248,13 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	/* Print stuff for diagnostic purposes */
 	switch(ast->tx_chip_type) {
 	case AST_TX_SIL164:
-		DRM_INFO("Using Sil164 TMDS transmitter\n");
+		drm_info(dev, "Using Sil164 TMDS transmitter\n");
 		break;
 	case AST_TX_DP501:
-		DRM_INFO("Using DP501 DisplayPort transmitter\n");
+		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
 		break;
 	default:
-		DRM_INFO("Analog VGA only\n");
+		drm_info(dev, "Analog VGA only\n");
 	}
 	return 0;
 }
@@ -443,7 +443,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	 * and higher).
 	 */
 	if (!(pci_resource_flags(dev->pdev, 2) & IORESOURCE_IO)) {
-		DRM_INFO("platform has no IO space, trying MMIO\n");
+		drm_info(dev, "platform has no IO space, trying MMIO\n");
 		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
 	}
 
@@ -465,7 +465,7 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_free;
 	ast->vram_size = ast_get_vram_info(dev);
-	DRM_INFO("dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
+	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
 		 ast->mclk, ast->dram_type,
 		 ast->dram_bus_width, ast->vram_size);
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 650fe7efb638..510ffb497344 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -566,14 +566,15 @@ static void
 ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct ast_private *ast = to_ast_private(plane->dev);
+	struct drm_device *dev = plane->dev;
+	struct ast_private *ast = to_ast_private(dev);
 	struct drm_plane_state *state = plane->state;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
 
 	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
 	gpu_addr = drm_gem_vram_offset(gbo);
-	if (WARN_ON_ONCE(gpu_addr < 0))
+	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
 		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
 
 	ast_set_offset_reg(ast, state->fb);
@@ -620,6 +621,7 @@ static int
 ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state)
 {
+	struct drm_device *dev = plane->dev;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_gem_vram_object *gbo;
@@ -630,11 +632,11 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 	if (!crtc || !fb)
 		return 0;
 
-	if (WARN_ON_ONCE(fb->width > AST_MAX_HWC_WIDTH) ||
-	    WARN_ON_ONCE(fb->height > AST_MAX_HWC_HEIGHT))
+	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
+	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL; /* BUG: didn't test in atomic_check() */
 
-	ast = to_ast_private(crtc->dev);
+	ast = to_ast_private(dev);
 
 	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 	src = drm_gem_vram_vmap(gbo);
@@ -703,6 +705,7 @@ static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct drm_device *dev = plane->dev;
 	struct drm_plane_state *state = plane->state;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
@@ -719,7 +722,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 		/* A new cursor image was installed. */
 		gbo = ast->cursor.gbo[ast->cursor.next_index];
 		off = drm_gem_vram_offset(gbo);
-		if (WARN_ON_ONCE(off < 0))
+		if (drm_WARN_ON_ONCE(dev, off < 0))
 			return; /* Bug: we didn't pin cursor HW BO to VRAM. */
 		ast_cursor_set_base(ast, off);
 
@@ -898,8 +901,9 @@ static struct drm_crtc_state *
 ast_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct ast_crtc_state *new_ast_state, *ast_state;
+	struct drm_device *dev = crtc->dev;
 
-	if (WARN_ON(!crtc->state))
+	if (drm_WARN_ON(dev, !crtc->state))
 		return NULL;
 
 	new_ast_state = kmalloc(sizeof(*new_ast_state), GFP_KERNEL);
@@ -1105,7 +1109,7 @@ static int ast_connector_init(struct drm_device *dev)
 	connector = &ast_connector->base;
 	ast_connector->i2c = ast_i2c_create(dev);
 	if (!ast_connector->i2c)
-		DRM_ERROR("failed to add ddc bus for connector\n");
+		drm_err(dev, "failed to add ddc bus for connector\n");
 
 	drm_connector_init_with_ddc(dev, connector,
 				    &ast_connector_funcs,
@@ -1189,7 +1193,7 @@ int ast_mode_init(struct drm_device *dev)
 				       ARRAY_SIZE(ast_primary_plane_formats),
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
-		DRM_ERROR("ast: drm_universal_plane_init() failed: %d\n", ret);
+		drm_err(dev, "ast: drm_universal_plane_init() failed: %d\n", ret);
 		return ret;
 	}
 	drm_plane_helper_add(&ast->primary_plane,
@@ -1201,7 +1205,7 @@ int ast_mode_init(struct drm_device *dev)
 				       ARRAY_SIZE(ast_cursor_plane_formats),
 				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
 	if (ret) {
-		DRM_ERROR("drm_universal_plane_failed(): %d\n", ret);
+		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
 		return ret;
 	}
 	drm_plane_helper_add(&ast->cursor_plane,
@@ -1323,7 +1327,7 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	i2c->bit.getscl = get_clock;
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret) {
-		DRM_ERROR("Failed to register bit i2c\n");
+		drm_err(dev, "Failed to register bit i2c\n");
 		goto out_free;
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 226e1290227a..c043fe717553 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2067,7 +2067,7 @@ void ast_post_chip_2500(struct drm_device *dev)
 		}
 
 		if (!ast_dram_init_2500(ast))
-			DRM_ERROR("DRAM init failed !\n");
+			drm_err(dev, "DRAM init failed !\n");
 
 		temp = ast_mindwm(ast, 0x1e6e2040);
 		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index fad34106083a..9c3788a4c1c5 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -44,7 +44,7 @@ int ast_mm_init(struct ast_private *ast)
 		ast->vram_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
-		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
+		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
