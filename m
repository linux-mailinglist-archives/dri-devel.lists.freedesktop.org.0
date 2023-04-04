Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB36D6756
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4BA10E6D9;
	Tue,  4 Apr 2023 15:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24910E1E5;
 Tue,  4 Apr 2023 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680622247; x=1712158247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q0UQjAsv88tr1smNKtk9+4HBXxw9SSRmiBrBRmNKk1M=;
 b=NRFshthJxfMpmFgK7HU9N5h9FQU3O5tczVvzy2tvTOc+WRRkOeaTL7Dy
 q/vC3e0dyjH4WbmIaF5e3YvNIJ7/HDLbwSXtmYjxXLfoGvwWDeM4U60rQ
 6CscyzIJD1K8UlhwlAPADZQNDgBmnorKKde84oRdLvKVJjuohz0La49cO
 bih3DH0HuglokJTbwmhN33SmL5EmGZoyKps9FSuKq9AQZT+tAj3IAGeOs
 Vg+CBH1d145r/TCw/57wD+EQZhuJdK1i1JbaVCiA3P84skrWCdxpcmT30
 IGudke3dFpDhx5xG74WkdEdBqwoks4DGZaaWw46mm9Vwj/QiDtK51fe+J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343921526"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="343921526"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="718985713"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="718985713"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.30.195])
 ([10.213.30.195])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:30:26 -0700
Message-ID: <f9537e0b-18d3-1a26-d1b5-0401d5dd4b99@intel.com>
Date: Tue, 4 Apr 2023 17:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230404143100.10452-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230404143100.10452-1-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04.04.2023 16:30, Nirmoy Das wrote:
> Add a mechanism to keep existing data when creating
> a ttm object with I915_BO_ALLOC_USER flag.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 15 +++++++++++----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c     |  5 +++--
>   2 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 5dcbbef31d44..830c11431ee8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -328,6 +328,12 @@ struct drm_i915_gem_object {
>    */
>   #define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
>   #define I915_BO_ALLOC_CCS_AUX	  BIT(7)
> +/*
> + * Object is allowed to retain its initial data and will not be cleared on first
> + * access if used along with I915_BO_ALLOC_USER. This is mainly to keep
> + * preallocated framebuffer data intact while transitioning it to i915drmfb.
> + */
> +#define I915_BO_PREALLOC	  BIT(8)
>   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>   			     I915_BO_ALLOC_VOLATILE | \
>   			     I915_BO_ALLOC_CPU_CLEAR | \
> @@ -335,10 +341,11 @@ struct drm_i915_gem_object {
>   			     I915_BO_ALLOC_PM_VOLATILE | \
>   			     I915_BO_ALLOC_PM_EARLY | \
>   			     I915_BO_ALLOC_GPU_ONLY | \
> -			     I915_BO_ALLOC_CCS_AUX)
> -#define I915_BO_READONLY          BIT(8)
> -#define I915_TILING_QUIRK_BIT     9 /* unknown swizzling; do not release! */
> -#define I915_BO_PROTECTED         BIT(10)
> +			     I915_BO_ALLOC_CCS_AUX | \
> +			     I915_BO_PREALLOC)
> +#define I915_BO_READONLY          BIT(9)
> +#define I915_TILING_QUIRK_BIT     10 /* unknown swizzling; do not release! */
> +#define I915_BO_PROTECTED         BIT(11)
>   	/**
>   	 * @mem_flags - Mutable placement-related flags
>   	 *
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index dd188dfcc423..69eb20ed4d47 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -576,7 +576,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   	struct dma_fence *migration_fence = NULL;
>   	struct ttm_tt *ttm = bo->ttm;
>   	struct i915_refct_sgt *dst_rsgt;
> -	bool clear;
> +	bool clear, prealloc_bo;
>   	int ret;
>   
>   	if (GEM_WARN_ON(i915_ttm_is_ghost_object(bo))) {
> @@ -632,7 +632,8 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   		return PTR_ERR(dst_rsgt);
>   
>   	clear = !i915_ttm_cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
> -	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))) {
> +	prealloc_bo = obj->flags & I915_BO_PREALLOC;
> +	if (!(clear && ttm && !((ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) && !prealloc_bo))) {

This looks like school exercise for complicated usage of logical 
operators, and I have problem with understanding this :)
Couldn't this be somehow simplified?

Anyway as the patch just reuses existing code:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   		struct i915_deps deps;
>   
>   		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);

