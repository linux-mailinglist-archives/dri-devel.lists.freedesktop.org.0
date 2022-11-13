Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA9626E51
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 08:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FE210E217;
	Sun, 13 Nov 2022 07:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FAC10E1FB;
 Sun, 13 Nov 2022 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668326266; x=1699862266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KPwL+Vo3RrRKJgLq8dboiBs5iFBHrcuz0CEqAAUL4SI=;
 b=DLlH5ynQEOUHP6oGIBjQkrUU6vMIeCQhmX97biypfKyjkl0EfhV0nJHS
 gb/6fPRU/Oj9YfcPZuCrZGKd3gKcNnIGBGYygqCWKRLoldMsOEHKf02Vr
 0NDm0y5vznfwTaHZsg0MjqRZfuitEc5/fTK8yNjzCBzOYdLuCEksWrr3h
 ZlInrGCOYTCzRwf3hWsa8lQoBZoMTIh/dE+CyHR/dgQGLTvIjvkgFBemJ
 a2QhlYZAte5l+cqXYlh+YA9q4leLRFAoubKNWonejoXCFmLq5D7sVXm16
 h0pOi0fkQiVhcizKJ/t4Hci9ZePGS9a8RnRXyLN0eXcwYchMZlgzUP4S0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="312936350"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="312936350"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="669235752"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="669235752"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Date: Sat, 12 Nov 2022 23:57:32 -0800
Message-Id: <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 51 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.h               |  1 +
 include/uapi/drm/i915_drm.h                   |  3 +-
 4 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index d87d1210365b..36651b447966 100644
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
index 7cf77c67d755..483d25f2425c 100644
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
@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
 	spin_unlock_irq(&gt->closed_lock);
 }
 
-static void force_unbind(struct i915_vma *vma)
+static void force_unbind(struct i915_vma *vma, bool async)
 {
 	if (!drm_mm_node_allocated(&vma->node))
 		return;
@@ -1727,7 +1729,21 @@ static void force_unbind(struct i915_vma *vma)
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
 
@@ -1787,7 +1803,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
 {
 	lockdep_assert_held(&vma->vm->mutex);
 
-	force_unbind(vma);
+	force_unbind(vma, false);
 	list_del_init(&vma->vm_link);
 	release_references(vma, vma->vm->gt, false);
 }
@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
 	bool vm_ddestroy;
 
 	mutex_lock(&vma->vm->mutex);
-	force_unbind(vma);
+	force_unbind(vma, false);
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
+	force_unbind(vma, async);
 	list_del_init(&vma->vm_link);
 	vm_ddestroy = vma->vm_ddestroy;
 	vma->vm_ddestroy = false;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 737ef310d046..25f15965dab8 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
 
 void i915_vma_destroy_locked(struct i915_vma *vma);
 void i915_vma_destroy(struct i915_vma *vma);
+void i915_vma_destroy_async(struct i915_vma *vma);
 
 #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e5600f358a15..431d40bb1dee 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
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

