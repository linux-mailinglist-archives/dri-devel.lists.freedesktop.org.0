Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E55F9CE1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB6E10E1C1;
	Mon, 10 Oct 2022 10:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EAE10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFBB421959;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REOi1FGz9jns83m5+b/YHmtB+xm56D8rX2oYIIXoiTk=;
 b=hAIAdgmUe3OsIO5+6PP+KGpDclr05rXjRiUF2l0Wma/SHzph8b3ty2uUzitl++YJH/5OqT
 xKFQ+I4V3eWJZz21yEGOHMZF3cwXWJRlrbkRb0vYKTW0NkqKmkQZkqgZopmG6/A6IS4fpi
 rdcxTOsT6+Ogg2v7nNbIYzu6pMLlCBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REOi1FGz9jns83m5+b/YHmtB+xm56D8rX2oYIIXoiTk=;
 b=3XzAonuflsvOoftXkTOjUV2NopDMI+FqAI+VPtZe4QrUCX2hxeFchJ37Lmw8zX/4zKaNkF
 a2oGDQNdiM6+XIBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A362A13AF4;
 Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GHtpJqz1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 7/8] drm/ast: Convert ast to SHMEM
Date: Mon, 10 Oct 2022 12:36:24 +0200
Message-Id: <20221010103625.19958-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010103625.19958-1-tzimmermann@suse.de>
References: <20221010103625.19958-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace GEM VRAM helpers with GEM SHMEM helpers in ast. Avoids OOM
errors when allocating video memory. Also adds support for dma-buf
functionality.

Aspeed display hardware supports display resolutions of FullHD and
more at 32-bit pixel depth. But the amount of video memory is in
the range of 8 MiB to 32 MiB, which adds contrains to the actually
available resolutions. As atomic modesetting with VRAM helpers
requires double buffering in video memory, ast fails to pageflip
in some configurations. For example, FullHD with an active cursor
plane does not work on devices with 16 MiB of video memory.

Resolve this problem by converting the ast driver to GEM SHMEM helpers.
Keep the buffer objects in system memory and copy to video memory
on pageflips via shadow-plane helpers. Userspace used to require shadow
planes for decent performance, but that's now provided by the driver.
To replaces the memory management, the patch also implements damage
handling for the primary plane.

The GEM SHMEM helpers, dma-buf import and export is now supported
by ast. This allows easier screen mirroring across devices or with
an Aspeed-based BMC. A corresponding feature request is available
at [1].

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/20220901124451.2523077-1-oushixiong@kylinos.cn/ # [1]
---
 drivers/gpu/drm/ast/Kconfig    |   4 +-
 drivers/gpu/drm/ast/ast_drv.c  |   4 +-
 drivers/gpu/drm/ast/ast_drv.h  |  13 ++-
 drivers/gpu/drm/ast/ast_main.c |   5 +-
 drivers/gpu/drm/ast/ast_mm.c   |  14 +--
 drivers/gpu/drm/ast/ast_mode.c | 204 +++++++++++++++++----------------
 6 files changed, 129 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index fbcf2f45cef5..d367a90cd3de 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -2,10 +2,8 @@
 config DRM_AST
 	tristate "AST server chips"
 	depends on DRM && PCI && MMU
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-	select DRM_VRAM_HELPER
-	select DRM_TTM
-	select DRM_TTM_HELPER
 	help
 	 Say yes for experimental AST GPU driver. Do not enable
 	 this driver without having a working -modesetting,
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index b9392f31e629..bbeb5defc8f5 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -33,7 +33,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 
@@ -63,7 +63,7 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
-	DRM_GEM_VRAM_DRIVER
+	DRM_GEM_SHMEM_DRIVER_OPS
 };
 
 /*
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 02120025b7ac..74f41282444f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -112,9 +112,9 @@ enum ast_tx_chip {
 struct ast_plane {
 	struct drm_plane base;
 
-	struct drm_gem_vram_object *gbo;
-	struct iosys_map map;
-	u64 off;
+	void __iomem *vaddr;
+	u64 offset;
+	unsigned long size;
 };
 
 static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
@@ -172,7 +172,12 @@ struct ast_private {
 	uint32_t dram_type;
 	uint32_t mclk;
 
-	struct drm_plane primary_plane;
+	void __iomem	*vram;
+	unsigned long	vram_base;
+	unsigned long	vram_size;
+	unsigned long	vram_fb_available;
+
+	struct ast_plane primary_plane;
 	struct ast_plane cursor_plane;
 	struct drm_crtc crtc;
 	struct {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 067453266897..bffa310a0431 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -32,7 +32,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 
 #include "ast_drv.h"
@@ -461,8 +460,8 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 
 	/* map reserved buffer */
 	ast->dp501_fw_buf = NULL;
-	if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
-		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
+	if (ast->vram_size < pci_resource_len(pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
 		if (!ast->dp501_fw_buf)
 			drm_info(dev, "failed to map reserved buffer!\n");
 	}
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 6e999408dda9..248284a4b3ff 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -28,7 +28,6 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -80,7 +79,6 @@ int ast_mm_init(struct ast_private *ast)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	resource_size_t base, size;
 	u32 vram_size;
-	int ret;
 
 	base = pci_resource_start(pdev, 0);
 	size = pci_resource_len(pdev, 0);
@@ -91,11 +89,13 @@ int ast_mm_init(struct ast_private *ast)
 
 	vram_size = ast_get_vram_size(ast);
 
-	ret = drmm_vram_helper_init(dev, base, vram_size);
-	if (ret) {
-		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
-		return ret;
-	}
+	ast->vram = devm_ioremap_wc(dev->dev, base, vram_size);
+	if (!ast->vram)
+		return -ENOMEM;
+
+	ast->vram_base = base;
+	ast->vram_size = vram_size;
+	ast->vram_fb_available = vram_size;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 59c70fd5b925..1b991658290b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -36,11 +36,13 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -565,6 +567,29 @@ static void ast_wait_for_vretrace(struct ast_private *ast)
 	} while (!(vgair1 & AST_IO_VGAIR1_VREFRESH) && time_before(jiffies, timeout));
 }
 
+/*
+ * Planes
+ */
+
+static int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
+			  void __iomem *vaddr, u64 offset, unsigned long size,
+			  uint32_t possible_crtcs,
+			  const struct drm_plane_funcs *funcs,
+			  const uint32_t *formats, unsigned int format_count,
+			  const uint64_t *format_modifiers,
+			  enum drm_plane_type type)
+{
+	struct drm_plane *plane = &ast_plane->base;
+
+	ast_plane->vaddr = vaddr;
+	ast_plane->offset = offset;
+	ast_plane->size = size;
+
+	return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
+					formats, format_count, format_modifiers,
+					type, NULL);
+}
+
 /*
  * Primary plane
  */
@@ -607,17 +632,29 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
+			      struct drm_framebuffer *fb,
+			      const struct drm_rect *clip)
+{
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(ast_plane->vaddr);
+
+	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+}
+
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
 	struct drm_device *dev = plane->dev;
 	struct ast_private *ast = to_ast_private(dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_framebuffer *old_fb = old_plane_state->fb;
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
+	struct ast_plane *ast_plane = to_ast_plane(plane);
+	struct drm_rect damage;
+	struct drm_atomic_helper_damage_iter iter;
 
 	if (!old_fb || (fb->format != old_fb->format)) {
 		struct drm_crtc *crtc = plane_state->crtc;
@@ -629,13 +666,13 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
 	}
 
-	gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
-		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+	}
 
 	ast_set_offset_reg(ast, fb);
-	ast_set_start_address_crt1(ast, (u32)gpu_addr);
+	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
 
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
 }
@@ -649,7 +686,7 @@ static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
-	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = ast_primary_plane_helper_atomic_check,
 	.atomic_update = ast_primary_plane_helper_atomic_update,
 	.atomic_disable = ast_primary_plane_helper_atomic_disable,
@@ -659,27 +696,30 @@ static const struct drm_plane_funcs ast_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int ast_primary_plane_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_plane *primary_plane = &ast->primary_plane;
+	struct ast_plane *ast_primary_plane = &ast->primary_plane;
+	struct drm_plane *primary_plane = &ast_primary_plane->base;
+	void __iomem *vaddr = ast->vram;
+	u64 offset = ast->vram_base;
+	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
+	unsigned long size = ast->vram_fb_available - cursor_size;
 	int ret;
 
-	ret = drm_universal_plane_init(dev, primary_plane, 0x01,
-				       &ast_primary_plane_funcs,
-				       ast_primary_plane_formats,
-				       ARRAY_SIZE(ast_primary_plane_formats),
-				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
+			     0x01, &ast_primary_plane_funcs,
+			     ast_primary_plane_formats, ARRAY_SIZE(ast_primary_plane_formats),
+			     NULL, DRM_PLANE_TYPE_PRIMARY);
 	if (ret) {
-		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		drm_err(dev, "ast_plane_init() failed: %d\n", ret);
 		return ret;
 	}
 	drm_plane_helper_add(primary_plane, &ast_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
 
 	return 0;
 }
@@ -828,31 +868,26 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct iosys_map dst_map = ast_plane->map;
-	u64 dst_off = ast_plane->off;
 	struct iosys_map src_map = shadow_plane_state->data[0];
+	struct drm_rect damage;
+	const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
+	u64 dst_off = ast_plane->offset;
+	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
+	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
 	unsigned int offset_x, offset_y;
 	u16 x, y;
 	u8 x_offset, y_offset;
-	u8 __iomem *dst;
-	u8 __iomem *sig;
-	const u8 *src;
-
-	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
-	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
-	sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
 
 	/*
-	 * Do data transfer to HW cursor BO. If a new cursor image was installed,
-	 * point the scanout engine to dst_gbo's offset and page-flip the HWC buffers.
+	 * Do data transfer to hardware buffer and point the scanout
+	 * engine to the offset.
 	 */
 
-	ast_update_cursor_image(dst, src, fb->width, fb->height);
-
-	if (fb != old_fb)
+	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
+		ast_update_cursor_image(dst, src, fb->width, fb->height);
 		ast_set_cursor_base(ast, dst_off);
+	}
 
 	/*
 	 * Update location in HWC signature and registers.
@@ -900,36 +935,22 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
 };
 
-static void ast_cursor_plane_destroy(struct drm_plane *plane)
-{
-	struct ast_plane *ast_plane = to_ast_plane(plane);
-	struct drm_gem_vram_object *gbo = ast_plane->gbo;
-	struct iosys_map map = ast_plane->map;
-
-	drm_gem_vram_vunmap(gbo, &map);
-	drm_gem_vram_unpin(gbo);
-	drm_gem_vram_put(gbo);
-
-	drm_plane_cleanup(plane);
-}
-
 static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = ast_cursor_plane_destroy,
+	.destroy = drm_plane_cleanup,
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int ast_cursor_plane_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct ast_plane *ast_plane = &ast->cursor_plane;
-	struct drm_plane *cursor_plane = &ast_plane->base;
+	struct ast_plane *ast_cursor_plane = &ast->cursor_plane;
+	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
 	size_t size;
-	struct drm_gem_vram_object *gbo;
-	struct iosys_map map;
+	void __iomem *vaddr;
+	u64 offset;
 	int ret;
-	s64 off;
 
 	/*
 	 * Allocate backing storage for cursors. The BOs are permanently
@@ -938,52 +959,26 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
-	gbo = drm_gem_vram_create(dev, size, 0);
-	if (IS_ERR(gbo))
-		return PTR_ERR(gbo);
-
-	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-				    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
-	if (ret)
-		goto err_drm_gem_vram_put;
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (ret)
-		goto err_drm_gem_vram_unpin;
-	off = drm_gem_vram_offset(gbo);
-	if (off < 0) {
-		ret = off;
-		goto err_drm_gem_vram_vunmap;
-	}
+	if (ast->vram_fb_available < size)
+		return -ENOMEM;
 
-	ast_plane->gbo = gbo;
-	ast_plane->map = map;
-	ast_plane->off = off;
-
-	/*
-	 * Create the cursor plane. The plane's destroy callback will release
-	 * the backing storages' BO memory.
-	 */
+	vaddr = ast->vram + ast->vram_fb_available - size;
+	offset = ast->vram_base + ast->vram_fb_available - size;
 
-	ret = drm_universal_plane_init(dev, cursor_plane, 0x01,
-				       &ast_cursor_plane_funcs,
-				       ast_cursor_plane_formats,
-				       ARRAY_SIZE(ast_cursor_plane_formats),
-				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
+	ret = ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size,
+			     0x01, &ast_cursor_plane_funcs,
+			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
+			     NULL, DRM_PLANE_TYPE_CURSOR);
 	if (ret) {
-		drm_err(dev, "drm_universal_plane failed(): %d\n", ret);
-		goto err_drm_gem_vram_vunmap;
+		drm_err(dev, "ast_plane_init() failed: %d\n", ret);
+		return ret;
 	}
 	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(cursor_plane);
 
-	return 0;
+	ast->vram_fb_available -= size;
 
-err_drm_gem_vram_vunmap:
-	drm_gem_vram_vunmap(gbo, &map);
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-err_drm_gem_vram_put:
-	drm_gem_vram_put(gbo);
-	return ret;
+	return 0;
 }
 
 /*
@@ -1313,7 +1308,7 @@ static int ast_crtc_init(struct drm_device *dev)
 	struct drm_crtc *crtc = &ast->crtc;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
+	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane.base,
 					&ast->cursor_plane.base, &ast_crtc_funcs,
 					NULL);
 	if (ret)
@@ -1735,9 +1730,27 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
 	.atomic_commit_tail = ast_mode_config_helper_atomic_commit_tail,
 };
 
+static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
+						       const struct drm_display_mode *mode)
+{
+	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGB8888 */
+	struct ast_private *ast = to_ast_private(dev);
+	unsigned long fbsize, fbpages, max_fbpages;
+
+	max_fbpages = (ast->vram_fb_available) >> PAGE_SHIFT;
+
+	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
+
+	if (fbpages > max_fbpages)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
 static const struct drm_mode_config_funcs ast_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create,
-	.mode_valid = drm_vram_helper_mode_valid,
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = ast_mode_config_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -1756,7 +1769,6 @@ int ast_mode_config_init(struct ast_private *ast)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
-	dev->mode_config.prefer_shadow = 1;
 	dev->mode_config.fb_base = pci_resource_start(pdev, 0);
 
 	if (ast->chip == AST2100 ||
-- 
2.37.3

