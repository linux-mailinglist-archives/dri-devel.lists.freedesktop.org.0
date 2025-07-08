Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D412AFC76F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6986010E5D2;
	Tue,  8 Jul 2025 09:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kkTIZq/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987E810E155;
 Tue,  8 Jul 2025 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qN89fSksm32elucbuhJee3xSd+VhpQR22G6Is05G6sA=; b=kkTIZq/M0H1uy33YHlshAd5Hci
 i7c3JsN335HqGy6oqmae6mnzqZuJSLPaMgWHPe37p51VCgz33tjvPN/M5+MJlj0By4maGPCKDoy0e
 2OVqCXnc1kpQE3jGEL4wxeneqUMV7Pnd7dLOfJpG7SumqY4Kta/fr4uFIHvbwgM6NWmM3e33EElQm
 WXZwrlmxQ1pgMhtgG2ydZxdmS238EmJE8MEsRg+b63WXFoiW0EnVOkFe+J+gYa+AZaYYpnG77Sdae
 9igBN900Fo1KMD/ugtgfHGzWOajiAN8ZLv/fUeiQe+Bc24oO29mLBYP1WjVC0z7S56iu+Z3nip2ZN
 u1w79Bcg==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ4zO-00Dx34-HK; Tue, 08 Jul 2025 11:51:50 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Leo Liu <Leo.Liu@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH v6 00/15] Fair DRM scheduler
Date: Tue,  8 Jul 2025 10:51:32 +0100
Message-ID: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
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

As a summary, the new scheduling algorithm is insipired by the original Linux
CFS and so far no scheduling regressions have been found. There are improvements
in fairness and scheduling of interactive clients when running in parallel with
a heavy GPU load (for example Pierre-Eric has one viewperf medical test which
shows a nice improvement with amdgpu).

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

As a headline result I have tested three simultaneous clients on the Steam Deck:

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

2. Same two clients but one is now low priority.

https://people.igalia.com/tursulin/drm-sched-fair/normal-low.png

Normal priority client is a solid line, low priority dotted. We can see how FIFO
completely starves the low priority client until the normal priority is fully
done. Only then the low priority client gets any GPU time.

In constrast, fair scheduler allows some GPU time to the low priority client.

3. Same clients but now high versus normal priority.

Similar behaviour as in the previous one with normal a bit less de-prioritised
relative to high, than low was against normal.

https://people.igalia.com/tursulin/drm-sched-fair/high-normal.png

4. Heavy load vs interactive client.

Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed by a
2.5ms wait. Interactive client emits a 10% GPU load in the format of 1x 1ms job
followed by a 9ms wait.

This simulates an interactive graphical client used on top of a relatively heavy
background load but no GPU oversubscription.

Graphs show the interactive client only and from now on, instead of looking at
the client's queue depth, we look at its "fps".

https://people.igalia.com/tursulin/drm-sched-fair/heavy-interactive.png

We can see that fair scheduler allows a higher fps for the interactive client
which is good.

5. An even heavier load vs interactive client.

This one is oversubscribing the GPU by submitting 4x 50ms jobs and waiting for
only one microsecond before repeating the cycle. Interactive client is thje same
10% as above.

https://people.igalia.com/tursulin/drm-sched-fair/veryheavy-interactive.png

Here the difference is even more dramatic with fair scheduler enabling ~3x the
framerate for the interactive client.

6. Low priority GPU hog versus heavy-interactive.

Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
Interactive client: 1x 0.5ms job followed by a 10ms wait.

https://people.igalia.com/tursulin/drm-sched-fair/lowhog-interactive.png

Slight win for the fair scheduler but could be just noise.

7. Last set of test scenarios will have three subgroups.

In all cases we have two interactive (synchronous, single job at a time) clients
with a 50% "duty cycle" GPU time usage.

Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
Client 2: 2.5ms job + 2.5ms wait (aka long bursty)

a) Both normal priority.

https://people.igalia.com/tursulin/drm-sched-fair/5050-short.png
https://people.igalia.com/tursulin/drm-sched-fair/5050-long.png

Both schedulers favour the higher frequency duty cycle with fair giving it a
little bit more which should be good for interactivity.

b) Normal vs low priority.

https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-normal.png
https://people.igalia.com/tursulin/drm-sched-fair/5050-normal-low-low.png

Fair scheduler gives a bit more GPU time to the normal priority client which is
again good.

c) High vs normal priority.

https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-high.png
https://people.igalia.com/tursulin/drm-sched-fair/5050-high-normal-normal.png

Again, fair scheduler gives a bit more share to the higher priority client.

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

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
CC: Leo Liu <Leo.Liu@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>

Tvrtko Ursulin (15):
  drm/sched: Add some scheduling quality unit tests
  drm/sched: Add some more scheduling quality unit tests
  drm/sched: Avoid double re-lock on the job free path
  drm/sched: Consolidate drm_sched_job_timedout
  drm/sched: Consolidate drm_sched_rq_select_entity_rr
  drm/sched: Implement RR via FIFO
  drm/sched: Consolidate entity run queue management
  drm/sched: Move run queue related code into a separate file
  drm/sched: Free all finished jobs at once
  drm/sched: Account entity GPU time
  drm/sched: Remove idle entity from tree
  drm/sched: Add fair scheduling policy
  drm/sched: Remove FIFO and RR and simplify to a single run queue
  drm/sched: Queue all free credits in one worker invocation
  drm/sched: Embed run queue singleton into the scheduler

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
 drivers/gpu/drm/scheduler/Makefile            |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 131 ++-
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_internal.h    | 146 +++-
 drivers/gpu/drm/scheduler/sched_main.c        | 548 +++---------
 drivers/gpu/drm/scheduler/sched_rq.c          | 221 +++++
 drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 815 ++++++++++++++++++
 include/drm/gpu_scheduler.h                   |  31 +-
 15 files changed, 1396 insertions(+), 565 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

-- 
2.48.0

