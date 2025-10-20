Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B39EBF0EFB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF18F10E425;
	Mon, 20 Oct 2025 11:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HPNl37JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9F10E423;
 Mon, 20 Oct 2025 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I81oU4WaGTtRXW08pQgsWyO70vhgLjWNDQFF1YHWs+8=; b=HPNl37JRQvZ3MZfYH96UTwgR2s
 9SdUJeTDhE9PvUAUYjjgCQBOz7ZC7KwRn7S2kdS6Vvs8Bnkks/UT4n/Ffn/9NE6w37cfK7/qO/kXg
 il2E0WfLN/cZSICXfWI21UBUoQXwC34IjsAHqfUJTCIjU/xW04tNTsp1E9b3u7YUzTrbbzzQ1pNjC
 BCCKJbF8DbSU987gVVaQg1qjIAluI7E/YxnAatvYLLobJeRBtCt2RdLRDyBoDdLLgMiWyBZ00fd6n
 AVWSVXq3aBYG+fTbQXGks+ICbke46Fok0f6/JO/ZgMbqK+lw6MUreRmnxnXutcsztcMpEfOzNVnsQ
 BJ+3mbLw==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAoSv-00C5bC-8z; Mon, 20 Oct 2025 13:54:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v5 4/6] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
Date: Mon, 20 Oct 2025 12:54:09 +0100
Message-ID: <20251020115411.36818-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Christian König <christian.koenig@amd.com> # v1
---
v2:
 * Rebase for rename and move of flags to alloc_flags / TTM_ALLOCATION_.
---
 drivers/gpu/drm/ttm/ttm_pool.c          | 8 ++++++++
 drivers/gpu/drm/ttm/ttm_pool_internal.h | 5 +++++
 include/drm/ttm/ttm_allocation.h        | 5 +++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 4fc69447060c..97e9ce505cf6 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -136,6 +136,7 @@ static DECLARE_RWSEM(pool_shrink_rwsem);
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
 {
+	const unsigned int beneficial_order = ttm_pool_beneficial_order(pool);
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
 	struct page *p;
@@ -149,6 +150,13 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
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
diff --git a/drivers/gpu/drm/ttm/ttm_pool_internal.h b/drivers/gpu/drm/ttm/ttm_pool_internal.h
index 96b7f21514fb..82c4b7e56a99 100644
--- a/drivers/gpu/drm/ttm/ttm_pool_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
@@ -17,4 +17,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
 	return pool->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA32;
 }
 
+static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
+{
+	return pool->alloc_flags & 0xff;
+}
+
 #endif
diff --git a/include/drm/ttm/ttm_allocation.h b/include/drm/ttm/ttm_allocation.h
index 7869dc32bd91..8f8544760306 100644
--- a/include/drm/ttm/ttm_allocation.h
+++ b/include/drm/ttm/ttm_allocation.h
@@ -4,7 +4,8 @@
 #ifndef _TTM_ALLOCATION_H_
 #define _TTM_ALLOCATION_H_
 
-#define TTM_ALLOCATION_POOL_USE_DMA_ALLOC	BIT(0) /* Use coherent DMA allocations. */
-#define TTM_ALLOCATION_POOL_USE_DMA32		BIT(1) /* Use GFP_DMA32 allocations. */
+#define TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */
+#define TTM_ALLOCATION_POOL_USE_DMA_ALLOC 	BIT(8) /* Use coherent DMA allocations. */
+#define TTM_ALLOCATION_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
 
 #endif
-- 
2.48.0

