Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3370212293
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D06EACD;
	Thu,  2 Jul 2020 11:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375D96EACD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D833EBD93;
 Thu,  2 Jul 2020 11:50:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 10/14] drm/ast: Managed cursor release
Date: Thu,  2 Jul 2020 13:50:25 +0200
Message-Id: <20200702115029.5281-11-tzimmermann@suse.de>
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

Register a release function to finalize cursors. The _fini() function
gets un-exported from the source file.

The function ast_mode_fini() is now empty and will be removed by a
later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 38 ++++++++++++++++++--------------
 drivers/gpu/drm/ast/ast_drv.h    |  1 -
 drivers/gpu/drm/ast/ast_mode.c   |  3 ---
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 35680402e410..acf0d23514e8 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -28,9 +28,30 @@
  */
 
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 
 #include "ast_drv.h"
 
+static void ast_cursor_fini(struct ast_private *ast)
+{
+	size_t i;
+	struct drm_gem_vram_object *gbo;
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+	}
+}
+
+static void ast_cursor_release(struct drm_device *dev, void *ptr)
+{
+	struct ast_private *ast = dev->dev_private;
+
+	ast_cursor_fini(ast);
+}
+
 /*
  * Allocate cursor BOs and pins them at the end of VRAM.
  */
@@ -68,7 +89,7 @@ int ast_cursor_init(struct ast_private *ast)
 		ast->cursor.vaddr[i] = vaddr;
 	}
 
-	return 0;
+	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
 
 err_drm_gem_vram_put:
 	while (i) {
@@ -77,25 +98,10 @@ int ast_cursor_init(struct ast_private *ast)
 		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
-		ast->cursor.gbo[i] = NULL;
-		ast->cursor.vaddr[i] = NULL;
 	}
 	return ret;
 }
 
-void ast_cursor_fini(struct ast_private *ast)
-{
-	size_t i;
-	struct drm_gem_vram_object *gbo;
-
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
-}
-
 static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
 {
 	union {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index f465e0c0984b..ea4de3dce2c4 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -317,7 +317,6 @@ void ast_release_firmware(struct drm_device *dev);
 
 /* ast_cursor.c */
 int ast_cursor_init(struct ast_private *ast);
-void ast_cursor_fini(struct ast_private *ast);
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_page_flip(struct ast_private *ast);
 void ast_cursor_show(struct ast_private *ast, int x, int y,
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8fdc46401814..4724a38c001a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1108,9 +1108,6 @@ int ast_mode_init(struct drm_device *dev)
 
 void ast_mode_fini(struct drm_device *dev)
 {
-	struct ast_private *ast = to_ast_private(dev);
-
-	ast_cursor_fini(ast);
 }
 
 static int get_clock(void *i2c_priv)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
