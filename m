Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCD6065CD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA7010E23C;
	Thu, 20 Oct 2022 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD610E23C;
 Thu, 20 Oct 2022 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666283403; x=1697819403;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FD31vWHBiaYmAKg1AGgIvj8lx8FNa/gdNajWLxCav18=;
 b=EC1XyRMOUroFWG0t/PnVIxEovFIkGYC42HqiU0/hgud+qGvKNho+A6mD
 OBvqJjoNaf73GovXU7Rfb2SI0bMOdSMnMBOk1G3ohAO+un9FPJPnftjmH
 W2I04pcNn/WLV2pOcLjj3SC68Ae+/JEnIM9iBhzx1wnyx1RUwLla/hlUv
 VgUaX14GiRIQ6xGQbaIUjfqS4iG7i9CQ4kcgMfhLFXlem6VdoI1ron7QX
 m6wPwCKVG6bxc0mMT+PEpe+mpgUO6xIdvxRkXzKzaxD80bh7Wtm2foXDE
 UghNq3Wa+Sow6WxIgWyhEcQD8IYTgf0J8BGzXK0yvFPXg42LulPT1IqF+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287165937"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="287165937"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:29:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="581006383"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="581006383"
Received: from tcarvalx-mobl.ger.corp.intel.com (HELO [10.252.12.144])
 ([10.252.12.144])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:29:47 -0700
Message-ID: <d43ebcd0-724e-af24-1e4f-199b82414f38@intel.com>
Date: Thu, 20 Oct 2022 17:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 16/17] drm/i915/vm_bind: userptr dma-resv changes
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-17-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> For persistent (vm_bind) vmas of userptr BOs, handle the user
> page pinning by using the i915_gem_object_userptr_submit_init()
> /done() functions
> 
> v2: Do not double add vma to vm->userptr_invalidated_list
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 80 +++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 19 +++++
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    | 15 ++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +
>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>   6 files changed, 122 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> index 8120e4c6b7da..3f1157dd7fc2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
> @@ -20,6 +20,7 @@
>   #include "i915_gem_vm_bind.h"
>   #include "i915_trace.h"
>   
> +#define __EXEC3_USERPTR_USED		BIT_ULL(34)
>   #define __EXEC3_HAS_PIN			BIT_ULL(33)
>   #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>   #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
> @@ -142,6 +143,21 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>   {
>   	struct i915_vma *vma, *vn;
>   
> +#ifdef CONFIG_MMU_NOTIFIER
> +	/**

Not proper kernel-doc AFAIK.

> +	 * Move all invalidated userptr vmas back into vm_bind_list so that
> +	 * they are looked up and revalidated.
> +	 */
> +	spin_lock(&vm->userptr_invalidated_lock);
> +	list_for_each_entry_safe(vma, vn, &vm->userptr_invalidated_list,
> +				 userptr_invalidated_link) {
> +		list_del_init(&vma->userptr_invalidated_link);
> +		if (!list_empty(&vma->vm_bind_link))
> +			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
> +	}
> +	spin_unlock(&vm->userptr_invalidated_lock);
> +#endif
> +
>   	/**
>   	 * Move all unbound vmas back into vm_bind_list so that they are
>   	 * revalidated.
> @@ -155,10 +171,47 @@ static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>   	spin_unlock(&vm->vm_rebind_lock);
>   }
>   
> +static int eb_lookup_persistent_userptr_vmas(struct i915_execbuffer *eb)
> +{
> +	struct i915_address_space *vm = eb->context->vm;
> +	struct i915_vma *last_vma = NULL;
> +	struct i915_vma *vma;
> +	int err;
> +
> +	lockdep_assert_held(&vm->vm_bind_lock);
> +
> +	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
> +		if (!i915_gem_object_is_userptr(vma->obj))
> +			continue;
> +
> +		err = i915_gem_object_userptr_submit_init(vma->obj);
> +		if (err)
> +			return err;
> +
> +		/**
> +		 * The above submit_init() call does the object unbind and
> +		 * hence adds vma into vm_rebind_list. Remove it from that
> +		 * list as it is already scooped for revalidation.
> +		 */

Ditto.

> +		spin_lock(&vm->vm_rebind_lock);
> +		if (!list_empty(&vma->vm_rebind_link))
> +			list_del_init(&vma->vm_rebind_link);
> +		spin_unlock(&vm->vm_rebind_lock);
> +
> +		last_vma = vma;
> +	}
> +
> +	if (last_vma)
> +		eb->args->flags |= __EXEC3_USERPTR_USED;
> +
> +	return 0;
> +}
> +
>   static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>   {
>   	unsigned int i, current_batch = 0;
>   	struct i915_vma *vma;
> +	int err = 0;
>   
>   	for (i = 0; i < eb->num_batches; i++) {
>   		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
> @@ -171,6 +224,10 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>   
>   	eb_scoop_unbound_vma_all(eb->context->vm);
>   
> +	err = eb_lookup_persistent_userptr_vmas(eb);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> @@ -343,6 +400,29 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
>   		}
>   	}
>   
> +#ifdef CONFIG_MMU_NOTIFIER
> +	/* Check for further userptr invalidations */
> +	spin_lock(&vm->userptr_invalidated_lock);
> +	if (!list_empty(&vm->userptr_invalidated_list))
> +		err = -EAGAIN;
> +	spin_unlock(&vm->userptr_invalidated_lock);

After dropping the lock here, the invalidated_list might no longer be 
empty? Is that not possible, or somehow not a concern?

> +
> +	if (!err && (eb->args->flags & __EXEC3_USERPTR_USED)) {
> +		read_lock(&eb->i915->mm.notifier_lock);
> +		list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
> +			if (!i915_gem_object_is_userptr(vma->obj))
> +				continue;
> +
> +			err = i915_gem_object_userptr_submit_done(vma->obj);
> +			if (err)
> +				break;
> +		}
> +		read_unlock(&eb->i915->mm.notifier_lock);
> +	}
> +#endif
> +	if (unlikely(err))
> +		goto err_skip;
> +
>   	/* Unconditionally flush any chipset caches (for streaming writes). */
>   	intel_gt_chipset_flush(eb->gt);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index b7e24476a0fd..3e88fd4d46b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -63,6 +63,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
>   {
>   	struct drm_i915_gem_object *obj = container_of(mni, struct drm_i915_gem_object, userptr.notifier);
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct i915_vma *vma;
>   	long r;
>   
>   	if (!mmu_notifier_range_blockable(range))
> @@ -85,6 +86,24 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
>   	if (current->flags & PF_EXITING)
>   		return true;
>   
> +	/**
> +	 * Add persistent vmas into userptr_invalidated list for relookup
> +	 * and revalidation.
> +	 */

Ditto.

> +	spin_lock(&obj->vma.lock);
> +	list_for_each_entry(vma, &obj->vma.list, obj_link) {
> +		if (!i915_vma_is_persistent(vma))
> +			continue;
> +
> +		spin_lock(&vma->vm->userptr_invalidated_lock);
> +		if (list_empty(&vma->userptr_invalidated_link) &&
> +		    !i915_vma_is_purged(vma))
> +			list_add_tail(&vma->userptr_invalidated_link,
> +				      &vma->vm->userptr_invalidated_list);
> +		spin_unlock(&vma->vm->userptr_invalidated_lock);
> +	}
> +	spin_unlock(&obj->vma.lock);
> +
>   	/* we will unbind on next submission, still have userptr pins */
>   	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
>   				  MAX_SCHEDULE_TIMEOUT);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 63889ba00183..19071493355c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -299,6 +299,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>   		goto put_obj;
>   	}
>   
> +	if (i915_gem_object_is_userptr(obj)) {
> +		ret = i915_gem_object_userptr_submit_init(obj);
> +		if (ret)
> +			goto put_obj;
> +	}
> +
>   	ret = mutex_lock_interruptible(&vm->vm_bind_lock);
>   	if (ret)
>   		goto put_obj;
> @@ -327,6 +333,15 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>   		if (ret)
>   			continue;
>   
> +#ifdef CONFIG_MMU_NOTIFIER
> +		if (i915_gem_object_is_userptr(obj)) {
> +			read_lock(&vm->i915->mm.notifier_lock);
> +			ret = i915_gem_object_userptr_submit_done(obj);
> +			read_unlock(&vm->i915->mm.notifier_lock);
> +			if (ret)
> +				continue;
> +		}
> +#endif
>   		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>   		i915_vm_bind_it_insert(vma, &vm->va);
>   		if (!obj->priv_root)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index ebf8fc3a4603..50648ab9214a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -292,6 +292,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>   	INIT_LIST_HEAD(&vm->vm_rebind_list);
>   	spin_lock_init(&vm->vm_rebind_lock);
> +	spin_lock_init(&vm->userptr_invalidated_lock);
> +	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 384d1ee7c68d..1ade95b2a0fa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -270,6 +270,10 @@ struct i915_address_space {
>   	struct list_head vm_rebind_list;
>   	/* @vm_rebind_lock: protects vm_rebound_list */
>   	spinlock_t vm_rebind_lock;
> +	/* @userptr_invalidated_list: list of invalidated userptr vmas */
> +	struct list_head userptr_invalidated_list;
> +	/* @userptr_invalidated_lock: protects userptr_invalidated_list */
> +	spinlock_t userptr_invalidated_lock;
>   	/* @va: tree of persistent vmas */
>   	struct rb_root_cached va;
>   	struct list_head non_priv_vm_bind_list;
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index 2c740500ac1b..8e562e07d4a7 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -307,6 +307,8 @@ struct i915_vma {
>   	struct list_head non_priv_vm_bind_link;
>   	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>   	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
> +	/*@userptr_invalidated_link: link to the vm->userptr_invalidated_list */
> +	struct list_head userptr_invalidated_link;
>   
>   	/** Timeline fence for vm_bind completion notification */
>   	struct {
