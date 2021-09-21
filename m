Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233B41322D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D056E96A;
	Tue, 21 Sep 2021 11:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D106E95A;
 Tue, 21 Sep 2021 11:02:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284344196"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284344196"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484141830"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v4 09/14] drm/i915/ttm: add tt shmem backend
Date: Tue, 21 Sep 2021 12:01:16 +0100
Message-Id: <20210921110121.3783395-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210921110121.3783395-1-matthew.auld@intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   8 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 252 ++++++++++++++++--
 5 files changed, 258 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..561d6bd0a5c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -618,6 +618,14 @@ int i915_gem_object_wait_migration(struct drm_i915_gem_object *obj,
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
index 2471f36aaff3..1b7ba859cf5e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -56,6 +56,8 @@ struct drm_i915_gem_object_ops {
 			  struct sg_table *pages);
 	void (*truncate)(struct drm_i915_gem_object *obj);
 	void (*writeback)(struct drm_i915_gem_object *obj);
+	int (*try_to_writeback)(struct drm_i915_gem_object *obj,
+				bool do_writeback);
 
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
index e382b7f2353b..478663dc42b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -56,19 +56,24 @@ static bool unsafe_drop_pages(struct drm_i915_gem_object *obj,
 	return false;
 }
 
-static void try_to_writeback(struct drm_i915_gem_object *obj,
-			     unsigned int flags)
+static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
 {
+	if (obj->ops->try_to_writeback)
+		return obj->ops->try_to_writeback(obj,
+						 flags & I915_SHRINK_WRITEBACK);
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
index fd5b925b27c5..174aebe11264 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -37,6 +37,10 @@
  * @ttm: The base TTM page vector.
  * @dev: The struct device used for dma mapping and unmapping.
  * @cached_st: The cached scatter-gather table.
+ * @obj: The GEM object. Should be valid while we have a valid bo->ttm.
+ * @filp: The shmem file, if using shmem backend.
+ * @is_shmem: Set if using shmem.
+ * @do_backup: If using shmem, do the swap step when unpopulating.
  *
  * Note that DMA may be going on right up to the point where the page-
  * vector is unpopulated in delayed destroy. Hence keep the
@@ -48,6 +52,10 @@ struct i915_ttm_tt {
 	struct ttm_tt ttm;
 	struct device *dev;
 	struct sg_table *cached_st;
+	struct drm_i915_gem_object *obj;
+	struct file *filp;
+	bool is_shmem;
+	bool do_backup;
 };
 
 static const struct ttm_place sys_placement_flags = {
@@ -167,12 +175,104 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
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
+	struct drm_i915_gem_object *obj = i915_tt->obj;
+	struct file *filp = i915_tt->filp;
+	struct sgt_iter sgt_iter;
+	struct sg_table *st;
+	struct page *page;
+	unsigned long i;
+	int err;
+
+	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
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
+	struct drm_i915_gem_object *obj = i915_tt->obj;
+	bool backup = i915_tt->do_backup;
+
+	if (obj->mm.madv == I915_MADV_DONTNEED) {
+		obj->mm.dirty = false;
+		GEM_BUG_ON(backup);
+	}
+
+	dma_unmap_sg(i915_tt->dev, i915_tt->cached_st->sgl,
+		     i915_tt->cached_st->nents,
+		     PCI_DMA_BIDIRECTIONAL);
+
+	shmem_free_st(fetch_and_zero(&i915_tt->cached_st),
+		      file_inode(i915_tt->filp)->i_mapping,
+		      obj->mm.dirty, backup);
+
+	obj->mm.dirty = false;
+
+	if (backup)
+		ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
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
 
@@ -184,36 +284,63 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
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
+	i915_tt->obj = obj;
 
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
@@ -223,6 +350,13 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
+	/*
+	 * EXTERNAL objects should never be swapped out by TTM, instead we need
+	 * to handle that ourselves.
+	 */
+	GEM_BUG_ON(place->mem_type == TTM_PL_SYSTEM &&
+		   bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
+
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
 	return i915_gem_object_evictable(obj);
 }
@@ -316,9 +450,11 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
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
@@ -327,17 +463,81 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
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
+	if (bo->ttm && i915_tt->is_shmem) {
+		/*
+		 * The below fput(which eventually calls shmem_truncate) might
+		 * be delayed by worker, so when directly called to purge the
+		 * pages(like by the shrinker) we should try to be more
+		 * aggressive and release the pages immediately.
+		 */
+		if (i915_tt->filp) {
+			shmem_truncate_range(file_inode(i915_tt->filp),
+					     0, (loff_t)-1);
+			fput(fetch_and_zero(&i915_tt->filp));
+		}
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
+static int i915_ttm_try_to_writeback(struct drm_i915_gem_object *obj,
+				     bool do_writeback)
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
+	if (bo->resource->mem_type != TTM_PL_SYSTEM)
+		return -EBUSY;
+
+	if (!bo->ttm || !i915_tt->is_shmem)
+		return -EBUSY;
+
+	if (!i915_tt->filp)
+		return -EBUSY;
+
+	if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
+		return 0;
+
+	switch (obj->mm.madv) {
+	case I915_MADV_DONTNEED:
+		return __i915_ttm_purge(obj);
+	case __I915_MADV_PURGED:
+		return 0;
 	}
+
+	i915_tt->do_backup = true;
+	ret = ttm_bo_validate(bo, &place, &ctx);
+	i915_tt->do_backup = false;
+	if (ret)
+		return ret;
+
+	if (do_writeback)
+		__shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
+
+	return 0;
 }
 
 static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
@@ -602,6 +802,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 
 static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
+	.ttm_tt_populate = i915_ttm_tt_populate,
 	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
 	.ttm_tt_destroy = i915_ttm_tt_destroy,
 	.eviction_valuable = i915_ttm_eviction_valuable,
@@ -669,12 +870,17 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
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
@@ -871,9 +1077,12 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
 	.truncate = i915_ttm_purge,
+	.try_to_writeback = i915_ttm_try_to_writeback,
+
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
 	.migrate = i915_ttm_migrate,
+
 	.mmap_offset = i915_ttm_mmap_offset,
 	.mmap_ops = &vm_ops_ttm,
 };
@@ -919,7 +1128,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 	i915_gem_object_init_memory_region(obj, mem);
-	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
-- 
2.26.3

