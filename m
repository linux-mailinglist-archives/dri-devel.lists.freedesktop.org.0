Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6977BD549
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05D10E22F;
	Mon,  9 Oct 2023 08:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4042A10E228;
 Mon,  9 Oct 2023 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696840541; x=1728376541;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LCMY8Sk66B6RCc/oSyqNTmyHhvGsBFkQAr+C1fbVwNk=;
 b=idMKeS4L/5UJ24zRqaPodcjgFHtD0HgiRKayWqcp4zalwdqZSD/OaP5B
 0osh7JdxbarcSlcqoYCyxjWJ1qtSZXR0Sf50j9rWseG/Wxwb3c7B9443u
 HaaRdqvSkmreqNnHQDjve2flFNlGaXmcqh1HJlfbHHeV8gYLsfRl8pN2x
 DfAwDlb+YpdMINSlLJkqnVBJJalMF0uo8hJYHbuIpV9y4bqBvBsxcR6SE
 QBRoKiQ73ECXsxebQvfVdQhlIpNWqHdoPdEqudQswadzzZ+cDQv8fZLyZ
 RlSOeUmJgNEGpBUU53sLjaGUAswJR0BaVVABZpjofl/7LmJ3r34llcevG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="448289424"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="448289424"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 01:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084258372"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="1084258372"
Received: from mquirke-mobl.ger.corp.intel.com (HELO [10.213.207.90])
 ([10.213.207.90])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 01:35:36 -0700
Message-ID: <40094bd4-e372-a9e2-3b2c-b6c0f26bf02e@linux.intel.com>
Date: Mon, 9 Oct 2023 09:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [PATCH v4 02/10] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
 <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
 <ZSCbt8piGPlkkqfP@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZSCbt8piGPlkkqfP@DUT025-TGLU.fm.intel.com>
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Luben Tuikov <luben.tuikov@amd.com>, dakr@redhat.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/10/2023 00:43, Matthew Brost wrote:
> On Fri, Oct 06, 2023 at 03:14:04PM +0000, Matthew Brost wrote:
>> On Fri, Oct 06, 2023 at 08:59:15AM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 05/10/2023 05:13, Luben Tuikov wrote:
>>>> On 2023-10-04 23:33, Matthew Brost wrote:
>>>>> On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2023-09-19 01:01, Matthew Brost wrote:
>>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>>
>>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>>> guaranteed to be the same completion even if targeting the same hardware
>>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>>
>>>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>>>>>> control on the ring for free.
>>>>>>>
>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>
>>>>>>> v2:
>>>>>>>     - (Rob Clark) Fix msm build
>>>>>>>     - Pass in run work queue
>>>>>>> v3:
>>>>>>>     - (Boris) don't have loop in worker
>>>>>>> v4:
>>>>>>>     - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>>>>> v5:
>>>>>>>     - (Boris) default to ordered work queue
>>>>>>>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>>>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>>>>>>>    drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>>>>>>>    drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>>>>>>>    drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>>>>>>>    drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>>>>>>>    drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>>>>>>>    drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>>>>>>>    include/drm/gpu_scheduler.h                |  14 ++-
>>>>>>>    9 files changed, 79 insertions(+), 75 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index e366f61c3aed..16f3cfe1574a 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>>>    			break;
>>>>>>>    		}
>>>>>>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>>>>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>>>>>>>    				   ring->num_hw_submission, 0,
>>>>>>>    				   timeout, adev->reset_domain->wq,
>>>>>>>    				   ring->sched_score, ring->name,
>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> index 345fec6cb1a4..618a804ddc34 100644
>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>>>>>    {
>>>>>>>    	int ret;
>>>>>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>>>>>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>>>>>>    			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>>>>>    			     msecs_to_jiffies(500), NULL, NULL,
>>>>>>>    			     dev_name(gpu->dev), gpu->dev);
>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> index ffd91a5ee299..8d858aed0e56 100644
>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>>>>>    	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>>>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>>>>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>>>>>>    			      lima_job_hang_limit,
>>>>>>>    			      msecs_to_jiffies(timeout), NULL,
>>>>>>>    			      NULL, name, pipe->ldev->dev);
>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> index 40c0bc35a44c..b8865e61b40f 100644
>>>>>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>>>>>    	 /* currently managing hangcheck ourselves: */
>>>>>>>    	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>>>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>>>>>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>>>>>>    			num_hw_submissions, 0, sched_timeout,
>>>>>>>    			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>>>>>
>>>>>> checkpatch.pl complains here about unmatched open parens.
>>>>>>
>>>>>
>>>>> Will fix and run checkpatch before posting next rev.
>>>>>
>>>>>>>    	if (ret) {
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> index 88217185e0f3..d458c2227d4f 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>>>>>    	if (!drm->sched_wq)
>>>>>>>    		return -ENOMEM;
>>>>>>> -	return drm_sched_init(sched, &nouveau_sched_ops,
>>>>>>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>>>>>>    			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>>>>>    			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>>>>>    }
>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> index 033f5e684707..326ca1ddf1d7 100644
>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>>>>>    		js->queue[j].fence_context = dma_fence_context_alloc(1);
>>>>>>>    		ret = drm_sched_init(&js->queue[j].sched,
>>>>>>> -				     &panfrost_sched_ops,
>>>>>>> +				     &panfrost_sched_ops, NULL,
>>>>>>>    				     nentries, 0,
>>>>>>>    				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>>>>    				     pfdev->reset.wq,
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index e4fa62abca41..ee6281942e36 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -48,7 +48,6 @@
>>>>>>>     * through the jobs entity pointer.
>>>>>>>     */
>>>>>>> -#include <linux/kthread.h>
>>>>>>>    #include <linux/wait.h>
>>>>>>>    #include <linux/sched.h>
>>>>>>>    #include <linux/completion.h>
>>>>>>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>    	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>>>>>>    }
>>>>>>> +/**
>>>>>>> + * drm_sched_submit_queue - scheduler queue submission
>>>>>>
>>>>>> There is no verb in the description, and is not clear what
>>>>>> this function does unless one reads the code. Given that this
>>>>>> is DOC, this should be clearer here. Something like "queue
>>>>>> scheduler work to be executed" or something to that effect.
>>>>>>
>>>>>
>>>>> Will fix.
>>>>>> Coming back to this from reading the patch below, it was somewhat
>>>>>> unclear what "drm_sched_submit_queue()" does, since when reading
>>>>>> below, "submit" was being read by my mind as an adjective, as opposed
>>>>>> to a verb. Perhaps something like:
>>>>>>
>>>>>> drm_sched_queue_submit(), or
>>>>>> drm_sched_queue_exec(), or
>>>>>> drm_sched_queue_push(), or something to that effect. You pick. :-)
>>>>>>
>>>>>
>>>>> I prefer the name as is. In this patch we have:
>>>>>
>>>>> drm_sched_submit_queue()
>>>>> drm_sched_submit_start)
>>>>> drm_sched_submit_stop()
>>>>> drm_sched_submit_ready()
>>>>>
>>>>> I like all these functions start with 'drm_sched_submit' which allows
>>>>> for easy searching for the functions that touch the DRM scheduler
>>>>> submission state.
>>>>>
>>>>> With a little better doc are you fine with the names as is.
>>>>
>>>> Notice the following scheme in the naming,
>>>>
>>>> drm_sched_submit_queue()
>>>> drm_sched_submit_start)
>>>> drm_sched_submit_stop()
>>>> drm_sched_submit_ready()
>>>> \---+---/ \--+-/ \-+-/
>>>>       |        |     +---> a verb
>>>>       |        +---------> should be a noun (something in the component)
>>>>       +------------------> the kernel/software component
>>>>
>>>> And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
>>>> like this:
>>>>
>>>> drm_sched_submit_enqueue()
>>>>
>>>> And using "submit" as the noun of the component is a bit cringy,
>>>> since "submit" is really a verb, and it's cringy to make it a "state"
>>>> or an "object" we operate on in the DRM Scheduler. "Submission" is
>>>> a noun, but "submission enqueue/start/stop/ready" doesn't sound
>>>> very well thought out. "Submission" really is what the work-queue
>>>> does.
>>>>
>>>> I'd rather it be a real object, like for instance,
>>>>
>>>> drm_sched_wqueue_enqueue()
>>>> drm_sched_wqueue_start)
>>>> drm_sched_wqueue_stop()
>>>> drm_sched_wqueue_ready()
>>>>
>>
>> How about:
>>
>> drm_sched_submission_enqueue()
>> drm_sched_submission_start)
>> drm_sched_submission_stop()
>> drm_sched_submission_ready()
>>
>> Matt
> 
> Ignore this, read Tvrtko commnt and not Luben's fully.
> 
> I prefer drm_sched_wqueue over drm_sched_submit_queue as submit queue is
> a made of thing. drm_sched_submission would be my top choice but if Luben
> is opposed will go with drm_sched_wqueue in next rev.

I suppose you meant "made up"? All the verbs are also then made up so I 
don't really see that as an argument why implementation detail should be 
encoded into the API naming but your call folks.

Regards,

Tvrtko

>>>> Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
>>>> and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
>>>> Plus, all these functions actually do operate on work-queues, directly or indirectly,
>>>> are new, so it's a win-win naming scheme.
>>>>
>>>> I think that that would be most likeable.
>>>
>>> FWIW I was suggesting not to encode the fact submit queue is implemented
>>> with a workqueue in the API name. IMO it would be nicer and less maintenance
>>> churn should something channge if the external components can be isolated
>>> from that detail.
>>>
>>> drm_sched_submit_queue_$verb? If not viewed as too verbose...
>>>
>>> Regards,
>>>
>>> Tvrtko
