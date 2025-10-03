Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA89BB7177
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9730B10E90F;
	Fri,  3 Oct 2025 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m7GB0Lf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B057810E90B;
 Fri,  3 Oct 2025 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jFBXXJWJFEyAurU9SUO0gLP0l/LENYpJuwG1bqeyeaE=; b=m7GB0Lf4CbdgiGaqzM0cw754hf
 K3XfEpuBV4kAzCHq443GXztbc0fkYddG32ZLn72Ke/GCjMOdDt88Fw502bYCR0WMOjXNtlkjaeqSA
 oTmxti+9kKKRWqaQOTU1wTDLLYlEcm8vU90a+aZhK9v/mPKFGQQqHir1HozqET/G42fcfxRu2nDko
 l2aDv3Q2i8sPfh7MKvok2FgkbV7BmhhhWctAFrO7zHpyGee32hotNWO/KRx6TgD6q0YluDJGv7dCc
 zZxVYtuzbWK5HAr8DHQT9G09DGM+xvnSdlf7RBfzvxAr+5oGD6zYLdjwpW0lve025bsGcjlz1sKF/
 +mxwSK2g==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v4gJ0-003uma-Tz; Fri, 03 Oct 2025 15:58:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [RFC v2 4/5] drm/ttm: Allow drivers to specify maximum beneficial TTM
 pool size
Date: Fri,  3 Oct 2025 14:58:35 +0100
Message-ID: <20251003135836.41116-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/ttm/ttm_pool.c |  8 ++++++++
 include/drm/ttm/ttm_pool.h     | 10 ++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 0323531d216a..c0bd92259394 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -135,6 +135,7 @@ static DECLARE_RWSEM(pool_shrink_rwsem);
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
 {
+	const unsigned int beneficial_order = ttm_pool_beneficial_order(pool);
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
 	struct page *p;
@@ -148,6 +149,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
 			__GFP_THISNODE;
 
+	/*
+	 * Do not add latency to the allocation path for allocations orders
+	 * device tolds us do not bring them additional performance gains.
+	 */
+	if (beneficial_order && order > beneficial_order)
+		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
+
 	if (!ttm_pool_uses_dma_alloc(pool)) {
 		p = alloc_pages_node(pool->nid, gfp_flags, order);
 		if (p)
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index d898186765f1..b2114e2d0695 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -59,8 +59,9 @@ struct ttm_pool_type {
 	struct list_head pages;
 };
 
-#define TTM_POOL_USE_DMA_ALLOC 	BIT(0) /* Use coherent DMA allocations. */
-#define TTM_POOL_USE_DMA32	BIT(1) /* Use GFP_DMA32 allocations. */
+#define TTM_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */
+#define TTM_POOL_USE_DMA_ALLOC 		BIT(8) /* Use coherent DMA allocations. */
+#define TTM_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
 
 /**
  * struct ttm_pool - Pool for all caching and orders
@@ -111,4 +112,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
 	return pool->flags & TTM_POOL_USE_DMA32;
 }
 
+static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
+{
+	return pool->flags & 0xff;
+}
+
 #endif
-- 
2.48.0

