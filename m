Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B064B4B2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 13:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430B10E1DB;
	Tue, 13 Dec 2022 12:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282A810E1D7;
 Tue, 13 Dec 2022 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670932994; x=1702468994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xm5TD0hdGLQ8gqxhn/T6pqJXVp4ZM3eP+2Yvs1OhNJ8=;
 b=dYd7H/bWVgwBpC7OQ7qLNjW9q9+Q53xOP65oNNYUtSp9xHOdzMftJl+F
 ejYPWYDYjPVq2rgb0CpRMeabGlLfU+RYPaKcYSa27DpMhhtXW/VQyXDDr
 Ku1yDGUAKEd5ydIZQAFPRK/trTd1hHjPsPZNRyyDtnUV1FN1a/e5f4r7K
 trNR4IvmUjCoxAsCL/Yn0ht4rmPT40sseZ7oly50GFCtNRbjfdkqoPwSB
 LcM4bNHrBuPiYvvf/0O/ApygjdrmH40oycQBiUHMfTQMaLaHK1lGHIwaJ
 KTVzQOTn3IODAPAfGvojTrpb6hMEXz9O7y5mHl/HLqyG/BCt9XlJmYFb3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315751421"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315751421"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:03:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="648535266"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="648535266"
Received: from rreill2x-mobl.ger.corp.intel.com (HELO [10.252.5.17])
 ([10.252.5.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:03:09 -0800
Message-ID: <f684e366-417e-e087-764f-390f65ebd0f9@intel.com>
Date: Tue, 13 Dec 2022 12:03:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v9 23/23] drm/i915/vm_bind: Support capture of persistent
 mappings
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
 <20221212231527.2384-24-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221212231527.2384-24-niranjana.vishwanathapura@intel.com>
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

On 12/12/2022 23:15, Niranjana Vishwanathapura wrote:
> Support dump capture of persistent mappings upon user request.
> 
> Capture of a mapping is requested with the VM_BIND ioctl and
> processed during the GPU error handling, thus not adding any
> additional latency to the submission path.
> 
> A list of persistent vmas requiring capture is maintained
> instead of a list of vma resources. This allows for no
> additional handling around eviction.
> 
> v2: enable with CONFIG_DRM_I915_CAPTURE_ERROR, remove gfp
>      overwrite, add kernel-doc and expand commit message
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   .../gpu/drm/i915/gem/i915_gem_vm_bind_object.c | 13 +++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c            |  5 +++++
>   drivers/gpu/drm/i915/gt/intel_gtt.h            |  7 +++++++
>   drivers/gpu/drm/i915/i915_gpu_error.c          | 18 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_vma.c                |  4 ++++
>   drivers/gpu/drm/i915/i915_vma_types.h          |  4 ++++
>   include/uapi/drm/i915_drm.h                    |  9 +++++++--
>   7 files changed, 57 insertions(+), 3 deletions(-)
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
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 9d5d5a397b64..76b2834ce958 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1460,6 +1460,22 @@ capture_vma(struct intel_engine_capture_vma *next,
>   	return next;
>   }
>   
> +static struct intel_engine_capture_vma *
> +capture_user_vm(struct intel_engine_capture_vma *capture,
> +		struct i915_address_space *vm, gfp_t gfp)
> +{
> +	struct i915_vma *vma;
> +
> +	mutex_lock(&vm->vm_capture_lock);
> +	/* vma->resource must be valid here as persistent vmas are bound */
> +	list_for_each_entry(vma, &vm->vm_capture_list, vm_capture_link)
> +		capture = capture_vma_snapshot(capture, vma->resource,

Thinking some more on this, I don't think we can actually do this. The 
vma->resource at this stage could be complete nonsense (could even be 
NULL?), if you consider piplelined migrations. For example if we async 
evict something, the object state can be freely updated (maybe even more 
than once), even though the dma-resv is still active with fences. This 
is allowed since the actual move(s) will be pipelined and should respect 
those fences. In eb2 this is solved by holding the object lock and 
taking a snaphot of the vma at submit time, which should ensure we are 
capturing the correct vma->resource and sg_table. Maybe I'm missing 
something.

> +					       gfp, "user");
> +	mutex_unlock(&vm->vm_capture_lock);
> +
> +	return capture;
> +}
> +
>   static struct intel_engine_capture_vma *
>   capture_user(struct intel_engine_capture_vma *capture,
>   	     const struct i915_request *rq,
> @@ -1471,7 +1487,7 @@ capture_user(struct intel_engine_capture_vma *capture,
>   		capture = capture_vma_snapshot(capture, c->vma_res, gfp,
>   					       "user");
>   
> -	return capture;
> +	return capture_user_vm(capture, rq->context->vm, gfp);
>   }
>   
>   static void add_vma(struct intel_engine_coredump *ee,
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index d092a86123ae..9be8aa448874 100644
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
