Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715745A39D5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFBB10ED44;
	Sat, 27 Aug 2022 19:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5010ED34;
 Sat, 27 Aug 2022 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629565; x=1693165565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hh5KfJN0hef+PH0SmPzcBHw1/WVVmZ3FxuEKFHsF7DU=;
 b=Xu0QTL820ouCAmgLANQUMjGFFvK3cZ4vuJNZpH+9XWynXU8QIKoWXPQp
 snJquTC4bjs0F8yRuEqDRtD3YBAj9L/KslYCuDoAk6PqNgLv/t6nlUqks
 Iqp8SJmFb8aZT+TvGsc31zahz0G4kibOZEuZoNm5LAr9YFMU4EI972rix
 UgnZOstXqgBwtQFFd38SnYrSQ9t3xiPwAnTxw5HieEaZZritYMYKBK6bI
 cXdZ/HcPb7+sUGm+mPTNJKKBdrLgc5au/UiFEkHjmmFBsWbJ2E0n4Tu5B
 q0VXOOl2J/bdG4Wxd9jB46J2KNtJ4kntuNjLUhNXW59CBOoshPC965Nto A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="358652606"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="358652606"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="644009410"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 07/17] drm/i915/vm_bind: Handle persistent vmas
Date: Sat, 27 Aug 2022 21:43:53 +0200
Message-Id: <20220827194403.6495-8-andi.shyti@linux.intel.com>
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

Treat VM_BIND vmas as persistent across execbuf ioctl calls and handle
them during the request submission in the execbuff path.

Support eviction by maintaining a list of evicted persistent vmas
for rebinding during next submission.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  1 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  8 +++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++
 drivers/gpu/drm/i915/i915_gem_gtt.c           | 38 +++++++++++++
 drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +
 drivers/gpu/drm/i915/i915_vma.c               | 50 +++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.h               | 56 +++++++++++++++----
 drivers/gpu/drm/i915/i915_vma_types.h         | 24 ++++++++
 9 files changed, 169 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 389e9f157ca5e..825dce41f7113 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -38,6 +38,7 @@
 #include "i915_gem_mman.h"
 #include "i915_gem_object.h"
 #include "i915_gem_ttm.h"
+#include "i915_gem_vm_bind.h"
 #include "i915_memcpy.h"
 #include "i915_trace.h"
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 9ff929f187cfd..3b45529fe8d4c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -91,6 +91,13 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 {
 	lockdep_assert_held(&vma->vm->vm_bind_lock);
 
+	spin_lock(&vma->vm->vm_rebind_lock);
+	if (!list_empty(&vma->vm_rebind_link))
+		list_del_init(&vma->vm_rebind_link);
+	i915_vma_set_purged(vma);
+	i915_vma_set_freed(vma);
+	spin_unlock(&vma->vm->vm_rebind_lock);
+
 	if (!list_empty(&vma->vm_bind_link)) {
 		list_del_init(&vma->vm_bind_link);
 		list_del_init(&vma->non_priv_vm_bind_link);
@@ -190,6 +197,7 @@ static struct i915_vma *vm_bind_get_vma(struct i915_address_space *vm,
 
 	vma->start = va->start;
 	vma->last = va->start + va->length - 1;
+	i915_vma_set_persistent(vma);
 
 	return vma;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index c4f75826213ae..97cd0089b516d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -296,6 +296,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
 	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
 	GEM_BUG_ON(IS_ERR(vm->root_obj));
+	INIT_LIST_HEAD(&vm->vm_rebind_list);
+	spin_lock_init(&vm->vm_rebind_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 9a2665e4ec2e5..1f3b1967ec175 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -265,6 +265,10 @@ struct i915_address_space {
 	struct list_head vm_bind_list;
 	/** @vm_bound_list: List of vm_binding completed */
 	struct list_head vm_bound_list;
+	/* @vm_rebind_list: list of vmas to be rebinded */
+	struct list_head vm_rebind_list;
+	/* @vm_rebind_lock: protects vm_rebound_list */
+	spinlock_t vm_rebind_lock;
 	/* @va: tree of persistent vmas */
 	struct rb_root_cached va;
 	struct list_head non_priv_vm_bind_list;
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 329ff75b80b97..f083724163deb 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -25,6 +25,44 @@
 #include "i915_trace.h"
 #include "i915_vgpu.h"
 
+/**
+ * i915_vm_sync() - Wait for all requests on private vmas of a vm to be completed
+ * @vm: address space we need to wait for idle
+ *
+ * Waits till all requests of the vm_binded private objs are completed.
+ *
+ * Returns: 0 on success -ve errcode on failure
+ */
+int i915_vm_sync(struct i915_address_space *vm)
+{
+	int ret;
+
+	/* Wait for all requests under this vm to finish */
+	ret = dma_resv_wait_timeout(vm->root_obj->base.resv,
+				    DMA_RESV_USAGE_BOOKKEEP, false,
+				    MAX_SCHEDULE_TIMEOUT);
+	if (ret < 0)
+		return ret;
+	else if (ret > 0)
+		return 0;
+	else
+		return -ETIMEDOUT;
+}
+
+/**
+ * i915_vm_is_active() - Check for activeness of requests of vm
+ * @vm: address spece targetted
+ *
+ * Check whether all the requests related private vmas are completed or not
+ *
+ * Returns: True when requests are not completed yet. Flase otherwise.
+ */
+bool i915_vm_is_active(const struct i915_address_space *vm)
+{
+	return !dma_resv_test_signaled(vm->root_obj->base.resv,
+				       DMA_RESV_USAGE_BOOKKEEP);
+}
+
 int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index 8c2f57eb5ddaa..a5bbdc59d9dfb 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -51,4 +51,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 
 #define PIN_OFFSET_MASK		I915_GTT_PAGE_MASK
 
+int i915_vm_sync(struct i915_address_space *vm);
+bool i915_vm_is_active(const struct i915_address_space *vm);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 239346e0c07f2..0eb7727d62a6f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -237,6 +237,7 @@ vma_create(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
+	INIT_LIST_HEAD(&vma->vm_rebind_link);
 	return vma;
 
 err_unlock:
@@ -387,8 +388,31 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
 	return err;
 }
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
-static int i915_vma_verify_bind_complete(struct i915_vma *vma)
+/**
+ * i915_vma_sync() - Wait for the vma to be idle
+ * @vma: vma to be tested
+ *
+ * Returns 0 on success and error code on failure
+ */
+int i915_vma_sync(struct i915_vma *vma)
+{
+	int ret;
+
+	/* Wait for the asynchronous bindings and pending GPU reads */
+	ret = i915_active_wait(&vma->active);
+	if (ret || !i915_vma_is_persistent(vma) || i915_vma_is_purged(vma))
+		return ret;
+
+	return i915_vm_sync(vma->vm);
+}
+
+/**
+ * i915_vma_verify_bind_complete() - Check for the vm_bind completion of the vma
+ * @vma: vma submitted for vm_bind
+ *
+ * Returns: 0 if the vm_bind is completed. Error code otherwise.
+ */
+int i915_vma_verify_bind_complete(struct i915_vma *vma)
 {
 	struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
 	int err;
@@ -405,9 +429,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 
 	return err;
 }
-#else
-#define i915_vma_verify_bind_complete(_vma) 0
-#endif
 
 I915_SELFTEST_EXPORT void
 i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
@@ -1654,6 +1675,13 @@ static void force_unbind(struct i915_vma *vma)
 	if (!drm_mm_node_allocated(&vma->node))
 		return;
 
+	/*
+	 * Mark persistent vma as purged to avoid it waiting
+	 * for VM to be released.
+	 */
+	if (i915_vma_is_persistent(vma))
+		i915_vma_set_purged(vma);
+
 	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
 	WARN_ON(__i915_vma_unbind(vma));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
@@ -1846,6 +1874,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	int err;
 
 	assert_object_held(obj);
+	if (i915_vma_is_persistent(vma))
+		return -EINVAL;
 
 	GEM_BUG_ON(!vma->pages);
 
@@ -2014,6 +2044,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	__i915_vma_evict(vma, false);
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
+
+	if (i915_vma_is_persistent(vma)) {
+		spin_lock(&vma->vm->vm_rebind_lock);
+		if (list_empty(&vma->vm_rebind_link) &&
+		    !i915_vma_is_purged(vma))
+			list_add_tail(&vma->vm_rebind_link,
+				      &vma->vm->vm_rebind_list);
+		spin_unlock(&vma->vm->vm_rebind_lock);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 15eac55a3e274..bf0b5b4abd919 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -47,12 +47,6 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
-
-static inline bool i915_vma_is_active(const struct i915_vma *vma)
-{
-	return !i915_active_is_idle(&vma->active);
-}
-
 /* do not reserve memory to prevent deadlocks */
 #define __EXEC_OBJECT_NO_RESERVE BIT(31)
 
@@ -138,6 +132,48 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
 	return i915_vm_to_ggtt(vma->vm)->pin_bias;
 }
 
+static inline bool i915_vma_is_persistent(const struct i915_vma *vma)
+{
+	return test_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
+}
+
+static inline void i915_vma_set_persistent(struct i915_vma *vma)
+{
+	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
+}
+
+static inline bool i915_vma_is_purged(const struct i915_vma *vma)
+{
+	return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
+}
+
+static inline void i915_vma_set_purged(struct i915_vma *vma)
+{
+	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
+}
+
+static inline bool i915_vma_is_freed(const struct i915_vma *vma)
+{
+	return test_bit(I915_VMA_FREED_BIT, __i915_vma_flags(vma));
+}
+
+static inline void i915_vma_set_freed(struct i915_vma *vma)
+{
+	set_bit(I915_VMA_FREED_BIT, __i915_vma_flags(vma));
+}
+
+static inline bool i915_vma_is_active(const struct i915_vma *vma)
+{
+	if (i915_vma_is_persistent(vma)) {
+		if (i915_vma_is_purged(vma))
+			return false;
+
+		return i915_vm_is_active(vma->vm);
+	}
+
+	return !i915_active_is_idle(&vma->active);
+}
+
 static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
 {
 	i915_gem_object_get(vma->obj);
@@ -406,12 +442,8 @@ void i915_vma_make_shrinkable(struct i915_vma *vma);
 void i915_vma_make_purgeable(struct i915_vma *vma);
 
 int i915_vma_wait_for_bind(struct i915_vma *vma);
-
-static inline int i915_vma_sync(struct i915_vma *vma)
-{
-	/* Wait for the asynchronous bindings and pending GPU reads */
-	return i915_active_wait(&vma->active);
-}
+int i915_vma_verify_bind_complete(struct i915_vma *vma);
+int i915_vma_sync(struct i915_vma *vma);
 
 /**
  * i915_vma_get_current_resource - Get the current resource of the vma
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index de5534d518cdd..5483ccf0c82c7 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -264,6 +264,28 @@ struct i915_vma {
 #define I915_VMA_SCANOUT_BIT	17
 #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
 
+  /**
+   * I915_VMA_PERSISTENT_BIT:
+   * The vma is persistent (created with VM_BIND call).
+   *
+   * I915_VMA_PURGED_BIT:
+   * The persistent vma is force unbound either due to VM_UNBIND call
+   * from UMD or VM is released. Do not check/wait for VM activeness
+   * in i915_vma_is_active() and i915_vma_sync() calls.
+   *
+   * I915_VMA_FREED_BIT:
+   * The persistent vma is being released by UMD via VM_UNBIND call.
+   * While releasing the vma, do not take VM_BIND lock as VM_UNBIND call
+   * already holds the lock.
+   */
+#define I915_VMA_PERSISTENT_BIT	19
+#define I915_VMA_PURGED_BIT	20
+#define I915_VMA_FREED_BIT	21
+
+#define I915_VMA_PERSISTENT	((int)BIT(I915_VMA_PERSISTENT_BIT))
+#define I915_VMA_PURGED		((int)BIT(I915_VMA_PURGED_BIT))
+#define I915_VMA_FREED		((int)BIT(I915_VMA_FREED_BIT))
+
 	struct i915_active active;
 
 #define I915_VMA_PAGES_BIAS 24
@@ -293,6 +315,8 @@ struct i915_vma {
 	struct list_head vm_bind_link;
 	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
 	struct list_head non_priv_vm_bind_link;
+	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
+	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 
 	/** Interval tree structures for persistent vma */
 
-- 
2.34.1

