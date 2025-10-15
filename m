Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDE4BDF8C5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F7E10E850;
	Wed, 15 Oct 2025 16:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 226F210E850
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:07:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE0EA1655;
 Wed, 15 Oct 2025 09:06:51 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FC843F66E;
 Wed, 15 Oct 2025 09:06:57 -0700 (PDT)
Message-ID: <2b063a95-8911-48cb-b279-4ef82b178515@arm.com>
Date: Wed, 15 Oct 2025 17:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] drm/panfrost: Add flag to map GEM object
 Write-Back Cacheable
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-14-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015160326.3657287-14-boris.brezillon@collabora.com>
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
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> Will be used by the UMD to optimize CPU accesses to buffers
> that are frequently read by the CPU, or on which the access
> pattern makes non-cacheable mappings inefficient.
> 
> Mapping buffers CPU-cached implies taking care of the CPU
> cache maintenance in the UMD, unless the GPU is IO coherent.
> 
> v2:
> - Add more to the commit message
> 
> v3:
> - No changes
> 
> v4:
> - Fix the map_wc test in panfrost_ioctl_query_bo_info()
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c |  3 +++
>  include/uapi/drm/panfrost_drm.h         |  1 +
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 00c0881fa2f0..9ca08d148f56 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -125,6 +125,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>  	return 0;
>  }
>  
> +#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
> +				 PANFROST_BO_HEAP | \
> +				 PANFROST_BO_WB_MMAP)
> +
>  static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  		struct drm_file *file)
>  {
> @@ -134,8 +138,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  	struct panfrost_gem_mapping *mapping;
>  	int ret;
>  
> -	if (!args->size || args->pad ||
> -	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
> +	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
>  		return -EINVAL;
>  
>  	/* Heaps should never be executable */
> @@ -661,6 +664,9 @@ static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
>  
>  		if (bo->is_heap)
>  			args->create_flags |= PANFROST_BO_HEAP;
> +
> +		if (!bo->base.map_wc)
> +			args->create_flags |= PANFROST_BO_WB_MMAP;
>  	}
>  
>  	drm_gem_object_put(gem_obj);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index da0362202d94..0e8028ee9d1f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -320,6 +320,9 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
>  	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
>  	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
>  
> +	if (flags & PANFROST_BO_WB_MMAP)
> +		bo->base.map_wc = false;
> +
>  	return bo;
>  }
>  
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index e7d01e744efd..244d2f96c2d7 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -104,6 +104,7 @@ struct drm_panfrost_wait_bo {
>  /* Valid flags to pass to drm_panfrost_create_bo */
>  #define PANFROST_BO_NOEXEC	1
>  #define PANFROST_BO_HEAP	2
> +#define PANFROST_BO_WB_MMAP	4
>  
>  /**
>   * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.

