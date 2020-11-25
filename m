Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C236F2C3EB2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 12:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC616E923;
	Wed, 25 Nov 2020 11:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C1696E8A7;
 Wed, 25 Nov 2020 11:04:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88F9A106F;
 Wed, 25 Nov 2020 03:04:06 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E2973F70D;
 Wed, 25 Nov 2020 03:04:05 -0800 (PST)
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <40741fd8-4496-2c12-7850-b68fe8dc8e2a@arm.com>
Date: Wed, 25 Nov 2020 11:04:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125031708.6433-4-luben.tuikov@amd.com>
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2020 03:17, Luben Tuikov wrote:
> The job timeout handler now returns status
> indicating back to the DRM layer whether the job
> was successfully cancelled or whether more time
> should be given to the job to complete.

I'm not sure I understand in what circumstances you would want to give 
the job more time to complete. Could you expand on that?

One thing we're missing at the moment in Panfrost is the ability to 
suspend ("soft stop" is the Mali jargon) a job and pick something else 
to run. The propitiatory driver stack uses this to avoid timing out long 
running jobs while still allowing other processes to have time on the 
GPU. But this interface as it stands doesn't seem to provide that.

As the kernel test robot has already pointed out - you'll need to at the 
very least update the other uses of this interface.

Steve

> 
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 ++++--
>   include/drm/gpu_scheduler.h             | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ff48101bab55..81b73790ecc6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -28,7 +28,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   
> -static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> +static int amdgpu_job_timedout(struct drm_sched_job *s_job)
>   {
>   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> @@ -41,7 +41,7 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>   		DRM_ERROR("ring %s timeout, but soft recovered\n",
>   			  s_job->sched->name);
> -		return;
> +		return 0;
>   	}
>   
>   	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> @@ -53,10 +53,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>   		amdgpu_device_gpu_recover(ring->adev, job);
> +		return 0;
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))
>   			adev->virt.tdr_debug = true;
> +		return 1;
>   	}
>   }
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 2e0c368e19f6..61f7121e1c19 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -230,10 +230,17 @@ struct drm_sched_backend_ops {
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   
>   	/**
> -         * @timedout_job: Called when a job has taken too long to execute,
> -         * to trigger GPU recovery.
> +	 * @timedout_job: Called when a job has taken too long to execute,
> +	 * to trigger GPU recovery.
> +	 *
> +	 * Return 0, if the job has been aborted successfully and will
> +	 * never be heard of from the device. Return non-zero if the
> +	 * job wasn't able to be aborted, i.e. if more time should be
> +	 * given to this job. The result is not "bool" as this
> +	 * function is not a predicate, although its result may seem
> +	 * as one.
>   	 */
> -	void (*timedout_job)(struct drm_sched_job *sched_job);
> +	int (*timedout_job)(struct drm_sched_job *sched_job);
>   
>   	/**
>            * @free_job: Called once the job's finished fence has been signaled
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
