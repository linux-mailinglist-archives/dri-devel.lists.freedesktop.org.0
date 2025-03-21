Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960D0A6B617
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953AD10E3B0;
	Fri, 21 Mar 2025 08:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pW6AjuUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9B710E3B0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742546097;
 bh=IUiv1Dk4x0/LObgNv49UZn+EB6p1E/ZHSgHyUxvLB3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pW6AjuUdgIH0Z0V77OFKYFq/5gZmwgoe5lL8gRzC4mG/a5aWmnj43KN2oUipyCT5n
 1sccBsd7m+uZrwp5p4rG4+aU6UNV+4rZQwy4dWxmGw770eXADlXXb7joipgGWBz3dx
 gfrLmY429N5H5Rvc5JirSS1TY9Q7DebwoIMJi61ju+yC/rjGbCaA6DRUIZFrXelnqT
 J8zueizXBwrD0AHg8vjRfpf8Ss+wawubSpuIIq3oAygBfLNKoCtagxcRhjKdvYQIMr
 NOZgjcU1UDYx6HDtMAZFXslj9syl7uSjOjvz4Dm9z4tGmVWDZYBdoNHgM/OZ7itnl4
 t6B1ig+KMRTPw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E995017E0C37;
 Fri, 21 Mar 2025 09:34:56 +0100 (CET)
Date: Fri, 21 Mar 2025 09:34:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] drm/panthor: Add support for Mali-G715 family of
 GPUs
Message-ID: <20250321093454.685d5fb3@collabora.com>
In-Reply-To: <20250320111741.1937892-7-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-7-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 20 Mar 2025 11:17:38 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> Mali-G715 introduces a new GPU_FEATURES register that provides
> information about GPU-wide supported features. The register value will
> be passed on to userspace via gpu_info. It also adds the following
> registers that are specific to the kernel driver only:
> - ASN_HASH_0~2
> - DOORBELL_FEATURES
> - PRFCNT_FEATURES
> - SYSC_ALLOC0~7
> - SYSC_PBHA_OVERRIDE0~3
> 
> Additionally, Mali-G715 presents an 'Immortalis' naming variant
> depending on the shader core count and presence of Ray Intersection
> feature support.
> 
> This patch adds:
> - support for correctly identifying the model names for the Mali-G715
>   family of GPUs.
> - arch 11.8 FW binary support
> - reading and handling of GPU_FEATURES register
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c   | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h | 12 ++++++++++++
>  include/uapi/drm/panthor_drm.h         |  3 +++
>  4 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index ecfbe0456f89..0b3fab95f26b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1398,3 +1398,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  }
>  
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 12183c04cd21..d04c8723ac98 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -32,15 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>  	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>  }
>  
> +static void arch_11_8_gpu_info_init(struct panthor_device *ptdev)
> +{
> +	arch_10_8_gpu_info_init(ptdev);
> +
> +	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES_LO);

That's typically the sort of specialization I would have done directly
in some csf_gpu_info_init() with a:

	if (ARCH_MAJOR(gpu_id) > 11) {
		ptdev->gpu_info.gpu_features =
			gpu_read64(ptdev, GPU_FEATURES_LO);
	}

I do see a benefit in abstracting things away when the layout is
completely different or when registers are conflicting, but that's not
the case AFAICT. I think for this kind of tweaks, we'd rather stick to a
single function with a few conditionals.

Actually, if the registers were readable and returning 0 on v10, you
don't even need the if (ARCH_MAJOR(gpu_id) > 11).

> +}
> +
>  static char *get_gpu_model_name(struct panthor_device *ptdev)
>  {
>  	const u32 gpu_id = ptdev->gpu_info.gpu_id;
>  	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>  						GPU_PROD_MAJOR(gpu_id));
> +	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
> +					 GPU_FEATURES_RAY_INTERSECTION);
> +	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
>  
>  	switch (product_id) {
>  	case GPU_PROD_ID_MAKE(10, 7):
>  		return "Mali-G610";
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
> @@ -84,6 +103,13 @@ static struct panthor_hw panthor_hw_devices[] = {
>  			.gpu_info_init = arch_10_8_gpu_info_init,
>  		},
>  	},
> +	{
> +		.arch_id = GPU_ARCH_ID_MAKE(11, 8, 0),
> +		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0xFF, 0),
> +		.ops = {
> +			.gpu_info_init = arch_11_8_gpu_info_init,
> +		}
> +	},
>  };
>  
>  static int init_gpu_id(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index d9e0769d6f1a..7bc2d838e704 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -74,6 +74,11 @@
>  #define GPU_PWR_OVERRIDE0				0x54
>  #define GPU_PWR_OVERRIDE1				0x58
>  
> +#define GPU_FEATURES_LO					0x60
> +#define GPU_FEATURES_HI					0x64
> +#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
> +#define GPU_PRFCNT_FEATURES				0x68
> +
>  #define GPU_TIMESTAMP_OFFSET_LO				0x88
>  #define GPU_TIMESTAMP_OFFSET_HI				0x8C
>  #define GPU_CYCLE_COUNT_LO				0x90
> @@ -88,6 +93,8 @@
>  
>  #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
>  
> +#define GPU_DOORBELL_FEATURES				0xC0
> +
>  #define GPU_SHADER_PRESENT_LO				0x100
>  #define GPU_SHADER_PRESENT_HI				0x104
>  #define GPU_TILER_PRESENT_LO				0x110
> @@ -132,6 +139,8 @@
>  
>  #define GPU_REVID					0x280
>  
> +#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
> +
>  #define GPU_COHERENCY_FEATURES				0x300
>  #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
>  
> @@ -140,6 +149,9 @@
>  #define   GPU_COHERENCY_ACE_LITE			1
>  #define   GPU_COHERENCY_NONE				31
>  
> +#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
> +#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
> +
>  #define MCU_CONTROL					0x700
>  #define MCU_CONTROL_ENABLE				1
>  #define MCU_CONTROL_AUTO				2
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..4aba8146af3b 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -307,6 +307,9 @@ struct drm_panthor_gpu_info {
>  
>  	/** @pad: MBZ. */
>  	__u32 pad;
> +
> +	/** @gpu_features: Bitmask describing supported GPU-wide features */
> +	__u64 gpu_features;
>  };
>  
>  /**

