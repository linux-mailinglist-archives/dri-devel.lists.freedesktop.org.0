Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C8C07239
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076A310EAC4;
	Fri, 24 Oct 2025 16:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LOilfr96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6847610EABF;
 Fri, 24 Oct 2025 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gy3wejJAVGrUKnl9ect94JFDFXAnb54xSvLjwi8oLks=; b=LOilfr96Wpbi1AaZz2ggKcSV6B
 xqHANZbsq+eTpSKBlWY6MqYQtbvIQfg1FVpZ7FnaVS0JK4s5o81L2+V6oDENGSm33WnvvFO6KOd0W
 I9/o7RhCqRLZfGKgXCEFNt7ZwoqLfCeUZbdh2MS4Pm8aQf9R1qGkMvT+rJbutF9Xk+W+QHTOlU9r4
 PM26qoLQgE4ePG3RTZMh3g6odcOWoyV7WNs5dfDpAYSIvx7qKi1sppH/NtuyOGmLZLkK7QE4u6172
 BpvW2coo5LRx7O++YrPJPTTRAbJnSK8MtfOeyCBo27NvVcjZJubYlmB56yxNlWJhjN3ysCzW4FTRJ
 cW/Bvk+Q==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCKKh-00Ep5S-1D; Fri, 24 Oct 2025 18:08:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Leo Liu <Leo.Liu@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH v3 00/27] Fair DRM scheduler
Date: Fri, 24 Oct 2025 17:07:33 +0100
Message-ID: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

[disclaimer]
Please note that as this series includes patches which touch a good number of
drivers, I did not copy everyone on everything. Assumption is people are
subscribed to dri-devel and for context can look at the whole series there.
[/disclaimer]

As a summary, the new scheduling algorithm is insipired by the original Linux
CFS and so far no scheduling regressions have been found relative to FIFO.
There are improvements in fairness and scheduling of interactive clients when
running in parallel with a heavy GPU load (for example Pierre-Eric has one
viewperf medical test which shows a nice improvement with amdgpu).

On the high level main advantages of the series are:

 1. Scheduling quality - schedules better than FIFO, solves priority starvation.
 2. Code simplification - no more multiple run queues and multiple algorithms.
 3. Virtual GPU time based scheduling enables relatively simple addition
    of a scheduling cgroup controller in the future.

There is a little bit more detailed write up on the motivation and results in
the form of a blog post which may be easier to read:
https://blogs.igalia.com/tursulin/fair-er-drm-gpu-scheduler/

First patches add some unit tests which allow for easy evaluation of scheduling
behaviour against different client submission patterns. From there onwards it is
hopefully a natural progression of cleanups, enablers, adding the fair policy,
and finally removing FIFO and RR and simplifying the code base due no more need
for multiple run queues.

Series is structured in a way where we could apply the first 12 patches (up to
and including "drm/sched: Switch default policy to fair") in one kernel release
and then follow up with the rest of the cleanups after a release or two if
things will be looking fine. Until the remainder of the series would be merged
it would be easy to flip the default algorithm back.

Onto the performance evaluation. As a headline result I have tested three
simultaneous clients on the Steam Deck:

One instance of a deferredmultisampling Vulkan demo running with low priority,
one normal priority instance of the same demo, and the Unigine Heaven benchmark.

With the FIFO scheduler we can see that the low priority client is completely
starved and the GPU time distribution between the other two clients is uneven:

https://people.igalia.com/tursulin/drm-sched-fair/fifo-starvation.png

Switching to the fair scheduler, GPU time distribution is almost equal and the
low priority client does get a small share of the GPU:

https://people.igalia.com/tursulin/drm-sched-fair/fair-no-starvation.png

Moving onto the synthetic submission patterns, they are about two simultaneous
clients which broadly cover the following categories:

 * Deep queue clients
 * Hogs versus interactive
 * Priority handling

Lets look at the results:

1. Two normal priority deep queue clients.

These ones submit one second worth of 8ms jobs. As fast as they can, no
dependencies etc. There is no difference in runtime between FIFO and fair but
the latter allows both clients to progress with work more evenly:

https://people.igalia.com/tursulin/drm-sched-fair/normal-normal.png

(X axis is time, Y is submitted queue-depth, hence lowering of qd corresponds
  with work progress for both clients, tested with both schedulers separately.)

Round-robin is the same as fair here.

2. Same two clients but one is now low priority.

https://people.igalia.com/tursulin/drm-sched-fair/normal-low.png

Normal priority client is a solid line, low priority dotted. We can see how FIFO
completely starves the low priority client until the normal priority is fully
done. Only then the low priority client gets any GPU time.

In constrast, fair scheduler allows some GPU time to the low priority client.

Here round-robin flavours are the same as FIFO (same starvation issue).

3. Same clients but now high versus normal priority.

Similar behaviour as in the previous one with normal a bit less de-prioritised
relative to high, than low was against normal.

https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png

And again round-robin flavours are the same as FIFO.

4. Heavy load vs interactive client.

Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed by a
2.5ms wait. Interactive client emits a 10% GPU load in the format of 1x 1ms job
followed by a 9ms wait.

This simulates an interactive graphical client used on top of a relatively heavy
background load but no GPU oversubscription.

Graphs show the interactive client only and from now on, instead of looking at
the client's queue depth, we look at its "fps".

https://people.igalia.com/tursulin/drm-sched-fair/251008/4-heavy-vs-interactive.png

Here round-robin and round-robin rewritten on top of FIFO are best, with the
fair algorithm being very close. FIFO is clearly the worst.

5. An even heavier load vs interactive client.

This one is oversubscribing the GPU by submitting 4x 50ms jobs and waiting for
only one microsecond before repeating the cycle. Interactive client is the same
10% as above.

https://people.igalia.com/tursulin/drm-sched-fair/251008/4-very-heavy-vs-interactive.png

Here FIFO is even worse and fair is again almost as good as the two round-robin
flavours.

6. Low priority GPU hog versus heavy-interactive.

Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
Interactive client: 1x 0.5ms job followed by a 10ms wait.

https://people.igalia.com/tursulin/drm-sched-fair/251008/4-low-hog-vs-interactive.png

All schedulers appear to handle this almost equally well but FIFO could still be
the last while fair has a slight lead.

As before, I am looking for feedback, ideas for what other kinds of submission
scenarios to test, testing on different GPUs and of course reviews.

v2:
 * Fixed many rebase errors.
 * Added some new patches.
 * Dropped single shot dependecy handling.

v3:
 * Added scheduling quality unit tests.
 * Refined a tiny bit by adding some fairness.
 * Dropped a few patches for now.

v4:
 * Replaced deadline with fair!
 * Refined scheduling quality unit tests.
 * Pulled one cleanup patch earlier.
 * Fixed "drm/sched: Avoid double re-lock on the job free path".

v5:
 * Rebase on top of latest upstream DRM scheduler changes.
 * Kerneldoc fixup.
 * Improve commit message justification for one patch. (Philipp)
 * Add comment in drm_sched_alloc_wq. (Christian)

v6:
 * Rebase for "drm/sched: De-clutter drm_sched_init" getting merged.
 * Avoid NULL rq dereference from a bad rebase. (Maira)
 * Added some kerneldoc throughout. (Maira)
 * Removed some lockdep annotations not belonging to one patch. (Maira)
 * Use dma_fence_is_signaled in "drm/sched: Avoid double re-lock on the job free path". (Maira, Philipp)

v7:
 * Rebase for some prep patches getting merged.
 * Dropped submit all ready jobs patch.
 * Fixed 64-bit division in unit tests.
 * Fixed some more rebase and patch re-ordering mistakes.
 * Preserve entity RR order when re-entering the queue.
 * Fine tuned the queue re-enter logic for better behaviour with interactive
   clients.
 * Removed some static inlines.
 * Added more kerneldoc.
 * Done some benchmarks in the round-robin scheduling modes.

v8:
 * Rebased for upstream changes.
 * Added assert for reverse numerical order of DRM_SCHED_PRIORITY enums.
 * Fixed head of rq priority updates.

*** RFC -> PATCH change log version reset. ***

v9 / v1:
 * RFC -> PATCH for the series as agreed during the XDC.
 * Updated interactive benchmark graphs.
 * Improved handling of interactive clients by replacing the random noise on tie
   approach with the average job duration statistics.
 * Document in code why we track entity GPU stats in a reference counted structures.
 * Document the new structure fields added by the fair policy.
 * Undo some tab vs spaces damage.
 * More accurate wording in the fair policy commit message.
 * Default to fair policy in a separate patch.
 * Renamed drm_sched_rq_select_entity to drm_sched_select_entity and make it only take sched.
 * Fixed kerneldoc after removing scheduling policies and renaming the rq.
 * Reversed arguments of drm_sched_rq_init and cleanup callers. (New patch)
 * Removed unused num_rqs from struct drm_sched_args. (New patches)
 * Unit tests:
   * Added wait duration comments.
   * Data structure comments.
   * Better name for a local variable.
   * Added comment to the short job duration assert.
   * Added comment for cond_resched().
   * Tweaked some comments
   * Added client_done() helper and documented the READ_ONCE.
   * Clarified cycles per second calculation.

v2:
 * Dropped the sched_rq_init() argument re-order patch.
 * Pulled run queue management consolidation patches to start of the series.
 * Drm_sched_rq_get_rr_ts() renamed to drm_sched_rq_next_rr_ts().
 * Added DRM_SCHED_PRIORITY_INVALID local define.
 * Added locking around the ktime_t vruntime read.
 * Expanded comment relating to the unlocked entity->priority read.
 * Expanded comment relating to the unlocked scheduler average job duration read.
 * Various kerneldoc tweaks.
 * Undo some tab vs spaces damage harder.
 * Undo one empty line rebase damage.
 * Reworded commit message for the FIFO and RR removal patch.
 * Various commit message spelling, grammar and typo fixes.
 * Unit tests:
   * Various style changes.
   * More descriptive test names.
   * Print legend for measured metrics.
   * Check for memory allocation failures.

v3:
 * Marked fair policy as default in the correct patch.
 * Further improved comment in drm_sched_rq_update_prio().
 * Moved DRM_SCHED_PRIORITY_INVALID to gpu_scheduler.h.
 * Added description of the GPU time to vruntime scaling factors.
 * Recorded more collected acks.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
CC: Leo Liu <Leo.Liu@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>

Tvrtko Ursulin (27):
  drm/sched: Consolidate entity run queue management
  drm/sched: Move run queue related code into a separate file
  drm/sched: Add some scheduling quality unit tests
  drm/sched: Add some more scheduling quality unit tests
  drm/sched: Implement RR via FIFO
  drm/sched: Free all finished jobs at once
  drm/sched: Account entity GPU time
  drm/sched: Remove idle entity from tree
  drm/sched: Add fair scheduling policy
  drm/sched: Favour interactive clients slightly
  drm/sched: Switch default policy to fair
  drm/sched: Remove FIFO and RR and simplify to a single run queue
  drm/sched: Embed run queue singleton into the scheduler
  accel/amdxdna: Remove drm_sched_init_args->num_rqs usage
  accel/rocket: Remove drm_sched_init_args->num_rqs usage
  drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
  drm/etnaviv: Remove drm_sched_init_args->num_rqs usage
  drm/imagination: Remove drm_sched_init_args->num_rqs usage
  drm/lima: Remove drm_sched_init_args->num_rqs usage
  drm/msm: Remove drm_sched_init_args->num_rqs usage
  drm/nouveau: Remove drm_sched_init_args->num_rqs usage
  drm/panfrost: Remove drm_sched_init_args->num_rqs usage
  drm/panthor: Remove drm_sched_init_args->num_rqs usage
  drm/sched: Remove drm_sched_init_args->num_rqs usage
  drm/v3d: Remove drm_sched_init_args->num_rqs usage
  drm/xe: Remove drm_sched_init_args->num_rqs usage
  drm/sched: Remove drm_sched_init_args->num_rqs

 drivers/accel/amdxdna/aie2_ctx.c              |   1 -
 drivers/accel/rocket/rocket_job.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   1 -
 drivers/gpu/drm/imagination/pvr_queue.c       |   1 -
 drivers/gpu/drm/lima/lima_sched.c             |   1 -
 drivers/gpu/drm/msm/msm_gem_vma.c             |   1 -
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   1 -
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   1 -
 drivers/gpu/drm/panfrost/panfrost_job.c       |   1 -
 drivers/gpu/drm/panthor/panthor_mmu.c         |   1 -
 drivers/gpu/drm/panthor/panthor_sched.c       |   1 -
 drivers/gpu/drm/scheduler/Makefile            |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 131 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_internal.h    |  95 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 401 ++------
 drivers/gpu/drm/scheduler/sched_rq.c          | 381 ++++++++
 drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |   1 -
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 884 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c               |   1 -
 drivers/gpu/drm/xe/xe_dep_scheduler.c         |   1 -
 drivers/gpu/drm/xe/xe_execlist.c              |   1 -
 drivers/gpu/drm/xe/xe_gpu_scheduler.c         |   1 -
 include/drm/gpu_scheduler.h                   |  44 +-
 32 files changed, 1523 insertions(+), 499 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

-- 
2.48.0

