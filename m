Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318B7A4673
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6121710E256;
	Mon, 18 Sep 2023 09:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D18EE10E256;
 Mon, 18 Sep 2023 09:55:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3AD4C15;
 Mon, 18 Sep 2023 02:55:37 -0700 (PDT)
Received: from [10.57.64.210] (unknown [10.57.64.210])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7D933F67D;
 Mon, 18 Sep 2023 02:54:56 -0700 (PDT)
Message-ID: <17d84700-5d3b-c600-d205-51ee29470fbf@arm.com>
Date: Mon, 18 Sep 2023 10:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/6] drm/drm_file: Add DRM obj's RSS reporting function
 for fdinfo
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org
References: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
 <20230914223928.2374933-5-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230914223928.2374933-5-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, healych@amazon.com,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 23:38, Adrián Larumbe wrote:
> Some BO's might be mapped onto physical memory chunkwise and on demand,
> like Panfrost's tiler heap. In this case, even though the
> drm_gem_shmem_object page array might already be allocated, only a very
> small fraction of the BO is currently backed by system memory, but
> drm_show_memory_stats will then proceed to add its entire virtual size to
> the file's total resident size regardless.
> 
> This led to very unrealistic RSS sizes being reckoned for Panfrost, where
> said tiler heap buffer is initially allocated with a virtual size of 128
> MiB, but only a small part of it will eventually be backed by system memory
> after successive GPU page faults.
> 
> Provide a new DRM object generic function that would allow drivers to
> return a more accurate RSS size for their BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_file.c | 5 ++++-
>  include/drm/drm_gem.h      | 9 +++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 883d83bc0e3d..762965e3d503 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -944,7 +944,10 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>  		}
>  
>  		if (s & DRM_GEM_OBJECT_RESIDENT) {
> -			status.resident += obj->size;
> +			if (obj->funcs && obj->funcs->rss)
> +				status.resident += obj->funcs->rss(obj);
> +			else
> +				status.resident += obj->size;
>  		} else {
>  			/* If already purged or not yet backed by pages, don't
>  			 * count it as purgeable:
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bc9f6aa2f3fe..16364487fde9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
>  	 */
>  	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
>  
> +	/**
> +	 * @rss:
> +	 *
> +	 * Return resident size of the object in physical memory.
> +	 *
> +	 * Called by drm_show_memory_stats().
> +	 */
> +	size_t (*rss)(struct drm_gem_object *obj);
> +
>  	/**
>  	 * @vm_ops:
>  	 *

