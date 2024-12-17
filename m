Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562949F4E9C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2B10E9CA;
	Tue, 17 Dec 2024 14:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdCu2fhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9910E9C3;
 Tue, 17 Dec 2024 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734447558; x=1765983558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UkgtqwOhNZ6XcN0dpNkj3dQoXyg5Y5zGhMuuIn0jjgE=;
 b=bdCu2fhjRIH+nWxi1StigqcccB0Xq6oj8IH9hnL1ddbtRYwzBQKcHae3
 32iXL0aB2jpL/TBAJwfeFRa/yq2OW58oLXDF858yqqd0aEKlA89y5jFE4
 c1VgQGuNgRwkGJOwdge0rcIixlH9CFjyiHUyE0vE2G3Jlj1drxW2PoJOt
 mYfgD+GqQqe4ACY2X4A8eETDAQ/8b7OTOVxjDpMqzGC9LbIAdXRo1tLIR
 6mPZ4YP4wzyiQP7t8RJwezDTB/XZ6fTbUC9r9XnUKGAYRMDoFiBknZvYU
 EgA9rvyHTykE3uA35GobLN2sJFompV6mwBiLWDogoi+kG7789LHYxBt5u w==;
X-CSE-ConnectionGUID: q2mKnoamRY+puHDrODYkqA==
X-CSE-MsgGUID: mZC4xdAuSi2fo2dGWvsIjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34914440"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34914440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:18 -0800
X-CSE-ConnectionGUID: OTdNf773TVmsHspnalcCYg==
X-CSE-MsgGUID: OhmlqgFqRByF2GB6bJsBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101694302"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:15 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v15 3/9] drm/ttm/pool: Restructure the pool allocation code
Date: Tue, 17 Dec 2024 15:58:46 +0100
Message-ID: <20241217145852.37342-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
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

Simplify the pool allocation code somewhat by merging loop arguments
used by multiple functions together in a struct and simplifying the
loop. Also add documentation.
This hopefully makes the behaviour of the allocation loop
simplier to understand, but above all paves the way for upcoming
restore-while-allocating functionality.

There are no functional changes, but the "allow_pools" bool
introduced to keep current functionality could be removed as a
follow up, which would enable using write-back cached pools when
allocating memory for other caching modes, rather than to resort
to allocating from the system directly.

v15:
- Introduce this patch to simplify the upcoming patch that introduces
  restore while allocating.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 183 +++++++++++++++++++--------------
 1 file changed, 108 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 8504dbe19c1a..c9eba76d5143 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -58,6 +58,23 @@ struct ttm_pool_dma {
 	unsigned long vaddr;
 };
 
+/**
+ * struct ttm_pool_alloc_state - Current state of the tt page allocation process
+ * @pages: Pointer to the next tt page pointer to populate.
+ * @caching_divide: Pointer to the first page pointer whose page has a staged but
+ * not committed caching transition from write-back to @tt_caching.
+ * @dma_addr: Pointer to the next tt dma_address entry to populate if any.
+ * @remaining_pages: Remaining pages to populate.
+ * @tt_caching: The requested cpu-caching for the pages allocated.
+ */
+struct ttm_pool_alloc_state {
+	struct page **pages;
+	struct page **caching_divide;
+	dma_addr_t *dma_addr;
+	pgoff_t remaining_pages;
+	enum ttm_caching tt_caching;
+};
+
 static unsigned long page_pool_size;
 
 MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
@@ -160,25 +177,25 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	kfree(dma);
 }
 
-/* Apply a new caching to an array of pages */
-static int ttm_pool_apply_caching(struct page **first, struct page **last,
-				  enum ttm_caching caching)
+/* Apply any cpu-caching deferred during page allocation */
+static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
 {
 #ifdef CONFIG_X86
-	unsigned int num_pages = last - first;
+	unsigned int num_pages = alloc->pages - alloc->caching_divide;
 
 	if (!num_pages)
 		return 0;
 
-	switch (caching) {
+	switch (alloc->tt_caching) {
 	case ttm_cached:
 		break;
 	case ttm_write_combined:
-		return set_pages_array_wc(first, num_pages);
+		return set_pages_array_wc(alloc->caching_divide, num_pages);
 	case ttm_uncached:
-		return set_pages_array_uc(first, num_pages);
+		return set_pages_array_uc(alloc->caching_divide, num_pages);
 	}
 #endif
+	alloc->caching_divide = alloc->pages;
 	return 0;
 }
 
@@ -354,24 +371,41 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 	return p->private;
 }
 
-/* Called when we got a page, either from a pool or newly allocated */
+/*
+ * Called when we got a page, either from a pool or newly allocated.
+ * if needed, dma map the page and populate the dma address array.
+ * Populate the page address array.
+ * If the caching is consistent, update any deferred caching. Otherwise
+ * stage this page for an upcoming deferred caching update.
+ */
 static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
-				   struct page *p, dma_addr_t **dma_addr,
-				   unsigned long *num_pages,
-				   struct page ***pages)
+				   struct page *p, enum ttm_caching page_caching,
+				   struct ttm_pool_alloc_state *alloc)
 {
-	unsigned int i;
-	int r;
+	pgoff_t i, nr = 1UL << order;
+	bool caching_consistent;
+	int r = 0;
+
+	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
+
+	if (caching_consistent) {
+		r = ttm_pool_apply_caching(alloc);
+		if (r)
+			return r;
+	}
 
-	if (*dma_addr) {
-		r = ttm_pool_map(pool, order, p, dma_addr);
+	if (alloc->dma_addr) {
+		r = ttm_pool_map(pool, order, p, &alloc->dma_addr);
 		if (r)
 			return r;
 	}
 
-	*num_pages -= 1 << order;
-	for (i = 1 << order; i; --i, ++(*pages), ++p)
-		**pages = p;
+	alloc->remaining_pages -= nr;
+	for (i = 0; i < nr; ++i)
+		*alloc->pages++ = p++;
+
+	if (caching_consistent)
+		alloc->caching_divide = alloc->pages;
 
 	return 0;
 }
@@ -413,6 +447,26 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 	}
 }
 
+static void ttm_pool_alloc_state_init(const struct ttm_tt *tt,
+				      struct ttm_pool_alloc_state *alloc)
+{
+	alloc->pages = tt->pages;
+	alloc->caching_divide = tt->pages;
+	alloc->dma_addr = tt->dma_address;
+	alloc->remaining_pages = tt->num_pages;
+	alloc->tt_caching = tt->caching;
+}
+
+/*
+ * Find a suitable allocation order based on highest desired order
+ * and number of remaining pages
+ */
+static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
+					      const struct ttm_pool_alloc_state *alloc)
+{
+	return min_t(unsigned int, highest, __fls(alloc->remaining_pages));
+}
+
 /**
  * ttm_pool_alloc - Fill a ttm_tt object
  *
@@ -428,19 +482,19 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		   struct ttm_operation_ctx *ctx)
 {
-	pgoff_t num_pages = tt->num_pages;
-	dma_addr_t *dma_addr = tt->dma_address;
-	struct page **caching = tt->pages;
-	struct page **pages = tt->pages;
+	struct ttm_pool_alloc_state alloc;
 	enum ttm_caching page_caching;
 	gfp_t gfp_flags = GFP_USER;
 	pgoff_t caching_divide;
 	unsigned int order;
+	bool allow_pools;
 	struct page *p;
 	int r;
 
-	WARN_ON(!num_pages || ttm_tt_is_populated(tt));
-	WARN_ON(dma_addr && !pool->dev);
+	ttm_pool_alloc_state_init(tt, &alloc);
+
+	WARN_ON(!alloc.remaining_pages || ttm_tt_is_populated(tt));
+	WARN_ON(alloc.dma_addr && !pool->dev);
 
 	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
 		gfp_flags |= __GFP_ZERO;
@@ -453,67 +507,46 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
-	     num_pages;
-	     order = min_t(unsigned int, order, __fls(num_pages))) {
+	page_caching = tt->caching;
+	allow_pools = true;
+	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, &alloc);
+	     alloc.remaining_pages;
+	     order = ttm_pool_alloc_find_order(order, &alloc)) {
 		struct ttm_pool_type *pt;
 
-		page_caching = tt->caching;
-		pt = ttm_pool_select_type(pool, tt->caching, order);
-		p = pt ? ttm_pool_type_take(pt) : NULL;
-		if (p) {
-			r = ttm_pool_apply_caching(caching, pages,
-						   tt->caching);
-			if (r)
-				goto error_free_page;
-
-			caching = pages;
-			do {
-				r = ttm_pool_page_allocated(pool, order, p,
-							    &dma_addr,
-							    &num_pages,
-							    &pages);
-				if (r)
-					goto error_free_page;
-
-				caching = pages;
-				if (num_pages < (1 << order))
-					break;
-
-				p = ttm_pool_type_take(pt);
-			} while (p);
-		}
-
-		page_caching = ttm_cached;
-		while (num_pages >= (1 << order) &&
-		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
-
-			if (PageHighMem(p)) {
-				r = ttm_pool_apply_caching(caching, pages,
-							   tt->caching);
-				if (r)
-					goto error_free_page;
-				caching = pages;
-			}
-			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
-						    &num_pages, &pages);
-			if (r)
-				goto error_free_page;
-			if (PageHighMem(p))
-				caching = pages;
+		/* First, try to allocate a page from a pool if one exists. */
+		p = NULL;
+		pt = ttm_pool_select_type(pool, page_caching, order);
+		if (pt && allow_pools)
+			p = ttm_pool_type_take(pt);
+		/*
+		 * If that fails or previously failed, allocate from system.
+		 * Note that this also disallows additional pool allocations using
+		 * write-back cached pools of the same order. Consider removing
+		 * that behaviour.
+		 */
+		if (!p) {
+			page_caching = ttm_cached;
+			allow_pools = false;
+			p = ttm_pool_alloc_page(pool, gfp_flags, order);
 		}
-
+		/* If that fails, lower the order if possible and retry. */
 		if (!p) {
 			if (order) {
 				--order;
+				page_caching = tt->caching;
+				allow_pools = true;
 				continue;
 			}
 			r = -ENOMEM;
 			goto error_free_all;
 		}
+		r = ttm_pool_page_allocated(pool, order, p, page_caching, &alloc);
+		if (r)
+			goto error_free_page;
 	}
 
-	r = ttm_pool_apply_caching(caching, pages, tt->caching);
+	r = ttm_pool_apply_caching(&alloc);
 	if (r)
 		goto error_free_all;
 
@@ -523,10 +556,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	ttm_pool_free_page(pool, page_caching, order, p);
 
 error_free_all:
-	num_pages = tt->num_pages - num_pages;
-	caching_divide = caching - tt->pages;
+	caching_divide = alloc.caching_divide - tt->pages;
 	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
-	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide, num_pages);
+	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide,
+			    tt->num_pages - alloc.remaining_pages);
 
 	return r;
 }
-- 
2.47.1

