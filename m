Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB2AE6CEF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E881710E5F1;
	Tue, 24 Jun 2025 16:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 491C410E5F1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:52:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D731AC1;
 Tue, 24 Jun 2025 09:52:11 -0700 (PDT)
Received: from [10.57.29.113] (unknown [10.57.29.113])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 929923F58B;
 Tue, 24 Jun 2025 09:52:24 -0700 (PDT)
Message-ID: <eb5dd1dd-ae08-4ab6-9bdc-c17e99bbacbd@arm.com>
Date: Tue, 24 Jun 2025 17:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
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
 <20250606-6-10-rocket-v7-5-dc16cfe6fe4e@tomeuvizoso.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250606-6-10-rocket-v7-5-dc16cfe6fe4e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
> 
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
> 
> Initially based on the same IOCTLs from the Etnaviv driver.
> 
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
> 
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
> 
> v6:
> - Fix conversion logic to make sure we use DMA_BIDIRECTIONAL when needed
>    (Lucas Stach)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>   drivers/accel/rocket/rocket_drv.c |  2 +
>   drivers/accel/rocket/rocket_gem.c | 82 +++++++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_gem.h |  5 +++
>   include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
>   4 files changed, 126 insertions(+)
> 
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 4ab78193c186dfcfc3e323f16c588e85e6a8a334..eb9284ee2511f730afe6a532225c2706ce0e2822 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -62,6 +62,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
>   
>   	ROCKET_IOCTL(CREATE_BO, create_bo),
>   	ROCKET_IOCTL(SUBMIT, submit),
> +	ROCKET_IOCTL(PREP_BO, prep_bo),
> +	ROCKET_IOCTL(FINI_BO, fini_bo),
>   };
>   
>   DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
> index 61b7f970a6885aa13784daa1222611a02aa10dee..07024b6e71bf544dc7f00b008b9afb74b0c4e802 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -113,3 +113,85 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
>   
>   	return ret;
>   }
> +
> +static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
> +{
> +	op &= ROCKET_PREP_READ | ROCKET_PREP_WRITE;
> +
> +	if (op == ROCKET_PREP_READ)
> +		return DMA_FROM_DEVICE;
> +	else if (op == ROCKET_PREP_WRITE)
> +		return DMA_TO_DEVICE;
> +	else
> +		return DMA_BIDIRECTIONAL;
> +}
> +
> +int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_rocket_prep_bo *args = data;
> +	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_gem_object *gem_obj;
> +	struct drm_gem_shmem_object *shmem_obj;
> +	bool write = !!(args->op & ROCKET_PREP_WRITE);
> +	long ret = 0;
> +
> +	if (args->op & ~(ROCKET_PREP_READ | ROCKET_PREP_WRITE))
> +		return -EINVAL;
> +
> +	gem_obj = drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	ret = dma_resv_wait_timeout(gem_obj->resv, dma_resv_usage_rw(write),
> +				    true, timeout);
> +	if (!ret)
> +		ret = timeout ? -ETIMEDOUT : -EBUSY;
> +
> +	shmem_obj = &to_rocket_bo(gem_obj)->base;
> +
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {

Huh? If you need to sync the BO memory ever, then you need to sync it 
for the same device it was mapped, and certainly not 0 or 2+ times 
depending on how may cores happen to be enabled. Please throw 
CONFIG_DMA_API_DEBUG at this.

> +		dma_sync_sgtable_for_cpu(rdev->cores[core].dev, shmem_obj->sgt,
> +					 rocket_op_to_dma_dir(args->op));

Hmm, the intent of the API is really that the direction for sync should 
match the direction for map and unmap too; if it was mapped 
DMA_BIDIRECTIONAL then it should be synced DMA_BIDIRECTIONAL. If you 
have BOs which are really only used for one-directional purposes then 
they should be mapped as such at creation.

Does anything actually prevent one thread form trying to read from a 
buffer while another thread is writing it, and thus the read 
inintuitively destroying newly-written data (and/or the write 
unwittingly destroying its own data in FINI_BO because last_cpu_prep_op 
got overwritten)? Unless there's a significant measurable benefit to 
trying to be clever here (of which I'm somewhjat doubtful), I would be 
strongly inclined to just keep things simple and straightforward.

Thanks,
Robin.

> +	}
> +
> +	to_rocket_bo(gem_obj)->last_cpu_prep_op = args->op;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return ret;
> +}
> +
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_rocket_fini_bo *args = data;
> +	struct drm_gem_shmem_object *shmem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_object *gem_obj;
> +
> +	if (args->reserved != 0) {
> +		drm_dbg(dev, "Reserved field in drm_rocket_fini_bo struct should be 0.\n");
> +		return -EINVAL;
> +	}
> +
> +	gem_obj = drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	rkt_obj = to_rocket_bo(gem_obj);
> +	shmem_obj = &rkt_obj->base;
> +
> +	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
> +
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
> +					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
> +	}
> +
> +	rkt_obj->last_cpu_prep_op = 0;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
> index e8a4d6213fd80419be2ec8af04583a67fb1a4b75..a52a63cd78339a6150b99592ab5f94feeeb51fde 100644
> --- a/drivers/accel/rocket/rocket_gem.h
> +++ b/drivers/accel/rocket/rocket_gem.h
> @@ -12,12 +12,17 @@ struct rocket_gem_object {
>   	struct iommu_domain *domain;
>   	size_t size;
>   	u32 offset;
> +	u32 last_cpu_prep_op;
>   };
>   
>   struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
>   
>   int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
>   
> +int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *file);
> +
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file);
> +
>   static inline
>   struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
>   {
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> index cb1b5934c201160e7650aabd1b3a2b1c77b1fd7b..b5c80dd767be56e9720b51e4a82617a425a881a1 100644
> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -13,9 +13,13 @@ extern "C" {
>   
>   #define DRM_ROCKET_CREATE_BO			0x00
>   #define DRM_ROCKET_SUBMIT			0x01
> +#define DRM_ROCKET_PREP_BO			0x02
> +#define DRM_ROCKET_FINI_BO			0x03
>   
>   #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
>   #define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
> +#define DRM_IOCTL_ROCKET_PREP_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_PREP_BO, struct drm_rocket_prep_bo)
> +#define DRM_IOCTL_ROCKET_FINI_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_FINI_BO, struct drm_rocket_fini_bo)
>   
>   /**
>    * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> @@ -39,6 +43,39 @@ struct drm_rocket_create_bo {
>   	__u64 offset;
>   };
>   
> +#define ROCKET_PREP_READ        0x01
> +#define ROCKET_PREP_WRITE       0x02
> +
> +/**
> + * struct drm_rocket_prep_bo - ioctl argument for starting CPU ownership of the BO.
> + *
> + * Takes care of waiting for any NPU jobs that might still use the NPU and performs cache
> + * synchronization.
> + */
> +struct drm_rocket_prep_bo {
> +	/** Input: GEM handle of the buffer object. */
> +	__u32 handle;
> +
> +	/** Input: mask of ROCKET_PREP_x, direction of the access. */
> +	__u32 op;
> +
> +	/** Input: Amount of time to wait for NPU jobs. */
> +	__s64 timeout_ns;
> +};
> +
> +/**
> + * struct drm_rocket_fini_bo - ioctl argument for finishing CPU ownership of the BO.
> + *
> + * Synchronize caches for NPU access.
> + */
> +struct drm_rocket_fini_bo {
> +	/** Input: GEM handle of the buffer object. */
> +	__u32 handle;
> +
> +	/** Reserved, must be zero. */
> +	__u32 reserved;
> +};
> +
>   /**
>    * struct drm_rocket_task - A task to be run on the NPU
>    *
> 

