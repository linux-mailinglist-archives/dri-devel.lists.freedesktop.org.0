Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7769260B7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778BF10E7D9;
	Wed,  3 Jul 2024 12:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="A87AfaT3";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="dkrbfJpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8510E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720010599;
 bh=SxuCnm3/kgBzTMSgDET5g9P
 B8H9cZFHQ6AGT4WgbFuM=; b=A87AfaT3hvBd1yoc5G319FqSChBLYo3ySr6jB/YJmyFrHdv7D/
 0yHLUrkJwiwGK3RIbjq6wdXghmKha9sFs6w/jkjEevFuLhHQJ6sbQL0Z+aQSabpBKD9cjTQ6V2l
 FnOWHkzq0VpWZOWDxlsVrqkNfdb7LMYzGcxzICxukvWU5vdMCoN7iifCaug7uFZ8eey68h7/6fO
 xiMHDz4AsN16ylQPl1nAWiiihO+cF+xtjP6cB4juMpZ6WrmzboFxB71Nh84UlmhOP56HoUAKb7+
 Nkzbe0RTnmVHDWgYHud+1m4Pk63azlrJ1t6EjMS0axBqhSVCrkz2foZscNmS19BV9HA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1720010599; bh=SxuCnm3/kgBzTMSgDET5g9P
 B8H9cZFHQ6AGT4WgbFuM=; b=dkrbfJpBunyDleQjTNL34gRpVmZYP6WNc2KVmllg6uKI1gZ+Ca
 5PfTKT0evIeJrOmFpqj3txYbpF45qhEkTXDA==;
Message-ID: <76485a0b-e11d-4c35-b0a5-5268b196d3e8@damsy.net>
Date: Wed, 3 Jul 2024 14:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/sched: trace dependencies for gpu jobs
To: Lucas Stach <l.stach@pengutronix.de>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-4-pierre-eric.pelloux-prayer@amd.com>
 <16fdbb7214ac409fd447575daf8d2c8ee2fbf02e.camel@pengutronix.de>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <16fdbb7214ac409fd447575daf8d2c8ee2fbf02e.camel@pengutronix.de>
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



Le 03/07/2024 à 13:05, Lucas Stach a écrit :
> Am Freitag, dem 14.06.2024 um 10:16 +0200 schrieb Pierre-Eric Pelloux-
> Prayer:
>> Trace the fence dependencies similarly to how we print fences:
>>
>>   ... , dependencies:{(context:606, seqno:38006)}
>>
>> This allows tools to analyze the dependencies between the jobs (previously
>> it was only possible for fences traced by drm_sched_job_wait_dep).
>>
>> Since drm_sched_job and drm_run_job use the same base event class,
>> the caller of trace_drm_run_job have to pass a dep_count of 0 (which
>> is ignored because dependencies are only considered at submit time).
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 59 ++++++++++++++++---
>>   drivers/gpu/drm/scheduler/sched_entity.c      |  8 ++-
>>   drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
>>   3 files changed, 58 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index f6da377cdb99..0abcad26839c 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -26,15 +26,41 @@
>>   
>>   #include <linux/stringify.h>
>>   #include <linux/types.h>
>> +#include <linux/trace_seq.h>
>>   #include <linux/tracepoint.h>
>>   
>>   #undef TRACE_SYSTEM
>>   #define TRACE_SYSTEM gpu_scheduler
>>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>>   
>> +#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>> +#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
>> +/* Similar to trace_print_array_seq but for fences. */
>> +static inline const char *__print_dma_fence_array(struct trace_seq *p, const void *buf, int count)
>> +{
>> +	const char *ret = trace_seq_buffer_ptr(p);
>> +	u64 *fences = (u64 *) buf;
>> +	const char *prefix = "";
>> +
>> +	trace_seq_putc(p, '{');
>> +	for (int i = 0; i < count; i++) {
>> +		u64 context = fences[2 * i], seqno = fences[2 * i + 1];
>> +
>> +		trace_seq_printf(p, "%s(context:%llu, seqno:%lld)",
>> +				 prefix, context, seqno);
>> +		prefix = ",";
>> +	}
>> +	trace_seq_putc(p, '}');
>> +	trace_seq_putc(p, 0);
>> +
>> +	return ret;
>> +}
>> +#endif
>> +
>>   DECLARE_EVENT_CLASS(drm_sched_job,
>> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>> -	    TP_ARGS(sched_job, entity),
>> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
>> +		     unsigned int dep_count),
>> +	    TP_ARGS(sched_job, entity, dep_count),
>>   	    TP_STRUCT__entry(
>>   			     __string(name, sched_job->sched->name)
>>   			     __field(uint64_t, id)
>> @@ -43,9 +69,14 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			     __string(dev, dev_name(sched_job->sched->dev))
>>   			     __field(uint64_t, fence_context)
>>   			     __field(uint64_t, fence_seqno)
>> +			     __field(int, n_deps)
>> +			     __dynamic_array(u64, deps, dep_count * 2)
>>   			     ),
>>   
>>   	    TP_fast_assign(
>> +			   unsigned long idx;
>> +			   struct dma_fence *fence;
>> +			   u64 *dyn_arr;
>>   			   __entry->id = sched_job->id;
>>   			   __assign_str(name);
>>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>> @@ -54,22 +85,32 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			   __assign_str(dev);
>>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>> -
>> +			   __entry->n_deps = dep_count;
>> +			   if (dep_count) {
>> +				dyn_arr = __get_dynamic_array(deps);
>> +				xa_for_each(&sched_job->dependencies, idx, fence) {
>> +					dyn_arr[2 * idx] = fence->context;
>> +					dyn_arr[2 * idx + 1] = fence->seqno;
>> +				}
>> +			   }
>>   			   ),
>> -	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d, dependencies:%s",
>>   		      __entry->id,
>>   		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>> -		      __entry->job_count, __entry->hw_job_count)
>> +		      __entry->job_count, __entry->hw_job_count,
>> +		      __print_dma_fence_array(p, __get_dynamic_array(deps), __entry->n_deps))
>>   );
>>   
>>   DEFINE_EVENT(drm_sched_job, drm_sched_job,
>> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>> -	    TP_ARGS(sched_job, entity)
>> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
>> +		     unsigned int dep_count),
>> +	    TP_ARGS(sched_job, entity, dep_count)
>>   );
>>   
>>   DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>> -	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>> -	    TP_ARGS(sched_job, entity),
>> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity,
>> +		     unsigned int dep_count),
>> +	    TP_ARGS(sched_job, entity, 0),
>>   	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>>   		      __get_str(dev), __entry->id,
>>   		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 58c8161289fe..aa33a9d29b14 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -583,7 +583,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   	bool first;
>>   	ktime_t submit_ts;
>>   
>> -	trace_drm_sched_job(sched_job, entity);
>> +	if (trace_drm_sched_job_enabled()) {
>> +		unsigned long index;
>> +		void *f;
>> +
>> +		xa_for_each(&sched_job->dependencies, index, f) { }
> 
> I did need to do a double take on that one. While using index for the
> total number of dependencies is correct for the dense and at this point
> in time fully populated dependencies array, it is a bit non-obvious.
> Maybe add a small comment here or have an actual counter in the loop
> body?

Makes sense. I'll add a counter in v6.

thanks,
Pierre-Eric

> 
> Regards,
> Lucas
> 
>> +		trace_drm_sched_job(sched_job, entity, index);
>> +	}
>>   	atomic_inc(entity->rq->sched->score);
>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 7e90c9f95611..0bc9b7b24b34 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1201,7 +1201,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>   	atomic_add(sched_job->credits, &sched->credit_count);
>>   	drm_sched_job_begin(sched_job);
>>   
>> -	trace_drm_run_job(sched_job, entity);
>> +	trace_drm_run_job(sched_job, entity, 0);
>>   	fence = sched->ops->run_job(sched_job);
>>   	complete_all(&entity->entity_idle);
>>   	drm_sched_fence_scheduled(s_fence, fence);
