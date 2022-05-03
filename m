Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2295518D05
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 21:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151110E7EB;
	Tue,  3 May 2022 19:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C494410E754;
 Tue,  3 May 2022 19:13:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 50D561F44698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651605223;
 bh=iDrLiUr7kfhLHSHG8Xljl0mAzR8N9lY5NIevDtzj8IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/LF4PJ9nmgXF46P7MfZKBEV0exbEUHFJZ1z8OYVeejgK7Z5+ghY/7mKCxxf5Wgub
 RMirF6jE6nNy/kuftAK2MFIOkwDJwqWtx0HPcuwwvt8zRgtXnW+pFBhGCP0MBA0pGX
 PRbc5cTVE/pSFZQSzfWpqZE89nkUCtW5aiPaB56eLH0VYd28zLxecjYyN8qO7r4lTE
 BgmdlNfHlciC/WVJArCQTr7qqFMjVgeafyknxMoIGlKOwdvuU9UFEaGF7/V8ZA1YXB
 9GSwiXqMtzKExlQ5KJgOXwgrgUO9X4MZUlhWkOLe+dNDb57KbK/fbnoD7HBpGtAX5b
 b9lYGS4jtiE7w==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/4] drm/i915: internal buffers use ttm backend
Date: Tue,  3 May 2022 19:13:16 +0000
Message-Id: <20220503191316.1145124-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503191316.1145124-1-bob.beckett@collabora.com>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

refactor internal buffer backend to allocate volatile pages via
ttm pool allocator

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c | 264 ++++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_internal.h |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      |  12 +-
 4 files changed, 125 insertions(+), 168 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index c698f95af15f..815ec9466cc0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -4,156 +4,119 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
-#include <linux/scatterlist.h>
-#include <linux/slab.h>
-#include <linux/swiotlb.h>
-
+#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_placement.h>
+#include "drm/ttm/ttm_bo_api.h"
+#include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_region.h"
+#include "gem/i915_gem_ttm.h"
 #include "i915_drv.h"
-#include "i915_gem.h"
-#include "i915_gem_internal.h"
-#include "i915_gem_object.h"
-#include "i915_scatterlist.h"
-#include "i915_utils.h"
-
-#define QUIET (__GFP_NORETRY | __GFP_NOWARN)
-#define MAYFAIL (__GFP_RETRY_MAYFAIL | __GFP_NOWARN)
-
-static void internal_free_pages(struct sg_table *st)
-{
-	struct scatterlist *sg;
-
-	for (sg = st->sgl; sg; sg = __sg_next(sg)) {
-		if (sg_page(sg))
-			__free_pages(sg_page(sg), get_order(sg->length));
-	}
-
-	sg_free_table(st);
-	kfree(st);
-}
 
-static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
+static int i915_internal_get_pages(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct sg_table *st;
-	struct scatterlist *sg;
-	unsigned int sg_page_sizes;
-	unsigned int npages;
-	int max_order;
-	gfp_t gfp;
-
-	max_order = MAX_ORDER;
-#ifdef CONFIG_SWIOTLB
-	if (is_swiotlb_active(obj->base.dev->dev)) {
-		unsigned int max_segment;
-
-		max_segment = swiotlb_max_segment();
-		if (max_segment) {
-			max_segment = max_t(unsigned int, max_segment,
-					    PAGE_SIZE) >> PAGE_SHIFT;
-			max_order = min(max_order, ilog2(max_segment));
-		}
+	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+	};
+	struct ttm_place place = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = I915_PL_SYSTEM,
+		.flags = 0,
+	};
+	struct ttm_placement placement = {
+		.num_placement = 1,
+		.placement = &place,
+		.num_busy_placement = 0,
+		.busy_placement = NULL,
+	};
+	int ret;
+
+	ret = ttm_bo_validate(bo, &placement, &ctx);
+	if (ret) {
+		ret = i915_ttm_err_to_gem(ret);
+		return ret;
 	}
-#endif
 
-	gfp = GFP_KERNEL | __GFP_HIGHMEM | __GFP_RECLAIMABLE;
-	if (IS_I965GM(i915) || IS_I965G(i915)) {
-		/* 965gm cannot relocate objects above 4GiB. */
-		gfp &= ~__GFP_HIGHMEM;
-		gfp |= __GFP_DMA32;
+	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
+		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+		if (ret)
+			return ret;
 	}
 
-create_st:
-	st = kmalloc(sizeof(*st), GFP_KERNEL);
-	if (!st)
-		return -ENOMEM;
+	if (!i915_gem_object_has_pages(obj)) {
+		struct i915_refct_sgt *rsgt =
+			i915_ttm_resource_get_st(obj, bo->resource);
 
-	npages = obj->base.size / PAGE_SIZE;
-	if (sg_alloc_table(st, npages, GFP_KERNEL)) {
-		kfree(st);
-		return -ENOMEM;
-	}
+		if (IS_ERR(rsgt))
+			return PTR_ERR(rsgt);
 
-	sg = st->sgl;
-	st->nents = 0;
-	sg_page_sizes = 0;
-
-	do {
-		int order = min(fls(npages) - 1, max_order);
-		struct page *page;
-
-		do {
-			page = alloc_pages(gfp | (order ? QUIET : MAYFAIL),
-					   order);
-			if (page)
-				break;
-			if (!order--)
-				goto err;
-
-			/* Limit subsequent allocations as well */
-			max_order = order;
-		} while (1);
-
-		sg_set_page(sg, page, PAGE_SIZE << order, 0);
-		sg_page_sizes |= PAGE_SIZE << order;
-		st->nents++;
-
-		npages -= 1 << order;
-		if (!npages) {
-			sg_mark_end(sg);
-			break;
-		}
-
-		sg = __sg_next(sg);
-	} while (1);
-
-	if (i915_gem_gtt_prepare_pages(obj, st)) {
-		/* Failed to dma-map try again with single page sg segments */
-		if (get_order(st->sgl->length)) {
-			internal_free_pages(st);
-			max_order = 0;
-			goto create_st;
-		}
-		goto err;
+		GEM_BUG_ON(obj->mm.rsgt);
+		obj->mm.rsgt = rsgt;
+		__i915_gem_object_set_pages(obj, &rsgt->table,
+					    i915_sg_dma_sizes(rsgt->table.sgl));
 	}
 
-	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
+	GEM_BUG_ON(bo->ttm && ((obj->base.size >> PAGE_SHIFT) < bo->ttm->num_pages));
+	i915_ttm_adjust_lru(obj);
 
 	return 0;
+}
 
-err:
-	sg_set_page(sg, NULL, 0, 0);
-	sg_mark_end(sg);
-	internal_free_pages(st);
+static const struct drm_i915_gem_object_ops i915_gem_object_internal_ops = {
+	.name = "i915_gem_object_ttm",
+	.flags = I915_GEM_OBJECT_IS_SHRINKABLE,
 
-	return -ENOMEM;
-}
+	.get_pages = i915_internal_get_pages,
+	.put_pages = i915_ttm_put_pages,
+	.adjust_lru = i915_ttm_adjust_lru,
+	.delayed_free = i915_ttm_delayed_free,
+};
 
-static void i915_gem_object_put_pages_internal(struct drm_i915_gem_object *obj,
-					       struct sg_table *pages)
+void i915_ttm_internal_bo_destroy(struct ttm_buffer_object *bo)
 {
-	i915_gem_gtt_finish_pages(obj, pages);
-	internal_free_pages(pages);
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
-	obj->mm.dirty = false;
+	mutex_destroy(&obj->ttm.get_io_page.lock);
 
-	__start_cpu_write(obj);
-}
+	if (obj->ttm.created) {
+		/* This releases all gem object bindings to the backend. */
+		__i915_gem_free_object(obj);
 
-static const struct drm_i915_gem_object_ops i915_gem_object_internal_ops = {
-	.name = "i915_gem_object_internal",
-	.flags = I915_GEM_OBJECT_IS_SHRINKABLE,
-	.get_pages = i915_gem_object_get_pages_internal,
-	.put_pages = i915_gem_object_put_pages_internal,
-};
+		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
+	} else {
+		__i915_gem_object_fini(obj);
+	}
+}
 
+/**
+ * i915_gem_object_create_internal: create an object with volatile pages
+ * @i915: the i915 device
+ * @size: the size in bytes of backing storage to allocate for the object
+ *
+ * Creates a new object that wraps some internal memory for private use.
+ * This object is not backed by swappable storage, and as such its contents
+ * are volatile and only valid whilst pinned. If the object is reaped by the
+ * shrinker, its pages and data will be discarded. Equally, it is not a full
+ * GEM object and so not valid for access from userspace. This makes it useful
+ * for hardware interfaces like ringbuffers (which are pinned from the time
+ * the request is written to the time the hardware stops accessing it), but
+ * not for contexts (which need to be preserved when not active for later
+ * reuse). Note that it is not cleared upon allocation.
+ */
 struct drm_i915_gem_object *
-__i915_gem_object_create_internal(struct drm_i915_private *i915,
-				  const struct drm_i915_gem_object_ops *ops,
-				  phys_addr_t size)
+i915_gem_object_create_internal(struct drm_i915_private *i915,
+				phys_addr_t size)
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
 	unsigned int cache_level;
+	struct ttm_operation_ctx ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+	};
+	int ret;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
@@ -166,45 +129,34 @@ __i915_gem_object_create_internal(struct drm_i915_private *i915,
 		return ERR_PTR(-ENOMEM);
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
-	i915_gem_object_init(obj, ops, &lock_class, 0);
-	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
+	i915_gem_object_init(obj, &i915_gem_object_internal_ops, &lock_class,
+			     I915_BO_ALLOC_VOLATILE);
+
+	INIT_LIST_HEAD(&obj->mm.region_link);
+
+	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
+	mutex_init(&obj->ttm.get_io_page.lock);
 
-	/*
-	 * Mark the object as volatile, such that the pages are marked as
-	 * dontneed whilst they are still pinned. As soon as they are unpinned
-	 * they are allowed to be reaped by the shrinker, and the caller is
-	 * expected to repopulate - the contents of this object are only valid
-	 * whilst active and pinned.
-	 */
-	i915_gem_object_set_volatile(obj);
+	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 
+	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
+				   ttm_bo_type_kernel, i915_ttm_sys_placement(),
+				   0, &ctx, NULL, NULL, i915_ttm_internal_bo_destroy);
+	if (ret) {
+		ret = i915_ttm_err_to_gem(ret);
+		i915_gem_object_free(obj);
+		return ERR_PTR(ret);
+	}
+
+	obj->ttm.created = true;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
-
+	obj->mem_flags &= ~I915_BO_FLAG_IOMEM;
+	obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
 	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
 	i915_gem_object_set_cache_coherency(obj, cache_level);
+	i915_gem_object_unlock(obj);
 
 	return obj;
 }
 
-/**
- * i915_gem_object_create_internal: create an object with volatile pages
- * @i915: the i915 device
- * @size: the size in bytes of backing storage to allocate for the object
- *
- * Creates a new object that wraps some internal memory for private use.
- * This object is not backed by swappable storage, and as such its contents
- * are volatile and only valid whilst pinned. If the object is reaped by the
- * shrinker, its pages and data will be discarded. Equally, it is not a full
- * GEM object and so not valid for access from userspace. This makes it useful
- * for hardware interfaces like ringbuffers (which are pinned from the time
- * the request is written to the time the hardware stops accessing it), but
- * not for contexts (which need to be preserved when not active for later
- * reuse). Note that it is not cleared upon allocation.
- */
-struct drm_i915_gem_object *
-i915_gem_object_create_internal(struct drm_i915_private *i915,
-				phys_addr_t size)
-{
-	return __i915_gem_object_create_internal(i915, &i915_gem_object_internal_ops, size);
-}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.h b/drivers/gpu/drm/i915/gem/i915_gem_internal.h
index 6664e06112fc..524e1042b20f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.h
@@ -15,9 +15,4 @@ struct drm_i915_private;
 struct drm_i915_gem_object *
 i915_gem_object_create_internal(struct drm_i915_private *i915,
 				phys_addr_t size);
-struct drm_i915_gem_object *
-__i915_gem_object_create_internal(struct drm_i915_private *i915,
-				  const struct drm_i915_gem_object_ops *ops,
-				  phys_addr_t size);
-
 #endif /* __I915_GEM_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index fdb3a1c18cb6..92195ead8c11 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -83,7 +83,7 @@ struct ttm_placement *i915_ttm_sys_placement(void)
 	return &i915_sys_placement;
 }
 
-static int i915_ttm_err_to_gem(int err)
+int i915_ttm_err_to_gem(int err)
 {
 	/* Fastpath */
 	if (likely(!err))
@@ -745,8 +745,8 @@ struct ttm_device_funcs *i915_ttm_driver(void)
 	return &i915_ttm_bo_driver;
 }
 
-static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
-				struct ttm_placement *placement)
+int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
+			 struct ttm_placement *placement)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	struct ttm_operation_ctx ctx = {
@@ -871,8 +871,8 @@ static int i915_ttm_migrate(struct drm_i915_gem_object *obj,
 	return __i915_ttm_migrate(obj, mr, obj->flags);
 }
 
-static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
-			       struct sg_table *st)
+void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
+			struct sg_table *st)
 {
 	/*
 	 * We're currently not called from a shrinker, so put_pages()
@@ -995,7 +995,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
  * it's not idle, and using the TTM destroyed list handling could help us
  * benefit from that.
  */
-static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
+void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
 {
 	GEM_BUG_ON(!obj->ttm.created);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 73e371aa3850..06701c46d8e2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -26,6 +26,7 @@ i915_gem_to_ttm(struct drm_i915_gem_object *obj)
  * i915 ttm gem object destructor. Internal use only.
  */
 void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
+void i915_ttm_internal_bo_destroy(struct ttm_buffer_object *bo);
 
 /**
  * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an embedding
@@ -37,8 +38,10 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
 static inline struct drm_i915_gem_object *
 i915_ttm_to_gem(struct ttm_buffer_object *bo)
 {
-	if (bo->destroy != i915_ttm_bo_destroy)
+	if (bo->destroy != i915_ttm_bo_destroy &&
+	    bo->destroy != i915_ttm_internal_bo_destroy) {
 		return NULL;
+	}
 
 	return container_of(bo, struct drm_i915_gem_object, __do_not_access);
 }
@@ -66,6 +69,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 			 struct ttm_resource *res);
 
 void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj);
+void i915_ttm_delayed_free(struct drm_i915_gem_object *obj);
 
 int i915_ttm_purge(struct drm_i915_gem_object *obj);
 
@@ -92,4 +96,10 @@ static inline bool i915_ttm_cpu_maps_iomem(struct ttm_resource *mem)
 	/* Once / if we support GGTT, this is also false for cached ttm_tts */
 	return mem->mem_type != I915_PL_SYSTEM;
 }
+
+int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
+			 struct ttm_placement *placement);
+void i915_ttm_put_pages(struct drm_i915_gem_object *obj, struct sg_table *st);
+int i915_ttm_err_to_gem(int err);
+
 #endif
-- 
2.25.1

