Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5493BCD880
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967C710EC1D;
	Fri, 10 Oct 2025 14:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A77EB10EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:31:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66D4C1596;
 Fri, 10 Oct 2025 07:31:48 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1A573F59E;
 Fri, 10 Oct 2025 07:31:53 -0700 (PDT)
Message-ID: <1dab7ee4-ce78-4604-8124-bf6ecdd6578a@arm.com>
Date: Fri, 10 Oct 2025 15:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/panthor: Add an ioctl to query BO flags
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-7-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-7-boris.brezillon@collabora.com>
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
> This is useful when importing BOs, so we can know about cacheability
> and flush the caches when needed.
> 
> We can also know when the buffer comes from a different subsystem and
> take proper actions (avoid CPU mappings, or do kernel-based syncs
> instead of userland cache flushes).
> 
> v2:
> - New commit
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 24 +++++++++++
>  include/uapi/drm/panthor_drm.h        | 57 +++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 857954d2ac7b..9004d0ba0e45 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1438,6 +1438,29 @@ static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
>  	return ret;
>  }
>  
> +static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
> +				       struct drm_file *file)
> +{
> +	struct drm_panthor_bo_query_info *args = data;
> +	struct panthor_gem_object *bo;
> +	struct drm_gem_object *obj;
> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	bo = to_panthor_bo(obj);
> +	args->pad = 0;
> +	args->create_flags = bo->flags;
> +
> +	args->extra_flags = 0;
> +	if (drm_gem_is_imported(&bo->base.base))
> +		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
> +
> +	drm_gem_object_put(obj);
> +	return 0;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1513,6 +1536,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_QUERY_INFO, bo_query_info, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 4b10b3c289e9..54502286c8b1 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -147,6 +147,13 @@ enum drm_panthor_ioctl_id {
>  
>  	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
>  	DRM_PANTHOR_BO_SYNC,
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_QUERY_INFO: Query information about a BO.
> +	 *
> +	 * This is useful for imported BOs.
> +	 */
> +	DRM_PANTHOR_BO_QUERY_INFO,
>  };
>  
>  /**
> @@ -1137,6 +1144,54 @@ struct drm_panthor_bo_sync {
>  	struct drm_panthor_obj_array ops;
>  };
>  
> +/**
> + * enum drm_panthor_bo_extra_flags - Set of flags returned on a BO_QUERY_INFO request
> + *
> + * Those are flags reflecting BO properties that are not directly coming from the flags
> + * passed are creation time, or information on BOs that were imported from other drivers.
> + */
> +enum drm_panthor_bo_extra_flags {
> +	/**
> +	 * @DRM_PANTHOR_BO_IS_IMPORTED: BO has been imported from an external driver.
> +	 *
> +	 * Note that imported dma-buf handles are not flagged as imported if they
> +	 * where exported by panthor. Only buffers that are coming from other drivers
> +	 * (dma heaps, other GPUs, display controllers, V4L, ...).
> +	 *
> +	 * It's also important to note that all imported BOs are mapped cached and can't
> +	 * be considered IO-coherent even if the GPU is. This means they require explicit
> +	 * syncs that must go through the DRM_PANTHOR_BO_SYNC ioctl (userland cache
> +	 * maintenance is not allowed in that case, because extra operations might be
> +	 * needed to make changes visible to the CPU/device, like buffer migration when the
> +	 * exporter is a GPU with its own VRAM).
> +	 */
> +	DRM_PANTHOR_BO_IS_IMPORTED = (1 << 0),
> +};
> +
> +/**
> + * struct drm_panthor_bo_query_info - Query BO info
> + */
> +struct drm_panthor_bo_query_info {
> +	/** @handle: Handle of the buffer object to query flags on. */
> +	__u32 handle;
> +
> +	/**
> +	 * @extra_flags: Combination of enum drm_panthor_bo_extra_flags flags.
> +	 */
> +	__u32 extra_flags;
> +
> +	/**
> +	 * @create_flags: Flags passed at creation time.
> +	 *
> +	 * Combination of enum drm_panthor_bo_flags flags.
> +	 * Will be zero if the buffer comes from a different driver.
> +	 */
> +	__u32 create_flags;
> +
> +	/** @pad: Will be zero on return. */
> +	__u32 pad;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1185,6 +1240,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
>  	DRM_IOCTL_PANTHOR_BO_SYNC =
>  		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
> +	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
> +		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
>  };
>  
>  #if defined(__cplusplus)

