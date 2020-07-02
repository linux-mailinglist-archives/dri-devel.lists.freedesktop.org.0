Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D2212292
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54B66EAC3;
	Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29C66E1BE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9925BD78;
 Thu,  2 Jul 2020 11:50:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 03/14] drm/ast: Move cursor fb pinning and mapping into
 helper
Date: Thu,  2 Jul 2020 13:50:18 +0200
Message-Id: <20200702115029.5281-4-tzimmermann@suse.de>
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

The new helper ast_cursor_blit() updates a cursor's backbuffer HW
BO from a framebuffer structure. The cursor plane's prepare_fb()
function now uses the new interface.

Pinning and mapping of BOs is done automatically by the helper. This
includes the source BO, which was not pinned by the original code in
prepare_fb().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 57 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/ast/ast_drv.h    |  3 +-
 drivers/gpu/drm/ast/ast_mode.c   | 41 ++---------------------
 3 files changed, 59 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 1d4f51a7fe22..8f94d4712f66 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -140,8 +140,8 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 	return csum;
 }
 
-int ast_cursor_update(void *dst, void *src, unsigned int width,
-		      unsigned int height)
+static int ast_cursor_update(void *dst, void *src, unsigned int width,
+			     unsigned int height)
 {
 	u32 csum;
 
@@ -159,6 +159,59 @@ int ast_cursor_update(void *dst, void *src, unsigned int width,
 	return 0;
 }
 
+int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
+{
+	struct drm_device *dev = ast->dev;
+	struct drm_gem_vram_object *gbo;
+	int ret;
+	void *src;
+	void *dst;
+
+	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
+	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
+		return -EINVAL;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	ret = drm_gem_vram_pin(gbo, 0);
+	if (ret)
+		return ret;
+	src = drm_gem_vram_vmap(gbo);
+	if (IS_ERR(src)) {
+		ret = PTR_ERR(src);
+		goto err_drm_gem_vram_unpin;
+	}
+
+	dst = drm_gem_vram_vmap(ast->cursor.gbo[ast->cursor.next_index]);
+	if (IS_ERR(dst)) {
+		ret = PTR_ERR(dst);
+		goto err_drm_gem_vram_vunmap_src;
+	}
+
+	ret = ast_cursor_update(dst, src, fb->width, fb->height);
+	if (ret)
+		goto err_drm_gem_vram_vunmap_dst;
+
+	/*
+	 * Always unmap buffers here. Destination buffers are
+	 * perma-pinned while the driver is active. We're only
+	 * changing ref-counters here.
+	 */
+	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
+	drm_gem_vram_vunmap(gbo, src);
+	drm_gem_vram_unpin(gbo);
+
+	return 0;
+
+err_drm_gem_vram_vunmap_dst:
+	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
+err_drm_gem_vram_vunmap_src:
+	drm_gem_vram_vunmap(gbo, src);
+err_drm_gem_vram_unpin:
+	drm_gem_vram_unpin(gbo);
+	return ret;
+}
+
 void ast_cursor_set_base(struct ast_private *ast, u64 address)
 {
 	u8 addr0 = (address >> 3) & 0xff;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index f7b120f862a8..9bc1bb76ec91 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -318,8 +318,7 @@ void ast_release_firmware(struct drm_device *dev);
 /* ast_cursor.c */
 int ast_cursor_init(struct ast_private *ast);
 void ast_cursor_fini(struct ast_private *ast);
-int ast_cursor_update(void *dst, void *src, unsigned int width,
-		      unsigned int height);
+int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_set_base(struct ast_private *ast, u64 address);
 int ast_cursor_move(struct drm_crtc *crtc, int x, int y);
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e69965f5636d..701211050832 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -611,56 +611,21 @@ static int
 ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state)
 {
-	struct drm_device *dev = plane->dev;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_crtc *crtc = new_state->crtc;
-	struct drm_gem_vram_object *gbo;
 	struct ast_private *ast;
 	int ret;
-	void *src, *dst;
 
 	if (!crtc || !fb)
 		return 0;
 
-	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
-	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
-		return -EINVAL; /* BUG: didn't test in atomic_check() */
-
-	ast = to_ast_private(dev);
-
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	src = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(src)) {
-		ret = PTR_ERR(src);
-		goto err_drm_gem_vram_unpin;
-	}
-
-	dst = drm_gem_vram_vmap(ast->cursor.gbo[ast->cursor.next_index]);
-	if (IS_ERR(dst)) {
-		ret = PTR_ERR(dst);
-		goto err_drm_gem_vram_vunmap_src;
-	}
+	ast = to_ast_private(plane->dev);
 
-	ret = ast_cursor_update(dst, src, fb->width, fb->height);
+	ret = ast_cursor_blit(ast, fb);
 	if (ret)
-		goto err_drm_gem_vram_vunmap_dst;
-
-	/* Always unmap buffers here. Destination buffers are
-	 * perma-pinned while the driver is active. We're only
-	 * changing ref-counters here.
-	 */
-	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
-	drm_gem_vram_vunmap(gbo, src);
+		return ret;
 
 	return 0;
-
-err_drm_gem_vram_vunmap_dst:
-	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
-err_drm_gem_vram_vunmap_src:
-	drm_gem_vram_vunmap(gbo, src);
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-	return ret;
 }
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
