Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32721BCD87A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71810E2B4;
	Fri, 10 Oct 2025 14:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16C1B10E2B4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:31:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A739D1596;
 Fri, 10 Oct 2025 07:31:33 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2386E3F59E;
 Fri, 10 Oct 2025 07:31:39 -0700 (PDT)
Message-ID: <4fb7b5ed-12d6-4b23-848f-02feebdb5393@arm.com>
Date: Fri, 10 Oct 2025 15:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-6-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-6-boris.brezillon@collabora.com>
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

On 10/10/2025 11:11, Boris Brezillon wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This will be used by the UMD to synchronize CPU-cached mappings when
> the UMD can't do it directly (no usermode cache maintenance instruction
> on Arm32).
> 
> v2:
> - Change the flags so they better match the drm_gem_shmem_sync()
>   semantics
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 47 ++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c | 21 +++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
>  include/uapi/drm/panthor_drm.h        | 66 +++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index fb4b293f17f0..857954d2ac7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -1394,6 +1395,49 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>  	return 0;
>  }
>  
> +#define PANTHOR_BO_SYNC_OP_FLAGS                                      \
> +	(DRM_PANTHOR_BO_SYNC_FOR_DEV | DRM_PANTHOR_BO_SYNC_FOR_READ | \
> +	 DRM_PANTHOR_BO_SYNC_FOR_WRITE)
> +
> +static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
> +				 struct drm_file *file)
> +{
> +	struct drm_panthor_bo_sync *args = data;
> +	struct drm_panthor_bo_sync_op *ops;
> +	struct drm_gem_object *obj;
> +	int ret = 0;
> +
> +	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
> +	if (ret)
> +		return ret;
> +
> +	for (u32 i = 0; i < args->ops.count; i++) {
> +		if (ops[i].flags & ~PANTHOR_BO_SYNC_OP_FLAGS) {
> +			ret = -EINVAL;
> +			goto err_ops;
> +		}
> +
> +		obj = drm_gem_object_lookup(file, ops[i].handle);
> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_ops;
> +		}
> +
> +		ret = panthor_gem_bo_sync(obj, ops[i].flags,
> +					  ops[i].offset, ops[i].size);
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
> @@ -1468,6 +1512,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 156c7a0b62a2..617e04134d30 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -338,6 +338,27 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
>  	panthor_gem_bo_set_label(bo->obj, str);
>  }
>  
> +int
> +panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
> +		    u64 offset, u64 size)
> +{
> +	enum drm_gem_object_access_flags gem_access_flags = 0;
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +
> +	if (flags & DRM_PANTHOR_BO_SYNC_FOR_DEV)
> +		gem_access_flags |= DRM_GEM_OBJECT_DEV_ACCESS;
> +	else
> +		gem_access_flags |= DRM_GEM_OBJECT_CPU_ACCESS;
> +
> +	if (flags & DRM_PANTHOR_BO_SYNC_FOR_READ)
> +		gem_access_flags |= DRM_GEM_OBJECT_READ_ACCESS;
> +
> +	if (flags & DRM_PANTHOR_BO_SYNC_FOR_WRITE)
> +		gem_access_flags |= DRM_GEM_OBJECT_WRITE_ACCESS;
> +
> +	return drm_gem_shmem_sync(&bo->base, offset, size, gem_access_flags);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  struct gem_size_totals {
>  	size_t size;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 80c6e24112d0..c08c7c066840 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -147,6 +147,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
>  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
>  
> +int panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
> +			u64 offset, u64 size);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index b9e483ff5e21..4b10b3c289e9 100644
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
> @@ -1073,6 +1076,67 @@ struct drm_panthor_set_user_mmio_offset {
>  	__u64 offset;
>  };
>  
> +/**
> + * enum drm_panthor_bo_sync_op_flags - BO sync flags
> + */
> +enum drm_panthor_bo_sync_op_flags {
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_FOR_CPU: Sync data for CPU accesses.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_FOR_CPU = (0 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_FOR_DEV: Sync data for device accesses.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_FOR_DEV = (1 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_FOR_READ: Sync for reads.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_FOR_READ = (1 << 1),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_FOR_WRITE: Sync for writes.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_FOR_WRITE = (1 << 2),
> +};
> +
> +/**
> + * struct drm_panthor_bo_sync_op - BO map sync op
> + */
> +struct drm_panthor_bo_sync_op {
> +	/** @handle: Handle of the buffer object to sync. */
> +	__u32 handle;
> +
> +	/** @flags: Flags controlling the sync operation. */
> +	__u32 flags;
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
> @@ -1119,6 +1183,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
>  		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
> +	DRM_IOCTL_PANTHOR_BO_SYNC =
> +		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>  };
>  
>  #if defined(__cplusplus)

