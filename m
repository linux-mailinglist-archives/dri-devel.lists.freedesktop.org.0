Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB4B1391B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1946410E4C2;
	Mon, 28 Jul 2025 10:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dKfKsRq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8DA10E15F;
 Mon, 28 Jul 2025 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QrFb2RomH1b53hR3UDLKm6J+ikdY8pkJoQPD7aLwKI4=; b=dKfKsRq5ZZ2qMk58vnRFcOjDGO
 Zmem7EqnmBgNeHG9bTII1gkM38yjBpohg6zMSIJ/HHlanlLL2nT4xaMrcJMgBBla8iBg2S9MVZ34q
 29qkis/OxkUEeJJ40Rk3bU38YOFhPTRmCvx3YwKXWRUDIdALxgCaQkq1LnOX+/iZCgAHgpQ9PNnyD
 vIF7fQGBkwbuXs2yj5StOWK31o8Z18XiGsqZaLqLo1+KHZJ8qabziCw54iEIWXKpXklyyTPHyT6GC
 slXuoeVWP3JmMnV6y8XKuNCZ81CDO8sJrhNLyKKFnn47Hwin1eaMJr2MX5869vCw4ovTyVrV3YDmP
 UznyfEog==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ugLGT-004rWj-Gk; Mon, 28 Jul 2025 12:39:29 +0200
Message-ID: <2ab7b7a7-83d2-4de7-8c6c-3213cbe4ad7e@igalia.com>
Date: Mon, 28 Jul 2025 11:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 00/12] Fair DRM scheduler
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Leo Liu <Leo.Liu@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
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


On 24/07/2025 15:19, Tvrtko Ursulin wrote:
> As a summary, the new scheduling algorithm is insipired by the original Linux
> CFS and so far no scheduling regressions have been found relative to FIFO.
> There are improvements in fairness and scheduling of interactive clients when
> running in parallel with a heavy GPU load (for example Pierre-Eric has one
> viewperf medical test which shows a nice improvement with amdgpu).

Actually I needed to give a lot more credit to collaboration with 
Pierre-Eric here.

Apart from finding a weakness in my earlier deadline based approach with 
the above mentioned viewperf medical test, we also chatted quite a lot 
on the design which, together with Pierre-Eric sketching out his own 
CFS-like approach, pushed me to try harder to find an elegant way of 
tracking entity GPU time. Earlier I had abandoned that attempt as 
"impossible" without a significant rewrite of the scheduler, but the 
excellent numbers Pierre-Eric showed with his prototype were too 
tempting not to try again.

I don't know if there is a commit message tag for this type of 
collaboration and brain storming, but definitely needs to be recorded 
that it would likely not have happened with him. It is not a classical 
Suggested-by but I think it can be so:

Suggested-by: Pierre-Eric Pelloux-Prayer 
<pierre-eric.pelloux-prayer@amd.com>

(I just need to remember to apply this to the relevant patch on the next 
rebase.)

> On the high level main advantages of the series are:
> 
>   1. Scheduling quality - schedules better than FIFO, solves priority starvation.
>   2. Code simplification - no more multiple run queues and multiple algorithms.
>   3. Virtual GPU time based scheduling enables relatively simple addition
>      of a scheduling cgroup controller in the future.

For the 3rd point here, if people want to play with it, they can grab my 
branch from 
https://gitlab.freedesktop.org/tursulin/kernel/-/commits/drm-sched-cfs-cgroup. 
There amdgpu and xe are wired up with the controller which can be shown 
to work nicely by running for example two instances of something (I used 
Unigine Heaven) in two cgroups and playing with drm.weight properties.

On AMD I could have one instance get 2x GPU time and switch that around 
at will at runtime. One idea is to connect that with window 
foreground/background notifications or similar.

With xe, which uses a bit more limited method of acting on DRM 
controller notifications due firmware being in control of more 
scheduling, the control is a bit more coarse, but it also somewhat works 
for simple use cases.

Regards,

Tvrtko

> There is a little bit more detailed write up on the motivation and results in
> the form of a blog post which may be easier to read:
> https://blogs.igalia.com/tursulin/fair-er-drm-gpu-scheduler/
> 
> First patches add some unit tests which allow for easy evaluation of scheduling
> behaviour against different client submission patterns. From there onwards it is
> hopefully a natural progression of cleanups, enablers, adding the fair policy,
> and finally removing FIFO and RR and simplifying the code base due no more need
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
> Round-robin is the same as fair here.
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
> Here round-robin flavours are the same as FIFO (same starvation issue).
> 
> 3. Same clients but now high versus normal priority.
> 
> Similar behaviour as in the previous one with normal a bit less de-prioritised
> relative to high, than low was against normal.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png
> 
> And again round-robin flavours are the same as FIFO.
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
> https://people.igalia.com/tursulin/drm-sched-fair/4-heavy-vs-interactive.png
> 
> Here round-robin and round-robin rewritten on top of FIFO are best, while FIFO
> is clearly the worst. Fair scheduler is much better than FIFO but not as good as
> RR.
> 
> 5. An even heavier load vs interactive client.
> 
> This one is oversubscribing the GPU by submitting 4x 50ms jobs and waiting for
> only one microsecond before repeating the cycle. Interactive client is the same
> 10% as above.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/4-very-heavy-vs-interactive.png
> 
> Here FIFO is really bad with fair more than twice as good. Round-robin flavours
> are better still.
> 
> 6. Low priority GPU hog versus heavy-interactive.
> 
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
> 
> https://people.igalia.com/tursulin/drm-sched-fair/4-low-hog-vs-interactive.png
> 
> All schedulers appear to handle this equally well.
> 
> As before, I am looking for feedback, ideas for what other kinds of submission
> scenarios to test, testing on different GPUs and of course reviews.
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
> v5:
>   * Rebase on top of latest upstream DRM scheduler changes.
>   * Kerneldoc fixup.
>   * Improve commit message justification for one patch. (Philipp)
>   * Add comment in drm_sched_alloc_wq. (Christian)
> 
> v6:
>   * Rebase for "drm/sched: De-clutter drm_sched_init" getting merged.
>   * Avoid NULL rq dereference from a bad rebase. (Maira)
>   * Added some kerneldoc throughout. (Maira)
>   * Removed some lockdep annotations not belonging to one patch. (Maira)
>   * Use dma_fence_is_signaled in "drm/sched: Avoid double re-lock on the job free path". (Maira, Philipp)
> 
> v7:
>   * Rebase for some prep patches getting merged.
>   * Dropped submit all ready jobs patch.
>   * Fixed 64-bit division in unit tests.
>   * Fixed some more rebase and patch re-ordering mistakes.
>   * Preserve entity RR order when re-entering the queue.
>   * Fine tuned the queue re-enter logic for better behaviour with interactive
>     clients.
>   * Removed some static inlines.
>   * Added more kerneldoc.
>   * Done some benchmarks in the round-robin scheduling modes.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> CC: Leo Liu <Leo.Liu@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> 
> Tvrtko Ursulin (12):
>    drm/sched: Add some scheduling quality unit tests
>    drm/sched: Add some more scheduling quality unit tests
>    drm/sched: Implement RR via FIFO
>    drm/sched: Consolidate entity run queue management
>    drm/sched: Move run queue related code into a separate file
>    drm/sched: Free all finished jobs at once
>    drm/sched: Account entity GPU time
>    drm/sched: Remove idle entity from tree
>    drm/sched: Add fair scheduling policy
>    drm/sched: Break submission patterns with some randomness
>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>    drm/sched: Embed run queue singleton into the scheduler
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>   drivers/gpu/drm/scheduler/Makefile            |   2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c      | 131 ++-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>   drivers/gpu/drm/scheduler/sched_internal.h    |  85 +-
>   drivers/gpu/drm/scheduler/sched_main.c        | 368 +-------
>   drivers/gpu/drm/scheduler/sched_rq.c          | 348 ++++++++
>   drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>   .../gpu/drm/scheduler/tests/tests_scheduler.c | 824 ++++++++++++++++++
>   include/drm/gpu_scheduler.h                   |  30 +-
>   15 files changed, 1393 insertions(+), 462 deletions(-)
>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> 

