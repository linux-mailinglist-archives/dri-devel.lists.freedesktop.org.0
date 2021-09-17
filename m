Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D040F642
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 12:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0BC6EC19;
	Fri, 17 Sep 2021 10:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A88096EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 10:51:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB3C101E;
 Fri, 17 Sep 2021 03:51:02 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 695633F5A1;
 Fri, 17 Sep 2021 03:51:01 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost: Calculate lock region size correctly
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210903094957.74560-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <4592bd5e-5110-1568-9373-232c66f9fefe@arm.com>
Date: Fri, 17 Sep 2021 11:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903094957.74560-1-steven.price@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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

On 03/09/2021 10:49, Steven Price wrote:
> It turns out that when locking a region, the region must be a naturally
> aligned power of 2. The upshot of this is that if the desired region
> crosses a 'large boundary' the region size must be increased
> significantly to ensure that the locked region completely covers the
> desired region. Previous calculations (including in kbase for the
> proprietary driver) failed to take this into account.
> 
> Since it's known that the lock region must be naturally aligned we can
> compute the required size by looking at the highest bit position which
> changes between the start/end of the lock region (subtracting 1 from the
> end because the end address is exclusive). The start address is then
> aligned based on the size (this is technically unnecessary as the
> hardware will ignore these bits, but the spec advises to do this "to
> avoid confusion").
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Pushed to drm-misc-next, thanks for the reviews.

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 30 +++++++++++++++++++------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index dfe5f1d29763..e2629b8d6a02 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -58,17 +58,33 @@ static int write_cmd(struct panfrost_device *pfdev, u32 as_nr, u32 cmd)
>  }
>  
>  static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
> -			u64 iova, u64 size)
> +			u64 region_start, u64 size)
>  {
>  	u8 region_width;
> -	u64 region = iova & PAGE_MASK;
> +	u64 region;
> +	u64 region_end = region_start + size;
>  
> -	/* The size is encoded as ceil(log2) minus(1), which may be calculated
> -	 * with fls. The size must be clamped to hardware bounds.
> +	if (!size)
> +		return;
> +
> +	/*
> +	 * The locked region is a naturally aligned power of 2 block encoded as
> +	 * log2 minus(1).
> +	 * Calculate the desired start/end and look for the highest bit which
> +	 * differs. The smallest naturally aligned block must include this bit
> +	 * change, the desired region starts with this bit (and subsequent bits)
> +	 * zeroed and ends with the bit (and subsequent bits) set to one.
>  	 */
> -	size = max_t(u64, size, AS_LOCK_REGION_MIN_SIZE);
> -	region_width = fls64(size - 1) - 1;
> -	region |= region_width;
> +	region_width = max(fls64(region_start ^ (region_end - 1)),
> +			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
> +
> +	/*
> +	 * Mask off the low bits of region_start (which would be ignored by
> +	 * the hardware anyway)
> +	 */
> +	region_start &= GENMASK_ULL(63, region_width);
> +
> +	region = region_width | region_start;
>  
>  	/* Lock the region that needs to be updated */
>  	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), region & 0xFFFFFFFFUL);
> 

