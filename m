Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9B21229B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D536EADB;
	Thu,  2 Jul 2020 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE266EAD8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81270BD75;
 Thu,  2 Jul 2020 11:50:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 14/14] drm/ast: Initialize mode setting in
 ast_mode_config_init()
Date: Thu,  2 Jul 2020 13:50:29 +0200
Message-Id: <20200702115029.5281-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
References: <20200702115029.5281-1-tzimmermann@suse.de>
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

There's modesetting init code in ast_main.c. Move it to ast_mode.c and
merge it with the modesetting init code in ast_mode_init(). The result
is ast_mode_config_init(), which initalizes the whole modesetting.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 35 +----------------------------
 drivers/gpu/drm/ast/ast_mode.c | 41 ++++++++++++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ad1d0b14ef12..c8c442e9efdc 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -286,7 +286,7 @@ struct ast_crtc_state {
 
 #define to_ast_crtc_state(state) container_of(state, struct ast_crtc_state, base)
 
-extern int ast_mode_init(struct drm_device *dev);
+int ast_mode_config_init(struct ast_private *ast);
 
 #define AST_MM_ALIGN_SHIFT 4
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2642e6d0152b..860a43a64b31 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -31,7 +31,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 
 #include "ast_drv.h"
@@ -379,13 +378,6 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_mode_config_funcs ast_mode_funcs = {
-	.fb_create = drm_gem_fb_create,
-	.mode_valid = drm_vram_helper_mode_valid,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
 static u32 ast_get_vram_info(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
@@ -473,35 +465,10 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_free;
 
-	ret = drmm_mode_config_init(dev);
-	if (ret)
-		goto out_free;
-
-	dev->mode_config.funcs = (void *)&ast_mode_funcs;
-	dev->mode_config.min_width = 0;
-	dev->mode_config.min_height = 0;
-	dev->mode_config.preferred_depth = 24;
-	dev->mode_config.prefer_shadow = 1;
-	dev->mode_config.fb_base = pci_resource_start(ast->dev->pdev, 0);
-
-	if (ast->chip == AST2100 ||
-	    ast->chip == AST2200 ||
-	    ast->chip == AST2300 ||
-	    ast->chip == AST2400 ||
-	    ast->chip == AST2500) {
-		dev->mode_config.max_width = 1920;
-		dev->mode_config.max_height = 2048;
-	} else {
-		dev->mode_config.max_width = 1600;
-		dev->mode_config.max_height = 1200;
-	}
-
-	ret = ast_mode_init(dev);
+	ret = ast_mode_config_init(ast);
 	if (ret)
 		goto out_free;
 
-	drm_mode_config_reset(dev);
-
 	return 0;
 out_free:
 	kfree(ast);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 33b4b6f3e394..154cd877d9d1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -1069,15 +1070,49 @@ static int ast_connector_init(struct drm_device *dev)
 	return 0;
 }
 
-int ast_mode_init(struct drm_device *dev)
+/*
+ * Mode config
+ */
+
+static const struct drm_mode_config_funcs ast_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.mode_valid = drm_vram_helper_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+int ast_mode_config_init(struct ast_private *ast)
 {
-	struct ast_private *ast = to_ast_private(dev);
+	struct drm_device *dev = ast->dev;
 	int ret;
 
 	ret = ast_cursor_init(ast);
 	if (ret)
 		return ret;
 
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.funcs = &ast_mode_config_funcs;
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.prefer_shadow = 1;
+	dev->mode_config.fb_base = pci_resource_start(ast->dev->pdev, 0);
+
+	if (ast->chip == AST2100 ||
+	    ast->chip == AST2200 ||
+	    ast->chip == AST2300 ||
+	    ast->chip == AST2400 ||
+	    ast->chip == AST2500) {
+		dev->mode_config.max_width = 1920;
+		dev->mode_config.max_height = 2048;
+	} else {
+		dev->mode_config.max_width = 1600;
+		dev->mode_config.max_height = 1200;
+	}
+
 	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
 	ret = drm_universal_plane_init(dev, &ast->primary_plane, 0x01,
 				       &ast_primary_plane_funcs,
@@ -1107,6 +1142,8 @@ int ast_mode_init(struct drm_device *dev)
 	ast_encoder_init(dev);
 	ast_connector_init(dev);
 
+	drm_mode_config_reset(dev);
+
 	return 0;
 }
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
