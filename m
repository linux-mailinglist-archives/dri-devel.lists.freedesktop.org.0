Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA0BDF8C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DAF10E815;
	Wed, 15 Oct 2025 16:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABEE210E815
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:06:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 811A71655;
 Wed, 15 Oct 2025 09:06:48 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A7953F66E;
 Wed, 15 Oct 2025 09:06:54 -0700 (PDT)
Message-ID: <3c7357bc-5015-4c5a-b4bb-211528e85e65@arm.com>
Date: Wed, 15 Oct 2025 17:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] drm/panfrost: Expose the selected coherency
 protocol to the UMD
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-11-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015160326.3657287-11-boris.brezillon@collabora.com>
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

On 15/10/2025 17:03, Boris Brezillon wrote:
> Will be needed if we want to skip CPU cache maintenance operations when
> the GPU can snoop CPU caches.
> 
> v2:
> - New commit
> 
> v3:
> - Fix the coherency values (enum instead of bitmask)
> 
> v4:
> - Fix init/test on coherency_features
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 26 +++++++++++++++++++---
>  drivers/gpu/drm/panfrost/panfrost_regs.h   | 10 +++++++--
>  include/uapi/drm/panfrost_drm.h            |  7 ++++++
>  5 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 1e73efad02a8..bd38b7ae169e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -75,6 +75,7 @@ struct panfrost_features {
>  	u32 thread_max_workgroup_sz;
>  	u32 thread_max_barrier_sz;
>  	u32 coherency_features;
> +	u32 selected_coherency;
>  	u32 afbc_features;
>  	u32 texture_features[4];
>  	u32 js_features[16];
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 607a5b8448d0..3ffcd08f7745 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -94,6 +94,7 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
>  		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
>  		PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
> +		PANFROST_FEATURE(SELECTED_COHERENCY, selected_coherency);
>  
>  	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
>  		ret = panfrost_ioctl_query_timestamp(pfdev, &param->value);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 174e190ba40f..f350a913c786 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -157,8 +157,8 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>  	    pfdev->features.revision >= 0x2000)
>  		quirks |= JM_MAX_JOB_THROTTLE_LIMIT << JM_JOB_THROTTLE_LIMIT_SHIFT;
>  	else if (panfrost_model_eq(pfdev, 0x6000) &&
> -		 pfdev->features.coherency_features == COHERENCY_ACE)
> -		quirks |= (COHERENCY_ACE_LITE | COHERENCY_ACE) <<
> +		 pfdev->features.coherency_features == BIT(COHERENCY_ACE))
> +		quirks |= (BIT(COHERENCY_ACE_LITE) | BIT(COHERENCY_ACE)) <<
>  			   JM_FORCE_COHERENCY_FEATURES_SHIFT;
>  
>  	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_IDVS_GROUP_SIZE))
> @@ -260,7 +260,27 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>  	pfdev->features.max_threads = gpu_read(pfdev, GPU_THREAD_MAX_THREADS);
>  	pfdev->features.thread_max_workgroup_sz = gpu_read(pfdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
>  	pfdev->features.thread_max_barrier_sz = gpu_read(pfdev, GPU_THREAD_MAX_BARRIER_SIZE);
> -	pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
> +
> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_COHERENCY_REG))
> +		pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
> +	else
> +		pfdev->features.coherency_features = BIT(COHERENCY_ACE_LITE);
> +
> +	BUILD_BUG_ON(COHERENCY_ACE_LITE != DRM_PANFROST_GPU_COHERENCY_ACE_LITE);
> +	BUILD_BUG_ON(COHERENCY_ACE != DRM_PANFROST_GPU_COHERENCY_ACE);
> +	BUILD_BUG_ON(COHERENCY_NONE != DRM_PANFROST_GPU_COHERENCY_NONE);
> +
> +	if (!pfdev->coherent) {
> +		pfdev->features.selected_coherency = COHERENCY_NONE;
> +	} else if (pfdev->features.coherency_features & BIT(COHERENCY_ACE)) {
> +		pfdev->features.selected_coherency = COHERENCY_ACE;
> +	} else if (pfdev->features.coherency_features & BIT(COHERENCY_ACE_LITE)) {
> +		pfdev->features.selected_coherency = COHERENCY_ACE_LITE;
> +	} else {
> +		drm_WARN(pfdev->ddev, true, "No known coherency protocol supported");
> +		pfdev->features.selected_coherency = COHERENCY_NONE;
> +	}
> +
>  	pfdev->features.afbc_features = gpu_read(pfdev, GPU_AFBC_FEATURES);
>  	for (i = 0; i < 4; i++)
>  		pfdev->features.texture_features[i] = gpu_read(pfdev, GPU_TEXTURE_FEATURES(i));
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 2b8f1617b836..ee15f6bf6e6f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -102,9 +102,15 @@
>  #define GPU_L2_PRESENT_LO		0x120	/* (RO) Level 2 cache present bitmap, low word */
>  #define GPU_L2_PRESENT_HI		0x124	/* (RO) Level 2 cache present bitmap, high word */
>  
> +/* GPU_COHERENCY_FEATURES is a bitmask of BIT(COHERENCY_xxx) values encoding the
> + * set of supported coherency protocols. GPU_COHERENCY_ENABLE is passed a
> + * COHERENCY_xxx value.
> + */
>  #define GPU_COHERENCY_FEATURES		0x300	/* (RO) Coherency features present */
> -#define   COHERENCY_ACE_LITE		BIT(0)
> -#define   COHERENCY_ACE			BIT(1)
> +#define GPU_COHERENCY_ENABLE		0x304	/* (RW) Coherency protocol selection */
> +#define   COHERENCY_ACE_LITE		0
> +#define   COHERENCY_ACE			1
> +#define   COHERENCY_NONE		31
>  
>  #define GPU_STACK_PRESENT_LO		0xE00   /* (RO) Core stack present bitmap, low word */
>  #define GPU_STACK_PRESENT_HI		0xE04   /* (RO) Core stack present bitmap, high word */
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index e8b47c9f6976..9bd8fa401400 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -188,6 +188,13 @@ enum drm_panfrost_param {
>  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
>  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
>  	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
> +	DRM_PANFROST_PARAM_SELECTED_COHERENCY,
> +};
> +
> +enum drm_panfrost_gpu_coherency {
> +	DRM_PANFROST_GPU_COHERENCY_ACE_LITE = 0,
> +	DRM_PANFROST_GPU_COHERENCY_ACE = 1,
> +	DRM_PANFROST_GPU_COHERENCY_NONE = 31,
>  };
>  
>  struct drm_panfrost_get_param {

