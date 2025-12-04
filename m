Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA72CA468E
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 17:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D410E991;
	Thu,  4 Dec 2025 16:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFDC210E94D;
 Thu,  4 Dec 2025 16:09:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4C6B339;
 Thu,  4 Dec 2025 08:09:11 -0800 (PST)
Received: from [10.1.38.32] (e122027.cambridge.arm.com [10.1.38.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF0863F66E;
 Thu,  4 Dec 2025 08:09:13 -0800 (PST)
Message-ID: <570b87b8-2ebb-40a9-b9c8-e3923cc30f3d@arm.com>
Date: Thu, 4 Dec 2025 16:09:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/13] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20251203090141.227394-1-boris.brezillon@collabora.com>
 <20251203090141.227394-11-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251203090141.227394-11-boris.brezillon@collabora.com>
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

On 03/12/2025 09:01, Boris Brezillon wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This will be used by the UMD to synchronize CPU-cached mappings when
> the UMD can't do it directly (no usermode cache maintenance instruction
> on Arm32).
> 
> v2:
> - Add more to the commit message
> - Change the flags to better match the drm_gem_shmem_sync semantics
> 
> v3:
> - Add Steve's R-b
> 
> v4:
> - No changes
> 
> v5:
> - Drop Steve's R-b (semantics changes requiring a new review)
> 
> v6:
> - Bail out early in panfrost_ioctl_sync_bo() if op_count is zero
> 
> v7:
> - Hand-roll our own bo_sync() helper
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 51 +++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 84 +++++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
>  include/uapi/drm/panfrost_drm.h         | 45 +++++++++++++
>  4 files changed, 182 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index d650cd138dad..77b0ae5ef000 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -580,6 +580,56 @@ static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
>  	return panfrost_jm_ctx_destroy(file, args->handle);
>  }
>  
> +static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct drm_panfrost_sync_bo *args = data;
> +	struct drm_panfrost_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret;
> +	u32 i;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	if (!args->op_count)
> +		return 0;
> +
> +	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
> +	if (!ops) {
> +		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
> +			   args->op_count * sizeof(*ops))) {
> +		DRM_DEBUG("Failed to copy in BO sync ops\n");
> +		ret = -EFAULT;
> +		goto err_ops;
> +	}
> +
> +	for (i = 0; i < args->op_count; i++) {
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panfrost_gem_sync(obj, ops[i].type,
> +					ops[i].offset, ops[i].size);
> +
> +		drm_gem_object_put(obj);
> +
> +		if (ret)
> +			goto err_ops;
> +	}
> +
> +err_ops:
> +	kvfree(ops);
> +
> +	return ret;
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -649,6 +699,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 4afd1a7f77d5..8231ae04f54c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -489,6 +489,90 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
>  	kfree_const(old_label);
>  }
>  
> +int
> +panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	struct drm_gem_shmem_object *shmem = &bo->base;
> +	const struct drm_device *dev = shmem->base.dev;
> +	struct sg_table *sgt;
> +	struct scatterlist *sgl;
> +	unsigned int count;
> +
> +	/* Make sure the range is in bounds. */
> +	if (offset + size < offset || offset + size > shmem->base.size)
> +		return -EINVAL;
> +
> +	/* Disallow CPU-cache maintenance on imported buffers. */
> +	if (drm_gem_is_imported(&shmem->base))
> +		return -EINVAL;
> +
> +	switch (type) {
> +	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
> +	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Don't bother if it's WC-mapped */
> +	if (shmem->map_wc)
> +		return 0;
> +
> +	/* Nothing to do if the size is zero. */
> +	if (size == 0)
> +		return 0;
> +
> +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> +	if (IS_ERR(sgt))
> +		return PTR_ERR(sgt);
> +
> +	for_each_sgtable_dma_sg(sgt, sgl, count) {
> +		if (size == 0)
> +			break;
> +
> +		dma_addr_t paddr = sg_dma_address(sgl);
> +		size_t len = sg_dma_len(sgl);
> +
> +		if (len <= offset) {
> +			offset -= len;
> +			continue;
> +		}
> +
> +		paddr += offset;
> +		len -= offset;
> +		len = min_t(size_t, len, size);
> +		size -= len;
> +		offset = 0;
> +
> +		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
> +		 * cache maintenance given an IOMMU can register their own
> +		 * implementation doing more than just CPU cache flushes/invalidation,
> +		 * and what we really care about here is CPU caches only, but that's
> +		 * the best we have that is both arch-agnostic and does at least the
> +		 * CPU cache maintenance on a <page,offset,size> tuple.
> +		 *
> +		 * Also, I wish we could do a single
> +		 *
> +		 *      dma_sync_single_for_device(BIDIR)
> +		 *
> +		 * and get a flush+invalidate, but that's not how it's implemented
> +		 * in practice (at least on arm64), so we have to make it
> +		 *
> +		 *      dma_sync_single_for_device(TO_DEVICE)
> +		 *      dma_sync_single_for_cpu(FROM_DEVICE)
> +		 *
> +		 * for the flush+invalidate case.
> +		 */
> +		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
> +		if (type == PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
> +			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
> +	}
> +
> +	return 0;
> +}
> +
>  void
>  panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
>  {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 7fec20339354..d61ffe1f6841 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -151,6 +151,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>  
>  void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
> +int panfrost_gem_sync(struct drm_gem_object *obj, u32 type,
> +		      u32 offset, u32 size);
>  void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
>  
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 0c59714ae42b..e194e087a0c8 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -24,6 +24,7 @@ extern "C" {
>  #define DRM_PANFROST_SET_LABEL_BO		0x09
>  #define DRM_PANFROST_JM_CTX_CREATE		0x0a
>  #define DRM_PANFROST_JM_CTX_DESTROY		0x0b
> +#define DRM_PANFROST_SYNC_BO			0x0c
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -35,6 +36,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
>  #define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
>  #define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
> +#define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SYNC_BO, struct drm_panfrost_sync_bo)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -308,6 +310,49 @@ struct drm_panfrost_set_label_bo {
>  	__u64 label;
>  };
>  
> +/* Valid flags to pass to drm_panfrost_bo_sync_op */
> +#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH			0
> +#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE		1
> +
> +/**
> + * struct drm_panthor_bo_flush_map_op - BO map sync op
> + */
> +struct drm_panfrost_bo_sync_op {
> +	/** @handle: Handle of the buffer object to sync. */
> +	__u32 handle;
> +
> +	/** @type: Type of sync operation. */
> +	__u32 type;
> +
> +	/**
> +	 * @offset: Offset into the BO at which the sync range starts.
> +	 *
> +	 * This will be rounded down to the nearest cache line as needed.
> +	 */
> +	__u32 offset;
> +
> +	/**
> +	 * @size: Size of the range to sync
> +	 *
> +	 * @size + @offset will be rounded up to the nearest cache line as
> +	 * needed.
> +	 */
> +	__u32 size;
> +};
> +
> +/**
> + * struct drm_panfrost_sync_bo - ioctl argument for syncing BO maps
> + */
> +struct drm_panfrost_sync_bo {
> +	/** Array of struct drm_panfrost_bo_sync_op */
> +	__u64 ops;
> +
> +	/** Number of BO sync ops */
> +	__u32 op_count;
> +
> +	__u32 pad;
> +};
> +
>  /* Definitions for coredump decoding in user space */
>  #define PANFROSTDUMP_MAJOR 1
>  #define PANFROSTDUMP_MINOR 0

