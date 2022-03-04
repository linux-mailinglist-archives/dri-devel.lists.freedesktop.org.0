Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1C4CDA43
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1435D10FE8B;
	Fri,  4 Mar 2022 17:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695A210FDB2;
 Fri,  4 Mar 2022 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414658; x=1677950658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrrBZHUc99E8NVeDKNUr3b3IKSDfnvyh0cKwx3BAOXI=;
 b=PM26EAoB73DJjfr8oG4fgzje+t6CqoucvCoMmu320ACD4Nf/+81d6b0l
 hcRQlUC98JkDY7GD/tS3XvY9gGwAOhb4lngDaG+Po++xpnMoISA7WNB+H
 ECta0EVlHiLEN1uqQa3SEvhXMT8qCGVMm+kzWj2xwEss0VCuBwuueDhti
 Mfn2JOphCHy8pQdbNarxlolIF4vnEUvSDFdyG9ylrOl5zZHZnXmwSjn8v
 5uHXYqaH6TTvavxTqs/kgwtKYBSz5yWGQXTQfVoVp0b4mdXl3AJ+4qHxe
 SIk/9gj/uHgetm2YxkevrYI2SoBuj7zu8658vQqM5ZwKeC1TfOwsWd3M+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252848970"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="252848970"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:18 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631216601"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915: add i915_gem_object_create_region_at()
Date: Fri,  4 Mar 2022 17:23:28 +0000
Message-Id: <20220304172333.991778-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304172333.991778-1-matthew.auld@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
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

Add a generic interface for allocating an object at some specific
offset, and convert stolen over. Later we will want to hook this up to
different backends.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c    | 42 ++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_region.h    |  7 ++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 82 ++++++-------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  4 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |  1 +
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  8 +-
 drivers/gpu/drm/i915/intel_memory_region.h    |  1 +
 drivers/gpu/drm/i915/selftests/mock_region.c  |  1 +
 12 files changed, 80 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index e207d12286b5..5227e5b35206 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include "gem/i915_gem_region.h"
 #include "i915_drv.h"
 #include "intel_atomic_plane.h"
 #include "intel_display.h"
@@ -69,7 +70,8 @@ initial_plane_vma(struct drm_i915_private *i915,
 	    size * 2 > i915->stolen_usable_size)
 		return NULL;
 
-	obj = i915_gem_object_create_stolen_for_preallocated(i915, base, size);
+	obj = i915_gem_object_create_region_at(i915->mm.stolen_region,
+					       base, size, 0);
 	if (IS_ERR(obj))
 		return NULL;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index c6eb023d3d86..5802692ea604 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -123,7 +123,7 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
 	 */
 	flags = I915_BO_ALLOC_USER;
 
-	ret = mr->ops->init_object(mr, obj, size, 0, flags);
+	ret = mr->ops->init_object(mr, obj, I915_BO_INVALID_OFFSET, size, 0, flags);
 	if (ret)
 		goto object_free;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 6cf94469d5a8..460a6924e611 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -27,11 +27,12 @@ void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj)
 	mutex_unlock(&mem->objects.lock);
 }
 
-struct drm_i915_gem_object *
-i915_gem_object_create_region(struct intel_memory_region *mem,
-			      resource_size_t size,
-			      resource_size_t page_size,
-			      unsigned int flags)
+static struct drm_i915_gem_object *
+__i915_gem_object_create_region(struct intel_memory_region *mem,
+				resource_size_t offset,
+				resource_size_t size,
+				resource_size_t page_size,
+				unsigned int flags)
 {
 	struct drm_i915_gem_object *obj;
 	resource_size_t default_page_size;
@@ -83,7 +84,7 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	if (default_page_size < mem->min_page_size)
 		flags |= I915_BO_ALLOC_PM_EARLY;
 
-	err = mem->ops->init_object(mem, obj, size, page_size, flags);
+	err = mem->ops->init_object(mem, obj, offset, size, page_size, flags);
 	if (err)
 		goto err_object_free;
 
@@ -95,6 +96,35 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	return ERR_PTR(err);
 }
 
+struct drm_i915_gem_object *
+i915_gem_object_create_region(struct intel_memory_region *mem,
+			      resource_size_t size,
+			      resource_size_t page_size,
+			      unsigned int flags)
+{
+	return __i915_gem_object_create_region(mem, I915_BO_INVALID_OFFSET,
+					       size, page_size, flags);
+}
+
+struct drm_i915_gem_object *
+i915_gem_object_create_region_at(struct intel_memory_region *mem,
+				 resource_size_t offset,
+				 resource_size_t size,
+				 unsigned int flags)
+{
+	GEM_BUG_ON(offset == I915_BO_INVALID_OFFSET);
+
+	if (GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
+	    GEM_WARN_ON(!IS_ALIGNED(offset, mem->min_page_size)))
+		return ERR_PTR(-EINVAL);
+
+	if (range_overflows(offset, size, resource_size(&mem->region)))
+		return ERR_PTR(-EINVAL);
+
+	return __i915_gem_object_create_region(mem, offset, size, 0,
+					       flags | I915_BO_ALLOC_CONTIGUOUS);
+}
+
 /**
  * i915_gem_process_region - Iterate over all objects of a region using ops
  * to process and optionally skip objects
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index fcaa12d657d4..2dfcc41c0170 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -14,6 +14,8 @@ struct sg_table;
 
 struct i915_gem_apply_to_region;
 
+#define I915_BO_INVALID_OFFSET ((resource_size_t)-1)
+
 /**
  * struct i915_gem_apply_to_region_ops - ops to use when iterating over all
  * region objects.
@@ -56,6 +58,11 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t size,
 			      resource_size_t page_size,
 			      unsigned int flags);
+struct drm_i915_gem_object *
+i915_gem_object_create_region_at(struct intel_memory_region *mem,
+				 resource_size_t offset,
+				 resource_size_t size,
+				 unsigned int flags);
 
 int i915_gem_process_region(struct intel_memory_region *mr,
 			    struct i915_gem_apply_to_region *apply);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 3a1c782ed791..9e5faf0bdd4e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -552,6 +552,7 @@ static int __create_shmem(struct drm_i915_private *i915,
 
 static int shmem_object_init(struct intel_memory_region *mem,
 			     struct drm_i915_gem_object *obj,
+			     resource_size_t offset,
 			     resource_size_t size,
 			     resource_size_t page_size,
 			     unsigned int flags)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index c9ad4f8c4eaf..b917ded21028 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -681,6 +681,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 
 static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 					struct drm_i915_gem_object *obj,
+					resource_size_t offset,
 					resource_size_t size,
 					resource_size_t page_size,
 					unsigned int flags)
@@ -695,12 +696,32 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	if (size == 0)
 		return -EINVAL;
 
+	/*
+	 * With discrete devices, where we lack a mappable aperture there is no
+	 * possible way to ever access this memory on the CPU side.
+	 */
+	if (mem->type == INTEL_MEMORY_STOLEN_LOCAL && !mem->io_size &&
+	    !(flags & I915_BO_ALLOC_GPU_ONLY))
+		return -ENOSPC;
+
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
 	if (!stolen)
 		return -ENOMEM;
 
-	ret = i915_gem_stolen_insert_node(i915, stolen, size,
-					  mem->min_page_size);
+	if (offset != I915_BO_INVALID_OFFSET) {
+		drm_dbg(&i915->drm,
+			"creating preallocated stolen object: stolen_offset=%pa, size=%pa\n",
+			&offset, &size);
+
+		stolen->start = offset;
+		stolen->size = size;
+		mutex_lock(&i915->mm.stolen_lock);
+		ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
+		mutex_unlock(&i915->mm.stolen_lock);
+	} else {
+		ret = i915_gem_stolen_insert_node(i915, stolen, size,
+						  mem->min_page_size);
+	}
 	if (ret)
 		goto err_free;
 
@@ -873,63 +894,6 @@ i915_gem_stolen_smem_setup(struct drm_i915_private *i915, u16 type,
 	return mem;
 }
 
-struct drm_i915_gem_object *
-i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
-					       resource_size_t stolen_offset,
-					       resource_size_t size)
-{
-	struct intel_memory_region *mem = i915->mm.stolen_region;
-	struct drm_i915_gem_object *obj;
-	struct drm_mm_node *stolen;
-	int ret;
-
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		return ERR_PTR(-ENODEV);
-
-	drm_dbg(&i915->drm,
-		"creating preallocated stolen object: stolen_offset=%pa, size=%pa\n",
-		&stolen_offset, &size);
-
-	/* KISS and expect everything to be page-aligned */
-	if (GEM_WARN_ON(size == 0) ||
-	    GEM_WARN_ON(!IS_ALIGNED(size, mem->min_page_size)) ||
-	    GEM_WARN_ON(!IS_ALIGNED(stolen_offset, mem->min_page_size)))
-		return ERR_PTR(-EINVAL);
-
-	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-	if (!stolen)
-		return ERR_PTR(-ENOMEM);
-
-	stolen->start = stolen_offset;
-	stolen->size = size;
-	mutex_lock(&i915->mm.stolen_lock);
-	ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
-	mutex_unlock(&i915->mm.stolen_lock);
-	if (ret)
-		goto err_free;
-
-	obj = i915_gem_object_alloc();
-	if (!obj) {
-		ret = -ENOMEM;
-		goto err_stolen;
-	}
-
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
-	if (ret)
-		goto err_object_free;
-
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
-	return obj;
-
-err_object_free:
-	i915_gem_object_free(obj);
-err_stolen:
-	i915_gem_stolen_remove_node(i915, stolen);
-err_free:
-	kfree(stolen);
-	return ERR_PTR(ret);
-}
-
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
 {
 	return obj->ops == &i915_gem_object_stolen_ops;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index ccdf7befc571..d5005a39d130 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -31,10 +31,6 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *dev_priv,
 			      resource_size_t size);
-struct drm_i915_gem_object *
-i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *dev_priv,
-					       resource_size_t stolen_offset,
-					       resource_size_t size);
 
 bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 45cc5837ce00..5e543ed867a2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1142,6 +1142,7 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
  */
 int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       struct drm_i915_gem_object *obj,
+			       resource_size_t offset,
 			       resource_size_t size,
 			       resource_size_t page_size,
 			       unsigned int flags)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index 9d698ad00853..73e371aa3850 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -45,6 +45,7 @@ i915_ttm_to_gem(struct ttm_buffer_object *bo)
 
 int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 			       struct drm_i915_gem_object *obj,
+			       resource_size_t offset,
 			       resource_size_t size,
 			       resource_size_t page_size,
 			       unsigned int flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 63db136cbc27..b4770690e794 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -6,6 +6,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/string_helpers.h>
 
+#include "gem/i915_gem_region.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_vgpu.h"
@@ -325,9 +326,10 @@ static int vlv_rc6_init(struct intel_rc6 *rc6)
 		resource_size_t pcbr_offset;
 
 		pcbr_offset = (pcbr & ~4095) - i915->dsm.start;
-		pctx = i915_gem_object_create_stolen_for_preallocated(i915,
-								      pcbr_offset,
-								      pctx_size);
+		pctx = i915_gem_object_create_region_at(i915->mm.stolen_region,
+							pcbr_offset,
+							pctx_size,
+							0);
 		if (IS_ERR(pctx))
 			return PTR_ERR(pctx);
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 21dcbd620758..56f266020285 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -54,6 +54,7 @@ struct intel_memory_region_ops {
 
 	int (*init_object)(struct intel_memory_region *mem,
 			   struct drm_i915_gem_object *obj,
+			   resource_size_t offset,
 			   resource_size_t size,
 			   resource_size_t page_size,
 			   unsigned int flags);
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index f64325491f35..f16c0b7198c7 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -57,6 +57,7 @@ static const struct drm_i915_gem_object_ops mock_region_obj_ops = {
 
 static int mock_object_init(struct intel_memory_region *mem,
 			    struct drm_i915_gem_object *obj,
+			    resource_size_t offset,
 			    resource_size_t size,
 			    resource_size_t page_size,
 			    unsigned int flags)
-- 
2.34.1

