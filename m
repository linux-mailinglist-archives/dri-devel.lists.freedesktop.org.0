Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49205C3F3DE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940C10E02E;
	Fri,  7 Nov 2025 09:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F38C10E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 09:48:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AB6114BF;
 Fri,  7 Nov 2025 01:48:26 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AA793F63F;
 Fri,  7 Nov 2025 01:48:31 -0800 (PST)
Message-ID: <af6a2cd5-fc59-4258-9cca-ba417ec2b3ae@arm.com>
Date: Fri, 7 Nov 2025 09:48:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/panthor: Add architecture-specific function
 operations
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251027161334.854650-1-karunika.choo@arm.com>
 <20251027161334.854650-3-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251027161334.854650-3-karunika.choo@arm.com>
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

On 27/10/2025 16:13, Karunika Choo wrote:
> Introduce architecture-specific function pointers to support
> architecture-dependent behaviours. This patch adds the following
> function pointers and updates their usage accordingly:
> 
> - soft_reset
> - l2_power_on
> - l2_power_off
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v3:
>  * Reverted includes changes to align with the include behaviour of the
>    rest of the driver while enabling the definition of static inline
>    function pointer accessors.
>  * Moved the function pointer accessors from panthor_device.h to
>    panthor_hw.h
> v2:
>  * Updated includes for panthor_hw.h to allow static inline function
>    pointer accessor functions instead of MACROs.
>  * updated l2_power_off function signature to void instead of returning
>    int as we have no way of handling a failure in this case.
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  4 +--
>  drivers/gpu/drm/panthor/panthor_device.h |  1 -
>  drivers/gpu/drm/panthor/panthor_fw.c     |  5 ++--
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 12 ++++++--
>  drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c     |  9 +++++-
>  drivers/gpu/drm/panthor/panthor_hw.h     | 35 +++++++++++++++++++++++-
>  7 files changed, 57 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 81df49880bd8..847dea458682 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -141,8 +141,8 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	panthor_sched_pre_reset(ptdev);
>  	panthor_fw_pre_reset(ptdev, true);
>  	panthor_mmu_pre_reset(ptdev);
> -	panthor_gpu_soft_reset(ptdev);
> -	panthor_gpu_l2_power_on(ptdev);
> +	panthor_hw_soft_reset(ptdev);
> +	panthor_hw_l2_power_on(ptdev);
>  	panthor_mmu_post_reset(ptdev);
>  	ret = panthor_fw_post_reset(ptdev);
>  	atomic_set(&ptdev->reset.pending, 0);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 1457c1255f1f..f8e37a24d081 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -26,7 +26,6 @@ struct panthor_device;
>  struct panthor_gpu;
>  struct panthor_group_pool;
>  struct panthor_heap_pool;
> -struct panthor_hw;

I don't understand this change. Was it left over from the include changes?

With that fixed:
Reviewed-by: Steven Price <steven.price@arm.com>

>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 9bf06e55eaee..e6c39c70d348 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -21,6 +21,7 @@
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -1184,7 +1185,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  	ptdev->fw->vm = NULL;
> 
>  	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
> -		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> +		panthor_hw_l2_power_off(ptdev);
>  }
> 
>  /**
> @@ -1363,7 +1364,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  		return ret;
>  	}
> 
> -	ret = panthor_gpu_l2_power_on(ptdev);
> +	ret = panthor_hw_l2_power_on(ptdev);
>  	if (ret)
>  		return ret;
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index db69449a5be0..63ed8c461796 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -18,6 +18,7 @@
> 
>  #include "panthor_device.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_regs.h"
> 
>  /**
> @@ -218,6 +219,11 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  	return 0;
>  }
> 
> +void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
> +{
> +	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> +}
> +
>  /**
>   * panthor_gpu_l2_power_on() - Power-on the L2-cache
>   * @ptdev: Device.
> @@ -344,9 +350,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
>  {
>  	/* On a fast reset, simply power down the L2. */
>  	if (!ptdev->reset.fast)
> -		panthor_gpu_soft_reset(ptdev);
> +		panthor_hw_soft_reset(ptdev);
>  	else
> -		panthor_gpu_power_off(ptdev, L2, 1, 20000);
> +		panthor_hw_l2_power_off(ptdev);
> 
>  	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
>  }
> @@ -361,6 +367,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
>  void panthor_gpu_resume(struct panthor_device *ptdev)
>  {
>  	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
> -	panthor_gpu_l2_power_on(ptdev);
> +	panthor_hw_l2_power_on(ptdev);
>  }
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index 7c17a8c06858..12e66f48ced1 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>  				   type ## _PWRTRANS, \
>  				   mask, timeout_us)
> 
> +void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
>  int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
>  int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  			     u32 l2, u32 lsc, u32 other);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index b6e7401327c3..ed0ebd53f4ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2025 ARM Limited. All rights reserved. */
> 
>  #include "panthor_device.h"
> +#include "panthor_gpu.h"
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
> 
> @@ -20,7 +21,13 @@ struct panthor_hw_entry {
>  	struct panthor_hw *hwdev;
>  };
> 
> -static struct panthor_hw panthor_hw_arch_v10 = {};
> +static struct panthor_hw panthor_hw_arch_v10 = {
> +	.ops = {
> +		.soft_reset = panthor_gpu_soft_reset,
> +		.l2_power_off = panthor_gpu_l2_power_off,
> +		.l2_power_on = panthor_gpu_l2_power_on,
> +	},
> +};
> 
>  static struct panthor_hw_entry panthor_hw_match[] = {
>  	{
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 39752de3e7ad..64616caa6f05 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -4,14 +4,47 @@
>  #ifndef __PANTHOR_HW_H__
>  #define __PANTHOR_HW_H__
> 
> -struct panthor_device;
> +#include "panthor_device.h"
> +
> +/**
> + * struct panthor_hw_ops - HW operations that are specific to a GPU
> + */
> +struct panthor_hw_ops {
> +	/** @soft_reset: Soft reset function pointer */
> +	int (*soft_reset)(struct panthor_device *ptdev);
> +
> +	/** @l2_power_off: L2 power off function pointer */
> +	void (*l2_power_off)(struct panthor_device *ptdev);
> +
> +	/** @l2_power_on: L2 power on function pointer */
> +	int (*l2_power_on)(struct panthor_device *ptdev);
> +};
> 
>  /**
>   * struct panthor_hw - GPU specific register mapping and functions
>   */
>  struct panthor_hw {
> +	/** @features: Bitmap containing panthor_hw_feature */
> +
> +	/** @ops: Panthor HW specific operations */
> +	struct panthor_hw_ops ops;
>  };
> 
>  int panthor_hw_init(struct panthor_device *ptdev);
> 
> +static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
> +{
> +	return ptdev->hw->ops.soft_reset(ptdev);
> +}
> +
> +static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
> +{
> +	return ptdev->hw->ops.l2_power_on(ptdev);
> +}
> +
> +static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
> +{
> +	ptdev->hw->ops.l2_power_off(ptdev);
> +}
> +
>  #endif /* __PANTHOR_HW_H__ */
> --
> 2.49.0
> 

