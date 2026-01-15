Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0CD234D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709D10E703;
	Thu, 15 Jan 2026 08:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CgWASz95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0761010E703;
 Thu, 15 Jan 2026 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6br01WQN2sPbNd5JxCJZK4I+bNmGQhIZBjNyAAJ4Uc8=; b=CgWASz95jX4qw4AL+SbQnp3VXe
 Q15+0TipjAYECpnNbcb//Trkc8cV1s6FmRVMiHnIbHTetqCuB8UiQa/YsLOwH7o0fhBh+Eb0QABgS
 8gB697k6qYC4CdPi69BEXlTpXufQYLuFMgZBFCIIDYxFP4wLb1SfFjADftrxLxmKfvBQ8ztrmluP6
 Ux8B43kvwqs8Tkqpqh4RAAsvln4tMGBKAEXktvfpwXDfgQOSBNv57Gm+Q59mz0Fc/f4VZpOaQ6y/V
 vgU0hmmD41B8jGP6/CqGr3R5q7Ml9xfv+7+rmsLiSUrNvGdfruRToOe7ypHBf/NqSpT3CO5t3UAdc
 Y6l5WhYQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgJ9D-005eVe-IU; Thu, 15 Jan 2026 09:56:07 +0100
Message-ID: <5a267bb7-341d-4a68-9fa9-50166ccd528c@igalia.com>
Date: Thu, 15 Jan 2026 08:56:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/28] drm/sched: Account entity GPU time
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-8-tvrtko.ursulin@igalia.com>
 <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DFOI1X68AUI6.3N4LRMFN589FI@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 14/01/2026 17:48, Danilo Krummrich wrote:
> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>> +/**
>> + * drm_sched_entity_stats_alloc - Allocate a new struct drm_sched_entity_stats object
>> + *
>> + * Return: Pointer to newly allocated struct drm_sched_entity_stats object.
>> + */
>> +static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)
> 
> NIT: This function allocates and initializes the structure, hence something
> along the lines of *_new() is a better fit.

Can do.

>> +{
>> +	struct drm_sched_entity_stats *stats;
>> +
>> +	stats = kzalloc(sizeof(*stats), GFP_KERNEL);
>> +	if (!stats)
>> +		return NULL;
>> +
>> +	kref_init(&stats->kref);
>> +	spin_lock_init(&stats->lock);
>> +
>> +	return stats;
>> +}
> 
> <snip>
> 
>> +/**
>> + * struct drm_sched_entity_stats - execution stats for an entity.
>> + * @kref: reference count for the object.
>> + * @lock: lock guarding the @runtime updates.
>> + * @runtime: time entity spent on the GPU.
>> + *
>> + * Because jobs and entities have decoupled lifetimes, ie. we cannot access the
> 
> The beginning of this sentence seems slightly broken.

Suggest me an alternative because I don't see it?

>> + * entity once the job is completed and we know how much time it took on the
>> + * GPU, we need to track these stats in a separate object which is then
>> + * reference counted by both entities and jobs.
>> + */
>> +struct drm_sched_entity_stats {
>> +	struct kref	kref;
>> +	spinlock_t	lock;
>> +	ktime_t		runtime;
> 
> We can avoid the lock entirely by using a atomic64_t instead. ktime_t is just a
> typedef for s64.

Later in the series lock is needed (more members get added) so I wanted 
to avoid the churn of converting the atomic64_t to ktime_t in the fair 
policy patch.

>> +};
> 
> <snip>
> 
>> +/**
>> + * drm_sched_entity_stats_job_add_gpu_time - Account job execution time to entity
>> + * @job: Scheduler job to account.
>> + *
>> + * Accounts the execution time of @job to its respective entity stats object.
>> + */
>> +static inline void
>> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>> +{
>> +	struct drm_sched_entity_stats *stats = job->entity_stats;
>> +	struct drm_sched_fence *s_fence = job->s_fence;
>> +	ktime_t start, end;
>> +
>> +	start = dma_fence_timestamp(&s_fence->scheduled);
>> +	end = dma_fence_timestamp(&s_fence->finished);
>> +
>> +	spin_lock(&stats->lock);
>> +	stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
>> +	spin_unlock(&stats->lock);
>> +}
> 
> This shouldn't be an inline function in the header, please move to
> sched_entity.c.

It is not super pretty for a static inline but it was a pragmatic choice 
because it doesn't really belong to sched_entity.c. The whole entity 
stats object that is. Jobs and entities have only an association 
relationship to struct drm_sched_entity_stats. The only caller for this 
is even in sched_main.c while other updates are done in and from sched_rq.c.

So if pragmatic approach is not acceptable I would even rather create a 
new file along the lines of sched_entity_stats.h|c. Unless that turns 
out would have some other design wart of leaking knowledge of some other 
part of the scheduler (ie wouldn't be fully standalone).

>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index f825ad9e2260..4c10c7ba6704 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -660,6 +660,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>   
>>   	job->sched = sched;
>>   	job->s_priority = entity->priority;
>> +	job->entity_stats = drm_sched_entity_stats_get(entity->stats);
>>   
>>   	drm_sched_fence_init(job->s_fence, job->entity);
>>   }
>> @@ -849,6 +850,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>>   		 * been called.
>>   		 */
>>   		dma_fence_put(&job->s_fence->finished);
>> +		drm_sched_entity_stats_put(job->entity_stats);
>>   	} else {
>>   		/* The job was aborted before it has been committed to be run;
>>   		 * notably, drm_sched_job_arm() has not been called.
>> @@ -1000,8 +1002,10 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>   		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>   	struct drm_sched_job *job;
>>   
>> -	while ((job = drm_sched_get_finished_job(sched)))
>> +	while ((job = drm_sched_get_finished_job(sched))) {
>> +		drm_sched_entity_stats_job_add_gpu_time(job);
> 
> Is it really always OK to update this value in the free job work? What if a new
> job gets scheduled concurrently. Doesn't this hurt accuracy, since the entity
> value has not been updated yet?

What exactly you mean by entity value?

If a new job gets scheduled concurrently then it is either just about to 
run, still running, both of which are not relevant for this finished 
job, and once finished will also end up here to have it's duration 
accounted against the stats.

Regards,

Tvrtko

> 
>>   		sched->ops->free_job(job);
>> +	}

