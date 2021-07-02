Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7B3B9E7F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCAC89DA2;
	Fri,  2 Jul 2021 09:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDEB889DA2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:45:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB901FB;
 Fri,  2 Jul 2021 02:45:22 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35DE63F718;
 Fri,  2 Jul 2021 02:45:21 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] drm/panfrost: Add BO access flags to relax
 dependencies between jobs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <bacf8e3f-c06e-b96d-607d-42a5f682709c@arm.com>
Date: Fri, 2 Jul 2021 10:45:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091224.3209803-4-boris.brezillon@collabora.com>
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
> Jobs reading from the same BO should not be serialized. Add access
> flags so we can relax the implicit dependencies in that case. We force
> exclusive access for now to keep the behavior unchanged, but a new
> SUBMIT ioctl taking explicit access flags will be introduced.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  9 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_job.c | 23 +++++++++++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_job.h |  1 +
>  include/uapi/drm/panfrost_drm.h         |  2 ++
>  4 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 9bbc9e78cc85..b6b5997c9366 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -164,6 +164,15 @@ panfrost_lookup_bos(struct drm_device *dev,
>  	if (!job->bo_count)
>  		return 0;
>  
> +	job->bo_flags = kvmalloc_array(job->bo_count,
> +				       sizeof(*job->bo_flags),
> +				       GFP_KERNEL | __GFP_ZERO);
> +	if (!job->bo_flags)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < job->bo_count; i++)
> +		job->bo_flags[i] = PANFROST_BO_REF_EXCLUSIVE;
> +
>  	ret = drm_gem_objects_lookup(file_priv,
>  				     (void __user *)(uintptr_t)args->bo_handles,
>  				     job->bo_count, &job->bos);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index fdc1bd7ecf12..152245b122be 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -245,8 +245,16 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
>  	int i, ret;
>  
>  	for (i = 0; i < job->bo_count; i++) {
> -		/* panfrost always uses write mode in its current uapi */
> -		ret = drm_gem_fence_array_add_implicit(&job->deps, job->bos[i], true);
> +		bool exclusive = job->bo_flags[i] & PANFROST_BO_REF_EXCLUSIVE;
> +
> +		if (!exclusive) {
> +			ret = dma_resv_reserve_shared(job->bos[i]->resv, 1);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = drm_gem_fence_array_add_implicit(&job->deps, job->bos[i],
> +						       exclusive);
>  		if (ret)
>  			return ret;
>  	}
> @@ -258,8 +266,14 @@ static void panfrost_attach_object_fences(struct panfrost_job *job)
>  {
>  	int i;
>  
> -	for (i = 0; i < job->bo_count; i++)
> -		dma_resv_add_excl_fence(job->bos[i]->resv, job->render_done_fence);
> +	for (i = 0; i < job->bo_count; i++) {
> +		struct dma_resv *robj = job->bos[i]->resv;
> +
> +		if (job->bo_flags[i] & PANFROST_BO_REF_EXCLUSIVE)
> +			dma_resv_add_excl_fence(robj, job->render_done_fence);
> +		else
> +			dma_resv_add_shared_fence(robj, job->render_done_fence);
> +	}
>  }
>  
>  int panfrost_job_push(struct panfrost_job *job)
> @@ -340,6 +354,7 @@ static void panfrost_job_cleanup(struct kref *ref)
>  		kvfree(job->bos);
>  	}
>  
> +	kvfree(job->bo_flags);
>  	kfree(job);
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index 82306a03b57e..1cbc3621b663 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -32,6 +32,7 @@ struct panfrost_job {
>  
>  	struct panfrost_gem_mapping **mappings;
>  	struct drm_gem_object **bos;
> +	u32 *bo_flags;
>  	u32 bo_count;
>  
>  	/* Fence to be signaled by drm-sched once its done with the job */
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 061e700dd06c..45d6c600475c 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -224,6 +224,8 @@ struct drm_panfrost_madvise {
>  	__u32 retained;       /* out, whether backing store still exists */
>  };
>  
> +#define PANFROST_BO_REF_EXCLUSIVE	0x1
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 

