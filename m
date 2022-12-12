Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0764AB68
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B438F10E2C5;
	Mon, 12 Dec 2022 23:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06210E2AC;
 Mon, 12 Dec 2022 23:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886939; x=1702422939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mz+vePIPRSMyrVH52R2hXfQu0NOO5eWS6/Gv/HRqmPc=;
 b=UeN2SqTuI3uozhjLaLWgTff10v2GlvPj8aBFsIqXgtIDe9gPWanIzk+p
 Bto+SGjL70ZaXUMYCWG/qRD6gtZdKbsW0gtVzOOe9iPYqz9tvFuycuRzy
 a0n5cSBlLAzdtTsi7zCO//zGzjkg1fu8GSvXXloEn2Q169ysI31RHByNi
 a5sI26rz4h7ZiGyt9mFI0wJQ9xdvFBts8zhtaeOai/LH/s7Z3UxImVmC2
 4L642werU23Nl1Uk5zWh+BpIJ6ZhgKM9ch0IirL6Zf83doHqWrZaCfJET
 ZUaUA1wRaZV4tAM4arCXTOcHhyF9ud9MNQ/+UDn+J7jTP7IzrHDVg/Puo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196412"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090371"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090371"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 21/23] drm/i915/vm_bind: Async vm_unbind support
Date: Mon, 12 Dec 2022 15:15:25 -0800
Message-Id: <20221212231527.2384-22-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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
index b27735eaaeb9..7f23adcfb253 100644
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

