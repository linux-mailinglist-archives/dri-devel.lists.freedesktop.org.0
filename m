Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6CC8AF36
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA3C10E67D;
	Wed, 26 Nov 2025 16:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D329810E679;
 Wed, 26 Nov 2025 16:25:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D145C168F;
 Wed, 26 Nov 2025 08:25:07 -0800 (PST)
Received: from [10.1.30.35] (e122027.cambridge.arm.com [10.1.30.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CB23F73B;
 Wed, 26 Nov 2025 08:25:10 -0800 (PST)
Message-ID: <f81703a1-ecc8-4d31-bcf8-64fa9fa44e40@arm.com>
Date: Wed, 26 Nov 2025 16:25:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/16] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
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
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <20251126124455.3656651-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126124455.3656651-8-boris.brezillon@collabora.com>
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

On 26/11/2025 12:44, Boris Brezillon wrote:
> This will be used by the UMD to synchronize CPU-cached mappings when
> the UMD can't do it directly (no usermode cache maintenance instruction
> on Arm32).
> 
> v2:
> - Change the flags so they better match the drm_gem_shmem_sync()
>   semantics
> 
> v3:
> - Add Steve's R-b
> 
> v4:
> - No changes
> 
> v5:
> - Drop Steve's R-b (the semantics changes call for a new review)
> 
> v6:
> - Drop ret initialization in panthor_ioctl_bo_sync()
> - Bail out early in panthor_ioctl_bo_sync() if ops.count is zero
> - Drop unused PANTHOR_BO_SYNC_OP_FLAGS definition
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 41 ++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c | 21 +++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
>  include/uapi/drm/panthor_drm.h        | 52 +++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index cf2cf09335a4..7aba9e5d2579 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -177,7 +177,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -1396,6 +1397,43 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>  	return 0;
>  }
>  
> +static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
> +				 struct drm_file *file)
> +{
> +	struct drm_panthor_bo_sync *args = data;
> +	struct drm_panthor_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	if (!args->ops.count)
> +		return 0;
> +
> +	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
> +	if (ret)
> +		return ret;
> +
> +	for (u32 i = 0; i < args->ops.count; i++) {
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panthor_gem_sync(obj, ops[i].type, ops[i].offset,
> +				       ops[i].size);
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
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1470,6 +1508,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 3100a895513e..1a3c1afaf88d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -344,6 +344,27 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
>  	panthor_gem_bo_set_label(bo->obj, str);
>  }
>  
> +int
> +panthor_gem_sync(struct drm_gem_object *obj, u32 type,
> +		 u64 offset, u64 size)
> +{
> +	enum drm_gem_shmem_sync_type shmem_sync_type;
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +
> +	switch (type) {
> +	case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH:
> +		shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH;
> +		break;
> +	case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
> +		shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return drm_gem_shmem_sync(&bo->base, offset, size, shmem_sync_type);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  struct gem_size_totals {
>  	size_t size;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 27e565650374..1d9733373d74 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -146,6 +146,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  
>  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
>  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
> +int panthor_gem_sync(struct drm_gem_object *obj,
> +		     u32 type, u64 offset, u64 size);
>  
>  extern const struct dma_buf_ops panthor_dma_buf_ops;
>  
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index f0f637e0631d..bb12760abe99 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
>  	 * pgoff_t size.
>  	 */
>  	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
> +
> +	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
> +	DRM_PANTHOR_BO_SYNC,
>  };
>  
>  /**
> @@ -1073,6 +1076,53 @@ struct drm_panthor_set_user_mmio_offset {
>  	__u64 offset;
>  };
>  
> +/**
> + * enum drm_panthor_bo_sync_op_type - BO sync type
> + */
> +enum drm_panthor_bo_sync_op_type {
> +	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
> +	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH = 0,
> +
> +	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches. */
> +	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE = 1,
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync_op - BO map sync op
> + */
> +struct drm_panthor_bo_sync_op {
> +	/** @handle: Handle of the buffer object to sync. */
> +	__u32 handle;
> +
> +	/** @type: Type of operation. */
> +	__u32 type;
> +
> +	/**
> +	 * @offset: Offset into the BO at which the sync range starts.
> +	 *
> +	 * This will be rounded down to the nearest cache line as needed.
> +	 */
> +	__u64 offset;
> +
> +	/**
> +	 * @size: Size of the range to sync
> +	 *
> +	 * @size + @offset will be rounded up to the nearest cache line as
> +	 * needed.
> +	 */
> +	__u64 size;
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync - BO map sync request
> + */
> +struct drm_panthor_bo_sync {
> +	/**
> +	 * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
> +	 */
> +	struct drm_panthor_obj_array ops;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1119,6 +1169,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
>  		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
> +	DRM_IOCTL_PANTHOR_BO_SYNC =
> +		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>  };
>  
>  #if defined(__cplusplus)

