Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D857D7DEBC8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4A10E80A;
	Thu,  2 Nov 2023 04:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7F10E7FB;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QhHvWEZ31Nrqe6D9olvuRmqbl4OUEcTS9Em2K9q5xkY=;
 b=kTP0T/dC9OXfTFuzxANOq5wTxx2D5QommHunu8dJHOnDhJ6uVVKINNLn
 xAFVkucutZSKkfaoSRvpC/5W0qlkuTmGT3K/Grw6qMeOzz3xpYA9cMSYq
 sw/ogT+sMnJaOcQSkobAUfpbSZ2xFJ5+ZpnfTmiGI2H7f7CvMob6IjZBe
 f+5r88E0qYCQkuRlEvSbQ2ZgdCNAq9DbFPBLKwkmKZF/XSATNwdzyaH4M
 wIrk4Qnjv+QYM8824T5n5pVI1+zRthowpPrHjYsCeyLxNoO59qm9Y3DLH
 A/Z0bWFMxZx+BAZwcwqBvS6LAm1mTbFUbvSsQ8UfQ45LrBPuEEivgL+Sg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930916"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930916"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762625"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762625"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 05/11] drm: Replace ttm macros with drm macros
Date: Thu,  2 Nov 2023 00:33:00 -0400
Message-Id: <20231102043306.2931989-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
MIME-Version: 1.0
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM_MAX_BO_PRIORITY and TTM_NUM_MEM_TYPES are move from ttm to
drm, so:
s/TTM_MAX_BO_PRIORITY/DRM_MAX_LRU_PRIORITY
s/TTM_NUM_MEM_TYPES/DRM_NUM_MEM_TYPES

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c      |  2 +-
 drivers/gpu/drm/i915/selftests/mock_region.c |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c             |  8 ++++----
 drivers/gpu/drm/ttm/ttm_resource.c           | 12 ++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h           |  2 +-
 drivers/gpu/drm/xe/xe_bo.h                   |  2 +-
 include/drm/ttm/ttm_device.h                 |  6 +++---
 include/drm/ttm/ttm_range_manager.h          |  4 ++--
 include/drm/ttm/ttm_resource.h               | 10 ++++------
 11 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c46f54f83f54..228dbea60949 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -987,7 +987,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	spin_lock(bo->bdev->lru_lock);
 	if (shrinkable) {
 		/* Try to keep shmem_tt from being considered for shrinking. */
-		bo->priority = TTM_MAX_BO_PRIORITY - 1;
+		bo->priority = DRM_MAX_LRU_PRIORITY - 1;
 	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
 		bo->priority = I915_TTM_PRIO_PURGE;
 	} else if (!i915_gem_object_has_pages(obj)) {
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index b845782c9859..f75520c2ba59 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -63,7 +63,7 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
 		return TTM_PL_SYSTEM;
 
 	type = mem->instance + TTM_PL_PRIV;
-	GEM_BUG_ON(type >= TTM_NUM_MEM_TYPES);
+	GEM_BUG_ON(type >= DRM_NUM_MEM_TYPES);
 
 	return type;
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 6324eb32d4dd..6ea0e6bec812 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -111,7 +111,7 @@ mock_region_create(struct drm_i915_private *i915,
 		   resource_size_t io_size)
 {
 	int instance = ida_alloc_max(&i915->selftest.mock_region_instances,
-				     TTM_NUM_MEM_TYPES - TTM_PL_PRIV - 1,
+				     DRM_NUM_MEM_TYPES - TTM_PL_PRIV - 1,
 				     GFP_KERNEL);
 
 	if (instance < 0)
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d18eca86ebd6..e8c8006ba748 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -148,7 +148,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	int ret;
 
 	spin_lock(bdev->lru_lock);
-	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
+	for (i = TTM_PL_SYSTEM; i < DRM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
 			continue;
@@ -245,7 +245,7 @@ void ttm_device_fini(struct ttm_device *bdev)
 	destroy_workqueue(bdev->wq);
 
 	spin_lock(bdev->lru_lock);
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
+	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i)
 		if (list_empty(&man->lru[0]))
 			pr_debug("Swap list %d was clean\n", i);
 	spin_unlock(bdev->lru_lock);
@@ -287,12 +287,12 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
 
 	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
 
-	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
+	for (i = TTM_PL_SYSTEM; i < DRM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
 		if (!man || !man->use_tt)
 			continue;
 
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j)
+		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j)
 			ttm_device_clear_lru_dma_mappings(bdev, &man->lru[j]);
 	}
 }
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 6ada77f51fba..05eef866065e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -54,8 +54,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
 {
 	unsigned i, j;
 
-	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
-		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
+	for (i = 0; i < DRM_NUM_MEM_TYPES; ++i) {
+		for (j = 0; j < DRM_MAX_LRU_PRIORITY; ++j) {
 			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
 			struct ttm_resource_manager *man;
 
@@ -393,7 +393,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 	man->size = size;
 	man->usage = 0;
 
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
+	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
 	man->move = NULL;
 }
@@ -425,7 +425,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 	 */
 
 	spin_lock(bdev->lru_lock);
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
+	for (i = 0; i < DRM_MAX_LRU_PRIORITY; ++i) {
 		while (!list_empty(&man->lru[i])) {
 			spin_unlock(bdev->lru_lock);
 			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
@@ -504,7 +504,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 
 	lockdep_assert_held(man->bdev->lru_lock);
 
-	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
+	for (cursor->priority = 0; cursor->priority < DRM_MAX_LRU_PRIORITY;
 	     ++cursor->priority)
 		list_for_each_entry(res, &man->lru[cursor->priority], lru)
 			return res;
@@ -531,7 +531,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
 	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
 		return res;
 
-	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
+	for (++cursor->priority; cursor->priority < DRM_MAX_LRU_PRIORITY;
 	     ++cursor->priority)
 		list_for_each_entry(res, &man->lru[cursor->priority], lru)
 			return res;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index c43853597776..9efde9ba9fe2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -383,7 +383,7 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 
 	memset(vmw_bo, 0, sizeof(*vmw_bo));
 
-	BUILD_BUG_ON(TTM_MAX_BO_PRIORITY <= 3);
+	BUILD_BUG_ON(DRM_MAX_LRU_PRIORITY <= 3);
 	vmw_bo->tbo.priority = 3;
 	vmw_bo->res_tree = RB_ROOT;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 1d433fceed3d..c43a82c8afb9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -82,7 +82,7 @@ struct vmw_bo {
 	struct ttm_bo_kmap_obj map;
 
 	struct rb_root res_tree;
-	u32 res_prios[TTM_MAX_BO_PRIORITY];
+	u32 res_prios[DRM_MAX_LRU_PRIORITY];
 
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9097bcc13209..9918b2d630e1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -72,7 +72,7 @@
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
 #define XE_PL_VRAM1		(XE_PL_VRAM0 + 1)
-#define XE_PL_STOLEN		(TTM_NUM_MEM_TYPES - 1)
+#define XE_PL_STOLEN		(DRM_NUM_MEM_TYPES - 1)
 
 #define XE_BO_PROPS_INVALID	(-1)
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 4d29e96bd892..a75e820dc671 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -235,7 +235,7 @@ struct ttm_device {
 	/**
 	 * @man_drv: An array of resource_managers, one per resource type.
 	 */
-	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
+	struct ttm_resource_manager *man_drv[DRM_NUM_MEM_TYPES];
 
 	/**
 	 * @vma_manager: Address space manager for finding BOs to mmap.
@@ -277,14 +277,14 @@ static inline struct ttm_resource_manager *
 ttm_manager_type(struct ttm_device *bdev, int mem_type)
 {
 	BUILD_BUG_ON(__builtin_constant_p(mem_type)
-		     && mem_type >= TTM_NUM_MEM_TYPES);
+		     && mem_type >= DRM_NUM_MEM_TYPES);
 	return bdev->man_drv[mem_type];
 }
 
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
-	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= DRM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
 }
 
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 7963b957e9ef..becdb88c4d84 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -43,14 +43,14 @@ static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned int type, bool use_tt,
 		       unsigned long p_size)
 {
-	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= DRM_NUM_MEM_TYPES);
 	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
 }
 
 static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
 		       unsigned int type)
 {
-	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= DRM_NUM_MEM_TYPES);
 	return ttm_range_man_fini_nocheck(bdev, type);
 }
 #endif
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 78a226eba953..92241c2374fa 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -34,9 +34,7 @@
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
-
-#define TTM_MAX_BO_PRIORITY	4U
-#define TTM_NUM_MEM_TYPES 8
+#include <drm/drm_evictable_lru.h>
 
 struct ttm_device;
 struct ttm_resource_manager;
@@ -167,7 +165,7 @@ struct ttm_resource_manager {
 	/*
 	 * Protected by the bdev->lru_lock.
 	 */
-	struct list_head lru[TTM_MAX_BO_PRIORITY];
+	struct list_head lru[DRM_MAX_LRU_PRIORITY];
 
 	/**
 	 * @usage: How much of the resources are used, protected by the
@@ -253,7 +251,7 @@ struct ttm_lru_bulk_move_pos {
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
  */
 struct ttm_lru_bulk_move {
-	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
+	struct ttm_lru_bulk_move_pos pos[DRM_NUM_MEM_TYPES][DRM_MAX_LRU_PRIORITY];
 };
 
 /**
@@ -309,7 +307,7 @@ ttm_resource_manager_set_used(struct ttm_resource_manager *man, bool used)
 {
 	int i;
 
-	for (i = 0; i < TTM_MAX_BO_PRIORITY; i++)
+	for (i = 0; i < DRM_MAX_LRU_PRIORITY; i++)
 		WARN_ON(!list_empty(&man->lru[i]));
 	man->use_type = used;
 }
-- 
2.26.3

