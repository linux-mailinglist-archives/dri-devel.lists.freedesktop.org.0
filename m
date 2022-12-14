Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810464D1FB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 22:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA9C10E498;
	Wed, 14 Dec 2022 21:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62E1910E49C;
 Wed, 14 Dec 2022 21:53:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4641FEC;
 Wed, 14 Dec 2022 13:54:33 -0800 (PST)
Received: from [10.57.88.237] (unknown [10.57.88.237])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EC343F5A1;
 Wed, 14 Dec 2022 13:53:52 -0800 (PST)
Message-ID: <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
Date: Wed, 14 Dec 2022 21:53:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Content-Language: en-GB
To: Luben Tuikov <luben.tuikov@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221212020821.8248-1-luben.tuikov@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-12 02:08, Luben Tuikov wrote:
> Fix screen corruption on older 32-bit systems using AGP chips.
> 
> On older systems with little memory, for instance 1.5 GiB, using an AGP chip,
> the device's DMA mask is 0xFFFFFFFF, but the memory mask is 0x7FFFFFF, and
> subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
> false. As such the result of this static inline isn't suitable for the last
> argument to ttm_device_init()--it simply needs to now whether to use GFP_DMA32
> when allocating DMA buffers.

This sounds wrong to me. If the issues happen on systems without PAE it 
clearly can't have anything to with the actual DMA address size. Not to 
mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so 
GFP_DMA32 would be functionally meaningless anyway. Although the 
reported symptoms initially sounded like they could be caused by DMA 
going to the wrong place, that is also equally consistent with a loss of 
cache coherency.

My (limited) understanding of AGP is that the GART can effectively alias 
memory to a second physical address, so I could well believe that 
something somewhere in the driver stack needs to perform some cache 
maintenance to avoid coherency issues, and that in these particular 
setups whatever that is might be assuming the memory is direct-mapped 
and thus going wrong for highmem pages.

So as I said before, I really think this is not about using GFP_DMA32 at 
all, but about *not* using GFP_HIGHUSER.

Thanks,
Robin.

> Partially reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.
> 
> v2: Amend the commit description.
> 
> Cc: Mikhail Krylov <sqarert@gmail.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> Fixes: 33b3ad3788aba8 ("drm/radeon: handle PCIe root ports with addressing limitations")
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/radeon/radeon.h        | 1 +
>   drivers/gpu/drm/radeon/radeon_device.c | 2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 2 +-
>   3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 37dec92339b16a..4fe38fd9be3267 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2426,6 +2426,7 @@ struct radeon_device {
>   	struct radeon_wb		wb;
>   	struct radeon_dummy_page	dummy_page;
>   	bool				shutdown;
> +	bool                            need_dma32;
>   	bool				need_swiotlb;
>   	bool				accel_working;
>   	bool				fastfb_working; /* IGP feature*/
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 6344454a772172..3643a3cfe061bd 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1370,7 +1370,7 @@ int radeon_device_init(struct radeon_device *rdev,
>   	if (rdev->family == CHIP_CEDAR)
>   		dma_bits = 32;
>   #endif
> -
> +	rdev->need_dma32 = dma_bits == 32;
>   	r = dma_set_mask_and_coherent(&rdev->pdev->dev, DMA_BIT_MASK(dma_bits));
>   	if (r) {
>   		pr_warn("radeon: No suitable DMA available\n");
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index bdb4c0e0736ba2..3debaeb720d173 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -696,7 +696,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
>   			       rdev->ddev->anon_inode->i_mapping,
>   			       rdev->ddev->vma_offset_manager,
>   			       rdev->need_swiotlb,
> -			       dma_addressing_limited(&rdev->pdev->dev));
> +			       rdev->need_dma32);
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> 
> base-commit: 20e03e7f6e8efd42168db6d3fe044b804e0ede8f
