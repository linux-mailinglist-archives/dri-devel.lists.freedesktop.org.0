Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4F49F548
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38431123A6;
	Fri, 28 Jan 2022 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593B0112380;
 Fri, 28 Jan 2022 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358982; x=1674894982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iA+0Hlybkhbaf/ceORtSX2kfQPF+FX4dumuEdNpYaug=;
 b=OcKEpwexCf87rJS068u+BjJCvnr7QTp3gfu6Y6sUc8GH22foBG1lhM1N
 PGbP8H4FKbkM6PalA7i6QYx21T94IyBj0kKA46gSub0JUStZGv2ZgQVto
 lT6xMlpE32mcsVEEa4FbrHYGBk2vjiA9Z1wwpHIpd3mmcuLlXeTaufzjC
 1w0+w9N6RkWuqGd38g7Vl5QoDaidYd4c2EFuYgnqjusSavFwzEmhLQhlk
 eTriED+MeJwvrphFtYkZTIWIIxdCs+K0+XQALE4cQDJchcTwmO2aT1fgm
 QY3FGAA3slHD8YbRTSjrVODWWuEdf16tQyx+XEavsvi04cw2Duan10ZIY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227056609"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="227056609"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788765"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/14] drm: Replace dma-buf-map with iosys-map in common code
Date: Fri, 28 Jan 2022 00:36:24 -0800
Message-Id: <20220128083626.3012259-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
capabitilities. Replace with the new API in all the helpers and common
code for the drivers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_cache.c                  | 18 +++++++-------
 drivers/gpu/drm/drm_client.c                 |  9 +++----
 drivers/gpu/drm/drm_fb_helper.c              | 12 +++++-----
 drivers/gpu/drm/drm_gem.c                    | 12 +++++-----
 drivers/gpu/drm/drm_gem_cma_helper.c         |  9 +++----
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++++-------
 drivers/gpu/drm/drm_gem_shmem_helper.c       | 15 +++++++-----
 drivers/gpu/drm/drm_gem_ttm_helper.c         |  4 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c        | 25 +++++++++++---------
 drivers/gpu/drm/drm_internal.h               |  6 ++---
 drivers/gpu/drm/drm_mipi_dbi.c               |  8 +++----
 drivers/gpu/drm/drm_prime.c                  |  4 ++--
 include/drm/drm_cache.h                      |  6 ++---
 include/drm/drm_client.h                     |  7 +++---
 include/drm/drm_gem.h                        |  6 ++---
 include/drm/drm_gem_atomic_helper.h          |  6 ++---
 include/drm/drm_gem_cma_helper.h             |  6 +++--
 include/drm/drm_gem_framebuffer_helper.h     |  8 +++----
 include/drm/drm_gem_shmem_helper.h           | 12 ++++++----
 include/drm/drm_gem_ttm_helper.h             |  6 ++---
 include/drm/drm_gem_vram_helper.h            |  9 +++----
 include/drm/drm_prime.h                      |  6 ++---
 22 files changed, 113 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe959..4bb093ccf1b8 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -28,10 +28,10 @@
  * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/cc_platform.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
-#include <linux/cc_platform.h>
+#include <linux/iosys-map.h>
 #include <xen/xen.h>
 
 #include <drm/drm_cache.h>
@@ -214,14 +214,14 @@ bool drm_need_swiotlb(int dma_bits)
 }
 EXPORT_SYMBOL(drm_need_swiotlb);
 
-static void memcpy_fallback(struct dma_buf_map *dst,
-			    const struct dma_buf_map *src,
+static void memcpy_fallback(struct iosys_map *dst,
+			    const struct iosys_map *src,
 			    unsigned long len)
 {
 	if (!dst->is_iomem && !src->is_iomem) {
 		memcpy(dst->vaddr, src->vaddr, len);
 	} else if (!src->is_iomem) {
-		dma_buf_map_memcpy_to(dst, src->vaddr, len);
+		iosys_map_memcpy_to(dst, src->vaddr, len);
 	} else if (!dst->is_iomem) {
 		memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
 	} else {
@@ -305,8 +305,8 @@ static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
  * Tries an arch optimized memcpy for prefetching reading out of a WC region,
  * and if no such beast is available, falls back to a normal memcpy.
  */
-void drm_memcpy_from_wc(struct dma_buf_map *dst,
-			const struct dma_buf_map *src,
+void drm_memcpy_from_wc(struct iosys_map *dst,
+			const struct iosys_map *src,
 			unsigned long len)
 {
 	if (WARN_ON(in_interrupt())) {
@@ -343,8 +343,8 @@ void drm_memcpy_init_early(void)
 		static_branch_enable(&has_movntdqa);
 }
 #else
-void drm_memcpy_from_wc(struct dma_buf_map *dst,
-			const struct dma_buf_map *src,
+void drm_memcpy_from_wc(struct iosys_map *dst,
+			const struct iosys_map *src,
 			unsigned long len)
 {
 	WARN_ON(in_interrupt());
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index ce45e380f4a2..af3b7395bf69 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -3,7 +3,7 @@
  * Copyright 2018 Noralf Trønnes
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -309,9 +309,10 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
  *	0 on success, or a negative errno code otherwise.
  */
 int
-drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map_copy)
+drm_client_buffer_vmap(struct drm_client_buffer *buffer,
+		       struct iosys_map *map_copy)
 {
-	struct dma_buf_map *map = &buffer->map;
+	struct iosys_map *map = &buffer->map;
 	int ret;
 
 	/*
@@ -342,7 +343,7 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	struct dma_buf_map *map = &buffer->map;
+	struct iosys_map *map = &buffer->map;
 
 	drm_gem_vunmap(buffer->gem, map);
 }
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ed43b987d306..e9a9d35fbf5e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -373,7 +373,7 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 
 static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 					   struct drm_clip_rect *clip,
-					   struct dma_buf_map *dst)
+					   struct iosys_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 	unsigned int cpp = fb->format->cpp[0];
@@ -382,11 +382,11 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y;
 
-	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
+	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
 
 	for (y = clip->y1; y < clip->y2; y++) {
-		dma_buf_map_memcpy_to(dst, src, len);
-		dma_buf_map_incr(dst, fb->pitches[0]);
+		iosys_map_memcpy_to(dst, src, len);
+		iosys_map_incr(dst, fb->pitches[0]);
 		src += fb->pitches[0];
 	}
 }
@@ -395,7 +395,7 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 				     struct drm_clip_rect *clip)
 {
 	struct drm_client_buffer *buffer = fb_helper->buffer;
-	struct dma_buf_map map, dst;
+	struct iosys_map map, dst;
 	int ret;
 
 	/*
@@ -2322,7 +2322,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	struct drm_framebuffer *fb;
 	struct fb_info *fbi;
 	u32 format;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 
 	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4dcdec6487bb..8c7b24f4b0e4 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -36,7 +36,7 @@
 #include <linux/pagemap.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/mem_encrypt.h>
 #include <linux/pagevec.h>
 
@@ -1165,7 +1165,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 		obj->funcs->unpin(obj);
 }
 
-int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
 
@@ -1175,23 +1175,23 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	ret = obj->funcs->vmap(obj, map);
 	if (ret)
 		return ret;
-	else if (dma_buf_map_is_null(map))
+	else if (iosys_map_is_null(map))
 		return -ENOMEM;
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_gem_vmap);
 
-void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	if (dma_buf_map_is_null(map))
+	if (iosys_map_is_null(map))
 		return;
 
 	if (obj->funcs->vunmap)
 		obj->funcs->vunmap(obj, map);
 
 	/* Always set the mapping to NULL. Callers may rely on this. */
-	dma_buf_map_clear(map);
+	iosys_map_clear(map);
 }
 EXPORT_SYMBOL(drm_gem_vunmap);
 
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index cefd0cbf9deb..88c432a7cb3c 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -209,7 +209,7 @@ drm_gem_cma_create_with_handle(struct drm_file *file_priv,
 void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj)
 {
 	struct drm_gem_object *gem_obj = &cma_obj->base;
-	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(cma_obj->vaddr);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(cma_obj->vaddr);
 
 	if (gem_obj->import_attach) {
 		if (cma_obj->vaddr)
@@ -480,9 +480,10 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
  * Returns:
  * 0 on success, or a negative error code otherwise.
  */
-int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct dma_buf_map *map)
+int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
+		     struct iosys_map *map)
 {
-	dma_buf_map_set_vaddr(map, cma_obj->vaddr);
+	iosys_map_set_vaddr(map, cma_obj->vaddr);
 
 	return 0;
 }
@@ -557,7 +558,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *obj;
-	struct dma_buf_map map;
+	struct iosys_map map;
 	int ret;
 
 	ret = dma_buf_vmap(attach->dmabuf, &map);
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 746fd8c73845..f4619803acd0 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -321,7 +321,7 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
  * @data: returns the data address for each BO, can be NULL
  *
  * This function maps all buffer objects of the given framebuffer into
- * kernel address space and stores them in struct dma_buf_map. If the
+ * kernel address space and stores them in struct iosys_map. If the
  * mapping operation fails for one of the BOs, the function unmaps the
  * already established mappings automatically.
  *
@@ -335,8 +335,8 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
  * 0 on success, or a negative errno code otherwise.
  */
 int drm_gem_fb_vmap(struct drm_framebuffer *fb,
-		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
-		    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES])
+		    struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
+		    struct iosys_map data[DRM_FORMAT_MAX_PLANES])
 {
 	struct drm_gem_object *obj;
 	unsigned int i;
@@ -345,7 +345,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
 	for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj) {
-			dma_buf_map_clear(&map[i]);
+			iosys_map_clear(&map[i]);
 			continue;
 		}
 		ret = drm_gem_vmap(obj, &map[i]);
@@ -356,9 +356,9 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
 	if (data) {
 		for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
 			memcpy(&data[i], &map[i], sizeof(data[i]));
-			if (dma_buf_map_is_null(&data[i]))
+			if (iosys_map_is_null(&data[i]))
 				continue;
-			dma_buf_map_incr(&data[i], fb->offsets[i]);
+			iosys_map_incr(&data[i], fb->offsets[i]);
 		}
 	}
 
@@ -386,7 +386,7 @@ EXPORT_SYMBOL(drm_gem_fb_vmap);
  * See drm_gem_fb_vmap() for more information.
  */
 void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
-		       struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES])
+		       struct iosys_map map[static DRM_FORMAT_MAX_PLANES])
 {
 	unsigned int i = DRM_FORMAT_MAX_PLANES;
 	struct drm_gem_object *obj;
@@ -396,7 +396,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj)
 			continue;
-		if (dma_buf_map_is_null(&map[i]))
+		if (iosys_map_is_null(&map[i]))
 			continue;
 		drm_gem_vunmap(obj, &map[i]);
 	}
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 621924116eb4..3e738aea2664 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -286,13 +286,14 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
+static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
+				     struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
 	if (shmem->vmap_use_count++ > 0) {
-		dma_buf_map_set_vaddr(map, shmem->vaddr);
+		iosys_map_set_vaddr(map, shmem->vaddr);
 		return 0;
 	}
 
@@ -319,7 +320,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
 		if (!shmem->vaddr)
 			ret = -ENOMEM;
 		else
-			dma_buf_map_set_vaddr(map, shmem->vaddr);
+			iosys_map_set_vaddr(map, shmem->vaddr);
 	}
 
 	if (ret) {
@@ -353,7 +354,8 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem, struct
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
+		       struct iosys_map *map)
 {
 	int ret;
 
@@ -368,7 +370,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *m
 EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
 static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
-					struct dma_buf_map *map)
+					struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -400,7 +402,8 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
  * This function hides the differences between dma-buf imported and natively
  * allocated objects.
  */
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map)
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
+			  struct iosys_map *map)
 {
 	mutex_lock(&shmem->vmap_lock);
 	drm_gem_shmem_vunmap_locked(shmem, map);
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index ecf3d2a54a98..d5962a34c01d 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -61,7 +61,7 @@ EXPORT_SYMBOL(drm_gem_ttm_print_info);
  * 0 on success, or a negative errno code otherwise.
  */
 int drm_gem_ttm_vmap(struct drm_gem_object *gem,
-		     struct dma_buf_map *map)
+		     struct iosys_map *map)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
 
@@ -78,7 +78,7 @@ EXPORT_SYMBOL(drm_gem_ttm_vmap);
  * &drm_gem_object_funcs.vmap callback.
  */
 void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
-			struct dma_buf_map *map)
+			struct iosys_map *map)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 3f00192215d1..dc7f938bfff2 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/module.h>
 
 #include <drm/drm_debugfs.h>
@@ -116,7 +116,7 @@ static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 	 */
 
 	WARN_ON(gbo->vmap_use_count);
-	WARN_ON(dma_buf_map_is_set(&gbo->map));
+	WARN_ON(iosys_map_is_set(&gbo->map));
 
 	drm_gem_object_release(&gbo->bo.base);
 }
@@ -365,7 +365,7 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
 static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				    struct dma_buf_map *map)
+				    struct iosys_map *map)
 {
 	int ret;
 
@@ -377,7 +377,7 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 	 * page mapping might still be around. Only vmap if the there's
 	 * no mapping present.
 	 */
-	if (dma_buf_map_is_null(&gbo->map)) {
+	if (iosys_map_is_null(&gbo->map)) {
 		ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
 		if (ret)
 			return ret;
@@ -391,14 +391,14 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 }
 
 static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
-				       struct dma_buf_map *map)
+				       struct iosys_map *map)
 {
 	struct drm_device *dev = gbo->bo.base.dev;
 
 	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
 		return;
 
-	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
+	if (drm_WARN_ON_ONCE(dev, !iosys_map_is_equal(&gbo->map, map)))
 		return; /* BUG: map not mapped from this BO */
 
 	if (--gbo->vmap_use_count > 0)
@@ -428,7 +428,7 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
  * Returns:
  * 0 on success, or a negative error code otherwise.
  */
-int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
 {
 	int ret;
 
@@ -463,7 +463,8 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
  * A call to drm_gem_vram_vunmap() unmaps and unpins a GEM VRAM buffer. See
  * the documentation for drm_gem_vram_vmap() for more information.
  */
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
+			 struct iosys_map *map)
 {
 	int ret;
 
@@ -567,7 +568,7 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo)
 		return;
 
 	ttm_bo_vunmap(bo, &gbo->map);
-	dma_buf_map_clear(&gbo->map); /* explicitly clear mapping for next vmap call */
+	iosys_map_clear(&gbo->map); /* explicitly clear mapping for next vmap call */
 }
 
 static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
@@ -802,7 +803,8 @@ static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
  * Returns:
  * 0 on success, or a negative error code otherwise.
  */
-static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_map *map)
+static int drm_gem_vram_object_vmap(struct drm_gem_object *gem,
+				    struct iosys_map *map)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
@@ -815,7 +817,8 @@ static int drm_gem_vram_object_vmap(struct drm_gem_object *gem, struct dma_buf_m
  * @gem: The GEM object to unmap
  * @map: Kernel virtual address where the VRAM GEM object was mapped
  */
-static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_buf_map *map)
+static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem,
+				       struct iosys_map *map)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..1fbbc19f1ac0 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -33,7 +33,7 @@
 
 struct dentry;
 struct dma_buf;
-struct dma_buf_map;
+struct iosys_map;
 struct drm_connector;
 struct drm_crtc;
 struct drm_framebuffer;
@@ -174,8 +174,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
-int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
+int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
+void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
 int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 			 u32 handle);
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 0327d595e028..9314f2ead79f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -201,8 +201,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	void *src;
 	int ret;
 
@@ -258,8 +258,8 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 
 static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index c773d3dfb1ab..e3f09f18110c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -674,7 +674,7 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
  *
  * Returns 0 on success or a negative errno code otherwise.
  */
-int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
@@ -690,7 +690,7 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
  * Releases a kernel virtual mapping. This can be used as the
  * &dma_buf_ops.vunmap callback. Calls into &drm_gem_object_funcs.vunmap for device specific handling.
  */
-void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
+void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index cc9de1632dd3..22deb216b59c 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -35,7 +35,7 @@
 
 #include <linux/scatterlist.h>
 
-struct dma_buf_map;
+struct iosys_map;
 
 void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
 void drm_clflush_sg(struct sg_table *st);
@@ -74,7 +74,7 @@ static inline bool drm_arch_can_wc_memory(void)
 
 void drm_memcpy_init_early(void);
 
-void drm_memcpy_from_wc(struct dma_buf_map *dst,
-			const struct dma_buf_map *src,
+void drm_memcpy_from_wc(struct iosys_map *dst,
+			const struct iosys_map *src,
 			unsigned long len);
 #endif
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index f07f2fb02e75..4fc8018eddda 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -3,7 +3,7 @@
 #ifndef _DRM_CLIENT_H_
 #define _DRM_CLIENT_H_
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
@@ -144,7 +144,7 @@ struct drm_client_buffer {
 	/**
 	 * @map: Virtual address for the buffer
 	 */
-	struct dma_buf_map map;
+	struct iosys_map map;
 
 	/**
 	 * @fb: DRM framebuffer
@@ -156,7 +156,8 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
-int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
+int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
+			   struct iosys_map *map);
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 
 int drm_client_modeset_create(struct drm_client_dev *client);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 35e7f44c2a75..e2941cee14b6 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,7 +39,7 @@
 
 #include <drm/drm_vma_manager.h>
 
-struct dma_buf_map;
+struct iosys_map;
 struct drm_gem_object;
 
 /**
@@ -139,7 +139,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
+	int (*vmap)(struct drm_gem_object *obj, struct iosys_map *map);
 
 	/**
 	 * @vunmap:
@@ -149,7 +149,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 */
-	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
+	void (*vunmap)(struct drm_gem_object *obj, struct iosys_map *map);
 
 	/**
 	 * @mmap:
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 0b1e2dd2ac3f..6e3319e9001a 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -3,7 +3,7 @@
 #ifndef __DRM_GEM_ATOMIC_HELPER_H__
 #define __DRM_GEM_ATOMIC_HELPER_H__
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
@@ -59,7 +59,7 @@ struct drm_shadow_plane_state {
 	 * The memory mappings stored in map should be established in the plane's
 	 * prepare_fb callback and removed in the cleanup_fb callback.
 	 */
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 
 	/**
 	 * @data: Address of each framebuffer BO's data
@@ -67,7 +67,7 @@ struct drm_shadow_plane_state {
 	 * The address of the data stored in each mapping. This is different
 	 * for framebuffers with non-zero offset fields.
 	 */
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 };
 
 /**
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index adb507a9dbf0..fbda4ce5d5fb 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -38,7 +38,8 @@ void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj);
 void drm_gem_cma_print_info(const struct drm_gem_cma_object *cma_obj,
 			    struct drm_printer *p, unsigned int indent);
 struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_cma_object *cma_obj);
-int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj, struct dma_buf_map *map);
+int drm_gem_cma_vmap(struct drm_gem_cma_object *cma_obj,
+		     struct iosys_map *map);
 int drm_gem_cma_mmap(struct drm_gem_cma_object *cma_obj, struct vm_area_struct *vma);
 
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
@@ -106,7 +107,8 @@ static inline struct sg_table *drm_gem_cma_object_get_sg_table(struct drm_gem_ob
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+static inline int drm_gem_cma_object_vmap(struct drm_gem_object *obj,
+					  struct iosys_map *map)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 905727719ead..1091e4fa08cb 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -2,7 +2,7 @@
 #define __DRM_GEM_FB_HELPER_H__
 
 #include <linux/dma-buf.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 #include <drm/drm_fourcc.h>
 
@@ -40,10 +40,10 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
 int drm_gem_fb_vmap(struct drm_framebuffer *fb,
-		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
-		    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES]);
+		    struct iosys_map map[static DRM_FORMAT_MAX_PLANES],
+		    struct iosys_map data[DRM_FORMAT_MAX_PLANES]);
 void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
-		       struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES]);
+		       struct iosys_map map[static DRM_FORMAT_MAX_PLANES]);
 int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
 void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 311d66c9cf4b..68347b63fc71 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -113,8 +113,10 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map);
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct dma_buf_map *map);
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
+		       struct iosys_map *map);
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
+			  struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
@@ -226,7 +228,8 @@ static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj,
+					    struct iosys_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
@@ -241,7 +244,8 @@ static inline int drm_gem_shmem_object_vmap(struct drm_gem_object *obj, struct d
  * This function wraps drm_gem_shmem_vunmap(). Drivers that employ the shmem helpers should
  * use it as their &drm_gem_object_funcs.vunmap handler.
  */
-static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+static inline void drm_gem_shmem_object_vunmap(struct drm_gem_object *obj,
+					       struct iosys_map *map)
 {
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm_helper.h
index 78040f6cc6f3..4c003b4f173e 100644
--- a/include/drm/drm_gem_ttm_helper.h
+++ b/include/drm/drm_gem_ttm_helper.h
@@ -10,7 +10,7 @@
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
-struct dma_buf_map;
+struct iosys_map;
 
 #define drm_gem_ttm_of_gem(gem_obj) \
 	container_of(gem_obj, struct ttm_buffer_object, base)
@@ -18,9 +18,9 @@ struct dma_buf_map;
 void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
 			    const struct drm_gem_object *gem);
 int drm_gem_ttm_vmap(struct drm_gem_object *gem,
-		     struct dma_buf_map *map);
+		     struct iosys_map *map);
 void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
-			struct dma_buf_map *map);
+			struct iosys_map *map);
 int drm_gem_ttm_mmap(struct drm_gem_object *gem,
 		     struct vm_area_struct *vma);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index b4ce27a72773..c083a1d71cf4 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -12,7 +12,7 @@
 #include <drm/ttm/ttm_bo_driver.h>
 
 #include <linux/container_of.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 
 struct drm_mode_create_dumb;
 struct drm_plane;
@@ -51,7 +51,7 @@ struct vm_area_struct;
  */
 struct drm_gem_vram_object {
 	struct ttm_buffer_object bo;
-	struct dma_buf_map map;
+	struct iosys_map map;
 
 	/**
 	 * @vmap_use_count:
@@ -97,8 +97,9 @@ void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
-int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
-void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
+int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
+void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
+			 struct iosys_map *map);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 54f2c58305d2..2a1d01e5b56b 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -54,7 +54,7 @@ struct device;
 struct dma_buf_export_info;
 struct dma_buf;
 struct dma_buf_attachment;
-struct dma_buf_map;
+struct iosys_map;
 
 enum dma_data_direction;
 
@@ -83,8 +83,8 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 void drm_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
 			   struct sg_table *sgt,
 			   enum dma_data_direction dir);
-int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
-void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct dma_buf_map *map);
+int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map);
+void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map);
 
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
-- 
2.35.0

