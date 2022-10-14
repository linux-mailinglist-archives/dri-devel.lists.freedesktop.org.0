Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F345FF0B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 16:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D664010E9CE;
	Fri, 14 Oct 2022 14:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306C10E9CE;
 Fri, 14 Oct 2022 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665759515; x=1697295515;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wIP9+4kBbVg7B//gtmGSc/6d5QDMMURwLNEs7p1u2F0=;
 b=e5A9L+mNXuQ7I/z5WD4CITEi8ILeSBzpIAtPg90VSjmJwFMCs2PktOVA
 labJdX44J1L214RK6Z1o19Aa0jmFDm9Y7DPNsbDvhkhtsaxeh2RarRqLq
 azyejIpMxgFxl2pRfrIc1+pxwVAVXcGKZoZcpknXj6UfSWksMi1cQuHFk
 wNxmDKqo5TLjPxb6D+C9AIof8V4LdHPlSgx6qiOPSfPsKZYcSpQeasFBx
 ALmaMARcd253IlhSSLWXbHDBI1i13CO0F0QQNWkxhu7xk/VHNHAO8LbdX
 s1IcgIbBS+1DGMF54wH5HDBH0WJrFyWNjrsW77pvcweUZLGeZsjseHLEa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="306471815"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="306471815"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 07:58:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="716776257"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="716776257"
Received: from salamu-mobl1.ger.corp.intel.com (HELO [10.252.11.69])
 ([10.252.11.69])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 07:58:26 -0700
Message-ID: <f162c0b8-5b9b-1c43-3a66-bff56fc1046e@intel.com>
Date: Fri, 14 Oct 2022 15:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/i915: Refactor ttm ghost obj detection
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221014131427.21102-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221014131427.21102-1-nirmoy.das@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 jonathan.cavitt@intel.com, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 John.C.Harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 14:14, Nirmoy Das wrote:
> Currently i915_ttm_to_gem() returns NULL for ttm ghost
> object which makes it unclear when we should add a NULL
> check for a caller of i915_ttm_to_gem() as ttm ghost
> objects are expected behaviour for certain cases.
> 
> Create a separate function to detect ttm ghost object and
> use that in places where we expect a ghost obj from ttm.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 21 ++++++++++----------
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.h      | 18 ++++++++++++-----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
>   3 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 6b60b99461e2..0a85651c654d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -279,7 +279,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   	struct i915_ttm_tt *i915_tt;
>   	int ret;
>   
> -	if (!obj)
> +	if (i915_ttm_is_ghost_object(bo))
>   		return NULL;
>   
>   	i915_tt = kzalloc(sizeof(*i915_tt), GFP_KERNEL);
> @@ -362,7 +362,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   
> -	if (!obj)
> +	if (i915_ttm_is_ghost_object(bo))
>   		return false;
>   
>   	/*
> @@ -511,7 +511,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	intel_wakeref_t wakeref = 0;
>   
> -	if (bo->resource && likely(obj)) {
> +	if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
>   		/* ttm_bo_release() already has dma_resv_lock */
>   		if (i915_ttm_cpu_maps_iomem(bo->resource))
>   			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
> @@ -624,7 +624,7 @@ static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	int ret;
>   
> -	if (!obj)
> +	if (i915_ttm_is_ghost_object(bo))
>   		return;
>   
>   	ret = i915_ttm_move_notify(bo);
> @@ -657,7 +657,7 @@ static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(mem->bo);
>   	bool unknown_state;
>   
> -	if (!obj)
> +	if (i915_ttm_is_ghost_object(mem->bo))
>   		return -EINVAL;
>   
>   	if (!kref_get_unless_zero(&obj->base.refcount))
> @@ -690,7 +690,7 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
>   	unsigned long base;
>   	unsigned int ofs;
>   
> -	GEM_BUG_ON(!obj);
> +	GEM_BUG_ON(i915_ttm_is_ghost_object(bo));
>   	GEM_WARN_ON(bo->ttm);
>   
>   	base = obj->mm.region->iomap.base - obj->mm.region->region.start;
> @@ -1035,13 +1035,12 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   	struct vm_area_struct *area = vmf->vma;
>   	struct ttm_buffer_object *bo = area->vm_private_data;
>   	struct drm_device *dev = bo->base.dev;
> -	struct drm_i915_gem_object *obj;
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	intel_wakeref_t wakeref = 0;
>   	vm_fault_t ret;
>   	int idx;
>   
> -	obj = i915_ttm_to_gem(bo);
> -	if (!obj)
> +	if (i915_ttm_is_ghost_object(bo))
>   		return VM_FAULT_SIGBUS;

I think this one can be dropped, maybe in a separate patch?

Otherwise looks good to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   	/* Sanity check that we allow writing into this object */
> @@ -1141,7 +1140,7 @@ static void ttm_vm_open(struct vm_area_struct *vma)
>   	struct drm_i915_gem_object *obj =
>   		i915_ttm_to_gem(vma->vm_private_data);
>   
> -	GEM_BUG_ON(!obj);
> +	GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
>   	i915_gem_object_get(obj);
>   }
>   
> @@ -1150,7 +1149,7 @@ static void ttm_vm_close(struct vm_area_struct *vma)
>   	struct drm_i915_gem_object *obj =
>   		i915_ttm_to_gem(vma->vm_private_data);
>   
> -	GEM_BUG_ON(!obj);
> +	GEM_BUG_ON(i915_ttm_is_ghost_object(vma->vm_private_data));
>   	i915_gem_object_put(obj);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> index e4842b4296fc..2a94a99ef76b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -27,19 +27,27 @@ i915_gem_to_ttm(struct drm_i915_gem_object *obj)
>    */
>   void i915_ttm_bo_destroy(struct ttm_buffer_object *bo);
>   
> +/**
> + * i915_ttm_is_ghost_object - Check if the ttm bo is a ghost object.
> + * @bo: Pointer to the ttm buffer object
> + *
> + * Return: True if the ttm bo is not a i915 object but a ghost ttm object,
> + * False otherwise.
> + */
> +static inline bool i915_ttm_is_ghost_object(struct ttm_buffer_object *bo)
> +{
> +	return bo->destroy != i915_ttm_bo_destroy;
> +}
> +
>   /**
>    * i915_ttm_to_gem - Convert a struct ttm_buffer_object to an embedding
>    * struct drm_i915_gem_object.
>    *
> - * Return: Pointer to the embedding struct ttm_buffer_object, or NULL
> - * if the object was not an i915 ttm object.
> + * Return: Pointer to the embedding struct ttm_buffer_object.
>    */
>   static inline struct drm_i915_gem_object *
>   i915_ttm_to_gem(struct ttm_buffer_object *bo)
>   {
> -	if (bo->destroy != i915_ttm_bo_destroy)
> -		return NULL;
> -
>   	return container_of(bo, struct drm_i915_gem_object, __do_not_access);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 9a7e50534b84..f59f812dc6d2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   	bool clear;
>   	int ret;
>   
> -	if (GEM_WARN_ON(!obj)) {
> +	if (GEM_WARN_ON(i915_ttm_is_ghost_object(bo))) {
>   		ttm_bo_move_null(bo, dst_mem);
>   		return 0;
>   	}
