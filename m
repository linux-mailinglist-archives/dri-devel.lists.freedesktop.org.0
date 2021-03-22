Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86D34493A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9306E4E6;
	Mon, 22 Mar 2021 15:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 805226E12D;
 Mon, 22 Mar 2021 15:28:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD021042;
 Mon, 22 Mar 2021 08:28:00 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBBC93F719;
 Mon, 22 Mar 2021 08:27:58 -0700 (PDT)
Subject: Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <bd11b7f4-41a8-fd29-bc94-656c7c83c552@arm.com>
Date: Mon, 22 Mar 2021 15:29:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/03/2021 05:23, Zhang, Jack (Jian) wrote:
> [AMD Public Use]
> 
> Hi, Rob/Tomeu/Steven,
> 
> Would you please help to review this patch for panfrost driver?
> 
> Thanks,
> Jack Zhang
> 
> -----Original Message-----
> From: Jack Zhang <Jack.Zhang1@amd.com>
> Sent: Monday, March 15, 2021 1:21 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
> Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
> Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
> 
> re-insert Bailing jobs to avoid memory leak.
> 
> V2: move re-insert step to drm/scheduler logic
> V3: add panfrost's return value for bailing jobs
> in case it hits the memleak issue.

This commit message could do with some work - it's really hard to 
decipher what the actual problem you're solving is.

> 
> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
>   drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>   include/drm/gpu_scheduler.h                | 1 +
>   5 files changed, 19 insertions(+), 6 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..e2cb4f32dae1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>   	 * spurious. Bail out.
>   	 */
>   	if (dma_fence_is_signaled(job->done_fence))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_BAILING;
>   
>   	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>   		js,
> @@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>   
>   	/* Scheduler is already stopped, nothing to do. */
>   	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_BAILING;
>   
>   	/* Schedule a reset if there's no reset in progress. */
>   	if (!atomic_xchg(&pfdev->reset.pending, 1))

This looks correct to me - in these two cases drm_sched_stop() is not 
called on the sched_job, so it looks like currently the job will be leaked.

> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..a44f621fb5c4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   {
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_job *job;
> +	int ret;
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
>   
> -		job->sched->ops->timedout_job(job);
> +		ret = job->sched->ops->timedout_job(job);
>   
> +		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->node, &sched->ring_mirror_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}

I think we could really do with a comment somewhere explaining what 
"bailing" means in this context. For the Panfrost case we have two cases:

  * The GPU job actually finished while the timeout code was running 
(done_fence is signalled).

  * The GPU is already in the process of being reset (Panfrost has 
multiple queues, so mostly like a bad job in another queue).

I'm also not convinced that (for Panfrost) it makes sense to be adding 
the jobs back to the list. For the first case above clearly the job 
could just be freed (it's complete). The second case is more interesting 
and Panfrost currently doesn't handle this well. In theory the driver 
could try to rescue the job ('soft stop' in Mali language) so that it 
could be resubmitted. Panfrost doesn't currently support that, so 
attempting to resubmit the job is almost certainly going to fail.

It's on my TODO list to look at improving Panfrost in this regard, but 
sadly still quite far down.

Steve

>   		/*
>   		 * Guilty job did complete and hence needs to be manually removed
>   		 * See drm_sched_stop doc.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 4ea8606d91fe..8093ac2427ef 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>   	DRM_GPU_SCHED_STAT_NOMINAL,
>   	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_BAILING,
>   };
>   
>   /**
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
