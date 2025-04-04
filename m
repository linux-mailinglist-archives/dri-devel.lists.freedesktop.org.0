Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C012A7B8CB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD910E334;
	Fri,  4 Apr 2025 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C9E610E334
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:25:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E4261007;
 Fri,  4 Apr 2025 01:25:22 -0700 (PDT)
Received: from [10.1.36.21] (e122027.cambridge.arm.com [10.1.36.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ABDA3F59E;
 Fri,  4 Apr 2025 01:25:19 -0700 (PDT)
Message-ID: <cf92f64d-b50e-4058-8ad7-703031088af6@arm.com>
Date: Fri, 4 Apr 2025 09:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/panthor: Let IRQ handlers clear the interrupts
 themselves
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250404080933.2912674-1-boris.brezillon@collabora.com>
 <20250404080933.2912674-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250404080933.2912674-5-boris.brezillon@collabora.com>
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

On 04/04/2025 09:09, Boris Brezillon wrote:
> MMU handler needs to be in control of the job interrupt clears because
> clearing the interrupt also unblocks the writer/reader that triggered
> the fault, and we don't want it to be unblocked until we've had a chance
> to process the IRQ.
> 
> Since clearing the clearing is just one line, let's make it explicit
> instead of doing it in the generic code path.
> 
> Note that this commit changes the existing behavior in that the MMU
> COMPLETED irqs are no longer cleared, which is fine because they are
> masked, so we're not risking an interrupt flood.
> 
> Changes in v3:
> - Mention the fact we no longer clear MMU COMPLETED irqs

Thanks!

Reviewed-by: Steven Price <steven.price@arm.com>

> - Add Liviu's R-b
> 
> Changes in v2:
> - Move the MMU_INT_CLEAR around
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 2 --
>  drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 7 +++++++
>  4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664..4c27b6d85f46 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -383,8 +383,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  		if (!status)									\
>  			break;									\
>  												\
> -		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
> -												\
>  		__handler(ptdev, status);							\
>  		ret = IRQ_HANDLED;								\
>  	}											\
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0f52766a3120..446bb377b953 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1008,6 +1008,8 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  
>  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
> +	gpu_write(ptdev, JOB_INT_CLEAR, status);
> +
>  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
>  		ptdev->fw->booted = true;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 671049020afa..32d678a0114e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -150,6 +150,8 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
> +	gpu_write(ptdev, GPU_INT_CLEAR, status);
> +
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>  		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 7cca97d298ea..0ba76982d45b 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1710,6 +1710,13 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  			access_type, access_type_name(ptdev, fault_status),
>  			source_id);
>  
> +		/* We don't handle VM faults at the moment, so let's just clear the
> +		 * interrupt and let the writer/reader crash.
> +		 * Note that COMPLETED irqs are never cleared, but this is fine
> +		 * because they are always masked.
> +		 */
> +		gpu_write(ptdev, MMU_INT_CLEAR, mask);
> +
>  		/* Ignore MMU interrupts on this AS until it's been
>  		 * re-enabled.
>  		 */

