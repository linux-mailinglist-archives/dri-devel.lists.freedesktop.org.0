Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC10BC4A1A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3110E7D5;
	Wed,  8 Oct 2025 11:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kE/de/j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A23310E30D;
 Wed,  8 Oct 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i1zQ5PbrQLNW76gAPVfo8zaL7fjqCX5RyB9xKuHVqWE=; b=kE/de/j3xQJ6L+KgWMSlN8KZDF
 Y1cTxOCED1vqwQawpiuhlzGz1ucIdR9Q8CwJ+QUJ7tNzhWLHCu7gNwvFeYXuFQnFFrgPzRLuC4qYi
 UtTPLZeBhzR6Np6jqVTUGlrhPqBwIrkXh4Rstzjemlo9VQvXlt1gRuCkA2s/5PG8vUG7r1riFB7t+
 k696AYz9CdWx5H6L8715INNcce93d3br/Kn1oDdoWESoHNP0UmbL/RgLQ5E4M4zLKtCMCpupNXmP2
 DkfGiG7XuFBLEreGNu3kcayKn56eiNGpVII2eHJORcQSzlFy4rPVEHDfDBNaRoDMT+tWjYiaEkXkl
 VjACN8yw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v6SjN-006cgM-Ni; Wed, 08 Oct 2025 13:53:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 1/5] drm/ttm: Add getter for some pool properties
Date: Wed,  8 Oct 2025 12:53:10 +0100
Message-ID: <20251008115314.55438-2-tvrtko.ursulin@igalia.com>
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

No functional change but to allow easier refactoring in the future.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c          | 29 +++++++++++++------------
 drivers/gpu/drm/ttm/ttm_pool_internal.h | 19 ++++++++++++++++
 drivers/gpu/drm/ttm/ttm_tt.c            | 10 +++++----
 3 files changed, 40 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index baf27c70a419..ff6fab4122bb 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -48,6 +48,7 @@
 #include <drm/ttm/ttm_bo.h>
 
 #include "ttm_module.h"
+#include "ttm_pool_internal.h"
 
 #ifdef CONFIG_FAULT_INJECTION
 #include <linux/fault-inject.h>
@@ -148,7 +149,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
 			__GFP_THISNODE;
 
-	if (!pool->use_dma_alloc) {
+	if (!ttm_pool_uses_dma_alloc(pool)) {
 		p = alloc_pages_node(pool->nid, gfp_flags, order);
 		if (p)
 			p->private = order;
@@ -200,7 +201,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 		set_pages_wb(p, 1 << order);
 #endif
 
-	if (!pool || !pool->use_dma_alloc) {
+	if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
 		__free_pages(p, order);
 		return;
 	}
@@ -243,7 +244,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
 {
 	dma_addr_t addr;
 
-	if (pool->use_dma_alloc) {
+	if (ttm_pool_uses_dma_alloc(pool)) {
 		struct ttm_pool_dma *dma = (void *)p->private;
 
 		addr = dma->addr;
@@ -265,7 +266,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 			   unsigned int num_pages)
 {
 	/* Unmapped while freeing the page */
-	if (pool->use_dma_alloc)
+	if (ttm_pool_uses_dma_alloc(pool))
 		return;
 
 	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
@@ -339,7 +340,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 						  enum ttm_caching caching,
 						  unsigned int order)
 {
-	if (pool->use_dma_alloc)
+	if (ttm_pool_uses_dma_alloc(pool))
 		return &pool->caching[caching].orders[order];
 
 #ifdef CONFIG_X86
@@ -348,7 +349,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 		if (pool->nid != NUMA_NO_NODE)
 			return &pool->caching[caching].orders[order];
 
-		if (pool->use_dma32)
+		if (ttm_pool_uses_dma32(pool))
 			return &global_dma32_write_combined[order];
 
 		return &global_write_combined[order];
@@ -356,7 +357,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 		if (pool->nid != NUMA_NO_NODE)
 			return &pool->caching[caching].orders[order];
 
-		if (pool->use_dma32)
+		if (ttm_pool_uses_dma32(pool))
 			return &global_dma32_uncached[order];
 
 		return &global_uncached[order];
@@ -396,7 +397,7 @@ static unsigned int ttm_pool_shrink(void)
 /* Return the allocation order based for a page */
 static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 {
-	if (pool->use_dma_alloc) {
+	if (ttm_pool_uses_dma_alloc(pool)) {
 		struct ttm_pool_dma *dma = (void *)p->private;
 
 		return dma->vaddr & ~PAGE_MASK;
@@ -719,7 +720,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	if (ctx->gfp_retry_mayfail)
 		gfp_flags |= __GFP_RETRY_MAYFAIL;
 
-	if (pool->use_dma32)
+	if (ttm_pool_uses_dma32(pool))
 		gfp_flags |= GFP_DMA32;
 	else
 		gfp_flags |= GFP_HIGHUSER;
@@ -977,7 +978,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 		return -EINVAL;
 
 	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
-	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
+	    ttm_pool_uses_dma_alloc(pool) || ttm_tt_is_backed_up(tt))
 		return -EBUSY;
 
 #ifdef CONFIG_X86
@@ -1014,7 +1015,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 	if (flags->purge)
 		return shrunken;
 
-	if (pool->use_dma32)
+	if (ttm_pool_uses_dma32(pool))
 		gfp = GFP_DMA32;
 	else
 		gfp = GFP_HIGHUSER;
@@ -1068,7 +1069,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 {
 	unsigned int i, j;
 
-	WARN_ON(!dev && use_dma_alloc);
+	WARN_ON(!dev && ttm_pool_uses_dma_alloc(pool));
 
 	pool->dev = dev;
 	pool->nid = nid;
@@ -1239,7 +1240,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 {
 	unsigned int i;
 
-	if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {
+	if (!ttm_pool_uses_dma_alloc(pool) && pool->nid == NUMA_NO_NODE) {
 		seq_puts(m, "unused\n");
 		return 0;
 	}
@@ -1250,7 +1251,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		if (!ttm_pool_select_type(pool, i, 0))
 			continue;
-		if (pool->use_dma_alloc)
+		if (ttm_pool_uses_dma_alloc(pool))
 			seq_puts(m, "DMA ");
 		else
 			seq_printf(m, "N%d ", pool->nid);
diff --git a/drivers/gpu/drm/ttm/ttm_pool_internal.h b/drivers/gpu/drm/ttm/ttm_pool_internal.h
new file mode 100644
index 000000000000..3e50d30bd95a
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2025 Valve Corporation */
+
+#ifndef _TTM_POOL_INTERNAL_H_
+#define _TTM_POOL_INTERNAL_H_
+
+#include <drm/ttm/ttm_pool.h>
+
+static inline bool ttm_pool_uses_dma_alloc(struct ttm_pool *pool)
+{
+	return pool->use_dma_alloc;
+}
+
+static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
+{
+	return pool->use_dma32;
+}
+
+#endif
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8..ced0875d0722 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -46,6 +46,7 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include "ttm_module.h"
+#include "ttm_pool_internal.h"
 
 static unsigned long ttm_pages_limit;
 
@@ -93,7 +94,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 	 * mapped TT pages need to be decrypted or otherwise the drivers
 	 * will end up sending encrypted mem to the gpu.
 	 */
-	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+	if (ttm_pool_uses_dma_alloc(&bdev->pool) &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		page_flags |= TTM_TT_FLAG_DECRYPTED;
 		drm_info_once(ddev, "TT memory decryption enabled.");
 	}
@@ -378,7 +380,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 
 	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
 		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
+		if (ttm_pool_uses_dma32(&bdev->pool))
 			atomic_long_add(ttm->num_pages,
 					&ttm_dma32_pages_allocated);
 	}
@@ -416,7 +418,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 error:
 	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
+		if (ttm_pool_uses_dma32(&bdev->pool))
 			atomic_long_sub(ttm->num_pages,
 					&ttm_dma32_pages_allocated);
 	}
@@ -439,7 +441,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 
 	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
+		if (ttm_pool_uses_dma32(&bdev->pool))
 			atomic_long_sub(ttm->num_pages,
 					&ttm_dma32_pages_allocated);
 	}
-- 
2.48.0

