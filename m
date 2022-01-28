Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFA49F541
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE500112379;
	Fri, 28 Jan 2022 08:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03D112379;
 Fri, 28 Jan 2022 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358974; x=1674894974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=irMLArmDYJ8KJh5GxJu97h108L/P96bmOVzVn9jelQA=;
 b=DwCz0NL9uYys9hEm04j82ESFO/WRgfIOLP/M/fS/D1kKuIRKBIvq5dhx
 jWcdOZdZ7HjmHNmlBALt5SeSpVEUVlNE0GSmqrBBC1qXmXVApniNtc1pG
 uexyHlrXBYekgCkzNP6LE0VKIPSVT1iUpgSG6Qa0tIkpOOcMFAwNV7Pt/
 OSTeXkh7n74EFVHZyrq/orazgTlhWvuHmkLCAw41hyT7ApgIyfsDTlW+2
 LphSEEyAv6NoV4YmXEIT8SSN5VhE/HQiYNPqmyIZpQUIqsfyDyuw7W9NS
 5wNZod5SJP2Zo3rcj9TA1arBD04OFyocvcb0EhHXLahOyda1L4KmT5rKN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247025186"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="247025186"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788737"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] drm/ttm: Replace dma-buf-map with iosys-map
Date: Fri, 28 Jan 2022 00:36:17 -0800
Message-Id: <20220128083626.3012259-6-lucas.demarchi@intel.com>
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
capabitilities. Replace with the new API in the ttm layer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c  | 16 ++++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c | 26 +++++++++++++-------------
 drivers/gpu/drm/ttm/ttm_tt.c       |  6 +++---
 include/drm/ttm/ttm_bo_api.h       | 10 +++++-----
 include/drm/ttm/ttm_kmap_iter.h    | 10 +++++-----
 include/drm/ttm/ttm_resource.h     |  6 +++---
 6 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 544a84fa6589..2b8caa1efaa3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -33,7 +33,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_vma_manager.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/io.h>
 #include <linux/highmem.h>
 #include <linux/wait.h>
@@ -93,7 +93,7 @@ void ttm_move_memcpy(bool clear,
 {
 	const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
 	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
-	struct dma_buf_map src_map, dst_map;
+	struct iosys_map src_map, dst_map;
 	pgoff_t i;
 
 	/* Single TTM move. NOP */
@@ -390,7 +390,7 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 }
 EXPORT_SYMBOL(ttm_bo_kunmap);
 
-int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
+int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
 	int ret;
@@ -418,7 +418,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		if (!vaddr_iomem)
 			return -ENOMEM;
 
-		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
+		iosys_map_set_vaddr_iomem(map, vaddr_iomem);
 
 	} else {
 		struct ttm_operation_ctx ctx = {
@@ -442,25 +442,25 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		if (!vaddr)
 			return -ENOMEM;
 
-		dma_buf_map_set_vaddr(map, vaddr);
+		iosys_map_set_vaddr(map, vaddr);
 	}
 
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_vmap);
 
-void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
+void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
 
-	if (dma_buf_map_is_null(map))
+	if (iosys_map_is_null(map))
 		return;
 
 	if (!map->is_iomem)
 		vunmap(map->vaddr);
 	else if (!mem->bus.addr)
 		iounmap(map->vaddr_iomem);
-	dma_buf_map_clear(map);
+	iosys_map_clear(map);
 
 	ttm_mem_io_free(bo->bdev, bo->resource);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 68344c90549b..eedda3761506 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -22,7 +22,7 @@
  * Authors: Christian König
  */
 
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/io-mapping.h>
 #include <linux/scatterlist.h>
 
@@ -244,7 +244,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 EXPORT_SYMBOL(ttm_resource_manager_debug);
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
-					  struct dma_buf_map *dmap,
+					  struct iosys_map *dmap,
 					  pgoff_t i)
 {
 	struct ttm_kmap_iter_iomap *iter_io =
@@ -271,11 +271,11 @@ static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 	addr = io_mapping_map_local_wc(iter_io->iomap, iter_io->cache.offs +
 				       (((resource_size_t)i - iter_io->cache.i)
 					<< PAGE_SHIFT));
-	dma_buf_map_set_vaddr_iomem(dmap, addr);
+	iosys_map_set_vaddr_iomem(dmap, addr);
 }
 
 static void ttm_kmap_iter_iomap_unmap_local(struct ttm_kmap_iter *iter,
-					    struct dma_buf_map *map)
+					    struct iosys_map *map)
 {
 	io_mapping_unmap_local(map->vaddr_iomem);
 }
@@ -326,14 +326,14 @@ EXPORT_SYMBOL(ttm_kmap_iter_iomap_init);
  */
 
 static void ttm_kmap_iter_linear_io_map_local(struct ttm_kmap_iter *iter,
-					      struct dma_buf_map *dmap,
+					      struct iosys_map *dmap,
 					      pgoff_t i)
 {
 	struct ttm_kmap_iter_linear_io *iter_io =
 		container_of(iter, typeof(*iter_io), base);
 
 	*dmap = iter_io->dmap;
-	dma_buf_map_incr(dmap, i * PAGE_SIZE);
+	iosys_map_incr(dmap, i * PAGE_SIZE);
 }
 
 static const struct ttm_kmap_iter_ops ttm_kmap_iter_linear_io_ops = {
@@ -369,7 +369,7 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 	}
 
 	if (mem->bus.addr) {
-		dma_buf_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
+		iosys_map_set_vaddr(&iter_io->dmap, mem->bus.addr);
 		iter_io->needs_unmap = false;
 	} else {
 		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
@@ -377,23 +377,23 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 		iter_io->needs_unmap = true;
 		memset(&iter_io->dmap, 0, sizeof(iter_io->dmap));
 		if (mem->bus.caching == ttm_write_combined)
-			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
+			iosys_map_set_vaddr_iomem(&iter_io->dmap,
 						    ioremap_wc(mem->bus.offset,
 							       bus_size));
 		else if (mem->bus.caching == ttm_cached)
-			dma_buf_map_set_vaddr(&iter_io->dmap,
+			iosys_map_set_vaddr(&iter_io->dmap,
 					      memremap(mem->bus.offset, bus_size,
 						       MEMREMAP_WB |
 						       MEMREMAP_WT |
 						       MEMREMAP_WC));
 
 		/* If uncached requested or if mapping cached or wc failed */
-		if (dma_buf_map_is_null(&iter_io->dmap))
-			dma_buf_map_set_vaddr_iomem(&iter_io->dmap,
+		if (iosys_map_is_null(&iter_io->dmap))
+			iosys_map_set_vaddr_iomem(&iter_io->dmap,
 						    ioremap(mem->bus.offset,
 							    bus_size));
 
-		if (dma_buf_map_is_null(&iter_io->dmap)) {
+		if (iosys_map_is_null(&iter_io->dmap)) {
 			ret = -ENOMEM;
 			goto out_io_free;
 		}
@@ -422,7 +422,7 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 			     struct ttm_device *bdev,
 			     struct ttm_resource *mem)
 {
-	if (iter_io->needs_unmap && dma_buf_map_is_set(&iter_io->dmap)) {
+	if (iter_io->needs_unmap && iosys_map_is_set(&iter_io->dmap)) {
 		if (iter_io->dmap.is_iomem)
 			iounmap(iter_io->dmap.vaddr_iomem);
 		else
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 79c870a3bef8..ef6343b78d71 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -406,18 +406,18 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 }
 
 static void ttm_kmap_iter_tt_map_local(struct ttm_kmap_iter *iter,
-				       struct dma_buf_map *dmap,
+				       struct iosys_map *dmap,
 				       pgoff_t i)
 {
 	struct ttm_kmap_iter_tt *iter_tt =
 		container_of(iter, typeof(*iter_tt), base);
 
-	dma_buf_map_set_vaddr(dmap, kmap_local_page_prot(iter_tt->tt->pages[i],
+	iosys_map_set_vaddr(dmap, kmap_local_page_prot(iter_tt->tt->pages[i],
 							 iter_tt->prot));
 }
 
 static void ttm_kmap_iter_tt_unmap_local(struct ttm_kmap_iter *iter,
-					 struct dma_buf_map *map)
+					 struct iosys_map *map)
 {
 	kunmap_local(map->vaddr);
 }
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c17b2df9178b..155b19ee12fb 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -47,7 +47,7 @@ struct ttm_global;
 
 struct ttm_device;
 
-struct dma_buf_map;
+struct iosys_map;
 
 struct drm_mm_node;
 
@@ -481,17 +481,17 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
  * ttm_bo_vmap
  *
  * @bo: The buffer object.
- * @map: pointer to a struct dma_buf_map representing the map.
+ * @map: pointer to a struct iosys_map representing the map.
  *
  * Sets up a kernel virtual mapping, using ioremap or vmap to the
  * data in the buffer object. The parameter @map returns the virtual
- * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap().
+ * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
  *
  * Returns
  * -ENOMEM: Out of memory.
  * -EINVAL: Invalid range.
  */
-int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
+int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 
 /**
  * ttm_bo_vunmap
@@ -501,7 +501,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
  *
  * Unmaps a kernel map set up by ttm_bo_vmap().
  */
-void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
+void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 
 /**
  * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
diff --git a/include/drm/ttm/ttm_kmap_iter.h b/include/drm/ttm/ttm_kmap_iter.h
index 8bb00fd39d6c..cc5c09a211b4 100644
--- a/include/drm/ttm/ttm_kmap_iter.h
+++ b/include/drm/ttm/ttm_kmap_iter.h
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 struct ttm_kmap_iter;
-struct dma_buf_map;
+struct iosys_map;
 
 /**
  * struct ttm_kmap_iter_ops - Ops structure for a struct
@@ -24,22 +24,22 @@ struct ttm_kmap_iter_ops {
 	 * kmap_local semantics.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
-	 * @dmap: The struct dma_buf_map holding the virtual address after
+	 * @dmap: The struct iosys_map holding the virtual address after
 	 * the operation.
 	 * @i: The location within the resource to map. PAGE_SIZE granularity.
 	 */
 	void (*map_local)(struct ttm_kmap_iter *res_iter,
-			  struct dma_buf_map *dmap, pgoff_t i);
+			  struct iosys_map *dmap, pgoff_t i);
 	/**
 	 * unmap_local() - Unmap a PAGE_SIZE part of the resource previously
 	 * mapped using kmap_local.
 	 * @res_iter: Pointer to the struct ttm_kmap_iter representing
 	 * the resource.
-	 * @dmap: The struct dma_buf_map holding the virtual address after
+	 * @dmap: The struct iosys_map holding the virtual address after
 	 * the operation.
 	 */
 	void (*unmap_local)(struct ttm_kmap_iter *res_iter,
-			    struct dma_buf_map *dmap);
+			    struct iosys_map *dmap);
 	bool maps_tt;
 };
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69eea9d6399b..4fd727b52da1 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -27,7 +27,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
-#include <linux/dma-buf-map.h>
+#include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
@@ -41,7 +41,7 @@ struct ttm_resource;
 struct ttm_place;
 struct ttm_buffer_object;
 struct ttm_placement;
-struct dma_buf_map;
+struct iosys_map;
 struct io_mapping;
 struct sg_table;
 struct scatterlist;
@@ -210,7 +210,7 @@ struct ttm_kmap_iter_iomap {
  */
 struct ttm_kmap_iter_linear_io {
 	struct ttm_kmap_iter base;
-	struct dma_buf_map dmap;
+	struct iosys_map dmap;
 	bool needs_unmap;
 };
 
-- 
2.35.0

