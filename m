Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF07C8EBBE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554BA10E75D;
	Thu, 27 Nov 2025 14:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6767110E75D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:23:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DFF2176A;
 Thu, 27 Nov 2025 06:23:21 -0800 (PST)
Received: from [10.1.31.95] (unknown [10.1.31.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D8053F73B;
 Thu, 27 Nov 2025 06:23:26 -0800 (PST)
Message-ID: <d5903a53-2949-442f-9823-bfdb3c83a66d@arm.com>
Date: Thu, 27 Nov 2025 14:23:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/panthor: Kill lock_region()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251126095029.3579267-1-boris.brezillon@collabora.com>
 <20251126095029.3579267-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126095029.3579267-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 26/11/2025 09:50, Boris Brezillon wrote:
> The meat in lock_region() is about packing a region range into a
> single u64. The rest is just a regular reg write plus a
> as_send_cmd_and_wait() call that can easily be inlined in
> mmu_hw_do_operation_locked().
> 
> v2:
> - New patch
> 
> v3:
> - Don't LOCK is the region has a zero size
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 186048fc2c25..752d88e61aec 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -538,14 +538,12 @@ static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd
>  	return status;
>  }
>  
> -static int lock_region(struct panthor_device *ptdev, u32 as_nr,
> -		       u64 region_start, u64 size)
> +static u64 pack_region_range(struct panthor_device *ptdev, u64 region_start, u64 size)
>  {
>  	u8 region_width;
> -	u64 region;
>  	u64 region_end = region_start + size;
>  
> -	if (!size)
> +	if (drm_WARN_ON_ONCE(&ptdev->base, !size))
>  		return 0;
>  
>  	/*
> @@ -565,11 +563,7 @@ static int lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	 */
>  	region_start &= GENMASK_ULL(63, region_width);
>  
> -	region = region_width | region_start;
> -
> -	/* Lock the region that needs to be updated */
> -	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
> -	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
> +	return region_width | region_start;
>  }
>  
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
> @@ -581,6 +575,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  
>  	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
>  
> +	if (!size)
> +		return 0;
> +
>  	switch (op) {
>  	case AS_COMMAND_FLUSH_MEM:
>  		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
> @@ -602,7 +599,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	 * power it up
>  	 */
>  
> -	ret = lock_region(ptdev, as_nr, iova, size);
> +	/* Lock the region that needs to be updated */
> +	gpu_write64(ptdev, AS_LOCKADDR(as_nr),
> +		    pack_region_range(ptdev, iova, size));
> +	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
>  	if (ret)
>  		return ret;
>  

