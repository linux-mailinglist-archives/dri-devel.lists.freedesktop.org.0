Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57FB0C650
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E99510E288;
	Mon, 21 Jul 2025 14:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C48510E288
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:30:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E08153B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:30:14 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FE4A3F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:30:20 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:30:18 +0100
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
Subject: Re: [PATCH v5 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Message-ID: <aH5O-im06qJTOPkF@e110455-lin.cambridge.arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-2-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721111344.1610250-2-karunika.choo@arm.com>
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

On Mon, Jul 21, 2025 at 12:13:39PM +0100, Karunika Choo wrote:
> This patch introduces panthor_hw and moves the initialization of the
> gpu_info struct into panthor_hw.c in preparation of handling future GPU
> register and naming changes.
> 
> Future GPU support can be added by extending panthor_gpu_info_init()
> with the necessary register reads behind GPU architecture version guards
> if the change is minor. For more complex changes, the function can be
> forked and the appropriate function will need to be called based on the
> GPU architecture version.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/Makefile         |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
>  drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
>  5 files changed, 130 insertions(+), 95 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..02db21748c12 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -8,6 +8,7 @@ panthor-y := \
>  	panthor_gem.o \
>  	panthor_gpu.o \
>  	panthor_heap.o \
> +	panthor_hw.o \
>  	panthor_mmu.o \
>  	panthor_sched.o
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index f0b2da5b2b96..81df49880bd8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -18,6 +18,7 @@
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  			return ret;
>  	}
>  
> +	ret = panthor_hw_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
>  	ret = panthor_gpu_init(ptdev);
>  	if (ret)
>  		goto err_rpm_put;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index cb7a335e07d7..5e2c3173ae27 100644
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
> -	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
> -	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
> -	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
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
>  	gpu_write(ptdev, GPU_INT_CLEAR, status);
> @@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	spin_lock_init(&gpu->reqs_lock);
>  	init_waitqueue_head(&gpu->reqs_acked);
>  	ptdev->gpu = gpu;
> -	panthor_gpu_init_info(ptdev);
>  
>  	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
>  	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> new file mode 100644
> index 000000000000..3f7175cb0ab4
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#include "panthor_device.h"
> +#include "panthor_hw.h"
> +#include "panthor_regs.h"
> +
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
> +static void panthor_gpu_info_init(struct panthor_device *ptdev)
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
> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
> +}
> +
> +static void panthor_hw_info_init(struct panthor_device *ptdev)
> +{
> +	const struct panthor_model *model;
> +	u32 arch_major, product_major;
> +	u32 major, minor, status;
> +
> +	panthor_gpu_info_init(ptdev);
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
> +int panthor_hw_init(struct panthor_device *ptdev)
> +{
> +	panthor_hw_info_init(ptdev);
> +
> +	return 0;
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> new file mode 100644
> index 000000000000..0af6acc6aa6a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_HW_H__
> +#define __PANTHOR_HW_H__
> +
> +struct panthor_device;
> +
> +int panthor_hw_init(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_HW_H__ */
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
