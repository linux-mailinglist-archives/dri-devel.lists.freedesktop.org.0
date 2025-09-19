Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79489B899E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C79410E9CF;
	Fri, 19 Sep 2025 13:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bQBM3UgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807010EA04;
 Fri, 19 Sep 2025 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Ac5Pndrjy/NFJjY06iMuyPdEpeSRR3BvhyrB2JaDoY=; b=bQBM3UgDMbbS4aDojEiJTWOc7Z
 dbwlucUkHjU4h8zYEXENeekfOF/U4lIjcZzBFJG1eEu2ql1XoChWTtub6Sw4IcKuCjQz1a0rk6x0R
 txoPF06TAXoUoeWTU+VL9IlsKHDvNrqmTbjtcQARQMTC6mTP5PQ418z5sDv9BMjDUjJE3sfnRAi7s
 71QXyobxkHNSdAls8dd4T48zvDmis6hpwX/7hdgjo866/stvSBgH3x9q0Udy9dvrKLbK9VcYcQ9Xs
 HC/9vWprre5OZqLwM4O8eMgBQjRxA9krAVc9HI9Vb/uXD+1vHNM9qQrY0HixysgMRq2XFhXmJu3i6
 PBXS+1Vg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzati-00E6IK-1I; Fri, 19 Sep 2025 15:11:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [RFC 1/2] drm/ttm: Allow drivers to specify maximum beneficial TTM
 pool size
Date: Fri, 19 Sep 2025 14:11:26 +0100
Message-ID: <20250919131127.90932-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
References: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
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

GPUs typically benefit from contiguous memory via reduced TLB pressure and
improved caching performance, where the maximum size of contiguous block
which adds a performance benefit is related to hardware design.

TTM pool allocator by default tries (hard) to allocate up to the system
MAX_PAGE_ORDER blocks. This varies by the CPU platform and can also be
configured via Kconfig.

If that limit was set to be higher than the GPU can make an extra use of,
lets allow the individual drivers to let TTM know over which allocation
order can the pool allocator afford to make a little bit less effort with.

We implement this by disabling direct reclaim for those allocations, which
reduces the allocation latency and lowers the demands on the page
allocator, in cases where expending this effort is not critical for the
GPU in question.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++--
 include/drm/ttm/ttm_pool.h     | 10 ++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c5eb2e28ca9d..3bf7b6bd96a3 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -726,8 +726,16 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 
 	page_caching = tt->caching;
 	allow_pools = true;
-	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
-	     alloc->remaining_pages;
+
+	order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
+	/*
+	 * Do not add latency to the allocation path for allocations orders
+	 * device tolds us do not bring additional performance gains.
+	 */
+	if (order > pool->max_beneficial_order)
+		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
+
+	for (; alloc->remaining_pages;
 	     order = ttm_pool_alloc_find_order(order, alloc)) {
 		struct ttm_pool_type *pt;
 
@@ -745,6 +753,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		if (!p) {
 			page_caching = ttm_cached;
 			allow_pools = false;
+			if (order <= pool->max_beneficial_order)
+				gfp_flags |= __GFP_DIRECT_RECLAIM;
 			p = ttm_pool_alloc_page(pool, gfp_flags, order);
 		}
 		/* If that fails, lower the order if possible and retry. */
@@ -1076,6 +1086,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 	pool->nid = nid;
 	pool->use_dma_alloc = use_dma_alloc;
 	pool->use_dma32 = use_dma32;
+	pool->max_beneficial_order = MAX_PAGE_ORDER;
 
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 54cd34a6e4c0..24d3285c9aad 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -66,6 +66,7 @@ struct ttm_pool_type {
  * @nid: which numa node to use
  * @use_dma_alloc: if coherent DMA allocations should be used
  * @use_dma32: if GFP_DMA32 should be used
+ * @max_beneficial_order: allocations above this order do not bring performance gains
  * @caching: pools for each caching/order
  */
 struct ttm_pool {
@@ -74,6 +75,7 @@ struct ttm_pool {
 
 	bool use_dma_alloc;
 	bool use_dma32;
+	unsigned int max_beneficial_order;
 
 	struct {
 		struct ttm_pool_type orders[NR_PAGE_ORDERS];
@@ -88,6 +90,14 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 		   int nid, bool use_dma_alloc, bool use_dma32);
 void ttm_pool_fini(struct ttm_pool *pool);
 
+static inline unsigned int
+ttm_pool_set_max_beneficial_order(struct ttm_pool *pool, unsigned int order)
+{
+	pool->max_beneficial_order = min(MAX_PAGE_ORDER, order);
+
+	return pool->max_beneficial_order;
+}
+
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
 
 void ttm_pool_drop_backed_up(struct ttm_tt *tt);
-- 
2.48.0

