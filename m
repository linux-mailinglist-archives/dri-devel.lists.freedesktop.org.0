Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82EEABC4F6
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35BC10E44C;
	Mon, 19 May 2025 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="YX5NqJwO";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="eFY4E8Qf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B2910E44C;
 Mon, 19 May 2025 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747673494;
 bh=rFGYO5VlgvAFnqh4hYCkTRF
 lXY7iXBH3Jn+O+PlF9/s=; b=YX5NqJwOm/Ig9+N7uduUg6uOtSB5XLPgCfMi3rWYqVPj1LN2XC
 Yv9A1v3N74h6vVPjfsLQwZEsdZlFEF3a7Lykuc04oVvB/3x9Q3O8u83dWbsB252J/LUF5+TQZzE
 /x6dnsRcw0uqMAjbHYfoWTulqku6gO7vdWAc4FJjl8oSH0tmJMKEuyBDIs9g7w3cZebGoj2A0Tc
 DGgv81w6RNacM6j+lpQOTJSIDL3cBTd5aUQfLNS5EKlAAtssGkmIkKurugzFAw7zjfS1cT1pqR+
 1agSy6lFXyocE6LJ6kctJ3U8CoZ4VhrHs97yl4cPE+nptlI/vQ3/VteaVOhIetFba1w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1747673494; bh=rFGYO5VlgvAFnqh4hYCkTRF
 lXY7iXBH3Jn+O+PlF9/s=; b=eFY4E8QfnYvBQ3Y1a17b06IN78TymdBRLpLQ8Yp97lx1RisKe2
 U5Hcf51KMTdFjiZgeMtet3RLHMIQD6AgYaAg==;
Message-ID: <c004f585-389b-4630-827d-e76f52a3d55e@damsy.net>
Date: Mon, 19 May 2025 18:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 00/16] Fair DRM scheduler
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Leo Liu <Leo.Liu@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
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

Le 25/04/2025 à 12:20, Tvrtko Ursulin a écrit :
> V4 is quite different from v3 in that I have replaced the deadline + queue-depth
> approach with a fair GPU time based approach. This is because Pierre-Eric found
> a viewperf workload which showed queue-depth based approach regressing and
> without it there was a regression on one of my synthetic workloads I was not
> happy with.

I've did some testing with this version and the regression I had is gone.

This branch performs better than drm-next and a bit worse than my own hacky implementation of a CFS 
scheduler.

For context my test case is: running glxgears and a GPU-heavy Viewperf test, and then monitoring the 
FPS of glxgears. The closest to 60 Hz glxgears runs, the better because it means the scheduler 
successfully ran glxgears jobs between the multiple jobs that build a single Viewperf frame.

> 
> In my experiments the fair scheduler looks solid so lets see how it fares after
> wider testing.
> 
> On the high level main advantages of the series are:
> 
>   1. Scheduling quality - schedules better than FIFO.
>   2. Code simplification - no more multiple run queues.
> 
> First patches add some unit tests which allow for easy evaluation of scheduling
> behaviour against different client submission patterns. From there onwards it is
> hopefully a natural progression of cleanups, enablers, adding the fair policy,
> and finally removing FIFO and RR and simplifying the code base due not more need
> for multiple run queues.
> 
> As a headline result I have tested three simultaneous clients on the Steam Deck:
> 
> One instance of a deferredmultisampling Vulkan demo running with low priority,
> one normal priority instance of the same demo, and the Unigine Heaven benchmark.
> 
> With the FIFO scheduler we can see that the low priority client is completely
> starved and the GPU time distribution between the other two clients is uneven:
> 
> https://people.igalia.com/tursulin/drm-sched-fair/fifo-starvation.png
> 
> Switching to the fair scheduler, GPU time distribution is almost equal and the
> low priority client does get a small share of the GPU:
> 
> https://people.igalia.com/tursulin/drm-sched-fair/fair-no-starvation.png
> 
> Moving onto the synthetic submission patterns, they are about two simultaneous
> clients which broadly cover the following categories:
> 
>   * Deep queue clients
>   * Hogs versus interactive
>   * Priority handling
> 
> Lets look at the results:
> 
> 1. Two normal priority deep queue clients.
> 
> These ones submit one second worth of 8ms jobs. As fast as they can, no
> dependencies etc. There is no difference in runtime between FIFO and fair but
> the latter allows both clients to progress with work more evenly:
> 
> https://people.igalia.com/tursulin/drm-sched-fair/normal-normal.png
> 
> (X axis is time, Y is submitted queue-depth, hence lowering of qd corresponds
>    with work progress for both clients, tested with both schedulers separately.)
> 
> 2. Same two clients but one is now low priority.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/normal-low.png
> 
> Normal priority client is a solid line, low priority dotted. We can see how FIFO
> completely starves the low priority client until the normal priority is fully
> done. Only then the low priority client gets any GPU time.
> 
> In constrast, fair scheduler allows some GPU time to the low priority client.
> 
> 3. Same clients but now high versus normal priority.
> 
> Similar behaviour as in the previous one with normal a bit less de-prioritised
> relative to high, than low was against normal.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png
> 
> 4. Heavy load vs interactive client.
> 
> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed by a
> 2.5ms wait. Interactive client emits a 10% GPU load in the format of 1x 1ms job
> followed by a 9ms wait.
> 
> This simulates an interactive graphical client used on top of a relatively heavy
> background load but no GPU oversubscription.
> 
> Graphs show the interactive client only and from now on, instead of looking at
> the client's queue depth, we look at its "fps".
> 
> https://people.igalia.com/tursulin/drm-sched-fair/heavy-interactive.png
> 
> We can see that fair scheduler allows a higher fps for the interactive client
> which is good.
> 
> 5. An even heavier load vs interactive client.
> 
> This one is oversubscribing the GPU by submitting 4x 50ms jobs and waiting for
> only one microsecond before repeating the cycle. Interactive client is thje same
> 10% as above.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/veryheavy-interactive.png
> 
> Here the difference is even more dramatic with fair scheduler enabling ~3x the
> framerate for the interactive client.
> 
> 6. Low priority GPU hog versus heavy-interactive.
> 
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/lowhog-interactive.png
> 
> Slight win for the fair scheduler but could be just noise.
> 
> 7. Last set of test scenarios will have three subgroups.
> 
> In all cases we have two interactive (synchronous, single job at a time) clients
> with a 50% "duty cycle" GPU time usage.
> 
> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
> 
> a) Both normal priority.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/5050-short.png
> https://people.igalia.com/tursulin/drm-sched-fair/5050-long.png
> 
> Both schedulers favour the higher frequency duty cycle with fair giving it a
> little bit more which should be good for interactivity.
> 
> b) Normal vs low priority.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-normal.png
> https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-low.png
> 
> Fair scheduler gives a bit more GPU time to the normal priority client which is
> again good.
> 
> c) High vs normal priority.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-high.png
> https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-normal.png
> 
> Again, fair scheduler gives a bit more share to the higher priority client.
> 
> On the overall fair looks like a potential improvement in terms of fairness,
> especially avoiding priority starvation. There do not appear to be any
> regressions with the tested workloads.
> 
> As before, I am looking for feedback, ideas for what kind of submission
> scenarios to test. Testers on different GPUs would be very welcome too.

There's room for improvement (eg: I believe the scheduler would benefit from having a logic to 
postpone the entity selection when it detects that one app will oversubscribe the GPU), but
overall if no regressions are found I think this series is already a solid first step.

Thanks,
Pierre-Eric

> 
> And I should probably test round-robin at some point, to see if we are maybe
> okay to drop unconditionally, it or further work improving fair would be needed
> if some use cases rely on round-robin.
> 
> v2:
>   * Fixed many rebase errors.
>   * Added some new patches.
>   * Dropped single shot dependecy handling.
> 
> v3:
>   * Added scheduling quality unit tests.
>   * Refined a tiny bit by adding some fairness.
>   * Dropped a few patches for now.
> 
> v4:
>   * Replaced deadline with fair!
>   * Refined scheduling quality unit tests.
>   * Pulled one cleanup patch earlier.
>   * Fixed "drm/sched: Avoid double re-lock on the job free path".
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> CC: Leo Liu <Leo.Liu@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> 
> Tvrtko Ursulin (16):
>    drm/sched: Add some scheduling quality unit tests
>    drm/sched: Add some more scheduling quality unit tests
>    drm/sched: De-clutter drm_sched_init
>    drm/sched: Avoid double re-lock on the job free path
>    drm/sched: Consolidate drm_sched_job_timedout
>    drm/sched: Consolidate drm_sched_rq_select_entity_rr
>    drm/sched: Implement RR via FIFO
>    drm/sched: Consolidate entity run queue management
>    drm/sched: Move run queue related code into a separate file
>    drm/sched: Free all finished jobs at once
>    drm/sched: Account entity GPU time
>    drm/sched: Remove idle entity from tree
>    drm/sched: Add fair scheduling policy
>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>    drm/sched: Queue all free credits in one worker invocation
>    drm/sched: Embed run queue singleton into the scheduler
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>   drivers/gpu/drm/scheduler/Makefile            |   2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c      | 121 +--
>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>   drivers/gpu/drm/scheduler/sched_internal.h    | 114 ++-
>   drivers/gpu/drm/scheduler/sched_main.c        | 570 +++---------
>   drivers/gpu/drm/scheduler/sched_rq.c          | 214 +++++
>   drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>   .../gpu/drm/scheduler/tests/tests_scheduler.c | 815 ++++++++++++++++++
>   include/drm/gpu_scheduler.h                   |  23 +-
>   15 files changed, 1348 insertions(+), 578 deletions(-)
>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> 
