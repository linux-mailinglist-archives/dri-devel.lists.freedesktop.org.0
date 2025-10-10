Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1EBCDA39
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503B10EC32;
	Fri, 10 Oct 2025 14:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D34B410E2B0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:57:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82A621595;
 Fri, 10 Oct 2025 07:57:07 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CE083F66E;
 Fri, 10 Oct 2025 07:57:12 -0700 (PDT)
Message-ID: <78ec0bd3-5d80-4ded-a2ec-cc5e6a68dbf8@arm.com>
Date: Fri, 10 Oct 2025 15:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-11-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-11-boris.brezillon@collabora.com>
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
> - Add more to the commit message
> - Change the flags to better match the drm_gem_shmem_sync semantics
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 57 +++++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 20 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
>  include/uapi/drm/panfrost_drm.h         | 47 ++++++++++++++++++++
>  4 files changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 3ffcd08f7745..cabf544f0437 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -579,6 +579,62 @@ static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
>  	return panfrost_jm_ctx_destroy(file, args->handle);
>  }
>  
> +#define PANFROST_BO_SYNC_OP_FLAGS                               \
> +	(PANFROST_BO_SYNC_FOR_DEV | PANFROST_BO_SYNC_FOR_READ | \
> +	 PANFROST_BO_SYNC_FOR_WRITE)
> +
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
> +		if (ops[i].flags & ~PANFROST_BO_SYNC_OP_FLAGS) {
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
> +		ret = panfrost_gem_sync(obj, ops[i].flags,
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
> @@ -648,6 +704,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 85d6289a6eda..da0362202d94 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -365,6 +365,26 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
>  	kfree_const(old_label);
>  }
>  
> +int
> +panfrost_gem_sync(struct drm_gem_object *obj, u32 flags,
> +		  u32 offset, u32 size)
> +{
> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
> +	enum drm_gem_object_access_flags gem_access_flags = 0;
> +
> +	if (flags & PANFROST_BO_SYNC_FOR_DEV)
> +		gem_access_flags |= DRM_GEM_OBJECT_DEV_ACCESS;
> +	else
> +		gem_access_flags |= DRM_GEM_OBJECT_CPU_ACCESS;
> +
> +	if (flags & PANFROST_BO_SYNC_FOR_READ)
> +		gem_access_flags |= DRM_GEM_OBJECT_READ_ACCESS;
> +	if (flags & PANFROST_BO_SYNC_FOR_WRITE)
> +		gem_access_flags |= DRM_GEM_OBJECT_WRITE_ACCESS;
> +
> +	return drm_gem_shmem_sync(&bo->base, offset, size, gem_access_flags);
> +}
> +
>  void
>  panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
>  {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 8de3e76f2717..6a0e090aa59b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -148,6 +148,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>  
>  void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
> +int panfrost_gem_sync(struct drm_gem_object *obj, u32 flags,
> +		      u32 offset, u32 size);
>  void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
>  
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index d3f6c005463c..fcc9f930df5f 100644
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
> @@ -266,6 +268,51 @@ struct drm_panfrost_set_label_bo {
>  	__u64 label;
>  };
>  
> +/* Valid flags to pass to drm_panfrost_bo_sync_op */
> +#define PANFROST_BO_SYNC_FOR_CPU	(0 << 0)
> +#define PANFROST_BO_SYNC_FOR_DEV	(1 << 0)
> +#define PANFROST_BO_SYNC_FOR_READ	(1 << 1)
> +#define PANFROST_BO_SYNC_FOR_WRITE	(1 << 2)
> +
> +/**
> + * struct drm_panthor_bo_flush_map_op - BO map sync op
> + */
> +struct drm_panfrost_bo_sync_op {
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

