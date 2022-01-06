Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C54866AC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 16:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C0112987;
	Thu,  6 Jan 2022 15:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69405112984;
 Thu,  6 Jan 2022 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641482555; x=1673018555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aAgnvc/KzLhfCE+iTZh8l8gT8rLOjSjXKQ+tmKoJRgw=;
 b=A5LUXuX9dKS9z/DHTKJ6GFbYthf6uvFuj9MtPQ+CSQNF30RnvmabkmXf
 x+xOZQeBpucwfnRv8LvBAqXzYJ8V1MMshkVrVLlpoin9TxpgYRb6qw29V
 7J0BeLydlpGI8ev3AspfRodpdtHYuwxFSI/tph0NhMRDJ6dmMVy6Ua1EY
 5eHTvddqLEm8xjr8Bn+7BvYXSmNk3TAe9JfNKEr1/rz2mMq3z9os3aL5m
 Bohx7aAhz6C6iy/QTFxSFhViz5SzOz4WQ713RoUvDwp6XK4ZeVu7sbxkQ
 XrvQaLphKUGh7wdTHtDf2iB62DggI48DFyUzsz4MMEnND2zG4t4k4B6M4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="329017869"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="329017869"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 07:22:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="761184871"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO [10.249.65.184])
 ([10.249.65.184])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 07:22:31 -0800
Message-ID: <32e64ade-e4fc-7fb0-1f5d-cd9406c91bf6@intel.com>
Date: Thu, 6 Jan 2022 15:22:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 1/6] drm/i915: Initial introduction of vma resources
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
 <20220104125132.35179-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220104125132.35179-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2022 12:51, Thomas Hellström wrote:
> Introduce vma resources, sort of similar to TTM resources,  needed for
> asynchronous bind management. Initially we will use them to hold
> completion of unbinding when we capture data from a vma, but they will
> be used extensively in upcoming patches for asynchronous vma unbinding.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
>   drivers/gpu/drm/i915/i915_vma.c               |  55 +++++++-
>   drivers/gpu/drm/i915/i915_vma.h               |  19 ++-
>   drivers/gpu/drm/i915/i915_vma_resource.c      | 124 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_vma_resource.h      |  70 ++++++++++
>   drivers/gpu/drm/i915/i915_vma_snapshot.c      |  15 +--
>   drivers/gpu/drm/i915/i915_vma_snapshot.h      |   7 +-
>   drivers/gpu/drm/i915/i915_vma_types.h         |   5 +
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  99 ++++++++------
>   10 files changed, 334 insertions(+), 63 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.c
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_resource.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 1b62b9f65196..98433ad74194 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -174,6 +174,7 @@ i915-y += \
>   	  i915_trace_points.o \
>   	  i915_ttm_buddy_manager.o \
>   	  i915_vma.o \
> +	  i915_vma_resource.o \
>   	  i915_vma_snapshot.o \
>   	  intel_wopcm.o
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index e9541244027a..72e497745c12 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1422,7 +1422,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>   			mutex_lock(&vma->vm->mutex);
>   			err = i915_vma_bind(target->vma,
>   					    target->vma->obj->cache_level,
> -					    PIN_GLOBAL, NULL);
> +					    PIN_GLOBAL, NULL, NULL);
>   			mutex_unlock(&vma->vm->mutex);
>   			reloc_cache_remap(&eb->reloc_cache, ev->vma->obj);
>   			if (err)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index be208a8f1ed0..7097c5016431 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -37,6 +37,7 @@
>   #include "i915_sw_fence_work.h"
>   #include "i915_trace.h"
>   #include "i915_vma.h"
> +#include "i915_vma_resource.h"
>   
>   static struct kmem_cache *slab_vmas;
>   
> @@ -380,6 +381,8 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>    * @cache_level: mapping cache level
>    * @flags: flags like global or local mapping
>    * @work: preallocated worker for allocating and binding the PTE
> + * @vma_res: pointer to a preallocated vma resource. The resource is either
> + * consumed or freed.
>    *
>    * DMA addresses are taken from the scatter-gather table of this object (or of
>    * this VMA in case of non-default GGTT views) and PTE entries set up.
> @@ -388,7 +391,8 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>   int i915_vma_bind(struct i915_vma *vma,
>   		  enum i915_cache_level cache_level,
>   		  u32 flags,
> -		  struct i915_vma_work *work)
> +		  struct i915_vma_work *work,
> +		  struct i915_vma_resource *vma_res)
>   {
>   	u32 bind_flags;
>   	u32 vma_flags;
> @@ -399,11 +403,15 @@ int i915_vma_bind(struct i915_vma *vma,
>   
>   	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
>   					      vma->node.size,
> -					      vma->vm->total)))
> +					      vma->vm->total))) {
> +		kfree(vma_res);
>   		return -ENODEV;
> +	}
>   
> -	if (GEM_DEBUG_WARN_ON(!flags))
> +	if (GEM_DEBUG_WARN_ON(!flags)) {
> +		kfree(vma_res);
>   		return -EINVAL;
> +	}
>   
>   	bind_flags = flags;
>   	bind_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
> @@ -412,11 +420,21 @@ int i915_vma_bind(struct i915_vma *vma,
>   	vma_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
>   
>   	bind_flags &= ~vma_flags;
> -	if (bind_flags == 0)
> +	if (bind_flags == 0) {
> +		kfree(vma_res);
>   		return 0;
> +	}
>   
>   	GEM_BUG_ON(!atomic_read(&vma->pages_count));
>   
> +	if (vma->resource || !vma_res) {
> +		/* Rebinding with an additional I915_VMA_*_BIND */
> +		GEM_WARN_ON(!vma_flags);
> +		kfree(vma_res);
> +	} else {
> +		i915_vma_resource_init(vma_res);
> +		vma->resource = vma_res;
> +	}
>   	trace_i915_vma_bind(vma, bind_flags);
>   	if (work && bind_flags & vma->vm->bind_async_flags) {
>   		struct dma_fence *prev;
> @@ -1279,6 +1297,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   {
>   	struct i915_vma_work *work = NULL;
>   	struct dma_fence *moving = NULL;
> +	struct i915_vma_resource *vma_res = NULL;
>   	intel_wakeref_t wakeref = 0;
>   	unsigned int bound;
>   	int err;
> @@ -1333,6 +1352,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   		}
>   	}
>   
> +	vma_res = i915_vma_resource_alloc();
> +	if (IS_ERR(vma_res)) {
> +		err = PTR_ERR(vma_res);
> +		goto err_fence;
> +	}
> +
>   	/*
>   	 * Differentiate between user/kernel vma inside the aliasing-ppgtt.
>   	 *
> @@ -1353,7 +1378,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	err = mutex_lock_interruptible_nested(&vma->vm->mutex,
>   					      !(flags & PIN_GLOBAL));
>   	if (err)
> -		goto err_fence;
> +		goto err_vma_res;
>   
>   	/* No more allocations allowed now we hold vm->mutex */
>   
> @@ -1394,7 +1419,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	GEM_BUG_ON(!vma->pages);
>   	err = i915_vma_bind(vma,
>   			    vma->obj->cache_level,
> -			    flags, work);
> +			    flags, work, vma_res);
> +	vma_res = NULL;
>   	if (err)
>   		goto err_remove;
>   
> @@ -1417,6 +1443,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	i915_active_release(&vma->active);
>   err_unlock:
>   	mutex_unlock(&vma->vm->mutex);
> +err_vma_res:
> +	kfree(vma_res);
>   err_fence:
>   	if (work)
>   		dma_fence_work_commit_imm(&work->base);
> @@ -1567,6 +1595,7 @@ void i915_vma_release(struct kref *ref)
>   	i915_vm_put(vma->vm);
>   
>   	i915_active_fini(&vma->active);
> +	GEM_WARN_ON(vma->resource);
>   	i915_vma_free(vma);
>   }
>   
> @@ -1715,6 +1744,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
>   
>   void __i915_vma_evict(struct i915_vma *vma)
>   {
> +	struct dma_fence *unbind_fence;
> +
>   	GEM_BUG_ON(i915_vma_is_pinned(vma));
>   
>   	if (i915_vma_is_map_and_fenceable(vma)) {
> @@ -1752,8 +1783,20 @@ void __i915_vma_evict(struct i915_vma *vma)
>   	atomic_and(~(I915_VMA_BIND_MASK | I915_VMA_ERROR | I915_VMA_GGTT_WRITE),
>   		   &vma->flags);
>   
> +	unbind_fence = i915_vma_resource_unbind(vma->resource);
> +	i915_vma_resource_put(vma->resource);
> +	vma->resource = NULL;
> +
>   	i915_vma_detach(vma);
>   	vma_unbind_pages(vma);
> +
> +	/*
> +	 * This uninterruptible wait under the vm mutex is currently
> +	 * only ever blocking while the vma is being captured from.
> +	 * With async unbinding, this wait here will be removed.
> +	 */
> +	dma_fence_wait(unbind_fence, false);
> +	dma_fence_put(unbind_fence);
>   }
>   
>   int __i915_vma_unbind(struct i915_vma *vma)
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 32719431b3df..de0f3e44cdfa 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -37,6 +37,7 @@
>   
>   #include "i915_active.h"
>   #include "i915_request.h"
> +#include "i915_vma_resource.h"
>   #include "i915_vma_types.h"
>   
>   struct i915_vma *
> @@ -204,7 +205,8 @@ struct i915_vma_work *i915_vma_work(void);
>   int i915_vma_bind(struct i915_vma *vma,
>   		  enum i915_cache_level cache_level,
>   		  u32 flags,
> -		  struct i915_vma_work *work);
> +		  struct i915_vma_work *work,
> +		  struct i915_vma_resource *vma_res);
>   
>   bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color);
>   bool i915_vma_misplaced(const struct i915_vma *vma,
> @@ -428,6 +430,21 @@ static inline int i915_vma_sync(struct i915_vma *vma)
>   	return i915_active_wait(&vma->active);
>   }
>   
> +/**
> + * i915_vma_get_current_resource - Get the current resource of the vma
> + * @vma: The vma to get the current resource from.
> + *
> + * It's illegal to call this function if the vma is not bound.
> + *
> + * Return: A refcounted pointer to the current vma resource
> + * of the vma, assuming the vma is bound.
> + */
> +static inline struct i915_vma_resource *
> +i915_vma_get_current_resource(struct i915_vma *vma)
> +{
> +	return i915_vma_resource_get(vma->resource);
> +}
> +
>   void i915_vma_module_exit(void);
>   int i915_vma_module_init(void);
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
> new file mode 100644
> index 000000000000..833e987bed2a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +#include <linux/slab.h>
> +
> +#include "i915_vma_resource.h"
> +
> +/* Callbacks for the unbind dma-fence. */
> +static const char *get_driver_name(struct dma_fence *fence)
> +{
> +	return "vma unbind fence";
> +}
> +
> +static const char *get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static struct dma_fence_ops unbind_fence_ops = {
> +	.get_driver_name = get_driver_name,
> +	.get_timeline_name = get_timeline_name,
> +};
> +
> +/**
> + * i915_vma_resource_init - Initialize a vma resource.
> + * @vma_res: The vma resource to initialize
> + *
> + * Initializes a vma resource allocated using i915_vma_resource_alloc().
> + * The reason for having separate allocate and initialize function is that
> + * initialization may need to be performed from under a lock where
> + * allocation is not allowed.
> + */
> +void i915_vma_resource_init(struct i915_vma_resource *vma_res)
> +{
> +	spin_lock_init(&vma_res->lock);
> +	dma_fence_init(&vma_res->unbind_fence, &unbind_fence_ops,
> +		       &vma_res->lock, 0, 0);
> +	refcount_set(&vma_res->hold_count, 1);
> +}
> +
> +/**
> + * i915_vma_resource_alloc - Allocate a vma resource
> + *
> + * Return: A pointer to a cleared struct i915_vma_resource or
> + * a -ENOMEM error pointer if allocation fails.
> + */
> +struct i915_vma_resource *i915_vma_resource_alloc(void)
> +{
> +	struct i915_vma_resource *vma_res =
> +		kzalloc(sizeof(*vma_res), GFP_KERNEL);
> +
> +	return vma_res ? vma_res : ERR_PTR(-ENOMEM);
> +}
> +
> +static void __i915_vma_resource_unhold(struct i915_vma_resource *vma_res)
> +{
> +	if (refcount_dec_and_test(&vma_res->hold_count))
> +		dma_fence_signal(&vma_res->unbind_fence);
> +}
> +
> +/**
> + * i915_vma_resource_unhold - Unhold the signaling of the vma resource unbind
> + * fence.
> + * @vma_res: The vma resource.
> + * @lockdep_cookie: The lockdep cookie returned from i915_vma_resource_hold.
> + *
> + * The function may leave a dma_fence critical section.
> + */
> +void i915_vma_resource_unhold(struct i915_vma_resource *vma_res,
> +			      bool lockdep_cookie)
> +{
> +	dma_fence_end_signalling(lockdep_cookie);
> +
> +	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +		unsigned long irq_flags;
> +
> +		/* Inefficient open-coded might_lock_irqsave() */
> +		spin_lock_irqsave(&vma_res->lock, irq_flags);
> +		spin_unlock_irqrestore(&vma_res->lock, irq_flags);
> +	}
> +
> +	__i915_vma_resource_unhold(vma_res);
> +}
> +
> +/**
> + * i915_vma_resource_hold - Hold the signaling of the vma resource unbind fence.
> + * @vma_res: The vma resource.
> + * @lockdep_cookie: Pointer to a bool serving as a lockdep cooke that should
> + * be given as an argument to the pairing i915_vma_resource_unhold.
> + *
> + * If returning true, the function enters a dma_fence signalling critical
> + * section is not in one already.

if not?

> + *
> + * Return: true if holding successful, false if not.
> + */
> +bool i915_vma_resource_hold(struct i915_vma_resource *vma_res,
> +			    bool *lockdep_cookie)
> +{
> +	bool held = refcount_inc_not_zero(&vma_res->hold_count);
> +
> +	if (held)
> +		*lockdep_cookie = dma_fence_begin_signalling();
> +
> +	return held;
> +}
> +
> +/**
> + * i915_vma_resource_unbind - Unbind a vma resource
> + * @vma_res: The vma resource to unbind.
> + *
> + * At this point this function does little more than publish a fence that
> + * signals immediately unless signaling is held back.
> + *
> + * Return: A refcounted pointer to a dma-fence that signals when unbinding is
> + * complete.
> + */
> +struct dma_fence *
> +i915_vma_resource_unbind(struct i915_vma_resource *vma_res)
> +{
> +	__i915_vma_resource_unhold(vma_res);
> +	dma_fence_get(&vma_res->unbind_fence);
> +	return &vma_res->unbind_fence;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
> new file mode 100644
> index 000000000000..34744da23072
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#ifndef __I915_VMA_RESOURCE_H__
> +#define __I915_VMA_RESOURCE_H__
> +
> +#include <linux/dma-fence.h>
> +#include <linux/refcount.h>
> +
> +/**
> + * struct i915_vma_resource - Snapshotted unbind information.
> + * @unbind_fence: Fence to mark unbinding complete. Note that this fence
> + * is not considered published until unbind is scheduled, and as such it
> + * is illegal to access this fence before scheduled unbind other than
> + * for refcounting.
> + * @lock: The @unbind_fence lock. We're also using it to protect the weak
> + * pointer to the struct i915_vma, @vma during lookup and takedown.

Not sure what the @vma here is referring to?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
