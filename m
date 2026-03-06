Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IApHDkCq2msZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15062250BD
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0F710ED8B;
	Fri,  6 Mar 2026 16:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l7xCgYVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACDE10E088;
 Fri,  6 Mar 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HLNZUFCy6FrfzEoqc5VD9cX0Pinhx5t8G21uC9/OrNU=; b=l7xCgYVtjTwrPYw62p8qedMOoq
 aXHQY7gUb0TrOWKlYus8VCaU4fNRdarf2CpjK6kUoZxOlOqPOW/OWx3OLeWmu5BoC5mg1feKJgiof
 JFNENExjgj0VqMu9X5KzuAGmC6ylqTnrfCrTOYc9X96QKcjHQ0pYJDKNcCOThffAJHAeyoZVSWTgt
 4bX8rSf9gM2pPZKaxxGztmL4zEkIMO5WDR6ZbHOWtFciGgaI8lN+ESKX3fR6HzMoiFeRHDc946ezx
 cQyWbywskpgHnJocN86Z41X6tCgPtlC00BG0SZC3Sd2bGyBLtAcdJm6ECsR0p3Tgh6Lpv9POBNYcq
 tHqUjihA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyY8X-00APRL-Uc; Fri, 06 Mar 2026 17:34:50 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <Leo.Liu@amd.com>, Lucas Stach <l.stach@pengutronix.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Subject: [PATCH v7 00/29] Fair(er) DRM scheduler
Date: Fri,  6 Mar 2026 16:34:16 +0000
Message-ID: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: F15062250BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.740];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,mailbox.org:email,intel.com:email,igalia.com:url,igalia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action

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

v4:
 * Rebased, collect ackes and r-b-s receives so far.
 * New patch in the series for handling the new ethosu accel driver.
 * Bump lower priorities lower down in the run queue when they re-join, in order
   to penalize them a bit more than simply making them second in the line to
   run as it was in v3.

v5:
 * Rebased, collect ackes and r-b-s received so far.
 * Fix lost return statement introduced in v2 refactoring.
 * Use virtual runtime based on average job durations when placing the re-
   joining lower priority entity in the run-queue.

v6:
 * Renamed drm_sched_entity_stats_alloc to drm_sched_entity_stats_new.
 * Moved drm_sched_entity_stats_job_add_gpu_time to sched_entity.c.
 * Improved kerneldoc for struct drm_sched_entity_stats.
 * Explained GPU accounting placement in the respective commit text.
 * Removed duplicated sched list assignment int the embedding the run-queue
   patch.

v7:
 * Rebased to catchup with upstream changes.
 * Dropped the two amdgpu dependencies from the series - they have been merged
   and have propagated to drm-next and drm-tip.
 * Applied acks/reviews received since v6.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
CC: Leo Liu <Leo.Liu@amd.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>

Tvrtko Ursulin (29):
  drm/sched: Disallow initializing entities with no schedulers
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
  accel/ethosu: Remove drm_sched_init_args->num_rqs usage
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
 drivers/accel/ethosu/ethosu_job.c             |   1 -
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
 drivers/gpu/drm/scheduler/sched_entity.c      | 163 ++--
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_internal.h    |  70 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 351 +------
 drivers/gpu/drm/scheduler/sched_rq.c          | 379 ++++++++
 drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
 .../gpu/drm/scheduler/tests/mock_scheduler.c  |   1 -
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 884 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c               |   1 -
 drivers/gpu/drm/xe/xe_dep_scheduler.c         |   1 -
 drivers/gpu/drm/xe/xe_execlist.c              |   1 -
 drivers/gpu/drm/xe/xe_gpu_scheduler.c         |   1 -
 include/drm/gpu_scheduler.h                   |  44 +-
 33 files changed, 1497 insertions(+), 481 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

-- 
2.52.0

