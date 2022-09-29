Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C715EFBB5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8295110EB5D;
	Thu, 29 Sep 2022 17:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AECB10E031;
 Thu, 29 Sep 2022 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664471588; x=1696007588;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mHJ7EjZGMZivHPeM7T1TdttgMlQGgSqKXsjs0fuC6H8=;
 b=dMUQmHoq2gjDio2cb1oHNQHwx31zNOK2USv147BQFThO/0ccsrkiaLz5
 xGCZJu4X3S7rmcWd7I8vi9aOuJgJ99qui0rj3TKQUDho6QSEQk+hHzg3+
 rnWPDAc1gHttzqmk3eU1FpJOs0t0FsZ6ImcsK1wY+dspPvTckSdFr9j8y
 veDEkMW2XBDzDOnaEFaBPUwCdc2PvYp4KnqqdJKLYz7UvXdKlbj2Or2fy
 XRdooKQj4AmxRwobnD4LCX3/Yp9HhnYHtgrpl0/oR9Ia/bCIf+9xWaBLK
 zXR6zlQ6yUPQ/GJ+Ql63LTOa2IkWahYNYtkMKzGzYvU/cfArKLhk1zD11 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="282330423"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="282330423"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 10:13:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="617685568"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="617685568"
Received: from bpingot-mobl1.ger.corp.intel.com (HELO [10.252.6.106])
 ([10.252.6.106])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 10:13:04 -0700
Message-ID: <bd688113-a11a-c9fb-c4b0-f2012f8dc4d0@intel.com>
Date: Thu, 29 Sep 2022 18:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 07/16] drm/i915/vm_bind: Add support to handle object
 evictions
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-8-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-8-niranjana.vishwanathapura@intel.com>
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

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> Support eviction by maintaining a list of evicted persistent vmas
> for rebinding during next submission. Ensure the list do not
> include persistent vmas that are being purged.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    |  6 ++++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 ++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++++
>   drivers/gpu/drm/i915/i915_vma.c               | 19 +++++++++++++++++++
>   drivers/gpu/drm/i915/i915_vma.h               | 10 ++++++++++
>   drivers/gpu/drm/i915/i915_vma_types.h         | 10 ++++++++++
>   6 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 809c78455d2e..958139ed6da3 100644
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
> index da4f9dee0397..6db31197fa87 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -296,6 +296,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>   	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
>   	GEM_BUG_ON(IS_ERR(vm->root_obj));
> +	INIT_LIST_HEAD(&vm->vm_rebind_list);
> +	spin_lock_init(&vm->vm_rebind_lock);
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 3f2e87d3bf34..b73d35b4e05d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -273,6 +273,10 @@ struct i915_address_space {
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
> index 89c276163916..84ed3d1a17a6 100644
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
> @@ -2048,6 +2057,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
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
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 51e712de380a..48731855b5b0 100644
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
> index 3d5ffc3e666b..75b8af608ddb 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -267,9 +267,17 @@ struct i915_vma {
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
> +
>   #define I915_VMA_PERSISTENT	((int)BIT(I915_VMA_PERSISTENT_BIT))
> +#define I915_VMA_PURGED		((int)BIT(I915_VMA_PURGED_BIT))
>   
>   	struct i915_active active;
>   
> @@ -300,6 +308,8 @@ struct i915_vma {
>   	struct list_head vm_bind_link;
>   	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
>   	struct list_head non_priv_vm_bind_link;
> +	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
> +	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>   
>   	/** Interval tree structures for persistent vma */
>   
