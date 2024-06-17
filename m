Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3290AE5F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB8210E03C;
	Mon, 17 Jun 2024 12:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="hq0IUrVy";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="QHrKfIVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bunu.damsy.net (bunu.damsy.net [51.159.160.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C4410E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202404r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1718629003;
 bh=3s7zwxBPAkmXfXrTD80bKQg
 sJYaWxAZFdFUStvNAxiI=; b=hq0IUrVynDvGamijD/fpZJNfymCTT0s7nmmZqB90FNgtCMKatM
 n/DXmPnXALDjadc+VrZ+JhARQjoNKv6vvwqWWrYm2VO77RWjIaK+ktH0c2cwDUrx39ZJ3Lu19Bb
 lhfWoeQDAPXuDpa1JwC/JKbZ0VyupqRVwVGKh0kXiJayvfAlfn2Pcz7LyppkEdIYPUmI22Sm/cZ
 3SsImY0CTEP/J+aHTcW1Pnvh0BqsdrbPoY0aU8/ZafRn8ESM27LByDfEmhTUrAg4iUepqeMEqX7
 Nu6JlFBAIewv/elSMyBJ4pObX5NWFYWd8OZCUBEhvkvehcv5xzhOQdvO78GdY6+2A/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202404e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1718629003; bh=3s7zwxBPAkmXfXrTD80bKQg
 sJYaWxAZFdFUStvNAxiI=; b=QHrKfIVF8Kxt6w4WeOJnu0JphnYCzg05OLavcO+pj1ib3euBpE
 sFSO3OyV1aCThMKs9+e051LKS7aqNMX+u9BA==;
Message-ID: <739805b6-f321-40bb-95d6-29c45f145b24@damsy.net>
Date: Mon, 17 Jun 2024 14:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/sched: add device name to the
 drm_sched_process_job event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-2-pierre-eric.pelloux-prayer@amd.com>
 <c30b3543-7358-483d-bb4b-d76651943fbc@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <c30b3543-7358-483d-bb4b-d76651943fbc@amd.com>
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

Le 14/06/2024 à 11:08, Christian König a écrit :
> 
> 
> Am 14.06.24 um 10:16 schrieb Pierre-Eric Pelloux-Prayer:
>> Until the switch from kthread to workqueue, a userspace application could
>> determine the source device from the pid of the thread sending the event.
>>
>> With workqueues this is not possible anymore, so the event needs to 
>> contain
>> the dev_name() to identify the device.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h 
>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index c75302ca3427..1f9c5a884487 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>                    __field(uint64_t, id)
>>                    __field(u32, job_count)
>>                    __field(int, hw_job_count)
>> +                 __string(dev, dev_name(sched_job->sched->dev))
>>                    ),
>>           TP_fast_assign(
>> @@ -52,6 +53,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>                  __entry->job_count = 
>> spsc_queue_count(&entity->job_queue);
>>                  __entry->hw_job_count = atomic_read(
>>                      &sched_job->sched->credit_count);
>> +               __assign_str(dev);
>>                  ),
>>           TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job 
>> count:%u, hw job count:%d",
>>                 __entry->entity, __entry->id,
>> @@ -64,9 +66,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>>           TP_ARGS(sched_job, entity)
>>   );
>> -DEFINE_EVENT(drm_sched_job, drm_run_job,
>> +DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>>           TP_PROTO(struct drm_sched_job *sched_job, struct 
>> drm_sched_entity *entity),
>> -        TP_ARGS(sched_job, entity)
>> +        TP_ARGS(sched_job, entity),
>> +        TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job 
>> count:%u, hw job count:%d",
>> +              __get_str(dev), __entry->entity, __entry->id,
>> +              __entry->fence, __get_str(name),
>> +              __entry->job_count, __entry->hw_job_count)
> 
> Why not doing that in the TP_printk() of the drm_sched_job event class?
> 

I didn't because drm_sched_job + drm_run_job usually work in pair so the 
ring+device information will be available anyway.

But maybe you're right and it's better to add it in the event the job 
never gets scheduled.

For the other events it's not necessary IMO: the first event will always 
be drm_sched_job, so it's possible to figure out which the device/ring 
for a given job.

Regards,
Pierre-eric

> The device should now be available for all trace events of that class.
> 
> Regards,
> Christian.
> 
>>   );
>>   TRACE_EVENT(drm_sched_process_job,
