Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EBD3C5B9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F110E5B4;
	Tue, 20 Jan 2026 10:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdC+YUaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235AD10E5B1;
 Tue, 20 Jan 2026 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768905723; x=1800441723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0l3VHXyDJw0+QakH6PJ+JROapppkV5FjgLHShJX5VKo=;
 b=KdC+YUaa5N8k392IA+lE+ZykUsiP/2ZG3Flfeyu6cMr6Cea8FAsZ3uJd
 E85Zq1JRkXWZFQYRTqSYH9JB69tvGMyHDBg1mIdWTFl5jzqheX5VB56iS
 4oRgSUNv3hnriZt1c+Q8gG2bhlabzT2NLO3k8eNJM8ozTNOhmU5gwXlM0
 fMZ/mVQFIQHNNbmFmt4nqp+s+FKmqkfhcOJ9DOsWZmvRMFk/EywaYuF94
 J/IC/dB3o2nDXFtpTHXbl9oMMlERL/kjC3Vw6x3ElILDeDebbNUbppgMh
 /seqCPEfinBpxILa2Sohbk822VLnd0vAZN75K+dIZtZ63BCOofmgiQrkz Q==;
X-CSE-ConnectionGUID: +yjBrL8vQiCiNZf2OuFO2Q==
X-CSE-MsgGUID: GxIAIOUGSmerItKUWaOhxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70164499"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70164499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:42:03 -0800
X-CSE-ConnectionGUID: AwXlz7FdQYO8TgQAfjhtbQ==
X-CSE-MsgGUID: I1f4jfO7Rj+/ZaHDgmWDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205889692"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.235])
 ([10.245.244.235])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:42:01 -0800
Message-ID: <654f40ab-8402-4bb1-88ff-742572a1b251@intel.com>
Date: Tue, 20 Jan 2026 10:41:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Prevent BUG_ON by validating rounded
 allocation
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20260108113227.2101872-4-sanjay.kumar.yadav@intel.com>
 <20260108113227.2101872-5-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260108113227.2101872-5-sanjay.kumar.yadav@intel.com>
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

On 08/01/2026 11:32, Sanjay Yadav wrote:
> When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
> rounded up to the next power-of-two via roundup_pow_of_two().
> Similarly, for non-contiguous allocations with large min_block_size,
> the size is aligned up via round_up(). Both operations can produce a
> rounded size that exceeds mm->size, which later triggers
> BUG_ON(order > mm->max_order).
> 
> Example scenarios:
> - 9G CONTIGUOUS allocation on 10G VRAM memory:
>    roundup_pow_of_two(9G) = 16G > 10G
> - 9G allocation with 8G min_block_size on 10G VRAM memory:
>    round_up(9G, 8G) = 16G > 10G
> 
> Fix this by checking the rounded size against mm->size. For
> non-contiguous or range allocations where size > mm->size is invalid,
> return -EINVAL immediately. For contiguous allocations without range
> restrictions, allow the request to fall through to the existing
> __alloc_contig_try_harder() fallback.
> 
> This ensures invalid user input returns an error or uses the fallback
> path instead of hitting BUG_ON.
> 
> v2: (Matt A)
> - Add Fixes, Cc stable, and Closes tags for context
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
> Cc: <stable@vger.kernel.org> # v6.7+
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Arun/Christian, when you get a chance could you also merge these two please?

> ---
>   drivers/gpu/drm/drm_buddy.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 2f279b46bd2c..5141348fc6c9 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -1155,6 +1155,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	order = fls(pages) - 1;
>   	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>   
> +	if (order > mm->max_order || size > mm->size) {
> +		if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
> +		    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> +			return __alloc_contig_try_harder(mm, original_size,
> +							 original_min_size, blocks);
> +
> +		return -EINVAL;
> +	}
> +
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
>   		BUG_ON(order > mm->max_order);

