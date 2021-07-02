Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DB3B9E79
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09EC899F0;
	Fri,  2 Jul 2021 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24BED899F0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:43:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BF21FB;
 Fri,  2 Jul 2021 02:43:51 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BEC13F694;
 Fri,  2 Jul 2021 02:43:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] drm/panfrost: Move the mappings collection out of
 panfrost_lookup_bos()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <edf44a05-37d4-1aab-7571-b17e0b8f43f7@arm.com>
Date: Fri, 2 Jul 2021 10:43:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091224.3209803-3-boris.brezillon@collabora.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/2021 10:12, Boris Brezillon wrote:
> So we can re-use it from elsewhere.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 52 ++++++++++++++-----------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ffaef5ec5ff..9bbc9e78cc85 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -109,6 +109,34 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> +static int
> +panfrost_get_job_mappings(struct drm_file *file_priv, struct panfrost_job *job)
> +{
> +	struct panfrost_file_priv *priv = file_priv->driver_priv;
> +	unsigned int i;
> +
> +	job->mappings = kvmalloc_array(job->bo_count,
> +				       sizeof(*job->mappings),
> +				       GFP_KERNEL | __GFP_ZERO);
> +	if (!job->mappings)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < job->bo_count; i++) {
> +		struct panfrost_gem_mapping *mapping;
> +		struct panfrost_gem_object *bo;
> +
> +		bo = to_panfrost_bo(job->bos[i]);
> +		mapping = panfrost_gem_mapping_get(bo, priv);
> +		if (!mapping)
> +			return -EINVAL;
> +
> +		atomic_inc(&bo->gpu_usecount);
> +		job->mappings[i] = mapping;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * panfrost_lookup_bos() - Sets up job->bo[] with the GEM objects
>   * referenced by the job.
> @@ -128,8 +156,6 @@ panfrost_lookup_bos(struct drm_device *dev,
>  		  struct drm_panfrost_submit *args,
>  		  struct panfrost_job *job)
>  {
> -	struct panfrost_file_priv *priv = file_priv->driver_priv;
> -	struct panfrost_gem_object *bo;
>  	unsigned int i;
>  	int ret;
>  
> @@ -144,27 +170,7 @@ panfrost_lookup_bos(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> -	job->mappings = kvmalloc_array(job->bo_count,
> -				       sizeof(struct panfrost_gem_mapping *),
> -				       GFP_KERNEL | __GFP_ZERO);
> -	if (!job->mappings)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < job->bo_count; i++) {
> -		struct panfrost_gem_mapping *mapping;
> -
> -		bo = to_panfrost_bo(job->bos[i]);
> -		mapping = panfrost_gem_mapping_get(bo, priv);
> -		if (!mapping) {
> -			ret = -EINVAL;
> -			break;
> -		}
> -
> -		atomic_inc(&bo->gpu_usecount);
> -		job->mappings[i] = mapping;
> -	}
> -
> -	return ret;
> +	return panfrost_get_job_mappings(file_priv, job);
>  }
>  
>  /**
> 

