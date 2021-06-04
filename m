Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911039B43D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF466F5BC;
	Fri,  4 Jun 2021 07:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02F486F5BC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 07:45:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88E731063;
 Fri,  4 Jun 2021 00:45:48 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D32903F719;
 Fri,  4 Jun 2021 00:45:47 -0700 (PDT)
Subject: Re: [PATCH v3] drm/panfrost: Add AFBC_FEATURES parameter
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210603212123.1649-1-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5858a1e5-1fbf-49b7-a388-7cf23473914d@arm.com>
Date: Fri, 4 Jun 2021 08:45:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603212123.1649-1-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/06/2021 22:21, Alyssa Rosenzweig wrote:
> The value of the AFBC_FEATURES register is required by userspace to
> determine AFBC support on Bifrost. A user on our IRC channel (#panfrost)
> reported a workload that raised a fault on one system's Mali G31 but
> worked flawlessly with another system's Mali G31. We determined the
> cause to be missing AFBC support on one vendor's Mali implementation --
> it turns out AFBC is optional on Bifrost!

I was surprised this had been missed, but it turns out the DDK doesn't
care so kbase doesn't expose it either! I guess this is one of those
"recompile the driver to support your hardware" cases with the blob.

> Whether AFBC is supported or not is exposed in the AFBC_FEATURES
> register on Bifrost, which reads back as 0 on Midgard. A zero value
> indicates AFBC is fully supported, provided the architecture itself
> supports AFBC, allowing backwards-compatibility with Midgard. Bits 0 and
> 15 indicate that AFBC support is absent for texturing and rendering
> respectively.
> 
> The user experiencing the fault reports that AFBC_FEATURES reads back
> 0x10001 on their system, confirming the architectural lack of AFBC.
> Userspace needs this this parameter to know to disable AFBC on that
> chip, and perhaps others.
> 
> v2: Fix typo from copy-paste fail.
> 
> v3: Bump the UABI version. This commit was cherry-picked from another
> series so chalking this up to a rebase fail.

I'd like to say third time's the charm, but...

> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 3 ++-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 1 +
>  drivers/gpu/drm/panfrost/panfrost_regs.h   | 1 +
>  include/uapi/drm/panfrost_drm.h            | 1 +
>  5 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 597cf1459..f614e9877 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -45,6 +45,7 @@ struct panfrost_features {
>  	u32 thread_max_workgroup_sz;
>  	u32 thread_max_barrier_sz;
>  	u32 coherency_features;
> +	u32 afbc_features;
>  	u32 texture_features[4];
>  	u32 js_features[16];
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ca07098a6..365ee53f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -63,6 +63,7 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  		PANFROST_FEATURE(THREAD_MAX_BARRIER_SZ,
>  				thread_max_barrier_sz);
>  		PANFROST_FEATURE(COHERENCY_FEATURES, coherency_features);
> +		PANFROST_FEATURE(AFBC_FEATURES, afbc_features);
>  		PANFROST_FEATURE_ARRAY(TEXTURE_FEATURES, texture_features, 3);
>  		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
>  		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
> @@ -559,7 +560,7 @@ static const struct drm_driver panfrost_drm_driver = {

Missing context:

> /*
>  * Panfrost driver version:
>  * - 1.0 - initial interface
>  * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
>  */

It would be good to add the new version in this comment to document what
it adds. With that added:

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

>  	.desc			= "panfrost DRM",
>  	.date			= "20180908",
>  	.major			= 1,
> -	.minor			= 1,
> +	.minor			= 2,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 2aae636f1..0e70e27fd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -228,6 +228,7 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>  	pfdev->features.thread_max_workgroup_sz = gpu_read(pfdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
>  	pfdev->features.thread_max_barrier_sz = gpu_read(pfdev, GPU_THREAD_MAX_BARRIER_SIZE);
>  	pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
> +	pfdev->features.afbc_features = gpu_read(pfdev, GPU_AFBC_FEATURES);
>  	for (i = 0; i < 4; i++)
>  		pfdev->features.texture_features[i] = gpu_read(pfdev, GPU_TEXTURE_FEATURES(i));
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index eddaa62ad..dc9df5457 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -82,6 +82,7 @@
>  
>  #define GPU_TEXTURE_FEATURES(n)		(0x0B0 + ((n) * 4))
>  #define GPU_JS_FEATURES(n)		(0x0C0 + ((n) * 4))
> +#define GPU_AFBC_FEATURES		(0x4C)	/* (RO) AFBC support on Bifrost */
>  
>  #define GPU_SHADER_PRESENT_LO		0x100	/* (RO) Shader core present bitmap, low word */
>  #define GPU_SHADER_PRESENT_HI		0x104	/* (RO) Shader core present bitmap, high word */
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index ec19db1ee..061e700dd 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -171,6 +171,7 @@ enum drm_panfrost_param {
>  	DRM_PANFROST_PARAM_JS_FEATURES15,
>  	DRM_PANFROST_PARAM_NR_CORE_GROUPS,
>  	DRM_PANFROST_PARAM_THREAD_TLS_ALLOC,
> +	DRM_PANFROST_PARAM_AFBC_FEATURES,
>  };
>  
>  struct drm_panfrost_get_param {
> 

