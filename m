Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2AC6423E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8158810E02F;
	Mon, 17 Nov 2025 12:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 183B410E02F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:45:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24019FEC;
 Mon, 17 Nov 2025 04:44:54 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FCCB3F740;
 Mon, 17 Nov 2025 04:45:00 -0800 (PST)
Message-ID: <bf18504d-5ff6-47f2-9936-3c798a337816@arm.com>
Date: Mon, 17 Nov 2025 12:44:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/panthor: Kill lock_region()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-3-boris.brezillon@collabora.com>
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

On 13/11/2025 10:39, Boris Brezillon wrote:
> The meat in lock_region() is about packing a region range into a
> single u64. The rest is just a regular reg write plus a
> as_send_cmd_and_wait() call that can easily be inlined in
> mmu_hw_do_operation_locked().
> 
> v2:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 186048fc2c25..f109c1588186 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -538,11 +538,9 @@ static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd
>  	return status;
>  }
>  
> -static int lock_region(struct panthor_device *ptdev, u32 as_nr,
> -		       u64 region_start, u64 size)
> +static u64 pack_region_range(u64 region_start, u64 size)
>  {
>  	u8 region_width;
> -	u64 region;
>  	u64 region_end = region_start + size;
>  
>  	if (!size)
Extra context:
>		return 0;
Rather than skipping the lock for size==0 you are now performing a lock
with LOCKADDR=0. The best documentation I can find for that says (for
LOCKADDR_SIZE in the Midgard architecture): "Values in the range 0 to 10
are undefined and should not be used".

I think later versions upped the minimum to 14 (log2(1<<15)-1) for
reasons due to supporting larger page sizes.

While I suspect this might work (since we don't actually need a lock
region when size==0) I don't think we should be relying on undefined
behaviour.

I think the simple solution is to move the size==0 check up into the caller.

Thanks,
Steve

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
> @@ -602,7 +596,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	 * power it up
>  	 */
>  
> -	ret = lock_region(ptdev, as_nr, iova, size);
> +	/* Lock the region that needs to be updated */
> +	gpu_write64(ptdev, AS_LOCKADDR(as_nr), pack_region_range(iova, size));
> +	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
>  	if (ret)
>  		return ret;
>  

