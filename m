Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A4B10990
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78F010E93A;
	Thu, 24 Jul 2025 11:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FF8610E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:50:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D1A1A00;
 Thu, 24 Jul 2025 04:50:41 -0700 (PDT)
Received: from [10.1.33.48] (e122027.cambridge.arm.com [10.1.33.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D513F66E;
 Thu, 24 Jul 2025 04:50:44 -0700 (PDT)
Message-ID: <ae1d6b7c-c130-4e03-b387-1dfd55f2d07e@arm.com>
Date: Thu, 24 Jul 2025 12:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
 <20250724092600.3225493-7-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250724092600.3225493-7-karunika.choo@arm.com>
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

On 24/07/2025 10:26, Karunika Choo wrote:
> This patch adds firmware binary and GPU model naming support for
> Mali-Gx20 and Mali-Gx25 GPUs.
> 
> The GPU_COHERENCY_FEATURES macros are slightly reworked as the
> assumption that FEATURE = BIT(PROTOCOL) no longer holds with the
> introduction of the SHAREABLE_CACHE_SUPPORT, which is BIT(5) on the
> GPU_COHERENCY_PROTOCOL register. As such, the feature bits are now
> individually defined. Further changes were also made to enable
> SHAREABLE_CACHE_SUPPORT if coherency is enabled and the feature is
> supported.
> 
> This patch also fixes a minor bug that incorrectly writes ACE instead of
> ACE_LITE to GPU_COHERENCY_PROTOCOL if coherency is enabled.
> 
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

This patch should really be split up. The bug fix at least should really
be a separate patch (that way it can be backported).

I'd also prefer the GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT parts to be
split from the changes adding the new GPU name/firmware. There's no
actual dependency. Whereas in patch 4 you kind of get away with the uAPI
change being in with new GPU support because we need the new register
for the naming (although I think personally I would have split that too).

> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  3 +--
>  drivers/gpu/drm/panthor/panthor_fw.c     |  2 ++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 14 ++++++++++++--
>  drivers/gpu/drm/panthor/panthor_hw.c     | 18 ++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  5 ++++-
>  5 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 81df49880bd8..b85a744d99f8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -33,8 +33,7 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  	/* Check if the ACE-Lite coherency protocol is actually supported by the GPU.
>  	 * ACE protocol has never been supported for command stream frontend GPUs.
>  	 */
> -	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> -		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +	if (ptdev->gpu_info.coherency_features & GPU_COHERENCY_FEATURE_ACE_LITE)

Also this change shouldn't really be here - it's a valid optimisation
but completely independent of the other changes.

Thanks,
Steve

>  		return 0;
>  
>  	drm_err(&ptdev->base, "Coherency not supported by the device");
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index fa6e0b48a0b2..9bf06e55eaee 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 5e2c3173ae27..e8d8dbeefac7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -45,8 +45,18 @@ struct panthor_gpu {
>  
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
> -	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
> +	u32 coherency_protocol = GPU_COHERENCY_NONE;
> +
> +	if (ptdev->coherent) {
> +		coherency_protocol = GPU_COHERENCY_ACE_LITE;
> +
> +		if (ptdev->gpu_info.coherency_features &
> +		    GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT)
> +			coherency_protocol |=
> +				GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT;
> +	}
> +
> +	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL, coherency_protocol);
>  }
>  
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index a7583342d797..3fcb69a6f959 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  		fallthrough;
>  	case GPU_PROD_ID_MAKE(11, 3):
>  		return "Mali-G615";
> +	case GPU_PROD_ID_MAKE(12, 0):
> +		if (shader_core_count >= 10 && ray_intersection)
> +			return "Mali-G720-Immortalis";
> +		else if (shader_core_count >= 6)
> +			return "Mali-G720";
> +
> +		fallthrough;
> +	case GPU_PROD_ID_MAKE(12, 1):
> +		return "Mali-G620";
> +	case GPU_PROD_ID_MAKE(13, 0):
> +		if (shader_core_count >= 10 && ray_intersection)
> +			return "Mali-G925-Immortalis";
> +		else if (shader_core_count >= 6)
> +			return "Mali-G725";
> +
> +		fallthrough;
> +	case GPU_PROD_ID_MAKE(13, 1):
> +		return "Mali-G625";
>  	}
>  
>  	return "(Unknown Mali GPU)";
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 8bee76d01bf8..1beb365c0fec 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -111,12 +111,15 @@
>  #define GPU_REVID					0x280
>  
>  #define GPU_COHERENCY_FEATURES				0x300
> -#define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
> +#define   GPU_COHERENCY_FEATURE_ACE_LITE		BIT(0)
> +#define   GPU_COHERENCY_FEATURE_ACE			BIT(1)
> +#define   GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT	BIT(5)
>  
>  #define GPU_COHERENCY_PROTOCOL				0x304
>  #define   GPU_COHERENCY_ACE_LITE			0
>  #define   GPU_COHERENCY_ACE				1
>  #define   GPU_COHERENCY_NONE				31
> +#define   GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT		BIT(5)
>  
>  #define MCU_CONTROL					0x700
>  #define MCU_CONTROL_ENABLE				1

