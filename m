Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFABF1804
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0B10E437;
	Mon, 20 Oct 2025 13:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35B1A10E437
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:18:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D823D1063;
 Mon, 20 Oct 2025 06:17:57 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C00053F66E;
 Mon, 20 Oct 2025 06:18:03 -0700 (PDT)
Message-ID: <8f4c42d3-b0e9-4786-a14e-70045ec66489@arm.com>
Date: Mon, 20 Oct 2025 14:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/10] drm/panthor: Add support for Mali-G1 GPUs
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-11-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-11-karunika.choo@arm.com>
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

On 14/10/2025 10:43, Karunika Choo wrote:
> Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
> panthor_hw_arch_v14 entry with reset and L2 power management operations
> via the PWR_CONTROL block.
> 
> Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
> power domains. panthor_gpu_info_init() is updated to use this block for
> L2, tiler, and shader domain present register reads.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c | 30 ++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index c1b2fba311d8..dd5ffbea8cd8 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1493,3 +1493,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 77fd2c56e69f..7a47414d246e 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -4,6 +4,7 @@
>  #include "panthor_device.h"
>  #include "panthor_gpu.h"
>  #include "panthor_hw.h"
> +#include "panthor_pwr.h"
>  #include "panthor_regs.h"
>  
>  #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
> @@ -29,12 +30,28 @@ static struct panthor_hw panthor_hw_arch_v10 = {
>  	},
>  };
>  
> +static struct panthor_hw panthor_hw_arch_v14 = {
> +	.features = {
> +		BIT(PANTHOR_HW_FEATURE_PWR_CONTROL)
> +	},
> +	.ops = {
> +		.soft_reset = panthor_pwr_reset_soft,
> +		.l2_power_off = panthor_pwr_l2_power_off,
> +		.l2_power_on = panthor_pwr_l2_power_on,
> +	},
> +};
> +
>  static struct panthor_hw_entry panthor_hw_match[] = {
>  	{
>  		.arch_min = 10,
>  		.arch_max = 13,
>  		.hwdev = &panthor_hw_arch_v10,
>  	},
> +	{
> +		.arch_min = 14,
> +		.arch_max = 14,
> +		.hwdev = &panthor_hw_arch_v14,
> +	},
>  };
>  
>  static char *get_gpu_model_name(struct panthor_device *ptdev)
> @@ -82,6 +99,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  		fallthrough;
>  	case GPU_PROD_ID_MAKE(13, 1):
>  		return "Mali-G625";
> +	case GPU_PROD_ID_MAKE(14, 0):
> +		return "Mali-G1-Ultra";
> +	case GPU_PROD_ID_MAKE(14, 1):
> +		return "Mali-G1-Premium";
> +	case GPU_PROD_ID_MAKE(14, 3):
> +		return "Mali-G1-Pro";
>  	}
>  
>  	return "(Unknown Mali GPU)";
> @@ -114,6 +137,13 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  
>  	/* Introduced in arch 11.x */
>  	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
> +
> +	/* Introduced in arch 14.x */
> +	if (panthor_hw_has_feature(ptdev, PANTHOR_HW_FEATURE_PWR_CONTROL)) {
> +		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
> +		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
> +		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
> +	}

This should be instead of reading the GPU_SHADER_PRESENT etc registers.
At the moment we're reading a bunch of registers which are reserved on
the new GPUs, only to replace the values here.

Thanks,
Steve

>  }
>  
>  static void panthor_hw_info_init(struct panthor_device *ptdev)

