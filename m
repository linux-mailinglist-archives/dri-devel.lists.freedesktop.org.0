Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D6663F3C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038BD10E59A;
	Tue, 10 Jan 2023 11:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67910E59A;
 Tue, 10 Jan 2023 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673350092; x=1704886092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=22cVdIav1m6rCi3x60a6BpxjWubYxDAcECYHBinW/t4=;
 b=et+sNWu6LHVV74XONgBuG27BQEbqrxuwlY4JjNUYt9AMPp1Cf4lqdMSr
 d0sWv6C6BG3ZycIg8npA4BaM0Fld1n8lXQuxpCMYA3hxhS9hBmpDgkwcs
 fif0016DZWb1arE6rvFjz+XaVjjLYBOCm64GLyTkfHAbd01izNMvXHbSf
 foZSCet79xrkt3VQ1xXONasONQ3ut63105FaINTranFFnA9gBSfmY1x6G
 HlmWqjDKrEQL7Xlj9BLnp03vOABYcdu9sX+t0/pThx1fyMEsYrOfhybVG
 sjJn7uhI/BjLXcF3LMkdK+mKbFMxt4IH4uB37C/m+2cEzKFM3yoFGBSZx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="321822410"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="321822410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 03:28:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689380154"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="689380154"
Received: from gregoire-mobl3.amr.corp.intel.com (HELO [10.212.88.71])
 ([10.212.88.71])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 03:28:10 -0800
Message-ID: <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
Date: Tue, 10 Jan 2023 11:28:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/01/2023 17:27, Jason Ekstrand wrote:

[snip]

>      >>> AFAICT it proposes to have 1:1 between *userspace* created
>     contexts (per
>      >>> context _and_ engine) and drm_sched. I am not sure avoiding
>     invasive changes
>      >>> to the shared code is in the spirit of the overall idea and instead
>      >>> opportunity should be used to look at way to refactor/improve
>     drm_sched.
> 
> 
> Maybe?  I'm not convinced that what Xe is doing is an abuse at all or 
> really needs to drive a re-factor.  (More on that later.)  There's only 
> one real issue which is that it fires off potentially a lot of kthreads. 
> Even that's not that bad given that kthreads are pretty light and you're 
> not likely to have more kthreads than userspace threads which are much 
> heavier.  Not ideal, but not the end of the world either.  Definitely 
> something we can/should optimize but if we went through with Xe without 
> this patch, it would probably be mostly ok.
> 
>      >> Yes, it is 1:1 *userspace* engines and drm_sched.
>      >>
>      >> I'm not really prepared to make large changes to DRM scheduler
>     at the
>      >> moment for Xe as they are not really required nor does Boris
>     seem they
>      >> will be required for his work either. I am interested to see
>     what Boris
>      >> comes up with.
>      >>
>      >>> Even on the low level, the idea to replace drm_sched threads
>     with workers
>      >>> has a few problems.
>      >>>
>      >>> To start with, the pattern of:
>      >>>
>      >>>    while (not_stopped) {
>      >>>     keep picking jobs
>      >>>    }
>      >>>
>      >>> Feels fundamentally in disagreement with workers (while
>     obviously fits
>      >>> perfectly with the current kthread design).
>      >>
>      >> The while loop breaks and worker exists if no jobs are ready.
> 
> 
> I'm not very familiar with workqueues. What are you saying would fit 
> better? One scheduling job per work item rather than one big work item 
> which handles all available jobs?

Yes and no, it indeed IMO does not fit to have a work item which is 
potentially unbound in runtime. But it is a bit moot conceptual mismatch 
because it is a worst case / theoretical, and I think due more 
fundamental concerns.

If we have to go back to the low level side of things, I've picked this 
random spot to consolidate what I have already mentioned and perhaps expand.

To start with, let me pull out some thoughts from workqueue.rst:

"""
Generally, work items are not expected to hog a CPU and consume many 
cycles. That means maintaining just enough concurrency to prevent work 
processing from stalling should be optimal.
"""

For unbound queues:
"""
The responsibility of regulating concurrency level is on the users.
"""

Given the unbound queues will be spawned on demand to service all queued 
work items (more interesting when mixing up with the system_unbound_wq), 
in the proposed design the number of instantiated worker threads does 
not correspond to the number of user threads (as you have elsewhere 
stated), but pessimistically to the number of active user contexts. That 
is the number which drives the maximum number of not-runnable jobs that 
can become runnable at once, and hence spawn that many work items, and 
in turn unbound worker threads.

Several problems there.

It is fundamentally pointless to have potentially that many more threads 
than the number of CPU cores - it simply creates a scheduling storm.

Unbound workers have no CPU / cache locality either and no connection 
with the CPU scheduler to optimize scheduling patterns. This may matter 
either on large systems or on small ones. Whereas the current design 
allows for scheduler to notice userspace CPU thread keeps waking up the 
same drm scheduler kernel thread, and so it can keep them on the same 
CPU, the unbound workers lose that ability and so 2nd CPU might be 
getting woken up from low sleep for every submission.

Hence, apart from being a bit of a impedance mismatch, the proposal has 
the potential to change performance and power patterns and both large 
and small machines.

>      >>> Secondly, it probably demands separate workers (not optional),
>     otherwise
>      >>> behaviour of shared workqueues has either the potential to
>     explode number
>      >>> kernel threads anyway, or add latency.
>      >>>
>      >>
>      >> Right now the system_unbound_wq is used which does have a limit
>     on the
>      >> number of threads, right? I do have a FIXME to allow a worker to be
>      >> passed in similar to TDR.
>      >>
>      >> WRT to latency, the 1:1 ratio could actually have lower latency
>     as 2 GPU
>      >> schedulers can be pushing jobs into the backend / cleaning up
>     jobs in
>      >> parallel.
>      >>
>      >
>      > Thought of one more point here where why in Xe we absolutely want
>     a 1 to
>      > 1 ratio between entity and scheduler - the way we implement
>     timeslicing
>      > for preempt fences.
>      >
>      > Let me try to explain.
>      >
>      > Preempt fences are implemented via the generic messaging
>     interface [1]
>      > with suspend / resume messages. If a suspend messages is received to
>      > soon after calling resume (this is per entity) we simply sleep in the
>      > suspend call thus giving the entity a timeslice. This completely
>     falls
>      > apart with a many to 1 relationship as now a entity waiting for a
>      > timeslice blocks the other entities. Could we work aroudn this,
>     sure but
>      > just another bunch of code we'd have to add in Xe. Being to
>     freely sleep
>      > in backend without affecting other entities is really, really
>     nice IMO
>      > and I bet Xe isn't the only driver that is going to feel this way.
>      >
>      > Last thing I'll say regardless of how anyone feels about Xe using
>     a 1 to
>      > 1 relationship this patch IMO makes sense as I hope we can all
>     agree a
>      > workqueue scales better than kthreads.
> 
>     I don't know for sure what will scale better and for what use case,
>     combination of CPU cores vs number of GPU engines to keep busy vs other
>     system activity. But I wager someone is bound to ask for some
>     numbers to
>     make sure proposal is not negatively affecting any other drivers.
> 
> 
> Then let them ask.  Waving your hands vaguely in the direction of the 
> rest of DRM and saying "Uh, someone (not me) might object" is profoundly 
> unhelpful.  Sure, someone might.  That's why it's on dri-devel.  If you 
> think there's someone in particular who might have a useful opinion on 
> this, throw them in the CC so they don't miss the e-mail thread.
> 
> Or are you asking for numbers?  If so, what numbers are you asking for?

It was a heads up to the Xe team in case people weren't appreciating how 
the proposed change has the potential influence power and performance 
across the board. And nothing in the follow up discussion made me think 
it was considered so I don't think it was redundant to raise it.

In my experience it is typical that such core changes come with some 
numbers. Which is in case of drm scheduler is tricky and probably 
requires explicitly asking everyone to test (rather than count on "don't 
miss the email thread"). Real products can fail to ship due ten mW here 
or there. Like suddenly an extra core prevented from getting into deep 
sleep.

If that was "profoundly unhelpful" so be it.

> Also, If we're talking about a design that might paint us into an 
> Intel-HW-specific hole, that would be one thing.  But we're not.  We're 
> talking about switching which kernel threading/task mechanism to use for 
> what's really a very generic problem.  The core Xe design works without 
> this patch (just with more kthreads).  If we land this patch or 
> something like it and get it wrong and it causes a performance problem 
> for someone down the line, we can revisit it.

For some definition of "it works" - I really wouldn't suggest shipping a 
kthread per user context at any point.

>     In any case that's a low level question caused by the high level design
>     decision. So I'd think first focus on the high level - which is the 1:1
>     mapping of entity to scheduler instance proposal.
> 
>     Fundamentally it will be up to the DRM maintainers and the community to
>     bless your approach. And it is important to stress 1:1 is about
>     userspace contexts, so I believe unlike any other current scheduler
>     user. And also important to stress this effectively does not make Xe
>     _really_ use the scheduler that much.
> 
> 
> I don't think this makes Xe nearly as much of a one-off as you think it 
> does.  I've already told the Asahi team working on Apple M1/2 hardware 
> to do it this way and it seems to be a pretty good mapping for them. I 
> believe this is roughly the plan for nouveau as well.  It's not the way 
> it currently works for anyone because most other groups aren't doing FW 
> scheduling yet.  In the world of FW scheduling and hardware designed to 
> support userspace direct-to-FW submit, I think the design makes perfect 
> sense (see below) and I expect we'll see more drivers move in this 
> direction as those drivers evolve.  (AMD is doing some customish thing 
> for how with gpu_scheduler on the front-end somehow. I've not dug into 
> those details.)
> 
>     I can only offer my opinion, which is that the two options mentioned in
>     this thread (either improve drm scheduler to cope with what is
>     required,
>     or split up the code so you can use just the parts of drm_sched which
>     you want - which is frontend dependency tracking) shouldn't be so
>     readily dismissed, given how I think the idea was for the new driver to
>     work less in a silo and more in the community (not do kludges to
>     workaround stuff because it is thought to be too hard to improve common
>     code), but fundamentally, "goto previous paragraph" for what I am
>     concerned.
> 
> 
> Meta comment:  It appears as if you're falling into the standard i915 
> team trap of having an internal discussion about what the community 
> discussion might look like instead of actually having the community 
> discussion.  If you are seriously concerned about interactions with 
> other drivers or whether or setting common direction, the right way to 
> do that is to break a patch or two out into a separate RFC series and 
> tag a handful of driver maintainers.  Trying to predict the questions 
> other people might ask is pointless. Cc them and asking for their input 
> instead.

I don't follow you here. It's not an internal discussion - I am raising 
my concerns on the design publicly. I am supposed to write a patch to 
show something, but am allowed to comment on a RFC series?

It is "drm/sched: Convert drm scheduler to use a work queue rather than 
kthread" which should have Cc-ed _everyone_ who use drm scheduler.

> 
>     Regards,
> 
>     Tvrtko
> 
>     P.S. And as a related side note, there are more areas where drm_sched
>     could be improved, like for instance priority handling.
>     Take a look at msm_submitqueue_create / msm_gpu_convert_priority /
>     get_sched_entity to see how msm works around the drm_sched hardcoded
>     limit of available priority levels, in order to avoid having to leave a
>     hw capability unused. I suspect msm would be happier if they could have
>     all priority levels equal in terms of whether they apply only at the
>     frontend level or completely throughout the pipeline.
> 
>      > [1]
>     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
>      >
>      >>> What would be interesting to learn is whether the option of
>     refactoring
>      >>> drm_sched to deal with out of order completion was considered
>     and what were
>      >>> the conclusions.
>      >>>
>      >>
>      >> I coded this up a while back when trying to convert the i915 to
>     the DRM
>      >> scheduler it isn't all that hard either. The free flow control
>     on the
>      >> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is
>     really what
>      >> sold me on the this design.
> 
> 
> You're not the only one to suggest supporting out-of-order completion. 
> However, it's tricky and breaks a lot of internal assumptions of the 
> scheduler. It also reduces functionality a bit because it can no longer 
> automatically rate-limit HW/FW queues which are often fixed-size.  (Ok, 
> yes, it probably could but it becomes a substantially harder problem.)
> 
> It also seems like a worse mapping to me.  The goal here is to turn 
> submissions on a userspace-facing engine/queue into submissions to a FW 
> queue submissions, sorting out any dma_fence dependencies.  Matt's 
> description of saying this is a 1:1 mapping between sched/entity doesn't 
> tell the whole story. It's a 1:1:1 mapping between xe_engine, 
> gpu_scheduler, and GuC FW engine.  Why make it a 1:something:1 mapping?  
> Why is that better?

As I have stated before, what I think what would fit well for Xe is one 
drm_scheduler per engine class. In specific terms on our current 
hardware, one drm scheduler instance for render, compute, blitter, video 
and video enhance. Userspace contexts remain scheduler entities.

That way you avoid the whole kthread/kworker story and you have it 
actually use the entity picking code in the scheduler, which may be 
useful when the backend is congested.

Yes you have to solve the out of order problem so in my mind that is 
something to discuss. What the problem actually is (just TDR?), how 
tricky and why etc.

And yes you lose the handy LRCA ring buffer size management so you'd 
have to make those entities not runnable in some other way.

Regarding the argument you raise below - would any of that make the 
frontend / backend separation worse and why? Do you think it is less 
natural? If neither is true then all remains is that it appears extra 
work to support out of order completion of entities has been discounted 
in favour of an easy but IMO inelegant option.

> There are two places where this 1:1:1 mapping is causing problems:
> 
>   1. It creates lots of kthreads. This is what this patch is trying to 
> solve. IDK if it's solving it the best way but that's the goal.
> 
>   2. There are a far more limited number of communication queues between 
> the kernel and GuC for more meta things like pausing and resuming 
> queues, getting events back from GuC, etc. Unless we're in a weird 
> pressure scenario, the amount of traffic on this queue should be low so 
> we can probably just have one per physical device.  The vast majority of 
> kernel -> GuC communication should be on the individual FW queue rings 
> and maybe smashing in-memory doorbells.

I don't follow your terminology here. I suppose you are talking about 
global GuC CT and context ringbuffers. If so then isn't "far more 
limited" actually one?

Regards,

Tvrtko

> Doing out-of-order completion sort-of solves the 1 but does nothing for 
> 2 and actually makes managing FW queues harder because we no longer have 
> built-in rate limiting.  Seems like a net loss to me.
> 
>      >>> Second option perhaps to split out the drm_sched code into
>     parts which would
>      >>> lend themselves more to "pick and choose" of its functionalities.
>      >>> Specifically, Xe wants frontend dependency tracking, but not
>     any scheduling
>      >>> really (neither least busy drm_sched, neither FIFO/RQ entity
>     picking), so
>      >>> even having all these data structures in memory is a waste.
>      >>>
>      >>
>      >> I don't think that we are wasting memory is a very good argument for
>      >> making intrusive changes to the DRM scheduler.
> 
> 
> Worse than that, I think the "we could split it up" kind-of misses the 
> point of the way Xe is using drm/scheduler.  It's not just about 
> re-using a tiny bit of dependency tracking code.  Using the scheduler in 
> this way provides a clean separation between front-end and back-end.  
> The job of the userspace-facing ioctl code is to shove things on the 
> scheduler.  The job of the run_job callback is to encode the job into 
> the FW queue format, stick it in the FW queue ring, and maybe smash a 
> doorbell.  Everything else happens in terms of managing those queues 
> side-band.  The gpu_scheduler code manages the front-end queues and Xe 
> manages the FW queues via the Kernel <-> GuC communication rings.  From 
> a high level, this is a really clean design.  There are potentially some 
> sticky bits around the dual-use of dma_fence for scheduling and memory 
> management but none of those are solved by breaking the DRM scheduler 
> into chunks or getting rid of the 1:1:1 mapping.
> 
> If we split it out, we're basically asking the driver to implement a 
> bunch of kthread or workqueue stuff, all the ring rate-limiting, etc.  
> It may not be all that much code but also, why?  To save a few bytes of 
> memory per engine?  Each engine already has 32K(ish) worth of context 
> state and a similar size ring to communicate with the FW.  No one is 
> going to notice an extra CPU data structure.
> 
> I'm not seeing a solid argument against the 1:1:1 design here other than 
> that it doesn't seem like the way DRM scheduler was intended to be 
> used.  I won't argue that.  It's not.  But it is a fairly natural way to 
> take advantage of the benefits the DRM scheduler does provide while also 
> mapping it to hardware that was designed for userspace direct-to-FW submit.
> 
> --Jason
> 
>      >>> With the first option then the end result could be drm_sched
>     per engine
>      >>> class (hardware view), which I think fits with the GuC model.
>     Give all
>      >>> schedulable contexts (entities) to the GuC and then mostly
>     forget about
>      >>> them. Timeslicing and re-ordering and all happens transparently
>     to the
>      >>> kernel from that point until completion.
>      >>>
>      >>
>      >> Out-of-order problem still exists here.
>      >>
>      >>> Or with the second option you would build on some smaller
>     refactored
>      >>> sub-components of drm_sched, by maybe splitting the dependency
>     tracking from
>      >>> scheduling (RR/FIFO entity picking code).
>      >>>
>      >>> Second option is especially a bit vague and I haven't thought
>     about the
>      >>> required mechanics, but it just appeared too obvious the
>     proposed design has
>      >>> a bit too much impedance mismatch.
>      >>>
>      >>
>      >> IMO ROI on this is low and again lets see what Boris comes up with.
>      >>
>      >> Matt
>      >>
>      >>> Oh and as a side note, when I went into the drm_sched code base
>     to remind
>      >>> myself how things worked, it is quite easy to find some FIXME
>     comments which
>      >>> suggest people working on it are unsure of locking desing there
>     and such. So
>      >>> perhaps that all needs cleanup too, I mean would benefit from
>      >>> refactoring/improving work as brainstormed above anyway.
>      >>>
>      >>> Regards,
>      >>>
>      >>> Tvrtko
> 
