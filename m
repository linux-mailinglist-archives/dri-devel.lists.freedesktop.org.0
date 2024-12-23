Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23629FB366
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 18:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A88910E331;
	Mon, 23 Dec 2024 17:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EFBD10E331
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:05:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616441424;
 Mon, 23 Dec 2024 09:05:40 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64D4C3F694;
 Mon, 23 Dec 2024 09:05:09 -0800 (PST)
Message-ID: <47eed1c9-7e31-4345-a991-3f9dced00d86@arm.com>
Date: Mon, 23 Dec 2024 17:05:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] drm/panthor: Use GPU_COMMAND.FLUSH_CACHES for
 cache maintenance
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241219170521.64879-1-karunika.choo@arm.com>
 <20241219170521.64879-5-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219170521.64879-5-karunika.choo@arm.com>
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

On 19/12/2024 17:05, Karunika Choo wrote:
> This patch adds support for performing cache maintenance operations via
> the GPU_CONTROL.GPU_COMMAND register instead of using FLUSH_PT or
> FLUSH_MEM commands from the AS_COMMAND register. This feature is enabled
> when the HW feature bit (PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH) is
> set.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_hw.c  |  3 ++
>  drivers/gpu/drm/panthor/panthor_hw.h  |  4 +++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 46 +++++++++++++++++++++++++--
>  4 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 9dadcea67a39..30dcb50409dd 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -276,7 +276,7 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  
>  	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
>  				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
> -				msecs_to_jiffies(100))) {
> +				msecs_to_jiffies(1000))) {

Unrelated change (or at least not mentioned in the commit message).

>  		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
>  		if ((ptdev->gpu->pending_reqs &
>  		     GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 0fb3adc093bc..3738f7fd106e 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -20,6 +20,9 @@ static struct panthor_hw panthor_hw_devices[] = {
>  	[PANTHOR_ARCH_10_8] = {
>  		.arch_id = GPU_ARCH_ID_MAKE(10, 8, 0),
>  		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
> +		.features = {
> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +		},

It's a little odd to have a 'feature bit' to declare something that (so
far) every GPU does. Do we need this feature bit?

>  		.map = {
>  			.mmu_as_base = ARCH_10_8_MMU_AS_BASE,
>  			.mmu_as_stride = ARCH_10_8_MMU_AS_STRIDE,
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 3409083d09d0..69fa8f51a8c9 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -13,6 +13,10 @@ struct panthor_device;
>   * New feature flags will be added with support for newer GPU architectures.
>   */
>  enum panthor_hw_feature {
> +	/** @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Cache maintenance via GPU_CONTROL*/
> +	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
> +
> +	/** @PANTHOR_HW_FEATURES_END: Number of HW feature bits */
>  	PANTHOR_HW_FEATURES_END
>  };
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 8a190dd2e06c..91c420538e02 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -29,6 +29,7 @@
>  
>  #include "panthor_device.h"
>  #include "panthor_gem.h"
> +#include "panthor_gpu.h"
>  #include "panthor_heap.h"
>  #include "panthor_hw.h"
>  #include "panthor_mmu.h"
> @@ -533,12 +534,19 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
>  
>  	/* write AS_COMMAND when MMU is ready to accept another command */
>  	status = wait_ready(ptdev, as_nr);
> -	if (!status)
> -		gpu_write(ptdev, MMU_AS(ptdev, as_nr) + AS_COMMAND, cmd);
> +	if (status)
> +		return status;
> +
> +	gpu_write(ptdev, MMU_AS(ptdev, as_nr) + AS_COMMAND, cmd);

Please try to put simple cleanups like this in a separate patch -
there's no functional change here.

Steve

>  
>  	return status;
>  }
>  
> +static int unlock_region(struct panthor_device *ptdev, u32 as_nr)
> +{
> +	return write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> +}
> +
>  static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  			u64 region_start, u64 size)
>  {
> @@ -573,6 +581,36 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> +static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
> +				       u32 op)
> +{
> +	const u32 l2_flush = CACHE_CLEAN | CACHE_INV;
> +	u32 lsc_flush = 0;
> +	int ret;
> +
> +	if (op == AS_COMMAND_FLUSH_MEM)
> +		lsc_flush = CACHE_CLEAN | CACHE_INV;
> +
> +	ret = wait_ready(ptdev, as_nr);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_gpu_flush_caches(ptdev, l2_flush, lsc_flush, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Explicitly unlock the region as the AS is not unlocked
> +	 * automatically at the end of the operation, unlike FLUSH_MEM
> +	 * or FLUSH_PT.
> +	 */
> +	ret = unlock_region(ptdev, as_nr);
> +	if (ret)
> +		return ret;
> +
> +	return wait_ready(ptdev, as_nr);
> +}
> +
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  				      u64 iova, u64 size, u32 op)
>  {
> @@ -590,6 +628,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	if (op != AS_COMMAND_UNLOCK)
>  		lock_region(ptdev, as_nr, iova, size);
>  
> +	if (panthor_hw_supports(ptdev, PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH) &&
> +	    (op == AS_COMMAND_FLUSH_PT || op == AS_COMMAND_FLUSH_MEM))
> +		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
> +
>  	/* Run the MMU operation */
>  	write_cmd(ptdev, as_nr, op);
>  

