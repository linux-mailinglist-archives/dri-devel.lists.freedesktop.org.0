Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4549F543
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C4E112389;
	Fri, 28 Jan 2022 08:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472DD11236B;
 Fri, 28 Jan 2022 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358975; x=1674894975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2aIO2Nzg7vHSHQkxikTS9OzoEn9FR+PiyWdB4SuXu0c=;
 b=eoZKQhOSnRqafU1/FSdfqhJlnew2ZuCmBg/1HrNBz6dyi/yRVkTHCbww
 i5z31XhTVkxslKqvI4hfKqn1VlzUjX6eYBTjd/QvYGazrmiC7PbJ58lKo
 LmbwkvmppcMmmGUN6UgRe2GFuLyFGBTrWoCTBpA8NRlcjpF5eM9OxyrLD
 u/sX/qeJyZqK8Z8QO7jX53DxLTE6wSmJzxiZ5nX9Okt8ys8b3GZ7yViUa
 tWOysA0v0HbGudULVuhVBC5fs/qB+EvY8Y4BUw5RnHixT0CUJL4fGvKFE
 xjpcgaon5dhK12WwnkawFmo0/6fZ+sno9c3eYgatt8fWGT/j4lpMWm462 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247025187"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="247025187"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788742"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm: Replace dma-buf-map with iosys-map in drivers
Date: Fri, 28 Jan 2022 00:36:18 -0800
Message-Id: <20220128083626.3012259-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in some drivers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/ast/ast_drv.h               |  2 +-
 drivers/gpu/drm/ast/ast_mode.c              |  8 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  8 ++++----
 drivers/gpu/drm/gud/gud_pipe.c              |  4 ++--
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  5 +++--
 drivers/gpu/drm/lima/lima_gem.c             |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c           |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c      |  7 ++++---
 drivers/gpu/drm/mediatek/mtk_drm_gem.h      |  5 +++--
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 13 +++++++------
 drivers/gpu/drm/qxl/qxl_display.c           |  8 ++++----
 drivers/gpu/drm/qxl/qxl_draw.c              |  6 +++---
 drivers/gpu/drm/qxl/qxl_drv.h               | 10 +++++-----
 drivers/gpu/drm/qxl/qxl_object.c            |  8 ++++----
 drivers/gpu/drm/qxl/qxl_object.h            |  4 ++--
 drivers/gpu/drm/qxl/qxl_prime.c             |  4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  9 +++++----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h |  5 +++--
 drivers/gpu/drm/tiny/cirrus.c               |  8 +++++---
 drivers/gpu/drm/tiny/gm12u320.c             |  7 ++++---
 drivers/gpu/drm/udl/udl_modeset.c           |  3 ++-
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_prime.c      |  1 +
 drivers/gpu/drm/vkms/vkms_composer.c        |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h             |  6 +++---
 drivers/gpu/drm/vkms/vkms_plane.c           |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c       |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  7 ++++---
 drivers/gpu/drm/xen/xen_drm_front_gem.h     |  6 +++---
 31 files changed, 91 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 00bfa41ff7cb..9c8d56b0a41b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -107,7 +107,7 @@ struct ast_cursor_plane {
 
 	struct {
 		struct drm_gem_vram_object *gbo;
-		struct dma_buf_map map;
+		struct iosys_map map;
 		u64 off;
 	} hwc[AST_DEFAULT_HWC_NUM];
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ab52efb15670..2c7115a4d81f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -804,11 +804,11 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct dma_buf_map dst_map =
+	struct iosys_map dst_map =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 	u64 dst_off =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
-	struct dma_buf_map src_map = shadow_plane_state->data[0];
+	struct iosys_map src_map = shadow_plane_state->data[0];
 	unsigned int offset_x, offset_y;
 	u16 x, y;
 	u8 x_offset, y_offset;
@@ -886,7 +886,7 @@ static void ast_cursor_plane_destroy(struct drm_plane *plane)
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	size_t i;
 	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
+	struct iosys_map map;
 
 	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
 		gbo = ast_cursor_plane->hwc[i].gbo;
@@ -913,7 +913,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 	s64 off;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 049ae87de9be..f32f4771dada 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -49,7 +49,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
-int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sg);
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 6788ea8490d1..3fa2da149639 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -25,14 +25,14 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	return drm_prime_pages_to_sg(obj->dev, etnaviv_obj->pages, npages);
 }
 
-int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	void *vaddr;
 
 	vaddr = etnaviv_gem_vmap(obj);
 	if (!vaddr)
 		return -ENOMEM;
-	dma_buf_map_set_vaddr(map, vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
@@ -62,7 +62,7 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
 
 static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(etnaviv_obj->vaddr);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
 
 	if (etnaviv_obj->vaddr)
 		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf, &map);
@@ -77,7 +77,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 
 static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 
 	lockdep_assert_held(&etnaviv_obj->lock);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index a150a5a4b5d4..4873f9799f41 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -152,8 +152,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 {
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	u8 compression = gdrm->compression;
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map map_data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES];
 	void *vaddr, *buf;
 	size_t pitch, len;
 	int ret = 0;
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 93f51e70a951..e82b815f83a6 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -19,7 +19,7 @@
 #include "hyperv_drm.h"
 
 static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
-				    const struct dma_buf_map *map,
+				    const struct iosys_map *map,
 				    struct drm_rect *rect)
 {
 	struct hyperv_drm_device *hv = to_hv(fb->dev);
@@ -38,7 +38,8 @@ static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
 	return 0;
 }
 
-static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb, const struct dma_buf_map *map)
+static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb,
+					  const struct iosys_map *map)
 {
 	struct drm_rect fullscreen = {
 		.x1 = 0,
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index f9a9198ef198..d0c2b1422b3b 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
 
 #include <linux/mm.h>
+#include <linux/iosys-map.h>
 #include <linux/sync_file.h>
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
@@ -182,7 +183,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(&bo->base);
 }
 
-static int lima_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	struct lima_bo *bo = to_lima_bo(obj);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 5612d73f238f..390c969f74ad 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /* Copyright 2017-2019 Qiang Yu <yuq825@gmail.com> */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -284,7 +284,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 	struct lima_dump_chunk_buffer *buffer_chunk;
 	u32 size, task_size, mem_size;
 	int i;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 
 	mutex_lock(&dev->error_task_list_lock);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index d0544962cfc1..139d7724c6d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -220,7 +220,7 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	return &mtk_gem->base;
 }
 
-int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct sg_table *sgt = NULL;
@@ -247,12 +247,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 
 out:
 	kfree(sgt);
-	dma_buf_map_set_vaddr(map, mtk_gem->kvaddr);
+	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
 
 	return 0;
 }
 
-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
+			      struct iosys_map *map)
 {
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	void *vaddr = map->vaddr;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 9a359a06cb73..78f23b07a02e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -42,7 +42,8 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj,
+			      struct iosys_map *map);
 
 #endif
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index cd9ba13ad5fc..6e18d3bbd720 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
@@ -848,7 +848,7 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 
 static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
-		      struct drm_rect *clip, const struct dma_buf_map *map)
+		      struct drm_rect *clip, const struct iosys_map *map)
 {
 	void __iomem *dst = mdev->vram;
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 1d36df5af98d..bc0df93f7f21 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Collabora Ltd */
 
-#include <drm/drm_file.h>
-#include <drm/drm_gem_shmem_helper.h>
-#include <drm/panfrost_drm.h>
 #include <linux/completion.h>
-#include <linux/dma-buf-map.h>
 #include <linux/iopoll.h>
+#include <linux/iosys-map.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_file.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/panfrost_drm.h>
+
 #include "panfrost_device.h"
 #include "panfrost_features.h"
 #include "panfrost_gem.h"
@@ -73,7 +74,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 {
 	struct panfrost_file_priv *user = file_priv->driver_priv;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	struct drm_gem_shmem_object *bo;
 	u32 cfg, as;
 	int ret;
@@ -181,7 +182,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 {
 	struct panfrost_file_priv *user = file_priv->driver_priv;
 	struct panfrost_perfcnt *perfcnt = pfdev->perfcnt;
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(perfcnt->buf);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(perfcnt->buf);
 
 	if (user != perfcnt->user)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 9e0a1e836011..9a9c29b1d3e1 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -25,7 +25,7 @@
 
 #include <linux/crc32.h>
 #include <linux/delay.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_atomic.h>
@@ -566,8 +566,8 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
 {
 	static const u32 size = 64 * 64 * 4;
 	struct qxl_bo *cursor_bo;
-	struct dma_buf_map cursor_map;
-	struct dma_buf_map user_map;
+	struct iosys_map cursor_map;
+	struct iosys_map user_map;
 	struct qxl_cursor cursor;
 	int ret;
 
@@ -1183,7 +1183,7 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 {
 	int ret;
 	struct drm_gem_object *gobj;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int monitors_config_size = sizeof(struct qxl_monitors_config) +
 		qxl_num_crtc * sizeof(struct qxl_head);
 
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 7d27891e87fa..a93de9e1977a 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -20,7 +20,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_fourcc.h>
 
@@ -44,7 +44,7 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
 					      unsigned int num_clips,
 					      struct qxl_bo *clips_bo)
 {
-	struct dma_buf_map map;
+	struct iosys_map map;
 	struct qxl_clip_rects *dev_clips;
 	int ret;
 
@@ -146,7 +146,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	int stride = fb->pitches[0];
 	/* depth is not actually interesting, we don't mask with it */
 	int depth = fb->format->cpp[0] * 8;
-	struct dma_buf_map surface_map;
+	struct iosys_map surface_map;
 	uint8_t *surface_base;
 	struct qxl_release *release;
 	struct qxl_bo *clips_bo;
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 29641ceaab7d..47c169673088 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -30,7 +30,7 @@
  * Definitions taken from spice-protocol, plus kernel driver specific bits.
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
@@ -50,7 +50,7 @@
 
 #include "qxl_dev.h"
 
-struct dma_buf_map;
+struct iosys_map;
 
 #define DRIVER_AUTHOR		"Dave Airlie"
 
@@ -80,7 +80,7 @@ struct qxl_bo {
 	/* Protected by tbo.reserved */
 	struct ttm_place		placements[3];
 	struct ttm_placement		placement;
-	struct dma_buf_map		map;
+	struct iosys_map		map;
 	void				*kptr;
 	unsigned int                    map_count;
 	int                             type;
@@ -427,9 +427,9 @@ struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
-int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
-			  struct dma_buf_map *map);
+			  struct iosys_map *map);
 
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index fbb36e3e8564..b42a657e4c2f 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -23,7 +23,7 @@
  *          Alon Levy
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/io-mapping.h>
 
 #include "qxl_drv.h"
@@ -158,7 +158,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 	return 0;
 }
 
-int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
+int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 {
 	int r;
 
@@ -184,7 +184,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
 	return 0;
 }
 
-int qxl_bo_vmap(struct qxl_bo *bo, struct dma_buf_map *map)
+int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
 {
 	int r;
 
@@ -210,7 +210,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 	void *rptr;
 	int ret;
 	struct io_mapping *map;
-	struct dma_buf_map bo_map;
+	struct iosys_map bo_map;
 
 	if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
 		map = qdev->vram_mapping;
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index cee4b52b75dd..53392cb90eec 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -59,8 +59,8 @@ extern int qxl_bo_create(struct qxl_device *qdev,
 			 u32 priority,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
-int qxl_bo_vmap(struct qxl_bo *bo, struct dma_buf_map *map);
-int qxl_bo_vmap_locked(struct qxl_bo *bo, struct dma_buf_map *map);
+int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map);
+int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map);
 int qxl_bo_vunmap(struct qxl_bo *bo);
 void qxl_bo_vunmap_locked(struct qxl_bo *bo);
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 4a10cb0a413b..142d01415acb 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -54,7 +54,7 @@ struct drm_gem_object *qxl_gem_prime_import_sg_table(
 	return ERR_PTR(-ENOSYS);
 }
 
-int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 	int ret;
@@ -67,7 +67,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 }
 
 void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
-			  struct dma_buf_map *map)
+			  struct iosys_map *map)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 63eb73b624aa..985584147da1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -510,7 +510,7 @@ rockchip_gem_prime_import_sg_table(struct drm_device *drm,
 	return ERR_PTR(ret);
 }
 
-int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
@@ -519,18 +519,19 @@ int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 				  pgprot_writecombine(PAGE_KERNEL));
 		if (!vaddr)
 			return -ENOMEM;
-		dma_buf_map_set_vaddr(map, vaddr);
+		iosys_map_set_vaddr(map, vaddr);
 		return 0;
 	}
 
 	if (rk_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
 		return -ENOMEM;
-	dma_buf_map_set_vaddr(map, rk_obj->kvaddr);
+	iosys_map_set_vaddr(map, rk_obj->kvaddr);
 
 	return 0;
 }
 
-void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+void rockchip_gem_prime_vunmap(struct drm_gem_object *obj,
+			       struct iosys_map *map)
 {
 	struct rockchip_gem_object *rk_obj = to_rockchip_obj(obj);
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
index 47c1861eece0..72f59ac6d258 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.h
@@ -31,8 +31,9 @@ struct drm_gem_object *
 rockchip_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
 				   struct sg_table *sg);
-int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-void rockchip_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void rockchip_gem_prime_vunmap(struct drm_gem_object *obj,
+			       struct iosys_map *map);
 
 struct rockchip_gem_object *
 	rockchip_gem_create_object(struct drm_device *drm, unsigned int size,
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index ecf2475d0f16..c8e791840862 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -16,7 +16,7 @@
  * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
@@ -313,7 +313,8 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	return 0;
 }
 
-static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
+			       const struct iosys_map *map,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
@@ -345,7 +346,8 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 	return 0;
 }
 
-static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb, const struct dma_buf_map *map)
+static int cirrus_fb_blit_fullscreen(struct drm_framebuffer *fb,
+				     const struct iosys_map *map)
 {
 	struct drm_rect fullscreen = {
 		.x1 = 0,
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 6bc0c298739c..648e585d40a8 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -95,7 +95,7 @@ struct gm12u320_device {
 		struct drm_rect          rect;
 		int frame;
 		int draw_status_timeout;
-		struct dma_buf_map src_map;
+		struct iosys_map src_map;
 	} fb_update;
 };
 
@@ -395,7 +395,8 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 		GM12U320_ERR("Frame update error: %d\n", ret);
 }
 
-static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
+				   const struct iosys_map *map,
 				   struct drm_rect *dirty)
 {
 	struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
@@ -438,7 +439,7 @@ static void gm12u320_stop_fb_update(struct gm12u320_device *gm12u320)
 	mutex_lock(&gm12u320->fb_update.lock);
 	old_fb = gm12u320->fb_update.fb;
 	gm12u320->fb_update.fb = NULL;
-	dma_buf_map_clear(&gm12u320->fb_update.src_map);
+	iosys_map_clear(&gm12u320->fb_update.src_map);
 	mutex_unlock(&gm12u320->fb_update.lock);
 
 	drm_framebuffer_put(old_fb);
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 32232228dae9..e67c40a48fb4 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -264,7 +264,8 @@ static int udl_aligned_damage_clip(struct drm_rect *clip, int x, int y,
 	return 0;
 }
 
-static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_map *map,
+static int udl_handle_damage(struct drm_framebuffer *fb,
+			     const struct iosys_map *map,
 			     int x, int y, int width, int height)
 {
 	struct drm_device *dev = fb->dev;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 4227a915b06a..4017b0a621fc 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -10,7 +10,7 @@
  *          Hans de Goede <hdegoede@redhat.com>
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/export.h>
 
 #include <drm/drm_atomic.h>
@@ -398,7 +398,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	u32 height = new_state->crtc_h;
 	struct drm_shadow_plane_state *shadow_plane_state =
 		to_drm_shadow_plane_state(new_state);
-	struct dma_buf_map map = shadow_plane_state->data[0];
+	struct iosys_map map = shadow_plane_state->data[0];
 	u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
 	size_t data_size, mask_size;
 	u32 flags;
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 55d80b77d9b0..78eccd618726 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -22,6 +22,7 @@
  * Authors: Andreas Pokorny
  */
 
+#include <linux/iosys-map.h>
 #include <drm/drm_prime.h>
 #include <linux/virtio_dma_buf.h>
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..c6a1036bf2ea 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -157,7 +157,7 @@ static void compose_plane(struct vkms_composer *primary_composer,
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
 		return;
 
 	vaddr = plane_composer->map[0].vaddr;
@@ -187,7 +187,7 @@ static int compose_active_planes(void **vaddr_out,
 		}
 	}
 
-	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
 		return -EINVAL;
 
 	vaddr = primary_composer->map[0].vaddr;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 9496fdc900b8..91e63b12f60f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,14 +23,14 @@
 #define NUM_OVERLAY_PLANES 8
 
 struct vkms_writeback_job {
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 };
 
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct iosys_map map[4];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..d8eb674b49a6 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..af1604dfbbaf 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index dd358ba2bf8e..5a5bf4e5b717 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -280,7 +280,8 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 	return &xen_obj->base;
 }
 
-int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_map *map)
+int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
+				 struct iosys_map *map)
 {
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
 	void *vaddr;
@@ -293,13 +294,13 @@ int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj, struct dma_buf_
 		     VM_MAP, PAGE_KERNEL);
 	if (!vaddr)
 		return -ENOMEM;
-	dma_buf_map_set_vaddr(map, vaddr);
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
-				    struct dma_buf_map *map)
+				    struct iosys_map *map)
 {
 	vunmap(map->vaddr);
 }
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.h b/drivers/gpu/drm/xen/xen_drm_front_gem.h
index eaea470f7001..a718a1f382a3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.h
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.h
@@ -12,7 +12,7 @@
 #define __XEN_DRM_FRONT_GEM_H
 
 struct dma_buf_attachment;
-struct dma_buf_map;
+struct iosys_map;
 struct drm_device;
 struct drm_gem_object;
 struct sg_table;
@@ -32,9 +32,9 @@ struct page **xen_drm_front_gem_get_pages(struct drm_gem_object *obj);
 void xen_drm_front_gem_free_object_unlocked(struct drm_gem_object *gem_obj);
 
 int xen_drm_front_gem_prime_vmap(struct drm_gem_object *gem_obj,
-				 struct dma_buf_map *map);
+				 struct iosys_map *map);
 
 void xen_drm_front_gem_prime_vunmap(struct drm_gem_object *gem_obj,
-				    struct dma_buf_map *map);
+				    struct iosys_map *map);
 
 #endif /* __XEN_DRM_FRONT_GEM_H */
-- 
2.35.0

