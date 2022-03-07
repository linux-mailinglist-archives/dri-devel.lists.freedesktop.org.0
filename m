Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5094D02F3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C6410E108;
	Mon,  7 Mar 2022 15:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F5C10E045;
 Mon,  7 Mar 2022 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646667150; x=1678203150;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L7YClea1G7v7TXC+7eEQH1QlY6IxznlIwFXPgy7zJ8I=;
 b=H06W+bBApbb7kb5HHHO1hTEAAOJBmjPEugGB2BHn8xEOM/vIWnbLlUFd
 SJQfLaWFGp1yiOJyr/40DznNqduMOtVOVzvZBISm+SnYG05WsN6cW38VW
 3txslOa0x5r4CyqV2FvHxCyKJhr9MylPaUW18NqxVl5kEbxN7s8xYmp5k
 flbZvCXuzgj/aikHHlm77Ri5jJIwtmCnQqyvi++tKlezT2EPRXYB8qbSh
 Ic7L34Vxg8cxdGuiBSesnRsLKsa5nNeOIWB9niKN4pHnYGcr6ngGstlF9
 kI0NqmI5NFk7thYJnIq3AcGYraTgxxAoNjy+JSrKJV522tAZoVcpeO6E4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254145784"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254145784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 07:32:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="780359375"
Received: from aaronmux-mobl.ger.corp.intel.com (HELO [10.252.2.25])
 ([10.252.2.25])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 07:32:26 -0800
Message-ID: <d7046c6d-1346-8f2b-158a-7fc22bfe47f8@intel.com>
Date: Mon, 7 Mar 2022 15:32:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/6] drm/i915/gem: Add extra pages in ttm_tt for ccs
 data
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220307134038.30525-1-ramalingam.c@intel.com>
 <20220307134038.30525-5-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220307134038.30525-5-ramalingam.c@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/03/2022 13:40, Ramalingam C wrote:
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
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Christian Koenig <christian.koenig@amd.com>
> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 1a8262f5f692..c7a36861c38d 100644
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
> @@ -255,12 +256,27 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
>   	.release = i915_ttm_tt_release
>   };
>   
> +static inline bool
> +i915_gem_object_has_lmem_placement(struct drm_i915_gem_object *obj)
> +{
> +	int i;
> +
> +	for (i = 0; i < obj->mm.n_placements; i++)
> +		if (obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
> +			return true;
> +
> +	return false;
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
> @@ -283,7 +299,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
> +	if (HAS_FLAT_CCS(i915) && i915_gem_object_has_lmem_placement(obj))
> +		ccs_pages = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
> +						      NUM_BYTES_PER_CCS_BYTE),
> +					 PAGE_SIZE);

Did you figure out how to handle the case where we have LMEM + SMEM, and 
are unable to place the object into LMEM, and then it just ends up being 
kept in SMEM? AFAIK the vm.insert_entries code has always just assumed 
that the vma sg_table size is the same as the vma->size, and so will 
happily create PTEs for the hidden ccs page(s), which might corrupt the 
users vm, depending on the exact layout.

Also it looks like the _shmem_writeback() call should now use 
ttm_tt->num_pages, instead of the object size?

> +
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, ccs_pages);
>   	if (ret)
>   		goto err_free;
>   
