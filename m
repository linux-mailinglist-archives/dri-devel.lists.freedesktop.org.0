Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3194B01F44
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BE610EA66;
	Fri, 11 Jul 2025 14:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ME7VczHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4688110EA66;
 Fri, 11 Jul 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aCy967UIRg6zoO+D2XjyWnFU8FS0fatcPCvM94I4+0A=; b=ME7VczHxwO1D0Yr8PDqCSrzE/+
 wJd/R5JUu3lxA4eJZhcjEL7xjqlY5c+uUrUk1Qev3O1k1YnfsOLkwDlSXR4gR3b+7h/Zbj674ivVI
 Awv3CoC489f51QofOrvWGYMpCIWtCnzGtyTvJRrkhd1xuZLKdkNf3OS9QZLZpWPl/oKMtlI2DzS+V
 efz6MmZQEdZJVZykQi2l0BYJRdx+qKy/pD5R09P7LB1pqr1585adG9YrEGBOFCZJI88sgMi/DbS9+
 3AZFvNkgelRkjF69dlRrYfLZM1xmCL83gfmjhZHWb2uMX+zpiiN9/GJafY0heOyQkxpu3xg4UWDio
 XzcAqFBg==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uaEqp-00FPWf-TV; Fri, 11 Jul 2025 16:35:48 +0200
Message-ID: <6fead129-28d5-4323-a2a8-fc177334619f@igalia.com>
Date: Fri, 11 Jul 2025 11:35:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 11/07/25 10:22, Christian König wrote:
> 
> 
> On 08.07.25 15:25, Maíra Canal wrote:
>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>> instead, a job just took unusually long (longer than the timeout) but is
>> still running, and there is, thus, no reason to reset the hardware. This
>> can occur in two scenarios:
>>
>>    1. The job is taking longer than the timeout, but the driver determined
>>       through a GPU-specific mechanism that the hardware is still making
>>       progress. Hence, the driver would like the scheduler to skip the
>>       timeout and treat the job as still pending from then onward. This
>>       happens in v3d, Etnaviv, and Xe.
>>    2. Timeout has fired before the free-job worker. Consequently, the
>>       scheduler calls `sched->ops->timedout_job()` for a job that isn't
>>       timed out.
>>
>> These two scenarios are problematic because the job was removed from the
>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
>> means that when the job finishes, it won't be freed by the scheduler
>> though `sched->ops->free_job()` - leading to a memory leak.
> 
> Yeah, that is unfortunately intentional.
> 
>> To solve these problems, create a new `drm_gpu_sched_stat`, called
>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
>> new status will indicate that the job must be reinserted into
>> `sched->pending_list`, and the hardware / driver will still complete that
>> job.
> 
> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
> 
> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.

I do understand that we have a race between timing out and signaling the
job. However, I believe we are taking measures to mitigate issues.

We are re-adding the job to the pending list (after it was removed in
the beginning of the timeout, so we aren't running with
drm_sched_get_finished_job()) and right after, the scheduler enqueues
the free-job work again if ready, which guarantees that if a signaled
job could be added to the pending list, it'll be freed.

Now, the drivers have the option to bail out of a reset if the timeout
has fired before the free-job worker, and most importantly, without
leaks.

Apart from that, +1 to Philipp's answer. This series is just
incorporating a common use-case to the scheduler's code (which we work
to improve later on) and it's use isn't mandatory by the drivers.

Best Regards,
- Maíra

> 
> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
> 
> Instead we should track the HW fences (or maybe the scheduler fences which point to the HW fence) the scheduler waits for.
> 
> This HW fence is then given as a parameter to the driver when we run into a timeout.
> 
> This has the clear advantage that dma_fence objects have a well defined livetime and necessary state transition. E.g. you can check at all times if the fence is signaled or not.
> 
> Regards,
> Christian.
> 
>>   
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 46 ++++++++++++++++++++++++++++++++--
>>   include/drm/gpu_scheduler.h            |  3 +++
>>   2 files changed, 47 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3d025c1e6bfc9f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>   {
>>   	struct drm_sched_job *job;
>>   
>> -	spin_lock(&sched->job_list_lock);
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>>   	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>   		__drm_sched_run_free_queue(sched);
>> +}
>> +
>> +static void drm_sched_run_free_queue_unlocked(struct drm_gpu_scheduler *sched)
>> +{
>> +	spin_lock(&sched->job_list_lock);
>> +	drm_sched_run_free_queue(sched);
>>   	spin_unlock(&sched->job_list_lock);
>>   }
>>   
>> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>   	spin_unlock(&sched->job_list_lock);
>>   }
>>   
>> +/**
>> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a false timeout
>> + * @sched: scheduler instance
>> + * @job: job to be reinserted on the pending list
>> + *
>> + * In the case of a "false timeout" - when a timeout occurs but the GPU isn't
>> + * hung and is making progress, the scheduler must reinsert the job back into
>> + * @sched->pending_list. Otherwise, the job and its resources won't be freed
>> + * through the &struct drm_sched_backend_ops.free_job callback.
>> + *
>> + * This function must be used in "false timeout" cases only.
>> + */
>> +static void drm_sched_job_reinsert_on_false_timeout(struct drm_gpu_scheduler *sched,
>> +						    struct drm_sched_job *job)
>> +{
>> +	spin_lock(&sched->job_list_lock);
>> +	list_add(&job->list, &sched->pending_list);
>> +
>> +	/* After reinserting the job, the scheduler enqueues the free-job work
>> +	 * again if ready. Otherwise, a signaled job could be added to the
>> +	 * pending list, but never freed.
>> +	 */
>> +	drm_sched_run_free_queue(sched);
>> +	spin_unlock(&sched->job_list_lock);
>> +}
>> +
>>   static void drm_sched_job_timedout(struct work_struct *work)
>>   {
>>   	struct drm_gpu_scheduler *sched;
>> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>   			job->sched->ops->free_job(job);
>>   			sched->free_guilty = false;
>>   		}
>> +
>> +		if (status == DRM_GPU_SCHED_STAT_NO_HANG)
>> +			drm_sched_job_reinsert_on_false_timeout(sched, job);
>>   	} else {
>>   		spin_unlock(&sched->job_list_lock);
>>   	}
>> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>    * This function is typically used for reset recovery (see the docu of
>>    * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>    * scheduler teardown, i.e., before calling drm_sched_fini().
>> + *
>> + * As it's only used for reset recovery, drivers must not call this function
>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>    */
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>   {
>> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>>    * drm_sched_backend_ops.timedout_job() for details). Do not call it for
>>    * scheduler startup. The scheduler itself is fully operational after
>>    * drm_sched_init() succeeded.
>> + *
>> + * As it's only used for reset recovery, drivers must not call this function
>> + * in their &struct drm_sched_backend_ops.timedout_job callback when they
>> + * skip a reset using &enum drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
>>    */
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
>>   {
>> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>   	if (job)
>>   		sched->ops->free_job(job);
>>   
>> -	drm_sched_run_free_queue(sched);
>> +	drm_sched_run_free_queue_unlocked(sched);
>>   	drm_sched_run_job_queue(sched);
>>   }
>>   
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e159de59b263c76 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -393,11 +393,14 @@ struct drm_sched_job {
>>    * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>>    * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
>>    * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
>> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption, the GPU
>> + * did not hang and is still running.
>>    */
>>   enum drm_gpu_sched_stat {
>>   	DRM_GPU_SCHED_STAT_NONE,
>>   	DRM_GPU_SCHED_STAT_RESET,
>>   	DRM_GPU_SCHED_STAT_ENODEV,
>> +	DRM_GPU_SCHED_STAT_NO_HANG,
>>   };
>>   
>>   /**
>>
> 

