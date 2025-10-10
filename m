Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4CBCD7FF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D910E2B2;
	Fri, 10 Oct 2025 14:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7892110E2B2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 14:22:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 233BC1596;
 Fri, 10 Oct 2025 07:22:47 -0700 (PDT)
Received: from [10.57.35.12] (unknown [10.57.35.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B20003F59E;
 Fri, 10 Oct 2025 07:22:52 -0700 (PDT)
Message-ID: <9664ba34-c02e-446a-bfc7-5b7f32a60833@arm.com>
Date: Fri, 10 Oct 2025 15:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] drm/panthor: Expose the selected coherency
 protocol to the UMD
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251010101147.3290604-5-boris.brezillon@collabora.com>
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
> If we want to be able to skip CPU cache maintenance operations on
> CPU-cached mappings, the UMD needs to know the kind of coherency
> in place. Add a field to drm_panthor_gpu_info to do that. We can re-use
> a padding field for that since this object is write-only from the
> KMD perspective, and the UMD should just ignore it.
> 
> v2:
> - New commit
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  6 +++-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
>  include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
>  3 files changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index c7033d82cef5..afe24a03a71c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -25,6 +25,8 @@
>  
>  static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  {
> +	/* Start with no coherency, and update it if the device is flagged coherent. */
> +	ptdev->gpu_info.selected_coherency = GPU_COHERENCY_NONE;
>  	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
>  
>  	if (!ptdev->coherent)
> @@ -34,8 +36,10 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  	 * ACE protocol has never been supported for command stream frontend GPUs.
>  	 */
>  	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> -		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +		      GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
> +		ptdev->gpu_info.selected_coherency = GPU_COHERENCY_PROT_BIT(ACE_LITE);
>  		return 0;
> +	}
>  
>  	drm_err(&ptdev->base, "Coherency not supported by the device");
>  	return -ENOTSUPP;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 9d98720ce03f..a95c0b94ef58 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -49,7 +49,7 @@ struct panthor_gpu {
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
> +		  ptdev->gpu_info.selected_coherency);

It looks like an existing bug, but GPU_COHERENCY_PROTOCOL doesn't take a
bit mask. So we should be just writing GPU_COHERENCY_ACE_LITE not
GPU_COHERENCY_PROT_BIT(ACE_LITE).

>  }
>  
>  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 467d365ed7ba..b9e483ff5e21 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -245,6 +245,26 @@ enum drm_panthor_dev_query_type {
>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>  };
>  
> +/**
> + * enum drm_panthor_gpu_coherency: Type of GPU coherency
> + */
> +enum drm_panthor_gpu_coherency {
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE coherency.

Copy/paste mistake                       ^^^^^

> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_ACE = 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
> +};

This is a mix of bit mask and non-bit mask. I'm assuming this was
intended for the newly added selected_coherency field, in which case it
shouldn't be shifting - the values are 0 and 1 for ace_lite and ace.

Thanks,
Steve

> +
>  /**
>   * struct drm_panthor_gpu_info - GPU information
>   *
> @@ -301,7 +321,16 @@ struct drm_panthor_gpu_info {
>  	 */
>  	__u32 thread_max_barrier_size;
>  
> -	/** @coherency_features: Coherency features. */
> +	/**
> +	 * @coherency_features: Coherency features.
> +	 *
> +	 * Combination of drm_panthor_gpu_coherency flags.
> +	 *
> +	 * Note that this is just what the coherency protocols supported by the
> +	 * GPU, but the actual coherency in place depends on the SoC
> +	 * integration and is reflected by
> +	 * drm_panthor_gpu_info::selected_coherency.
> +	 */
>  	__u32 coherency_features;
>  
>  	/** @texture_features: Texture features. */
> @@ -310,8 +339,12 @@ struct drm_panthor_gpu_info {
>  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
>  	__u32 as_present;
>  
> -	/** @pad0: MBZ. */
> -	__u32 pad0;
> +	/**
> +	 * @select_coherency: Coherency selected for this device.
> +	 *
> +	 * One of drm_panthor_gpu_coherency.
> +	 */
> +	__u32 selected_coherency;
>  
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;

