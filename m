Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B1BC4A1D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E395D10E7D6;
	Wed,  8 Oct 2025 11:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FhZAv85/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6E810E32E;
 Wed,  8 Oct 2025 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YEwdV+LsWsRk8UCq8JNPBA58uzyMqHx3JTNiudH30Cs=; b=FhZAv85/0B3wqLzPmnhhCDwugZ
 zgqdqTJwNYHeRVvOgw1yaLYaEhg9EoAbSvWJsxEm9+zo9iCz+uBynAL9f5FpJJHU1ejr/ZnyrfaRM
 slM95p9l6eKX0cqX4AhRE0J/Kc32xyj5d+kV4paKV3se7mW3tgRKZ7ElAoWAuqwm8L0wtsRcOkunB
 GkrtAc9igb0UHevU5cr9f1Fbl8Xrpi/PGeMVmZmd3ZYaPZ6bfStBKE+sqdO2voKl+6+TEHkUfkYza
 KXu+d1HHJ3lqak5mvMhjpQycKDDxafPPHjS+gzXYV6ZMrYusPEa6DKHXb4c+8BLEseEens9L3rLh+
 f2tQlTrA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v6SjQ-006cgX-0K; Wed, 08 Oct 2025 13:53:20 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH v3 4/5] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
Date: Wed,  8 Oct 2025 12:53:13 +0100
Message-ID: <20251008115314.55438-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/ttm/ttm_pool.c          | 8 ++++++++
 drivers/gpu/drm/ttm/ttm_pool_internal.h | 5 +++++
 include/drm/ttm/ttm_pool.h              | 6 ++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 5d007d1a15f2..183e39d0d505 100644
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
index 91aa156ddded..638497fcc8a8 100644
--- a/drivers/gpu/drm/ttm/ttm_pool_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
@@ -16,4 +16,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
 	return pool->flags & TTM_POOL_USE_DMA32;
 }
 
+static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
+{
+	return pool->flags & 0xff;
+}
+
 #endif
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 70db2e5c950f..60753b051c65 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -59,8 +59,10 @@ struct ttm_pool_type {
 	struct list_head pages;
 };
 
-#define TTM_POOL_USE_DMA_ALLOC 	BIT(0) /* Use coherent DMA allocations. */
-#define TTM_POOL_USE_DMA32	BIT(1) /* Use GFP_DMA32 allocations. */
+/* Check helpers in ttm_pool_internal.h when modifying: */
+#define TTM_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff) /* Max order which caller can benefit from */
+#define TTM_POOL_USE_DMA_ALLOC 		BIT(8) /* Use coherent DMA allocations. */
+#define TTM_POOL_USE_DMA32		BIT(9) /* Use GFP_DMA32 allocations. */
 
 /**
  * struct ttm_pool - Pool for all caching and orders
-- 
2.48.0

