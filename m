Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F9BD94F1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4310E5DA;
	Tue, 14 Oct 2025 12:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qatrWjrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41C810E220;
 Tue, 14 Oct 2025 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y7fs6WPlC2Db2BoKi7GDFxPOB1XeSHG+QnsVBtco4P0=; b=qatrWjrm1EuOU5sjNy/uCYKjau
 hGtbj/PuK/Zc+VSYNXeUoi4FdlLWNP3n8xF3iYlOagq60BwTaGOZONF3kiuSIzAJkUDI93qSj3E4T
 1t10qKebQaNjeT9zIGedTSKpYSg1mWTJeiQoKqBHUcqVD854h3NqfEHo6WmgZIDrNA4gQJLMc4Z/R
 5OxOxlaPWPv4EzQ/ZAagGUmwmqrVide5ER+RJltm/QWt8y6QQ34hjp7Sxr2wbRQn0hEAvzAUkv5b2
 Bmj9fyYt0+6YcSD8ra8B1aYEVpT1d4UkUYDMSkd5Vvgf9hJp0Mnktt+3FbDlmu6EXZnvYR4lQ3kiL
 LKFVNbEQ==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v8e19-009OYP-6x; Tue, 14 Oct 2025 14:20:39 +0200
Message-ID: <7598e978-4ac3-4568-a339-0397e7273222@igalia.com>
Date: Tue, 14 Oct 2025 13:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/28] drm/sched: Favour interactive clients slightly
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-12-tvrtko.ursulin@igalia.com>
 <618a50aabddace2531375bc18fb1ca9b00297490.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <618a50aabddace2531375bc18fb1ca9b00297490.camel@mailbox.org>
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


On 14/10/2025 11:53, Philipp Stanner wrote:
> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>> GPUs do not always implement preemption and DRM scheduler definitely
>> does not support it at the front end scheduling level. This means
>> execution quanta can be quite long and is controlled by userspace,
>> consequence of which is picking the "wrong" entity to run can have a
>> larger negative effect than it would have with a virtual runtime based CPU
>> scheduler.
>>
>> Another important consideration is that rendering clients often have
>> shallow submission queues, meaning they will be entering and exiting the
>> scheduler's runnable queue often.
>>
>> Relevant scenario here is what happens when an entity re-joins the
>> runnable queue with other entities already present. One cornerstone of the
>> virtual runtime algorithm is to let it re-join at the head and rely on the
>> virtual runtime accounting and timeslicing to sort it out.
>>
>> However, as explained above, this may not work perfectly in the GPU world.
>> Entity could always get to overtake the existing entities, or not,
>> depending on the submission order and rbtree equal key insertion
>> behaviour.
>>
>> Allow interactive jobs to overtake entities already queued up for the
>> limited case when interactive entity is re-joining the queue after
>> being idle.
>>
>> This gives more opportunity for the compositors to have their rendering
>> executed before the GPU hogs even if they have been configured with the
>> same scheduling priority.
>>
>> To classify a client as interactive we look at its average job duration
>> versus the average for the whole scheduler. We can track this easily by
>> plugging into the existing job runtime tracking and applying the
>> exponential moving average window on the past submissions. Then, all other
>> things being equal, we let the more interactive jobs go first.
> 
> OK so this patch is new. Why was it added? The cover letter says:
> 
> "Improved handling of interactive clients by replacing the random noise
> on tie approach with the average job duration statistics."
> 
> So this is based on additional research you have done in the mean time?
> Does it change behavior significantly when compared to the RFC?

It is a replacement patch for what used to be called "drm/sched: Break 
submission patterns with some randomness".

It is only significant for a subset of workload patterns. The ones where 
a lightweight client runs in parallel to something heavy. Pseudo random 
noise approach made FAIR kind of middle of the road between RR and FIFO 
while this version makes it almost as good as RR.

With random noise as tie breaker criteria:

https://people.igalia.com/tursulin/drm-sched-fair/4-heavy-vs-interactive.png
https://people.igalia.com/tursulin/drm-sched-fair/4-very-heavy-vs-interactive.png
https://people.igalia.com/tursulin/drm-sched-fair/4-low-hog-vs-interactive.png

With entity_job_avg < sched_job_avg tie breaker criteria:

https://people.igalia.com/tursulin/drm-sched-fair/251008/4-heavy-vs-interactive.png
https://people.igalia.com/tursulin/drm-sched-fair/251008/4-very-heavy-vs-interactive.png
https://people.igalia.com/tursulin/drm-sched-fair/251008/4-low-hog-vs-interactive.png

> The firmware scheduler bros are not affected in any case. Still, I
> think that the RFC we discussed in the past and at XDC is now quite
> more different from the actual proposal in this v1.

Series as code is not that much different, just the end result with some 
use cases gets better.

If we ignore the EWMA job runtime housekeeping, it only replaced this:

+		} else {
+			static const int shuffle[2] = { -1, 1 };
+			static bool r = 0;
+
+			/*
+			 * For equal priority apply some randomness to break
+			 * latching caused by submission patterns.
+			 */
+			vruntime = shuffle[r];
+			r ^= 1;

With this:

+		} else {
+			struct drm_gpu_scheduler *sched = entity->rq->sched;
+
+			/*
+			 * Favour entity with shorter jobs (interactivity).
+			 *
+			 * (Unlocked read is fine since it is just heuristics.)
+			 *
+			 */
+			if (ewma_drm_sched_avgtime_read(&stats->avg_job_us) <=
+			    ewma_drm_sched_avgtime_read(&sched->avg_job_us))
+				vruntime = -1;
+			else
+				vruntime = 1;
> I suppose it's in general good for graphics applications.. what about
> compute, doesn't that have longer jobs? Probably still good for people
> who do compute on their productive system..
Yes, should be good for everyone who runs interactive clients in 
parallel to demanding workloads.

> @AMD:
> can you review / ack this?
Someone other than me is bound to test it one od these days. ;)

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c   |  1 +
>>   drivers/gpu/drm/scheduler/sched_internal.h | 15 ++++++++++++---
>>   drivers/gpu/drm/scheduler/sched_main.c     |  8 +++++++-
>>   drivers/gpu/drm/scheduler/sched_rq.c       | 14 ++++++++++++++
>>   include/drm/gpu_scheduler.h                |  5 +++++
>>   5 files changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 58f51875547a..1715e1caec40 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -61,6 +61,7 @@ static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)
>>   
>>   	kref_init(&stats->kref);
>>   	spin_lock_init(&stats->lock);
>> +	ewma_drm_sched_avgtime_init(&stats->avg_job_us);
>>   
>>   	return stats;
>>   }
>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>> index c94e38acc6f2..a120efc5d763 100644
>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>> @@ -20,6 +20,7 @@
>>    * @runtime: time entity spent on the GPU.
>>    * @prev_runtime: previous @runtime used to get the runtime delta
>>    * @vruntime: virtual runtime as accumulated by the fair algorithm
>> + * @avg_job_us: average job duration
>>    */
>>   struct drm_sched_entity_stats {
>>   	struct kref	kref;
>> @@ -27,6 +28,8 @@ struct drm_sched_entity_stats {
>>   	ktime_t		runtime;
>>   	ktime_t		prev_runtime;
>>   	u64		vruntime;
>> +
>> +	struct ewma_drm_sched_avgtime   avg_job_us;
>>   };
>>   
>>   /* Used to choose between FIFO and RR job-scheduling */
>> @@ -153,20 +156,26 @@ drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
>>    * @job: Scheduler job to account.
>>    *
>>    * Accounts the execution time of @job to its respective entity stats object.
>> + *
>> + * Returns job's real duration in micro seconds.
>>    */
>> -static inline void
>> +static inline ktime_t
>>   drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>>   {
>>   	struct drm_sched_entity_stats *stats = job->entity_stats;
>>   	struct drm_sched_fence *s_fence = job->s_fence;
>> -	ktime_t start, end;
>> +	ktime_t start, end, duration;
>>   
>>   	start = dma_fence_timestamp(&s_fence->scheduled);
>>   	end = dma_fence_timestamp(&s_fence->finished);
>> +	duration = ktime_sub(end, start);
>>   
>>   	spin_lock(&stats->lock);
>> -	stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
>> +	stats->runtime = ktime_add(stats->runtime, duration);
>> +	ewma_drm_sched_avgtime_add(&stats->avg_job_us, ktime_to_us(duration));
>>   	spin_unlock(&stats->lock);
>> +
>> +	return duration;
>>   }
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 8d8f9c8411f5..204d99c6699f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1000,7 +1000,12 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>   	struct drm_sched_job *job;
>>   
>>   	while ((job = drm_sched_get_finished_job(sched))) {
>> -		drm_sched_entity_stats_job_add_gpu_time(job);
>> +		ktime_t duration = drm_sched_entity_stats_job_add_gpu_time(job);
>> +
>> +		/* Serialized by the worker. */
>> +		ewma_drm_sched_avgtime_add(&sched->avg_job_us,
>> +					   ktime_to_us(duration));
>> +
>>   		sched->ops->free_job(job);
>>   	}
>>   
>> @@ -1158,6 +1163,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>   	atomic_set(&sched->_score, 0);
>>   	atomic64_set(&sched->job_id_count, 0);
>>   	sched->pause_submit = false;
>> +	ewma_drm_sched_avgtime_init(&sched->avg_job_us);
>>   
>>   	sched->ready = true;
>>   	return 0;
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>> index b868c794cc9d..02742869e75b 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -150,6 +150,20 @@ drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
>>   			 * Higher priority can go first.
>>   			 */
>>   			vruntime = -us_to_ktime(rq_prio - prio);
>> +		} else {
>> +			struct drm_gpu_scheduler *sched = entity->rq->sched;
>> +
>> +			/*
>> +			 * Favour entity with shorter jobs (interactivity).
>> +			 *
>> +			 * (Unlocked read is fine since it is just heuristics.)
>> +			 *
>> +			 */
>> +			if (ewma_drm_sched_avgtime_read(&stats->avg_job_us) <=
>> +			    ewma_drm_sched_avgtime_read(&sched->avg_job_us))
>> +				vruntime = -1;
>> +			else
>> +				vruntime = 1;
>>   		}
>>   	}
>>   
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index bc25508a6ff6..a7e407e04ce0 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -25,11 +25,14 @@
>>   #define _DRM_GPU_SCHEDULER_H_
>>   
>>   #include <drm/spsc_queue.h>
>> +#include <linux/average.h>
>>   #include <linux/dma-fence.h>
>>   #include <linux/completion.h>
>>   #include <linux/xarray.h>
>>   #include <linux/workqueue.h>
>>   
>> +DECLARE_EWMA(drm_sched_avgtime, 6, 4);
>> +
>>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>>   
>>   /**
>> @@ -581,6 +584,7 @@ struct drm_sched_backend_ops {
>>    * @job_id_count: used to assign unique id to the each job.
>>    * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>    * @timeout_wq: workqueue used to queue @work_tdr
>> + * @avg_job_us: Average job duration
>>    * @work_run_job: work which calls run_job op of each scheduler.
>>    * @work_free_job: work which calls free_job op of each scheduler.
>>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>> @@ -612,6 +616,7 @@ struct drm_gpu_scheduler {
>>   	atomic64_t			job_id_count;
>>   	struct workqueue_struct		*submit_wq;
>>   	struct workqueue_struct		*timeout_wq;
>> +	struct ewma_drm_sched_avgtime   avg_job_us;
>>   	struct work_struct		work_run_job;
>>   	struct work_struct		work_free_job;
>>   	struct delayed_work		work_tdr;
> 



