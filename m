Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC8458A7D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 09:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE5689C25;
	Mon, 22 Nov 2021 08:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340A189BAE;
 Mon, 22 Nov 2021 08:23:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="221627463"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="221627463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:23:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="606331872"
Received: from marlonpr-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:23:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/6] drm/i915: Add support for moving fence waiting
Date: Mon, 22 Nov 2021 09:22:47 +0100
Message-Id: <20211122082252.223689-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082252.223689-1-thomas.hellstrom@linux.intel.com>
References: <20211122082252.223689-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

For now, we will only allow async migration when TTM is used,
so the paths we care about are related to TTM.

The mmap path is handled by having the fence in ttm_bo->moving,
when pinning, the binding only becomes available after the moving
fence is signaled, and pinning a cpu map will only work after
the moving fence signals.

This should close all holes where userspace can read a buffer
before it's fully migrated.

v2:
- Fix a couple of SPARSE warnings
v3:
- Fix a NULL pointer dereference
v4:
- Ditch the moving fence waiting for i915_vma_pin_iomap() and
  replace with a verification that the vma is already bound.
  (Matthew Auld)
- Squash with a previous patch introducing moving fence waiting and
  accessing interfaces (Matthew Auld)
- Rename to indicated that we also add support for sync waiting.
v5:
- Fix check for NULL and unreferencing i915_vma_verify_bind_complete()
  (Matthew Auld)
- Fix compilation failure if !CONFIG_DRM_I915_DEBUG_GEM
- Fix include ordering. (Matthew Auld)

Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 52 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  6 +++
 drivers/gpu/drm/i915/gem/i915_gem_pages.c  |  6 +++
 drivers/gpu/drm/i915/i915_vma.c            | 39 +++++++++++++++-
 4 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 591ee3cb7275..24f83c432350 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -31,6 +31,7 @@
 #include "i915_gem_context.h"
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
+#include "i915_gem_ttm.h"
 #include "i915_memcpy.h"
 #include "i915_trace.h"
 
@@ -726,6 +727,57 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 	.export = i915_gem_prime_export,
 };
 
+/**
+ * i915_gem_object_get_moving_fence - Get the object's moving fence if any
+ * @obj: The object whose moving fence to get.
+ *
+ * A non-signaled moving fence means that there is an async operation
+ * pending on the object that needs to be waited on before setting up
+ * any GPU- or CPU PTEs to the object's pages.
+ *
+ * Return: A refcounted pointer to the object's moving fence if any,
+ * NULL otherwise.
+ */
+struct dma_fence *
+i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
+{
+	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
+}
+
+/**
+ * i915_gem_object_wait_moving_fence - Wait for the object's moving fence if any
+ * @obj: The object whose moving fence to wait for.
+ * @intr: Whether to wait interruptible.
+ *
+ * If the moving fence signaled without an error, it is detached from the
+ * object and put.
+ *
+ * Return: 0 if successful, -ERESTARTSYS if the wait was interrupted,
+ * negative error code if the async operation represented by the
+ * moving fence failed.
+ */
+int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
+				      bool intr)
+{
+	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
+	int ret;
+
+	assert_object_held(obj);
+	if (!fence)
+		return 0;
+
+	ret = dma_fence_wait(fence, intr);
+	if (ret)
+		return ret;
+
+	if (fence->error)
+		return fence->error;
+
+	i915_gem_to_ttm(obj)->moving = NULL;
+	dma_fence_put(fence);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 133963b46135..66f20b803b01 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -517,6 +517,12 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
+struct dma_fence *
+i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
+
+int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
+				      bool intr);
+
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index c4f684b7cc51..49c6e55c68ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -418,6 +418,12 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	}
 
 	if (!ptr) {
+		err = i915_gem_object_wait_moving_fence(obj, true);
+		if (err) {
+			ptr = ERR_PTR(err);
+			goto err_unpin;
+		}
+
 		if (GEM_WARN_ON(type == I915_MAP_WC &&
 				!static_cpu_has(X86_FEATURE_PAT)))
 			ptr = ERR_PTR(-ENODEV);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index e2f2c4c52009..48a170cfd157 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -353,6 +353,28 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
 	return err;
 }
 
+static int i915_vma_verify_bind_complete(struct i915_vma *vma)
+{
+	int err = 0;
+
+	if (i915_active_has_exclusive(&vma->active)) {
+		struct dma_fence *fence =
+			i915_active_fence_get(&vma->active.excl);
+
+		if (!fence)
+			return 0;
+
+		if (dma_fence_is_signaled(fence))
+			err = fence->error;
+		else
+			err = -EBUSY;
+
+		dma_fence_put(fence);
+	}
+
+	return err;
+}
+
 /**
  * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding address space.
  * @vma: VMA to map
@@ -425,6 +447,13 @@ int i915_vma_bind(struct i915_vma *vma,
 		__i915_gem_object_pin_pages(vma->obj);
 		work->pinned = i915_gem_object_get(vma->obj);
 	} else {
+		if (vma->obj) {
+			int ret;
+
+			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
+			if (ret)
+				return ret;
+		}
 		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
 	}
 
@@ -446,6 +475,7 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 	GEM_BUG_ON(!i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND));
+	GEM_BUG_ON(i915_vma_verify_bind_complete(vma));
 
 	ptr = READ_ONCE(vma->iomap);
 	if (ptr == NULL) {
@@ -861,6 +891,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		    u64 size, u64 alignment, u64 flags)
 {
 	struct i915_vma_work *work = NULL;
+	struct dma_fence *moving = NULL;
 	intel_wakeref_t wakeref = 0;
 	unsigned int bound;
 	int err;
@@ -886,7 +917,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	if (flags & PIN_GLOBAL)
 		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
 
-	if (flags & vma->vm->bind_async_flags) {
+	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
+	if (flags & vma->vm->bind_async_flags || moving) {
 		/* lock VM */
 		err = i915_vm_lock_objects(vma->vm, ww);
 		if (err)
@@ -900,6 +932,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 		work->vm = i915_vm_get(vma->vm);
 
+		dma_fence_work_chain(&work->base, moving);
+
 		/* Allocate enough page directories to used PTE */
 		if (vma->vm->allocate_va_range) {
 			err = i915_vm_alloc_pt_stash(vma->vm,
@@ -1004,7 +1038,10 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 err_rpm:
 	if (wakeref)
 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
+	if (moving)
+		dma_fence_put(moving);
 	vma_put_pages(vma);
+
 	return err;
 }
 
-- 
2.31.1

