Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C190DA0550A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABFA10E278;
	Wed,  8 Jan 2025 08:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i8naJ405";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72A10E278
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736323892;
 bh=TxwksDZU5Djw4/Gi5IV3znfV9hyr4vQgfIwevQz5iP4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i8naJ4051+aXYbhxmvkH+vMnNTFS6pdU7lqGYcH2rAoXz9ji1ahx1hJYyPXa8QTtV
 4lJVxmoVJ0qbpF9oV9OaQKN2u+SffOil5vwI6hGXanzuweygNzO7sLDMxz08IZ7Ko+
 dWi753eXZBL9Aju5NGiZ3STWHn30Q7IhNw5deBXrEv+r1h8XOnTqmOhGf9vwZBEQMa
 LuiemoHlJ0dl9zutqIDLX4FMbLFxZqvDYlfsIEHCY+LQ+i6w646oovcpX/hE/fODwG
 cbIKeZhCh6hzsBNXU0i8bRJYJEJO9N5AcZQgweS4XbOgLSZ6ua/BEu1Zn46zvC+bsz
 8Cx2pcTm1ixig==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B867517E152A;
 Wed,  8 Jan 2025 09:11:31 +0100 (CET)
Date: Wed, 8 Jan 2025 09:11:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, <nd@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/panthor: Fix invalid handling of AS_LOCKADDR
Message-ID: <20250108091126.5a84266e@collabora.com>
In-Reply-To: <20250107172732.87044-1-florent.tomasin@arm.com>
References: <20250107172732.87044-1-florent.tomasin@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Tue, 7 Jan 2025 17:27:31 +0000
Florent Tomasin <florent.tomasin@arm.com> wrote:

> Arm Mali GPUs require AS_LOCKADDR region to be 32KB
> aligned, and does not support a size greater than
> the one specified by the HW property:
> `GPU_MMU_FEATURES_VA_BITS()`.
> 
> NOTES:
> - The size limitation is implementation defined.
> - Invalid alignment or size can result in an HW
>   undefined behaviour.
> 
> This patch modifies `lock_region()` to retrieve
> the maximum region size based on the HW property:
> `mmu_features`, and returns an error code if the
> requested size is not compliant with the HW
> limitation.
> 
> In addition, the function will guaranty the region
> is always 32KB aligned.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 37 ++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index c39e3eb1c15d..e834bc4d9a52 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -533,15 +533,20 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
>  	return status;
>  }
>  
> -static void lock_region(struct panthor_device *ptdev, u32 as_nr,
> -			u64 region_start, u64 size)
> +static int lock_region(struct panthor_device *ptdev, u32 as_nr,
> +		       u64 region_start, u64 size)
>  {
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> +	u64 full_va_range = 1ull << va_bits;

Looks like we have a few places where we need the full_va_range, so I'd
be in favor of adding the following helper:

static u64 mmu_va_range(const struct panthor_device *ptdev)
{
   u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);

   return 1ull << va_bits;
}


>  	u8 region_width;
>  	u64 region;
>  	u64 region_end = region_start + size;
>  
>  	if (!size)
> -		return;
> +		return 0;
> +
> +	if (drm_WARN_ON(&ptdev->base, region_end > full_va_range))
> +		return -EFAULT;

How about we keep the function void and adjust the region_end to avoid
the undefined behavior?

>  
>  	/*
>  	 * The locked region is a naturally aligned power of 2 block encoded as
> @@ -552,7 +557,8 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	 * zeroed and ends with the bit (and subsequent bits) set to one.
>  	 */
>  	region_width = max(fls64(region_start ^ (region_end - 1)),
> -			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
> +			   const_ilog2(AS_LOCK_REGION_MIN_SIZE));
> +

I agree that the name doesn't really reflect its content, and doing the
minus(1) mod when preparing the region value is clearer, but it doesn't
seem like a bug to me, and is unrelated to the other changes in this
patch (actually, it's not even mentioned in the commit message). For
all these reasons, I'd put it in a separate patch.

>  
>  	/*
>  	 * Mask off the low bits of region_start (which would be ignored by
> @@ -560,21 +566,25 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	 */
>  	region_start &= GENMASK_ULL(63, region_width);
>  
> -	region = region_width | region_start;
> +	region = (region_width - 1) | region_start;
>  
>  	/* Lock the region that needs to be updated */
>  	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
>  	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
> +
> +	return 0;
>  }
>  
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  				      u64 iova, u64 size, u32 op)
>  {
> +	int ret = 0;
> +
>  	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>  
>  	if (as_nr < 0)
> -		return 0;
> +		return ret;
>  
>  	/*
>  	 * If the AS number is greater than zero, then we can be sure
> @@ -583,7 +593,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	 */
>  
>  	if (op != AS_COMMAND_UNLOCK)
> -		lock_region(ptdev, as_nr, iova, size);
> +		ret = lock_region(ptdev, as_nr, iova, size);
> +
> +	if (ret)
> +		return ret;
>  
>  	/* Run the MMU operation */
>  	write_cmd(ptdev, as_nr, op);
> @@ -608,9 +621,12 @@ static int mmu_hw_do_operation(struct panthor_vm *vm,
>  static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  				 u64 transtab, u64 transcfg, u64 memattr)
>  {
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> +	u64 full_va_range = 1ull << va_bits;
>  	int ret;
>  
> -	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> +	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0,
> +					 full_va_range, AS_COMMAND_FLUSH_MEM);
>  	if (ret)
>  		return ret;
>  
> @@ -628,9 +644,12 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  
>  static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  {
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> +	u64 full_va_range = 1ull << va_bits;
>  	int ret;
>  
> -	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
> +	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0,
> +					 full_va_range, AS_COMMAND_FLUSH_MEM);
>  	if (ret)
>  		return ret;
>  

