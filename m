Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE1698086
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454E710EB25;
	Wed, 15 Feb 2023 16:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47910EB14;
 Wed, 15 Feb 2023 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477747; x=1708013747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcHhg0q7WVCkFTZEWmcu3BUhdxit+IJqyVFdQl4YAf0=;
 b=RAcbzupHx6khcVcKtGVLn6a4rRlQTn1e6sXl8plRaNaj7/n1E0YNzddk
 p1lQno4kxf5rShkd3KRlyvQy05hJ5fjf82Jh7/SLXcuhYk5edMUQ9nADL
 z2YszlB1Y/A3YR1UZRLPo7+ybJ14nI3rEbzsIwmussS4K2ZZIOLBXHM04
 txh6RpVk+4Swr87gC9EN4hd/4zcWRzrkOCQekxbFBBCoaInjInD+5kSL3
 FE+IhH0JsR/irck4kd+hVystVuI3aHkjjf1t3nwB4NQjjbKUb6J8bdXYi
 g379P/dbeeewJSOWnyCZ6UT885jjb2j4XH1BXSU6YB9XDA+f5Q/4Ic4jV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871127"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472782"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472782"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 14/16] drm/ttm: Provide helpers for shrinking
Date: Wed, 15 Feb 2023 17:14:03 +0100
Message-Id: <20230215161405.187368-15-thomas.hellstrom@linux.intel.com>
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

Provide a helper to be used by the driver bo_shrink() callback to either
insert the pages of a struct ttm_tt into the swap-cache or to purge them
if the struct ttm_tt is purgeable. For pages with write-combined or
uncached linear kernel map, that linear kernel map is first changed to
cached.

Release pages with as little intermediate memory allocation as
possible, however some memory might be allocated during swapout for the
swap space radix tree.

Due to swapout- or swapin errors, allow partially swapped out struct
ttm_tt's, although mark them as swapped out stopping them from being
swapped out a second time. More details in the ttm_pool.c DOC section.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig        |   1 +
 drivers/gpu/drm/ttm/ttm_pool.c | 403 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c   |  34 +++
 include/drm/ttm/ttm_pool.h     |   4 +
 include/drm/ttm/ttm_tt.h       |  10 +
 5 files changed, 437 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dc0f94f02a82..1efd33411a92 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -196,6 +196,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select SWAP_BACKUP_FOLIO
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 8787fb6a218b..319998b4a325 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -38,6 +38,7 @@
 #include <linux/debugfs.h>
 #include <linux/highmem.h>
 #include <linux/sched/mm.h>
+#include <linux/swap.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -72,6 +73,32 @@ struct ttm_pool_dma {
 	unsigned long vaddr;
 };
 
+/**
+ * struct ttm_pool_tt_restore - State representing restore from swap.
+ * @alloced_pages: Total number of already allocated pages for the ttm_tt.
+ * @restored_pages: Number of (sub) pages restored from swap for this
+ *		     chunk of 1 << @order pages.
+ * @first_page: The ttm page ptr representing for @old_pages[0].
+ * @caching_divide: Page pointer where subsequent pages are cached.
+ * @old_pages: Backup copy of page pointers that were replaced by the new
+ *	       page allocation.
+ * @pool: The pool used for page allocation while restoring.
+ * @order: The order of the last page allocated while restoring.
+ *
+ * Recovery from swap space might fail when we've recovered less than the
+ * full ttm_tt. In order not to loose any data (yet), keep information
+ * around that allows us to restart a failed ttm swap-space recovery.
+ */
+struct ttm_pool_tt_restore {
+	pgoff_t alloced_pages;
+	pgoff_t restored_pages;
+	struct page **first_page;
+	struct page **caching_divide;
+	struct page *old_pages[1 << TTM_MAX_ORDER];
+	struct ttm_pool *pool;
+	unsigned int order;
+};
+
 static unsigned long page_pool_size;
 
 MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
@@ -91,6 +118,23 @@ static struct shrinker mm_shrinker;
 
 static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
 
+static struct page *ttm_pool_swap_to_page_ptr(swp_entry_t swap)
+{
+	return (struct page *)(swap.val << 1 | 1);
+}
+
+static swp_entry_t ttm_pool_page_ptr_to_swap(const struct page *p)
+{
+	swp_entry_t swap = {.val = ((unsigned long)p) >> 1};
+
+	return swap;
+}
+
+static bool ttm_pool_page_ptr_is_swap(const struct page *p)
+{
+	return ((unsigned long)p) & 1;
+}
+
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
@@ -361,11 +405,99 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 	return p->private;
 }
 
+/*
+ * To be able to insert single pages into the swap cache directly,
+ * we need to split multi-order page allocations and make them look
+ * like single page-allocations.
+ */
+static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
+{
+	unsigned int order = ttm_pool_page_order(pool, p);
+	pgoff_t nr;
+
+	if (!order)
+		return;
+
+	split_page(p, order);
+	nr = 1UL << order;
+	while (nr--)
+		(p++)->private = 0;
+}
+
+/**
+ * DOC: Partial shrinking and restoration of a struct ttm_tt.
+ *
+ * Swapout using swap_backup_folio() and swapin using swap_copy_folio() may fail.
+ * The former most likely due to lack of swap-space or memory, the latter due
+ * to lack of memory or because of signal interruption during waits.
+ *
+ * Swapout failure is easily handled by using a ttm_tt pages vector that holds
+ * both swap entries and page pointers. This has to be taken into account when
+ * restoring such a ttm_tt from swap, and when freeing it while swapped out.
+ * When restoring, for simplicity, new pages are actually allocated from the
+ * pool and the contents of any old pages are copied in and then the old pages
+ * are released.
+ *
+ * For swapin failures, the struct ttm_pool_tt_restore holds sufficient state
+ * to be able to resume an interrupted restore, and that structure is freed once
+ * the restoration is complete. If the struct ttm_tt is destroyed while there
+ * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
+ * care of.
+ */
+
+static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
+{
+	return restore && restore->restored_pages < (1 << restore->order);
+}
+
+static int ttm_pool_swapin(struct ttm_pool_tt_restore *restore,
+			   struct ttm_operation_ctx *ctx)
+{
+	unsigned int i, nr = 1 << restore->order;
+	int ret = 0;
+
+	if (!ttm_pool_restore_valid(restore))
+		return 0;
+
+	for (i = restore->restored_pages; i < nr; ++i) {
+		struct page *p = restore->old_pages[i];
+
+		if (ttm_pool_page_ptr_is_swap(p)) {
+			swp_entry_t swap = ttm_pool_page_ptr_to_swap(p);
+
+			if (swap.val == 0)
+				continue;
+
+			ret = swap_copy_folio(swap, restore->first_page[i], 0,
+					      ctx->interruptible);
+			if (ret)
+				break;
+
+			swap_drop_folio(swap);
+		} else if (p) {
+			/*
+			 * We could probably avoid splitting the old page
+			 * using clever logic, but ATM we don't care.
+			 */
+			ttm_pool_split_for_swap(restore->pool, p);
+			copy_highpage(restore->first_page[i], p);
+			__free_pages(p, 0);
+		}
+
+		restore->restored_pages++;
+		restore->old_pages[i] = NULL;
+		cond_resched();
+	}
+
+	return ret;
+}
+
 /* Called when we got a page, either from a pool or newly allocated */
 static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 				   struct page *p, dma_addr_t **dma_addr,
 				   unsigned long *num_pages,
-				   struct page ***pages)
+				   struct page ***pages,
+				   struct ttm_pool_tt_restore *restore)
 {
 	unsigned int i;
 	int r;
@@ -376,6 +508,16 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 			return r;
 	}
 
+	if (restore) {
+		memcpy(restore->old_pages, *pages,
+		       (1 << order) * sizeof(*restore->old_pages));
+		memset(*pages, 0, (1 << order) * sizeof(**pages));
+		restore->order = order;
+		restore->restored_pages = 0;
+		restore->first_page = *pages;
+		restore->alloced_pages += 1UL << order;
+	}
+
 	*num_pages -= 1 << order;
 	for (i = 1 << order; i; --i, ++(*pages), ++p)
 		**pages = p;
@@ -387,32 +529,48 @@ static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,
 			    struct page **caching_divide,
 			    enum ttm_caching initial_caching,
 			    enum ttm_caching subseq_caching,
-			    pgoff_t num_pages)
+			    pgoff_t start_page, pgoff_t end_page)
 {
 	enum ttm_caching caching = subseq_caching;
-	struct page **pages = tt->pages;
+	struct page **pages = tt->pages + start_page;
 	unsigned int order;
 	pgoff_t i, nr;
 
 	if (pool && caching_divide)
 		caching = initial_caching;
 
-	for (i = 0; i < num_pages; i += nr, pages += nr) {
+	for (i = start_page; i < end_page; i += nr, pages += nr) {
 		struct ttm_pool_type *pt = NULL;
+		struct page *p = *pages;
 
 		if (unlikely(caching_divide == pages))
 			caching = subseq_caching;
 
-		order = ttm_pool_page_order(pool, *pages);
-		nr = (1UL << order);
-		if (tt->dma_address)
-			ttm_pool_unmap(pool, tt->dma_address[i], nr);
+		if (ttm_pool_page_ptr_is_swap(p)) {
+			swp_entry_t swap = ttm_pool_page_ptr_to_swap(p);
+
+			nr = 1;
+			if (swap.val != 0)
+				swap_drop_folio(swap);
+			continue;
+		}
+
+		if (pool) {
+			order = ttm_pool_page_order(pool, p);
+			nr = (1UL << order);
+			if (tt->dma_address)
+				ttm_pool_unmap(pool, tt->dma_address[i], nr);
+
+			pt = ttm_pool_select_type(pool, caching, order);
+		} else {
+			order = p->private;
+			nr = (1UL << order);
+		}
 
-		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, p);
 		else
-			ttm_pool_free_page(pool, caching, order, *pages);
+			ttm_pool_free_page(pool, caching, order, p);
 	}
 }
 
@@ -467,6 +625,28 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		gfp_flags |= GFP_HIGHUSER;
 
 	order = ttm_pool_select_order(ttm_pool_orders[0], num_pages);
+
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_SHRUNKEN) {
+		if (!tt->restore) {
+			tt->restore = kvzalloc(sizeof(*tt->restore),
+					       GFP_KERNEL);
+			if (!tt->restore)
+				return -ENOMEM;
+		} else if (ttm_pool_restore_valid(tt->restore)) {
+			struct ttm_pool_tt_restore *restore = tt->restore;
+
+			num_pages -= restore->alloced_pages;
+			order = ttm_pool_select_order(restore->order, num_pages);
+			pages += restore->alloced_pages;
+			r = ttm_pool_swapin(restore, ctx);
+			if (r)
+				return r;
+			caching = restore->caching_divide;
+		}
+
+		tt->restore->pool = pool;
+	}
+
 	for (; num_pages; order = ttm_pool_select_order(order, num_pages)) {
 		struct ttm_pool_type *pt;
 
@@ -484,11 +664,18 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				r = ttm_pool_page_allocated(pool, order, p,
 							    &dma_addr,
 							    &num_pages,
-							    &pages);
+							    &pages,
+							    tt->restore);
 				if (r)
 					goto error_free_page;
 
 				caching = pages;
+				if (ttm_pool_restore_valid(tt->restore)) {
+					r = ttm_pool_swapin(tt->restore, ctx);
+					if (r)
+						goto error_free_all;
+				}
+
 				if (num_pages < (1 << order))
 					break;
 
@@ -508,9 +695,17 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				caching = pages;
 			}
 			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
-						    &num_pages, &pages);
+						    &num_pages, &pages,
+						    tt->restore);
 			if (r)
 				goto error_free_page;
+
+			if (ttm_pool_restore_valid(tt->restore)) {
+				r = ttm_pool_swapin(tt->restore, ctx);
+				if (r)
+					goto error_free_all;
+			}
+
 			if (PageHighMem(p))
 				caching = pages;
 		}
@@ -529,15 +724,29 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	if (r)
 		goto error_free_all;
 
+	if (tt->restore) {
+		kvfree(tt->restore);
+		tt->restore = NULL;
+	}
+
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_SHRUNKEN)
+		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_SHRUNKEN |
+				    TTM_TT_FLAG_SWAPPED);
+
 	return 0;
 
 error_free_page:
 	ttm_pool_free_page(pool, page_caching, order, p);
 
 error_free_all:
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_SHRUNKEN) {
+		tt->restore->caching_divide = caching;
+		return r;
+	}
+
 	num_pages = tt->num_pages - num_pages;
 	__ttm_pool_free(pool, tt, caching, tt->caching, ttm_cached,
-			num_pages);
+			0, num_pages);
 
 	return r;
 }
@@ -554,13 +763,177 @@ EXPORT_SYMBOL(ttm_pool_alloc);
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 {
 	__ttm_pool_free(pool, tt, NULL, tt->caching, tt->caching,
-			tt->num_pages);
+			0, tt->num_pages);
 
 	while (atomic_long_read(&allocated_pages) > page_pool_size)
 		ttm_pool_shrink();
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
+/**
+ * ttm_pool_release_shrunken() - Release content of a swapped-out struct ttm_tt
+ * @tt: The struct ttm_tt.
+ *
+ * Release swap entries with associated content or any remaining pages of
+ * a swapped-out struct ttm_tt.
+ */
+void ttm_pool_release_shrunken(struct ttm_tt *tt)
+{
+	struct ttm_pool_tt_restore *restore;
+	struct page **caching_divide = NULL;
+	struct ttm_pool *pool = NULL;
+	pgoff_t i, start_page = 0;
+	swp_entry_t swap;
+
+	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_SHRUNKEN))
+		return;
+
+	restore = tt->restore;
+
+	if (ttm_pool_restore_valid(restore)) {
+		pgoff_t nr = 1UL << restore->order;
+
+		for (i = restore->restored_pages; i < nr; ++i) {
+			struct page *p = restore->old_pages[i];
+
+			if (ttm_pool_page_ptr_is_swap(p)) {
+				swap = ttm_pool_page_ptr_to_swap(p);
+				if (swap.val == 0)
+					continue;
+
+				swap_drop_folio(swap);
+			} else if (p) {
+				ttm_pool_split_for_swap(restore->pool, p);
+				__free_pages(p, 0);
+			}
+		}
+	}
+
+	if (restore) {
+		pool = restore->pool;
+		caching_divide = restore->caching_divide;
+		start_page = restore->alloced_pages;
+		/* Pages that might be dma-mapped and non-cached */
+		__ttm_pool_free(pool, tt, caching_divide, tt->caching,
+				ttm_cached, 0, start_page);
+	}
+
+	/* Shrunken pages. Cached and not dma-mapped. */
+	__ttm_pool_free(NULL, tt, NULL, ttm_cached, ttm_cached, start_page,
+			tt->num_pages);
+
+	if (restore) {
+		kvfree(restore);
+		tt->restore = NULL;
+	}
+
+	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_SHRUNKEN | TTM_TT_FLAG_SWAPPED);
+}
+
+/**
+ * ttm_pool_shrink_tt() - Swap out or purge a struct ttm_tt
+ * @pool: The pool used when allocating the struct ttm_tt.
+ * @ttm: The struct ttm_tt.
+ *
+ * Swap out or purge a struct ttm_tt. If @ttm is marked purgeable, then
+ * all pages will be freed directly to the system rather than to the pool
+ * they were allocated from, making the function behave similarly to
+ * ttm_pool_free(). If @ttm is not marked purgeable, the pages will be
+ * inserted into the swap cache instead, exchanged for a swap entry.
+ * A subsequent call to ttm_pool_alloc() will then read back the content and
+ * a subsequent call to ttm_pool_release_shrunken() will drop it.
+ * If swapout of a page fails for whatever reason, @ttm will still be
+ * partially swapped out, retaining those pages for which swapout fails.
+ *
+ * @Return: Number of pages actually swapped out or freed, or negative
+ * error code on error.
+ */
+long ttm_pool_shrink_tt(struct ttm_pool *pool, struct ttm_tt *ttm)
+{
+	struct page *page;
+	struct folio *folio;
+	swp_entry_t swap;
+	gfp_t alloc_gfp;
+	gfp_t gfp;
+	int ret = 0;
+	pgoff_t shrunken = 0;
+	pgoff_t i, num_pages;
+	bool purge = ttm_tt_purgeable(ttm);
+
+	if ((!get_nr_swap_pages() && purge) ||
+	    pool->use_dma_alloc ||
+	    (ttm->page_flags & TTM_TT_FLAG_PRIV_SHRUNKEN))
+		return -EBUSY;
+
+#ifdef CONFIG_X86
+	/* Anything returned to the system needs to be cached. */
+	if (ttm->caching != ttm_cached)
+		set_pages_array_wb(ttm->pages, ttm->num_pages);
+#endif
+
+	if (ttm->dma_address || purge) {
+		for (i = 0; i < ttm->num_pages; i += num_pages) {
+			unsigned int order;
+
+			page = ttm->pages[i];
+			if (unlikely(!page))
+				continue;
+
+			order = 1UL << ttm_pool_page_order(pool, page);
+			num_pages = 1UL << order;
+			if (ttm->dma_address)
+				ttm_pool_unmap(pool, ttm->dma_address[i],
+					       num_pages);
+			if (purge) {
+				shrunken += num_pages;
+				__free_pages(page, order);
+				memset(ttm->pages + i, 0,
+				       num_pages * sizeof(*ttm->pages));
+			}
+		}
+	}
+
+	if (purge)
+		return shrunken;
+
+	if (pool->use_dma32)
+		gfp = GFP_DMA32;
+	else
+		gfp = GFP_HIGHUSER;
+
+	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN;
+	if (current_is_kswapd())
+		alloc_gfp |= __GFP_NOMEMALLOC;
+
+	for (i = 0; i < ttm->num_pages; ++i) {
+		page = ttm->pages[i];
+		if (unlikely(!page))
+			continue;
+
+		ttm_pool_split_for_swap(pool, page);
+
+		folio = page_folio(page);
+		folio_mark_dirty(folio);
+		swap = swap_backup_folio(folio, false, gfp, alloc_gfp);
+		if (swap.val) {
+			ttm->pages[i] = ttm_pool_swap_to_page_ptr(swap);
+			folio_put(folio);
+			shrunken++;
+		} else {
+			/* We allow partially shrunken tts */
+			ret = -ENOMEM;
+			break;
+		}
+		cond_resched();
+	}
+
+	if (shrunken)
+		ttm->page_flags |= (TTM_TT_FLAG_PRIV_SHRUNKEN |
+				    TTM_TT_FLAG_SWAPPED);
+
+	return shrunken ? shrunken : ret;
+}
+
 /**
  * ttm_pool_init - Initialize a pool
  *
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index c63be8f5ed2a..8ac4a9cba34d 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -133,6 +133,8 @@ int ttm_tt_set_dontneed(const struct ttm_device *bdev, struct ttm_tt *tt)
 		fput(tt->swap_storage);
 	tt->swap_storage = NULL;
 
+	ttm_pool_release_shrunken(tt);
+
 	return -EALREADY;
 }
 EXPORT_SYMBOL(ttm_tt_set_dontneed);
@@ -253,6 +255,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->swap_storage = NULL;
 	ttm->sg = bo->sg;
 	ttm->caching = caching;
+	ttm->restore = NULL;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -277,6 +280,8 @@ void ttm_tt_fini(struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 	ttm->swap_storage = NULL;
 
+	ttm_pool_release_shrunken(ttm);
+
 	if (ttm->pages)
 		kvfree(ttm->pages);
 	else
@@ -347,6 +352,35 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 	return ret;
 }
 
+/**
+ * ttm_tt_shrink() - Helper for the driver bo_shrink() method.
+ * @bdev: The TTM device.
+ * @tt: The struct ttm_tt.
+ *
+ * Helper for a TTM driver to use from the bo_shrink() method to shrink
+ * a struct ttm_tt, after it has done the necessary unbinding. This function
+ * will update the page accounting and call ttm_pool_shrink_tt to free pages
+ * or move them to the swap cache.
+ *
+ * Return: Number of pages freed or swapped out, or negative error code on
+ * error.
+ */
+long ttm_tt_shrink(struct ttm_device *bdev, struct ttm_tt *tt)
+{
+	long ret = ttm_pool_shrink_tt(&bdev->pool, tt);
+
+	if (ret > 0) {
+		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
+		if (ttm_tt_purgeable(tt))
+			ttm_tt_mod_shrinkable_pages(0, -(long)tt->num_pages);
+		else
+			ttm_tt_mod_shrinkable_pages(-(long)tt->num_pages, 0);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_tt_shrink);
+
 /**
  * ttm_tt_swapout - swap out tt object
  * @bdev: TTM device structure.
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index c1200552892e..bfe14138a992 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -86,6 +86,10 @@ void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
 
+void ttm_pool_release_shrunken(struct ttm_tt *tt);
+
+long ttm_pool_shrink_tt(struct ttm_pool *pool, struct ttm_tt *ttm);
+
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index abb17527f76c..0fa71292b676 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -37,6 +37,7 @@ struct ttm_tt;
 struct ttm_resource;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
+struct ttm_pool_tt_restore;
 
 /**
  * struct ttm_tt - This is a structure holding the pages, caching- and aperture
@@ -79,6 +80,10 @@ struct ttm_tt {
 	 *   page_flags = TTM_TT_FLAG_EXTERNAL |
 	 *		  TTM_TT_FLAG_EXTERNAL_MAPPABLE;
 	 *
+	 * TTM_TT_FLAG_PRIV_SHRUNKEN: TTM internal only. This is set if the
+	 * struct ttm_tt has been (possibly partially) swapped out to the
+	 * swap cache.
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -89,6 +94,7 @@ struct ttm_tt {
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
 #define TTM_TT_FLAG_DONTNEED		BIT(4)
 
+#define TTM_TT_FLAG_PRIV_SHRUNKEN	BIT(30)
 #define TTM_TT_FLAG_PRIV_POPULATED	BIT(31)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
@@ -104,6 +110,8 @@ struct ttm_tt {
 	 * ttm_caching.
 	 */
 	enum ttm_caching caching;
+	/** @restore: Swap restore state. Drivers keep off. */
+	struct ttm_pool_tt_restore *restore;
 };
 
 /**
@@ -226,6 +234,8 @@ void ttm_tt_mgr_fini(void);
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 					    struct ttm_tt *tt);
 
+long ttm_tt_shrink(struct ttm_device *bdev, struct ttm_tt *tt);
+
 /**
  * ttm_tt_purgeable() - Whether a struct ttm_tt's contents is purgeable
  * @tt: The struct ttm_tt to consider.
-- 
2.34.1

