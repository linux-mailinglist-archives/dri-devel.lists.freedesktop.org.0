Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766FBCDA7B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 17:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655BB10EC38;
	Fri, 10 Oct 2025 15:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3532710EC3B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 15:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3D571595;
 Fri, 10 Oct 2025 08:00:10 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F4C3F66E;
 Fri, 10 Oct 2025 08:00:16 -0700 (PDT)
Message-ID: <82cd153e-934b-4ff6-ae4f-ff63f6fd215b@arm.com>
Date: Fri, 10 Oct 2025 16:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] drm/panfrost: Add an ioctl to query BO flags
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-12-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-12-boris.brezillon@collabora.com>
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
> v2:
> - New commit
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Although see comment on the next patch...

Thanks,
Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 33 +++++++++++++++++++++++++
>  include/uapi/drm/panfrost_drm.h         | 19 ++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index cabf544f0437..00c0881fa2f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -635,6 +635,38 @@ static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
>  	return ret;
>  }
>  
> +static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
> +					struct drm_file *file_priv)
> +{
> +	struct drm_panfrost_query_bo_info *args = data;
> +	struct drm_gem_object *gem_obj;
> +	struct panfrost_gem_object *bo;
> +
> +	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!gem_obj) {
> +		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
> +		return -ENOENT;
> +	}
> +
> +	bo = to_panfrost_bo(gem_obj);
> +	args->pad = 0;
> +	args->create_flags = 0;
> +	args->extra_flags = 0;
> +
> +	if (drm_gem_is_imported(gem_obj)) {
> +		args->extra_flags |= DRM_PANFROST_BO_IS_IMPORTED;
> +	} else {
> +		if (bo->noexec)
> +			args->create_flags |= PANFROST_BO_NOEXEC;
> +
> +		if (bo->is_heap)
> +			args->create_flags |= PANFROST_BO_HEAP;
> +	}
> +
> +	drm_gem_object_put(gem_obj);
> +	return 0;
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -705,6 +737,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(QUERY_BO_INFO,	query_bo_info,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index fcc9f930df5f..5832a291adc4 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -25,6 +25,7 @@ extern "C" {
>  #define DRM_PANFROST_JM_CTX_CREATE		0x0a
>  #define DRM_PANFROST_JM_CTX_DESTROY		0x0b
>  #define DRM_PANFROST_SYNC_BO			0x0c
> +#define DRM_PANFROST_QUERY_BO_INFO		0x0d
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -37,6 +38,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
>  #define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
>  #define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SYNC_BO, struct drm_panfrost_sync_bo)
> +#define DRM_IOCTL_PANFROST_QUERY_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_QUERY_BO_INFO, struct drm_panfrost_query_bo_info)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -313,6 +315,23 @@ struct drm_panfrost_sync_bo {
>  	__u32 pad;
>  };
>  
> +/** BO comes from a different subsystem. */
> +#define DRM_PANFROST_BO_IS_IMPORTED (1 << 0)
> +
> +struct drm_panfrost_query_bo_info {
> +	/** Handle of the object being queried. */
> +	__u32 handle;
> +
> +	/** Extra flags that are not coming from the BO_CREATE ioctl(). */
> +	__u32 extra_flags;
> +
> +	/** Flags passed at creation time. */
> +	__u32 create_flags;
> +
> +	/** Will be zero on return. */
> +	__u32 pad;
> +};
> +
>  /* Definitions for coredump decoding in user space */
>  #define PANFROSTDUMP_MAJOR 1
>  #define PANFROSTDUMP_MINOR 0

