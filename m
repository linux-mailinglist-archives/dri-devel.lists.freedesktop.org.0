Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D8C8A008
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6E510E0F6;
	Wed, 26 Nov 2025 13:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="f7JiM0Be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279F210E030;
 Wed, 26 Nov 2025 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764163510;
 bh=H6BI2X3mzMvCYJOwFD15MG+bOvi+S6gKpcz/Xq+78H0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f7JiM0BewEFZ7dwK7mR03OYqFOEXV4FzefG+C1DNlv8YP25qXbTjHBhQKCCpzrCW8
 kERCKjUNUZ3aEpy1Irs4abgg1mc8ou+fSbTa6MZBqqM20YPeXT72xxd7VI5SgjfuPH
 Mk/KDEPJmE6oQX3+82fVwgTFwPUOo9yfm4M28gf4LdiGRH4FCR/g2vR9ik+/32efmr
 PYqXQdEoNC1jXiPaEV4EXHEJWxGJwCOXamp828uSi9tUdwgF8vvH/iN98ELc2CiBjQ
 k9MhAfBm9ZHMmM86RxSkTByaDxHDnZyLEZdLdAY5ZEy229xxrHbyY18Vld73yzRj+M
 trYdpQTBqSMFQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A09FB17E110C;
 Wed, 26 Nov 2025 14:25:09 +0100 (CET)
Date: Wed, 26 Nov 2025 14:25:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v6 06/16] drm/panthor: Expose the selected coherency
 protocol to the UMD
Message-ID: <20251126142504.5654962f@fedora>
In-Reply-To: <20251126124455.3656651-7-boris.brezillon@collabora.com>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <20251126124455.3656651-7-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 26 Nov 2025 13:44:45 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> If we want to be able to skip CPU cache maintenance operations on
> CPU-cached mappings, the UMD needs to know the kind of coherency
> in place. Add a field to drm_panthor_gpu_info to do that. We can re-use
> a padding field for that since this object is write-only from the
> KMD perspective, and the UMD should just ignore it.
> 
> v2:
> - New commit
> 
> v3:
> - Make coherency protocol a real enum, not a bitmask
> - Add BUILD_BUG_ON()s to make sure the values in panthor_regs.h and
>   those exposed through the uAPI match
> 
> v4:
> - Add Steve's R-b
> 
> v5:
> - No changes
> 
> v6:
> - No changes
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 10 +++++-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
>  include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
>  3 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index e133b1e0ad6d..a66fc66999c2 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -27,6 +27,12 @@
>  
>  static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  {
> +	BUILD_BUG_ON(GPU_COHERENCY_NONE != DRM_PANTHOR_GPU_COHERENCY_NONE);
> +	BUILD_BUG_ON(GPU_COHERENCY_ACE_LITE != DRM_PANTHOR_GPU_COHERENCY_ACE_LITE);
> +	BUILD_BUG_ON(GPU_COHERENCY_ACE != DRM_PANTHOR_GPU_COHERENCY_ACE);
> +
> +	/* Start with no coherency, and update it if the device is flagged coherent. */
> +	ptdev->gpu_info.selected_coherency = GPU_COHERENCY_NONE;
>  	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
>  
>  	if (!ptdev->coherent)
> @@ -36,8 +42,10 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
>  	 * ACE protocol has never been supported for command stream frontend GPUs.
>  	 */
>  	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> -		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +		      GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
> +		ptdev->gpu_info.selected_coherency = GPU_COHERENCY_ACE_LITE;
>  		return 0;
> +	}
>  
>  	drm_err(&ptdev->base, "Coherency not supported by the device");
>  	return -ENOTSUPP;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index cd38da5ad26c..b7c64be0b6e2 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -51,7 +51,7 @@ struct panthor_gpu {
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> -		  ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_NONE);
> +		  ptdev->gpu_info.selected_coherency);
>  }
>  
>  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 467d365ed7ba..f0f637e0631d 100644
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
> +	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE coherency.

Forgot to fix:

	 * @DRM_PANTHOR_GPU_COHERENCY_ACE: ACE coherency.

> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_ACE = 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
> +	 */
> +	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
> +};
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

