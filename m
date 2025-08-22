Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66938B31E8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C638510EB55;
	Fri, 22 Aug 2025 15:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cgTusnlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFD410EB55
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755876534;
 bh=kpwCW+OPqY1Oqc+LuslQe85UUBBxIttqJero4BEkMYk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cgTusnlXsRHzD5aF3phqnkqNmZXf8wKeKQmH/s7/HMwGkZhb2iWALBblxL8sNsT9X
 jHolCyPHU7KDoJn06Vu0BMhDeepX4+VWckdzeSiRYji10fKJbdcdJ1d8x18fDfXCzp
 zZTtT8+WVk8XAjviujPVP2C1+3LqduVx85I+tYtVHK81+7R+P20qG4HnVe+6IirZv7
 mHSGKhgSvMYs13FE1+77wJfp5Ktz2LMXrMyrS9G/v9qpv+SoDVZFl4CEplkH4pV24x
 KEJZB5L1Vz8rJ5w71DW2t0I0BkV4ZDcACsOrDhqFgUkmftfQV5bPJqBUfdeshJysF6
 TH2TUShFWZwNw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EFDD17E1357;
 Fri, 22 Aug 2025 17:28:54 +0200 (CEST)
Date: Fri, 22 Aug 2025 17:28:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, Faith Ekstrand
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 3/7] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Message-ID: <20250822172850.103dba9c@fedora>
In-Reply-To: <20250822142954.902402-4-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-4-faith.ekstrand@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Fri, 22 Aug 2025 10:29:12 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

It probably deserve a quick description of why this is needed (same for
the previous commit BTW).

> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 47 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c | 20 ++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
>  include/uapi/drm/panthor_drm.h        | 55 +++++++++++++++++++++++++++
>  4 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06ae6a2aeb16..1527966604e1 100644
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
> @@ -1398,6 +1399,49 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>  	return 0;
>  }
>  
> +#define PANTHOR_BO_SYNC_OP_FLAGS \
> +	(DRM_PANTHOR_BO_SYNC_TO_DEVICE | \
> +	 DRM_PANTHOR_BO_SYNC_FROM_DEVICE)
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
> @@ -1481,6 +1525,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 530bad12d545..31f5d76002ec 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -344,6 +344,26 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
>  	panthor_gem_bo_set_label(bo->obj, str);
>  }
>  
> +int
> +panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
> +		    u64 offset, u64 size)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	enum dma_data_direction dir = DMA_NONE;
> +
> +	if ((flags & DRM_PANTHOR_BO_SYNC_TO_DEVICE) &&
> +	    (flags & DRM_PANTHOR_BO_SYNC_FROM_DEVICE))
> +		return -EINVAL;
> +	else if (flags & DRM_PANTHOR_BO_SYNC_TO_DEVICE)
> +		dir = DMA_TO_DEVICE;
> +	else if (flags & DRM_PANTHOR_BO_SYNC_FROM_DEVICE)
> +		dir = DMA_FROM_DEVICE;
> +	else
> +		return 0;
> +
> +	return drm_gem_shmem_sync_mmap(&bo->base, offset, size, dir);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  struct gem_size_totals {
>  	size_t size;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 8fc7215e9b90..36fe392ee627 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -159,6 +159,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
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
> index bf47369c0220..77b3ca5f6150 100644
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
> @@ -1047,6 +1050,56 @@ struct drm_panthor_set_user_mmio_offset {
>  	__u64 offset;
>  };
>  
> +/**
> + * enum drm_panthor_bo_sync_op_flags - BO sync flags
> + */
> +enum drm_panthor_bo_sync_op_flags {
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_TO_DEVICE: Sync data from the CPU to the
> +	 * device.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_TO_DEVICE = (1 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_SYNC_TO_DEVICE: Sync data from the device to the
> +	 * CPU.
> +	 */
> +	DRM_PANTHOR_BO_SYNC_FROM_DEVICE = (1 << 1),
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

We should probably mention the constraints on flags (TO or FROM_DEVICE,
but not both at the same time).

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
> @@ -1093,6 +1146,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
>  		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
> +	DRM_IOCTL_PANTHOR_BO_SYNC =
> +		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
>  };
>  
>  #if defined(__cplusplus)

