Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65E49CDEC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55A410E7B7;
	Wed, 26 Jan 2022 15:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280F210E7B7;
 Wed, 26 Jan 2022 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210530; x=1674746530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1taxKImwIfDASsN4bfPLnSaimRO2g1a8dXFKbApqwM=;
 b=j8CRQWyf+oB4j1lckgAIHjyaiKBdC9m01svtxoG2+ZA7psRzvlzv9wmN
 nmFL3dXPh0TJh8ob1MYJk1pNfUFXSa6k6JCwKJbXbtOPXmlH0FvKC5jCQ
 kYHVeqeK5Ca0P/GKLUi+vLa5RQZgug2pWs5PhvDls6dxLLQi5RQFHJRRl
 FU+XNe0l/HB6clw0vK80gY4/mMSZogFz3Vu8qYQ5R8WsEffzTqoqgXj2u
 xHs6BZozNecX6rVvJhqrvWzhcz9NBGCNiZP0QQ18BnBbgs5IiSt2Uf/F2
 Z3CzLpCsx8nA2qelpmZnpticbLJrnvA24bvyB3Otih3kHV2YnfU9Vprrg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885206"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885206"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386234"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/20] drm/i915: add io_size plumbing
Date: Wed, 26 Jan 2022 15:21:39 +0000
Message-Id: <20220126152155.3070602-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With small LMEM-BAR we need to be able to differentiate between the
total size of LMEM, and how much of it is CPU mappable. The end goal is
to be able to utilize the entire range, even if part of is it not CPU
accessible.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c            | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c           | 8 +++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c              | 2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c          | 6 +++++-
 drivers/gpu/drm/i915/intel_memory_region.c           | 6 +++++-
 drivers/gpu/drm/i915/intel_memory_region.h           | 2 ++
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 ++++----
 drivers/gpu/drm/i915/selftests/mock_region.c         | 6 ++++--
 drivers/gpu/drm/i915/selftests/mock_region.h         | 3 ++-
 10 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 6c57b0a79c8a..a9aca11cedbb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -696,7 +696,7 @@ struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private *i915,
 {
 	return intel_memory_region_create(i915, 0,
 					  totalram_pages() << PAGE_SHIFT,
-					  PAGE_SIZE, 0,
+					  PAGE_SIZE, 0, 0,
 					  type, instance,
 					  &shmem_region_ops);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 26975d857776..387b48686851 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -490,6 +490,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 
 	/* Exclude the reserved region from driver use */
 	mem->region.end = reserved_base - 1;
+	mem->io_size = resource_size(&mem->region);
 
 	/* It is possible for the reserved area to end before the end of stolen
 	 * memory, so just consider the start. */
@@ -746,7 +747,7 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
-				resource_size(&mem->region)))
+				mem->io_size))
 		return -EIO;
 
 	/*
@@ -801,7 +802,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 						I915_GTT_PAGE_SIZE_4K;
 
 	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
-					 min_page_size, io_start,
+					 min_page_size,
+					 io_start, lmem_size,
 					 type, instance,
 					 &i915_region_stolen_lmem_ops);
 	if (IS_ERR(mem))
@@ -832,7 +834,7 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	mem = intel_memory_region_create(i915,
 					 intel_graphics_stolen_res.start,
 					 resource_size(&intel_graphics_stolen_res),
-					 PAGE_SIZE, 0, type, instance,
+					 PAGE_SIZE, 0, 0, type, instance,
 					 &i915_region_stolen_smem_ops);
 	if (IS_ERR(mem))
 		return mem;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 84cae740b4a5..e1140ca3d9a0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1103,7 +1103,7 @@ i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 
 	mr = intel_memory_region_create(i915, 0,
 					totalram_pages() << PAGE_SHIFT,
-					PAGE_SIZE, 0,
+					PAGE_SIZE, 0, 0,
 					type, instance,
 					&ttm_system_region_ops);
 	if (IS_ERR(mr))
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index f36191ebf964..42db9cd30978 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -499,7 +499,7 @@ static int igt_mock_memory_region_huge_pages(void *arg)
 	int bit;
 	int err = 0;
 
-	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0);
+	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0, 0);
 	if (IS_ERR(mem)) {
 		pr_err("%s failed to create memory region\n", __func__);
 		return PTR_ERR(mem);
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 21215a080088..2c7ec7ff79fd 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -90,7 +90,7 @@ region_lmem_init(struct intel_memory_region *mem)
 
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
-				resource_size(&mem->region))) {
+				mem->io_size)) {
 		ret = -EIO;
 		goto out_no_io;
 	}
@@ -143,6 +143,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
 					 mappable_end,
 					 PAGE_SIZE,
 					 io_start,
+					 mappable_end,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
@@ -219,6 +220,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 					 lmem_size,
 					 min_page_size,
 					 io_start,
+					 lmem_size,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
@@ -232,6 +234,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	drm_dbg(&i915->drm, "Local memory: %pR\n", &mem->region);
 	drm_dbg(&i915->drm, "Local memory IO start: %pa\n",
 		&mem->io_start);
+	drm_info(&i915->drm, "Local memory IO size: %pa\n",
+		&mem->io_size);
 	drm_info(&i915->drm, "Local memory available: %pa\n",
 		 &lmem_size);
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index c70d7e286a51..595e2489c23e 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -97,7 +97,7 @@ static int iomemtest(struct intel_memory_region *mem,
 		     bool test_all,
 		     const void *caller)
 {
-	resource_size_t last = resource_size(&mem->region) - PAGE_SIZE;
+	resource_size_t last = mem->io_size - PAGE_SIZE;
 	resource_size_t page;
 	int err;
 
@@ -205,6 +205,8 @@ static int intel_memory_region_memtest(struct intel_memory_region *mem,
 	if (!mem->io_start)
 		return 0;
 
+	WARN_ON_ONCE(!mem->io_size);
+
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) || i915->params.memtest)
 		err = iomemtest(mem, i915->params.memtest, caller);
 
@@ -217,6 +219,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			   resource_size_t size,
 			   resource_size_t min_page_size,
 			   resource_size_t io_start,
+			   resource_size_t io_size,
 			   u16 type,
 			   u16 instance,
 			   const struct intel_memory_region_ops *ops)
@@ -231,6 +234,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
 	mem->i915 = i915;
 	mem->region = (struct resource)DEFINE_RES_MEM(start, size);
 	mem->io_start = io_start;
+	mem->io_size = io_size;
 	mem->min_page_size = min_page_size;
 	mem->ops = ops;
 	mem->total = size;
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 5625c9c38993..459051ce0c91 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -71,6 +71,7 @@ struct intel_memory_region {
 	struct drm_mm_node fake_mappable;
 
 	resource_size_t io_start;
+	resource_size_t io_size;
 	resource_size_t min_page_size;
 	resource_size_t total;
 	resource_size_t avail;
@@ -103,6 +104,7 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			   resource_size_t size,
 			   resource_size_t min_page_size,
 			   resource_size_t io_start,
+			   resource_size_t io_size,
 			   u16 type,
 			   u16 instance,
 			   const struct intel_memory_region_ops *ops);
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 7acba1d2135e..247f65f02bbf 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -170,7 +170,7 @@ static int igt_mock_reserve(void *arg)
 	if (!order)
 		return 0;
 
-	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0);
+	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0, 0);
 	if (IS_ERR(mem)) {
 		pr_err("failed to create memory region\n");
 		err = PTR_ERR(mem);
@@ -383,7 +383,7 @@ static int igt_mock_splintered_region(void *arg)
 	 */
 
 	size = (SZ_4G - 1) & PAGE_MASK;
-	mem = mock_region_create(i915, 0, size, PAGE_SIZE, 0);
+	mem = mock_region_create(i915, 0, size, PAGE_SIZE, 0, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);
 
@@ -471,7 +471,7 @@ static int igt_mock_max_segment(void *arg)
 	 */
 
 	size = SZ_8G;
-	mem = mock_region_create(i915, 0, size, PAGE_SIZE, 0);
+	mem = mock_region_create(i915, 0, size, PAGE_SIZE, 0, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);
 
@@ -1188,7 +1188,7 @@ int intel_memory_region_mock_selftests(void)
 	if (!i915)
 		return -ENOMEM;
 
-	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0);
+	mem = mock_region_create(i915, 0, SZ_2G, I915_GTT_PAGE_SIZE_4K, 0, 0);
 	if (IS_ERR(mem)) {
 		pr_err("failed to create memory region\n");
 		err = PTR_ERR(mem);
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 19bff8afcaaa..467eeae6d5f0 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -107,7 +107,8 @@ mock_region_create(struct drm_i915_private *i915,
 		   resource_size_t start,
 		   resource_size_t size,
 		   resource_size_t min_page_size,
-		   resource_size_t io_start)
+		   resource_size_t io_start,
+		   resource_size_t io_size)
 {
 	int instance = ida_alloc_max(&i915->selftest.mock_region_instances,
 				     TTM_NUM_MEM_TYPES - TTM_PL_PRIV - 1,
@@ -117,6 +118,7 @@ mock_region_create(struct drm_i915_private *i915,
 		return ERR_PTR(instance);
 
 	return intel_memory_region_create(i915, start, size, min_page_size,
-					  io_start, INTEL_MEMORY_MOCK, instance,
+					  io_start, io_size,
+					  INTEL_MEMORY_MOCK, instance,
 					  &mock_region_ops);
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.h b/drivers/gpu/drm/i915/selftests/mock_region.h
index 329bf74dfaca..e36c3a433551 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.h
+++ b/drivers/gpu/drm/i915/selftests/mock_region.h
@@ -16,6 +16,7 @@ mock_region_create(struct drm_i915_private *i915,
 		   resource_size_t start,
 		   resource_size_t size,
 		   resource_size_t min_page_size,
-		   resource_size_t io_start);
+		   resource_size_t io_start,
+		   resource_size_t io_size);
 
 #endif /* !__MOCK_REGION_H */
-- 
2.34.1

