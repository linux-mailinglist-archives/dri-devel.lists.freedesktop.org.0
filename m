Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF43FFC53
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 10:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6176E85E;
	Fri,  3 Sep 2021 08:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCB86E85E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 08:51:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF7021F44841;
 Fri,  3 Sep 2021 09:51:25 +0100 (BST)
Date: Fri, 3 Sep 2021 10:51:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Calculate lock region size correctly
Message-ID: <20210903105122.76471f98@collabora.com>
In-Reply-To: <20210902140038.221437-1-steven.price@arm.com>
References: <20210902140038.221437-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu,  2 Sep 2021 15:00:38 +0100
Steven Price <steven.price@arm.com> wrote:

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
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> See previous discussion[1] for more details. This bug also existed in
> the 'kbase' driver, so it's unlikely to actually hit very often.
> 
> This patch is based on drm-misc-next-fixes as it builds on top of
> Alyssa's changes to lock_region.
> 
> [1] https://lore.kernel.org/dri-devel/6fe675c4-d22b-22da-ba3c-f6d33419b9ed@arm.com/
> 
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 +++++++++++++++++++------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index dfe5f1d29763..afec15bb3db5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -58,17 +58,36 @@ static int write_cmd(struct panfrost_device *pfdev, u32 as_nr, u32 cmd)
>  }
>  
>  static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
> -			u64 iova, u64 size)
> +			u64 region_start, u64 size)
>  {
>  	u8 region_width;
> -	u64 region = iova & PAGE_MASK;
> +	u64 region;
> +	u64 region_size;
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
> +	 * change the desired region starts with this bit (and subsequent bits)
> +	 * zeroed and ends with the bit (and subsequent bits) set to one.
> +	 *

Nit: you can drop the empty comment line.

>  	 */
> -	size = max_t(u64, size, AS_LOCK_REGION_MIN_SIZE);
> -	region_width = fls64(size - 1) - 1;
> -	region |= region_width;
> +	region_size = region_start ^ (region_end - 1);

Hm, is region_size really encoding the size of the region to lock? I
mean, the logic seems correct but I wonder if it wouldn't be better to
drop the region_size variable and inline
'region_start ^ (region_end - 1)' in the region_width calculation to
avoid confusion.

Looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +	region_width = max(fls64(region_size),
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

