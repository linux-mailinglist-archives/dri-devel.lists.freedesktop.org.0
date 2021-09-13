Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A963D409BC3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 20:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21286E222;
	Mon, 13 Sep 2021 18:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE8D6E212;
 Mon, 13 Sep 2021 18:08:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221792508"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="221792508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 11:08:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="551796968"
Received: from jpcooney-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 11:08:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 1/8] drm/i915/gem: Break out some shmem backend utils
Date: Mon, 13 Sep 2021 19:05:58 +0100
Message-Id: <20210913180605.2778493-1-matthew.auld@intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 182 +++++++++++++---------
 1 file changed, 107 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 11f072193f3b..ab02309f0752 100644
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
@@ -149,14 +161,66 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
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
+	const unsigned long page_count = obj->base.size / PAGE_SIZE;
+	struct address_space *mapping;
+	struct sg_table *st;
+	struct sgt_iter sgt_iter;
+	struct page *page;
+	unsigned int max_segment = i915_sg_segment_size();
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
+	st = shmem_alloc_st(i915, obj->base.size, mem,
+			    obj->base.filp->f_mapping, max_segment);
+	if (IS_ERR(st)) {
+		ret = PTR_ERR(st);
+		goto err_st;
+	}
+
 	ret = i915_gem_gtt_prepare_pages(obj, st);
 	if (ret) {
 		/*
@@ -168,6 +232,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 			for_each_sgt_page(page, sgt_iter, st)
 				put_page(page);
 			sg_free_table(st);
+			kfree(st);
 
 			max_segment = PAGE_SIZE;
 			goto rebuild_st;
@@ -200,28 +265,12 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
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
@@ -231,6 +280,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 	 * space and so want to translate the error from shmemfs back to our
 	 * usual understanding of ENOMEM.
 	 */
+err_st:
 	if (ret == -ENOSPC)
 		ret = -ENOMEM;
 
@@ -251,10 +301,8 @@ shmem_truncate(struct drm_i915_gem_object *obj)
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
@@ -270,10 +318,9 @@ shmem_writeback(struct drm_i915_gem_object *obj)
 	 * instead of invoking writeback so they are aged and paged out
 	 * as normal.
 	 */
-	mapping = obj->base.filp->f_mapping;
 
 	/* Begin writeback on each dirty page */
-	for (i = 0; i < obj->base.size >> PAGE_SHIFT; i++) {
+	for (i = 0; i < size >> PAGE_SHIFT; i++) {
 		struct page *page;
 
 		page = find_lock_page(mapping, i);
@@ -296,6 +343,12 @@ shmem_writeback(struct drm_i915_gem_object *obj)
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
@@ -316,11 +369,6 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_table *pages)
 {
-	struct sgt_iter sgt_iter;
-	struct pagevec pvec;
-	struct page *page;
-
-	GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
 	__i915_gem_object_release_shmem(obj, pages, true);
 
 	i915_gem_gtt_finish_pages(obj, pages);
@@ -328,25 +376,9 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
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

