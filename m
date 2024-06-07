Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51F9004CF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF910EC3E;
	Fri,  7 Jun 2024 13:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="MOLvMqy0";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="ofnJ6foM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 422 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jun 2024 13:28:55 UTC
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0763210EC3E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1717766468;
 bh=Ba/eEeVkYmsIqQFDAo+adSt
 JVhiHjUXDGvT4kFlbY6E=; b=MOLvMqy0jjqLw/ED4ivxLKfXj+eUuk8m4Whon4zuXn3nEv4Pu+
 ScHSSgRnTnkWCzNJ+Eai8WHlWlogbWBUQDtOvdtOx2HLi6+933jOFGfbVNwVWHj8s+jmj7vXxpl
 xNjDVhkDbpat2UWpqBAOHPfKiUlVKdrATdvFicsbC0MZep5FHIYaAjVFlNgwAJ5OhW+/IgUiKTM
 5oPgWtcoKQ2vBmsi1mBL4z/wI5fsSjKrjO9/gK5uCY2r4A5UipJF3qwIzIDaED4hsFs/VwL7fG/
 WKOZOlnYm1pKqC8r/tQFLyV42LlLsxnkwrE0goGdMpxGPKm3hIcj6tjPFdxrdDLB8NA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1717766468; bh=Ba/eEeVkYmsIqQFDAo+adSt
 JVhiHjUXDGvT4kFlbY6E=; b=ofnJ6foMG/9FPASlsv1MA1kecwfpA0jPgDZJCqgXag8R2uC6sG
 bE0q6lOhuW8NEzes+peJmNZNf6ECTZgUsICA==;
Message-ID: <ab28d219-d3e1-4e46-b986-9c8ed9f5ec17@damsy.net>
Date: Fri, 7 Jun 2024 15:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/sched: cleanup gpu_scheduler trace events
To: Steven Rostedt <rostedt@goodmis.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-4-pierre-eric.pelloux-prayer@amd.com>
 <20240606091929.6be2f8c2@gandalf.local.home>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20240606091929.6be2f8c2@gandalf.local.home>
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

Hi,

Le 06/06/2024 à 15:19, Steven Rostedt a écrit :
> On Thu, 6 Jun 2024 15:06:24 +0200
> Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
> 
>> Print identifiers instead of pointers:
>> * "fence=%p" is replaced by "fence=(context:%llu, seqno:%lld)" to have a
>> coherent way to print the fence. A possible follow up change would be
>> to use the same format in traces/../dma-fence.h.
>> * "entity=%p" is removed because the fence's context is already an
>> identifier of the job owner.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 27 ++++++++++---------
>>   1 file changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 0a19c121bda5..2d7f2252eb5d 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -58,9 +58,9 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   				   &sched_job->sched->credit_count);
>>   			   __entry->dev_index = sched_job->sched->dev->primary->index;
>>   			   ),
>> -	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -		      __entry->entity, __entry->id,
>> -		      __entry->fence, __get_str(name),
>> +	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +		      __entry->id,
>> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
>>   );
>>   
>> @@ -72,9 +72,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>>   DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>>   	    TP_ARGS(sched_job, entity),
>> -	    TP_printk("dev_index=%d entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -		      __entry->dev_index, __entry->entity, __entry->id,
>> -		      __entry->fence, __get_str(name),
>> +	    TP_printk("dev_index=%d id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +		      __entry->dev_index, __entry->id,
>> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
> 
> NACK!
> 
> You can't dereference pointers from TP_printk(). This is called seconds,
> minutes, hours, even days or months after that pointer was assigned. How do
> you know that pointer still points to anything?

Now that you pointed it out, the problem is obvious indeed.
I have fixed it locally.

Thanks!
Pierre-Eric

> 
> -- Steve
> 
> 
>>   );
>>   
>> @@ -88,7 +88,8 @@ TRACE_EVENT(drm_sched_process_job,
>>   	    TP_fast_assign(
>>   		    __entry->fence = &fence->finished;
>>   		    ),
>> -	    TP_printk("fence=%p signaled", __entry->fence)
>> +	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
>> +		      __entry->fence->context, __entry->fence->seqno)
>>   );
>>   
>>   TRACE_EVENT(drm_sched_job_wait_dep,
>> @@ -96,23 +97,25 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>>   	    TP_ARGS(sched_job, fence),
>>   	    TP_STRUCT__entry(
>>   			     __string(name, sched_job->sched->name)
>> +			     __field(uint64_t, fence_context)
>>   			     __field(uint64_t, id)
>>   			     __field(struct dma_fence *, fence)
>>   			     __field(uint64_t, ctx)
>> -			     __field(unsigned, seqno)
>> +			     __field(uint64_t, seqno)
>>   			     ),
>>   
>>   	    TP_fast_assign(
>>   			   __assign_str(name);
>> +			   /* Store the hw exec fence context. */
>> +			   __entry->fence_context = sched_job->entity->fence_context + 1;
>>   			   __entry->id = sched_job->id;
>>   			   __entry->fence = fence;
>>   			   __entry->ctx = fence->context;
>>   			   __entry->seqno = fence->seqno;
>>   			   ),
>> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
>> -		      __get_str(name), __entry->id,
>> -		      __entry->fence, __entry->ctx,
>> -		      __entry->seqno)
>> +	    TP_printk("job ring=%s, fence_context=%llu, id=%llu, depends fence=(context:%llu, seqno:%lld)",
>> +		      __get_str(name), __entry->fence_context, __entry->id,
>> +		      __entry->ctx, __entry->seqno)
>>   );
>>   
>>   #endif
