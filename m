Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9AC3F47C8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 11:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060EA89097;
	Mon, 23 Aug 2021 09:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA66189097
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 09:40:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B136D;
 Mon, 23 Aug 2021 02:40:47 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 396053F66F;
 Mon, 23 Aug 2021 02:40:46 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/panfrost: Simplify lock_region calculation
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-2-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <192e5a1b-2caf-11a8-f090-ec5649ea16b5@arm.com>
Date: Mon, 23 Aug 2021 10:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820213117.13050-2-alyssa.rosenzweig@collabora.com>
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

On 20/08/2021 22:31, Alyssa Rosenzweig wrote:
> In lock_region, simplify the calculation of the region_width parameter.
> This field is the size, but encoded as log2(ceil(size)) - 1.
> log2(ceil(size)) may be computed directly as fls(size - 1). However, we
> want to use the 64-bit versions as the amount to lock can exceed
> 32-bits.
> 
> This avoids undefined behaviour when locking all memory (size ~0),
> caught by UBSAN.

It might have been useful to mention what it is that UBSAN specifically
picked up (it took me a while to spot) - but anyway I think there's a
bigger issue with it being completely wrong when size == ~0 (see below).

> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Reported-and-tested-by: Chris Morgan <macromorgan@hotmail.com>
> Cc: <stable@vger.kernel.org>

However, I've confirmed this returns the same values and is certainly
more simple, so:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 0da5b3100ab1..f6e02d0392f4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -62,21 +62,12 @@ static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
>  {
>  	u8 region_width;
>  	u64 region = iova & PAGE_MASK;
> -	/*
> -	 * fls returns:
> -	 * 1 .. 32
> -	 *
> -	 * 10 + fls(num_pages)
> -	 * results in the range (11 .. 42)
> -	 */
> -
> -	size = round_up(size, PAGE_SIZE);

This seems to be the first issue - ~0 will be 'rounded up' to 0.

>  
> -	region_width = 10 + fls(size >> PAGE_SHIFT);

fls(0) == 0, so region_width == 10.

> -	if ((size >> PAGE_SHIFT) != (1ul << (region_width - 11))) {

Presumably here's where UBSAN objects - we're shifting by a negative
value, which even it it happens to works means the lock region is tiny
and certainly not what was intended! It might well be worth a:

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")

Note for anyone following along at (working-from-) home: although this
code was cargo culted from kbase - kbase is fine because it takes a pfn
and doesn't do the round_up() stage.

Which also exposes the second bug (fixed in patch 2): a size_t isn't big
enough on 32 bit platforms (all Midgard/Bifrost GPUs have a VA size
bigger than 32 bits). Again kbase gets away with a u32 because it's a pfn.

There is potentially a third bug which kbase only recently attempted to
fix. The lock address is effectively rounded down by the hardware (the
bottom bits are ignored). So if you have mask=(1<<region_width)-1 but
(iova & mask) != ((iova + size) & mask) then you are potentially failing
to lock the end of the intended region. kbase has added some code to
handle this:

> 	/* Round up if some memory pages spill into the next region. */
> 	region_frame_number_start = pfn >> (lockaddr_size_log2 - PAGE_SHIFT);
> 	region_frame_number_end =
> 	    (pfn + num_pages - 1) >> (lockaddr_size_log2 - PAGE_SHIFT);
> 
> 	if (region_frame_number_start < region_frame_number_end)
> 		lockaddr_size_log2 += 1;

I guess we should too?

Steve

> -		/* not pow2, so must go up to the next pow2 */
> -		region_width += 1;
> -	}
> +	/* The size is encoded as ceil(log2) minus(1), which may be calculated
> +	 * with fls. The size must be clamped to hardware bounds.
> +	 */
> +	size = max_t(u64, size, PAGE_SIZE);
> +	region_width = fls64(size - 1) - 1;
>  	region |= region_width;
>  
>  	/* Lock the region that needs to be updated */
> 

