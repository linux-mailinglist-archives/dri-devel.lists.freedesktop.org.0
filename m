Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F2212297
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653566EAD8;
	Thu,  2 Jul 2020 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2618A6EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2446BD8F;
 Thu,  2 Jul 2020 11:50:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 09/14] drm/ast: Keep cursor HW BOs mapped
Date: Thu,  2 Jul 2020 13:50:24 +0200
Message-Id: <20200702115029.5281-10-tzimmermann@suse.de>
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

Updating the image in a cursor's HW BO requires a mapping of the BO's
buffer in the kernel's address space. Cursor image updates can happen
frequently and create CPU overhead.

As cursor HW BOs are small and never move, they are now map exactly
once during the initialization and the mapping is used throughout the
driver's lifetime.

This change also removes a possible source of failures from
ast_cursor_show(). As the helper does not establish mappings, it cannot
fail. As a result, the cursor plane's atomic-update helper does not
call any failable interfaces. All failures are detected before trying
to update the cursor plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 44 +++++++++++++-------------------
 drivers/gpu/drm/ast/ast_drv.h    |  5 ++--
 2 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 5421241015d6..35680402e410 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -39,6 +39,7 @@ int ast_cursor_init(struct ast_private *ast)
 	struct drm_device *dev = ast->dev;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
+	void __iomem *vaddr;
 	int ret;
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
@@ -55,8 +56,16 @@ int ast_cursor_init(struct ast_private *ast)
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
+		vaddr = drm_gem_vram_vmap(gbo);
+		if (IS_ERR(vaddr)) {
+			ret = PTR_ERR(vaddr);
+			drm_gem_vram_unpin(gbo);
+			drm_gem_vram_put(gbo);
+			goto err_drm_gem_vram_put;
+		}
 
 		ast->cursor.gbo[i] = gbo;
+		ast->cursor.vaddr[i] = vaddr;
 	}
 
 	return 0;
@@ -65,9 +74,11 @@ int ast_cursor_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 		ast->cursor.gbo[i] = NULL;
+		ast->cursor.vaddr[i] = NULL;
 	}
 	return ret;
 }
@@ -79,6 +90,7 @@ void ast_cursor_fini(struct ast_private *ast)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_vunmap(gbo, ast->cursor.vaddr[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -154,7 +166,7 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	void *src;
-	void *dst;
+	void __iomem *dst;
 
 	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
@@ -171,28 +183,16 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 		goto err_drm_gem_vram_unpin;
 	}
 
-	dst = drm_gem_vram_vmap(ast->cursor.gbo[ast->cursor.next_index]);
-	if (IS_ERR(dst)) {
-		ret = PTR_ERR(dst);
-		goto err_drm_gem_vram_vunmap_src;
-	}
+	dst = ast->cursor.vaddr[ast->cursor.next_index];
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	/*
-	 * Always unmap buffers here. Destination buffers are
-	 * perma-pinned while the driver is active. We're only
-	 * changing ref-counters here.
-	 */
-	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
 	drm_gem_vram_vunmap(gbo, src);
 	drm_gem_vram_unpin(gbo);
 
 	return 0;
 
-err_drm_gem_vram_vunmap_src:
-	drm_gem_vram_vunmap(gbo, src);
 err_drm_gem_vram_unpin:
 	drm_gem_vram_unpin(gbo);
 	return ret;
@@ -243,18 +243,14 @@ static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, y1);
 }
 
-int ast_cursor_show(struct ast_private *ast, int x, int y,
-		    unsigned int offset_x, unsigned int offset_y)
+void ast_cursor_show(struct ast_private *ast, int x, int y,
+		     unsigned int offset_x, unsigned int offset_y)
 {
-	struct drm_gem_vram_object *gbo;
 	u8 x_offset, y_offset;
-	u8 *dst, *sig;
+	u8 __iomem *dst, __iomem *sig;
 	u8 jreg;
 
-	gbo = ast->cursor.gbo[ast->cursor.next_index];
-	dst = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(dst))
-		return PTR_ERR(dst);
+	dst = ast->cursor.vaddr[ast->cursor.next_index];
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
@@ -279,10 +275,6 @@ int ast_cursor_show(struct ast_private *ast, int x, int y,
 	jreg = 0x02 |
 	       0x01; /* enable ARGB4444 cursor */
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
-
-	drm_gem_vram_vunmap(gbo, dst);
-
-	return 0;
 }
 
 void ast_cursor_hide(struct ast_private *ast)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 92af0637ac48..f465e0c0984b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -116,6 +116,7 @@ struct ast_private {
 
 	struct {
 		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
+		void __iomem *vaddr[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
 
@@ -319,8 +320,8 @@ int ast_cursor_init(struct ast_private *ast);
 void ast_cursor_fini(struct ast_private *ast);
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_page_flip(struct ast_private *ast);
-int ast_cursor_show(struct ast_private *ast, int x, int y,
-		    unsigned int offset_x, unsigned int offset_y);
+void ast_cursor_show(struct ast_private *ast, int x, int y,
+		     unsigned int offset_x, unsigned int offset_y);
 void ast_cursor_hide(struct ast_private *ast);
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
