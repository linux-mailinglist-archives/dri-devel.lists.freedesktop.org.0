Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F185F9F65
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 15:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360010E500;
	Mon, 10 Oct 2022 13:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D110E500;
 Mon, 10 Oct 2022 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665408656; x=1696944656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3b1ZsSKV5ty8y1x4uomuHQioeFhXdCPH2J4yUZ+VxOc=;
 b=ZQo2T84IjNal3xRsWWT66s9xyBQUv4Zf+XEGlAESYALXN+ZBB3fR1UpH
 myLHeOYsy2E0W4sfPjdUHfEQ2Cs4iSKxAUmU2eWcvtm4C2qnVE7vjsL3W
 cOQ3lkaKXgI/sMuBSCd861GtyGZW4qKBqSuOuXq9RTxuGEBuUolyoVkfI
 dyUoHFVGTHms5aKZWpuw1eEpc8RpWCj9N7ZMYsiTO9q5aTMERQpdFIQJB
 VXRhpVI7gBqWvXkWaXH/PgJmD0lhzXQzvGgA2++KnqUlEHANTPFJnj9z9
 wtyFlqGr1gDHy5XEabnA6wLUJ9UZeOlYHp+VdOs7dHIWgcVhRKMc+ZINt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="390532004"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390532004"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 06:30:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="801075505"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="801075505"
Received: from ikonopko-mobl1.ger.corp.intel.com (HELO [10.252.24.191])
 ([10.252.24.191])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 06:30:51 -0700
Message-ID: <b7bbe2fa-9dab-8a6d-bda0-a505ae0660dc@intel.com>
Date: Mon, 10 Oct 2022 14:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 07/17] drm/i915/vm_bind: Add support to handle object
 evictions
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-8-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221010065826.32037-8-niranjana.vishwanathapura@intel.com>
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

On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
> Support eviction by maintaining a list of evicted persistent vmas
> for rebinding during next submission. Ensure the list do not
> include persistent vmas that are being purged.
> 
> v2: Remove unused I915_VMA_PURGED definition.
> v3: Properly handle __i915_vma_unbind_async() case.
> 
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    |  6 ++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 ++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +++
>   drivers/gpu/drm/i915/i915_vma.c               | 31 +++++++++++++++++--
>   drivers/gpu/drm/i915/i915_vma.h               | 10 ++++++
>   drivers/gpu/drm/i915/i915_vma_types.h         |  8 +++++
>   6 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 8e3e6ceb9442..c435d49af2c8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -85,6 +85,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>   {
>   	lockdep_assert_held(&vma->vm->vm_bind_lock);
>   
> +	spin_lock(&vma->vm->vm_rebind_lock);
> +	if (!list_empty(&vma->vm_rebind_link))
> +		list_del_init(&vma->vm_rebind_link);
> +	i915_vma_set_purged(vma);
> +	spin_unlock(&vma->vm->vm_rebind_lock);
> +
>   	list_del_init(&vma->vm_bind_link);
>   	list_del_init(&vma->non_priv_vm_bind_link);
>   	i915_vm_bind_it_remove(vma, &vma->vm->va);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 422394f8fb40..2fa37f46750b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -295,6 +295,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	INIT_LIST_HEAD(&vm->vm_bound_list);
>   	mutex_init(&vm->vm_bind_lock);
>   	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
> +	INIT_LIST_HEAD(&vm->vm_rebind_list);
> +	spin_lock_init(&vm->vm_rebind_lock);
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4ae5734f7d6b..443d1918ad4e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -265,6 +265,10 @@ struct i915_address_space {
>   	struct list_head vm_bind_list;
>   	/** @vm_bound_list: List of vm_binding completed */
>   	struct list_head vm_bound_list;
> +	/* @vm_rebind_list: list of vmas to be rebinded */
> +	struct list_head vm_rebind_list;
> +	/* @vm_rebind_lock: protects vm_rebound_list */
> +	spinlock_t vm_rebind_lock;
>   	/* @va: tree of persistent vmas */
>   	struct rb_root_cached va;
>   	struct list_head non_priv_vm_bind_list;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 5d3d67a4bf47..b4be2cbe8382 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -241,6 +241,7 @@ vma_create(struct drm_i915_gem_object *obj,
>   
>   	INIT_LIST_HEAD(&vma->vm_bind_link);
>   	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
> +	INIT_LIST_HEAD(&vma->vm_rebind_link);
>   	return vma;
>   
>   err_unlock:
> @@ -1686,6 +1687,14 @@ static void force_unbind(struct i915_vma *vma)
>   	if (!drm_mm_node_allocated(&vma->node))
>   		return;
>   
> +	/*
> +	 * Persistent vma should have been purged by now.
> +	 * If not, issue a warning and purge it.
> +	 */
> +	if (GEM_WARN_ON(i915_vma_is_persistent(vma) &&
> +			!i915_vma_is_purged(vma)))
> +		i915_vma_set_purged(vma);
> +
>   	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>   	WARN_ON(__i915_vma_unbind(vma));
>   	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
> @@ -2047,6 +2056,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
>   	__i915_vma_evict(vma, false);
>   
>   	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
> +
> +	if (i915_vma_is_persistent(vma)) {
> +		spin_lock(&vma->vm->vm_rebind_lock);
> +		if (list_empty(&vma->vm_rebind_link) &&
> +		    !i915_vma_is_purged(vma))
> +			list_add_tail(&vma->vm_rebind_link,
> +				      &vma->vm->vm_rebind_list);
> +		spin_unlock(&vma->vm->vm_rebind_lock);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -2059,8 +2078,7 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
>   	if (!drm_mm_node_allocated(&vma->node))
>   		return NULL;
>   
> -	if (i915_vma_is_pinned(vma) ||
> -	    &vma->obj->mm.rsgt->table != vma->resource->bi.pages)

Hmm that's looks interesting. IIRC we only keep a ref on the rsgt for 
the object pages, and not the vma->bi.pages, where the vma pages can be 
destroyed before the async unbind completes, which I guess was the idea 
behind this check.

But in practice it looks the vma->bi.pages are always just some subset 
or rearrangement of the objects rsgt pages, if not the same table, so 
the device mapping pointed at by the PTEs should still be valid here 
(assuming rsgt in not NULL), even if bi.pages gets nuked? I guess this 
change should rather be a patch by itself, with proper explanation in 
commit message, since this looks mostly orthogonal?

> +	if (i915_vma_is_pinned(vma))
>   		return ERR_PTR(-EAGAIN);
>   
>   	/*
> @@ -2082,6 +2100,15 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
>   
>   	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
>   
> +	if (i915_vma_is_persistent(vma)) {
> +		spin_lock(&vma->vm->vm_rebind_lock);
> +		if (list_empty(&vma->vm_rebind_link) &&
> +		    !i915_vma_is_purged(vma))
> +			list_add_tail(&vma->vm_rebind_link,
> +				      &vma->vm->vm_rebind_list);
> +		spin_unlock(&vma->vm->vm_rebind_lock);
> +	}
> +
>   	return fence;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index c5378ec2f70a..9a4a7a8dfe5b 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -152,6 +152,16 @@ static inline void i915_vma_set_persistent(struct i915_vma *vma)
>   	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
>   }
>   
> +static inline bool i915_vma_is_purged(const struct i915_vma *vma)
> +{
> +	return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline void i915_vma_set_purged(struct i915_vma *vma)
> +{
> +	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
> +}
> +
>   static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
>   {
>   	i915_gem_object_get(vma->obj);
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index b8176cca58c0..d32c72e8d242 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -267,8 +267,14 @@ struct i915_vma {
>   /**
>    * I915_VMA_PERSISTENT_BIT:
>    * The vma is persistent (created with VM_BIND call).
> + *
> + * I915_VMA_PURGED_BIT:
> + * The persistent vma is force unbound either due to VM_UNBIND call
> + * from UMD or VM is released. Do not check/wait for VM activeness
> + * in i915_vma_is_active() and i915_vma_sync() calls.
>    */
>   #define I915_VMA_PERSISTENT_BIT	19
> +#define I915_VMA_PURGED_BIT	20
>   
>   	struct i915_active active;
>   
> @@ -299,6 +305,8 @@ struct i915_vma {
>   	struct list_head vm_bind_link;
>   	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
>   	struct list_head non_priv_vm_bind_link;
> +	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
> +	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>   
>   	/** Interval tree structures for persistent vma */
>   
