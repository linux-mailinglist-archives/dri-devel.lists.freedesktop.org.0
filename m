Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311709D4FCD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F31510E99F;
	Thu, 21 Nov 2024 15:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="TplCxSaW";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="ui+NnSFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C709D10E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203092;
 bh=b35+Tqk/0+LAI89gkgauf0k
 czfJUlf5h83CdFoeLqDs=; b=TplCxSaWmyJxO1zPPhUnS/plC8tf+PHEaQT977VvSpyUKLvp9U
 xY3iP6SEgT/WJKAyoG2s+0wQ2NzOkGWdln+9AIrlC+tTQd5UF6OCXpSOxu8LXfED19hUG+BKzq2
 nGYLn0nx4YTB5+ljXwFhv259GDdrAw3NH9lSVhf4SJVmft6IvKgBa2XY5dBggDCVoNY3i+eGIkm
 GVTtBxE5kIKd7kV35ofAwLXirq9Il8/fBtTFwh2E4+fczydngLFBamvXqvajO8SIMX7QehxIIQq
 rnO0p+AiHnMVXZ7+ThtVQBumKgKRfPEAPAobOyKZvC5pzzWbuFM26XppYs2q6BWmbTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203092; bh=b35+Tqk/0+LAI89gkgauf0k
 czfJUlf5h83CdFoeLqDs=; b=ui+NnSFRTMglA41FK2l2kKGWhuGVca2ud21GGcA5B9qSIzcgru
 lzvzhdGGtfAFKxf2AcQWQdWmgLas/nRzy1Bw==;
Message-ID: <d9d37448-0bf8-4b88-8c4c-a2ae78454314@damsy.net>
Date: Thu, 21 Nov 2024 16:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] drm/sched: cleanup gpu_scheduler trace events
To: Steven Rostedt <rostedt@goodmis.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 l.stach@pengutronix.de, matt.coster@imgtec.com, frank.binns@imgtec.com,
 yuq825@gmail.com, robdclark@gmail.com, kherbst@redhat.com, lyude@redhat.com,
 boris.brezillon@collabora.com, steven.price@arm.com, mwen@igalia.com,
 mcanal@igalia.com, thomas.hellstrom@linux.intel.com,
 tvrtko.ursulin@igalia.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-5-pierre-eric.pelloux-prayer@amd.com>
 <20241114095611.03b3fb8b@gandalf.local.home>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20241114095611.03b3fb8b@gandalf.local.home>
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



Le 14/11/2024 à 15:56, Steven Rostedt a écrit :
> On Thu, 14 Nov 2024 11:01:07 +0100
> Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
> 
>> A fence uniquely identify a job, so this commits updates the places
>> where a kernel pointer was used as an identifier by:
>>
>>     "fence=(context:%llu, seqno:%lld)"
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 39 +++++++++++--------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index c4ec28540656..24358c4d5bbe 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -36,28 +36,29 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>>   	    TP_ARGS(sched_job, entity),
>>   	    TP_STRUCT__entry(
>> -			     __field(struct drm_sched_entity *, entity)
>> -			     __field(struct dma_fence *, fence)
>>   			     __string(name, sched_job->sched->name)
> 
> The __string() is a 4 byte meta field in the trace event structure. This
> means if you have a 64bit (8 byte) field following it, there will likely be
> a 4 byte hole between the two fields.
> 
> I would suggest swapping the name field with the id field, then you will
> have four 4 byte fields in a row (name, job_count, hw_job_count, dev),
> which should fill all the holes.

Good point, I'll swap them and check there's no hole.

Pierre-Eric

> 
> -- Steve
> 
> 
>>   			     __field(uint64_t, id)
>>   			     __field(u32, job_count)
>>   			     __field(int, hw_job_count)
>>   			     __string(dev, dev_name(sched_job->sched->dev))
>> +			     __field(uint64_t, fence_context)
>> +			     __field(uint64_t, fence_seqno)
>>   			     ),
>>   
>>   	    TP_fast_assign(
>> -			   __entry->entity = entity;
>>   			   __entry->id = sched_job->id;
>> -			   __entry->fence = &sched_job->s_fence->finished;
>>   			   __assign_str(name);
>>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>>   			   __entry->hw_job_count = atomic_read(
>>   				   &sched_job->sched->credit_count);
>>   			   __assign_str(dev);
>> +			   __entry->fence_context = sched_job->s_fence->finished.context;
>> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>> +
>>   			   ),
>> -	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -		      __get_str(dev), __entry->entity, __entry->id,
>> -		      __entry->fence, __get_str(name),
>> +	    TP_printk("dev=%s, id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +		      __get_str(dev), __entry->id,
>> +		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
>>   );
>>
