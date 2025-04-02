Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC0A78E0A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2A10E761;
	Wed,  2 Apr 2025 12:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fm6He0pC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330C10E761;
 Wed,  2 Apr 2025 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFmEhK5WggNAIrc1HIrPzZ4qjQGE33413lz/7V4LgW0=; b=fm6He0pCvt+OR/4EUdCB8+oduI
 mIi/fT/m3oWqDC7MOT4AAeSijPemVPfDrDLoer3wk28MSyi7VyIU64wxeLBaQee8FWfajJJtk4vLy
 b85dv3gxSYDiam2KzHyjsR2SKB254skoNiwEDqleLpHrHqSUhIuGBjMfk6mB5x4U62ElHTEJCUQY+
 izakYdA8mmXfh9k0Ce0IJbn5U654jpZAe7TqbHtAlh/0exaJ5bBouV0n1kP+sFF1fRzxI8ElrUVaU
 QYf+7Wjte4xi6hKshkkosjHTmpv0IMlLh53jrih9w9AEWiap41xJ9JDcHRmEmve4rC8zI0RVBDcYu
 CqNAXCQA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzx2E-00AMdV-3K; Wed, 02 Apr 2025 14:17:34 +0200
Message-ID: <da77ddb7-f0ac-458a-a027-bcefa42269e3@igalia.com>
Date: Wed, 2 Apr 2025 13:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 00/14] Deadline DRM scheduler
To: Philipp Stanner <pstanner@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <92572c626ae16366eeccd3d1e7d957991549c02a.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <92572c626ae16366eeccd3d1e7d957991549c02a.camel@redhat.com>
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


On 02/04/2025 11:37, Philipp Stanner wrote:
> Alright alright, uff, so this will be a lot to discuss…
> 
> (btw. my chaotic email filters had me search the cover-letter for a
> while, which seems to have gone to my RH addr, with the others going to
> kernel.org – I need a better mail client)

My bad.

> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>> This is similar to v2 but I dropped some patches (for now) and added
>> some new
>> ones. Most notably deadline scaling based on queue depth appears to
>> be able to
>> add a little bit of fairness with spammy clients (deep submission
>> queue).
>>
>> As such, on the high level main advantages of the series:
>>
>>   1. Code simplification - no more multiple run queues.
>>   2. Scheduling quality - schedules better than FIFO.
>>   3. No more RR is even more code simplification but this one needs to
>> be tested
>>      and approved by someone who actually uses RR.
>>
>> In the future futher simplifactions and improvements should be
>> possible on top
>> of this work. But for now I keep it simple.
>>
>> First patch adds some unit tests which allow for easy evaluation of
>> scheduling
>> behaviour against different client submission patterns. From there
>> onwards it is
>> a hopefully natural progression of patches (or close) to the end
>> result which is
>> a slightly more fair scheduler than FIFO.
>>
>> Regarding the submission patterns tested, it is always two parallel
>> clients
>> and they broadly cover these categories:
>>
>>   * Deep queue clients
>>   * Hogs versus interactive
>>   * Priority handling
>>
>> Lets look at the results:
>>
>> 1. Two normal priority deep queue clients.
>>
>> These ones submit one second worth of 8ms jobs. As fast as they can,
>> no
>> dependencies etc. There is no difference in runtime between FIFO and
>> qddl but
>> the latter allows both clients to progress with work more evenly:
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/normal-normal.png
> 
> I read qd surprisingly long as dp and was confused :)
> 
> And the title reads "Normal vs Normal"

Yes, two identical DRM_SCHED_PRIORITY_NORMAL clients.

>> (X axis is time, Y is submitted queue-depth, hence lowering of qd
>> corresponds
>>    with work progress for both clients, tested with both schedulers
>> separately.)
>>
>> 2. Same two clients but one is now low priority.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/normal-low.png
>>
>> Normal priority client is a solid line, low priority dotted. We can
>> see how FIFO
>> completely starves the low priority client until the normal priority
>> is fully
>> done. Only then the low priority client gets any GPU time.
>>
>> In constrast, qddl allows some GPU time to the low priority client.
>>
>> 3. Same clients but now high versus normal priority.
>>
>> Similar behaviour as in the previous one with normal a bit less de-
>> prioritised
>> relative to high, than low was against normal.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/high-normal.png
>>
>> 4. Heavy load vs interactive client.
>>
>> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs
>> followed by a
>> 2.5ms wait.
>>
>> Interactive client emites a 10% GPU load in the format of 1x 1ms job
>> followed
>> by a 9ms wait.
>>
>> This simulates an interactive graphical client used on top of a
>> relatively heavy
>> background load but no GPU oversubscription.
>>
>> Graphs show the interactive client only and from now on, instead of
>> looking at
>> the client's queue depth, we look at its "fps".
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/heavy-interactive.png
>>
>> We can see that qddl allows a slighty higher fps for the interactive
>> client
>> which is good.
>>
>> 5. Low priority GPU hog versus heavy-interactive.
>>
>> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
>> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/lowhog-interactive.png
>>
>> No difference between the schedulers.
>>
>> 6. Last set of test scenarios will have three subgroups.
>>
>> In all cases we have two interactive (synchronous, single job at a
>> time) clients
>> with a 50% "duty cycle" GPU time usage.
>>
>> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
>> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
>>
>> a) Both normal priority.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-short.png
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-long.png
>>
>> Both schedulers favour the higher frequency duty cycle with qddl
>> giving it a
>> little bit more which should be good for interactivity.
>>
>> b) Normal vs low priority.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-normal.png
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-low.png
>>
>> Qddl gives a bit more to the normal than low.
>>
>> c) High vs normal priority.
>>
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-high.png
>> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-normal.png
>>
>> Again, qddl gives a bit more share to the higher priority client.
>>
>> On the overall qddl looks like a potential improvement in terms of
>> fairness,
>> especially avoiding priority starvation. There do not appear to be
>> any
>> regressions with the tested workloads.
> 
> OK, so the above seems to be the measurements serving as a
> justification for the major rework.
> 
> I suppose this was tested on a workstation with AMD card?

No, using the mock scheduler unit tests. ;)

>> As before, I am looking for feedback, ideas for what kind of
>> submission
>> scenarios to test. Testers on different GPUs would be very welcome
>> too.
>>
>> And I should probably test round-robin at some point, to see if we
>> are maybe
>> okay to drop unconditionally, it or further work improving qddl would
>> be needed.
>>
>> v2:
>>   * Fixed many rebase errors.
>>   * Added some new patches.
>>   * Dropped single shot dependecy handling.
>>
>> v3:
>>   * Added scheduling quality unit tests.
>>   * Refined a tiny bit by adding some fairness.
>>   * Dropped a few patches for now.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>>
>> Tvrtko Ursulin (14):
> 
> There appear to be, again, some candidates which should be branched out
> since they're independent from the scheduling policy. Suspicious ones
> are:
> 
>>    drm/sched: Add some scheduling quality unit tests
>>    drm/sched: Avoid double re-lock on the job free path
>>    drm/sched: Consolidate drm_sched_job_timedout

Tests are WIP but the other two are indeed independent.

> this one
> 
>>    drm/sched: Clarify locked section in
>> drm_sched_rq_select_entity_fifo
> 
> ^

This one I retracted, its wrong.

>>    drm/sched: Consolidate drm_sched_rq_select_entity_rr
>>    drm/sched: Implement RR via FIFO
>>    drm/sched: Consolidate entity run queue management
>>    drm/sched: Move run queue related code into a separate file
>>    drm/sched: Add deadline policy
>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>    drm/sched: Queue all free credits in one worker invocation
>>    drm/sched: Embed run queue singleton into the scheduler
>>    drm/sched: De-clutter drm_sched_init
> 
> ^

Yep. I will pull in this one at some point.

>>    drm/sched: Scale deadlines depending on queue depth
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
> 
> Alright, so here we have our lovely AMD cards :)

Those diffs are just a consequence of "drm/sched: Embed run queue 
singleton into the scheduler" since deadline does not need per priority 
run queues is is code simplification.

> Here's a thing:
> 
> Back in the day, we did a seemingly harmless change of the scheduler's
> default scheduling policy, from RR to FIFO. From all the arguments I
> have seen in the git log and the archives, this was one of the typical
> changes where the developer is tempted to think "This *cannot* break
> anything, it makes everything _better_ and has only advantages". But it
> turned out that it did break things and resulted in lengthy and
> interesting discussions here:
> 
> https://gitlab.freedesktop.org/drm/amd/-/issues/2516
> 
> Now, from time to time it is worth breaking things for progress. So the
> possibility that things *could* break even with the best improvements
> is not really an argument.
> 
> It becomes an argument, however, when we consider the following:
> AMD cards are the major profiteer of this change, generating X percent
> of performance and fairness gain.
> 
> Reason being that AMD seems to be the most important party that has
> hardware scheduling. For Nouveau and Xe, that deadline policy won't do
> anything.
> 
> And, if I understood correctly, new AMD generations will move to
> firmware schedeuling, too.
> 
> So that raises the question: is it worth it?
> 
> If I am not mistaken, the firmware scheduler stakeholders largely
> shouldn't feel an impact when drm_sched changes its scheduling
> behavior, since the firmware does what it wants anyways.
> 
> But there are some other drivers that use hardware scheduling, and this
> (and remaining bad feelings in the guts about firmware schedulers)
> makes me nervous about touching the global scheduling behavior.
> 
> It appears to me that if AMD cards are the major profiteer, and it is
> deemed that the performance gain is really worth it for the older and
> current generations, then we should at least explore / consider paths
> toward changing scheduling behavior for AMD only.
> 
> But, as you, I am also interested in hearing from the other drivers.
> And correct me on any wrong assumptions above.

You are correct that there is no benefit in the scheduling algorithm for 
drivers with 1:1 entity to scheduler.

But it is not just about AMD. There are other drivers which are not 1:1, 
like simple GPUs which process one job at a time. They would benefit if 
we come up with scheduling improvements.

Then there is a secondary benefit that the code is simplified. If you 
look at the series diffstat and subtract the unit tests you will see the 
code on the overall shrinks. Partly due RR removal, and partly due 
removal of per priority run queues.

I would say it could conditionally be worth it. Conditional on building 
confidence that there are no regressing workloads. As I say in the cover 
letter I am looking for ideas, suggestions, testing.

So far my synthetic workloads did not find a weakness relative to FIFO. 
But Pierre-Eric apparently did find a regression with viewperf+glxgears. 
I am trying to model that in the unit tests.

Also, both him and I experiment with CFS like scheduler in parallel to 
this. That would be even better but it is not easy to do in a nice way.

Regards,

Tvrtko

>>   drivers/gpu/drm/scheduler/Makefile            |   2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c      | 121 ++--
>>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>>   drivers/gpu/drm/scheduler/sched_internal.h    |  17 +-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 581 ++++------------
>> --
>>   drivers/gpu/drm/scheduler/sched_rq.c          | 188 ++++++
>>   drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>>   .../gpu/drm/scheduler/tests/tests_scheduler.c | 548
>> +++++++++++++++++
>>   include/drm/gpu_scheduler.h                   |  17 +-
>>   15 files changed, 962 insertions(+), 579 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>>
> 

