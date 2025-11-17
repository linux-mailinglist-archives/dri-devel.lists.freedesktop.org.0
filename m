Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAEC640BB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3786610E3AE;
	Mon, 17 Nov 2025 12:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B610E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 695A12B;
 Mon, 17 Nov 2025 04:29:47 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B243B3F740;
 Mon, 17 Nov 2025 04:29:53 -0800 (PST)
Message-ID: <cbd329ac-7943-40df-afef-0755a18b0297@arm.com>
Date: Mon, 17 Nov 2025 12:29:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/panthor: Always wait after sending a command
 to an AS
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
 <20251113103953.1519935-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113103953.1519935-2-boris.brezillon@collabora.com>
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
> There's currently no situation where we want to issue a command to an
> AS and not wait for this command to complete. The wait is either
> explicitly done (LOCK, UNLOCK) or it's missing (UPDATE). So let's
> turn write_cmd() into as_send_cmd_and_wait() that has the wait after
> a command is sent.
> 
> v2:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 6a41dfd7aaf3..186048fc2c25 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -524,27 +524,29 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
>  	return ret;
>  }
>  
> -static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
> +static int as_send_cmd_and_wait(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
>  {
>  	int status;
>  
>  	/* write AS_COMMAND when MMU is ready to accept another command */
>  	status = wait_ready(ptdev, as_nr);
> -	if (!status)
> +	if (!status) {
>  		gpu_write(ptdev, AS_COMMAND(as_nr), cmd);
> +		status = wait_ready(ptdev, as_nr);
> +	}
>  
>  	return status;
>  }
>  
> -static void lock_region(struct panthor_device *ptdev, u32 as_nr,
> -			u64 region_start, u64 size)
> +static int lock_region(struct panthor_device *ptdev, u32 as_nr,
> +		       u64 region_start, u64 size)
>  {
>  	u8 region_width;
>  	u64 region;
>  	u64 region_end = region_start + size;
>  
>  	if (!size)
> -		return;
> +		return 0;
>  
>  	/*
>  	 * The locked region is a naturally aligned power of 2 block encoded as
> @@ -567,7 +569,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  
>  	/* Lock the region that needs to be updated */
>  	gpu_write64(ptdev, AS_LOCKADDR(as_nr), region);
> -	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
> +	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
> @@ -600,9 +602,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	 * power it up
>  	 */
>  
> -	lock_region(ptdev, as_nr, iova, size);
> -
> -	ret = wait_ready(ptdev, as_nr);
> +	ret = lock_region(ptdev, as_nr, iova, size);
>  	if (ret)
>  		return ret;
>  
> @@ -615,10 +615,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	 * at the end of the GPU_CONTROL cache flush command, unlike
>  	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
>  	 */
> -	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> -
> -	/* Wait for the unlock command to complete */
> -	return wait_ready(ptdev, as_nr);
> +	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UNLOCK);
>  }
>  
>  static int mmu_hw_do_operation(struct panthor_vm *vm,
> @@ -647,7 +644,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  	gpu_write64(ptdev, AS_MEMATTR(as_nr), memattr);
>  	gpu_write64(ptdev, AS_TRANSCFG(as_nr), transcfg);
>  
> -	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
>  
>  static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
> @@ -662,7 +659,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	gpu_write64(ptdev, AS_MEMATTR(as_nr), 0);
>  	gpu_write64(ptdev, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>  
> -	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
> +	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
>  
>  static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)

