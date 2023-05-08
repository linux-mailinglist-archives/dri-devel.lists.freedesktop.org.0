Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E166FAABB
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 13:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E469510E22C;
	Mon,  8 May 2023 11:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21C610E22C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 11:06:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C258162A7B;
 Mon,  8 May 2023 11:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAEBC433EF;
 Mon,  8 May 2023 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1683543965;
 bh=/lGom4PQm//Oe2cxKaS1u1inmDmDEVEx32AYWHfP2NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OZnoOpCenBqxJI2ODijpy26cVubWYJhP+XF2FypfidAfQSkmIUu4lqemjZcgQWrgX
 6aEKTxnmkEwzz46aeuXUZtM4xV+zev3KGoBlB9Hd2FWCFQXFB78+XxbyV/uXqBmGsv
 e7GGK2IVlILOFlt8FFYx/vf5fqoG02N9XdZdMjfE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.3 259/694] drm/ttm/pool: Fix ttm_pool_alloc error path
Date: Mon,  8 May 2023 11:41:34 +0200
Message-Id: <20230508094440.695664175@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508094432.603705160@linuxfoundation.org>
References: <20230508094432.603705160@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

[ Upstream commit 379989e7cbdc7aa7496a00ee286ec146c7599cf0 ]

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
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230404200650.11043-2-thomas.hellstrom@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 81 +++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index aa116a7bbae3a..dfce896c4baeb 100644
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



