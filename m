Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC657A8906
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 17:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8310E51A;
	Wed, 20 Sep 2023 15:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B883D10E518;
 Wed, 20 Sep 2023 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695225278; x=1726761278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GX8QBYbOXmpGWhJr3AbYH3d7nSxzLiqXFbOp3mAqEig=;
 b=WylZlahxTDUlLOyYpmJDuSOPr+d+jTS0NzWgpiAkjdJkTQvQmU45wdSf
 VfMytZiisELi96R6a92Vc4Mph7HI2SvLD6xsu555o3C8rN4sr8Lh/vpCp
 PSvlGzYNTTr6cfFtR/Px1Y5xANyC8HYlPRu/zveMZQ8lNOyOqosWERCc2
 p9RQXDEUlkrMplf7LGbcCV0NGdksTqQ7tedQJSbl/Yzow93BK1x63fP0s
 LvfeEV7U1hb8n6WWFr45AewGqb5fEm5xyuw34wurpDGepYg/4IfVjbZOm
 h7Otk1gRlFj+JZPodDMl0HYaI3HTbdB0cXL6KbuwL2sSdsMA6o3y3f6PG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380178468"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="380178468"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776043470"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="776043470"
Received: from conorbyr-mobl1.ger.corp.intel.com (HELO [10.213.199.161])
 ([10.213.199.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:53:57 -0700
Message-ID: <495203cd-d85e-2c00-4fa9-81879a882441@linux.intel.com>
Date: Wed, 20 Sep 2023 16:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/6] drm/drm_file: Add DRM obj's RSS reporting function
 for fdinfo
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-5-adrian.larumbe@collabora.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230919233556.1458793-5-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 20/09/2023 00:34, Adrián Larumbe wrote:
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
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_file.c | 5 ++++-
>   include/drm/drm_gem.h      | 9 +++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 883d83bc0e3d..762965e3d503 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -944,7 +944,10 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   		}
>   
>   		if (s & DRM_GEM_OBJECT_RESIDENT) {
> -			status.resident += obj->size;
> +			if (obj->funcs && obj->funcs->rss)
> +				status.resident += obj->funcs->rss(obj);
> +			else
> +				status.resident += obj->size;

Presumably you'd want the same smaller size in both active and 
purgeable? Or you can end up with more in those two than in rss which 
would look odd.

Also, alternative to adding a new callback could be adding multiple 
output parameters to the existing obj->func->status() which maybe ends 
up simpler due fewer callbacks?

Like:

  s = obj->funcs->status(obj, &supported_status, &rss)

And adjust the code flow to pick up the rss if driver signaled it 
supports reporting it.

Regards,

Tvrtko

>   		} else {
>   			/* If already purged or not yet backed by pages, don't
>   			 * count it as purgeable:
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bc9f6aa2f3fe..16364487fde9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
>   	 */
>   	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
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
>   	/**
>   	 * @vm_ops:
>   	 *
