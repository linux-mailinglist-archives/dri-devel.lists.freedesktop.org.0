Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7A4B2463
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257C010EA97;
	Fri, 11 Feb 2022 11:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D4510E8E8;
 Fri, 11 Feb 2022 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579292; x=1676115292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3BlPhZbRKGuvA1IOlcgKNmrdKCDInaUUN8f/iMmK6gM=;
 b=Rem9a2hkrE703AnE9hNTLHmp+Y3CXMJmEtml0wbKSAJkOrH2vB7d7QS3
 hcrf0IimhoYjSYh4vUhAfhkRUbQiVSdcGcg/s5lWNRFN7pj8XK4LY/mCX
 vH8Z4SK3qsArDy9hyL/Wlu/hY84d3v0qcbVx7tUAdpreymVb/pJjDGHyt
 At/rk6aevTRGoHFZjl6KNZQDILY9rn2D+nDCZ71MfKM+cu9SPEqUORoA9
 ZAvFg9v+lc35Vv90lizFeXXQNuNt0ZUOulaGcg9J6Him2xP40U0nRR7e5
 H5zKGzqw+nnRCcCSq/evXCob4zXo761Kd+s3uZOR7PU5LzGPdSladDWiS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548229"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548229"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354954"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 03/15] drm/i915: add I915_BO_ALLOC_GPU_ONLY
Date: Fri, 11 Feb 2022 11:34:25 +0000
Message-Id: <20220211113437.874691-4-matthew.auld@intel.com>
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
index 060fe29f5929..a4d8dc163691 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -356,6 +356,9 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
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
index 41e94d09e742..36e77fcf2ef9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -127,10 +127,14 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
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
 
@@ -888,6 +892,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (!obj)
 		return VM_FAULT_SIGBUS;
 
+	if (obj->flags & I915_BO_ALLOC_GPU_ONLY)
+		return -EINVAL;
+
 	/* Sanity check that we allow writing into this object */
 	if (unlikely(i915_gem_object_is_readonly(obj) &&
 		     area->vm_flags & VM_WRITE))
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e6f6bf7c3926..4f35c51fdb52 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -457,7 +457,9 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
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
index 845cd88f8313..3322a0651a17 100644
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
index 4689192d5e8d..c055029c7a70 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -199,13 +199,18 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
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

