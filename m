Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2B563C94
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63E11265B;
	Fri,  1 Jul 2022 22:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B844F11255E;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3CQ28+tk3FAO6P5gUSxnKk7+KI8tOH4ZaOvfKCZrxU=;
 b=DShfl8xWE8w30W/VQ5qV5fVZe2kvM4gZti7w+vANc8L506noNBeafgiS
 RLKUebF0YA21RSItmSonDb+ZIxbI9QW9oMB++/YcPYxB2sORVOuyI53GY
 CgosOmTfeoRArbCMvB5iPEjAq+au5jsswqBK6k+941d8xAiX/bciXMPdr
 r56cJzHzjXo/dMoqr83srOL+oB/tbfa8vzmQVnaeVgi0sK/Lt6YQzr62S
 4uWsopCg2f8GyXTeGQ1f3bATdkHjs8nNjLg0uJFhXM3JHxQHrPMuvQ5pP
 Ls3aJn54ffbYnQYQQLgFVgAzJBbrC2cCWQ8YdbddLc/Nxa9EjukW0VIC4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789054"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789054"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645105"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 07/10] drm/i915/vm_bind: Handle persistent vmas in execbuf3
Date: Fri,  1 Jul 2022 15:50:52 -0700
Message-Id: <20220701225055.8204-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle persistent (VM_BIND) mappings during the request submission
in the execbuf3 path.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 176 +++++++++++++++++-
 1 file changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
index 13121df72e3d..2079f5ca9010 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
@@ -22,6 +22,7 @@
 #include "i915_gem_vm_bind.h"
 #include "i915_trace.h"
 
+#define __EXEC3_HAS_PIN			BIT_ULL(33)
 #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
 #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
 
@@ -45,7 +46,9 @@
  * execlist. Hence, no support for implicit sync.
  *
  * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
- * works with execbuf3 ioctl for submission.
+ * works with execbuf3 ioctl for submission. All BOs mapped on that VM (through
+ * VM_BIND call) at the time of execbuf3 call are deemed required for that
+ * submission.
  *
  * The execbuf3 ioctl directly specifies the batch addresses instead of as
  * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
@@ -61,6 +64,13 @@
  * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
  * vma lookup table, implicit sync, vma active reference tracking etc., are not
  * applicable for execbuf3 ioctl.
+ *
+ * During each execbuf submission, request fence is added to all VM_BIND mapped
+ * objects with DMA_RESV_USAGE_BOOKKEEP. The DMA_RESV_USAGE_BOOKKEEP usage will
+ * prevent over sync (See enum dma_resv_usage). Note that DRM_I915_GEM_WAIT and
+ * DRM_I915_GEM_BUSY ioctls do not check for DMA_RESV_USAGE_BOOKKEEP usage and
+ * hence should not be used for end of batch check. Instead, the execbuf3
+ * timeline out fence should be used for end of batch check.
  */
 
 struct eb_fence {
@@ -124,6 +134,19 @@ eb_find_vma(struct i915_address_space *vm, u64 addr)
 	return i915_gem_vm_bind_lookup_vma(vm, va);
 }
 
+static void eb_scoop_unbound_vmas(struct i915_address_space *vm)
+{
+	struct i915_vma *vma, *vn;
+
+	spin_lock(&vm->vm_rebind_lock);
+	list_for_each_entry_safe(vma, vn, &vm->vm_rebind_list, vm_rebind_link) {
+		list_del_init(&vma->vm_rebind_link);
+		if (!list_empty(&vma->vm_bind_link))
+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
+	}
+	spin_unlock(&vm->vm_rebind_lock);
+}
+
 static int eb_lookup_vmas(struct i915_execbuffer *eb)
 {
 	unsigned int i, current_batch = 0;
@@ -138,11 +161,118 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 		++current_batch;
 	}
 
+	eb_scoop_unbound_vmas(eb->context->vm);
+
+	return 0;
+}
+
+static int eb_lock_vmas(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma;
+	int err;
+
+	err = i915_gem_vm_priv_lock(eb->context->vm, &eb->ww);
+	if (err)
+		return err;
+
+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
+			    non_priv_vm_bind_link) {
+		err = i915_gem_object_lock(vma->obj, &eb->ww);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
+static void eb_release_persistent_vmas(struct i915_execbuffer *eb, bool final)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma, *vn;
+
+	assert_vm_bind_held(vm);
+
+	if (!(eb->args->flags & __EXEC3_HAS_PIN))
+		return;
+
+	assert_vm_priv_held(vm);
+
+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link)
+		__i915_vma_unpin(vma);
+
+	eb->args->flags &= ~__EXEC3_HAS_PIN;
+	if (!final)
+		return;
+
+	list_for_each_entry_safe(vma, vn, &vm->vm_bind_list, vm_bind_link)
+		if (i915_vma_is_bind_complete(vma))
+			list_move_tail(&vma->vm_bind_link, &vm->vm_bound_list);
+}
+
 static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
 {
+	eb_release_persistent_vmas(eb, final);
+	eb_unpin_engine(eb);
+}
+
+static int eb_reserve_fence_for_persistent_vmas(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma;
+	int ret;
+
+	ret = dma_resv_reserve_fences(vm->root_obj->base.resv, 1);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
+			    non_priv_vm_bind_link) {
+		ret = dma_resv_reserve_fences(vma->obj->base.resv, 1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int eb_validate_persistent_vmas(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma, *last_pinned_vma = NULL;
+	int ret = 0;
+
+	assert_vm_bind_held(vm);
+	assert_vm_priv_held(vm);
+
+	ret = eb_reserve_fence_for_persistent_vmas(eb);
+	if (ret)
+		return ret;
+
+	if (list_empty(&vm->vm_bind_list))
+		return 0;
+
+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
+		u64 pin_flags = vma->start | PIN_OFFSET_FIXED | PIN_USER;
+
+		ret = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
+		if (ret)
+			break;
+
+		last_pinned_vma = vma;
+	}
+
+	if (ret && last_pinned_vma) {
+		list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
+			__i915_vma_unpin(vma);
+			if (vma == last_pinned_vma)
+				break;
+		}
+	} else if (last_pinned_vma) {
+		eb->args->flags |= __EXEC3_HAS_PIN;
+	}
+
+	return ret;
 }
 
 static int eb_validate_vmas(struct i915_execbuffer *eb)
@@ -162,8 +292,17 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 	/* only throttle once, even if we didn't need to throttle */
 	throttle = false;
 
+	err = eb_lock_vmas(eb);
+	if (err)
+		goto err;
+
+	err = eb_validate_persistent_vmas(eb);
+	if (err)
+		goto err;
+
 err:
 	if (err == -EDEADLK) {
+		eb_release_vmas(eb, false);
 		err = i915_gem_ww_ctx_backoff(&eb->ww);
 		if (!err)
 			goto retry;
@@ -187,8 +326,43 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 	BUILD_BUG_ON(!typecheck(int, _i)); \
 	for ((_i) = (_eb)->num_batches - 1; (_i) >= 0; --(_i))
 
+static void __eb_persistent_add_shared_fence(struct drm_i915_gem_object *obj,
+					     struct dma_fence *fence)
+{
+	dma_resv_add_fence(obj->base.resv, fence, DMA_RESV_USAGE_BOOKKEEP);
+	obj->write_domain = 0;
+	obj->read_domains |= I915_GEM_GPU_DOMAINS;
+	obj->mm.dirty = true;
+}
+
+static void eb_persistent_add_shared_fence(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct dma_fence *fence;
+	struct i915_vma *vma;
+
+	fence = eb->composite_fence ? eb->composite_fence :
+		&eb->requests[0]->fence;
+
+	__eb_persistent_add_shared_fence(vm->root_obj, fence);
+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
+			    non_priv_vm_bind_link)
+		__eb_persistent_add_shared_fence(vma->obj, fence);
+}
+
+static void eb_persistent_vmas_move_to_active(struct i915_execbuffer *eb)
+{
+	/* Add fence to BOs dma-resv fence list */
+	eb_persistent_add_shared_fence(eb);
+}
+
 static int eb_move_to_gpu(struct i915_execbuffer *eb)
 {
+	assert_vm_bind_held(eb->context->vm);
+	assert_vm_priv_held(eb->context->vm);
+
+	eb_persistent_vmas_move_to_active(eb);
+
 	/* Unconditionally flush any chipset caches (for streaming writes). */
 	intel_gt_chipset_flush(eb->gt);
 
-- 
2.21.0.rc0.32.g243a4c7e27

