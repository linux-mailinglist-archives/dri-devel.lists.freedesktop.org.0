Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F8B7E32F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C627F10E192;
	Wed, 17 Sep 2025 10:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D0B610E192
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 10:17:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7F2E25DC;
 Wed, 17 Sep 2025 03:17:18 -0700 (PDT)
Received: from [10.1.26.46] (e122027.cambridge.arm.com [10.1.26.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3113F673;
 Wed, 17 Sep 2025 03:17:24 -0700 (PDT)
Message-ID: <e64440cb-4b7d-4b42-861b-4e6b529e13d5@arm.com>
Date: Wed, 17 Sep 2025 11:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/panfrost: Expose JM context IOCTLs to UM
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250912132002.304187-1-adrian.larumbe@collabora.com>
 <20250912132002.304187-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250912132002.304187-4-adrian.larumbe@collabora.com>
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

On 12/09/2025 14:19, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Minor revision of the driver must be bumped because this expands the
> uAPI. On top of that, let UM know about the available priorities so that
> they can create contexts with legal priority values.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 36 ++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index be384b18e8fd..69e72a800cd1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -109,6 +109,14 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  #endif
>  		break;
>  
> +	case DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES:
> +		param->value = BIT(PANFROST_JM_CTX_PRIORITY_LOW) |
> +			       BIT(PANFROST_JM_CTX_PRIORITY_MEDIUM);
> +
> +		if (panfrost_high_prio_allowed(file))
> +			param->value |= BIT(PANFROST_JM_CTX_PRIORITY_HIGH);
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -286,9 +294,6 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	if (args->jm_ctx_handle)
> -		return -EINVAL;
> -
>  	if (!args->jc)
>  		return -EINVAL;
>  
> @@ -552,6 +557,27 @@ static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
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
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	/* We can't destroy the default context created when the file is opened. */
> +	if (!args->handle)
> +		return -EINVAL;
> +
> +	return panfrost_jm_ctx_destroy(file, args->handle);
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -619,6 +645,8 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
>  };
>  
>  static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
> @@ -715,6 +743,8 @@ static void panfrost_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
>   *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
>   * - 1.4 - adds SET_LABEL_BO
> + * - 1.5 - adds JM_CTX_{CREATE,DESTROY} ioctls and extend SUBMIT to allow
> + *	   context creation with configurable priorities/affinity
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,

