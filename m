Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3734C4817
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B40810E4A2;
	Fri, 25 Feb 2022 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4910E378;
 Fri, 25 Feb 2022 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645800974; x=1677336974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dB+EDMn5zHoqrFtuAD2UZlBGvsOuS9VdrzFe2bShQfM=;
 b=lJt1CPwWqa880UeGF9BuV/df/Vm11qZU//WeLXF0u1pDnwg0pOpvT8tR
 A3S3LrVEAoHjweOK6DGM1Xn/x7mBNI8CX/h6jZatlvMrpy9AoIqyoIt6Q
 RwLPmYe4SH7MX24idaoYI7VPR8k4azthgl3Jex9iEbeq5LGyJ0NIpuiEf
 QoWcHvgR+NMKCeWvUjqYQvs5glnnihBgxEA0jt96LrnwIQ8YK65loDNJu
 qvMIDg6FA+AsszL2UIa6qb9hZQ6IkOgw7jXq+2RYE/c0BRGQHautKS60d
 qhdldaAG4qkbC98fWx7bcoYQYi5jqd38xxIlQbiGfAvo/WSE0qOtE1j2y A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252237230"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252237230"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="707882131"
Received: from phelanmi-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 3/7] drm/i915: add I915_BO_ALLOC_GPU_ONLY
Date: Fri, 25 Feb 2022 14:54:58 +0000
Message-Id: <20220225145502.331818-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225145502.331818-1-matthew.auld@intel.com>
References: <20220225145502.331818-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the user doesn't require CPU access for the buffer, then
ALLOC_GPU_ONLY should be used, in order to prioritise allocating in the
non-mappable portion of LMEM, on devices with small BAR.

v2(Thomas):
  - The BO_ALLOC_TOPDOWN naming here is poor, since this is pure lies on
    systems that don't even have small BAR. A better name is GPU_ONLY,
    which is accurate regardless of the configuration.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h    | 17 ++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_pages.c       |  3 +++
 drivers/gpu/drm/i915/gem/i915_gem_region.c      |  5 +++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c         | 13 ++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt.c              |  4 +++-
 drivers/gpu/drm/i915/i915_vma.c                 |  3 +++
 drivers/gpu/drm/i915/intel_region_ttm.c         | 11 ++++++++---
 drivers/gpu/drm/i915/selftests/mock_region.c    |  7 +------
 8 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 0098a32490f0..fd54eb8f4826 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -319,16 +319,23 @@ struct drm_i915_gem_object {
 #define I915_BO_ALLOC_PM_VOLATILE BIT(4)
 /* Object needs to be restored early using memcpy during resume */
 #define I915_BO_ALLOC_PM_EARLY    BIT(5)
+/*
+ * Object is likely never accessed by the CPU. This will prioritise the BO to be
+ * allocated in the non-mappable portion of lmem. This is merely a hint, and if
+ * dealing with userspace objects the CPU fault handler is free to ignore this.
+ */
+#define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
 			     I915_BO_ALLOC_CPU_CLEAR | \
 			     I915_BO_ALLOC_USER | \
 			     I915_BO_ALLOC_PM_VOLATILE | \
-			     I915_BO_ALLOC_PM_EARLY)
-#define I915_BO_READONLY          BIT(6)
-#define I915_TILING_QUIRK_BIT     7 /* unknown swizzling; do not release! */
-#define I915_BO_PROTECTED         BIT(8)
-#define I915_BO_WAS_BOUND_BIT     9
+			     I915_BO_ALLOC_PM_EARLY | \
+			     I915_BO_ALLOC_GPU_ONLY)
+#define I915_BO_READONLY          BIT(7)
+#define I915_TILING_QUIRK_BIT     8 /* unknown swizzling; do not release! */
+#define I915_BO_PROTECTED         BIT(9)
+#define I915_BO_WAS_BOUND_BIT     10
 	/**
 	 * @mem_flags - Mutable placement-related flags
 	 *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 183b861620b8..97c820eee115 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -358,6 +358,9 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	    !i915_gem_object_has_iomem(obj))
 		return ERR_PTR(-ENXIO);
 
+	if (WARN_ON_ONCE(obj->flags & I915_BO_ALLOC_GPU_ONLY))
+		return ERR_PTR(-EINVAL);
+
 	assert_object_held(obj);
 
 	pinned = !(type & I915_MAP_OVERRIDE);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index a4350227e9ae..873d52f872c5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -45,6 +45,11 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 
 	GEM_BUG_ON(flags & ~I915_BO_ALLOC_FLAGS);
 
+	if (WARN_ON_ONCE(flags & I915_BO_ALLOC_GPU_ONLY &&
+			 (flags & I915_BO_ALLOC_CPU_CLEAR ||
+			  flags & I915_BO_ALLOC_PM_EARLY)))
+		return ERR_PTR(-EINVAL);
+
 	if (!mem)
 		return ERR_PTR(-ENODEV);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 0363987dee97..a13e0204a139 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -129,10 +129,14 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 	place->mem_type = intel_region_to_ttm_type(mr);
 
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
-		place->flags = TTM_PL_FLAG_CONTIGUOUS;
+		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (mr->io_size && mr->io_size < mr->total) {
-		place->fpfn = 0;
-		place->lpfn = mr->io_size >> PAGE_SHIFT;
+		if (flags & I915_BO_ALLOC_GPU_ONLY) {
+			place->flags |= TTM_PL_FLAG_TOPDOWN;
+		} else {
+			place->fpfn = 0;
+			place->lpfn = mr->io_size >> PAGE_SHIFT;
+		}
 	}
 }
 
@@ -890,6 +894,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (!obj)
 		return VM_FAULT_SIGBUS;
 
+	if (obj->flags & I915_BO_ALLOC_GPU_ONLY)
+		return -EINVAL;
+
 	/* Sanity check that we allow writing into this object */
 	if (unlikely(i915_gem_object_is_readonly(obj) &&
 		     area->vm_flags & VM_WRITE))
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ee46f933d070..8a2483ccbfb9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -456,7 +456,9 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
 	struct i915_vma *vma;
 	int ret;
 
-	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE);
+	obj = i915_gem_object_create_lmem(i915, size,
+					  I915_BO_ALLOC_VOLATILE |
+					  I915_BO_ALLOC_GPU_ONLY);
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_stolen(i915, size);
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 3558b16a929c..dc28e6e3efef 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -540,6 +540,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 	void __iomem *ptr;
 	int err;
 
+	if (WARN_ON_ONCE(vma->obj->flags & I915_BO_ALLOC_GPU_ONLY))
+		return IO_ERR_PTR(-EINVAL);
+
 	if (!i915_gem_object_is_lmem(vma->obj)) {
 		if (GEM_WARN_ON(!i915_vma_is_map_and_fenceable(vma))) {
 			err = -ENODEV;
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 5a40310d6fdd..6cfe9090ede7 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -199,14 +199,19 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	struct ttm_resource *res;
 	int ret;
 
+	if (flags & I915_BO_ALLOC_CONTIGUOUS)
+		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (mem->io_size && mem->io_size < mem->total) {
-		place.fpfn = 0;
-		place.lpfn = mem->io_size >> PAGE_SHIFT;
+		if (flags & I915_BO_ALLOC_GPU_ONLY) {
+			place.flags |= TTM_PL_FLAG_TOPDOWN;
+		} else {
+			place.fpfn = 0;
+			place.lpfn = mem->io_size >> PAGE_SHIFT;
+		}
 	}
 
 	mock_bo.base.size = size;
 	mock_bo.bdev = &mem->i915->bdev;
-	place.flags = flags;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
 	if (ret == -ENOSPC)
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 467eeae6d5f0..f64325491f35 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -22,17 +22,12 @@ static void mock_region_put_pages(struct drm_i915_gem_object *obj,
 
 static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 {
-	unsigned int flags;
 	struct sg_table *pages;
 	int err;
 
-	flags = 0;
-	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
-		flags |= TTM_PL_FLAG_CONTIGUOUS;
-
 	obj->mm.res = intel_region_ttm_resource_alloc(obj->mm.region,
 						      obj->base.size,
-						      flags);
+						      obj->flags);
 	if (IS_ERR(obj->mm.res))
 		return PTR_ERR(obj->mm.res);
 
-- 
2.34.1

