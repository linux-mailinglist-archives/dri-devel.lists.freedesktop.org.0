Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C304C69808C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C7710EAE2;
	Wed, 15 Feb 2023 16:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B610EB31;
 Wed, 15 Feb 2023 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477754; x=1708013754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uHHTc21WA9wMzOHL8IDszyygo8f/rZl9Do07vkRiEvc=;
 b=ZQE0VYCLe9x6glpIQtlQOHMOJIyOQPM/sB6k/4OEX7EFWUccPt/xc0Cd
 u+nfWwiqwqGW1hoMOxv7RausT7/f3Utpe+VTx3svwh4TjGS4wbDHSFhdl
 MerS887DUZyo+bavPt2RTour/XLW2ALt8p5H/AwSIlPPNciUkCr95sOeY
 Euo08pG2dYdBek1N6CyzMyqC0lUGFMJvV9Q5JMMLCPyTQ3tB4fxdTISF2
 D7L0TTv5KzHeTPpRaT00ZJ4qVgzWdsrGWDA2ssGSzGKHNmxJ3lmbzybjf
 dWZ4ykjeeOnaE/EPGM4pLqcYmZj8zvyAwE6SrxXHaP3mq5N0CvQbELINy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="358890262"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="358890262"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472863"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472863"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:46 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 16/16] drm/i915,
 drm/ttm: Use the TTM shrinker rather than the external shmem pool
Date: Wed, 15 Feb 2023 17:14:05 +0100
Message-Id: <20230215161405.187368-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the external i915 TTM shmem pool and replace it with the
normal TTM page allocation. Also provide a callback for the TTM
shrinker functionality.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 -
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 273 +++---------------
 drivers/gpu/drm/i915/i915_gem.c               |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   6 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 -
 include/drm/ttm/ttm_tt.h                      |  15 +-
 8 files changed, 53 insertions(+), 264 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index f9a8acbba715..f694b5d479e5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -282,12 +282,6 @@ i915_gem_object_is_shrinkable(const struct drm_i915_gem_object *obj)
 	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_IS_SHRINKABLE);
 }
 
-static inline bool
-i915_gem_object_has_self_managed_shrink_list(const struct drm_i915_gem_object *obj)
-{
-	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST);
-}
-
 static inline bool
 i915_gem_object_is_proxy(const struct drm_i915_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 19c9bdd8f905..511dc1384a9c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -544,12 +544,6 @@ struct drm_i915_gem_object {
 		 */
 		atomic_t shrink_pin;
 
-		/**
-		 * @ttm_shrinkable: True when the object is using shmem pages
-		 * underneath. Protected by the object lock.
-		 */
-		bool ttm_shrinkable;
-
 		/**
 		 * @unknown_state: Indicate that the object is effectively
 		 * borked. This is write-once and set if we somehow encounter a
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index ecd86130b74f..c39d45661b84 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -73,7 +73,7 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 		shrinkable = false;
 	}
 
-	if (shrinkable && !i915_gem_object_has_self_managed_shrink_list(obj)) {
+	if (shrinkable) {
 		struct list_head *list;
 		unsigned long flags;
 
@@ -216,8 +216,7 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 	if (i915_gem_object_is_volatile(obj))
 		obj->mm.madv = I915_MADV_WILLNEED;
 
-	if (!i915_gem_object_has_self_managed_shrink_list(obj))
-		i915_gem_object_make_unshrinkable(obj);
+	i915_gem_object_make_unshrinkable(obj);
 
 	if (obj->mm.mapping) {
 		unmap_object(obj, page_mask_bits(obj->mm.mapping));
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 341b94672abc..f9bd4f50d495 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -3,8 +3,6 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <linux/shmem_fs.h>
-
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/drm_buddy.h>
@@ -37,8 +35,6 @@
  * @ttm: The base TTM page vector.
  * @dev: The struct device used for dma mapping and unmapping.
  * @cached_rsgt: The cached scatter-gather table.
- * @is_shmem: Set if using shmem.
- * @filp: The shmem file, if using shmem backend.
  *
  * Note that DMA may be going on right up to the point where the page-
  * vector is unpopulated in delayed destroy. Hence keep the
@@ -50,9 +46,6 @@ struct i915_ttm_tt {
 	struct ttm_tt ttm;
 	struct device *dev;
 	struct i915_refct_sgt cached_rsgt;
-
-	bool is_shmem;
-	struct file *filp;
 };
 
 static const struct ttm_place sys_placement_flags = {
@@ -185,75 +178,6 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	placement->busy_placement = busy;
 }
 
-static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
-				      struct ttm_tt *ttm,
-				      struct ttm_operation_ctx *ctx)
-{
-	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
-	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
-	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
-	const unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
-	const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
-	struct file *filp = i915_tt->filp;
-	struct sgt_iter sgt_iter;
-	struct sg_table *st;
-	struct page *page;
-	unsigned long i;
-	int err;
-
-	if (!filp) {
-		struct address_space *mapping;
-		gfp_t mask;
-
-		filp = shmem_file_setup("i915-shmem-tt", size, VM_NORESERVE);
-		if (IS_ERR(filp))
-			return PTR_ERR(filp);
-
-		mask = GFP_HIGHUSER | __GFP_RECLAIMABLE;
-
-		mapping = filp->f_mapping;
-		mapping_set_gfp_mask(mapping, mask);
-		GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
-
-		i915_tt->filp = filp;
-	}
-
-	st = &i915_tt->cached_rsgt.table;
-	err = shmem_sg_alloc_table(i915, st, size, mr, filp->f_mapping,
-				   max_segment);
-	if (err)
-		return err;
-
-	err = dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL,
-			      DMA_ATTR_SKIP_CPU_SYNC);
-	if (err)
-		goto err_free_st;
-
-	i = 0;
-	for_each_sgt_page(page, sgt_iter, st)
-		ttm->pages[i++] = page;
-
-	if (ttm->page_flags & TTM_TT_FLAG_SWAPPED)
-		ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
-
-	return 0;
-
-err_free_st:
-	shmem_sg_free_table(st, filp->f_mapping, false, false);
-
-	return err;
-}
-
-static void i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
-{
-	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
-	bool backup = ttm->page_flags & TTM_TT_FLAG_SWAPPED;
-	struct sg_table *st = &i915_tt->cached_rsgt.table;
-
-	shmem_sg_free_table(st, file_inode(i915_tt->filp)->i_mapping,
-			    backup, backup);
-}
-
 static void i915_ttm_tt_release(struct kref *ref)
 {
 	struct i915_ttm_tt *i915_tt =
@@ -292,11 +216,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
-	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached) {
-		page_flags |= TTM_TT_FLAG_EXTERNAL |
-			      TTM_TT_FLAG_EXTERNAL_MAPPABLE;
-		i915_tt->is_shmem = true;
-	}
 
 	if (i915_gem_object_needs_ccs_pages(obj))
 		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
@@ -325,9 +244,6 @@ static int i915_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
-	if (i915_tt->is_shmem)
-		return i915_ttm_tt_shmem_populate(bdev, ttm, ctx);
-
 	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
 }
 
@@ -339,21 +255,46 @@ static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	if (st->sgl)
 		dma_unmap_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
 
-	if (i915_tt->is_shmem) {
-		i915_ttm_tt_shmem_unpopulate(ttm);
-	} else {
-		sg_free_table(st);
-		ttm_pool_free(&bdev->pool, ttm);
+	sg_free_table(st);
+	ttm_pool_free(&bdev->pool, ttm);
+}
+
+static long i915_ttm_bo_shrink(struct ttm_buffer_object *bo,
+			       struct ttm_operation_ctx *ctx)
+
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct i915_ttm_tt *i915_tt = container_of(tt, typeof(*i915_tt), ttm);
+	struct sg_table *st = &i915_tt->cached_rsgt.table;
+	long ret;
+
+	if (!i915_ttm_is_ghost_object(bo)) {
+		struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+		long ret = i915_ttm_move_notify(bo);
+
+		if (ret)
+			return ret;
+
+		if (obj->mm.madv == I915_MADV_DONTNEED) {
+			GEM_WARN_ON(!(tt->page_flags & TTM_TT_FLAG_DONTNEED));
+			obj->mm.madv = __I915_MADV_PURGED;
+		}
 	}
+
+	if (st->sgl)
+		dma_unmap_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
+
+	sg_free_table(st);
+
+	ret = ttm_tt_shrink(bo->bdev, tt);
+
+	return ret;
 }
 
 static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
-	if (i915_tt->filp)
-		fput(i915_tt->filp);
-
 	ttm_tt_fini(ttm);
 	i915_refct_sgt_put(&i915_tt->cached_rsgt);
 }
@@ -366,14 +307,6 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 	if (i915_ttm_is_ghost_object(bo))
 		return false;
 
-	/*
-	 * EXTERNAL objects should never be swapped out by TTM, instead we need
-	 * to handle that ourselves. TTM will already skip such objects for us,
-	 * but we would like to avoid grabbing locks for no good reason.
-	 */
-	if (bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
-		return false;
-
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
 	if (!i915_gem_object_evictable(obj))
 		return false;
@@ -439,18 +372,6 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 	if (ret)
 		return ret;
 
-	if (bo->ttm && i915_tt->filp) {
-		/*
-		 * The below fput(which eventually calls shmem_truncate) might
-		 * be delayed by worker, so when directly called to purge the
-		 * pages(like by the shrinker) we should try to be more
-		 * aggressive and release the pages immediately.
-		 */
-		shmem_truncate_range(file_inode(i915_tt->filp),
-				     0, (loff_t)-1);
-		fput(fetch_and_zero(&i915_tt->filp));
-	}
-
 	obj->write_domain = 0;
 	obj->read_domains = 0;
 	i915_ttm_adjust_gem_after_move(obj);
@@ -460,53 +381,6 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 	return 0;
 }
 
-static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
-{
-	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
-	struct i915_ttm_tt *i915_tt =
-		container_of(bo->ttm, typeof(*i915_tt), ttm);
-	struct ttm_operation_ctx ctx = {
-		.interruptible = true,
-		.no_wait_gpu = flags & I915_GEM_OBJECT_SHRINK_NO_GPU_WAIT,
-	};
-	struct ttm_placement place = {};
-	int ret;
-
-	if (!bo->ttm || i915_ttm_cpu_maps_iomem(bo->resource))
-		return 0;
-
-	GEM_BUG_ON(!i915_tt->is_shmem);
-
-	if (!i915_tt->filp)
-		return 0;
-
-	ret = ttm_bo_wait_ctx(bo, &ctx);
-	if (ret)
-		return ret;
-
-	switch (obj->mm.madv) {
-	case I915_MADV_DONTNEED:
-		return i915_ttm_purge(obj);
-	case __I915_MADV_PURGED:
-		return 0;
-	}
-
-	if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
-		return 0;
-
-	bo->ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
-	ret = ttm_bo_validate(bo, &place, &ctx);
-	if (ret) {
-		bo->ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
-		return ret;
-	}
-
-	if (flags & I915_GEM_OBJECT_SHRINK_WRITEBACK)
-		__shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
-
-	return 0;
-}
-
 static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
@@ -765,6 +639,7 @@ static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.io_mem_reserve = i915_ttm_io_mem_reserve,
 	.io_mem_pfn = i915_ttm_io_mem_pfn,
 	.access_memory = i915_ttm_access_memory,
+	.bo_shrink = i915_ttm_bo_shrink,
 };
 
 /**
@@ -931,8 +806,6 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
 	struct i915_ttm_tt *i915_tt =
 		container_of(bo->ttm, typeof(*i915_tt), ttm);
-	bool shrinkable =
-		bo->ttm && i915_tt->filp && ttm_tt_is_populated(bo->ttm);
 
 	/*
 	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
@@ -941,54 +814,25 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	if (!kref_read(&bo->kref))
 		return;
 
-	/*
-	 * We skip managing the shrinker LRU in set_pages() and just manage
-	 * everything here. This does at least solve the issue with having
-	 * temporary shmem mappings(like with evicted lmem) not being visible to
-	 * the shrinker. Only our shmem objects are shrinkable, everything else
-	 * we keep as unshrinkable.
-	 *
-	 * To make sure everything plays nice we keep an extra shrink pin in TTM
-	 * if the underlying pages are not currently shrinkable. Once we release
-	 * our pin, like when the pages are moved to shmem, the pages will then
-	 * be added to the shrinker LRU, assuming the caller isn't also holding
-	 * a pin.
-	 *
-	 * TODO: consider maybe also bumping the shrinker list here when we have
-	 * already unpinned it, which should give us something more like an LRU.
-	 *
-	 * TODO: There is a small window of opportunity for this function to
-	 * get called from eviction after we've dropped the last GEM refcount,
-	 * but before the TTM deleted flag is set on the object. Avoid
-	 * adjusting the shrinker list in such cases, since the object is
-	 * not available to the shrinker anyway due to its zero refcount.
-	 * To fix this properly we should move to a TTM shrinker LRU list for
-	 * these objects.
-	 */
-	if (kref_get_unless_zero(&obj->base.refcount)) {
-		if (shrinkable != obj->mm.ttm_shrinkable) {
-			if (shrinkable) {
-				if (obj->mm.madv == I915_MADV_WILLNEED)
-					__i915_gem_object_make_shrinkable(obj);
-				else
-					__i915_gem_object_make_purgeable(obj);
-			} else {
-				i915_gem_object_make_unshrinkable(obj);
-			}
-
-			obj->mm.ttm_shrinkable = shrinkable;
-		}
-		i915_gem_object_put(obj);
+	if (bo->ttm) {
+		int ret = 0;
+
+		if (obj->mm.madv == I915_MADV_DONTNEED &&
+		    !ttm_tt_purgeable(bo->ttm))
+			ret = ttm_tt_set_dontneed(bo->bdev, bo->ttm);
+		else if (obj->mm.madv == I915_MADV_WILLNEED &&
+			 ttm_tt_purgeable(bo->ttm))
+			ret = ttm_tt_set_willneed(bo->bdev, bo->ttm);
+
+		if (ret == -EALREADY)
+			obj->mm.madv = __I915_MADV_PURGED;
 	}
 
 	/*
 	 * Put on the correct LRU list depending on the MADV status
 	 */
 	spin_lock(&bo->bdev->lru_lock);
-	if (shrinkable) {
-		/* Try to keep shmem_tt from being considered for shrinking. */
-		bo->priority = TTM_MAX_BO_PRIORITY - 1;
-	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
+	if (obj->mm.madv != I915_MADV_WILLNEED) {
 		bo->priority = I915_TTM_PRIO_PURGE;
 	} else if (!i915_gem_object_has_pages(obj)) {
 		bo->priority = I915_TTM_PRIO_NO_PAGES;
@@ -1226,13 +1070,10 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
 
 static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
-	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
-		 I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
 	.truncate = i915_ttm_truncate,
-	.shrink = i915_ttm_shrink,
 
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
@@ -1251,18 +1092,6 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	mutex_destroy(&obj->ttm.get_io_page.lock);
 
 	if (obj->ttm.created) {
-		/*
-		 * We freely manage the shrinker LRU outide of the mm.pages life
-		 * cycle. As a result when destroying the object we should be
-		 * extra paranoid and ensure we remove it from the LRU, before
-		 * we free the object.
-		 *
-		 * Touching the ttm_shrinkable outside of the object lock here
-		 * should be safe now that the last GEM object ref was dropped.
-		 */
-		if (obj->mm.ttm_shrinkable)
-			i915_gem_object_make_unshrinkable(obj);
-
 		i915_ttm_backup_free(obj);
 
 		/* This releases all gem object bindings to the backend. */
@@ -1318,14 +1147,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	/* Forcing the page size is kernel internal only */
 	GEM_BUG_ON(page_size && obj->mm.n_placements);
 
-	/*
-	 * Keep an extra shrink pin to prevent the object from being made
-	 * shrinkable too early. If the ttm_tt is ever allocated in shmem, we
-	 * drop the pin. The TTM backend manages the shrinker LRU itself,
-	 * outside of the normal mm.pages life cycle.
-	 */
-	i915_gem_object_make_unshrinkable(obj);
-
 	/*
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 35950fa91406..4dff76614347 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1068,8 +1068,7 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			obj->ops->adjust_lru(obj);
 	}
 
-	if (i915_gem_object_has_pages(obj) ||
-	    i915_gem_object_has_self_managed_shrink_list(obj)) {
+	if (i915_gem_object_has_pages(obj)) {
 		unsigned long flags;
 
 		spin_lock_irqsave(&i915->mm.obj_lock, flags);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 80f106bfe385..7537bc300e34 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -150,10 +150,8 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 	 * (if at all) by redirecting mmap to the exporter.
 	 */
 	if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
-		if (!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
-			dma_resv_unlock(bo->base.resv);
-			return VM_FAULT_SIGBUS;
-		}
+		dma_resv_unlock(bo->base.resv);
+		return VM_FAULT_SIGBUS;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8ac4a9cba34d..b0533833d581 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -198,9 +198,6 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	if (unlikely(bo->ttm == NULL))
 		return -ENOMEM;
 
-	WARN_ON(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE &&
-		!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL));
-
 	return 0;
 }
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 0fa71292b676..0d1d377903e0 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -68,18 +68,6 @@ struct ttm_tt {
 	 * Note that enum ttm_bo_type.ttm_bo_type_sg objects will always enable
 	 * this flag.
 	 *
-	 * TTM_TT_FLAG_EXTERNAL_MAPPABLE: Same behaviour as
-	 * TTM_TT_FLAG_EXTERNAL, but with the reduced restriction that it is
-	 * still valid to use TTM to map the pages directly. This is useful when
-	 * implementing a ttm_tt backend which still allocates driver owned
-	 * pages underneath(say with shmem).
-	 *
-	 * Note that since this also implies TTM_TT_FLAG_EXTERNAL, the usage
-	 * here should always be:
-	 *
-	 *   page_flags = TTM_TT_FLAG_EXTERNAL |
-	 *		  TTM_TT_FLAG_EXTERNAL_MAPPABLE;
-	 *
 	 * TTM_TT_FLAG_PRIV_SHRUNKEN: TTM internal only. This is set if the
 	 * struct ttm_tt has been (possibly partially) swapped out to the
 	 * swap cache.
@@ -91,8 +79,7 @@ struct ttm_tt {
 #define TTM_TT_FLAG_SWAPPED		BIT(0)
 #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
 #define TTM_TT_FLAG_EXTERNAL		BIT(2)
-#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
-#define TTM_TT_FLAG_DONTNEED		BIT(4)
+#define TTM_TT_FLAG_DONTNEED		BIT(3)
 
 #define TTM_TT_FLAG_PRIV_SHRUNKEN	BIT(30)
 #define TTM_TT_FLAG_PRIV_POPULATED	BIT(31)
-- 
2.34.1

