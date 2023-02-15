Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54C69805A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF01010EAFC;
	Wed, 15 Feb 2023 16:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9F410E236;
 Wed, 15 Feb 2023 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477707; x=1708013707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o5ahpK5T7/o9yYCKobDBT3y231WpHzebkC3ym7Te37s=;
 b=bY3xYJDkkGiTCLjg66SSIAXDc/cy9Q7X2ZS5TtSExUb2Q0PFnPD2KT0U
 DJqt0YLPiES0R38GcHnWaXDS8Lu0xgSZXIq+Nd3QZ0FstIMkKFrmOuIOn
 LUg7u+8+nQBQuTIWX2SK28PP+7SCmQ9w+ipmb+zVsE9l+z5Q7jEfvfk32
 Hdym+XuGrb/go3iVItTWYLEz2HHepPJxBgbXOUtC6T3YnUQO4ZX0spcOm
 yCD5xFM9PSvKZYZDUbfQRrIi/CCWZov2XLoAP4jdKwXtlyLqctwOttByA
 LdLTOfUVn1+d+DlHCKRUkvd2WuCc9DN+AXR+MESX+mXtzZwcmgqX6A6eZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870897"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870897"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472414"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472414"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:00 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Date: Wed, 15 Feb 2023 17:13:56 +0100
Message-Id: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
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

When swapping out, we will split multi-order pages both in order to
move them to the swap-cache and to be able to return memory to the
swap cache as soon as possible on a page-by-page basis.
By reducing the page max order to the system PMD size, we can be nicer
to the system and avoid splitting gigantic pages. On top of this we also
include the 64K page size in the page sizes tried, since that appears to
be a common size for GPU applications.

Looking forward to when we might be able to swap out PMD size folios
without splitting, this will also be a benefit.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 58 ++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 1cc7591a9542..8787fb6a218b 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -31,6 +31,8 @@
  * cause they are rather slow compared to alloc_pages+map.
  */
 
+#define pr_fmt(fmt) "[TTM POOL] " fmt
+
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
@@ -47,6 +49,18 @@
 
 #include "ttm_module.h"
 
+#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
+#define TTM_64K_ORDER (16 - PAGE_SHIFT)
+#if (TTM_MAX_ORDER < TTM_64K_ORDER)
+#undef TTM_MAX_ORDER
+#define TTM_MAX_ORDER TTM_64K_ORDER
+#endif
+#if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
+#undef TTM_MAX_ORDER
+#define TTM_MAX_ORDER (MAX_ORDER - 1)
+#endif
+#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -65,16 +79,18 @@ module_param(page_pool_size, ulong, 0644);
 
 static atomic_long_t allocated_pages;
 
-static struct ttm_pool_type global_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_uncached[MAX_ORDER];
+static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
+static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
 
-static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
+static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
+static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
 
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
 static struct shrinker mm_shrinker;
 
+static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
+
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
@@ -400,6 +416,17 @@ static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,
 	}
 }
 
+static unsigned int ttm_pool_select_order(unsigned int order, pgoff_t num_pages)
+{
+	unsigned int *cur_order = ttm_pool_orders;
+
+	order = min_t(unsigned int, __fls(num_pages), order);
+	while (order < *cur_order)
+		++cur_order;
+
+	return *cur_order;
+}
+
 /**
  * ttm_pool_alloc - Fill a ttm_tt object
  *
@@ -439,9 +466,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
-	     num_pages;
-	     order = min_t(unsigned int, order, __fls(num_pages))) {
+	order = ttm_pool_select_order(ttm_pool_orders[0], num_pages);
+	for (; num_pages; order = ttm_pool_select_order(order, num_pages)) {
 		struct ttm_pool_type *pt;
 
 		page_caching = tt->caching;
@@ -558,7 +584,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 
 	if (use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_init(&pool->caching[i].orders[j],
 						   pool, i, j);
 	}
@@ -578,7 +604,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 
 	if (pool->use_dma_alloc) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
+			for (j = 0; j < TTM_DIM_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
 	}
 
@@ -632,7 +658,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
 	unsigned int i;
 
 	seq_puts(m, "\t ");
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " ---%2u---", i);
 	seq_puts(m, "\n");
 }
@@ -643,7 +669,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i)
+	for (i = 0; i < TTM_DIM_ORDER; ++i)
 		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
 	seq_puts(m, "\n");
 }
@@ -749,10 +775,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
+	if (TTM_64K_ORDER < TTM_MAX_ORDER)
+		ttm_pool_orders[1] = TTM_64K_ORDER;
+
+	pr_debug("Used orders are %u %u %u\n", ttm_pool_orders[0],
+		 ttm_pool_orders[1], ttm_pool_orders[2]);
+
 	spin_lock_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
-	for (i = 0; i < MAX_ORDER; ++i) {
+	for (i = 0; i < TTM_DIM_ORDER; ++i) {
 		ttm_pool_type_init(&global_write_combined[i], NULL,
 				   ttm_write_combined, i);
 		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
@@ -785,7 +817,7 @@ void ttm_pool_mgr_fini(void)
 {
 	unsigned int i;
 
-	for (i = 0; i < MAX_ORDER; ++i) {
+	for (i = 0; i < TTM_DIM_ORDER; ++i) {
 		ttm_pool_type_fini(&global_write_combined[i]);
 		ttm_pool_type_fini(&global_uncached[i]);
 
-- 
2.34.1

