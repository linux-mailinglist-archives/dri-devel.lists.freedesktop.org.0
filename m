Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19382A4D401
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 07:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ADD10E1BE;
	Tue,  4 Mar 2025 06:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Tue, 04 Mar 2025 06:42:57 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4CF710E1BE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 06:42:57 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.156])
 by gateway (Coremail) with SMTP id _____8BxjazbnsZngdiJAA--.6235S3;
 Tue, 04 Mar 2025 14:34:03 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
 by front1 (Coremail) with SMTP id qMiowMBxWsTWnsZnwBY1AA--.12324S2;
 Tue, 04 Mar 2025 14:34:01 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] drm/ast: Support both SHMEM helper and VRAM helper
Date: Tue,  4 Mar 2025 14:33:51 +0800
Message-ID: <20250304063351.3975323-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMBxWsTWnsZnwBY1AA--.12324S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3uFy8AF4kuryxCFyDAw4fZwc_yoW8Wr4kGo
 WxtF1fJay8Xw1Sq34SyF1kKas7ZFZ7Cw45G3y5Wr4q9ay7Xw1YkF47tw1YyFWfJr1rta98
 Xw1jv3W7tF1UWFs7l-sFpf9Il3svdjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUU5R7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f2fa5a99ca81ce105653 ("drm/ast: Convert ast to SHMEM") converts
ast from VRAM helper to SHMEM helper. The convertion makesast support
higher display resolutions, but the performance decreases significantly
on platforms which don't support writecombine (fallback to uncached).

This patch implements both SHMEM helper and VRAM helper for ast driver
at the same time. A module parameter ast.shmem is added, 1 means SHMEM
hepler, 0 means VRAM helper, and the default (-1) means auto selection
according to drm_arch_can_wc_memory().

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/ast/Kconfig    |   3 +
 drivers/gpu/drm/ast/ast_drv.c  |  31 ++++++++--
 drivers/gpu/drm/ast/ast_drv.h  |   6 +-
 drivers/gpu/drm/ast/ast_mm.c   |  11 +++-
 drivers/gpu/drm/ast/ast_mode.c | 105 +++++++++++++++++++++++++--------
 5 files changed, 124 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
index da0663542e8a..ed07ef70072f 100644
--- a/drivers/gpu/drm/ast/Kconfig
+++ b/drivers/gpu/drm/ast/Kconfig
@@ -5,6 +5,9 @@ config DRM_AST
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select DRM_VRAM_HELPER
 	select I2C
 	select I2C_ALGOBIT
 	help
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index ff3bcdd1cff2..a0c693844f1e 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -33,9 +33,12 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 
@@ -46,13 +49,18 @@ static int ast_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
 
+int ast_shmem = -1;
+
+MODULE_PARM_DESC(shmem, "1 = SHMEM helper, 0 = VRAM helper, -1 = Auto");
+module_param_named(shmem, ast_shmem, int, 0400);
+
 /*
  * DRM driver
  */
 
 DEFINE_DRM_GEM_FOPS(ast_fops);
 
-static const struct drm_driver ast_driver = {
+static struct drm_driver ast_driver = {
 	.driver_features = DRIVER_ATOMIC |
 			   DRIVER_GEM |
 			   DRIVER_MODESET,
@@ -63,9 +71,6 @@ static const struct drm_driver ast_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-
-	DRM_GEM_SHMEM_DRIVER_OPS,
-	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
 /*
@@ -280,6 +285,24 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *drm;
 	bool need_post = false;
 
+	if (ast_shmem == -1)
+		ast_shmem = drm_arch_can_wc_memory() ? 1 : 0;
+
+	if (ast_shmem) {
+		ast_driver.dumb_create = drm_gem_shmem_dumb_create;
+		ast_driver.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table;
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+		ast_driver.fbdev_probe = drm_fbdev_shmem_driver_fbdev_probe;
+#endif
+	} else {
+		ast_driver.dumb_create = drm_gem_vram_driver_dumb_create;
+		ast_driver.dumb_map_offset = drm_gem_ttm_dumb_map_offset;
+		ast_driver.debugfs_init = drm_vram_mm_debugfs_init;
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+		ast_driver.fbdev_probe = drm_fbdev_ttm_driver_fbdev_probe;
+#endif
+	}
+
 	ret = aperture_remove_conflicting_pci_devices(pdev, ast_driver.name);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6b4305ac07d4..3fcf6717ad8a 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -29,6 +29,7 @@
 #define __AST_DRV_H__
 
 #include <linux/io.h>
+#include <linux/iosys-map.h>
 #include <linux/types.h>
 
 #include <drm/drm_connector.h>
@@ -53,6 +54,8 @@
 
 #define __AST_CHIP(__gen, __index)	((__gen) << 16 | (__index))
 
+extern int ast_shmem;
+
 enum ast_chip {
 	/* 1st gen */
 	AST1000 = __AST_CHIP(1, 0), // unused
@@ -130,7 +133,8 @@ enum ast_config_mode {
 struct ast_plane {
 	struct drm_plane base;
 
-	void __iomem *vaddr;
+	struct drm_gem_vram_object *gbo;
+	struct iosys_map map;
 	u64 offset;
 	unsigned long size;
 };
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 6dfe6d9777d4..588326b7d53e 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -28,6 +28,7 @@
 
 #include <linux/pci.h>
 
+#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -87,9 +88,13 @@ int ast_mm_init(struct ast_device *ast)
 
 	vram_size = ast_get_vram_size(ast);
 
-	ast->vram = devm_ioremap_wc(dev->dev, base, vram_size);
-	if (!ast->vram)
-		return -ENOMEM;
+	if (!ast_shmem)
+		drmm_vram_helper_init(dev, base, vram_size);
+	else {
+		ast->vram = devm_ioremap_wc(dev->dev, base, vram_size);
+		if (!ast->vram)
+			return -ENOMEM;
+	}
 
 	ast->vram_base = base;
 	ast->vram_size = vram_size;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9d5321c81e68..0744d1ac5dfb 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -41,6 +41,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
@@ -566,8 +567,7 @@ static void ast_wait_for_vretrace(struct ast_device *ast)
  */
 
 static int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
-			  void __iomem *vaddr, u64 offset, unsigned long size,
-			  uint32_t possible_crtcs,
+			  u64 offset, unsigned long size, uint32_t possible_crtcs,
 			  const struct drm_plane_funcs *funcs,
 			  const uint32_t *formats, unsigned int format_count,
 			  const uint64_t *format_modifiers,
@@ -575,7 +575,6 @@ static int ast_plane_init(struct drm_device *dev, struct ast_plane *ast_plane,
 {
 	struct drm_plane *plane = &ast_plane->base;
 
-	ast_plane->vaddr = vaddr;
 	ast_plane->offset = offset;
 	ast_plane->size = size;
 
@@ -630,7 +629,7 @@ static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src
 			      struct drm_framebuffer *fb,
 			      const struct drm_rect *clip)
 {
-	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->vaddr);
+	struct iosys_map dst = ast_plane->map;
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
@@ -650,6 +649,7 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_rect damage;
+	struct drm_gem_vram_object *gbo;
 	struct drm_atomic_helper_damage_iter iter;
 
 	if (!old_fb || (fb->format != old_fb->format) || crtc_state->mode_changed) {
@@ -660,9 +660,15 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
 	}
 
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
-	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+	if (!ast_shmem) {
+		gbo = drm_gem_vram_of_gem(fb->obj[0]);
+		ast_plane->offset = drm_gem_vram_offset(gbo);
+		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
+	} else {
+		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+		drm_atomic_for_each_plane_damage(&iter, &damage) {
+			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+		}
 	}
 
 	/*
@@ -704,19 +710,18 @@ static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 {
 	struct ast_plane *ast_plane = to_ast_plane(plane);
 
-	if (plane->state && plane->state->fb && ast_plane->vaddr) {
+	if (plane->state && plane->state->fb && ast_plane->map.vaddr_iomem) {
 		sb->format = plane->state->fb->format;
 		sb->width = plane->state->fb->width;
 		sb->height = plane->state->fb->height;
 		sb->pitch[0] = plane->state->fb->pitches[0];
-		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr);
+		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->map.vaddr_iomem);
 		return 0;
 	}
 	return -ENODEV;
 }
 
-static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+static struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
 	.atomic_check = ast_primary_plane_helper_atomic_check,
 	.atomic_update = ast_primary_plane_helper_atomic_update,
 	.atomic_enable = ast_primary_plane_helper_atomic_enable,
@@ -724,11 +729,10 @@ static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
 	.get_scanout_buffer = ast_primary_plane_helper_get_scanout_buffer,
 };
 
-static const struct drm_plane_funcs ast_primary_plane_funcs = {
+static struct drm_plane_funcs ast_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int ast_primary_plane_init(struct ast_device *ast)
@@ -737,12 +741,28 @@ static int ast_primary_plane_init(struct ast_device *ast)
 	struct ast_plane *ast_primary_plane = &ast->primary_plane;
 	struct drm_plane *primary_plane = &ast_primary_plane->base;
 	void __iomem *vaddr = ast->vram;
-	u64 offset = 0; /* with shmem, the primary plane is always at offset 0 */
+	u64 offset = 0; /* the primary plane is initially at offset 0 */
 	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 	unsigned long size = ast->vram_fb_available - cursor_size;
 	int ret;
 
-	ret = ast_plane_init(dev, ast_primary_plane, vaddr, offset, size,
+	if (ast_shmem) {
+		ast_primary_plane_funcs.reset = drm_gem_reset_shadow_plane;
+		ast_primary_plane_funcs.atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state;
+		ast_primary_plane_funcs.atomic_destroy_state = drm_gem_destroy_shadow_plane_state;
+		ast_primary_plane_helper_funcs.begin_fb_access = drm_gem_begin_shadow_fb_access;
+		ast_primary_plane_helper_funcs.end_fb_access = drm_gem_end_shadow_fb_access;
+	} else {
+		ast_primary_plane_funcs.reset = drm_atomic_helper_plane_reset;
+		ast_primary_plane_funcs.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state;
+		ast_primary_plane_funcs.atomic_destroy_state = drm_atomic_helper_plane_destroy_state;
+		ast_primary_plane_helper_funcs.prepare_fb = drm_gem_vram_plane_helper_prepare_fb;
+		ast_primary_plane_helper_funcs.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb;
+	}
+
+	iosys_map_set_vaddr_iomem(&ast_primary_plane->map, vaddr);
+
+	ret = ast_plane_init(dev, ast_primary_plane, offset, size,
 			     0x01, &ast_primary_plane_funcs,
 			     ast_primary_plane_formats, ARRAY_SIZE(ast_primary_plane_formats),
 			     NULL, DRM_PLANE_TYPE_PRIMARY);
@@ -902,10 +922,11 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct ast_device *ast = to_ast_device(plane->dev);
 	struct iosys_map src_map = shadow_plane_state->data[0];
+	struct iosys_map dst_map = ast_plane->map;
 	struct drm_rect damage;
 	const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 	u64 dst_off = ast_plane->offset;
-	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
+	u8 __iomem *dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
 	unsigned int offset_x, offset_y;
 	u16 x, y;
@@ -967,10 +988,22 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
 };
 
-static const struct drm_plane_funcs ast_cursor_plane_funcs = {
+static void ast_cursor_plane_destroy(struct drm_plane *plane)
+{
+	struct ast_plane *ast_plane = to_ast_plane(plane);
+	struct drm_gem_vram_object *gbo = ast_plane->gbo;
+	struct iosys_map map = ast_plane->map;
+
+	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_unpin(gbo);
+	drm_gem_vram_put(gbo);
+
+	drm_plane_cleanup(plane);
+}
+
+static struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
@@ -979,6 +1012,8 @@ static int ast_cursor_plane_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct ast_plane *ast_cursor_plane = &ast->cursor_plane;
 	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
+	struct drm_gem_vram_object *gbo;
+	struct iosys_map map;
 	size_t size;
 	void __iomem *vaddr;
 	u64 offset;
@@ -994,10 +1029,25 @@ static int ast_cursor_plane_init(struct ast_device *ast)
 	if (ast->vram_fb_available < size)
 		return -ENOMEM;
 
-	vaddr = ast->vram + ast->vram_fb_available - size;
-	offset = ast->vram_fb_available - size;
+	if (ast_shmem) {
+		vaddr = ast->vram + ast->vram_fb_available - size;
+		offset = ast->vram_fb_available - size;
+		iosys_map_set_vaddr_iomem(&ast_cursor_plane->map, vaddr);
+		ast_cursor_plane_funcs.destroy = drm_plane_cleanup;
+	} else {
+		gbo = drm_gem_vram_create(dev, size, 0);
+		if (IS_ERR(gbo))
+			return PTR_ERR(gbo);
+
+		drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM | DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+		drm_gem_vram_vmap(gbo, &map);
+		offset = drm_gem_vram_offset(gbo);
+		ast_cursor_plane->gbo = gbo;
+		ast_cursor_plane->map = map;
+		ast_cursor_plane_funcs.destroy = ast_cursor_plane_destroy;
+	}
 
-	ret = ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size,
+	ret = ast_plane_init(dev, ast_cursor_plane, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
 			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
 			     NULL, DRM_PLANE_TYPE_CURSOR);
@@ -1348,9 +1398,7 @@ static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
 	return MODE_OK;
 }
 
-static const struct drm_mode_config_funcs ast_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
-	.mode_valid = ast_mode_config_mode_valid,
+static struct drm_mode_config_funcs ast_mode_config_funcs = {
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -1372,6 +1420,15 @@ int ast_mode_config_init(struct ast_device *ast)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.prefer_shadow = !ast_shmem;
+
+	if (!ast_shmem) {
+		ast_mode_config_funcs.fb_create = drm_gem_fb_create;
+		ast_mode_config_funcs.mode_valid = drm_vram_helper_mode_valid;
+	} else {
+		ast_mode_config_funcs.fb_create = drm_gem_fb_create_with_dirty;
+		ast_mode_config_funcs.mode_valid = ast_mode_config_mode_valid;
+	}
 
 	if (ast->chip == AST2100 || // GEN2, but not AST1100 (?)
 	    ast->chip == AST2200 || // GEN3, but not AST2150 (?)
-- 
2.47.1

