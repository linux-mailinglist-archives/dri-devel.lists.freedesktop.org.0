Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468802C83C7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FA489D79;
	Mon, 30 Nov 2020 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E70689D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05777ABD2;
 Mon, 30 Nov 2020 12:04:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 2/8] drm/ast: Only map cursor BOs during updates
Date: Mon, 30 Nov 2020 13:04:27 +0100
Message-Id: <20201130120433.7205-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
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

The HW cursor's BO used to be mapped permanently into the kernel's
address space. GEM's vmap operation will be protected by locks, and
we don't want to lock the BO's for an undefinate period of time.

Change the cursor code to map the HW BOs only during updates. The
vmap operation in VRAM helpers is cheap, as a once estabished mapping
is being reused until the BO actually moves. As the HW cursor BOs are
pinned, they never move at all.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 59 +++++++++++++++++---------------
 drivers/gpu/drm/ast/ast_drv.h    |  2 --
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 742d43a7edf4..c5892827b220 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -39,7 +39,6 @@ static void ast_cursor_fini(struct ast_private *ast)
 
 	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -53,14 +52,13 @@ static void ast_cursor_release(struct drm_device *dev, void *ptr)
 }
 
 /*
- * Allocate cursor BOs and pins them at the end of VRAM.
+ * Allocate cursor BOs and pin them at the end of VRAM.
  */
 int ast_cursor_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
 	int ret;
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
@@ -77,15 +75,7 @@ int ast_cursor_init(struct ast_private *ast)
 			drm_gem_vram_put(gbo);
 			goto err_drm_gem_vram_put;
 		}
-		ret = drm_gem_vram_vmap(gbo, &map);
-		if (ret) {
-			drm_gem_vram_unpin(gbo);
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
-
 		ast->cursor.gbo[i] = gbo;
-		ast->cursor.map[i] = map;
 	}
 
 	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
@@ -94,7 +84,6 @@ int ast_cursor_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -168,38 +157,43 @@ static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int h
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
-	int ret;
-	void *src;
+	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct dma_buf_map src_map, dst_map;
 	void __iomem *dst;
+	void *src;
+	int ret;
 
 	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	ret = drm_gem_vram_pin(gbo, 0);
+	ret = drm_gem_vram_pin(src_gbo, 0);
 	if (ret)
 		return ret;
-	ret = drm_gem_vram_vmap(gbo, &map);
+	ret = drm_gem_vram_vmap(src_gbo, &src_map);
 	if (ret)
-		goto err_drm_gem_vram_unpin;
-	src = map.vaddr; /* TODO: Use mapping abstraction properly */
+		goto err_drm_gem_vram_unpin_src;
+	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
+	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
+	if (ret)
+		goto err_drm_gem_vram_vunmap_src;
+	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(gbo, &map);
-	drm_gem_vram_unpin(gbo);
+	drm_gem_vram_vunmap(dst_gbo, &dst_map);
+	drm_gem_vram_vunmap(src_gbo, &src_map);
+	drm_gem_vram_unpin(src_gbo);
 
 	return 0;
 
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
+err_drm_gem_vram_vunmap_src:
+	drm_gem_vram_vunmap(src_gbo, &src_map);
+err_drm_gem_vram_unpin_src:
+	drm_gem_vram_unpin(src_gbo);
 	return ret;
 }
 
@@ -251,17 +245,26 @@ static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
 void ast_cursor_show(struct ast_private *ast, int x, int y,
 		     unsigned int offset_x, unsigned int offset_y)
 {
+	struct drm_device *dev = &ast->base;
+	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct dma_buf_map map;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
 	u8 jreg;
+	int ret;
 
-	dst = ast->cursor.map[ast->cursor.next_index].vaddr;
+	ret = drm_gem_vram_vmap(gbo, &map);
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+		return;
+	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
+	drm_gem_vram_vunmap(gbo, &map);
+
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
 		x = 0;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ccaff81924ee..f871fc36c2f7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -28,7 +28,6 @@
 #ifndef __AST_DRV_H__
 #define __AST_DRV_H__
 
-#include <linux/dma-buf-map.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/io.h>
@@ -133,7 +132,6 @@ struct ast_private {
 
 	struct {
 		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
-		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
 		unsigned int next_index;
 	} cursor;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
