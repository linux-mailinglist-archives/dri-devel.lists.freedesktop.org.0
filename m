Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212D4A70F1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D310E47B;
	Wed,  2 Feb 2022 12:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6B10E461;
 Wed,  2 Feb 2022 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643805674; x=1675341674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vyG8VuXEcvGm/e81uJctTpyK4hxApysW/bWTav2L+o8=;
 b=nI9adOXuAR6AhSSBBbA548UlrTPT9sI4h/6uXG8LZkpZQ0yPhbLJ2RCa
 gGJEQC4iLBCr2KV9O6gCegiTNKrXxgWAFdMtyKqhI4jD+E5TmDvlXDjS2
 icurvMTWlcUOJUtEohfWTpdNtCLf2GGSesPQCPeXwcrDkfZRcc6eGvSTn
 TPA+5klea5jBPGM6LZJioS5FTF0d9vqm3wE/wugn1rXxL5q8RPnapYpV2
 Te1LMbFNw807eOhpW4Hjuem1u2iqDxDE2TvmBnx5rzD5vPB68UsWZSuvZ
 JT4pp/g+gdZahmVb6xtjECLznJmdJHKACHU3VBgiUsOx1Er3D7MeiXnq+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="245500768"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="245500768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 04:41:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="620135152"
Received: from xwan118-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.236])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 04:41:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/i915: Fix vma lifetime
Date: Wed,  2 Feb 2022 13:40:55 +0100
Message-Id: <20220202124056.317693-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
 matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unclear what reference the initial vma refcount refers to. A vma can
have multiple weak references, the object vma list, the vm's bound list
and the gt's closed_list, and that initial vma refcount can be put from
lookups of all these lists. The problem is that if another user is also
holding another vma refcount, removal of other weak references will not
happen and that initial vma refcount may be put again,
causing refcount underflow.

In addition, putting the initial reference will not stop anyone from
calling i915_vma_close() which may put the vma back on the gt's closed
list, from which it is never removed so when the vma is finally freed,
the list becomes corrupted. From what I can tell this never happens in
the current code, because __i915_vm_close() is never called from gem
context close due to a vm open-count inconsistency which saves us here.

Introduce a selftest that illustrates the problems mentioned above.

Also fix this by re-introducing i915_vma_destroy() which removes all
weak references of the vma and *then* puts the initial vma refcount.
Perhaps a better name would be i915_vma_revoke() or i915_vma_zombify(),
since other callers may still hold a refcount, but with the prospect of
being able to replace that with the object lock in the near future,
let's stick with i915_vma_destroy().

The newly introduced selftest produces the following output without
the introduced fixes:

[  316.077020] i915: Running i915_vma_mock_selftests/igt_vma_lifetime
[  316.083261] Refcount = 2. Now closing vm.
[  316.087708] Refcount = 1. Now closing vma.
[  316.091858] i915_vma_close() caused list corruption.
[  316.096824] Refcount = 1. Now freeing obj.
[  316.101073] Refcount = 0. Now freeing vma.
[  316.105180] ------------[ cut here ]------------
[  316.109819] refcount_t: underflow; use-after-free.
[  316.114632] WARNING: CPU: 1 PID: 7701 at lib/refcount.c:28 refcount_warn_saturate+0xa6/0xf0

Fixes: 76f9764cc3d5 ("drm/i915: Introduce a vma.kref")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 14 +---
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 17 ++--
 drivers/gpu/drm/i915/i915_vma.c               | 79 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h               |  3 +
 drivers/gpu/drm/i915/selftests/i915_vma.c     | 69 ++++++++++++++++
 6 files changed, 152 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index e03e362d320b..78c4cbe82031 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -267,12 +267,6 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	if (!list_empty(&obj->vma.list)) {
 		struct i915_vma *vma;
 
-		/*
-		 * Note that the vma keeps an object reference while
-		 * it is active, so it *should* not sleep while we
-		 * destroy it. Our debug code errs insits it *might*.
-		 * For the moment, play along.
-		 */
 		spin_lock(&obj->vma.lock);
 		while ((vma = list_first_entry_or_null(&obj->vma.list,
 						       struct i915_vma,
@@ -280,13 +274,7 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 			GEM_BUG_ON(vma->obj != obj);
 			spin_unlock(&obj->vma.lock);
 
-			/* Verify that the vma is unbound under the vm mutex. */
-			mutex_lock(&vma->vm->mutex);
-			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-			__i915_vma_unbind(vma);
-			mutex_unlock(&vma->vm->mutex);
-
-			__i915_vma_put(vma);
+			i915_vma_destroy(vma);
 
 			spin_lock(&obj->vma.lock);
 		}
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index ba29767348be..af36bffd064b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -167,7 +167,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
 
 out:
 	i915_gem_object_lock(obj, NULL);
-	__i915_vma_put(vma);
+	i915_vma_destroy(vma);
 	i915_gem_object_unlock(obj);
 	return err;
 }
@@ -264,7 +264,7 @@ static int check_partial_mappings(struct drm_i915_gem_object *obj,
 			return err;
 
 		i915_gem_object_lock(obj, NULL);
-		__i915_vma_put(vma);
+		i915_vma_destroy(vma);
 		i915_gem_object_unlock(obj);
 
 		if (igt_timeout(end_time,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 46be4197b93f..c9a24b021a7e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -105,14 +105,19 @@ void __i915_vm_close(struct i915_address_space *vm)
 	list_for_each_entry_safe(vma, vn, &vm->bound_list, vm_link) {
 		struct drm_i915_gem_object *obj = vma->obj;
 
-		/* Keep the obj (and hence the vma) alive as _we_ destroy it */
-		if (!kref_get_unless_zero(&obj->base.refcount))
+		if (!kref_get_unless_zero(&obj->base.refcount)) {
+			/*
+			 * Unbind the dying vma to ensure the bound_list
+			 * is completely drained. We leave the destruction to
+			 * the object destructor.
+			 */
+			atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+			WARN_ON(__i915_vma_unbind(vma));
 			continue;
+		}
 
-		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-		WARN_ON(__i915_vma_unbind(vma));
-		__i915_vma_put(vma);
-
+		/* Keep the obj (and hence the vma) alive as _we_ destroy it */
+		i915_vma_destroy_locked(vma);
 		i915_gem_object_put(obj);
 	}
 	GEM_BUG_ON(!list_empty(&vm->bound_list));
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7815850b644e..689a10286a9e 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1606,15 +1606,27 @@ void i915_vma_reopen(struct i915_vma *vma)
 void i915_vma_release(struct kref *ref)
 {
 	struct i915_vma *vma = container_of(ref, typeof(*vma), ref);
+
+	i915_vm_put(vma->vm);
+	i915_active_fini(&vma->active);
+	GEM_WARN_ON(vma->resource);
+	i915_vma_free(vma);
+}
+
+static inline void force_unbind(struct i915_vma *vma)
+{
+	if (!drm_mm_node_allocated(&vma->node))
+		return;
+
+	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
+	WARN_ON(__i915_vma_unbind(vma));
+	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
+}
+
+static inline void release_references(struct i915_vma *vma)
+{
 	struct drm_i915_gem_object *obj = vma->obj;
 
-	if (drm_mm_node_allocated(&vma->node)) {
-		mutex_lock(&vma->vm->mutex);
-		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-		WARN_ON(__i915_vma_unbind(vma));
-		mutex_unlock(&vma->vm->mutex);
-		GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
-	}
 	GEM_BUG_ON(i915_vma_is_active(vma));
 
 	spin_lock(&obj->vma.lock);
@@ -1624,11 +1636,49 @@ void i915_vma_release(struct kref *ref)
 	spin_unlock(&obj->vma.lock);
 
 	__i915_vma_remove_closed(vma);
-	i915_vm_put(vma->vm);
 
-	i915_active_fini(&vma->active);
-	GEM_WARN_ON(vma->resource);
-	i915_vma_free(vma);
+	__i915_vma_put(vma);
+}
+
+/**
+ * i915_vma_destroy_locked - Remove all weak reference to the vma and put
+ * the initial reference.
+ *
+ * This function should be called when it's decided the vma isn't needed
+ * anymore. The caller must assure that it doesn't race with another lookup
+ * plus destroy, typically by taking an appropriate reference.
+ *
+ * Current callsites are
+ * - __i915_gem_object_pages_fini()
+ * - __i915_vm_close() - Blocks the above function by taking a reference on
+ * the object.
+ * - __i915_vma_parked() - Blocks the above functions by taking an open-count on
+ * the vm and a reference on the object.
+ *
+ * Because of locks taken during destruction, a vma is also guaranteed to
+ * stay alive while the following locks are held if it was looked up while
+ * holding one of the locks:
+ * - vm->mutex
+ * - obj->vma.lock
+ * - gt->closed_lock
+ *
+ * A vma user can also temporarily keep the vma alive while holding a vma
+ * reference.
+ */
+void i915_vma_destroy_locked(struct i915_vma *vma)
+{
+	lockdep_assert_held(&vma->vm->mutex);
+
+	force_unbind(vma);
+	release_references(vma);
+}
+
+void i915_vma_destroy(struct i915_vma *vma)
+{
+	mutex_lock(&vma->vm->mutex);
+	force_unbind(vma);
+	mutex_unlock(&vma->vm->mutex);
+	release_references(vma);
 }
 
 void i915_vma_parked(struct intel_gt *gt)
@@ -1643,10 +1693,13 @@ void i915_vma_parked(struct intel_gt *gt)
 
 		/* XXX All to avoid keeping a reference on i915_vma itself */
 
-		if (!kref_get_unless_zero(&obj->base.refcount))
+		if (!kref_get_unless_zero(&obj->base.refcount)) {
+			list_del_init(&vma->closed_link);
 			continue;
+		}
 
 		if (!i915_vm_tryopen(vm)) {
+			list_del_init(&vma->closed_link);
 			i915_gem_object_put(obj);
 			continue;
 		}
@@ -1662,7 +1715,7 @@ void i915_vma_parked(struct intel_gt *gt)
 
 		if (i915_gem_object_trylock(obj, NULL)) {
 			INIT_LIST_HEAD(&vma->closed_link);
-			__i915_vma_put(vma);
+			i915_vma_destroy(vma);
 			i915_gem_object_unlock(obj);
 		} else {
 			/* back you go.. */
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 011af044ad4f..67ae7341c7e0 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -236,6 +236,9 @@ static inline void __i915_vma_put(struct i915_vma *vma)
 	kref_put(&vma->ref, i915_vma_release);
 }
 
+void i915_vma_destroy_locked(struct i915_vma *vma);
+void i915_vma_destroy(struct i915_vma *vma);
+
 #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
 static inline void i915_vma_lock(struct i915_vma *vma)
diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 0280605a2673..94aba0c48793 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -913,6 +913,74 @@ static int igt_vma_partial(void *arg)
 	return err;
 }
 
+static int igt_vma_lifetime(void *arg)
+{
+	struct i915_ggtt *ggtt = arg;
+	struct drm_i915_private *i915 = ggtt->vm.i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	struct i915_ppgtt *ppgtt = mock_ppgtt(i915, "refcount");
+	struct i915_address_space *vm;
+	bool refctd = 0;
+	int err = 0;
+
+	if (!ppgtt)
+		return -ENOMEM;
+
+	vm = &ppgtt->vm;
+	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
+	if (IS_ERR(obj)) {
+		err = PTR_ERR(obj);
+		goto out_obj;
+	}
+
+	vma = i915_vma_instance(obj, vm, NULL);
+	if (IS_ERR(vma)) {
+		err = PTR_ERR(vma);
+		goto out_vma;
+	}
+
+	atomic_set(&vma->open_count, 1);
+	err = i915_vma_pin(vma, 0, 0, PIN_USER);
+
+	__i915_vma_get(vma);
+	refctd = true;
+
+	/*
+	 * Now run vma close, vm close and obj unref, all wanting to
+	 * destroy the vma. The vma should survive until we put it
+	 * without any refcount underflow warning. Moving forward we might
+	 * be using object lock instead of the vma refcount, but then we'd
+	 * have to put the vma before object put ofc.
+	 */
+
+	pr_info("Refcount = %d. Now closing vm.\n", kref_read(&vma->ref));
+	__i915_vm_close(vm);
+	pr_info("Refcount = %d. Now closing vma.\n", kref_read(&vma->ref));
+	i915_vma_close(vma);
+	i915_vma_parked(vma->vm->gt);
+
+	/* Did i915_vma_parked forget to remove the vma from the list? */
+	if (i915_vma_is_closed(vma)) {
+		pr_err("i915_vma_close() caused list corruption.\n");
+		list_del_init(&vma->closed_link);
+		err = -EINVAL;
+	}
+
+	pr_info("Refcount = %d. Now freeing obj.\n", kref_read(&vma->ref));
+out_vma:
+	i915_gem_object_put(obj);
+	i915_gem_flush_free_objects(i915);
+	if (refctd) {
+		pr_info("Refcount = %d. Now freeing vma.\n", kref_read(&vma->ref));
+		__i915_vma_put(vma);
+	}
+out_obj:
+	i915_vm_put(vm);
+
+	return err;
+}
+
 int i915_vma_mock_selftests(void)
 {
 	static const struct i915_subtest tests[] = {
@@ -920,6 +988,7 @@ int i915_vma_mock_selftests(void)
 		SUBTEST(igt_vma_pin1),
 		SUBTEST(igt_vma_rotate_remap),
 		SUBTEST(igt_vma_partial),
+		SUBTEST(igt_vma_lifetime),
 	};
 	struct drm_i915_private *i915;
 	struct intel_gt *gt;
-- 
2.34.1

