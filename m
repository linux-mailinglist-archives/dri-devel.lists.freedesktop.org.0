Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF705A76DA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B964310E202;
	Wed, 31 Aug 2022 06:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8BB888D9;
 Wed, 31 Aug 2022 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661928338; x=1693464338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dhw53A8UVz42/eA9UMMVfX1TuLFNrM9zdLfo23lvjq4=;
 b=YEWPzzszXVugbc5IhzRVDV7EgIx8XpuKzd7INHoa2zvlq5sj9uGk4e3h
 hBivRvQ0z0YMPT8yEm3Qo9tKBhr19Pi0akOPymHdaRPvA9Itm0TW0IBsl
 lQXe8ApQiR2y5um0hRsGuQ3wo6cQS7dXh0uf6RrwprE5YpDSl7IR5lkMV
 kyTDdiF9uXwr6FAwOq1xAe5WbvoT52iCQQfvYsG4acM5YOzOKKO3FwhM9
 V07H+Zw/jOG164C9qKpw3zLhT6qF9hox7XtueD1L3QtP7kmRnXsTfioto
 uImRNQxFKL6vaY8gQZH6hit3xhlf/k8to+kDxP6JaijXKuDCGbqcv+tVK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="292962019"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="292962019"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:45:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="673231237"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:45:37 -0700
Date: Tue, 30 Aug 2022 23:45:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [RFC PATCH v3 13/17] drm/i915/vm_bind: userptr dma-resv changes
Message-ID: <20220831064515.GF10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-14-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220827194403.6495-14-andi.shyti@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 09:43:59PM +0200, Andi Shyti wrote:
>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>For persistent (vm_bind) vmas of userptr BOs, handle the user
>page pinning by using the i915_gem_object_userptr_submit_init()
>/done() functions
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 139 ++++++++++++++----
> drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  10 ++
> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  16 ++
> drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +
> drivers/gpu/drm/i915/gt/intel_gtt.h           |   4 +
> drivers/gpu/drm/i915/i915_vma_types.h         |   2 +
> 6 files changed, 142 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>index 8e0dde26194e0..72d6771da2113 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>@@ -23,6 +23,7 @@
> #include "i915_gem_vm_bind.h"
> #include "i915_trace.h"
>
>+#define __EXEC3_USERPTR_USED		BIT_ULL(34)
> #define __EXEC3_HAS_PIN			BIT_ULL(33)
> #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
> #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>@@ -157,10 +158,45 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
> 	spin_unlock(&vm->vm_rebind_lock);
> }
>
>+static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer *eb)
>+{
>+	struct i915_address_space *vm = eb->context->vm;
>+	struct i915_vma *last_vma = NULL;
>+	struct i915_vma *vma;
>+	int err;
>+
>+	lockdep_assert_held(&vm->vm_bind_lock);
>+
>+	list_for_each_entry(vma, &vm->vm_userptr_invalidated_list,
>+			    vm_userptr_invalidated_link) {
>+		list_del_init(&vma->vm_userptr_invalidated_link);
>+		err = i915_gem_object_userptr_submit_init(vma->obj);
>+		if (err)
>+			return err;
>+
>+		last_vma = vma;
>+	}

This should be done under the list lock. As it is a spinlock, we
should scoop them first under that spinlock and call submit_init()
outside that lock.

>+
>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link)
>+		if (i915_gem_object_is_userptr(vma->obj)) {
>+			err = i915_gem_object_userptr_submit_init(vma->obj);
>+			if (err)
>+				return err;
>+
>+			last_vma = vma;
>+		}
>+
>+	if (last_vma)
>+		eb->args->flags |= __EXEC3_USERPTR_USED;
>+
>+	return 0;
>+}
>+
> static int eb_lookup_vma_all(struct i915_execbuffer *eb)
> {
> 	unsigned int i, current_batch = 0;
> 	struct i915_vma *vma;
>+	int err = 0;
>
> 	for (i = 0; i < eb->num_batches; i++) {
> 		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
>@@ -171,6 +207,10 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
> 		++current_batch;
> 	}
>
>+	err = eb_lookup_persistent_userptr_vmas(eb);
>+	if (err)
>+		return err;
>+
> 	eb_scoop_unbound_vma_all(eb->context->vm);
>
> 	return 0;
>@@ -286,33 +326,6 @@ static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
> 	return ret;
> }
>
>-static int eb_validate_vma_all(struct i915_execbuffer *eb)
>-{
>-	/* only throttle once, even if we didn't need to throttle */
>-	for (bool throttle = true;; throttle = false) {
>-		int err;
>-
>-		err = eb_pin_engine(eb, throttle);
>-		if (!err)
>-			err = eb_lock_vma_all(eb);
>-
>-		if (!err)
>-			err = eb_validate_persistent_vma_all(eb);
>-
>-		if (!err)
>-			return 0;
>-
>-		if (err != -EDEADLK)
>-			return err;
>-
>-		err = i915_gem_ww_ctx_backoff(&eb->ww);
>-		if (err)
>-			return err;
>-	}
>-
>-	return 0;
>-}
>-
> /*
>  * Using two helper loops for the order of which requests / batches are created
>  * and added the to backend. Requests are created in order from the parent to
>@@ -360,15 +373,51 @@ static void eb_move_all_persistent_vma_to_active(struct i915_execbuffer *eb)
>
> static int eb_move_to_gpu(struct i915_execbuffer *eb)
> {
>+	int err = 0, j;
>+
> 	lockdep_assert_held(&eb->context->vm->vm_bind_lock);
> 	assert_object_held(eb->context->vm->root_obj);
>
> 	eb_move_all_persistent_vma_to_active(eb);
>
>-	/* Unconditionally flush any chipset caches (for streaming writes). */
>-	intel_gt_chipset_flush(eb->gt);
>+#ifdef CONFIG_MMU_NOTIFIER
>+	if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
>+		struct i915_vma *vma;
>
>-	return 0;
>+		lockdep_assert_held(&eb->context->vm->vm_bind_lock);
>+		assert_object_held(eb->context->vm->root_obj);
>+
>+		read_lock(&eb->i915->mm.notifier_lock);
>+		list_for_each_entry(vma, &eb->context->vm->vm_bind_list,
>+				    vm_bind_link) {
>+			if (!i915_gem_object_is_userptr(vma->obj))
>+				continue;
>+
>+			err = i915_gem_object_userptr_submit_done(vma->obj);
>+			if (err)
>+				break;
>+		}
>+
>+		read_unlock(&eb->i915->mm.notifier_lock);
>+	}
>+#endif
>+
>+	if (likely(!err)) {
>+		/*
>+		 * Unconditionally flush any
>+		 * chipset caches (for streaming writes).
>+		 */
>+		intel_gt_chipset_flush(eb->gt);
>+		return 0;
>+	}
>+
>+	for_each_batch_create_order(eb, j) {
>+		if (!eb->requests[j])
>+			break;
>+
>+		i915_request_set_error_once(eb->requests[j], err);
>+	}
>+	return err;
> }
>
> static int eb_request_submit(struct i915_execbuffer *eb,
>@@ -1088,6 +1137,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> {
> 	struct drm_i915_private *i915 = to_i915(dev);
> 	struct i915_execbuffer eb;
>+	bool throttle = true;
> 	int err;
>
> 	BUILD_BUG_ON(__EXEC3_INTERNAL_FLAGS & ~__I915_EXEC3_UNKNOWN_FLAGS);
>@@ -1121,6 +1171,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>
> 	mutex_lock(&eb.context->vm->vm_bind_lock);
>
>+lookup_vmas:
> 	err = eb_lookup_vma_all(&eb);
> 	if (err) {
> 		eb_release_vma_all(&eb, true);
>@@ -1129,7 +1180,33 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>
> 	i915_gem_ww_ctx_init(&eb.ww, true);
>
>-	err = eb_validate_vma_all(&eb);
>+retry_validate:
>+	err = eb_pin_engine(&eb, throttle);
>+	if (err)
>+		goto err_validate;
>+
>+	/* only throttle once, even if we didn't need to throttle */
>+	throttle = false;
>+
>+	err = eb_lock_vma_all(&eb);
>+	if (err)
>+		goto err_validate;
>+
>+	if (!list_empty(&eb.context->vm->vm_rebind_list)) {
>+		eb_release_vma_all(&eb, true);
>+		i915_gem_ww_ctx_fini(&eb.ww);
>+		goto lookup_vmas;
>+	}
>+
>+	err = eb_validate_persistent_vma_all(&eb);
>+
>+err_validate:
>+	if (err == -EDEADLK) {
>+		eb_release_vma_all(&eb, false);
>+		err = i915_gem_ww_ctx_backoff(&eb.ww);
>+		if (!err)
>+			goto retry_validate;
>+	}
> 	if (err)
> 		goto err_vma;
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>index 8423df021b713..f980d7443fa27 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>@@ -63,6 +63,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
> {
> 	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
> 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>+	struct i915_vma *vma;
> 	long r;
>
> 	if (!mmu_notifier_range_blockable(range))
>@@ -85,6 +86,15 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
> 	if (current->flags & PF_EXITING)
> 		return true;
>
>+	spin_lock(&obj->vma.lock);
>+	list_for_each_entry(vma, &obj->vma.list, obj_link) {
>+		spin_lock(&vma->vm->vm_userptr_invalidated_lock);
>+		list_add_tail(&vma->vm_userptr_invalidated_link,
>+			      &vma->vm->vm_userptr_invalidated_list);
>+		spin_unlock(&vma->vm->vm_userptr_invalidated_lock);

Should be done only if vma is persistent.

Niranjana

>+	}
>+	spin_unlock(&obj->vma.lock);
>+
> 	/* we will unbind on next submission, still have userptr pins */
> 	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
> 				  MAX_SCHEDULE_TIMEOUT);
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>index e57b9c492a7f9..e6216f49e7d58 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>@@ -296,6 +296,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		goto put_obj;
> 	}
>
>+	if (i915_gem_object_is_userptr(obj)) {
>+		ret = i915_gem_object_userptr_submit_init(obj);
>+		if (ret)
>+			goto put_obj;
>+	}
>+
> 	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
> 	if (ret)
> 		goto put_obj;
>@@ -328,6 +334,16 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> 		/* Make it evictable */
> 		__i915_vma_unpin(vma);
>
>+#ifdef CONFIG_MMU_NOTIFIER
>+		if (i915_gem_object_is_userptr(obj)) {
>+			read_lock(&vm->i915->mm.notifier_lock);
>+			ret = i915_gem_object_userptr_submit_done(obj);
>+			read_unlock(&vm->i915->mm.notifier_lock);
>+			if (ret)
>+				goto out_ww;
>+		}
>+#endif
>+
> 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
> 		i915_vm_bind_it_insert(vma, &vm->va);
> 		if (!obj->priv_root)
>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>index 97cd0089b516d..f1db8310de4a6 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>@@ -298,6 +298,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
> 	GEM_BUG_ON(IS_ERR(vm->root_obj));
> 	INIT_LIST_HEAD(&vm->vm_rebind_list);
> 	spin_lock_init(&vm->vm_rebind_lock);
>+	spin_lock_init(&vm->vm_userptr_invalidated_lock);
>+	INIT_LIST_HEAD(&vm->vm_userptr_invalidated_list);
> }
>
> void *__px_vaddr(struct drm_i915_gem_object *p)
>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>index 1f3b1967ec175..71203d65e1d60 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>@@ -269,6 +269,10 @@ struct i915_address_space {
> 	struct list_head vm_rebind_list;
> 	/* @vm_rebind_lock: protects vm_rebound_list */
> 	spinlock_t vm_rebind_lock;
>+	/* @vm_userptr_invalidated_list: list of invalidated userptr vmas */
>+	struct list_head vm_userptr_invalidated_list;
>+	/* @vm_userptr_invalidated_lock: protects vm_userptr_invalidated_list */
>+	spinlock_t vm_userptr_invalidated_lock;
> 	/* @va: tree of persistent vmas */
> 	struct rb_root_cached va;
> 	struct list_head non_priv_vm_bind_list;
>diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>index 8bf870a0f689b..5b583ca744387 100644
>--- a/drivers/gpu/drm/i915/i915_vma_types.h
>+++ b/drivers/gpu/drm/i915/i915_vma_types.h
>@@ -317,6 +317,8 @@ struct i915_vma {
> 	struct list_head non_priv_vm_bind_link;
> 	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
> 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>+	/*@vm_userptr_invalidated_link: link to the vm->vm_userptr_invalidated_list */
>+	struct list_head vm_userptr_invalidated_link;
>
> 	/** Timeline fence for vm_bind completion notification */
> 	struct {
>-- 
>2.34.1
>
