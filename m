Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B69A6014
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EE210E465;
	Mon, 21 Oct 2024 09:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBagr1e0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7B10E465;
 Mon, 21 Oct 2024 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729503155; x=1761039155;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CCjJiWPFa4J3/Smv4s+kInMJz1s1vf5h/chaW40idSA=;
 b=MBagr1e06mJ9KeMrSWHEkN8ku5kN9hIViY94irND0cRx0Z0bqpyVXxb1
 xgopeKtnlH+daNbNBzcxUytWCdjOqm80ou0CyQw4XE+9liDR2pkxBu1mD
 MU+EKBxuwOYiiXdi6tOlhcBVh7b00cj3m6Jh4BxI4/cYJa1n6e8YL+yMa
 0g+bqFZiQMAzYWTx9TMnrXn0Ekdt6prKwbZh6yMwLZCF1wk2uZG5OIsq0
 3LMXObbdB1varHDhFb1269aG6EsWZDZYIUihL5nJ5Fq2MBpSoklAVMbcT
 PZ6s2pSf1eysDHcD18l51oA2Vc3uE8Ks5pGhmGCMcxRU0cksoH8XM5NHe Q==;
X-CSE-ConnectionGUID: s1ZFngyaRGiGjsKJl6XHtQ==
X-CSE-MsgGUID: y8BmT95ST72wIaDDUDITVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29096088"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29096088"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:32:35 -0700
X-CSE-ConnectionGUID: nPYjcclSSA2nl002c/nztA==
X-CSE-MsgGUID: fw4oc+49Sg6ipZdbA9tXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79544863"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.206])
 ([10.245.245.206])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:32:33 -0700
Message-ID: <73e19e35-4deb-4337-8ba7-30cd84dcfed0@intel.com>
Date: Mon, 21 Oct 2024 10:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe: Only allow contiguous BOs to use xe_bo_vmap
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-7-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241019192030.1505020-7-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/10/2024 20:20, Matthew Brost wrote:
> xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
> unless we are certain the BO is contiguous.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0a7b91df69c2..46c640f8db9e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -162,6 +162,15 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>   	}
>   }
>   
> +static bool force_contiguous(u32 bo_flags)
> +{
> +	/*
> +	 * For eviction / restore on suspend / resume objects pinned in VRAM
> +	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
> +	 */
> +	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> +}
> +
>   static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>   		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>   {
> @@ -175,12 +184,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>   	xe_assert(xe, vram && vram->usable_size);
>   	io_size = vram->io_size;
>   
> -	/*
> -	 * For eviction / restore on suspend / resume objects
> -	 * pinned in VRAM must be contiguous
> -	 */
> -	if (bo_flags & (XE_BO_FLAG_PINNED |
> -			XE_BO_FLAG_GGTT))
> +	if (force_contiguous(bo_flags))
>   		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
>   
>   	if (io_size < vram->usable_size) {
> @@ -212,8 +216,7 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>   
>   		bo->placements[*c] = (struct ttm_place) {
>   			.mem_type = XE_PL_STOLEN,
> -			.flags = bo_flags & (XE_BO_FLAG_PINNED |
> -					     XE_BO_FLAG_GGTT) ?
> +			.flags = force_contiguous(bo_flags) ?
>   				TTM_PL_FLAG_CONTIGUOUS : 0,
>   		};
>   		*c += 1;
> @@ -2024,13 +2027,15 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>   
>   int xe_bo_vmap(struct xe_bo *bo)
>   {
> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
>   	void *virtual;
>   	bool is_iomem;
>   	int ret;
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
> +	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) ||
> +			!force_contiguous(bo->flags)))

Hmm was confused why this is not popping in CI for the clear color case, 
but looks like that is directly calling ttm_bo_kmap()...

Anyway, for this patch,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   		return -EINVAL;
>   
>   	if (!iosys_map_is_null(&bo->vmap))
