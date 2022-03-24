Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B524E6701
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 17:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDA210E5A1;
	Thu, 24 Mar 2022 16:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CEB10E5A1;
 Thu, 24 Mar 2022 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648139333; x=1679675333;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4KePEDYmEM36ed9DEgViH9Xy/T+VLKXOWPskWTrlXrM=;
 b=jdKg7Duy6Whk9DwbZBpREYuzeXj8QOzElPGCM2M2tJQM+QYCyEdOear+
 uHxNfxXPxXcX1xcKs4mybX2ESzzuIQM6Wc308PuJDgH2A8IgxLazHsfIU
 P6vFTDs8iCwXxzjUaBlAu7w/mhyRGSHIbuQuEM5CIe/Z9fqtynPfxHI80
 WuCdOjf/2OtNJm4vCBLveWups0U7F1FJANYFTjpzcUyu6iqQsFbcTa/Vj
 dGeIYV0Hfs+ZjRqK0f0kWSahtF3VfBCQ7CziIfX3lzgXMv4rPXI/seSCj
 OoafaBtdxbttOPais2TtYWa6yD7fDponJY0mO1K/cS7wTlYbFdbHPGq3m w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="344858226"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="344858226"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 09:28:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="717885890"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO [10.249.254.237])
 ([10.249.254.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 09:28:11 -0700
Message-ID: <ece35a9e-a8e7-b007-9d99-4902ce0a3a93@linux.intel.com>
Date: Thu, 24 Mar 2022 17:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 8/9] drm/i915/gem: Add extra pages in ttm_tt for ccs
 data
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-9-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220321224459.12223-9-ramalingam.c@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/21/22 23:44, Ramalingam C wrote:
> On Xe-HP and later devices, dedicated compression control state (CCS)
> stored in local memory is used for each surface, to support the
> 3D and media compression formats.
>
> The memory required for the CCS of the entire local memory is 1/256 of
> the local memory size. So before the kernel boot, the required memory
> is reserved for the CCS data and a secure register will be programmed
> with the CCS base address
>
> So when an object is allocated in local memory, dont need to explicitly
> allocate the space for ccs data. But when the obj is evicted into the
> smem, to hold the compression related data along with the obj extra space
> is needed in smem. i.e obj_size + (obj_size/256).
>
> Hence when a smem pages are allocated for an obj with lmem placement
> possibility we create with the extra pages required for the ccs data for
> the obj size.
>
> v2:
>    Used imperative wording [Thomas]
> v3:
>    Inflate the pages only when obj's placement is lmem only
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Christian Koenig <christian.koenig@amd.com>
> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 29 ++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 3b9f99c765c4..0305a150b9d4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -20,6 +20,7 @@
>   #include "gem/i915_gem_ttm.h"
>   #include "gem/i915_gem_ttm_move.h"
>   #include "gem/i915_gem_ttm_pm.h"
> +#include "gt/intel_gpu_commands.h"
>   
>   #define I915_TTM_PRIO_PURGE     0
>   #define I915_TTM_PRIO_NO_PAGES  1
> @@ -262,12 +263,33 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
>   	.release = i915_ttm_tt_release
>   };
>   
> +static inline bool
> +i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
> +{
> +	bool lmem_placement = false;
> +	int i;
> +
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		/* Compression is not allowed for the objects with smem placement */
> +		if (obj->mm.placements[i]->type == INTEL_MEMORY_SYSTEM)
> +			return false;
> +		if (!lmem_placement &&
> +		    obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
> +			lmem_placement = true;
> +	}
> +
> +	return lmem_placement;
> +}
> +
>   static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   					 uint32_t page_flags)
>   {
> +	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
> +						     bdev);
>   	struct ttm_resource_manager *man =
>   		ttm_manager_type(bo->bdev, bo->resource->mem_type);
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	unsigned long ccs_pages = 0;
>   	enum ttm_caching caching;
>   	struct i915_ttm_tt *i915_tt;
>   	int ret;
> @@ -290,7 +312,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> +	if (HAS_FLAT_CCS(i915) && i915_gem_object_needs_ccs_pages(obj))
> +		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
> +						      NUM_BYTES_PER_CCS_BYTE),
> +					 PAGE_SIZE);
> +
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, ccs_pages);
>   	if (ret)
>   		goto err_free;
>   

Since we need to respin could we add (in __i915_ttm_get_pages())

/* Verify that gem never sees inflated system pages. Keep that local to 
ttm */GEM_BUG_ON(bo->ttm && ((obj->base.size >> PAGE_SHIFT) < 
bo->ttm->num_pages))

/Thomas



