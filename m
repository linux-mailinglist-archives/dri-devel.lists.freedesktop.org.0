Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1440A9A1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 10:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392076E446;
	Tue, 14 Sep 2021 08:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5C16E43A;
 Tue, 14 Sep 2021 08:51:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285619145"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="285619145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 01:51:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="470046230"
Received: from aodohert-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.243.118])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 01:51:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 3/7] drm/i915/ttm: add tt shmem backend
Date: Tue, 14 Sep 2021 09:50:29 +0100
Message-Id: <20210914085033.2833993-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210914085033.2833993-1-matthew.auld@intel.com>
References: <20210914085033.2833993-1-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 214 ++++++++++++++++++---
 3 files changed, 206 insertions(+), 30 deletions(-)

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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index aefaf9293005..e60e538afcd9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -37,6 +37,9 @@
  * @ttm: The base TTM page vector.
  * @dev: The struct device used for dma mapping and unmapping.
  * @cached_st: The cached scatter-gather table.
+ * @obj: The GEM object. Should be valid while we have a valid bo->ttm.
+ * @filp: The shmem file, if using shmem backend.
+ * @backup: Swap out the pages when unpopulating, if using shmem backend.
  *
  * Note that DMA may be going on right up to the point where the page-
  * vector is unpopulated in delayed destroy. Hence keep the
@@ -48,6 +51,9 @@ struct i915_ttm_tt {
 	struct ttm_tt ttm;
 	struct device *dev;
 	struct sg_table *cached_st;
+	struct drm_i915_gem_object *obj;
+	struct file *filp;
+	bool backup;
 };
 
 static const struct ttm_place sys_placement_flags = {
@@ -167,12 +173,105 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
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
+	if (ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
+		ttm->page_flags &= ~TTM_PAGE_FLAG_SWAPPED;
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
+	bool backup = i915_tt->backup;
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
+	shmem_free_st(i915_tt->cached_st,
+		      file_inode(i915_tt->filp)->i_mapping,
+		      obj->mm.dirty, backup);
+	i915_tt->cached_st = NULL;
+
+	obj->mm.dirty = false;
+
+	if (backup)
+		ttm->page_flags |= TTM_PAGE_FLAG_SWAPPED;
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
 
@@ -184,36 +283,60 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	    man->use_tt)
 		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
-			  i915_ttm_select_tt_caching(obj));
-	if (ret) {
-		kfree(i915_tt);
-		return NULL;
-	}
+	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached)
+		page_flags |= TTM_PAGE_FLAG_SHMEM;
+
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
+	if (ret)
+		goto err_free;
 
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
+	if (ttm->page_flags & TTM_PAGE_FLAG_SHMEM)
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
+	if (ttm->page_flags & TTM_PAGE_FLAG_SHMEM) {
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
@@ -223,6 +346,10 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
+	if (place->mem_type == TTM_PL_SYSTEM &&
+	    bo->ttm && bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM)
+		return false;
+
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
 	return i915_gem_object_evictable(obj);
 }
@@ -316,9 +443,11 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
 	i915_gem_object_set_cache_coherency(obj, cache_level);
 }
 
-static void i915_ttm_purge(struct drm_i915_gem_object *obj)
+static void i915_ttm_writeback(struct drm_i915_gem_object *obj)
 {
 	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct i915_ttm_tt *i915_tt =
+		container_of(bo->ttm, typeof(*i915_tt), ttm);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
@@ -326,18 +455,52 @@ static void i915_ttm_purge(struct drm_i915_gem_object *obj)
 	struct ttm_placement place = {};
 	int ret;
 
-	if (obj->mm.madv == __I915_MADV_PURGED)
+	if (!bo->ttm || !(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
 		return;
 
-	/* TTM's purge interface. Note that we might be reentering. */
+	i915_tt->backup = true;
 	ret = ttm_bo_validate(bo, &place, &ctx);
-	if (!ret) {
-		obj->write_domain = 0;
-		obj->read_domains = 0;
-		i915_ttm_adjust_gem_after_move(obj);
-		i915_ttm_free_cached_io_st(obj);
-		obj->mm.madv = __I915_MADV_PURGED;
+	i915_tt->backup = false;
+	if (ret)
+		return;
+
+	__shmem_writeback(obj->base.size, i915_tt->filp->f_mapping);
+}
+
+static void i915_ttm_purge(struct drm_i915_gem_object *obj)
+{
+	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+	};
+	struct ttm_placement place = {};
+
+	if (obj->mm.madv == __I915_MADV_PURGED)
+		return;
+
+	if (ttm_bo_validate(bo, &place, &ctx))
+		return;
+
+	if (bo->ttm && bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM) {
+		struct i915_ttm_tt *i915_tt =
+			container_of(bo->ttm, typeof(*i915_tt), ttm);
+
+		GEM_BUG_ON(i915_tt->backup);
+
+		if (i915_tt->filp) {
+			shmem_truncate_range(file_inode(i915_tt->filp),
+					     0, (loff_t)-1);
+			fput(i915_tt->filp);
+			i915_tt->filp = NULL;
+		}
 	}
+
+	obj->write_domain = 0;
+	obj->read_domains = 0;
+	i915_ttm_adjust_gem_after_move(obj);
+	i915_ttm_free_cached_io_st(obj);
+	obj->mm.madv = __I915_MADV_PURGED;
 }
 
 static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
@@ -605,6 +768,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 
 static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
+	.ttm_tt_populate = i915_ttm_tt_populate,
 	.ttm_tt_unpopulate = i915_ttm_tt_unpopulate,
 	.ttm_tt_destroy = i915_ttm_tt_destroy,
 	.eviction_valuable = i915_ttm_eviction_valuable,
@@ -678,6 +842,8 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 			return PTR_ERR(st);
 
 		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
+		if (!bo->ttm || !(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
+			i915_gem_object_make_unshrinkable(obj);
 	}
 
 	return ret;
@@ -874,9 +1040,12 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
 	.truncate = i915_ttm_purge,
+	.writeback = i915_ttm_writeback,
+
 	.adjust_lru = i915_ttm_adjust_lru,
 	.delayed_free = i915_ttm_delayed_free,
 	.migrate = i915_ttm_migrate,
+
 	.mmap_offset = i915_ttm_mmap_offset,
 	.mmap_ops = &vm_ops_ttm,
 };
@@ -918,7 +1087,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 	i915_gem_object_init_memory_region(obj, mem);
-	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
-- 
2.26.3

