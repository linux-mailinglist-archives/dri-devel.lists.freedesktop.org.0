Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F1C3F9BA
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F46910EA7D;
	Fri,  7 Nov 2025 11:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F313A10EA7E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:00:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E028A1516;
 Fri,  7 Nov 2025 03:00:19 -0800 (PST)
Received: from [10.57.72.216] (unknown [10.57.72.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD3653F63F;
 Fri,  7 Nov 2025 03:00:25 -0800 (PST)
Message-ID: <6a5d346d-447f-4276-a326-4b7b23a748e5@arm.com>
Date: Fri, 7 Nov 2025 11:00:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] drm/panthor: Add support for Mali-G1 GPUs
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251027161334.854650-1-karunika.choo@arm.com>
 <20251027161334.854650-9-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251027161334.854650-9-karunika.choo@arm.com>
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
> Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
> panthor_hw_arch_v14 entry with reset and L2 power management operations
> via the PWR_CONTROL block.
> 
> Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
> power domains. panthor_gpu_info_init() is updated to use this block for
> L2, tiler, and shader domain present register reads.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v3:
>  * Fixed some includes.
> v2:
>  * Removed feature bits usage.
>  * Check panthor_hw_has_pwr_ctrl() to read the correct *_PRESENT
>    registers instead of reading reserved registers on newer GPUs.
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c | 35 ++++++++++++++++++++++++----
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 2ab974c9a09d..9450a917e66b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1501,3 +1501,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 1041201d83e5..263d4a525686 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -4,6 +4,7 @@
>  #include "panthor_device.h"
>  #include "panthor_gpu.h"
>  #include "panthor_hw.h"
> +#include "panthor_pwr.h"
> 
>  #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
>  	(((arch_major) << 24) | (prod_major))
> @@ -28,12 +29,25 @@ static struct panthor_hw panthor_hw_arch_v10 = {
>  	},
>  };
> 
> +static struct panthor_hw panthor_hw_arch_v14 = {
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
> @@ -81,6 +95,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
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
> @@ -107,12 +127,19 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
> 
>  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> 
> -	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
> -	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
> -	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
> -
>  	/* Introduced in arch 11.x */
>  	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
> +
> +	if (panthor_hw_has_pwr_ctrl(ptdev)) {
> +		/* Introduced in arch 14.x */
> +		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
> +		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
> +		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
> +	} else {
> +		ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
> +		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
> +		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
> +	}
>  }
> 
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
> --
> 2.49.0
> 

