Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E0B51C11
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D4A10E958;
	Wed, 10 Sep 2025 15:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59A9210E958
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:42:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A814F16F2;
 Wed, 10 Sep 2025 08:42:37 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA1443F694;
 Wed, 10 Sep 2025 08:42:41 -0700 (PDT)
Message-ID: <1b270301-c5d1-4054-a602-aa6e227bd85e@arm.com>
Date: Wed, 10 Sep 2025 16:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/panfrost: Expose JM context IOCTLs to UM
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250904001054.147465-4-adrian.larumbe@collabora.com>
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

On 04/09/2025 01:08, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Minor revision of the driver must be bumped because this expands the
> uAPI. On top of that, let user know the available priorities so that
> they can create contexts with legal priority values.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 35 +++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 398c067457d9..02f704ec4961 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <drm/panfrost_drm.h>
> +#include <drm/drm_auth.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
> @@ -109,6 +110,15 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  #endif
>  		break;
>  
> +	case DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES:
> +		param->value = BIT(PANFROST_JM_CTX_PRIORITY_LOW) |
> +			       BIT(PANFROST_JM_CTX_PRIORITY_MEDIUM);
> +
> +		/* High prio require CAP_SYS_NICE or DRM_MASTER */
> +		if (capable(CAP_SYS_NICE) || drm_is_current_master(file))

NIT: This is repeating the check in jm_ctx_prio_to_drm_sched_prio(). It
would be nice to have this check in one place to ensure that the two
cannot get out of sync.

> +			param->value |= BIT(PANFROST_JM_CTX_PRIORITY_HIGH);
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -295,8 +305,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  			return -ENODEV;
>  	}
>  
> -	/* TODO: Use the default JM context until ctx management IOCTLs are exposed */
> -	jm_ctx = panfrost_jm_ctx_from_handle(file, 0);
> +	jm_ctx = panfrost_jm_ctx_from_handle(file, args->jm_ctx_handle);

I'm not sure if this should go in this patch or the previous one, but:
we need to add a check that the padding is 0. Personally I'd be tempted
to put it in the previous patch and enforce that jm_ctx_handle is zeroed
too (and drop that check here when you also remove the TODO).

>  	if (!jm_ctx) {
>  		ret = -EINVAL;
>  		goto out_put_syncout;
> @@ -547,6 +556,24 @@ static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
>  	return ret;
>  }
>  
> +static int panfrost_ioctl_jm_ctx_create(struct drm_device *dev, void *data,
> +					struct drm_file *file)
> +{
> +	return panfrost_jm_ctx_create(file, data);
> +}
> +
> +static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
> +					 struct drm_file *file)
> +{
> +	const struct drm_panfrost_jm_ctx_destroy *args = data;
> +
> +	/* We can't destroy the default context created when the file is opened. */
> +	if (!args->handle)
> +		return -EINVAL;

Also need a check for padding being non-zero.

Thanks,
Steve

> +
> +	return panfrost_jm_ctx_destroy(file, args->handle);
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -614,6 +641,8 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> @@ -710,6 +739,8 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
>   *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
>   * - 1.4 - adds SET_LABEL_BO
> + * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
> + *	   context creation with configurable priorities/affinity
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,

