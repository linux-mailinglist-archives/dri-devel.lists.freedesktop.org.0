Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AFEA6B5E8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0E10E70C;
	Fri, 21 Mar 2025 08:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WdvJiPOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF4010E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742545011;
 bh=cCE5oOPiACIOd4uyLLq5AwJQYfAxX91rUeu/sbR50mI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WdvJiPOcMKWXXqNxivV8Fo//+MIYyfu8uWRP0t3QVrRUDUMwn2iQ1SZvTJoEQPjl6
 k6UdKAHrRPwYlzBjOvPxK301ztdqakYNcheoeai+mKHsitnbb6KDNd7D11UFxuOgsZ
 VpJwdzv7qXv8byKArYT23XPquWzItCqIW8TucJTVNSnGMksE1gq6iSG1WxkbsKqlBI
 vCJhmwti4oDUbDzrh679lW4U+ue/ChT2Guu1Ev0CD8P3fVjl4ozuwJdq72fLroPT8j
 rLMOeZRQPQzjvCgiYnQelp1CilWerFuPAQqKeQN+Z3QlSEHhdj6EH6vTnhV8sz64PG
 fgmR45wV7Gk/A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8237F17E0C38;
 Fri, 21 Mar 2025 09:16:50 +0100 (CET)
Date: Fri, 21 Mar 2025 09:16:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] drm/panthor: Move GPU info initialization into
 panthor_hw.c
Message-ID: <20250321091645.0edec07a@collabora.com>
In-Reply-To: <20250320111741.1937892-5-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-5-karunika.choo@arm.com>
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

On Thu, 20 Mar 2025 11:17:36 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch moves GPU info initialization into panthor_hw.c in
> preparation of handling GPU register changes. The GPU register reading
> operations to populate gpu_info are separated into an architecture
> specific arch_*_gpu_info_init() function and is called via the new
> function pointer abstraction under hw.ops.gpu_info_init().
> 
> Future GPU support will be performed by implementing a *_gpu_info_init()
> function specific to that architecture version. It can call any existing
> *_gpu_info_init() and extend it with additional register reads or
> provide an entirely different implementation.

Could you give us an insight into what the reg layout changes are? So
far, they were mostly unchanged between GPU gens, and I'd really
prefer we could keep the majority of them unchanged part of the commo 
discovery, and only add the missing reads in the ->gpu_info_init()
callback.

Note that I'm also working on abstracting mali device operations to add
JM support to panthor, and the only things I had to specialize are:

- CSF ID for CSF
- JS features/present masks for JM

The rest is just common. So what I have is a common gpu_init_info()
helper that reads all the regs excepts those two, and after that, I
have a device ops selection based on the arch major of the GPU ID [1].
The device-specific GPU info are then read as part of the
panthor_device_ops::init().

> 
> This patch will enable Panthor to support GPUs with changes to register
> offsets, size and fields.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c |  95 -----------------------
>  drivers/gpu/drm/panthor/panthor_hw.c  | 105 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h  |   3 +-
>  3 files changed, 107 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 0dee011fe2e9..fcdee8901482 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -37,40 +37,6 @@ struct panthor_gpu {
>  	wait_queue_head_t reqs_acked;
>  };
>  
> -/**
> - * struct panthor_model - GPU model description
> - */
> -struct panthor_model {
> -	/** @name: Model name. */
> -	const char *name;
> -
> -	/** @arch_major: Major version number of architecture. */
> -	u8 arch_major;
> -
> -	/** @product_major: Major version number of product. */
> -	u8 product_major;
> -};
> -
> -/**
> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
> - * by a combination of the major architecture version and the major product
> - * version.
> - * @_name: Name for the GPU model.
> - * @_arch_major: Architecture major.
> - * @_product_major: Product major.
> - */
> -#define GPU_MODEL(_name, _arch_major, _product_major) \
> -{\
> -	.name = __stringify(_name),				\
> -	.arch_major = _arch_major,				\
> -	.product_major = _product_major,			\
> -}
> -
> -static const struct panthor_model gpu_models[] = {
> -	GPU_MODEL(g610, 10, 7),
> -	{},
> -};
> -
>  #define GPU_INTERRUPTS_MASK	\
>  	(GPU_IRQ_FAULT | \
>  	 GPU_IRQ_PROTM_FAULT | \
> @@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
>  }
>  
> -static void panthor_gpu_init_info(struct panthor_device *ptdev)
> -{
> -	const struct panthor_model *model;
> -	u32 arch_major, product_major;
> -	u32 major, minor, status;
> -	unsigned int i;
> -
> -	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> -	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
> -	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
> -	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
> -	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
> -	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
> -	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
> -	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
> -	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
> -	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
> -	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
> -	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
> -	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
> -	for (i = 0; i < 4; i++)
> -		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
> -
> -	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> -
> -	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> -	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> -	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> -
> -	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> -	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> -	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> -	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> -	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
> -
> -	for (model = gpu_models; model->name; model++) {
> -		if (model->arch_major == arch_major &&
> -		    model->product_major == product_major)
> -			break;
> -	}
> -
> -	drm_info(&ptdev->base,
> -		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> -		 major, minor, status);
> -
> -	drm_info(&ptdev->base,
> -		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
> -		 ptdev->gpu_info.l2_features,
> -		 ptdev->gpu_info.tiler_features,
> -		 ptdev->gpu_info.mem_features,
> -		 ptdev->gpu_info.mmu_features,
> -		 ptdev->gpu_info.as_present);
> -
> -	drm_info(&ptdev->base,
> -		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
> -		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
> -		 ptdev->gpu_info.tiler_present);
> -}
> -
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	if (status & GPU_IRQ_FAULT) {
> @@ -203,7 +109,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	spin_lock_init(&gpu->reqs_lock);
>  	init_waitqueue_head(&gpu->reqs_acked);
>  	ptdev->gpu = gpu;
> -	panthor_gpu_init_info(ptdev);
>  
>  	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
>  	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 234bfd50cf0d..4cc4b0d5382c 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -5,10 +5,113 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> +/**
> + * struct panthor_model - GPU model description
> + */
> +struct panthor_model {
> +	/** @name: Model name. */
> +	const char *name;
> +
> +	/** @arch_major: Major version number of architecture. */
> +	u8 arch_major;
> +
> +	/** @product_major: Major version number of product. */
> +	u8 product_major;
> +};
> +
> +/**
> + * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
> + * by a combination of the major architecture version and the major product
> + * version.
> + * @_name: Name for the GPU model.
> + * @_arch_major: Architecture major.
> + * @_product_major: Product major.
> + */
> +#define GPU_MODEL(_name, _arch_major, _product_major) \
> +{\
> +	.name = __stringify(_name),				\
> +	.arch_major = _arch_major,				\
> +	.product_major = _product_major,			\
> +}
> +
> +static const struct panthor_model gpu_models[] = {
> +	GPU_MODEL(g610, 10, 7),
> +	{},
> +};
> +
> +static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
> +{
> +	unsigned int i;
> +
> +	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> +	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
> +	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
> +	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
> +	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
> +	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
> +	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
> +	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
> +	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
> +	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
> +	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
> +	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
> +	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
> +	for (i = 0; i < 4; i++)
> +		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
> +
> +	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> +
> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> +}
> +
> +static void panthor_gpu_init_info(struct panthor_device *ptdev)
> +{
> +	const struct panthor_model *model;
> +	u32 arch_major, product_major;
> +	u32 major, minor, status;
> +
> +	ptdev->hw->ops.gpu_info_init(ptdev);
> +
> +	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> +	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> +	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> +	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> +	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
> +
> +	for (model = gpu_models; model->name; model++) {
> +		if (model->arch_major == arch_major &&
> +		    model->product_major == product_major)
> +			break;
> +	}
> +
> +	drm_info(&ptdev->base,
> +		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> +		 major, minor, status);
> +
> +	drm_info(&ptdev->base,
> +		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
> +		 ptdev->gpu_info.l2_features,
> +		 ptdev->gpu_info.tiler_features,
> +		 ptdev->gpu_info.mem_features,
> +		 ptdev->gpu_info.mmu_features,
> +		 ptdev->gpu_info.as_present);
> +
> +	drm_info(&ptdev->base,
> +		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
> +		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
> +		 ptdev->gpu_info.tiler_present);
> +}
> +
>  static struct panthor_hw panthor_hw_devices[] = {
>  	{
>  		.arch_id = GPU_ARCH_ID_MAKE(10, 0, 0),
>  		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
> +		.ops = {
> +			.gpu_info_init = arch_10_8_gpu_info_init,
> +		},
>  	},
>  };
>  
> @@ -59,6 +162,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  
>  	ptdev->hw = hdev;
>  
> +	panthor_gpu_init_info(ptdev);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 5eb0549ad333..dfe0f86c5d76 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -31,7 +31,8 @@ struct panthor_hw_regmap {
>   * struct panthor_hw_ops - HW operations that are specific to a GPU
>   */
>  struct panthor_hw_ops {
> -
> +	/** @gpu_info_init: Function pointer to initialize GPU info. */
> +	void (*gpu_info_init)(struct panthor_device *ptdev);
>  };
>  
>  /**

