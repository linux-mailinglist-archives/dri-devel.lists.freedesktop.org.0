Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C45FEE72
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 15:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5146910EADF;
	Fri, 14 Oct 2022 13:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426310EADB;
 Fri, 14 Oct 2022 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665753277; x=1697289277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i1GXmWfpus/VCn/fj5Y8qdu/ShmmKhRy9d2o7GZGi1Q=;
 b=Uum56ohGOyA8q27GDZzfolioKdRx8Db9hCHwbQ17/lkUNweuf8dZTv4O
 Gi6HhFkaoeVfaL9jX61zDa4tV+gW2LkHpXpWDbELIeCE2FarDfGfa5yJc
 5+z2I3Ml0ZZuViUBDiOaU5k3st7UoYnQAbOJl4PmdlYTZqN2UPmW9lHTV
 fX4Oaz6LOBhWwL3jD7n2mueXCDPfpD5P3BDV5lKZNiPCd8I/LRCMcFnzW
 WfP7fIdZC6oPPvFDjvu6XvHBMKh4dVxOWLrKNe/92aVe9TMVdlWxE0Bag
 3wg12qfePeDiyqxN19mxdPVSlHCpeHnWZVD/riThR0FUzk+PTohq4AMPE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="369560264"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="369560264"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 06:14:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="605367740"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="605367740"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 06:14:34 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Refactor ttm ghost obj detection
Date: Fri, 14 Oct 2022 15:14:27 +0200
Message-Id: <20221014131427.21102-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 jonathan.cavitt@intel.com, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 andrzej.hajda@intel.com, John.C.Harrison@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently i915_ttm_to_gem() returns NULL for ttm ghost
object which makes it unclear when we should add a NULL
check for a caller of i915_ttm_to_gem() as ttm ghost
objects are expected behaviour for certain cases.

Create a separate function to detect ttm ghost object and
use that in places where we expect a ghost obj from ttm.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 21 ++++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h      | 18 ++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 6b60b99461e2..0a85651c654d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -279,7 +279,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	struct i915_ttm_tt *i915_tt;
 	int ret;
 
-	if (!obj)
+	if (i915_ttm_is_ghost_object(bo))
 		return NULL;
 
 	i915_tt = kzalloc(sizeof(*i915_tt), GFP_KERNEL);
@@ -362,7 +362,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 
-	if (!obj)
+	if (i915_ttm_is_ghost_object(bo))
 		return false;
 
 	/*
@@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	intel_wakeref_t wakeref = 0;
 
-	if (bo->resource && likely(obj)) {
+	if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
 		/* ttm_bo_release() already has dma_resv_lock */
 		if (i915_ttm_cpu_maps_iomem(bo->resource))
 			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
@@ -624,7 +624,7 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	int ret;
 
-	if (!obj)
+	if (i915_ttm_is_ghost_object(bo))
 		return;
 
 	ret = i915_ttm_move_notify(bo);
@@ -657,7 +657,7 @@ static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(mem->bo);
 	bool unknown_state;
 
-	if (!obj)
+	if (i915_ttm_is_ghost_object(mem->bo))
 		return -EINVAL;
 
 	if (!kref_get_unless_zero(&obj->base.refcount))
@@ -690,7 +690,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 	unsigned long base;
 	unsigned int ofs;
 
-	GEM_BUG_ON(!obj);
+	GEM_BUG_ON(i915_ttm_is_ghost_object(bo));
 	GEM_WARN_ON(bo->ttm);
 
 	base = obj->mm.region->iomap.base - obj->mm.region->region.start;
@@ -1035,13 +1035,12 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	struct vm_area_struct *area = vmf->vma;
 	struct ttm_buffer_object *bo = area->vm_private_data;
 	struct drm_device *dev = bo->base.dev;
-	struct drm_i915_gem_object *obj;
+	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	intel_wakeref_t wakeref = 0;
 	vm_fault_t ret;
 	int idx;
 
-	obj = i915_ttm_to_gem(bo);
-	if (!obj)
+	if (i915_ttm_is_ghost_object(bo))
 		return VM_FAULT_SIGBUS;
 
 	/* Sanity check that we allow writing into this object */
@@ -1141,7 +1140,7 @@ static void ttm_vm_open(struct vm_area_struct *vma)
 	struct drm_i915_gem_object *obj =
 		i915_ttm_to_gem(vma->vm_private_data);
 
-	GEM_BUG_ON(!obj);
+	GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
 	i915_gem_object_get(obj);
 }
 
@@ -1150,7 +1149,7 @@ static void ttm_vm_close(struct vm_area_struct *vma)
 	struct drm_i915_gem_object *obj =
 		i915_ttm_to_gem(vma->vm_private_data);
 
-	GEM_BUG_ON(!obj);
+	GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
 	i915_gem_object_put(obj);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
index e4842b4296fc..2a94a99ef76b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
@@ -27,19 +27,27 @@ i915_gem_to_ttm(struct drm_i915_gem_object *obj)
  */
 void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
 
+/**
+ * i915_ttm_is_ghost_object - Check if the ttm bo is a ghost object.
+ * @bo: Pointer to the ttm buffer object
+ *
+ * Return: True if the ttm bo is not a i915 object but a ghost ttm object,
+ * False otherwise.
+ */
+static inline bool i915_ttm_is_ghost_object(struct ttm_buffer_object *bo)
+{
+	return bo->destroy != i915_ttm_bo_destroy;
+}
+
 /**
  * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an embedding
  * struct drm_i915_gem_object.
  *
- * Return: Pointer to the embedding struct ttm_buffer_object, or NULL
- * if the object was not an i915 ttm object.
+ * Return: Pointer to the embedding struct ttm_buffer_object.
  */
 static inline struct drm_i915_gem_object *
 i915_ttm_to_gem(struct ttm_buffer_object *bo)
 {
-	if (bo->destroy != i915_ttm_bo_destroy)
-		return NULL;
-
 	return container_of(bo, struct drm_i915_gem_object, __do_not_access);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 9a7e50534b84..f59f812dc6d2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	bool clear;
 	int ret;
 
-	if (GEM_WARN_ON(!obj)) {
+	if (GEM_WARN_ON(i915_ttm_is_ghost_object(bo))) {
 		ttm_bo_move_null(bo, dst_mem);
 		return 0;
 	}
-- 
2.37.3

