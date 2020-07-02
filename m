Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0415421228F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656216E1BE;
	Thu,  2 Jul 2020 11:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B26EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E100BD77;
 Thu,  2 Jul 2020 11:50:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 02/14] drm/ast: Pass struct ast_private instance to cursor
 init/fini functions
Date: Thu,  2 Jul 2020 13:50:17 +0200
Message-Id: <20200702115029.5281-3-tzimmermann@suse.de>
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

Removes some typecasting.

v2:
	* use to_ast_private() instead of struct drm_device.dev_private

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_cursor.c | 7 +++----
 drivers/gpu/drm/ast/ast_drv.h    | 4 ++--
 drivers/gpu/drm/ast/ast_mode.c   | 6 ++++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 53bb6eebc7cd..1d4f51a7fe22 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -34,9 +34,9 @@
 /*
  * Allocate cursor BOs and pins them at the end of VRAM.
  */
-int ast_cursor_init(struct drm_device *dev)
+int ast_cursor_init(struct ast_private *ast)
 {
-	struct ast_private *ast = to_ast_private(dev);
+	struct drm_device *dev = ast->dev;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
 	int ret;
@@ -72,9 +72,8 @@ int ast_cursor_init(struct drm_device *dev)
 	return ret;
 }
 
-void ast_cursor_fini(struct drm_device *dev)
+void ast_cursor_fini(struct ast_private *ast)
 {
-	struct ast_private *ast = to_ast_private(dev);
 	size_t i;
 	struct drm_gem_vram_object *gbo;
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 245ed2e2d775..f7b120f862a8 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -316,8 +316,8 @@ void ast_init_3rdtx(struct drm_device *dev);
 void ast_release_firmware(struct drm_device *dev);
 
 /* ast_cursor.c */
-int ast_cursor_init(struct drm_device *dev);
-void ast_cursor_fini(struct drm_device *dev);
+int ast_cursor_init(struct ast_private *ast);
+void ast_cursor_fini(struct ast_private *ast);
 int ast_cursor_update(void *dst, void *src, unsigned int width,
 		      unsigned int height);
 void ast_cursor_set_base(struct ast_private *ast, u64 address);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c8399699d773..e69965f5636d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1149,7 +1149,7 @@ int ast_mode_init(struct drm_device *dev)
 	drm_plane_helper_add(&ast->cursor_plane,
 			     &ast_cursor_plane_helper_funcs);
 
-	ast_cursor_init(dev);
+	ast_cursor_init(ast);
 	ast_crtc_init(dev);
 	ast_encoder_init(dev);
 	ast_connector_init(dev);
@@ -1159,7 +1159,9 @@ int ast_mode_init(struct drm_device *dev)
 
 void ast_mode_fini(struct drm_device *dev)
 {
-	ast_cursor_fini(dev);
+	struct ast_private *ast = to_ast_private(dev);
+
+	ast_cursor_fini(ast);
 }
 
 static int get_clock(void *i2c_priv)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
