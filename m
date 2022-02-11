Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C54B245A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E9A10EA92;
	Fri, 11 Feb 2022 11:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922F610EA8B;
 Fri, 11 Feb 2022 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579289; x=1676115289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nk0RxZbstYFJqlVLnYgMYMtMwoHQXLGJxnWbXx4vmTQ=;
 b=M4dvGi3Gt1BoAhSL+oM45hlNLQZpReGe4uPVo+P9bcnDlMfDHN9P5zUH
 5m0cEnHGqETIXtOOiJcZfv+TL0rlVTsiFoCmWLRTZL2HqlY9yislXkOEi
 zF0dBgU3HJS/dQBNVOxIZTJWnRg6mvUU1nlJQEMq6uzbbnqV6+hysDu8U
 KcJPCOO2PMuc90XWupFusFJj++qMAN7KwqBSvldnC+CFxhJgGVAsfkLzg
 VGw2h+0ewgYrettzxRBBc5RQgvIgLnf1kFWPIxEBxEj3QhNBk159CIasO
 Yqsqx9odON4BX3pFK0nw87Mw577hRIRqcXO1aJaI6UCWd5izQoJhX2uvq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548223"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548223"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354946"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/15] drm/i915: add io_size plumbing
Date: Fri, 11 Feb 2022 11:34:23 +0000
Message-Id: <20220211113437.874691-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With small LMEM-BAR we need to be able to differentiate between the
total size of LMEM, and how much of it is CPU mappable. The end goal is
to be able to utilize the entire range, even if part of is it not CPU
accessible.

v2: also update intelfb_create

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c           | 2 +-
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
 11 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 41d279db2be6..244acf462065 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -248,7 +248,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		struct intel_memory_region *mem = obj->mm.region;
 
 		info->apertures->ranges[0].base = mem->io_start;
-		info->apertures->ranges[0].size = mem->total;
+		info->apertures->ranges[0].size = mem->io_size;
 
 		/* Use fbdev's framebuffer from lmem for discrete */
 		info->fix.smem_start =
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
index 1de73a644965..b79f5f5e7df0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -491,6 +491,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 
 	/* Exclude the reserved region from driver use */
 	mem->region.end = reserved_base - 1;
+	mem->io_size = resource_size(&mem->region);
 
 	/* It is possible for the reserved area to end before the end of stolen
 	 * memory, so just consider the start. */
@@ -747,7 +748,7 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
 
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
-				resource_size(&mem->region)))
+				mem->io_size))
 		return -EIO;
 
 	/*
@@ -802,7 +803,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 						I915_GTT_PAGE_SIZE_4K;
 
 	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
-					 min_page_size, io_start,
+					 min_page_size,
+					 io_start, lmem_size,
 					 type, instance,
 					 &i915_region_stolen_lmem_ops);
 	if (IS_ERR(mem))
@@ -833,7 +835,7 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	mem = intel_memory_region_create(i915,
 					 intel_graphics_stolen_res.start,
 					 resource_size(&intel_graphics_stolen_res),
-					 PAGE_SIZE, 0, type, instance,
+					 PAGE_SIZE, 0, 0, type, instance,
 					 &i915_region_stolen_smem_ops);
 	if (IS_ERR(mem))
 		return mem;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 1eb2fd81c5b6..e9399f7b3e67 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1101,7 +1101,7 @@ i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 
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
index cb3f66707b21..01838b8ce4c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -91,7 +91,7 @@ region_lmem_init(struct intel_memory_region *mem)
 
 	if (!io_mapping_init_wc(&mem->iomap,
 				mem->io_start,
-				resource_size(&mem->region))) {
+				mem->io_size)) {
 		ret = -EIO;
 		goto out_no_io;
 	}
@@ -144,6 +144,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
 					 mappable_end,
 					 PAGE_SIZE,
 					 io_start,
+					 mappable_end,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
@@ -220,6 +221,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 					 lmem_size,
 					 min_page_size,
 					 io_start,
+					 lmem_size,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
@@ -233,6 +235,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
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

