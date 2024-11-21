Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544769D4FBB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B61C10E993;
	Thu, 21 Nov 2024 15:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="DS1l8qq7";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="TcKE0Chm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735110E993
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732202797;
 bh=/9QJP1c08pfiZcm5qlr8nAP
 6MZHi8wsZ2+bJPFgwEMI=; b=DS1l8qq7rhzGEtpyI2GlDB2xMxR6Cx6iNusDb4oi81xNCfkpgl
 YlcJfI+2D1kj7+p0FXizjUclux8z3GkTawHsMWGkxDWdRxJ4Bo2nnkXVzGbwCkdzr9iXwaE1Dcw
 G+iXr+bCWDKH4EGVvXfoQyXcoQyaOpBqEAx78WAz19x9+Y1JTG85IzGCFxkvz9nyfv7fsqS0kT4
 Ea+I4sObnlCcE2ueua6vAzz6IVRYrQ23R5kQw5w/m7R+qo0kcjPXc0xBwXmBQThcTuSTG/Be22/
 PEx6HTzRSvEVN4dPWsf2rpUrpmb5O+eVUoroOqCgOpC/8HNcWa0qszS7c/+WY5FWuCQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732202797; bh=/9QJP1c08pfiZcm5qlr8nAP
 6MZHi8wsZ2+bJPFgwEMI=; b=TcKE0ChmjSnf66iTSjM0Wx3NqltY4in4XpI0Hipl+U9vx2BRl1
 IXDHNeVKbuItRi2m8gTY+fop/mUvuKkpvHBQ==;
Message-ID: <93ed172d-2378-4ee1-8d72-f83e48c81a7a@damsy.net>
Date: Thu, 21 Nov 2024 16:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/sched: add device name to the
 drm_sched_process_job event
To: Philipp Stanner <pstanner@redhat.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com, mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com, tvrtko.ursulin@igalia.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-4-pierre-eric.pelloux-prayer@amd.com>
 <b7d5b17497a7e54f0d966f3e72408f2a8dcd0811.camel@redhat.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <b7d5b17497a7e54f0d966f3e72408f2a8dcd0811.camel@redhat.com>
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

Hi Philipp,

Le 15/11/2024 à 16:03, Philipp Stanner a écrit :
> On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> Until the switch from kthread to workqueue,
> 
> Could you include the commit ID here where that happened?
> 
> "Since switching the scheduler from using kthreads to workqueues in
> commit 1234 ("foo: bar") userspace applications cannot determine the
> [...] anymore"

Sure.

> 
> 
>>   a userspace application could
>> determine the source device
> 
> source device of *what*? Should be mentioned.

source device _of the event_.

> 
>>   from the pid of the thread sending the event.
> 
> nit: s/pid/PID ?

I'll update the commit message in the next version.

Thanks,
Pierre-Eric

> 
>>
>> With workqueues this is not possible anymore, so the event needs to
>> contain
>> the dev_name() to identify the device.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index c75302ca3427..c4ec28540656 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			     __field(uint64_t, id)
>>   			     __field(u32, job_count)
>>   			     __field(int, hw_job_count)
>> +			     __string(dev, dev_name(sched_job-
>>> sched->dev))
>>   			     ),
>>   
>>   	    TP_fast_assign(
>> @@ -52,9 +53,10 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   			   __entry->job_count =
>> spsc_queue_count(&entity->job_queue);
>>   			   __entry->hw_job_count = atomic_read(
>>   				   &sched_job->sched->credit_count);
>> +			   __assign_str(dev);
>>   			   ),
>> -	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job
>> count:%u, hw job count:%d",
>> -		      __entry->entity, __entry->id,
>> +	    TP_printk("dev=%s, entity=%p, id=%llu, fence=%p,
>> ring=%s, job count:%u, hw job count:%d",
>> +		      __get_str(dev), __entry->entity, __entry->id,
>>   		      __entry->fence, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
>>   );
