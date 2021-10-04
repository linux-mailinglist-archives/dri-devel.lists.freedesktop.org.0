Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A93420A1D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 13:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379BD6E9D7;
	Mon,  4 Oct 2021 11:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ADD56E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 11:30:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C6D1FB;
 Mon,  4 Oct 2021 04:30:49 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19AF3F766;
 Mon,  4 Oct 2021 04:30:47 -0700 (PDT)
Subject: Re: [PATCH v5 6/8] drm/panfrost: Support synchronization jobs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210930190954.1525933-1-boris.brezillon@collabora.com>
 <20210930190954.1525933-7-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <9ed27061-54f3-1804-936d-18aecf3d8872@arm.com>
Date: Mon, 4 Oct 2021 12:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930190954.1525933-7-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2021 20:09, Boris Brezillon wrote:
> Sometimes, all the user wants to do is add a synchronization point.
> Userspace can already do that by submitting a NULL job, but this implies
> submitting something to the GPU when we could simply skip the job and
> signal the done fence directly.
> 
> v5:
> * New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

I had thought we would be fine without kbase's "dependency only atom"
because we don't have the fan-{in,out} problems that kbase's atoms
produce. But if we're ending up with real hardware NULL jobs then this
is clearly better.

A couple of minor points below, but as far as I can tell this is
functionally correct.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++--
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++++++
>  include/uapi/drm/panfrost_drm.h         | 7 +++++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 30dc158d56e6..89a0c484310c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -542,7 +542,9 @@ static const struct panfrost_submit_ioctl_version_info submit_versions[] = {
>  	[1] = { 48, 8, 16 },
>  };
>  
> -#define PANFROST_JD_ALLOWED_REQS PANFROST_JD_REQ_FS
> +#define PANFROST_JD_ALLOWED_REQS \
> +	(PANFROST_JD_REQ_FS | \
> +	 PANFROST_JD_REQ_DEP_ONLY)
>  
>  static int
>  panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
> @@ -559,7 +561,10 @@ panfrost_submit_job(struct drm_device *dev, struct drm_file *file_priv,
>  	if (args->requirements & ~PANFROST_JD_ALLOWED_REQS)
>  		return -EINVAL;
>  
> -	if (!args->head)
> +	/* If this is a dependency-only job, the job chain head should be NULL,
> +	 * otherwise it should be non-NULL.
> +	 */
> +	if ((args->head != 0) != !(args->requirements & PANFROST_JD_REQ_DEP_ONLY))

NIT: There's confusion over NULL vs 0 here - the code is correct
(args->head is a u64 and not a pointer for a kernel) but the comment
makes it seem like it should be a pointer.

We could side-step the mismatch by rewriting as below:

  !args->head == !(args->requirements & PANFROST_JD_REQ_DEP_ONLY)

Although I'm not convinced whether that's more readable or not!

>  		return -EINVAL;
>  
>  	bo_stride = submit_versions[version].bo_ref_stride;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 0367cee8f6df..6d8706d4a096 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -192,6 +192,12 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	u64 jc_head = job->jc;
>  	int ret;
>  
> +	if (job->requirements & PANFROST_JD_REQ_DEP_ONLY) {
> +		/* Nothing to execute, signal the fence directly. */
> +		dma_fence_signal_locked(job->done_fence);
> +		return;
> +	}
> +

It took me a while to convince myself that the reference counting for
the PM reference is correct. Before panfrost_job_hw_submit() always
returned with an extra reference, but now we have a case which doesn't.
AFAICT this is probably fine because we dereference on the path where
the hardware has completed the job (which obviously won't happen here).
But I'm still a bit uneasy whether the reference counts are always correct.

Steve

>  	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
>  
>  	ret = pm_runtime_get_sync(pfdev->dev);
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 5e3f8a344f41..b9df066970f6 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -46,6 +46,13 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
>  
>  #define PANFROST_JD_REQ_FS (1 << 0)
> +
> +/*
> + * Dependency only job. The job chain head should be set to 0 when this flag
> + * is set.
> + */
> +#define PANFROST_JD_REQ_DEP_ONLY (1 << 1)
> +
>  /**
>   * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
>   * engine.
> 

