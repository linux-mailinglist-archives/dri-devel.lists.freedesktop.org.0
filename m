Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA661EDA0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E83710E28E;
	Mon,  7 Nov 2022 08:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54C510E26F;
 Mon,  7 Nov 2022 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811147; x=1699347147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/OBZMCCpzm66W5WZnViqcQM8j24RDqUDnxw2zKRfKk=;
 b=U83UDB15J4h9SIjb8uIuzLnRJmmItvM3hw+Og7Ma/XRCeOOnF14oHWDD
 I20QX4REgiqtxDllRVojd6c4O1VY8Ys70Ks0b7ivn1E2ppyJccGeo0/GL
 5vst4s4MIbDVDGl0kMv4y2dlX1MlXU8PM+yCpd8FRWo9W8QTbqKccZ0pA
 sZZTGQdTyMoutBlijsOeFnFTal8ZQq5dXSzhWJ8NfjlkTVFQgJDkj+P15
 hQcX47eeosAh3Ldf6iJDzwNTCYf2yOnhCw94zVjLrxysQ0NTexhOi7FJN
 oura2iRI2BSsx5UQmuatp87kB1u1djnsFGMe8jTqe22I76/mCYa2r2r9v w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="374613950"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="374613950"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984656"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984656"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:26 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 16/20] drm/i915/vm_bind: userptr dma-resv changes
Date: Mon,  7 Nov 2022 00:52:06 -0800
Message-Id: <20221107085210.17221-17-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
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

For persistent (vm_bind) vmas of userptr BOs, handle the user
page pinning by using the i915_gem_object_userptr_submit_init()
/done() functions

v2: Do not double add vma to vm->userptr_invalidated_list
v3: Initialize vma->userptr_invalidated_link

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 84 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 19 +++++
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 15 ++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +
 drivers/gpu/drm/i915/i915_vma.c               |  1 +
 drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
 7 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
index d91c2e96cd0f..895d4f0a2647 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
@@ -20,6 +20,7 @@
 #include "i915_gem_vm_bind.h"
 #include "i915_trace.h"
 
+#define __EXEC3_USERPTR_USED		BIT_ULL(34)
 #define __EXEC3_HAS_PIN			BIT_ULL(33)
 #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
 #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
@@ -144,7 +145,22 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
 {
 	struct i915_vma *vma, *vn;
 
-	/**
+#ifdef CONFIG_MMU_NOTIFIER
+	/*
+	 * Move all invalidated userptr vmas back into vm_bind_list so that
+	 * they are looked up and revalidated.
+	 */
+	spin_lock(&vm->userptr_invalidated_lock);
+	list_for_each_entry_safe(vma, vn, &vm->userptr_invalidated_list,
+				 userptr_invalidated_link) {
+		list_del_init(&vma->userptr_invalidated_link);
+		if (!list_empty(&vma->vm_bind_link))
+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
+	}
+	spin_unlock(&vm->userptr_invalidated_lock);
+#endif
+
+	/*
 	 * Move all unbound vmas back into vm_bind_list so that they are
 	 * revalidated.
 	 */
@@ -157,10 +173,47 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
 	spin_unlock(&vm->vm_rebind_lock);
 }
 
+static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer *eb)
+{
+	struct i915_address_space *vm = eb->context->vm;
+	struct i915_vma *last_vma = NULL;
+	struct i915_vma *vma;
+	int err;
+
+	lockdep_assert_held(&vm->vm_bind_lock);
+
+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
+		if (!i915_gem_object_is_userptr(vma->obj))
+			continue;
+
+		err = i915_gem_object_userptr_submit_init(vma->obj);
+		if (err)
+			return err;
+
+		/*
+		 * The above submit_init() call does the object unbind and
+		 * hence adds vma into vm_rebind_list. Remove it from that
+		 * list as it is already scooped for revalidation.
+		 */
+		spin_lock(&vm->vm_rebind_lock);
+		if (!list_empty(&vma->vm_rebind_link))
+			list_del_init(&vma->vm_rebind_link);
+		spin_unlock(&vm->vm_rebind_lock);
+
+		last_vma = vma;
+	}
+
+	if (last_vma)
+		eb->args->flags |= __EXEC3_USERPTR_USED;
+
+	return 0;
+}
+
 static int eb_lookup_vma_all(struct i915_execbuffer *eb)
 {
 	struct i915_vma *vma;
 	unsigned int i;
+	int err = 0;
 
 	for (i = 0; i < eb->num_batches; i++) {
 		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
@@ -172,6 +225,10 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
 
 	eb_scoop_unbound_vma_all(eb->context->vm);
 
+	err = eb_lookup_persistent_userptr_vmas(eb);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -344,6 +401,29 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
 		}
 	}
 
+#ifdef CONFIG_MMU_NOTIFIER
+	/* Check for further userptr invalidations */
+	spin_lock(&vm->userptr_invalidated_lock);
+	if (!list_empty(&vm->userptr_invalidated_list))
+		err = -EAGAIN;
+	spin_unlock(&vm->userptr_invalidated_lock);
+
+	if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
+		read_lock(&eb->i915->mm.notifier_lock);
+		list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
+			if (!i915_gem_object_is_userptr(vma->obj))
+				continue;
+
+			err = i915_gem_object_userptr_submit_done(vma->obj);
+			if (err)
+				break;
+		}
+		read_unlock(&eb->i915->mm.notifier_lock);
+	}
+#endif
+	if (unlikely(err))
+		goto err_skip;
+
 	/* Unconditionally flush any chipset caches (for streaming writes). */
 	intel_gt_chipset_flush(eb->gt);
 
@@ -691,7 +771,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	if (err)
 		goto err_validate;
 
-	/**
+	/*
 	 * No object unbinds possible once the objects are locked. So,
 	 * check for any unbinds here, which needs to be scooped up.
 	 *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index ca7a388ba2bf..38be6ce82600 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -63,6 +63,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 {
 	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_vma *vma;
 	long r;
 
 	if (!mmu_notifier_range_blockable(range))
@@ -85,6 +86,24 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 	if (current->flags & PF_EXITING)
 		return true;
 
+	/**
+	 * Add persistent vmas into userptr_invalidated list for relookup
+	 * and revalidation.
+	 */
+	spin_lock(&obj->vma.lock);
+	list_for_each_entry(vma, &obj->vma.list, obj_link) {
+		if (!i915_vma_is_persistent(vma))
+			continue;
+
+		spin_lock(&vma->vm->userptr_invalidated_lock);
+		if (list_empty(&vma->userptr_invalidated_link) &&
+		    !i915_vma_is_purged(vma))
+			list_add_tail(&vma->userptr_invalidated_link,
+				      &vma->vm->userptr_invalidated_list);
+		spin_unlock(&vma->vm->userptr_invalidated_lock);
+	}
+	spin_unlock(&obj->vma.lock);
+
 	/* we will unbind on next submission, still have userptr pins */
 	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
 				  MAX_SCHEDULE_TIMEOUT);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 6396fd1dc520..8532e87399ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -306,6 +306,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		goto put_obj;
 	}
 
+	if (i915_gem_object_is_userptr(obj)) {
+		ret = i915_gem_object_userptr_submit_init(obj);
+		if (ret)
+			goto put_obj;
+	}
+
 	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
 	if (ret)
 		goto put_obj;
@@ -335,6 +341,15 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		if (ret)
 			continue;
 
+#ifdef CONFIG_MMU_NOTIFIER
+		if (i915_gem_object_is_userptr(obj)) {
+			read_lock(&vm->i915->mm.notifier_lock);
+			ret = i915_gem_object_userptr_submit_done(obj);
+			read_unlock(&vm->i915->mm.notifier_lock);
+			if (ret)
+				continue;
+		}
+#endif
 		/* If out fence is not requested, wait for bind to complete */
 		if (!(va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
 			ret = i915_vma_wait_for_bind(vma);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index ebf8fc3a4603..50648ab9214a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -292,6 +292,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
 	INIT_LIST_HEAD(&vm->vm_rebind_list);
 	spin_lock_init(&vm->vm_rebind_lock);
+	spin_lock_init(&vm->userptr_invalidated_lock);
+	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index b5a5b68adb32..08a18603b93a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -270,6 +270,10 @@ struct i915_address_space {
 	struct list_head vm_rebind_list;
 	/** @vm_rebind_lock: protects vm_rebound_list */
 	spinlock_t vm_rebind_lock;
+	/** @userptr_invalidated_list: list of invalidated userptr vmas */
+	struct list_head userptr_invalidated_list;
+	/** @userptr_invalidated_lock: protects userptr_invalidated_list */
+	spinlock_t userptr_invalidated_lock;
 	/** @va: tree of persistent vmas */
 	struct rb_root_cached va;
 	/** @non_priv_vm_bind_list: list of non-private object mappings */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index f73955aef16a..08218e3a2f12 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -243,6 +243,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	INIT_LIST_HEAD(&vma->vm_bind_link);
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
 	INIT_LIST_HEAD(&vma->vm_rebind_link);
+	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
 	return vma;
 
 err_unlock:
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 7c8c293ddfcb..90471dc0b235 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -307,6 +307,8 @@ struct i915_vma {
 	struct list_head non_priv_vm_bind_link;
 	/** @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
+	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
+	struct list_head userptr_invalidated_link;
 
 	/** Timeline fence for vm_bind completion notification */
 	struct {
-- 
2.21.0.rc0.32.g243a4c7e27

