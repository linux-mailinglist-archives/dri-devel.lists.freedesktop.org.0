Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ACAE6208
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 12:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C1510E56A;
	Tue, 24 Jun 2025 10:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C894510E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 10:17:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64914106F;
 Tue, 24 Jun 2025 03:17:28 -0700 (PDT)
Received: from [10.57.29.71] (unknown [10.57.29.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288333F63F;
 Tue, 24 Jun 2025 03:17:42 -0700 (PDT)
Message-ID: <cce6854f-a859-40e2-8ce9-dc33aa822754@arm.com>
Date: Tue, 24 Jun 2025 11:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
> 
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/Makefile        |   3 +-
>   drivers/accel/rocket/rocket_device.c |   4 ++
>   drivers/accel/rocket/rocket_device.h |   2 +
>   drivers/accel/rocket/rocket_drv.c    |   7 ++-
>   drivers/accel/rocket/rocket_gem.c    | 115 +++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_gem.h    |  27 ++++++++
>   include/uapi/drm/rocket_accel.h      |  44 ++++++++++++++
>   7 files changed, 200 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> index abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96..4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f 100644
> --- a/drivers/accel/rocket/Makefile
> +++ b/drivers/accel/rocket/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
>   rocket-y := \
>   	rocket_core.o \
>   	rocket_device.o \
> -	rocket_drv.o
> +	rocket_drv.o \
> +	rocket_gem.o
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index a05c103e117e3eaa6439884b7acb6e3483296edb..5e559104741af22c528914c96e44558323ab6c89 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -4,6 +4,7 @@
>   #include <linux/array_size.h>
>   #include <linux/clk.h>
>   #include <linux/dev_printk.h>
> +#include <linux/mutex.h>
>   
>   #include "rocket_device.h"
>   
> @@ -16,10 +17,13 @@ int rocket_device_init(struct rocket_device *rdev)
>   	if (err)
>   		return err;
>   
> +	mutex_init(&rdev->iommu_lock);
> +
>   	return 0;
>   }
>   
>   void rocket_device_fini(struct rocket_device *rdev)
>   {
> +	mutex_destroy(&rdev->iommu_lock);
>   	rocket_core_fini(&rdev->cores[0]);
>   }
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> index b5d5f1479d56e2fde59bbcad9de2b58cef9a9a4d..10acfe8534f00a7985d40a93f4b2f7f69d43caee 100644
> --- a/drivers/accel/rocket/rocket_device.h
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -13,6 +13,8 @@
>   struct rocket_device {
>   	struct drm_device ddev;
>   
> +	struct mutex iommu_lock;
> +
>   	struct rocket_core *cores;
>   	unsigned int num_cores;
>   };
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index b38a5c6264cb4e74d5e381adaeba1426e576fa56..2b8a88db20c408f313f4f4fe36b051c9d5e4829b 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_of.h>
> +#include <drm/rocket_accel.h>
>   #include <linux/array_size.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
> @@ -16,6 +17,7 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "rocket_drv.h"
> +#include "rocket_gem.h"
>   
>   static int
>   rocket_open(struct drm_device *dev, struct drm_file *file)
> @@ -46,6 +48,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
>   static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
>   #define ROCKET_IOCTL(n, func) \
>   	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
> +
> +	ROCKET_IOCTL(CREATE_BO, create_bo),
>   };
>   
>   DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> @@ -55,9 +59,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
>    * - 1.0 - initial interface
>    */
>   static const struct drm_driver rocket_drm_driver = {
> -	.driver_features	= DRIVER_COMPUTE_ACCEL,
> +	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
>   	.open			= rocket_open,
>   	.postclose		= rocket_postclose,
> +	.gem_create_object	= rocket_gem_create_object,
>   	.ioctls			= rocket_drm_driver_ioctls,
>   	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
>   	.fops			= &rocket_accel_driver_fops,
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..61b7f970a6885aa13784daa1222611a02aa10dee
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_utils.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +
> +#include "rocket_device.h"
> +#include "rocket_drv.h"
> +#include "rocket_gem.h"
> +
> +static void rocket_gem_bo_free(struct drm_gem_object *obj)
> +{
> +	struct rocket_device *rdev = to_rocket_device(obj->dev);
> +	struct rocket_gem_object *bo = to_rocket_bo(obj);
> +	size_t unmapped;
> +
> +	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
> +
> +	guard(mutex)(&rdev->iommu_lock);
> +
> +	unmapped = iommu_unmap(bo->domain, bo->base.sgt->sgl->dma_address, bo->size);
> +	drm_WARN_ON(obj->dev, unmapped != bo->size);
> +
> +	/* This will unmap the pages from the IOMMU linked to core 0 */

This means "DMA-unmap the pages", right? If things have been done 
correctly then the iommu_unmap() above will already have removed the 
actual translation all cores' IOMMUs were using.

> +	drm_gem_shmem_free(&bo->base);
> +}
> +
> +static const struct drm_gem_object_funcs rocket_gem_funcs = {
> +	.free = rocket_gem_bo_free,
> +	.print_info = drm_gem_shmem_object_print_info,
> +	.pin = drm_gem_shmem_object_pin,
> +	.unpin = drm_gem_shmem_object_unpin,
> +	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> +	.vmap = drm_gem_shmem_object_vmap,
> +	.vunmap = drm_gem_shmem_object_vunmap,
> +	.mmap = drm_gem_shmem_object_mmap,
> +	.vm_ops = &drm_gem_shmem_vm_ops,
> +};
> +
> +struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
> +{
> +	struct rocket_gem_object *obj;
> +
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj->base.base.funcs = &rocket_gem_funcs;
> +
> +	return &obj->base.base;
> +}
> +
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct rocket_file_priv *rocket_priv = file->driver_priv;
> +	struct drm_rocket_create_bo *args = data;
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_gem_shmem_object *shmem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_object *gem_obj;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	shmem_obj = drm_gem_shmem_create(dev, args->size);
> +	if (IS_ERR(shmem_obj))
> +		return PTR_ERR(shmem_obj);
> +
> +	gem_obj = &shmem_obj->base;
> +	rkt_obj = to_rocket_bo(gem_obj);
> +
> +	rkt_obj->domain = rocket_priv->domain;
> +	rkt_obj->size = args->size;
> +	rkt_obj->offset = 0;
> +
> +	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
> +	drm_gem_object_put(gem_obj);
> +
> +	guard(mutex)(&rdev->iommu_lock);
> +
> +	if (ret)
> +		goto err;
> +
> +	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		goto err;
> +	}
> +
> +	ret = iommu_map_sgtable(rocket_priv->domain,
> +				shmem_obj->sgt->sgl->dma_address,

Is this expected to be a DMA address implicitly generated by the 
dma_map_sg() in drm_gem_shmem_get_pages_sgt()? I would strongly 
recommend against relying on that - at the moment it happens that 
iommu-dma still does complete dma_map_* operations in the unattached DMA 
ops domain, mostly redundantly, but I've long been meaning to optimise 
that so that it only performs any necessary cache maintenance on the 
underlying memory when the caller is already using their own IOMMU 
domain. At that point the returned DMA address is likely to just be the 
PA, and this tactic probably won't work.

> +				shmem_obj->sgt,
> +				IOMMU_READ | IOMMU_WRITE);
> +	if (ret < 0 || ret < args->size) {
> +		drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
> +			ret, args->size);
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	/* iommu_map_sgtable might have aligned the size */
> +	rkt_obj->size = ret;
> +	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);

What's this for? The buffer is already in for_device state when it 
initially comes back from get_pages_sgt, and hasn't even been touched 
yet anyway.

Thanks,
Robin.

> +	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
> +	args->dma_address = sg_dma_address(shmem_obj->sgt->sgl);
> +
> +	return 0;
> +
> +err:
> +	drm_gem_shmem_object_free(gem_obj);
> +
> +	return ret;
> +}
> diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8a4d6213fd80419be2ec8af04583a67fb1a4b75
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_GEM_H__
> +#define __ROCKET_GEM_H__
> +
> +#include <drm/drm_gem_shmem_helper.h>
> +
> +struct rocket_gem_object {
> +	struct drm_gem_shmem_object base;
> +
> +	struct iommu_domain *domain;
> +	size_t size;
> +	u32 offset;
> +};
> +
> +struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
> +
> +int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
> +
> +static inline
> +struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
> +{
> +	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_object, base);
> +}
> +
> +#endif
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..95720702b7c4413d72b89c1f0f59abb22dc8c6b3
> --- /dev/null
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Tomeu Vizoso
> + */
> +#ifndef __DRM_UAPI_ROCKET_ACCEL_H__
> +#define __DRM_UAPI_ROCKET_ACCEL_H__
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define DRM_ROCKET_CREATE_BO			0x00
> +
> +#define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +
> +/**
> + * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> + *
> + */
> +struct drm_rocket_create_bo {
> +	/** Input: Size of the requested BO. */
> +	__u32 size;
> +
> +	/** Output: GEM handle for the BO. */
> +	__u32 handle;
> +
> +	/**
> +	 * Output: DMA address for the BO in the NPU address space.  This address
> +	 * is private to the DRM fd and is valid for the lifetime of the GEM
> +	 * handle.
> +	 */
> +	__u64 dma_address;
> +
> +	/** Output: Offset into the drm node to use for subsequent mmap call. */
> +	__u64 offset;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* __DRM_UAPI_ROCKET_ACCEL_H__ */
> 

