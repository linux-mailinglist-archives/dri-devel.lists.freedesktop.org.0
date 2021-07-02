Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EA3B9E76
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D76E088;
	Fri,  2 Jul 2021 09:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D0BF6E0A1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:42:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 400D61FB;
 Fri,  2 Jul 2021 02:42:30 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0C233F694;
 Fri,  2 Jul 2021 02:42:28 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] drm/panfrost: Pass a job to
 panfrost_{acquire,attach_object_fences}()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <0e167943-8fea-530f-9b01-b2ecd62185b5@arm.com>
Date: Fri, 2 Jul 2021 10:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091224.3209803-2-boris.brezillon@collabora.com>
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
> So we don't have to change the prototype if we extend the function.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Subject NIT:
> drm/panfrost: Pass a job to panfrost_{acquire,attach_object_fences}()

Should be panfrost_{acquire,attach}_object_fences()

Otherwise:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 71a72fb50e6b..fdc1bd7ecf12 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -240,15 +240,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	spin_unlock(&pfdev->js->job_lock);
>  }
>  
> -static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> -					  int bo_count,
> -					  struct xarray *deps)
> +static int panfrost_acquire_object_fences(struct panfrost_job *job)
>  {
>  	int i, ret;
>  
> -	for (i = 0; i < bo_count; i++) {
> +	for (i = 0; i < job->bo_count; i++) {
>  		/* panfrost always uses write mode in its current uapi */
> -		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
> +		ret = drm_gem_fence_array_add_implicit(&job->deps, job->bos[i], true);
>  		if (ret)
>  			return ret;
>  	}
> @@ -256,14 +254,12 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
>  	return 0;
>  }
>  
> -static void panfrost_attach_object_fences(struct drm_gem_object **bos,
> -					  int bo_count,
> -					  struct dma_fence *fence)
> +static void panfrost_attach_object_fences(struct panfrost_job *job)
>  {
>  	int i;
>  
> -	for (i = 0; i < bo_count; i++)
> -		dma_resv_add_excl_fence(bos[i]->resv, fence);
> +	for (i = 0; i < job->bo_count; i++)
> +		dma_resv_add_excl_fence(job->bos[i]->resv, job->render_done_fence);
>  }
>  
>  int panfrost_job_push(struct panfrost_job *job)
> @@ -290,8 +286,7 @@ int panfrost_job_push(struct panfrost_job *job)
>  
>  	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>  
> -	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> -					     &job->deps);
> +	ret = panfrost_acquire_object_fences(job);
>  	if (ret) {
>  		mutex_unlock(&pfdev->sched_lock);
>  		goto unlock;
> @@ -303,8 +298,7 @@ int panfrost_job_push(struct panfrost_job *job)
>  
>  	mutex_unlock(&pfdev->sched_lock);
>  
> -	panfrost_attach_object_fences(job->bos, job->bo_count,
> -				      job->render_done_fence);
> +	panfrost_attach_object_fences(job);
>  
>  unlock:
>  	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
> 

