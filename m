Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312D6714E9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F6A10E6AA;
	Wed, 18 Jan 2023 07:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379BC10E6B6;
 Wed, 18 Jan 2023 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026177; x=1705562177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxOTStn+XGuHqjyWAPhLD78k6ydzOyroTJO0TE3CgJM=;
 b=TUYu6WEobi6honfY3s8NshltF6gUGttEV/Y1YCzMQj4l6Ccez5PAJ8sS
 JAzgCvylk6S/SgaNI3fMI0Bgo5c0i+cmfupDCzgwUQCuBzHv9zwJtOBiO
 2snxOvAqtYO3rFukEGl2Y2dhC+YO0kDS0dwXdcOZYOzdEKVGufATZWOaT
 6a/nUJ+L3NeJqSJfrA41bBdb8ip4GaXyvORWGZCkD9CwQ8BkYmkh4hOMZ
 tJBT69kuX7poh/HCFs4Pi8Gok5IB6BRfgCdvHWtKgJ8kRWqBBQ2bkEYVM
 mRbZdehJAEY3sUjfXMhB90KO7bzgblHmNNyas3w0FCP4b5Sjdw2IZxo06 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482086"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482086"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661610034"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661610034"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 21/23] drm/i915/vm_bind: Async vm_unbind support
Date: Tue, 17 Jan 2023 23:16:07 -0800
Message-Id: <20230118071609.17572-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Asynchronously unbind the vma upon vm_unbind call.
Fall back to synchronous unbind if backend doesn't support
async unbind or if async unbind fails.

No need for vm_unbind out fence support as i915 will internally
handle all sequencing and user need not try to sequence any
operation with the unbind completion.

v2: use i915_vma_destroy_async in vm_unbind ioctl
v3: Add force_unbind function variants

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 49 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.h               |  1 +
 include/uapi/drm/i915_drm.h                   |  3 +-
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 1cc0b8a4e0e7..78e7c0642c5f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -210,7 +210,7 @@ static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
 	 */
 	obj = vma->obj;
 	i915_gem_object_lock(obj, NULL);
-	i915_vma_destroy(vma);
+	i915_vma_destroy_async(vma);
 	i915_gem_object_unlock(obj);
 
 	i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 59462812ef4e..5b9ae5ebf55c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -42,6 +42,8 @@
 #include "i915_vma.h"
 #include "i915_vma_resource.h"
 
+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
+
 static inline void assert_vma_held_evict(const struct i915_vma *vma)
 {
 	/*
@@ -1746,7 +1748,7 @@ void i915_vma_reopen(struct i915_vma *vma)
 	spin_unlock_irq(&gt->closed_lock);
 }
 
-static void force_unbind(struct i915_vma *vma)
+static void __force_unbind(struct i915_vma *vma, bool async)
 {
 	if (!drm_mm_node_allocated(&vma->node))
 		return;
@@ -1760,10 +1762,26 @@ static void force_unbind(struct i915_vma *vma)
 		i915_vma_set_purged(vma);
 
 	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-	WARN_ON(__i915_vma_unbind(vma));
+	if (async) {
+		struct dma_fence *fence;
+
+		fence = __i915_vma_unbind_async(vma);
+		if (IS_ERR_OR_NULL(fence)) {
+			async = false;
+		} else {
+			dma_resv_add_fence(vma->obj->base.resv, fence,
+					   DMA_RESV_USAGE_READ);
+			dma_fence_put(fence);
+		}
+	}
+
+	if (!async)
+		WARN_ON(__i915_vma_unbind(vma));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
 }
 
+#define force_unbind(vma)	__force_unbind((vma), false)
+
 static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 			       bool vm_ddestroy)
 {
@@ -1842,6 +1860,33 @@ void i915_vma_destroy(struct i915_vma *vma)
 	release_references(vma, gt, vm_ddestroy);
 }
 
+void i915_vma_destroy_async(struct i915_vma *vma)
+{
+	bool vm_ddestroy, async = vma->obj->mm.rsgt;
+	struct intel_gt *gt;
+
+	if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
+		async = false;
+
+	mutex_lock(&vma->vm->mutex);
+	/*
+	 * Ensure any asynchronous binding is complete while using
+	 * async unbind as we will be releasing the vma here.
+	 */
+	if (async && i915_active_wait(&vma->active))
+		async = false;
+
+	__force_unbind(vma, async);
+	list_del_init(&vma->vm_link);
+	vm_ddestroy = vma->vm_ddestroy;
+	vma->vm_ddestroy = false;
+
+	/* vma->vm may be freed when releasing vma->vm->mutex. */
+	gt = vma->vm->gt;
+	mutex_unlock(&vma->vm->mutex);
+	release_references(vma, gt, vm_ddestroy);
+}
+
 void i915_vma_parked(struct intel_gt *gt)
 {
 	struct i915_vma *vma, *next;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index d6c05227fb04..8033f5c96efc 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -319,6 +319,7 @@ void i915_vma_reopen(struct i915_vma *vma);
 
 void i915_vma_destroy_locked(struct i915_vma *vma);
 void i915_vma_destroy(struct i915_vma *vma);
+void i915_vma_destroy_async(struct i915_vma *vma);
 
 #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 3f27001a2c8d..b9167f950327 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3970,7 +3970,8 @@ struct drm_i915_gem_vm_bind {
  * any error.
  *
  * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
- * are not ordered.
+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
+ * asynchronously.
  */
 struct drm_i915_gem_vm_unbind {
 	/** @vm_id: VM (address space) id to bind */
-- 
2.21.0.rc0.32.g243a4c7e27

