Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187E204C26
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4E76E97C;
	Tue, 23 Jun 2020 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1496E96C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:19:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D61D8ADCA;
 Tue, 23 Jun 2020 08:19:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 01/14] drm/ast: Move cursor functions to ast_cursor.c
Date: Tue, 23 Jun 2020 10:18:48 +0200
Message-Id: <20200623081901.10667-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623081901.10667-1-tzimmermann@suse.de>
References: <20200623081901.10667-1-tzimmermann@suse.de>
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

The cursor manipulation functions are unrelated to modesetting. Move
them into their own file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile     |   3 +-
 drivers/gpu/drm/ast/ast_cursor.c | 218 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h    |   9 ++
 drivers/gpu/drm/ast/ast_mode.c   | 195 ---------------------------
 4 files changed, 229 insertions(+), 196 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 561f7c4199e4..6a5b3b247316 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ast-y := ast_drv.o ast_main.o ast_mode.o ast_ttm.o ast_post.o ast_dp501.o
+ast-y := ast_cursor.o ast_drv.o ast_main.o ast_mode.o ast_ttm.o ast_post.o \
+	 ast_dp501.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
new file mode 100644
index 000000000000..53bb6eebc7cd
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -0,0 +1,218 @@
+/*
+ * Copyright 2012 Red Hat Inc.
+ * Parts based on xf86-video-ast
+ * Copyright (c) 2005 ASPEED Technology Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+/*
+ * Authors: Dave Airlie <airlied@redhat.com>
+ */
+
+#include <drm/drm_gem_vram_helper.h>
+
+#include "ast_drv.h"
+
+/*
+ * Allocate cursor BOs and pins them at the end of VRAM.
+ */
+int ast_cursor_init(struct drm_device *dev)
+{
+	struct ast_private *ast = to_ast_private(dev);
+	size_t size, i;
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
+	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = drm_gem_vram_create(dev, size, 0);
+		if (IS_ERR(gbo)) {
+			ret = PTR_ERR(gbo);
+			goto err_drm_gem_vram_put;
+		}
+		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+		if (ret) {
+			drm_gem_vram_put(gbo);
+			goto err_drm_gem_vram_put;
+		}
+
+		ast->cursor.gbo[i] = gbo;
+	}
+
+	return 0;
+
+err_drm_gem_vram_put:
+	while (i) {
+		--i;
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+		ast->cursor.gbo[i] = NULL;
+	}
+	return ret;
+}
+
+void ast_cursor_fini(struct drm_device *dev)
+{
+	struct ast_private *ast = to_ast_private(dev);
+	size_t i;
+	struct drm_gem_vram_object *gbo;
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+	}
+}
+
+static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
+{
+	union {
+		u32 ul;
+		u8 b[4];
+	} srcdata32[2], data32;
+	union {
+		u16 us;
+		u8 b[2];
+	} data16;
+	u32 csum = 0;
+	s32 alpha_dst_delta, last_alpha_dst_delta;
+	u8 *srcxor, *dstxor;
+	int i, j;
+	u32 per_pixel_copy, two_pixel_copy;
+
+	alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
+	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
+
+	srcxor = src;
+	dstxor = (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
+	per_pixel_copy = width & 1;
+	two_pixel_copy = width >> 1;
+
+	for (j = 0; j < height; j++) {
+		for (i = 0; i < two_pixel_copy; i++) {
+			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
+			srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
+			data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
+			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
+			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
+			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
+
+			writel(data32.ul, dstxor);
+			csum += data32.ul;
+
+			dstxor += 4;
+			srcxor += 8;
+
+		}
+
+		for (i = 0; i < per_pixel_copy; i++) {
+			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
+			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
+			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
+			writew(data16.us, dstxor);
+			csum += (u32)data16.us;
+
+			dstxor += 2;
+			srcxor += 4;
+		}
+		dstxor += last_alpha_dst_delta;
+	}
+	return csum;
+}
+
+int ast_cursor_update(void *dst, void *src, unsigned int width,
+		      unsigned int height)
+{
+	u32 csum;
+
+	/* do data transfer to cursor cache */
+	csum = copy_cursor_image(src, dst, width, height);
+
+	/* write checksum + signature */
+	dst += AST_HWC_SIZE;
+	writel(csum, dst);
+	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
+	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
+	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
+	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
+
+	return 0;
+}
+
+void ast_cursor_set_base(struct ast_private *ast, u64 address)
+{
+	u8 addr0 = (address >> 3) & 0xff;
+	u8 addr1 = (address >> 11) & 0xff;
+	u8 addr2 = (address >> 19) & 0xff;
+
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, addr0);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, addr1);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
+}
+
+int ast_cursor_move(struct drm_crtc *crtc, int x, int y)
+{
+	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
+	struct ast_private *ast = to_ast_private(crtc->dev);
+	struct drm_gem_vram_object *gbo;
+	int x_offset, y_offset;
+	u8 *dst, *sig;
+	u8 jreg;
+
+	gbo = ast->cursor.gbo[ast->cursor.next_index];
+	dst = drm_gem_vram_vmap(gbo);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+
+	sig = dst + AST_HWC_SIZE;
+	writel(x, sig + AST_HWC_SIGNATURE_X);
+	writel(y, sig + AST_HWC_SIGNATURE_Y);
+
+	x_offset = ast_crtc->offset_x;
+	y_offset = ast_crtc->offset_y;
+	if (x < 0) {
+		x_offset = (-x) + ast_crtc->offset_x;
+		x = 0;
+	}
+
+	if (y < 0) {
+		y_offset = (-y) + ast_crtc->offset_y;
+		y = 0;
+	}
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, (x & 0xff));
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, ((x >> 8) & 0x0f));
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, (y & 0xff));
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
+
+	/* dummy write to fire HWC */
+	jreg = 0x02 |
+	       0x01; /* enable ARGB4444 cursor */
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
+
+	drm_gem_vram_vunmap(gbo, dst);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c44c1376c697..245ed2e2d775 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -314,4 +314,13 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
 void ast_release_firmware(struct drm_device *dev);
+
+/* ast_cursor.c */
+int ast_cursor_init(struct drm_device *dev);
+void ast_cursor_fini(struct drm_device *dev);
+int ast_cursor_update(void *dst, void *src, unsigned int width,
+		      unsigned int height);
+void ast_cursor_set_base(struct ast_private *ast, u64 address);
+int ast_cursor_move(struct drm_crtc *crtc, int x, int y);
+
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 510ffb497344..c8399699d773 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -47,16 +47,6 @@
 
 static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
 static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
-static int ast_cursor_move(struct drm_crtc *crtc,
-			   int x, int y);
-
-
-static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height);
-static int ast_cursor_update(void *dst, void *src, unsigned int width,
-			     unsigned int height);
-static void ast_cursor_set_base(struct ast_private *ast, u64 address);
-static int ast_cursor_move(struct drm_crtc *crtc,
-			   int x, int y);
 
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
@@ -1129,58 +1119,6 @@ static int ast_connector_init(struct drm_device *dev)
 	return 0;
 }
 
-/* allocate cursor cache and pin at start of VRAM */
-static int ast_cursor_init(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-	size_t size, i;
-	struct drm_gem_vram_object *gbo;
-	int ret;
-
-	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
-
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = drm_gem_vram_create(dev, size, 0);
-		if (IS_ERR(gbo)) {
-			ret = PTR_ERR(gbo);
-			goto err_drm_gem_vram_put;
-		}
-		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
-		if (ret) {
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
-
-		ast->cursor.gbo[i] = gbo;
-	}
-
-	return 0;
-
-err_drm_gem_vram_put:
-	while (i) {
-		--i;
-		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-		ast->cursor.gbo[i] = NULL;
-	}
-	return ret;
-}
-
-static void ast_cursor_fini(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-	size_t i;
-	struct drm_gem_vram_object *gbo;
-
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
-}
-
 int ast_mode_init(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
@@ -1344,136 +1282,3 @@ static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
 	i2c_del_adapter(&i2c->adapter);
 	kfree(i2c);
 }
-
-static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
-{
-	union {
-		u32 ul;
-		u8 b[4];
-	} srcdata32[2], data32;
-	union {
-		u16 us;
-		u8 b[2];
-	} data16;
-	u32 csum = 0;
-	s32 alpha_dst_delta, last_alpha_dst_delta;
-	u8 *srcxor, *dstxor;
-	int i, j;
-	u32 per_pixel_copy, two_pixel_copy;
-
-	alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
-	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
-
-	srcxor = src;
-	dstxor = (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
-	per_pixel_copy = width & 1;
-	two_pixel_copy = width >> 1;
-
-	for (j = 0; j < height; j++) {
-		for (i = 0; i < two_pixel_copy; i++) {
-			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
-			srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
-			data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
-			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
-			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
-			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
-
-			writel(data32.ul, dstxor);
-			csum += data32.ul;
-
-			dstxor += 4;
-			srcxor += 8;
-
-		}
-
-		for (i = 0; i < per_pixel_copy; i++) {
-			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
-			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
-			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
-			writew(data16.us, dstxor);
-			csum += (u32)data16.us;
-
-			dstxor += 2;
-			srcxor += 4;
-		}
-		dstxor += last_alpha_dst_delta;
-	}
-	return csum;
-}
-
-static int ast_cursor_update(void *dst, void *src, unsigned int width,
-			     unsigned int height)
-{
-	u32 csum;
-
-	/* do data transfer to cursor cache */
-	csum = copy_cursor_image(src, dst, width, height);
-
-	/* write checksum + signature */
-	dst += AST_HWC_SIZE;
-	writel(csum, dst);
-	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
-	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
-	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
-	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
-
-	return 0;
-}
-
-static void ast_cursor_set_base(struct ast_private *ast, u64 address)
-{
-	u8 addr0 = (address >> 3) & 0xff;
-	u8 addr1 = (address >> 11) & 0xff;
-	u8 addr2 = (address >> 19) & 0xff;
-
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, addr0);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, addr1);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
-}
-
-static int ast_cursor_move(struct drm_crtc *crtc,
-			   int x, int y)
-{
-	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
-	struct ast_private *ast = to_ast_private(crtc->dev);
-	struct drm_gem_vram_object *gbo;
-	int x_offset, y_offset;
-	u8 *dst, *sig;
-	u8 jreg;
-
-	gbo = ast->cursor.gbo[ast->cursor.next_index];
-	dst = drm_gem_vram_vmap(gbo);
-	if (IS_ERR(dst))
-		return PTR_ERR(dst);
-
-	sig = dst + AST_HWC_SIZE;
-	writel(x, sig + AST_HWC_SIGNATURE_X);
-	writel(y, sig + AST_HWC_SIGNATURE_Y);
-
-	x_offset = ast_crtc->offset_x;
-	y_offset = ast_crtc->offset_y;
-	if (x < 0) {
-		x_offset = (-x) + ast_crtc->offset_x;
-		x = 0;
-	}
-
-	if (y < 0) {
-		y_offset = (-y) + ast_crtc->offset_y;
-		y = 0;
-	}
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, (x & 0xff));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, ((x >> 8) & 0x0f));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, (y & 0xff));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
-
-	/* dummy write to fire HWC */
-	jreg = 0x02 |
-	       0x01; /* enable ARGB4444 cursor */
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
-
-	drm_gem_vram_vunmap(gbo, dst);
-
-	return 0;
-}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
