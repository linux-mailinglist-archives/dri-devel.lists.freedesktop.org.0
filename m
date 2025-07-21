Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A7B0C6C8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEB6899D4;
	Mon, 21 Jul 2025 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3100899D4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:46:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACB2E153B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:46:27 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4521E3F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:46:33 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:46:31 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] drm/panthor: Add support for Mali-Gx15 family of
 GPUs
Message-ID: <aH5Sx15_pyMa1rmN@e110455-lin.cambridge.arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-5-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721111344.1610250-5-karunika.choo@arm.com>
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

On Mon, Jul 21, 2025 at 12:13:42PM +0100, Karunika Choo wrote:
> Mali-Gx15 introduces a new GPU_FEATURES register that provides
> information about GPU-wide supported features. The register value will
> be passed on to userspace via gpu_info. It also adds the following
> registers that are specific to the kernel driver only:
> - ASN_HASH_0~2
> - DOORBELL_FEATURES
> - PRFCNT_FEATURES
> - SYSC_ALLOC0~7
> - SYSC_PBHA_OVERRIDE0~3
> 
> Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
> depending on the shader core count and presence of Ray Intersection
> feature support.
> 
> This patch adds:
> - support for correctly identifying the model names for Mali-Gx15 GPUs.
> - arch 11.8 FW binary support
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h | 11 +++++++++++
>  include/uapi/drm/panthor_drm.h         |  3 +++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index b7b454d16f12..fa6e0b48a0b2 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 7f138974d43b..a7583342d797 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	const u32 gpu_id = ptdev->gpu_info.gpu_id;
>  	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>  						GPU_PROD_MAJOR(gpu_id));
> +	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
> +					 GPU_FEATURES_RAY_INTERSECTION);
> +	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
>  
>  	switch (product_id) {
>  	case GPU_PROD_ID_MAKE(10, 2):
> @@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  		return "Mali-G510";
>  	case GPU_PROD_ID_MAKE(10, 4):
>  		return "Mali-G310";
> +	case GPU_PROD_ID_MAKE(11, 2):
> +		if (shader_core_count > 10 && ray_intersection)
> +			return "Mali-G715-Immortalis";
> +		else if (shader_core_count >= 7)
> +			return "Mali-G715";
> +
> +		fallthrough;
> +	case GPU_PROD_ID_MAKE(11, 3):
> +		return "Mali-G615";
>  	}
>  
>  	return "(Unknown Mali GPU)";
> @@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
>  	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
>  	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
> +
> +	/* Introduced in arch 11.x */
> +	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
>  }
>  
>  static void panthor_hw_info_init(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 48bbfd40138c..e4c34f70a880 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -70,6 +70,10 @@
>  #define GPU_PWR_OVERRIDE0				0x54
>  #define GPU_PWR_OVERRIDE1				0x58
>  
> +#define GPU_FEATURES					0x60
> +#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
> +#define GPU_PRFCNT_FEATURES				0x68
> +
>  #define GPU_TIMESTAMP_OFFSET				0x88
>  #define GPU_CYCLE_COUNT					0x90
>  #define GPU_TIMESTAMP					0x98
> @@ -81,6 +85,8 @@
>  
>  #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))

Until they are actually used I would suggest that you remove the definitions for the
registers that are following this line.

With that change,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  
> +#define GPU_DOORBELL_FEATURES				0xC0
> +
>  #define GPU_SHADER_PRESENT				0x100
>  #define GPU_TILER_PRESENT				0x110
>  #define GPU_L2_PRESENT					0x120
> @@ -107,6 +113,8 @@
>  
>  #define GPU_REVID					0x280
>  
> +#define GPU_ASN_HASH(n)				(0x2C0 + ((n) * 4))
> +
>  #define GPU_COHERENCY_FEATURES				0x300
>  #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
>  
> @@ -115,6 +123,9 @@
>  #define   GPU_COHERENCY_ACE				1
>  #define   GPU_COHERENCY_NONE				31
>  
> +#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
> +#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
> +
>  #define MCU_CONTROL					0x700
>  #define MCU_CONTROL_ENABLE				1
>  #define MCU_CONTROL_AUTO				2
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e1f43deb7eca..467d365ed7ba 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
>  
>  	/** @pad: MBZ. */
>  	__u32 pad;
> +
> +	/** @gpu_features: Bitmask describing supported GPU-wide features */
> +	__u64 gpu_features;
>  };
>  
>  /**
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
