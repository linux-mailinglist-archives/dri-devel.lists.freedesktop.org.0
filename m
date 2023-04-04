Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF16D6D9A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C4710E7A0;
	Tue,  4 Apr 2023 20:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439CC10E79D;
 Tue,  4 Apr 2023 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638853; x=1712174853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7zxLT7s4K9fo5IbTMJzf8nihkaC/7ZLSOwfLkpIdUN0=;
 b=a8/rW5RleNpRIPCAbHmdNvUpbhZzO14idFM38knKFjXrbe/iZKaGrGhu
 BBUu91ov89fC79fjQznMsUUy4RGNgSJuySBARxJilgnjB09Xb0TXLGNSf
 TN1J4ZyUXWhqpSbAgAP8Cqfa22iNc3Yv91oVlXO9QbbUh8cNNMmloDS9s
 aA0cf71TiBlQAMFu1i2ASDEgoSeMeqAuLqn/3SIE4uzpVntRHQzRZErL6
 rTejMiRM8qol35CPzfWtxIMl5G17Lkh30YUhKWwFiem+OsCcYr8CHX8Al
 9BBHl9+AEur/qYP0B2vKEXytMrj51VPRqtI/x3X/QkIgNCMGv9ApiBaK/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326324748"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="326324748"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689022003"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="689022003"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.33.67])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 1/3] drm/ttm/pool: Fix ttm_pool_alloc error path
Date: Tue,  4 Apr 2023 22:06:48 +0200
Message-Id: <20230404200650.11043-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When hitting an error, the error path forgot to unmap dma mappings and
could call set_pages_wb() on already uncached pages.

Fix this by introducing a common ttm_pool_free_range() function that
does the right thing.

v2:
- Simplify that common function (Christian König)
v3:
- Rename that common function to ttm_pool_free_range() (Christian König)

Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 81 +++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index aa116a7bbae3..dfce896c4bae 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -367,6 +367,43 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 	return 0;
 }
 
+/**
+ * ttm_pool_free_range() - Free a range of TTM pages
+ * @pool: The pool used for allocating.
+ * @tt: The struct ttm_tt holding the page pointers.
+ * @caching: The page caching mode used by the range.
+ * @start_page: index for first page to free.
+ * @end_page: index for last page to free + 1.
+ *
+ * During allocation the ttm_tt page-vector may be populated with ranges of
+ * pages with different attributes if allocation hit an error without being
+ * able to completely fulfill the allocation. This function can be used
+ * to free these individual ranges.
+ */
+static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
+				enum ttm_caching caching,
+				pgoff_t start_page, pgoff_t end_page)
+{
+	struct page **pages = tt->pages;
+	unsigned int order;
+	pgoff_t i, nr;
+
+	for (i = start_page; i < end_page; i += nr, pages += nr) {
+		struct ttm_pool_type *pt = NULL;
+
+		order = ttm_pool_page_order(pool, *pages);
+		nr = (1UL << order);
+		if (tt->dma_address)
+			ttm_pool_unmap(pool, tt->dma_address[i], nr);
+
+		pt = ttm_pool_select_type(pool, caching, order);
+		if (pt)
+			ttm_pool_type_give(pt, *pages);
+		else
+			ttm_pool_free_page(pool, caching, order, *pages);
+	}
+}
+
 /**
  * ttm_pool_alloc - Fill a ttm_tt object
  *
@@ -382,12 +419,14 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		   struct ttm_operation_ctx *ctx)
 {
-	unsigned long num_pages = tt->num_pages;
+	pgoff_t num_pages = tt->num_pages;
 	dma_addr_t *dma_addr = tt->dma_address;
 	struct page **caching = tt->pages;
 	struct page **pages = tt->pages;
+	enum ttm_caching page_caching;
 	gfp_t gfp_flags = GFP_USER;
-	unsigned int i, order;
+	pgoff_t caching_divide;
+	unsigned int order;
 	struct page *p;
 	int r;
 
@@ -410,6 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		struct ttm_pool_type *pt;
 
+		page_caching = tt->caching;
 		pt = ttm_pool_select_type(pool, tt->caching, order);
 		p = pt ? ttm_pool_type_take(pt) : NULL;
 		if (p) {
@@ -418,6 +458,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 			if (r)
 				goto error_free_page;
 
+			caching = pages;
 			do {
 				r = ttm_pool_page_allocated(pool, order, p,
 							    &dma_addr,
@@ -426,14 +467,15 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				if (r)
 					goto error_free_page;
 
+				caching = pages;
 				if (num_pages < (1 << order))
 					break;
 
 				p = ttm_pool_type_take(pt);
 			} while (p);
-			caching = pages;
 		}
 
+		page_caching = ttm_cached;
 		while (num_pages >= (1 << order) &&
 		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
 
@@ -442,6 +484,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 							   tt->caching);
 				if (r)
 					goto error_free_page;
+				caching = pages;
 			}
 			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
 						    &num_pages, &pages);
@@ -468,15 +511,13 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	return 0;
 
 error_free_page:
-	ttm_pool_free_page(pool, tt->caching, order, p);
+	ttm_pool_free_page(pool, page_caching, order, p);
 
 error_free_all:
 	num_pages = tt->num_pages - num_pages;
-	for (i = 0; i < num_pages; ) {
-		order = ttm_pool_page_order(pool, tt->pages[i]);
-		ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
-		i += 1 << order;
-	}
+	caching_divide = caching - tt->pages;
+	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
+	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide, num_pages);
 
 	return r;
 }
@@ -492,27 +533,7 @@ EXPORT_SYMBOL(ttm_pool_alloc);
  */
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 {
-	unsigned int i;
-
-	for (i = 0; i < tt->num_pages; ) {
-		struct page *p = tt->pages[i];
-		unsigned int order, num_pages;
-		struct ttm_pool_type *pt;
-
-		order = ttm_pool_page_order(pool, p);
-		num_pages = 1ULL << order;
-		if (tt->dma_address)
-			ttm_pool_unmap(pool, tt->dma_address[i], num_pages);
-
-		pt = ttm_pool_select_type(pool, tt->caching, order);
-		if (pt)
-			ttm_pool_type_give(pt, tt->pages[i]);
-		else
-			ttm_pool_free_page(pool, tt->caching, order,
-					   tt->pages[i]);
-
-		i += num_pages;
-	}
+	ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
 
 	while (atomic_long_read(&allocated_pages) > page_pool_size)
 		ttm_pool_shrink();
-- 
2.39.2

