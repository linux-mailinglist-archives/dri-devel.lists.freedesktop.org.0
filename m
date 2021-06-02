Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0139889C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733846EB93;
	Wed,  2 Jun 2021 11:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 256246EB93
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:50:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAB66D;
 Wed,  2 Jun 2021 04:50:36 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E2F03F719;
 Wed,  2 Jun 2021 04:50:35 -0700 (PDT)
Subject: Re: [PATCH 4/4] drm/panfrost: Handle PANFROST_JD_REQ_PERMON
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
 <20210527203804.12914-5-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <22842b4b-4368-0438-26f0-f98a734cbe78@arm.com>
Date: Wed, 2 Jun 2021 12:50:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527203804.12914-5-alyssa.rosenzweig@collabora.com>
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2021 21:38, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> If a job requires cycle counters or timestamps, we must enable cycle
> counting just before issuing the job, and disable as soon as the job
> completes.
> 
> Since this extends the UABI, we bump the driver minor version and date.
> That lets userspace detect cycle counter support, and only advertise
> features like ARB_shader_clock on kernels with this commit.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 +++++++---
>  drivers/gpu/drm/panfrost/panfrost_job.c |  6 ++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ca07098a6..0f11d2df4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,6 +20,10 @@
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
>  
> +#define JOB_REQUIREMENTS \
> +	(PANFROST_JD_REQ_FS | \
> +	 PANFROST_JD_REQ_PERMON)
> +
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
>  
> @@ -247,7 +251,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (!args->jc)
>  		return -EINVAL;
>  
> -	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
> +	if (args->requirements & ~JOB_REQUIREMENTS)
>  		return -EINVAL;
>  
>  	if (args->out_sync > 0) {
> @@ -557,9 +561,9 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.fops			= &panfrost_drm_driver_fops,
>  	.name			= "panfrost",
>  	.desc			= "panfrost DRM",
> -	.date			= "20180908",
> +	.date			= "20210527",
>  	.major			= 1,
> -	.minor			= 1,
> +	.minor			= 2,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1..b78147e3d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -165,6 +165,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  		return;
>  	}
>  
> +	if (job->requirements & PANFROST_JD_REQ_PERMON)
> +		panfrost_acquire_permon(job->pfdev);
> +

This is leaky - panfrost_job_hw_submit() is currently unconditional - it
pretends to always succeed in submitting the job, so any reference
counting has to always happen. I have a patch fixing this mess:

https://lore.kernel.org/dri-devel/20210512152419.30003-1-steven.price@arm.com/

(Review welcome!)

Basically in the (unlikely) event that the function bails out early
(pm_runtime_get_sync() fails or we hit the WARN_ON) then the job will
still be cleaned up causing the reference count to go negative.

I'm also suspicious that jobs can be cleaned up without ever being
submitted, or submitted more than once (due to a GPU reset). But I
haven't chased that down to be sure that's a problem in reality.

One obvious option would be to add a flag to the job to record whether
we have taken the 'PERMON' reference count.

Thanks,

Steve

>  	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
>  
>  	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
> @@ -296,6 +299,9 @@ static void panfrost_job_cleanup(struct kref *ref)
>  		kvfree(job->bos);
>  	}
>  
> +	if (job->requirements & PANFROST_JD_REQ_PERMON)
> +		panfrost_release_permon(job->pfdev);
> +
>  	kfree(job);
>  }
>  
> 

