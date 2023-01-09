Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6352662799
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 14:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727510E1C6;
	Mon,  9 Jan 2023 13:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD5710E156;
 Mon,  9 Jan 2023 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673272017; x=1704808017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mrr6zIOQ37XDHZ5lEa5PpyNgLD4OY/Zy4Ds4srJjZJU=;
 b=QPpDLUdrx8b1r2KnS+Gy/OM3lr+oEHCywwB1IO/jUOxlS6eOqPqzpc4P
 o7yiKt2ffBqUQponqnUPUWOcxL9fL/adl6oRH/z7Rr0o4tr461R2Urxxb
 Ih7jTKumswQS7EO7+Eqchkfh58TAr4kG0TZWhH0MOiWM7eAsLwLTIcXf/
 Yfu4gBLVh1ulMJgjCBxztFSLumhzxiZeo+xKO4AC+ddu6YKdNYwCoVw5A
 Ju2gy0obOj+9etwen+K2qxnDzmQ3uAGkLphruGrj0dgVh8HL5dzRIDN6E
 xPZ+dO0OYPCpFxd/vEVjNee+BrR7WWzbGy7qpLxMQ9nTh5HXSdCc1I+dR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324120137"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="324120137"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 05:46:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="658598970"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="658598970"
Received: from lherman-mobl.ger.corp.intel.com (HELO [10.213.209.244])
 ([10.213.209.244])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 05:46:54 -0800
Message-ID: <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
Date: Mon, 9 Jan 2023 13:46:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/01/2023 23:52, Matthew Brost wrote:
> On Thu, Jan 05, 2023 at 09:43:41PM +0000, Matthew Brost wrote:
>> On Tue, Jan 03, 2023 at 01:02:15PM +0000, Tvrtko Ursulin wrote:
>>>
>>> On 02/01/2023 07:30, Boris Brezillon wrote:
>>>> On Fri, 30 Dec 2022 12:55:08 +0100
>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>
>>>>> On Fri, 30 Dec 2022 11:20:42 +0100
>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>
>>>>>> Hello Matthew,
>>>>>>
>>>>>> On Thu, 22 Dec 2022 14:21:11 -0800
>>>>>> Matthew Brost <matthew.brost@intel.com> wrote:
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
>>>>>>
>>>>>> Oh, that's interesting. I've been trying to solve the same sort of
>>>>>> issues to support Arm's new Mali GPU which is relying on a FW-assisted
>>>>>> scheduling scheme (you give the FW N streams to execute, and it does
>>>>>> the scheduling between those N command streams, the kernel driver
>>>>>> does timeslice scheduling to update the command streams passed to the
>>>>>> FW). I must admit I gave up on using drm_sched at some point, mostly
>>>>>> because the integration with drm_sched was painful, but also because I
>>>>>> felt trying to bend drm_sched to make it interact with a
>>>>>> timeslice-oriented scheduling model wasn't really future proof. Giving
>>>>>> drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
>>>>>> help for a few things (didn't think it through yet), but I feel it's
>>>>>> coming short on other aspects we have to deal with on Arm GPUs.
>>>>>
>>>>> Ok, so I just had a quick look at the Xe driver and how it
>>>>> instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
>>>>> have a better understanding of how you get away with using drm_sched
>>>>> while still controlling how scheduling is really done. Here
>>>>> drm_gpu_scheduler is just a dummy abstract that let's you use the
>>>>> drm_sched job queuing/dep/tracking mechanism. The whole run-queue
>>>>> selection is dumb because there's only one entity ever bound to the
>>>>> scheduler (the one that's part of the xe_guc_engine object which also
>>>>> contains the drm_gpu_scheduler instance). I guess the main issue we'd
>>>>> have on Arm is the fact that the stream doesn't necessarily get
>>>>> scheduled when ->run_job() is called, it can be placed in the runnable
>>>>> queue and be picked later by the kernel-side scheduler when a FW slot
>>>>> gets released. That can probably be sorted out by manually disabling the
>>>>> job timer and re-enabling it when the stream gets picked by the
>>>>> scheduler. But my main concern remains, we're basically abusing
>>>>> drm_sched here.
>>>>>
>>>>> For the Arm driver, that means turning the following sequence
>>>>>
>>>>> 1. wait for job deps
>>>>> 2. queue job to ringbuf and push the stream to the runnable
>>>>>      queue (if it wasn't queued already). Wakeup the timeslice scheduler
>>>>>      to re-evaluate (if the stream is not on a FW slot already)
>>>>> 3. stream gets picked by the timeslice scheduler and sent to the FW for
>>>>>      execution
>>>>>
>>>>> into
>>>>>
>>>>> 1. queue job to entity which takes care of waiting for job deps for
>>>>>      us
>>>>> 2. schedule a drm_sched_main iteration
>>>>> 3. the only available entity is picked, and the first job from this
>>>>>      entity is dequeued. ->run_job() is called: the job is queued to the
>>>>>      ringbuf and the stream is pushed to the runnable queue (if it wasn't
>>>>>      queued already). Wakeup the timeslice scheduler to re-evaluate (if
>>>>>      the stream is not on a FW slot already)
>>>>> 4. stream gets picked by the timeslice scheduler and sent to the FW for
>>>>>      execution
>>>>>
>>>>> That's one extra step we don't really need. To sum-up, yes, all the
>>>>> job/entity tracking might be interesting to share/re-use, but I wonder
>>>>> if we couldn't have that without pulling out the scheduling part of
>>>>> drm_sched, or maybe I'm missing something, and there's something in
>>>>> drm_gpu_scheduler you really need.
>>>>
>>>> On second thought, that's probably an acceptable overhead (not even
>>>> sure the extra step I was mentioning exists in practice, because dep
>>>> fence signaled state is checked as part of the drm_sched_main
>>>> iteration, so that's basically replacing the worker I schedule to
>>>> check job deps), and I like the idea of being able to re-use drm_sched
>>>> dep-tracking without resorting to invasive changes to the existing
>>>> logic, so I'll probably give it a try.
>>>
>>> I agree with the concerns and think that how Xe proposes to integrate with
>>> drm_sched is a problem, or at least significantly inelegant.
>>>
>>
>> Inelegant is a matter of opinion, I actually rather like this solution.
>>
>> BTW this isn't my design rather this was Jason's idea.
>>   
>>> AFAICT it proposes to have 1:1 between *userspace* created contexts (per
>>> context _and_ engine) and drm_sched. I am not sure avoiding invasive changes
>>> to the shared code is in the spirit of the overall idea and instead
>>> opportunity should be used to look at way to refactor/improve drm_sched.
>>>
>>
>> Yes, it is 1:1 *userspace* engines and drm_sched.
>>
>> I'm not really prepared to make large changes to DRM scheduler at the
>> moment for Xe as they are not really required nor does Boris seem they
>> will be required for his work either. I am interested to see what Boris
>> comes up with.
>>
>>> Even on the low level, the idea to replace drm_sched threads with workers
>>> has a few problems.
>>>
>>> To start with, the pattern of:
>>>
>>>    while (not_stopped) {
>>> 	keep picking jobs
>>>    }
>>>
>>> Feels fundamentally in disagreement with workers (while obviously fits
>>> perfectly with the current kthread design).
>>>
>>
>> The while loop breaks and worker exists if no jobs are ready.
>>
>>> Secondly, it probably demands separate workers (not optional), otherwise
>>> behaviour of shared workqueues has either the potential to explode number
>>> kernel threads anyway, or add latency.
>>>
>>
>> Right now the system_unbound_wq is used which does have a limit on the
>> number of threads, right? I do have a FIXME to allow a worker to be
>> passed in similar to TDR.
>>
>> WRT to latency, the 1:1 ratio could actually have lower latency as 2 GPU
>> schedulers can be pushing jobs into the backend / cleaning up jobs in
>> parallel.
>>
> 
> Thought of one more point here where why in Xe we absolutely want a 1 to
> 1 ratio between entity and scheduler - the way we implement timeslicing
> for preempt fences.
> 
> Let me try to explain.
> 
> Preempt fences are implemented via the generic messaging interface [1]
> with suspend / resume messages. If a suspend messages is received to
> soon after calling resume (this is per entity) we simply sleep in the
> suspend call thus giving the entity a timeslice. This completely falls
> apart with a many to 1 relationship as now a entity waiting for a
> timeslice blocks the other entities. Could we work aroudn this, sure but
> just another bunch of code we'd have to add in Xe. Being to freely sleep
> in backend without affecting other entities is really, really nice IMO
> and I bet Xe isn't the only driver that is going to feel this way.
> 
> Last thing I'll say regardless of how anyone feels about Xe using a 1 to
> 1 relationship this patch IMO makes sense as I hope we can all agree a
> workqueue scales better than kthreads.

I don't know for sure what will scale better and for what use case, 
combination of CPU cores vs number of GPU engines to keep busy vs other 
system activity. But I wager someone is bound to ask for some numbers to 
make sure proposal is not negatively affecting any other drivers.

In any case that's a low level question caused by the high level design 
decision. So I'd think first focus on the high level - which is the 1:1 
mapping of entity to scheduler instance proposal.

Fundamentally it will be up to the DRM maintainers and the community to 
bless your approach. And it is important to stress 1:1 is about 
userspace contexts, so I believe unlike any other current scheduler 
user. And also important to stress this effectively does not make Xe 
_really_ use the scheduler that much.

I can only offer my opinion, which is that the two options mentioned in 
this thread (either improve drm scheduler to cope with what is required, 
or split up the code so you can use just the parts of drm_sched which 
you want - which is frontend dependency tracking) shouldn't be so 
readily dismissed, given how I think the idea was for the new driver to 
work less in a silo and more in the community (not do kludges to 
workaround stuff because it is thought to be too hard to improve common 
code), but fundamentally, "goto previous paragraph" for what I am concerned.

Regards,

Tvrtko

P.S. And as a related side note, there are more areas where drm_sched 
could be improved, like for instance priority handling.
Take a look at msm_submitqueue_create / msm_gpu_convert_priority / 
get_sched_entity to see how msm works around the drm_sched hardcoded 
limit of available priority levels, in order to avoid having to leave a 
hw capability unused. I suspect msm would be happier if they could have 
all priority levels equal in terms of whether they apply only at the 
frontend level or completely throughout the pipeline.

> [1] https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
> 
>>> What would be interesting to learn is whether the option of refactoring
>>> drm_sched to deal with out of order completion was considered and what were
>>> the conclusions.
>>>
>>
>> I coded this up a while back when trying to convert the i915 to the DRM
>> scheduler it isn't all that hard either. The free flow control on the
>> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is really what
>> sold me on the this design.
>>
>>> Second option perhaps to split out the drm_sched code into parts which would
>>> lend themselves more to "pick and choose" of its functionalities.
>>> Specifically, Xe wants frontend dependency tracking, but not any scheduling
>>> really (neither least busy drm_sched, neither FIFO/RQ entity picking), so
>>> even having all these data structures in memory is a waste.
>>>
>>
>> I don't think that we are wasting memory is a very good argument for
>> making intrusive changes to the DRM scheduler.
>>
>>> With the first option then the end result could be drm_sched per engine
>>> class (hardware view), which I think fits with the GuC model. Give all
>>> schedulable contexts (entities) to the GuC and then mostly forget about
>>> them. Timeslicing and re-ordering and all happens transparently to the
>>> kernel from that point until completion.
>>>
>>
>> Out-of-order problem still exists here.
>>
>>> Or with the second option you would build on some smaller refactored
>>> sub-components of drm_sched, by maybe splitting the dependency tracking from
>>> scheduling (RR/FIFO entity picking code).
>>>
>>> Second option is especially a bit vague and I haven't thought about the
>>> required mechanics, but it just appeared too obvious the proposed design has
>>> a bit too much impedance mismatch.
>>>
>>
>> IMO ROI on this is low and again lets see what Boris comes up with.
>>
>> Matt
>>
>>> Oh and as a side note, when I went into the drm_sched code base to remind
>>> myself how things worked, it is quite easy to find some FIXME comments which
>>> suggest people working on it are unsure of locking desing there and such. So
>>> perhaps that all needs cleanup too, I mean would benefit from
>>> refactoring/improving work as brainstormed above anyway.
>>>
>>> Regards,
>>>
>>> Tvrtko
