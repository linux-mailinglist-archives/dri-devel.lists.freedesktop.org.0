Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B74312DF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 11:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE56E9AF;
	Mon, 18 Oct 2021 09:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0016E9AD;
 Mon, 18 Oct 2021 09:11:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="209001378"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="209001378"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:11:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="443330257"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:11:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v9 1/8] drm/i915/gem: Break out some shmem backend utils
Date: Mon, 18 Oct 2021 10:10:48 +0100
Message-Id: <20211018091055.1998191-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Break out some shmem backend utils for future reuse by the TTM backend:
shmem_alloc_st(), shmem_free_st() and __shmem_writeback() which we can
use to provide a shmem-backed TTM page pool for cached-only TTM
buffer objects.

Main functional change here is that we now compute the page sizes using
the dma segments rather than using the physical page address segments.

v2(Reported-by: kernel test robot <lkp@intel.com>)
    - Make sure we initialise the mapping on the error path in
      shmem_get_pages()

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 181 +++++++++++++---------
 1 file changed, 106 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 11f072193f3b..36b711ae9e28 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -25,46 +25,61 @@ static void check_release_pagevec(struct pagevec *pvec)
 	cond_resched();
 }
 
-static int shmem_get_pages(struct drm_i915_gem_object *obj)
+static void shmem_free_st(struct sg_table *st, struct address_space *mapping,
+			  bool dirty, bool backup)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct intel_memory_region *mem = obj->mm.region;
-	const unsigned long page_count = obj->base.size / PAGE_SIZE;
+	struct sgt_iter sgt_iter;
+	struct pagevec pvec;
+	struct page *page;
+
+	mapping_clear_unevictable(mapping);
+
+	pagevec_init(&pvec);
+	for_each_sgt_page(page, sgt_iter, st) {
+		if (dirty)
+			set_page_dirty(page);
+
+		if (backup)
+			mark_page_accessed(page);
+
+		if (!pagevec_add(&pvec, page))
+			check_release_pagevec(&pvec);
+	}
+	if (pagevec_count(&pvec))
+		check_release_pagevec(&pvec);
+
+	sg_free_table(st);
+	kfree(st);
+}
+
+static struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
+				       size_t size, struct intel_memory_region *mr,
+				       struct address_space *mapping,
+				       unsigned int max_segment)
+{
+	const unsigned long page_count = size / PAGE_SIZE;
 	unsigned long i;
-	struct address_space *mapping;
 	struct sg_table *st;
 	struct scatterlist *sg;
-	struct sgt_iter sgt_iter;
 	struct page *page;
 	unsigned long last_pfn = 0;	/* suppress gcc warning */
-	unsigned int max_segment = i915_sg_segment_size();
-	unsigned int sg_page_sizes;
 	gfp_t noreclaim;
 	int ret;
 
-	/*
-	 * Assert that the object is not currently in any GPU domain. As it
-	 * wasn't in the GTT, there shouldn't be any way it could have been in
-	 * a GPU cache
-	 */
-	GEM_BUG_ON(obj->read_domains & I915_GEM_GPU_DOMAINS);
-	GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
-
 	/*
 	 * If there's no chance of allocating enough pages for the whole
 	 * object, bail early.
 	 */
-	if (obj->base.size > resource_size(&mem->region))
-		return -ENOMEM;
+	if (size > resource_size(&mr->region))
+		return ERR_PTR(-ENOMEM);
 
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
 	if (!st)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-rebuild_st:
 	if (sg_alloc_table(st, page_count, GFP_KERNEL)) {
 		kfree(st);
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	/*
@@ -73,14 +88,12 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	 *
 	 * Fail silently without starting the shrinker
 	 */
-	mapping = obj->base.filp->f_mapping;
 	mapping_set_unevictable(mapping);
 	noreclaim = mapping_gfp_constraint(mapping, ~__GFP_RECLAIM);
 	noreclaim |= __GFP_NORETRY | __GFP_NOWARN;
 
 	sg = st->sgl;
 	st->nents = 0;
-	sg_page_sizes = 0;
 	for (i = 0; i < page_count; i++) {
 		const unsigned int shrink[] = {
 			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND,
@@ -135,10 +148,9 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		if (!i ||
 		    sg->length >= max_segment ||
 		    page_to_pfn(page) != last_pfn + 1) {
-			if (i) {
-				sg_page_sizes |= sg->length;
+			if (i)
 				sg = sg_next(sg);
-			}
+
 			st->nents++;
 			sg_set_page(sg, page, PAGE_SIZE, 0);
 		} else {
@@ -149,14 +161,65 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		/* Check that the i965g/gm workaround works. */
 		GEM_BUG_ON(gfp & __GFP_DMA32 && last_pfn >= 0x00100000UL);
 	}
-	if (sg) { /* loop terminated early; short sg table */
-		sg_page_sizes |= sg->length;
+	if (sg) /* loop terminated early; short sg table */
 		sg_mark_end(sg);
-	}
 
 	/* Trim unused sg entries to avoid wasting memory. */
 	i915_sg_trim(st);
 
+	return st;
+err_sg:
+	sg_mark_end(sg);
+	if (sg != st->sgl) {
+		shmem_free_st(st, mapping, false, false);
+	} else {
+		mapping_clear_unevictable(mapping);
+		sg_free_table(st);
+		kfree(st);
+	}
+
+	/*
+	 * shmemfs first checks if there is enough memory to allocate the page
+	 * and reports ENOSPC should there be insufficient, along with the usual
+	 * ENOMEM for a genuine allocation failure.
+	 *
+	 * We use ENOSPC in our driver to mean that we have run out of aperture
+	 * space and so want to translate the error from shmemfs back to our
+	 * usual understanding of ENOMEM.
+	 */
+	if (ret == -ENOSPC)
+		ret = -ENOMEM;
+
+	return ERR_PTR(ret);
+}
+
+static int shmem_get_pages(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct intel_memory_region *mem = obj->mm.region;
+	struct address_space *mapping = obj->base.filp->f_mapping;
+	const unsigned long page_count = obj->base.size / PAGE_SIZE;
+	unsigned int max_segment = i915_sg_segment_size();
+	struct sg_table *st;
+	struct sgt_iter sgt_iter;
+	struct page *page;
+	int ret;
+
+	/*
+	 * Assert that the object is not currently in any GPU domain. As it
+	 * wasn't in the GTT, there shouldn't be any way it could have been in
+	 * a GPU cache
+	 */
+	GEM_BUG_ON(obj->read_domains & I915_GEM_GPU_DOMAINS);
+	GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
+
+rebuild_st:
+	st = shmem_alloc_st(i915, obj->base.size, mem, mapping, max_segment);
+	if (IS_ERR(st)) {
+		ret = PTR_ERR(st);
+		goto err_st;
+	}
+
 	ret = i915_gem_gtt_prepare_pages(obj, st);
 	if (ret) {
 		/*
@@ -168,6 +231,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 			for_each_sgt_page(page, sgt_iter, st)
 				put_page(page);
 			sg_free_table(st);
+			kfree(st);
 
 			max_segment = PAGE_SIZE;
 			goto rebuild_st;
@@ -200,28 +264,12 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	if (IS_JSL_EHL(i915) && obj->flags & I915_BO_ALLOC_USER)
 		obj->cache_dirty = true;
 
-	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
+	__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
 
 	return 0;
 
-err_sg:
-	sg_mark_end(sg);
 err_pages:
-	mapping_clear_unevictable(mapping);
-	if (sg != st->sgl) {
-		struct pagevec pvec;
-
-		pagevec_init(&pvec);
-		for_each_sgt_page(page, sgt_iter, st) {
-			if (!pagevec_add(&pvec, page))
-				check_release_pagevec(&pvec);
-		}
-		if (pagevec_count(&pvec))
-			check_release_pagevec(&pvec);
-	}
-	sg_free_table(st);
-	kfree(st);
-
+	shmem_free_st(st, mapping, false, false);
 	/*
 	 * shmemfs first checks if there is enough memory to allocate the page
 	 * and reports ENOSPC should there be insufficient, along with the usual
@@ -231,6 +279,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	 * space and so want to translate the error from shmemfs back to our
 	 * usual understanding of ENOMEM.
 	 */
+err_st:
 	if (ret == -ENOSPC)
 		ret = -ENOMEM;
 
@@ -251,10 +300,8 @@ shmem_truncate(struct drm_i915_gem_object *obj)
 	obj->mm.pages = ERR_PTR(-EFAULT);
 }
 
-static void
-shmem_writeback(struct drm_i915_gem_object *obj)
+static void __shmem_writeback(size_t size, struct address_space *mapping)
 {
-	struct address_space *mapping;
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
 		.nr_to_write = SWAP_CLUSTER_MAX,
@@ -270,10 +317,9 @@ shmem_writeback(struct drm_i915_gem_object *obj)
 	 * instead of invoking writeback so they are aged and paged out
 	 * as normal.
 	 */
-	mapping = obj->base.filp->f_mapping;
 
 	/* Begin writeback on each dirty page */
-	for (i = 0; i < obj->base.size >> PAGE_SHIFT; i++) {
+	for (i = 0; i < size >> PAGE_SHIFT; i++) {
 		struct page *page;
 
 		page = find_lock_page(mapping, i);
@@ -296,6 +342,12 @@ shmem_writeback(struct drm_i915_gem_object *obj)
 	}
 }
 
+static void
+shmem_writeback(struct drm_i915_gem_object *obj)
+{
+	__shmem_writeback(obj->base.size, obj->base.filp->f_mapping);
+}
+
 void
 __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				struct sg_table *pages,
@@ -316,11 +368,6 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_table *pages)
 {
-	struct sgt_iter sgt_iter;
-	struct pagevec pvec;
-	struct page *page;
-
-	GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
 	__i915_gem_object_release_shmem(obj, pages, true);
 
 	i915_gem_gtt_finish_pages(obj, pages);
@@ -328,25 +375,9 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
 	if (i915_gem_object_needs_bit17_swizzle(obj))
 		i915_gem_object_save_bit_17_swizzle(obj, pages);
 
-	mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
-
-	pagevec_init(&pvec);
-	for_each_sgt_page(page, sgt_iter, pages) {
-		if (obj->mm.dirty)
-			set_page_dirty(page);
-
-		if (obj->mm.madv == I915_MADV_WILLNEED)
-			mark_page_accessed(page);
-
-		if (!pagevec_add(&pvec, page))
-			check_release_pagevec(&pvec);
-	}
-	if (pagevec_count(&pvec))
-		check_release_pagevec(&pvec);
+	shmem_free_st(pages, file_inode(obj->base.filp)->i_mapping,
+		      obj->mm.dirty, obj->mm.madv == I915_MADV_WILLNEED);
 	obj->mm.dirty = false;
-
-	sg_free_table(pages);
-	kfree(pages);
 }
 
 static void
-- 
2.26.3

