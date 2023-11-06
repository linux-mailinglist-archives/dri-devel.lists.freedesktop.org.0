Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2ED7E2276
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 13:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489E410E300;
	Mon,  6 Nov 2023 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D04C10E300;
 Mon,  6 Nov 2023 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699275280; x=1730811280;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aDMaAf3Qk4AiVc+NRXtUAPTpwxXPa8q7hQ12M51a4MQ=;
 b=F0xqWUCTUM2cdv8kUjzuGe0YcF5s4s7stkcEIf8DEHjwNwSuUuXSaO+5
 IIKm0ls8OwYroeQiHLJ+ySsf4htiaa94jr31H0Mn6IH+KxFmgNW+olxXq
 mNGwbd4k0msVp0mOc0ARNuwAMXwonxNi2lh3ADQwOxE6R6l3RY4+wRFt1
 AFtyFlpCkzH6nXcgoWy1mIC8I7yAwWFzHxh3cmugcLQu6tE3GJzZ2sPrg
 ob68ZRbzShDpXnA7BjaJY5Qu7IUKYoRddmFJsGBzEDbQpynj3cjpHsQ6+
 eUoCjngI/YxDjTDvxLRFidGmpJL6V1DR+2O/e4UFM3OhIwyJcMe+qNz/5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369472704"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="369472704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 04:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762309308"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="762309308"
Received: from ajayshan-mobl.ger.corp.intel.com (HELO [10.213.234.152])
 ([10.213.234.152])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 04:54:36 -0800
Message-ID: <78cb5030-fbad-4845-b2be-1c5a1a1717fd@linux.intel.com>
Date: Mon, 6 Nov 2023 12:54:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Eliminate drm_sched_run_job_queue_if_ready()
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>
References: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
 <20231102224653.5785-2-ltuikov89@gmail.com>
 <d2bf144f-e388-4cb1-bc18-12efad4f677b@linux.intel.com>
 <8e1d65c7-26a1-4f72-a51e-781dbd17c29c@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8e1d65c7-26a1-4f72-a51e-781dbd17c29c@gmail.com>
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
Cc: matthew.brost@intel.com, robdclark@chromium.org, sarah.walker@imgtec.com,
 ltuikov@yahoo.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2023 00:25, Luben Tuikov wrote:
> Hi Tvrtko,
> 
> On 2023-11-03 06:39, Tvrtko Ursulin wrote:
>>
>> On 02/11/2023 22:46, Luben Tuikov wrote:
>>> Eliminate drm_sched_run_job_queue_if_ready() and instead just call
>>> drm_sched_run_job_queue() in drm_sched_free_job_work(). The problem is that
>>> the former function uses drm_sched_select_entity() to determine if the
>>> scheduler had an entity ready in one of its run-queues, and in the case of the
>>> Round-Robin (RR) scheduling, the function drm_sched_rq_select_entity_rr() does
>>> just that, selects the _next_ entity which is ready, sets up the run-queue and
>>> completion and returns that entity. The FIFO scheduling algorithm is unaffected.
>>>
>>> Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
>>> in the case of RR scheduling, that would result in calling select_entity()
>>> twice, which may result in skipping a ready entity if more than one entity is
>>> ready. This commit fixes this by eliminating the if_ready() variant.
>>
>> Fixes: is missing since the regression already landed.
> 
> Ah, yes, thank you for pointing that out. :-)
> I'll add one.
> 
>>
>>>
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 14 ++------------
>>>    1 file changed, 2 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 98b2ad54fc7071..05816e7cae8c8b 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>    
>>> -/**
>>> - * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
>>> - * @sched: scheduler instance
>>> - */
>>> -static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>> -{
>>> -	if (drm_sched_select_entity(sched))
>>> -		drm_sched_run_job_queue(sched);
>>> -}
>>> -
>>>    /**
>>>     * drm_sched_free_job_work - worker to call free_job
>>>     *
>>> @@ -1069,7 +1059,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
>>>    		sched->ops->free_job(cleanup_job);
>>>    
>>>    		drm_sched_free_job_queue_if_done(sched);
>>> -		drm_sched_run_job_queue_if_ready(sched);
>>> +		drm_sched_run_job_queue(sched);
>>
>> It works but is a bit wasteful causing needless CPU wake ups with a
> 
> I'd not worry about "waking up the CPU" as the CPU scheduler would most likely
> put the wq on the same CPU by instruction cache locality.
> 
>> potentially empty queue, both here and in drm_sched_run_job_work below.
> 
> That's true, but if you were to look at the typical execution of
> this code you'd see we get a string of function entry when the incoming queue
> is non-empty, followed by one empty entry only to be taken off the CPU. So,
> it really isn't a breaker.
> 
> So, there's a way to mitigate this in drm_sched_run_job_work(). I'll see that it
> makes it in the next version of the patch.

Okay, I will be keeping an eye on that.

Separately, I might send a patch to do the "re-queue if more pending" in 
one atomic section. (Instead of re-acquiring the lock.)

And also as a heads up, at some point in the next few months I will 
start looking at the latency and power effects of the "do just one and 
re-queue" conversion. In ChromeOS milli-Watts matter and some things 
like media playback do have a lot of inter-engine dependencies. So 
keeping the CPU C state residency low might matter. Well, it might 
matter for server media transcode stream density workloads too, both 
from power and stream capacity per socket metrics.

Regards,

Tvrtko
