Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0274DA1EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4E10E43E;
	Tue, 15 Mar 2022 18:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F6F10E3D9;
 Tue, 15 Mar 2022 18:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 052B61F4214F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367509;
 bh=DsgjoK4LQ0Ly1eGE4+wdIjNPUCeUIRPSa/I2TX1Fe60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EnrQeOtS0Lw8sjUpWtPfoHxS52KcgRzYKsiVY3/eB8i3oxs9pnMGcNMCdPhfGvUH4
 XyHOUG2QaaBGE1BHGlcEB4YlY8vP5FmI7n+CjEdkcn4U4j8YWBmGbppmzhkiDAnFIA
 vq6DHiktdO3+ED7Co2T/AWnEl/h72EHZpFHfTh8Vi7gld4j60+sVCLGfH+d9jE9YgQ
 uAQ1PxUzjewIY5nlVQw+xv9z5M0Tge/mChj828ltjOAvlCsoJI1JLl46Z2E8PaxRRY
 6nR09Gie1K1sGIIciAt/zsKH86I1XfFvlzfMl+0gUEqjB5YhkHOasn9a38eg2P0636
 Vaw7ZU83n0iHg==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 4/7] drm/i915: stolen memory use ttm backend
Date: Tue, 15 Mar 2022 18:04:41 +0000
Message-Id: <20220315180444.3327283-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 385 ++-------------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h |   9 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h    |   7 +
 4 files changed, 40 insertions(+), 375 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 265133cb2a47..e58f9902ef47 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -4,19 +4,22 @@
  * Copyright © 2008-2012 Intel Corporation
  */
 
+#include "drm/ttm/ttm_placement.h"
+#include "gem/i915_gem_object_types.h"
 #include <linux/errno.h>
 #include <linux/mutex.h>
 
-#include <drm/drm_mm.h>
 #include <drm/i915_drm.h>
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "gem/i915_gem_ttm.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
 #include "i915_reg.h"
 #include "i915_vgpu.h"
 #include "intel_mchbar_regs.h"
+#include "intel_region_ttm.h"
 
 /*
  * The BIOS typically reserves some of the system's memory for the exclusive
@@ -30,46 +33,6 @@
  * for is a boon.
  */
 
-int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *i915,
-					 struct drm_mm_node *node, u64 size,
-					 unsigned alignment, u64 start, u64 end)
-{
-	int ret;
-
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return -ENODEV;
-
-	/* WaSkipStolenMemoryFirstPage:bdw+ */
-	if (GRAPHICS_VER(i915) >= 8 && start < 4096)
-		start = 4096;
-
-	mutex_lock(&i915->mm.stolen_lock);
-	ret = drm_mm_insert_node_in_range(&i915->mm.stolen, node,
-					  size, alignment, 0,
-					  start, end, DRM_MM_INSERT_BEST);
-	mutex_unlock(&i915->mm.stolen_lock);
-
-	return ret;
-}
-
-int i915_gem_stolen_insert_node(struct drm_i915_private *i915,
-				struct drm_mm_node *node, u64 size,
-				unsigned alignment)
-{
-	return i915_gem_stolen_insert_node_in_range(i915, node,
-						    size, alignment,
-						    I915_GEM_STOLEN_BIAS,
-						    U64_MAX);
-}
-
-void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
-				 struct drm_mm_node *node)
-{
-	mutex_lock(&i915->mm.stolen_lock);
-	drm_mm_remove_node(node);
-	mutex_unlock(&i915->mm.stolen_lock);
-}
-
 static int i915_adjust_stolen(struct drm_i915_private *i915,
 			      struct resource *dsm)
 {
@@ -170,14 +133,6 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 	return 0;
 }
 
-static void i915_gem_cleanup_stolen(struct drm_i915_private *i915)
-{
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return;
-
-	drm_mm_takedown(&i915->mm.stolen);
-}
-
 static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 				    struct intel_uncore *uncore,
 				    resource_size_t *base,
@@ -510,216 +465,15 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		return 0;
 
 	/* Basic memrange allocator for stolen space. */
-	drm_mm_init(&i915->mm.stolen, 0, i915->stolen_usable_size);
-
-	return 0;
-}
-
-static void dbg_poison(struct i915_ggtt *ggtt,
-		       dma_addr_t addr, resource_size_t size,
-		       u8 x)
-{
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
-	if (!drm_mm_node_allocated(&ggtt->error_capture))
-		return;
-
-	if (ggtt->vm.bind_async_flags & I915_VMA_GLOBAL_BIND)
-		return; /* beware stop_machine() inversion */
-
-	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
-
-	mutex_lock(&ggtt->error_mutex);
-	while (size) {
-		void __iomem *s;
-
-		ggtt->vm.insert_page(&ggtt->vm, addr,
-				     ggtt->error_capture.start,
-				     I915_CACHE_NONE, 0);
-		mb();
-
-		s = io_mapping_map_wc(&ggtt->iomap,
-				      ggtt->error_capture.start,
-				      PAGE_SIZE);
-		memset_io(s, x, PAGE_SIZE);
-		io_mapping_unmap(s);
-
-		addr += PAGE_SIZE;
-		size -= PAGE_SIZE;
-	}
-	mb();
-	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
-	mutex_unlock(&ggtt->error_mutex);
-#endif
-}
-
-static struct sg_table *
-i915_pages_create_for_stolen(struct drm_device *dev,
-			     resource_size_t offset, resource_size_t size)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	struct sg_table *st;
-	struct scatterlist *sg;
-
-	GEM_BUG_ON(range_overflows(offset, size, resource_size(&i915->dsm)));
-
-	/* We hide that we have no struct page backing our stolen object
-	 * by wrapping the contiguous physical allocation with a fake
-	 * dma mapping in a single scatterlist.
-	 */
-
-	st = kmalloc(sizeof(*st), GFP_KERNEL);
-	if (st == NULL)
-		return ERR_PTR(-ENOMEM);
-
-	if (sg_alloc_table(st, 1, GFP_KERNEL)) {
-		kfree(st);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	sg = st->sgl;
-	sg->offset = 0;
-	sg->length = size;
-
-	sg_dma_address(sg) = (dma_addr_t)i915->dsm.start + offset;
-	sg_dma_len(sg) = size;
-
-	return st;
-}
-
-static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct sg_table *pages =
-		i915_pages_create_for_stolen(obj->base.dev,
-					     obj->stolen->start,
-					     obj->stolen->size);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
-
-	dbg_poison(to_gt(i915)->ggtt,
-		   sg_dma_address(pages->sgl),
-		   sg_dma_len(pages->sgl),
-		   POISON_INUSE);
-
-	__i915_gem_object_set_pages(obj, pages, obj->stolen->size);
-
-	return 0;
-}
-
-static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
-					     struct sg_table *pages)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	/* Should only be called from i915_gem_object_release_stolen() */
-
-	dbg_poison(to_gt(i915)->ggtt,
-		   sg_dma_address(pages->sgl),
-		   sg_dma_len(pages->sgl),
-		   POISON_FREE);
-
-	sg_free_table(pages);
-	kfree(pages);
-}
-
-static void
-i915_gem_object_release_stolen(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct drm_mm_node *stolen = fetch_and_zero(&obj->stolen);
-
-	GEM_BUG_ON(!stolen);
-	i915_gem_stolen_remove_node(i915, stolen);
-	kfree(stolen);
-
-	i915_gem_object_release_memory_region(obj);
-}
-
-static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
-	.name = "i915_gem_object_stolen",
-	.get_pages = i915_gem_object_get_pages_stolen,
-	.put_pages = i915_gem_object_put_pages_stolen,
-	.release = i915_gem_object_release_stolen,
-};
-
-static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
-					   struct drm_i915_gem_object *obj,
-					   struct drm_mm_node *stolen)
-{
-	static struct lock_class_key lock_class;
-	unsigned int cache_level;
-	unsigned int flags;
-	int err;
-
-	/*
-	 * Stolen objects are always physically contiguous since we just
-	 * allocate one big block underneath using the drm_mm range allocator.
-	 */
-	flags = I915_BO_ALLOC_CONTIGUOUS;
-
-	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
-
-	obj->stolen = stolen;
-	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
-	cache_level = HAS_LLC(mem->i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
-	i915_gem_object_set_cache_coherency(obj, cache_level);
-
-	if (WARN_ON(!i915_gem_object_trylock(obj, NULL)))
-		return -EBUSY;
-
-	i915_gem_object_init_memory_region(obj, mem);
-
-	err = i915_gem_object_pin_pages(obj);
-	if (err)
-		i915_gem_object_release_memory_region(obj);
-	i915_gem_object_unlock(obj);
-
-	return err;
-}
-
-static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
-					struct drm_i915_gem_object *obj,
-					resource_size_t size,
-					resource_size_t page_size,
-					unsigned int flags)
-{
-	struct drm_i915_private *i915 = mem->i915;
-	struct drm_mm_node *stolen;
-	int ret;
-
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return -ENODEV;
-
-	if (size == 0)
-		return -EINVAL;
-
-	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-	if (!stolen)
-		return -ENOMEM;
-
-	ret = i915_gem_stolen_insert_node(i915, stolen, size,
-					  mem->min_page_size);
-	if (ret)
-		goto err_free;
-
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret)
-		goto err_remove;
-
-	return 0;
-
-err_remove:
-	i915_gem_stolen_remove_node(i915, stolen);
-err_free:
-	kfree(stolen);
-	return ret;
+	return intel_region_ttm_init(mem);
 }
 
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0, 0);
+	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0,
+					     I915_BO_ALLOC_CONTIGUOUS);
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
@@ -731,16 +485,11 @@ static int init_stolen_smem(struct intel_memory_region *mem)
 	return i915_gem_init_stolen(mem);
 }
 
-static int release_stolen_smem(struct intel_memory_region *mem)
-{
-	i915_gem_cleanup_stolen(mem->i915);
-	return 0;
-}
-
 static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
 	.init = init_stolen_smem,
-	.release = release_stolen_smem,
-	.init_object = _i915_gem_object_stolen_init,
+	.release = intel_region_ttm_fini,
+	.init_object = __i915_gem_ttm_object_init,
+	.init_object_in_place = i915_gem_ttm_object_init_in_place,
 };
 
 static int init_stolen_lmem(struct intel_memory_region *mem)
@@ -774,14 +523,14 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 static int release_stolen_lmem(struct intel_memory_region *mem)
 {
 	io_mapping_fini(&mem->iomap);
-	i915_gem_cleanup_stolen(mem->i915);
-	return 0;
+	return intel_region_ttm_fini(mem);
 }
 
 static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
 	.init = init_stolen_lmem,
 	.release = release_stolen_lmem,
-	.init_object = _i915_gem_object_stolen_init,
+	.init_object = __i915_gem_ttm_object_init,
+	.init_object_in_place = i915_gem_ttm_object_init_in_place,
 };
 
 struct intel_memory_region *
@@ -855,56 +604,10 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 					       resource_size_t stolen_offset,
 					       resource_size_t size)
 {
-	struct intel_memory_region *mem = i915->mm.stolen_region;
-	struct drm_i915_gem_object *obj;
-	struct drm_mm_node *stolen;
-	int ret;
-
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return ERR_PTR(-ENODEV);
-
-	drm_dbg(&i915->drm,
-		"creating preallocated stolen object: stolen_offset=%pa, size=%pa\n",
-		&stolen_offset, &size);
-
-	/* KISS and expect everything to be page-aligned */
-	if (GEM_WARN_ON(size == 0) ||
-	    GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
-	    GEM_WARN_ON(!IS_ALIGNED(stolen_offset, mem->min_page_size)))
-		return ERR_PTR(-EINVAL);
-
-	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-	if (!stolen)
-		return ERR_PTR(-ENOMEM);
-
-	stolen->start = stolen_offset;
-	stolen->size = size;
-	mutex_lock(&i915->mm.stolen_lock);
-	ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
-	mutex_unlock(&i915->mm.stolen_lock);
-	if (ret)
-		goto err_free;
-
-	obj = i915_gem_object_alloc();
-	if (!obj) {
-		ret = -ENOMEM;
-		goto err_stolen;
-	}
-
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret)
-		goto err_object_free;
-
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
-	return obj;
-
-err_object_free:
-	i915_gem_object_free(obj);
-err_stolen:
-	i915_gem_stolen_remove_node(i915, stolen);
-err_free:
-	kfree(stolen);
-	return ERR_PTR(ret);
+	return i915_gem_object_create_region_in_place(i915->mm.stolen_region, size, 0,
+						      I915_BO_ALLOC_CONTIGUOUS,
+						      stolen_offset,
+						      stolen_offset + size);
 }
 
 struct drm_i915_gem_object *
@@ -913,61 +616,25 @@ i915_gem_object_create_stolen_in_range(struct drm_i915_private *i915,
 				       resource_size_t alignment,
 				       u64 start, u64 end)
 {
-	struct intel_memory_region *mem = i915->mm.stolen_region;
-	struct drm_i915_gem_object *obj;
-	struct drm_mm_node *stolen;
-	int ret;
-
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return ERR_PTR(-ENODEV);
-
-	/* KISS and expect everything to be page-aligned */
-	if (GEM_WARN_ON(size == 0) ||
-	    GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
-	    GEM_WARN_ON(!IS_ALIGNED(alignment, mem->min_page_size)))
-		return ERR_PTR(-EINVAL);
-
-	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-	if (!stolen)
-		return ERR_PTR(-ENOMEM);
-
-	ret = i915_gem_stolen_insert_node_in_range(i915, stolen, size,
-						   alignment, start, end);
-	if (ret)
-		goto err_free;
-
-	obj = i915_gem_object_alloc();
-	if (!obj) {
-		ret = -ENOMEM;
-		goto err_stolen;
-	}
-
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret)
-		goto err_object_free;
-
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
-	return obj;
-
-err_object_free:
-	i915_gem_object_free(obj);
-err_stolen:
-	i915_gem_stolen_remove_node(i915, stolen);
-err_free:
-	kfree(stolen);
-	return ERR_PTR(ret);
+	return i915_gem_object_create_region_in_place(i915->mm.stolen_region, size, 0,
+						      I915_BO_ALLOC_CONTIGUOUS,
+						      start, end);
 }
 
 u64 i915_gem_object_stolen_offset(const struct drm_i915_gem_object *obj)
 {
+	struct ttm_buffer_object *ttm_obj;
 	if (!obj || !i915_gem_object_is_stolen(obj))
 		return 0;
 
-	return obj->stolen->start;
+	ttm_obj = i915_gem_to_ttm((struct drm_i915_gem_object *)obj);
+
+	return ttm_obj->resource->start;
 }
 
 
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
 {
-	return obj->ops == &i915_gem_object_stolen_ops;
+	return obj->mm.region->type == INTEL_MEMORY_STOLEN_SYSTEM ||
+	       obj->mm.region->type == INTEL_MEMORY_STOLEN_LOCAL;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index 494e90f130f4..921e51a5bbc4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -12,15 +12,6 @@ struct drm_i915_private;
 struct drm_mm_node;
 struct drm_i915_gem_object;
 
-int i915_gem_stolen_insert_node(struct drm_i915_private *dev_priv,
-				struct drm_mm_node *node, u64 size,
-				unsigned alignment);
-int i915_gem_stolen_insert_node_in_range(struct drm_i915_private *dev_priv,
-					 struct drm_mm_node *node, u64 size,
-					 unsigned alignment, u64 start,
-					 u64 end);
-void i915_gem_stolen_remove_node(struct drm_i915_private *dev_priv,
-				 struct drm_mm_node *node);
 struct intel_memory_region *
 i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 			   u16 instance);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 35d1bde19267..b26bde6a4bb9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1232,13 +1232,13 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
  *
  * Return: 0 on success, negative error code on failure.
  */
-static int i915_gem_ttm_object_init_in_place(struct intel_memory_region *mem,
-					     struct drm_i915_gem_object *obj,
-					     resource_size_t size,
-					     resource_size_t page_size,
-					     unsigned int flags,
-					     u64 start,
-					     u64 end)
+int i915_gem_ttm_object_init_in_place(struct intel_memory_region *mem,
+				      struct drm_i915_gem_object *obj,
+				      resource_size_t size,
+				      resource_size_t page_size,
+				      unsigned int flags,
+				      u64 start,
+				      u64 end)
 {
 	struct ttm_place place;
 	struct ttm_placement placement = {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 9d698ad00853..f8ff52d81072 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -48,6 +48,13 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       resource_size_t size,
 			       resource_size_t page_size,
 			       unsigned int flags);
+int i915_gem_ttm_object_init_in_place(struct intel_memory_region *mem,
+				      struct drm_i915_gem_object *obj,
+				      resource_size_t size,
+				      resource_size_t page_size,
+				      unsigned int flags,
+				      u64 start,
+				      u64 end);
 
 /* Internal I915 TTM declarations and definitions below. */
 
-- 
2.25.1

