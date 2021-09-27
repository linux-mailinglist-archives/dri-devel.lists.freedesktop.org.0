Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896241936F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38136E845;
	Mon, 27 Sep 2021 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4971389FEC;
 Mon, 27 Sep 2021 11:42:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610622"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610622"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553159059"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 09/13] drm/i915/ttm: add tt shmem backend
Date: Mon, 27 Sep 2021 12:41:10 +0100
Message-Id: <20210927114114.152310-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210927114114.152310-1-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For cached objects we can allocate our pages directly in shmem. This
should make it possible(in a later patch) to utilise the existing
i915-gem shrinker code for such objects. For now this is still disabled.

v2(Thomas):
  - Add optional try_to_writeback hook for objects. Importantly we need
    to check if the object is even still shrinkable; in between us
    dropping the shrinker LRU lock and acquiring the object lock it could for
    example have been moved. Also we need to differentiate between
    "lazy" shrinking and the immediate writeback mode. Also later we need to
    handle objects which don't even have mm.pages, so bundling this into
    put_pages() would require somehow handling that edge case, hence
    just letting the ttm backend handle everything in try_to_writeback
    doesn't seem too bad.
v3(Thomas):
  - Likely a bad idea to touch the object from the unpopulate hook,
    since it's not possible to hold a reference, without also creating
    circular dependency, so likely this is too fragile. For now just
    ensure we at least mark the pages as dirty/accessed when called from the
    shrinker on WILLNEED objects.
  - s/try_to_writeback/shrinker_release_pages, since this can do more
    than just writeback.
  - Get rid of do_backup boolean and just set the SWAPPED flag prior to
    calling unpopulate.
  - Keep shmem_tt as lowest priority for the TTM LRU bo_swapout walk, since
    these just get skipped anyway. We can try to come up with something
    better later.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   8 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 240 ++++++++++++++++--
 5 files changed, 245 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 3043fcbd31bd..1c9a1d8d3434 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -601,6 +601,14 @@ int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
 bool i915_gem_object_placement_possible(struct drm_i915_gem_object *obj,
 					enum intel_memory_type type);
 
+struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
+				size_t size, struct intel_memory_region *mr,
+				struct address_space *mapping,
+				unsigned int max_segment);
+void shmem_free_st(struct sg_table *st, struct address_space *mapping,
+		   bool dirty, bool backup);
+void __shmem_writeback(size_t size, struct address_space *mapping);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index fa2ba9e2a4d0..f0fb17be2f7a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -56,6 +56,8 @@ struct drm_i915_gem_object_ops {
 			  struct sg_table *pages);
 	void (*truncate)(struct drm_i915_gem_object *obj);
 	void (*writeback)(struct drm_i915_gem_object *obj);
+	int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
+				      bool should_writeback);
 
 	int (*pread)(struct drm_i915_gem_object *obj,
 		     const struct drm_i915_gem_pread *arg);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 36b711ae9e28..19e55cc29a15 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -25,8 +25,8 @@ static void check_release_pagevec(struct pagevec *pvec)
 	cond_resched();
 }
 
-static void shmem_free_st(struct sg_table *st, struct address_space *mapping,
-			  bool dirty, bool backup)
+void shmem_free_st(struct sg_table *st, struct address_space *mapping,
+		   bool dirty, bool backup)
 {
 	struct sgt_iter sgt_iter;
 	struct pagevec pvec;
@@ -52,10 +52,10 @@ static void shmem_free_st(struct sg_table *st, struct address_space *mapping,
 	kfree(st);
 }
 
-static struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
-				       size_t size, struct intel_memory_region *mr,
-				       struct address_space *mapping,
-				       unsigned int max_segment)
+struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
+				size_t size, struct intel_memory_region *mr,
+				struct address_space *mapping,
+				unsigned int max_segment)
 {
 	const unsigned long page_count = size / PAGE_SIZE;
 	unsigned long i;
@@ -300,7 +300,7 @@ shmem_truncate(struct drm_i915_gem_object *obj)
 	obj->mm.pages = ERR_PTR(-EFAULT);
 }
 
-static void __shmem_writeback(size_t size, struct address_space *mapping)
+void __shmem_writeback(size_t size, struct address_space *mapping)
 {
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index e382b7f2353b..cc80bd23d323 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -56,19 +56,24 @@ static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
 	return false;
 }
 
-static void try_to_writeback(struct drm_i915_gem_object *obj,
-			     unsigned int flags)
+static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
 {
+	if (obj->ops->shrinker_release_pages)
+		return obj->ops->shrinker_release_pages(obj,
+							flags & I915_SHRINK_WRITEBACK);
+
 	switch (obj->mm.madv) {
 	case I915_MADV_DONTNEED:
 		i915_gem_object_truncate(obj);
-		return;
+		return 0;
 	case __I915_MADV_PURGED:
-		return;
+		return 0;
 	}
 
 	if (flags & I915_SHRINK_WRITEBACK)
 		i915_gem_object_writeback(obj);
+
+	return 0;
 }
 
 /**
@@ -222,8 +227,8 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 				}
 
 				if (!__i915_gem_object_put_pages(obj)) {
-					try_to_writeback(obj, shrink);
-					count += obj->base.size >> PAGE_SHIFT;
+					if (!try_to_writeback(obj, shrink))
+						count += obj->base.size >> PAGE_SHIFT;
 				}
 				if (!ww)
 					i915_gem_object_unlock(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index a77e90f300fe..c7402995a8f9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -35,6 +35,8 @@
  * @ttm: The base TTM page vector.
  * @dev: The struct device used for dma mapping and unmapping.
  * @cached_st: The cached scatter-gather table.
+ * @is_shmem: Set if using shmem.
+ * @filp: The shmem file, if using shmem backend.
  *
  * Note that DMA may be going on right up to the point where the page-
  * vector is unpopulated in delayed destroy. Hence keep the
@@ -46,6 +48,9 @@ struct i915_ttm_tt {
 	struct ttm_tt ttm;
 	struct device *dev;
 	struct sg_table *cached_st;
+
+	bool is_shmem;
+	struct file *filp;
 };
 
 static const struct ttm_place sys_placement_flags = {
@@ -179,12 +184,90 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	placement->busy_placement = busy;
 }
 
+static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
+				      struct ttm_tt *ttm,
+				      struct ttm_operation_ctx *ctx)
+{
+	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
+	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
+	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
+	const unsigned int max_segment = i915_sg_segment_size();
+	const size_t size = ttm->num_pages << PAGE_SHIFT;
+	struct file *filp = i915_tt->filp;
+	struct sgt_iter sgt_iter;
+	struct sg_table *st;
+	struct page *page;
+	unsigned long i;
+	int err;
+
+	if (!filp) {
+		struct address_space *mapping;
+		gfp_t mask;
+
+		filp = shmem_file_setup("i915-shmem-tt", size, VM_NORESERVE);
+		if (IS_ERR(filp))
+			return PTR_ERR(filp);
+
+		mask = GFP_HIGHUSER | __GFP_RECLAIMABLE;
+
+		mapping = filp->f_mapping;
+		mapping_set_gfp_mask(mapping, mask);
+		GEM_BUG_ON(!(mapping_gfp_mask(mapping) & __GFP_RECLAIM));
+
+		i915_tt->filp = filp;
+	}
+
+	st = shmem_alloc_st(i915, size, mr, filp->f_mapping, max_segment);
+	if (IS_ERR(st))
+		return PTR_ERR(st);
+
+	err = dma_map_sg_attrs(i915_tt->dev,
+			       st->sgl, st->nents,
+			       PCI_DMA_BIDIRECTIONAL,
+			       DMA_ATTR_SKIP_CPU_SYNC |
+			       DMA_ATTR_NO_KERNEL_MAPPING |
+			       DMA_ATTR_NO_WARN);
+	if (err <= 0) {
+		err = -EINVAL;
+		goto err_free_st;
+	}
+
+	i = 0;
+	for_each_sgt_page(page, sgt_iter, st)
+		ttm->pages[i++] = page;
+
+	if (ttm->page_flags & TTM_TT_FLAG_SWAPPED)
+		ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
+
+	i915_tt->cached_st = st;
+	return 0;
+
+err_free_st:
+	shmem_free_st(st, filp->f_mapping, false, false);
+	return err;
+}
+
+static void i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
+{
+	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
+	bool backup = ttm->page_flags & TTM_TT_FLAG_SWAPPED;
+
+	dma_unmap_sg(i915_tt->dev, i915_tt->cached_st->sgl,
+		     i915_tt->cached_st->nents,
+		     PCI_DMA_BIDIRECTIONAL);
+
+	shmem_free_st(fetch_and_zero(&i915_tt->cached_st),
+		      file_inode(i915_tt->filp)->i_mapping,
+		      backup, backup);
+}
+
 static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 					 uint32_t page_flags)
 {
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	enum ttm_caching caching = i915_ttm_select_tt_caching(obj);
 	struct i915_ttm_tt *i915_tt;
 	int ret;
 
@@ -196,36 +279,62 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	    man->use_tt)
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
-			  i915_ttm_select_tt_caching(obj));
-	if (ret) {
-		kfree(i915_tt);
-		return NULL;
+	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached) {
+		page_flags |= TTM_TT_FLAG_EXTERNAL |
+			      TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+		i915_tt->is_shmem = true;
 	}
 
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
+	if (ret)
+		goto err_free;
+
 	i915_tt->dev = obj->base.dev->dev;
 
 	return &i915_tt->ttm;
+
+err_free:
+	kfree(i915_tt);
+	return NULL;
+}
+
+static int i915_ttm_tt_populate(struct ttm_device *bdev,
+				struct ttm_tt *ttm,
+				struct ttm_operation_ctx *ctx)
+{
+	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
+
+	if (i915_tt->is_shmem)
+		return i915_ttm_tt_shmem_populate(bdev, ttm, ctx);
+
+	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
 }
 
 static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
-	if (i915_tt->cached_st) {
-		dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
-				  DMA_BIDIRECTIONAL, 0);
-		sg_free_table(i915_tt->cached_st);
-		kfree(i915_tt->cached_st);
-		i915_tt->cached_st = NULL;
+	if (i915_tt->is_shmem) {
+		i915_ttm_tt_shmem_unpopulate(ttm);
+	} else {
+		if (i915_tt->cached_st) {
+			dma_unmap_sgtable(i915_tt->dev, i915_tt->cached_st,
+					  DMA_BIDIRECTIONAL, 0);
+			sg_free_table(i915_tt->cached_st);
+			kfree(i915_tt->cached_st);
+			i915_tt->cached_st = NULL;
+		}
+		ttm_pool_free(&bdev->pool, ttm);
 	}
-	ttm_pool_free(&bdev->pool, ttm);
 }
 
 static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
+	if (i915_tt->filp)
+		fput(i915_tt->filp);
+
 	ttm_tt_fini(ttm);
 	kfree(i915_tt);
 }
@@ -235,6 +344,14 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
+	/*
+	 * EXTERNAL objects should never be swapped out by TTM, instead we need
+	 * to handle that ourselves. TTM will already skip such objects for us,
+	 * but we would like to avoid grabbing locks for no good reason.
+	 */
+	if (bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
+		return -EBUSY;
+
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
 	return i915_gem_object_evictable(obj);
 }
@@ -328,9 +445,11 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 }
 
-static void i915_ttm_purge(struct drm_i915_gem_object *obj)
+static int __i915_ttm_purge(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct i915_ttm_tt *i915_tt =
+		container_of(bo->ttm, typeof(*i915_tt), ttm);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
@@ -339,17 +458,79 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
 	int ret;
 
 	if (obj->mm.madv == __I915_MADV_PURGED)
-		return;
+		return 0;
 
-	/* TTM's purge interface. Note that we might be reentering. */
 	ret = ttm_bo_validate(bo, &place, &ctx);
-	if (!ret) {
-		obj->write_domain = 0;
-		obj->read_domains = 0;
-		i915_ttm_adjust_gem_after_move(obj);
-		i915_ttm_free_cached_io_st(obj);
-		obj->mm.madv = __I915_MADV_PURGED;
+	if (ret)
+		return ret;
+
+	if (bo->ttm && i915_tt->filp) {
+		/*
+		 * The below fput(which eventually calls shmem_truncate) might
+		 * be delayed by worker, so when directly called to purge the
+		 * pages(like by the shrinker) we should try to be more
+		 * aggressive and release the pages immediately.
+		 */
+		shmem_truncate_range(file_inode(i915_tt->filp),
+				     0, (loff_t)-1);
+		fput(fetch_and_zero(&i915_tt->filp));
+	}
+
+	obj->write_domain = 0;
+	obj->read_domains = 0;
+	i915_ttm_adjust_gem_after_move(obj);
+	i915_ttm_free_cached_io_st(obj);
+	obj->mm.madv = __I915_MADV_PURGED;
+	return 0;
+}
+
+static void i915_ttm_purge(struct drm_i915_gem_object *obj)
+{
+	__i915_ttm_purge(obj);
+}
+
+static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
+					   bool should_writeback)
+{
+	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct i915_ttm_tt *i915_tt =
+		container_of(bo->ttm, typeof(*i915_tt), ttm);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+	};
+	struct ttm_placement place = {};
+	int ret;
+
+	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
+		return 0;
+
+	GEM_BUG_ON(!i915_tt->is_shmem);
+
+	if (!i915_tt->filp)
+		return 0;
+
+	switch (obj->mm.madv) {
+	case I915_MADV_DONTNEED:
+		return __i915_ttm_purge(obj);
+	case __I915_MADV_PURGED:
+		return 0;
+	}
+
+	if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
+		return 0;
+
+	bo->ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
+	ret = ttm_bo_validate(bo, &place, &ctx);
+	if (ret) {
+		bo->ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
+		return ret;
 	}
+
+	if (should_writeback)
+		__shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
+
+	return 0;
 }
 
 static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
@@ -618,6 +799,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 
 static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
+	.ttm_tt_populate = i915_ttm_tt_populate,
 	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
 	.ttm_tt_destroy = i915_ttm_tt_destroy,
 	.eviction_valuable = i915_ttm_eviction_valuable,
@@ -685,12 +867,17 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 	}
 
 	if (!i915_gem_object_has_pages(obj)) {
+		struct i915_ttm_tt *i915_tt =
+			container_of(bo->ttm, typeof(*i915_tt), ttm);
+
 		/* Object either has a page vector or is an iomem object */
 		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
 		if (IS_ERR(st))
 			return PTR_ERR(st);
 
 		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
+		if (!bo->ttm || !i915_tt->is_shmem)
+			i915_gem_object_make_unshrinkable(obj);
 	}
 
 	return ret;
@@ -770,6 +957,8 @@ static void i915_ttm_put_pages(struct drm_i915_gem_object *obj,
 static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct i915_ttm_tt *i915_tt =
+		container_of(bo->ttm, typeof(*i915_tt), ttm);
 
 	/*
 	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
@@ -782,7 +971,10 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	 * Put on the correct LRU list depending on the MADV status
 	 */
 	spin_lock(&bo->bdev->lru_lock);
-	if (obj->mm.madv != I915_MADV_WILLNEED) {
+	if (bo->ttm && i915_tt->filp) {
+		/* Try to keep shmem_tt from being considered for shrinking. */
+		bo->priority = TTM_MAX_BO_PRIORITY - 1;
+	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
 		bo->priority = I915_TTM_PRIO_PURGE;
 	} else if (!i915_gem_object_has_pages(obj)) {
 		if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
@@ -887,9 +1079,12 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
 	.truncate = i915_ttm_purge,
+	.shrinker_release_pages = i915_ttm_shrinker_release_pages,
+
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
 	.migrate = i915_ttm_migrate,
+
 	.mmap_offset = i915_ttm_mmap_offset,
 	.mmap_ops = &vm_ops_ttm,
 };
@@ -937,7 +1132,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 	i915_gem_object_init_memory_region(obj, mem);
-	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
-- 
2.26.3

