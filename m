Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB00AAE07B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437410E10E;
	Wed,  7 May 2025 13:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 286AA10E10E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:18:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0C0516F2;
 Wed,  7 May 2025 06:18:35 -0700 (PDT)
Received: from [10.57.20.214] (unknown [10.57.20.214])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8190B3F58B;
 Wed,  7 May 2025 06:18:43 -0700 (PDT)
Message-ID: <1cfa00a3-75ac-4fc9-bcda-d2dab688bc87@arm.com>
Date: Wed, 7 May 2025 14:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panfrost: Add driver IOCTL for setting BO labels
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250424022138.709303-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 24/04/2025 03:21, Adrián Larumbe wrote:
> Allow UM to label a BO for which it possesses a DRM handle.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Minor comments below, but otherwise:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 44 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
>  include/uapi/drm/panfrost_drm.h         | 20 +++++++++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b87f83e94eda..b0ab76d67e96 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -495,6 +495,46 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
> +				       struct drm_file *file)
> +{
> +	struct drm_panfrost_set_label_bo *args = data;
> +	struct drm_gem_object *obj;
> +	const char *label = NULL;
> +	int ret = 0;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->label) {
> +		label = strndup_user((const char __user *)(uintptr_t)args->label,

Use u64_to_user_ptr()

> +				     PANFROST_BO_LABEL_MAXLEN);
> +		if (IS_ERR(label)) {
> +			ret = PTR_ERR(label);
> +			if (ret == -EINVAL)
> +				ret = -E2BIG;
> +			goto err_put_obj;
> +		}
> +	}
> +
> +	/*
> +	 * We treat passing a label of length 0 and passing a NULL label
> +	 * differently, because even though they might seem conceptually
> +	 * similar, future uses of the BO label might expect a different
> +	 * behaviour in each case.
> +	 */
> +	panfrost_gem_set_label(obj, label);
> +
> +err_put_obj:
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -561,6 +601,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> @@ -625,6 +666,7 @@ static const struct file_operations panfrost_drm_driver_fops = {
>   * - 1.2 - adds AFBC_FEATURES query
>   * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
>   *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
> + * - 1.4 - adds SET_LABEL_BO
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
> @@ -637,7 +679,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.name			= "panfrost",
>  	.desc			= "panfrost DRM",
>  	.major			= 1,
> -	.minor			= 3,
> +	.minor			= 4,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index c0be2934f229..842e025b9bdc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -9,6 +9,8 @@
>  
>  struct panfrost_mmu;
>  
> +#define PANFROST_BO_LABEL_MAXLEN	4096
> +
>  struct panfrost_gem_object {
>  	struct drm_gem_shmem_object base;
>  	struct sg_table *sgts;
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 568724be6628..b0445c5e514d 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -21,6 +21,7 @@ extern "C" {
>  #define DRM_PANFROST_PERFCNT_ENABLE		0x06
>  #define DRM_PANFROST_PERFCNT_DUMP		0x07
>  #define DRM_PANFROST_MADVISE			0x08
> +#define DRM_PANFROST_SET_LABEL_BO		0x09
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -29,6 +30,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_GET_PARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_PARAM, struct drm_panfrost_get_param)
>  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
>  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
> +#define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -227,6 +229,24 @@ struct drm_panfrost_madvise {
>  	__u32 retained;       /* out, whether backing store still exists */
>  };
>  
> +/**
> + * struct drm_panfrost_set_label_bo - ioctl argument for labelling Panfrost BOs.
> + */
> +struct drm_panfrost_set_label_bo {
> +	/** @handle: Handle of the buffer object to label. */
> +	__u32 handle;
> +
> +	/**  @pad: MBZ. */
> +	__u32 pad;
> +
> +	/**
> +	 * @label: User pointer to a NUL-terminated string
> +	 *
> +	 * Length cannot be greater than 4096

NULL is permitted and means clear the label.

Thanks,
Steve

> +	 */
> +	__u64 label;
> +};
> +
>  /* Definitions for coredump decoding in user space */
>  #define PANFROSTDUMP_MAJOR 1
>  #define PANFROSTDUMP_MINOR 0

