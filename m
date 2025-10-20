Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE2BF0F16
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6FB10E42F;
	Mon, 20 Oct 2025 11:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CXQvq7Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA8410E422;
 Mon, 20 Oct 2025 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LCScJ7YskQdivu8ESfrU4Lj9n/GxIHeD0oPV0KbWOUc=; b=CXQvq7Pn0mhOBqQfTSUHguBI5J
 R9Wqv1pvcSBiJGulKfnAji0VgdE8MQGAmGK0fu6ZMqH9zaNbQ9ZBxccO+kGHvvK+LVQOiPOM1s7BH
 apKQCNj+b61LGgjaNEmCc0OsLfidXE6ZFH8dVAMnAmoRF8Qve5vPvEh8k5lWBi7PIcR6LwQNKJMhR
 7NxadWswLH1ss2+MUv799+B3akC/VVJut7FjPQ/YCjLDS8un99DiHDrdWiFoj55z8wF4S9JnUHP20
 VaXlneDqhb5rX+r/BtnvY18J6uU0viXFurTIFid44ZE6LWYJX8k2RCGELWkaydsh2IFskcu0Bccsy
 4IBDAidA==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAoSt-00C5b3-NZ; Mon, 20 Oct 2025 13:54:15 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 2/6] drm/ttm: Replace multiple booleans with flags in pool
 init
Date: Mon, 20 Oct 2025 12:54:07 +0100
Message-ID: <20251020115411.36818-3-tvrtko.ursulin@igalia.com>
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

Multiple consecutive boolean function arguments are usually not very
readable.

Replace the ones in ttm_pool_init() with flags with the additional
benefit of soon being able to pass in more data with just this one
code base churning cost.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> # v1
---
v2:
 * Rebase for rename and move of flags to alloc_flags / TTM_ALLOCATION_.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c | 25 +++++++++------------
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c   | 24 +++++++++-----------
 drivers/gpu/drm/ttm/ttm_device.c            |  5 ++++-
 drivers/gpu/drm/ttm/ttm_pool.c              |  8 +++----
 drivers/gpu/drm/ttm/ttm_pool_internal.h     |  5 +++--
 include/drm/ttm/ttm_allocation.h            | 10 +++++++++
 include/drm/ttm/ttm_pool.h                  |  8 +++----
 8 files changed, 45 insertions(+), 42 deletions(-)
 create mode 100644 include/drm/ttm/ttm_allocation.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index aa9ee5dffa45..8f6d331e1ea2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
 			      adev->gmc.mem_partitions[i].numa.node,
-			      false, false);
+			      0);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 1621903818e5..98648d5f20e7 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -7,11 +7,11 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include "ttm_kunit_helpers.h"
+#include "../ttm_pool_internal.h"
 
 struct ttm_device_test_case {
 	const char *description;
-	bool use_dma_alloc;
-	bool use_dma32;
+	unsigned int alloc_flags;
 	bool pools_init_expected;
 };
 
@@ -119,26 +119,22 @@ static void ttm_device_init_no_vma_man(struct kunit *test)
 static const struct ttm_device_test_case ttm_device_cases[] = {
 	{
 		.description = "No DMA allocations, no DMA32 required",
-		.use_dma_alloc = false,
-		.use_dma32 = false,
 		.pools_init_expected = false,
 	},
 	{
 		.description = "DMA allocations, DMA32 required",
-		.use_dma_alloc = true,
-		.use_dma32 = true,
+		.alloc_flags = TTM_ALLOCATION_POOL_USE_DMA_ALLOC |
+			       TTM_ALLOCATION_POOL_USE_DMA32,
 		.pools_init_expected = true,
 	},
 	{
 		.description = "No DMA allocations, DMA32 required",
-		.use_dma_alloc = false,
-		.use_dma32 = true,
+		.alloc_flags = TTM_ALLOCATION_POOL_USE_DMA32,
 		.pools_init_expected = false,
 	},
 	{
 		.description = "DMA allocations, no DMA32 required",
-		.use_dma_alloc = true,
-		.use_dma32 = false,
+		.alloc_flags = TTM_ALLOCATION_POOL_USE_DMA_ALLOC,
 		.pools_init_expected = true,
 	},
 };
@@ -163,15 +159,14 @@ static void ttm_device_init_pools(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
 	err = ttm_device_kunit_init(priv, ttm_dev,
-				    params->use_dma_alloc,
-				    params->use_dma32);
+				    params->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA_ALLOC,
+				    params->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA32);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	pool = &ttm_dev->pool;
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 	KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
-	KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
-	KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
+	KUNIT_EXPECT_EQ(test, pool->alloc_flags, params->alloc_flags);
 
 	if (params->pools_init_expected) {
 		for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
@@ -181,7 +176,7 @@ static void ttm_device_init_pools(struct kunit *test)
 				KUNIT_EXPECT_EQ(test, pt.caching, i);
 				KUNIT_EXPECT_EQ(test, pt.order, j);
 
-				if (params->use_dma_alloc)
+				if (ttm_pool_uses_dma_alloc(pool))
 					KUNIT_ASSERT_FALSE(test,
 							   list_empty(&pt.pages));
 			}
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 17ebb9fbd688..11c92bd75779 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -13,7 +13,7 @@
 struct ttm_pool_test_case {
 	const char *description;
 	unsigned int order;
-	bool use_dma_alloc;
+	unsigned int alloc_flags;
 };
 
 struct ttm_pool_test_priv {
@@ -87,7 +87,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DMA_ALLOC);
 
 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -114,12 +114,12 @@ static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
 	{
 		.description = "One page, with coherent DMA mappings enabled",
 		.order = 0,
-		.use_dma_alloc = true,
+		.alloc_flags = TTM_ALLOCATION_POOL_USE_DMA_ALLOC,
 	},
 	{
 		.description = "Above the allocation limit, with coherent DMA mappings enabled",
 		.order = MAX_PAGE_ORDER + 1,
-		.use_dma_alloc = true,
+		.alloc_flags = TTM_ALLOCATION_POOL_USE_DMA_ALLOC,
 	},
 };
 
@@ -151,13 +151,11 @@ static void ttm_pool_alloc_basic(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->use_dma_alloc,
-		      false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->alloc_flags);
 
 	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
 	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
-	KUNIT_ASSERT_EQ(test, ttm_pool_uses_dma_alloc(pool),
-			params->use_dma_alloc);
+	KUNIT_ASSERT_EQ(test, pool->alloc_flags, params->alloc_flags);
 
 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -167,14 +165,14 @@ static void ttm_pool_alloc_basic(struct kunit *test)
 	last_page = tt->pages[tt->num_pages - 1];
 
 	if (params->order <= MAX_PAGE_ORDER) {
-		if (params->use_dma_alloc) {
+		if (ttm_pool_uses_dma_alloc(pool)) {
 			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
 			KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
 		} else {
 			KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
 		}
 	} else {
-		if (params->use_dma_alloc) {
+		if (ttm_pool_uses_dma_alloc(pool)) {
 			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
 			KUNIT_ASSERT_NULL(test, (void *)last_page->private);
 		} else {
@@ -220,7 +218,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DMA_ALLOC);
 
 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -350,7 +348,7 @@ static void ttm_pool_free_dma_alloc(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, TTM_ALLOCATION_POOL_USE_DMA_ALLOC);
 	ttm_pool_alloc(pool, tt, &simple_ctx);
 
 	pt = &pool->caching[caching].orders[order];
@@ -381,7 +379,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, 0);
 	ttm_pool_alloc(pool, tt, &simple_ctx);
 
 	pt = &pool->caching[caching].orders[order];
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c3e2fcbdd2cc..a97b1444536c 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -31,6 +31,7 @@
 #include <linux/export.h>
 #include <linux/mm.h>
 
+#include <drm/ttm/ttm_allocation.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_tt.h>
@@ -236,7 +237,9 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	else
 		nid = NUMA_NO_NODE;
 
-	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, dev, nid,
+		      (use_dma_alloc ? TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0) |
+		      (use_dma32 ? TTM_ALLOCATION_POOL_USE_DMA32 : 0));
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index ff6fab4122bb..4fc69447060c 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1059,13 +1059,12 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
  * @nid: NUMA node to use for allocations
- * @use_dma_alloc: true if coherent DMA alloc should be used
- * @use_dma32: true if GFP_DMA32 should be used
+ * @alloc_flags: TTM_ALLOCATION_POOL_ flags
  *
  * Initialize the pool and its pool types.
  */
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   int nid, bool use_dma_alloc, bool use_dma32)
+		   int nid, unsigned int alloc_flags)
 {
 	unsigned int i, j;
 
@@ -1073,8 +1072,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 
 	pool->dev = dev;
 	pool->nid = nid;
-	pool->use_dma_alloc = use_dma_alloc;
-	pool->use_dma32 = use_dma32;
+	pool->alloc_flags = alloc_flags;
 
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
diff --git a/drivers/gpu/drm/ttm/ttm_pool_internal.h b/drivers/gpu/drm/ttm/ttm_pool_internal.h
index 3e50d30bd95a..96b7f21514fb 100644
--- a/drivers/gpu/drm/ttm/ttm_pool_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_pool_internal.h
@@ -4,16 +4,17 @@
 #ifndef _TTM_POOL_INTERNAL_H_
 #define _TTM_POOL_INTERNAL_H_
 
+#include <drm/ttm/ttm_allocation.h>
 #include <drm/ttm/ttm_pool.h>
 
 static inline bool ttm_pool_uses_dma_alloc(struct ttm_pool *pool)
 {
-	return pool->use_dma_alloc;
+	return pool->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA_ALLOC;
 }
 
 static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
 {
-	return pool->use_dma32;
+	return pool->alloc_flags & TTM_ALLOCATION_POOL_USE_DMA32;
 }
 
 #endif
diff --git a/include/drm/ttm/ttm_allocation.h b/include/drm/ttm/ttm_allocation.h
new file mode 100644
index 000000000000..7869dc32bd91
--- /dev/null
+++ b/include/drm/ttm/ttm_allocation.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2025 Valve Corporation */
+
+#ifndef _TTM_ALLOCATION_H_
+#define _TTM_ALLOCATION_H_
+
+#define TTM_ALLOCATION_POOL_USE_DMA_ALLOC	BIT(0) /* Use coherent DMA allocations. */
+#define TTM_ALLOCATION_POOL_USE_DMA32		BIT(1) /* Use GFP_DMA32 allocations. */
+
+#endif
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 54cd34a6e4c0..67c72de913bb 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -64,16 +64,14 @@ struct ttm_pool_type {
  *
  * @dev: the device we allocate pages for
  * @nid: which numa node to use
- * @use_dma_alloc: if coherent DMA allocations should be used
- * @use_dma32: if GFP_DMA32 should be used
+ * @alloc_flags: TTM_ALLOCATION_POOL_ flags
  * @caching: pools for each caching/order
  */
 struct ttm_pool {
 	struct device *dev;
 	int nid;
 
-	bool use_dma_alloc;
-	bool use_dma32;
+	unsigned int alloc_flags;
 
 	struct {
 		struct ttm_pool_type orders[NR_PAGE_ORDERS];
@@ -85,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
 
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   int nid, bool use_dma_alloc, bool use_dma32);
+		   int nid, unsigned int alloc_flags);
 void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
-- 
2.48.0

