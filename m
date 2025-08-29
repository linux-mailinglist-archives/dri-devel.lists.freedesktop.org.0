Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB04B3BC95
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B3E10EBB8;
	Fri, 29 Aug 2025 13:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A94F810EBB8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 13:41:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 108B915A1;
 Fri, 29 Aug 2025 06:40:59 -0700 (PDT)
Received: from [10.1.29.20] (unknown [10.1.29.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC6A3F738;
 Fri, 29 Aug 2025 06:41:04 -0700 (PDT)
Message-ID: <35034ce0-46de-4417-9bd6-6ea90c5e9095@arm.com>
Date: Fri, 29 Aug 2025 14:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panthor: add asn-hash support
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828201806.3541261-1-olvaffe@gmail.com>
 <20250828201806.3541261-3-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250828201806.3541261-3-olvaffe@gmail.com>
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

On 28/08/2025 21:18, Chia-I Wu wrote:
> Parse asn-hash and enable custom ASN hash when the property exists.
> This is required on some socs such as mt8196.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

This mostly looks fine, although there is a question of naming. This was
renamed in a later version of the architecture to be L2C_SLICE_HASH
(rather than ASN_HASH).

I'm honestly not sure whether to stick with asn-hash (as it's out in the
wild already) or try to align with the newer spec and whether that will
create or avoid confusion!

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 28 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  6 +++++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 17 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  4 ++++
>  4 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 81df49880bd87..19423c495d8d7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -41,6 +41,30 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  	return -ENOTSUPP;
>  }
>  
> +static int panthor_gpu_asn_hash_init(struct panthor_device *ptdev)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32_array(ptdev->base.dev->of_node, "asn-hash",
> +					 ptdev->asn_hash,
> +					 ARRAY_SIZE(ptdev->asn_hash));
> +	if (ret) {
> +		if (ret == -EINVAL)
> +			ret = 0;
> +		return ret;
> +	}

NIT: I think this would be neater written as:

	if (ret == -EINVAL)
		return 0;
	else if (ret)
		return ret

Thanks,
Steve

> +
> +	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
> +		drm_err(&ptdev->base,
> +			"Custom ASN hash not supported by the device");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ptdev->has_asn_hash = true;
> +
> +	return 0;
> +}
> +
>  static int panthor_clk_init(struct panthor_device *ptdev)
>  {
>  	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
> @@ -257,6 +281,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_gpu;
>  
> +	ret = panthor_gpu_asn_hash_init(ptdev);
> +	if (ret)
> +		goto err_unplug_gpu;
> +
>  	ret = panthor_mmu_init(ptdev);
>  	if (ret)
>  		goto err_unplug_gpu;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4fc7cf2aeed57..6f8e2b3b037e5 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -114,6 +114,12 @@ struct panthor_device {
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
>  
> +	/** @has_asn_hash: True if custom ASN hash is enabled. */
> +	bool has_asn_hash;
> +
> +	/** @asn_hash: ASN_HASH values for custom ASN hash */
> +	u32 asn_hash[3];
> +
>  	/** @gpu_info: GPU information. */
>  	struct drm_panthor_gpu_info gpu_info;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index db69449a5be09..f9222b67f314d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -52,6 +52,22 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
>  }
>  
> +static void panthor_gpu_asn_hash_set(struct panthor_device *ptdev)
> +{
> +	u32 l2_config;
> +	u32 i;
> +
> +	if (!ptdev->has_asn_hash)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(ptdev->asn_hash); i++)
> +		gpu_write(ptdev, ASN_HASH(i), ptdev->asn_hash[i]);
> +
> +	l2_config = gpu_read(ptdev, L2_CONFIG);
> +	l2_config |= L2_CONFIG_ASN_HASH_ENABLE;
> +	gpu_write(ptdev, L2_CONFIG, l2_config);
> +}
> +
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	gpu_write(ptdev, GPU_INT_CLEAR, status);
> @@ -243,6 +259,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>  
>  	/* Set the desired coherency mode before the power up of L2 */
>  	panthor_gpu_coherency_set(ptdev);
> +	panthor_gpu_asn_hash_set(ptdev);
>  
>  	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 8bee76d01bf83..c9f795624e79b 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -64,6 +64,8 @@
>  
>  #define GPU_FAULT_STATUS				0x3C
>  #define GPU_FAULT_ADDR					0x40
> +#define L2_CONFIG					0x48
> +#define   L2_CONFIG_ASN_HASH_ENABLE			BIT(24)
>  
>  #define GPU_PWR_KEY					0x50
>  #define  GPU_PWR_KEY_UNLOCK				0x2968A819
> @@ -110,6 +112,8 @@
>  
>  #define GPU_REVID					0x280
>  
> +#define ASN_HASH(n)					(0x2C0 + ((n) * 4))
> +
>  #define GPU_COHERENCY_FEATURES				0x300
>  #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
>  

