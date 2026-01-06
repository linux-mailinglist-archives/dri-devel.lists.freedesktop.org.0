Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C24CF93EE
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A6D10E0EC;
	Tue,  6 Jan 2026 16:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7OngM4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C5210E0EC;
 Tue,  6 Jan 2026 16:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767715468; x=1799251468;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ywcXi/KRPk/ezq8QoHHlwmAfT0cBkesMmHgTX8bSDb8=;
 b=Q7OngM4LgYdYBvn/NQi0RS0hx8GhzszqGI9zXiinFmA3Fzi77VGyaa8C
 ifGUm74Hk9NBY/5M2QR0dAaQAZS7no8DLkXj+7fV2thvLTuwHaOSaLGu/
 skqOaWH4V+YkRWFd9jeX/579h6oGHMni1juvcTp2/Bi/s4EOyuXymIfeV
 XzGdsLYn/y3IHWpiPIH7xMMD06qjGX3UG+tu3dKuQowCHaJXPfof8pf+q
 RGGwR22EJLBbSes4AqrOjPG+EcmXpOH9s0EaFdpGGX9v81gMAs+T//9qm
 h9trqupK4EiItOxlMhpm5N8RU/auc3nLyc8SZTGZvUznDyCiy6GzyWGY3 w==;
X-CSE-ConnectionGUID: jyB59mV/T1ensjou2nCPNA==
X-CSE-MsgGUID: KcmYSn7US3SF+gFiwRFn0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="86667140"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="86667140"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:04:27 -0800
X-CSE-ConnectionGUID: /eTG9HdcQVaOFASGposZAQ==
X-CSE-MsgGUID: wCaodbDGTI+53AJo6q/Bnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201824511"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.21])
 ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:04:25 -0800
Message-ID: <60ab8e82-a079-4ca1-adcc-ee50cfc5641d@intel.com>
Date: Tue, 6 Jan 2026 16:04:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: Prevent BUG_ON by validating rounded
 allocation
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
 <20251222065238.1661415-5-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251222065238.1661415-5-sanjay.kumar.yadav@intel.com>
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

On 22/12/2025 06:52, Sanjay Yadav wrote:
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
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

I think we should maybe add a fixes tag:

Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
Cc: <stable@vger.kernel.org> # v6.7+

?

I don't think current xe can actually trigger this yet, but not sure if 
amdgpu or something can somehow trigger this in some obscure case.

We could maybe also add:

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712

So it auto-closes plus gives some more context that this fix was 
motivated from code inspection and not some user report. Otherwise I 
think the change looks reasonable,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

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

