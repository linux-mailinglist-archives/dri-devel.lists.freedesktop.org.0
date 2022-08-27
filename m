Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FF5A39DD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76BE10ED53;
	Sat, 27 Aug 2022 19:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F6B10ED4B;
 Sat, 27 Aug 2022 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629600; x=1693165600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UCrxiHNGTQkPpSuwTDnGBxVB+Oup1/hUdihJHIyr9wA=;
 b=jPXRK/ay3JdOvjvxEPu4TpqqjcNb5eOyO5lyIvY6VlA7NyHG4b3vTL9m
 n9imXJdBbXyTXY0qe08pygIwVI6PPHBa7VMCloJxZbL/Kjp+J2EClr/kG
 whPGp3SB2BK3dB78G496ZO/JqjmKUVj4HWVE1k7l8qh7c4Dgo0NlwfC11
 fWJ59eUDlN5ELSIJGS3rS3TQFOkSAtlw6lFRGky6VMnAhk3IF5vR0KpwM
 /evgdY6ONSW47IlXgS2g5vi2snwgyIAfYbRFGmiuiAVF82augXRLWkcjE
 MHluH9VKsC/e4CBt9mYhcMFZzhDzq/2Abh1m6vhEs7kI3My4nuq2MxGnT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="380989714"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="380989714"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="610891246"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 12/17] drm/i915/vm_bind: Handle persistent vmas in
 execbuf3
Date: Sat, 27 Aug 2022 21:43:58 +0200
Message-Id: <20220827194403.6495-13-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Handle persistent (VM_BIND) mappings during the request submission
in the execbuf3 path.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 200 +++++++++++++++++-
 1 file changed, 199 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
index a3d767cd9f808..8e0dde26194e0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/dma-resv.h>
+#include <linux/lockdep.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
 
@@ -22,6 +23,7 @@
 #include "i915_gem_vm_bind.h"
 #include "i915_trace.h"
 
+#define __EXEC3_HAS_PIN			BIT_ULL(33)
 #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
 #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
 
@@ -45,7 +47,9 @@
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
@@ -61,6 +65,13 @@
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
@@ -108,6 +119,7 @@ struct i915_execbuffer {
 };
 
 static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle);
+static void eb_unpin_engine(struct i915_execbuffer *eb);
 
 static int eb_select_context(struct i915_execbuffer *eb)
 {
@@ -132,6 +144,19 @@ eb_find_vma(struct i915_address_space *vm, u64 addr)
 	return i915_gem_vm_bind_lookup_vma(vm, va);
 }
 
+static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
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
 static int eb_lookup_vma_all(struct i915_execbuffer *eb)
 {
 	unsigned int i, current_batch = 0;
@@ -146,11 +171,119 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
 		++current_batch;
 	}
 
+	eb_scoop_unbound_vma_all(eb->context->vm);
+
 	return 0;
 }
 
+static int eb_lock_vma_all(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma;
+	int err;
+
+	err = i915_gem_object_lock(eb->context->vm->root_obj, &eb->ww);
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
+	return 0;
+}
+
+static void eb_release_persistent_vma_all(struct i915_execbuffer *eb,
+					  bool final)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma, *vn;
+
+	lockdep_assert_held(&vm->vm_bind_lock);
+
+	if (!(eb->args->flags & __EXEC3_HAS_PIN))
+		return;
+
+	assert_object_held(vm->root_obj);
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
 static void eb_release_vma_all(struct i915_execbuffer *eb, bool final)
 {
+	eb_release_persistent_vma_all(eb, final);
+	eb_unpin_engine(eb);
+}
+
+static int eb_reserve_fence_for_persistent_vma_all(struct i915_execbuffer *eb)
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
+static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *vma, *last_pinned_vma = NULL;
+	int ret = 0;
+
+	lockdep_assert_held(&vm->vm_bind_lock);
+	assert_object_held(vm->root_obj);
+
+	ret = eb_reserve_fence_for_persistent_vma_all(eb);
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
 
 static int eb_validate_vma_all(struct i915_execbuffer *eb)
@@ -160,6 +293,12 @@ static int eb_validate_vma_all(struct i915_execbuffer *eb)
 		int err;
 
 		err = eb_pin_engine(eb, throttle);
+		if (!err)
+			err = eb_lock_vma_all(eb);
+
+		if (!err)
+			err = eb_validate_persistent_vma_all(eb);
+
 		if (!err)
 			return 0;
 
@@ -189,8 +328,43 @@ static int eb_validate_vma_all(struct i915_execbuffer *eb)
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
+static void eb_move_all_persistent_vma_to_active(struct i915_execbuffer *eb)
+{
+	/* Add fence to BOs dma-resv fence list */
+	eb_persistent_add_shared_fence(eb);
+}
+
 static int eb_move_to_gpu(struct i915_execbuffer *eb)
 {
+	lockdep_assert_held(&eb->context->vm->vm_bind_lock);
+	assert_object_held(eb->context->vm->root_obj);
+
+	eb_move_all_persistent_vma_to_active(eb);
+
 	/* Unconditionally flush any chipset caches (for streaming writes). */
 	intel_gt_chipset_flush(eb->gt);
 
@@ -381,6 +555,30 @@ static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
 	return err;
 }
 
+static void eb_unpin_engine(struct i915_execbuffer *eb)
+{
+	struct intel_context *ce = eb->context, *child;
+
+	if (!(eb->args->flags & __EXEC3_ENGINE_PINNED))
+		return;
+
+	eb->args->flags &= ~__EXEC3_ENGINE_PINNED;
+
+	for_each_child(ce, child) {
+		mutex_lock(&child->timeline->mutex);
+		intel_context_exit(child);
+		mutex_unlock(&child->timeline->mutex);
+
+		intel_context_unpin(child);
+	}
+
+	mutex_lock(&ce->timeline->mutex);
+	intel_context_exit(ce);
+	mutex_unlock(&ce->timeline->mutex);
+
+	intel_context_unpin(ce);
+}
+
 static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
-- 
2.34.1

