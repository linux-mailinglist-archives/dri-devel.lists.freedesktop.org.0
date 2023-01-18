Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F3671C67
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994B910E738;
	Wed, 18 Jan 2023 12:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B2610E734;
 Wed, 18 Jan 2023 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674045914; x=1705581914;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HUglV2LSKcm990WXEDaeh8OnS4/HzjaAIoizYOctV0M=;
 b=RYm4wn39GbgAGRXd5Rw80HL3Q/7/HlH5RWybyCLf2hOkn5DQakYQDncY
 jp46nIayAUhD+kPAHA+mV+voNSApnUrc/K+bLSV9QbHqP2/cA24NJ9Cax
 wD8NcG7spErsfrSKa94vLKVTO3APWquQJ7LJm4WsAX2JZ9FIu8BUhy2Y1
 TUQ780ajzgDPvE2xfTDXd0KG2sdMoa1wXzkOt7ZrIPiiTe6V9Or7deAWY
 P+F2U3tz2ZwFIbeW//FGQUnbunqQkhDPo7qrLOyTK2edAad2c28tbuyvC
 j+dariunhj+Grlv940OkDPXtkRKW/KAhqN2g7A1T5bOFClXOhrPTa9shT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312852655"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="312852655"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 04:45:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="691981438"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="691981438"
Received: from tjlynch-mobl.ger.corp.intel.com (HELO [10.252.26.179])
 ([10.252.26.179])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 04:45:10 -0800
Message-ID: <43b4d3b9-0c50-83e9-7c92-5389337db24b@intel.com>
Date: Wed, 18 Jan 2023 12:45:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v10 23/23] drm/i915/vm_bind: Support capture of persistent
 mappings
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-24-niranjana.vishwanathapura@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230118071609.17572-24-niranjana.vishwanathapura@intel.com>
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

On 18/01/2023 07:16, Niranjana Vishwanathapura wrote:
> Support dump capture of persistent mappings upon user request.
> 
> Capture of a mapping is requested with the VM_BIND ioctl and
> processed during the GPU error handling. They are synchronously
> unbound during eviction so that no additional vma resource
> reference taking is required in the submission path. Thus, a
> list of persistent vmas requiring capture is maintained instead
> of a list of vma resources.
> 
> v2: enable with CONFIG_DRM_I915_CAPTURE_ERROR, remove gfp
>      overwrite, add kernel-doc and expand commit message
> v3: Ensure vma->resource is valid during capture
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    | 13 +++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  5 ++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  7 +++
>   drivers/gpu/drm/i915/i915_gem.c               | 14 ++++-
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 52 ++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_vma.c               |  4 ++
>   drivers/gpu/drm/i915/i915_vma_types.h         |  4 ++
>   include/uapi/drm/i915_drm.h                   |  9 +++-
>   8 files changed, 104 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 78e7c0642c5f..562a67a988f2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -88,6 +88,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>   {
>   	lockdep_assert_held(&vma->vm->vm_bind_lock);
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	mutex_lock(&vma->vm->vm_capture_lock);
> +	if (!list_empty(&vma->vm_capture_link))
> +		list_del_init(&vma->vm_capture_link);
> +	mutex_unlock(&vma->vm->vm_capture_lock);
> +#endif
>   	spin_lock(&vma->vm->vm_rebind_lock);
>   	if (!list_empty(&vma->vm_rebind_link))
>   		list_del_init(&vma->vm_rebind_link);
> @@ -357,6 +363,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>   				continue;
>   		}
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +		if (va->flags & I915_GEM_VM_BIND_CAPTURE) {
> +			mutex_lock(&vm->vm_capture_lock);
> +			list_add_tail(&vma->vm_capture_link, &vm->vm_capture_list);
> +			mutex_unlock(&vm->vm_capture_lock);
> +		}
> +#endif
>   		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>   		i915_vm_bind_it_insert(vma, &vm->va);
>   		if (!obj->priv_root)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 2e4c9fabf3b8..103ca55222be 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -297,6 +297,11 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	spin_lock_init(&vm->vm_rebind_lock);
>   	spin_lock_init(&vm->userptr_invalidated_lock);
>   	INIT_LIST_HEAD(&vm->userptr_invalidated_list);
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	INIT_LIST_HEAD(&vm->vm_capture_list);
> +	mutex_init(&vm->vm_capture_lock);
> +#endif
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 620b4e020a9f..7f69e1d4fb5e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -281,6 +281,13 @@ struct i915_address_space {
>   	/** @root_obj: root object for dma-resv sharing by private objects */
>   	struct drm_i915_gem_object *root_obj;
>   
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	/* @vm_capture_list: list of vm captures */
> +	struct list_head vm_capture_list;
> +	/* @vm_capture_lock: protects vm_capture_list */
> +	struct mutex vm_capture_lock;
> +#endif
> +
>   	/* Global GTT */
>   	bool is_ggtt:1;
>   
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 969581e7106f..d97822f203fc 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -143,6 +143,8 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
>   	while (!ret && (vma = list_first_entry_or_null(&obj->vma.list,
>   						       struct i915_vma,
>   						       obj_link))) {
> +		bool sync_unbind = true;
> +
>   		list_move_tail(&vma->obj_link, &still_in_list);
>   		if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
>   			continue;
> @@ -171,8 +173,18 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
>   		 * and destroy the vma from under us.
>   		 */
>   
> +		/*
> +		 * Synchronously unbind persistent mappings with capture
> +		 * request so that vma->resource is valid in the error capture
> +		 * path without needing extra reference taking in execbuf path.
> +		 */
> +		if (!mutex_lock_interruptible(&vma->vm->vm_capture_lock)) {
> +			sync_unbind = !list_empty(&vma->vm_capture_link);
> +			mutex_unlock(&vma->vm->vm_capture_lock);
> +		}

This stuff only exists on CONFIG_DRM_I915_CAPTURE_ERROR it seems?

> +
>   		ret = -EBUSY;
> -		if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
> +		if (!sync_unbind && (flags & I915_GEM_OBJECT_UNBIND_ASYNC)) {
>   			assert_object_held(vma->obj);
>   			ret = i915_vma_unbind_async(vma, vm_trylock);
>   		}
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64..5ccd1eaea2a5 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1460,6 +1460,49 @@ capture_vma(struct intel_engine_capture_vma *next,
>   	return next;
>   }
>   
> +static struct intel_engine_capture_vma *
> +capture_user_vm(struct intel_engine_capture_vma *capture,
> +		struct i915_address_space *vm, gfp_t gfp)
> +{
> +	struct list_head vm_capture_list;
> +	struct i915_vma *vma, *vn;
> +	int err;
> +
> +	INIT_LIST_HEAD(&vm_capture_list);
> +
> +	err = mutex_lock_interruptible(&vm->vm_capture_lock);
> +	if (err)
> +		return capture;

Same here, and a few other places.

> +
> +	/* vma->resource should be checked with vm->mutex held */
> +	err = mutex_lock_interruptible(&vm->mutex);
> +	if (err)
> +		goto skip_user_vm_capture;
> +
> +	list_for_each_entry_safe(vma, vn, &vm->vm_capture_list,
> +				 vm_capture_link) {
> +		if (drm_WARN_ONCE(&vm->i915->drm, !vma->resource,
> +				  "vma->resource expected!\n"))
> +			continue;
> +
> +		i915_vma_resource_get(vma->resource);
> +		list_move_tail(&vma->vm_capture_link, &vm_capture_list);

Now that stuff can be added to the capture_list outside of the exec, 
can't someone do an exec, followed by a bunch of vm_binds requesting 
capture for each one? With the idea of tricking the capture code into 
dumping the pages of non-cleared memory? (The GPU clear job has been 
created, but not actually completed yet).

Say we have an IGT which creates a spinner or something on the vm, then 
creates a bunch of vm_binds, each asking for capture. What ensures that 
all the binds we are capturing here are valid when the spinner or 
whatever triggers a GPU hang i.e everything in capture_list has at least 
been cleared? With eb2 everything was tied to the rq, and if the rq has 
been submitted then all required async clears/moves must have already 
completed.

> +	}
> +	mutex_unlock(&vm->mutex);
> +
> +	list_for_each_entry(vma, &vm_capture_list, vm_capture_link) {
> +		capture = capture_vma_snapshot(capture, vma->resource,
> +					       gfp, "user");
> +		i915_vma_resource_put(vma->resource);
> +	}
> +	list_splice_tail(&vm_capture_list, &vm->vm_capture_list);
> +
> +skip_user_vm_capture:
> +	mutex_unlock(&vm->vm_capture_lock);
> +
> +	return capture;
> +}
> +
>   static struct intel_engine_capture_vma *
>   capture_user(struct intel_engine_capture_vma *capture,
>   	     const struct i915_request *rq,
> @@ -1467,6 +1510,8 @@ capture_user(struct intel_engine_capture_vma *capture,
>   {
>   	struct i915_capture_list *c;
>   
> +	capture = capture_user_vm(capture, rq->context->vm, gfp);
> +
>   	for (c = rq->capture_list; c; c = c->next)
>   		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>   					       "user");
> @@ -1548,8 +1593,13 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   	 * as the simplest method to avoid being overwritten
>   	 * by userspace.
>   	 */
> -	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
> +
> +	/*
> +	 * Ensure capture_user_vm which takes vm->mutex gets called first
> +	 * as snapshoting the first vma starts dma fence critical section.
> +	 */
>   	vma = capture_user(vma, rq, gfp);
> +	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>   	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>   	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 2f0994f0ed42..b47715fa773f 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -248,6 +248,10 @@ vma_create(struct drm_i915_gem_object *obj,
>   	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>   	INIT_LIST_HEAD(&vma->vm_rebind_link);
>   	INIT_LIST_HEAD(&vma->userptr_invalidated_link);
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	INIT_LIST_HEAD(&vma->vm_capture_link);
> +#endif
>   	return vma;
>   
>   err_unlock:
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index 89f9854a6f69..c4fd61d51ce6 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -310,6 +310,10 @@ struct i915_vma {
>   	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>   	/** @userptr_invalidated_link: link to the vm->userptr_invalidated_list */
>   	struct list_head userptr_invalidated_link;
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	/* @vm_capture_link: link to the captureable VMA list */
> +	struct list_head vm_capture_link;
> +#endif
>   
>   	/** Timeline fence for vm_bind completion notification */
>   	struct {
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index b9167f950327..5fde6020e339 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3925,12 +3925,17 @@ struct drm_i915_gem_vm_bind {
>   	__u64 length;
>   
>   	/**
> -	 * @flags: Currently reserved, MBZ.
> +	 * @flags: Supported flags are:
> +	 *
> +	 * I915_GEM_VM_BIND_CAPTURE:
> +	 * Capture this mapping in the dump upon GPU error.
> +	 * CONFIG_DRM_I915_CAPTURE_ERROR should be enabled for valid capture.
>   	 *
>   	 * Note that @fence carries its own flags.
>   	 */
>   	__u64 flags;
> -#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
> +#define I915_GEM_VM_BIND_CAPTURE           (1ull << 0)
> +#define __I915_GEM_VM_BIND_UNKNOWN_FLAGS   (-(I915_GEM_VM_BIND_CAPTURE << 1))
>   
>   	/** @rsvd: Reserved, MBZ */
>   	__u64 rsvd[2];
