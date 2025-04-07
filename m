Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBDA7DF6A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91FC10E1B0;
	Mon,  7 Apr 2025 13:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4886810E1B0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:36:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4A3106F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 06:36:21 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60E1C3F59E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 06:36:20 -0700 (PDT)
Date: Mon, 7 Apr 2025 14:36:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Message-ID: <Z_PUxtf3XaYh_Fvu@e110455-lin.cambridge.arm.com>
References: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
 <20250402115432.1469703-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402115432.1469703-3-adrian.larumbe@collabora.com>
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

On Wed, Apr 02, 2025 at 12:54:27PM +0100, Adrián Larumbe wrote:
> Allow UM to label a BO for which it possesses a DRM handle.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 40 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
>  include/uapi/drm/panthor_drm.h        | 19 +++++++++++++
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 310bb44abe1a..d5277284fe27 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1330,6 +1330,44 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>  
> +static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct drm_panthor_bo_set_label *args = data;
> +	struct drm_gem_object *obj;
> +	const char *label;
> +	int ret = 0;
> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->size && args->label) {
> +		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
> +			ret = -E2BIG;
> +			goto err_label;
> +		}
> +
> +		label = strndup_user(u64_to_user_ptr(args->label), args->size);
> +		if (IS_ERR(label)) {
> +			ret = PTR_ERR(label);
> +			goto err_label;
> +		}
> +	} else if (args->size && !args->label) {
> +		ret = -EINVAL;
> +		goto err_label;
> +	} else {
> +		label = NULL;
> +	}
> +
> +	panthor_gem_bo_set_label(obj, label);
> +
> +err_label:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1399,6 +1437,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1508,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> + * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl

Hi Adrián,

You also need to update the .minor value.

With that change,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 0582826b341a..e18fbc093abd 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -13,6 +13,8 @@
>  
>  struct panthor_vm;
>  
> +#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..26b52f147360 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
>  
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
> +	DRM_PANTHOR_BO_SET_LABEL,
>  };
>  
>  /**
> @@ -977,6 +980,20 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
> + */
> +struct drm_panthor_bo_set_label {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +
> +	/** @size: Length of the label, including the NULL terminator. */
> +	__u32 size;
> +
> +	/** @label: User pointer to a NULL-terminated string */
> +	__u64 label;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1036,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>  };
>  
>  #if defined(__cplusplus)
> -- 
> 2.48.1
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
