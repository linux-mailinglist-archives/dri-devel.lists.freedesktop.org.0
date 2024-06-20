Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF4910736
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74B10EA1F;
	Thu, 20 Jun 2024 14:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIwVcoAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD9C10EA1F;
 Thu, 20 Jun 2024 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718892145; x=1750428145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4Du+bPDpK1XJ78qi779Kj6HDOl9ncNFBtXBZcnQVL0=;
 b=WIwVcoACm4d9o3ABYHlbbtPImEwpo+yRE4xLv29WImgAC1OOpjwkHhoV
 0kpWzlUVbc56fhNii+wbLSnGKFmlmJbXtvRgpqP3PdZ1k6F7plWVwhZCo
 4MIORgH7t+KfLT2nxMsRGxFGc96AsmRCnPrQkdy8uNX4XNnaUpcsmvD0l
 q2rtgt41SAXSSkAn5Gdn9dMsiWMMqjfAuaLTLmerpagfb45z+LeYQ5sUY
 m5Au2nsMFeILP4VjK24j3QssUcml29+ExtPA490MmhivMKEqCLYW8N5CP
 h/NACsi8bbaovXUZ8VUcDxqKGdUwdh+m0tx+ko+fItf/9nXkkruV+hydj w==;
X-CSE-ConnectionGUID: HLZ5CvTwQuqHW2QiqAiIog==
X-CSE-MsgGUID: kjW0CLwORGyphl3dX0Q9zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="16010282"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="16010282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:02:03 -0700
X-CSE-ConnectionGUID: CVOSJa1HRwibdHDPdjpORw==
X-CSE-MsgGUID: 26MWBe8FTSe469Y6qcnq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42147656"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:02:01 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC PATCH 1/2] drm/ttm/pool: Introduce a way to skip clear on free
Date: Thu, 20 Jun 2024 15:46:51 +0200
Message-ID: <20240620134656.14380-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240620134656.14380-1-nirmoy.das@intel.com>
References: <20240620134656.14380-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Clearing pages can be very slow when using CPU but GPUs can perform this
task much faster. With this new pool API driver can decide if it wants to
clear pages using GPU. This provides the flexibility to choose the desired
clear policy, either during allocation or upon freeing, as per the driver's
preference.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 42 +++++++++++++++++++++++----
 drivers/gpu/drm/ttm/ttm_pool.c   | 49 +++++++++++++++++++++++++-------
 include/drm/ttm/ttm_device.h     |  8 ++++++
 include/drm/ttm/ttm_pool.h       | 11 +++++++
 4 files changed, 94 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 434cf0258000..54a3ea825c2e 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -191,15 +191,19 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * @vma_manager: A pointer to a vma manager.
  * @use_dma_alloc: If coherent DMA allocation API should be used.
  * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
+ * @pool_flags: Desired pool flags
  *
  * Initializes a struct ttm_device:
  * Returns:
  * !0: Failure.
  */
-int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
-		    struct device *dev, struct address_space *mapping,
-		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32)
+int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
+				    const struct ttm_device_funcs *funcs,
+				    struct device *dev,
+				    struct address_space *mapping,
+				    struct drm_vma_offset_manager *vma_manager,
+				    bool use_dma_alloc, bool use_dma32,
+				    unsigned int pool_flags)
 {
 	struct ttm_global *glob = &ttm_glob;
 	int ret, nid;
@@ -227,7 +231,8 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	else
 		nid = NUMA_NO_NODE;
 
-	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
+	ttm_pool_init_with_flags(&bdev->pool, dev, nid, use_dma_alloc,
+				 use_dma32, pool_flags);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
@@ -239,6 +244,33 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 
 	return 0;
 }
+EXPORT_SYMBOL(ttm_device_init_with_pool_flags);
+
+
+/**
+ * ttm_device_init
+ *
+ * @bdev: A pointer to a struct ttm_device to initialize.
+ * @funcs: Function table for the device.
+ * @dev: The core kernel device pointer for DMA mappings and allocations.
+ * @mapping: The address space to use for this bo.
+ * @vma_manager: A pointer to a vma manager.
+ * @use_dma_alloc: If coherent DMA allocation API should be used.
+ * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
+ *
+ * Initializes a struct ttm_device:
+ * Returns:
+ * !0: Failure.
+ */
+int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
+		    struct device *dev, struct address_space *mapping,
+		    struct drm_vma_offset_manager *vma_manager,
+		    bool use_dma_alloc, bool use_dma32)
+{
+	return ttm_device_init_with_pool_flags(bdev, funcs, dev, mapping,
+					       vma_manager, use_dma_alloc,
+					       use_dma32, 0);
+}
 EXPORT_SYMBOL(ttm_device_init);
 
 void ttm_device_fini(struct ttm_device *bdev)
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 6e1fd6985ffc..6f33c3e7cdf2 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -222,15 +222,17 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 }
 
 /* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
+static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p, bool skip_clear)
 {
 	unsigned int i, num_pages = 1 << pt->order;
 
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
+	if (!skip_clear) {
+		for (i = 0; i < num_pages; ++i) {
+			if (PageHighMem(p))
+				clear_highpage(p + i);
+			else
+				clear_page(page_address(p + i));
+		}
 	}
 
 	spin_lock(&pt->lock);
@@ -396,7 +398,10 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 	struct page **pages = &tt->pages[start_page];
 	unsigned int order;
 	pgoff_t i, nr;
+	bool skip_clear = false;
 
+	if (pool->flags & TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE)
+		skip_clear = true;
 	for (i = start_page; i < end_page; i += nr, pages += nr) {
 		struct ttm_pool_type *pt = NULL;
 
@@ -407,7 +412,7 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 
 		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, *pages, skip_clear);
 		else
 			ttm_pool_free_page(pool, caching, order, *pages);
 	}
@@ -550,18 +555,21 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 EXPORT_SYMBOL(ttm_pool_free);
 
 /**
- * ttm_pool_init - Initialize a pool
+ * ttm_pool_init_with_flags - Initialize a pool with flags
  *
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
  * @nid: NUMA node to use for allocations
  * @use_dma_alloc: true if coherent DMA alloc should be used
  * @use_dma32: true if GFP_DMA32 should be used
+ * @flags: control flags for the pool
+ *
+ * Initialize the pool and its pool types with flags to modify defaults
  *
- * Initialize the pool and its pool types.
  */
-void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   int nid, bool use_dma_alloc, bool use_dma32)
+void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device *dev,
+		   int nid, bool use_dma_alloc, bool use_dma32,
+		   unsigned int flags)
 {
 	unsigned int i, j;
 
@@ -571,6 +579,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 	pool->nid = nid;
 	pool->use_dma_alloc = use_dma_alloc;
 	pool->use_dma32 = use_dma32;
+	pool->flags = flags;
 
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
@@ -585,6 +594,24 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 		}
 	}
 }
+EXPORT_SYMBOL(ttm_pool_init_with_flags);
+
+/**
+ * ttm_pool_init - Initialize a pool
+ *
+ * @pool: the pool to initialize
+ * @dev: device for DMA allocations and mappings
+ * @nid: NUMA node to use for allocations
+ * @use_dma_alloc: true if coherent DMA alloc should be used
+ * @use_dma32: true if GFP_DMA32 should be used
+ *
+ * Initialize the pool and its pool types.
+ */
+void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
+		   int nid, bool use_dma_alloc, bool use_dma32)
+{
+	ttm_pool_init_with_flags(pool, dev, nid, use_dma_alloc, use_dma32, 0);
+}
 EXPORT_SYMBOL(ttm_pool_init);
 
 /**
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..1b20c5798e97 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -291,6 +291,14 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32);
+int ttm_device_init_with_pool_flags(struct ttm_device *bdev,
+				    const struct ttm_device_funcs *funcs,
+				    struct device *dev,
+				    struct address_space *mapping,
+				    struct drm_vma_offset_manager *vma_manager,
+				    bool use_dma_alloc, bool use_dma32,
+				    unsigned int pool_flags);
+
 void ttm_device_fini(struct ttm_device *bdev);
 void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
 
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 160d954a261e..9822996309e5 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -66,10 +66,17 @@ struct ttm_pool_type {
  * @use_dma_alloc: if coherent DMA allocations should be used
  * @use_dma32: if GFP_DMA32 should be used
  * @caching: pools for each caching/order
+ * @flags: flags to control certain pool behaviour
+ *
+ * The @flags can be:
+ *  - %TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE - This flag can be used to
+ *    skip clear on free when driver decides to do that on it's own.
  */
 struct ttm_pool {
 	struct device *dev;
 	int nid;
+#define TTM_POOL_FLAG_SKIP_CLEAR_ON_FREE	1 << 0
+	unsigned int flags;
 
 	bool use_dma_alloc;
 	bool use_dma32;
@@ -85,6 +92,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
 
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 		   int nid, bool use_dma_alloc, bool use_dma32);
+void ttm_pool_init_with_flags(struct ttm_pool *pool, struct device *dev,
+			      int nid, bool use_dma_alloc, bool use_dma32,
+			      unsigned int flags);
+
 void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
-- 
2.42.0

