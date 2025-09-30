Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F415BAD268
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92410E154;
	Tue, 30 Sep 2025 14:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KC5Ca9BT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E5C10E154
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759241603; x=1790777603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oh4HhMwv+PqO4eXX+KGvYQJMFyMhjf/fcWmIu2TKfrM=;
 b=KC5Ca9BTlx22x1DFRk9uA/FeQaJGtBXWzytwrmI1nffzJ3ruLCT8MznV
 6dCC/ikqWhKKc1Bo2i7yeMSycPGbieqAERlbxZuaYghx5ftUDE8Yawrvf
 We9hv3ysWBYszzZyzPDOxIcRzoashc2rFyhiV5Y6MndUlukS5sWtjbVkb
 z5lcqTIiddHpvqpWJ4QEEGnmRoxZFaN8vdcY4H+LirXFK3vkGXycOVuii
 7OKUGAMV9kpWOAsXnkYVWJ+TLlf0/WvHZo7vK0wFoPndg4wMVu+J9mAkg
 Lfo5Rx+dBVaRizld/gUebQHkilGDxK+uGzAWDZv6XUzpveKxcr05DzvN3 Q==;
X-CSE-ConnectionGUID: 3NdCURbITjyUSXRqfDA7fQ==
X-CSE-MsgGUID: kQwXMeyQTx+6w3VQV4kwBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71747908"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="71747908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:13:22 -0700
X-CSE-ConnectionGUID: HtZD0hCpRNqc4kogARBEaw==
X-CSE-MsgGUID: qPN6Z46lQvWXag/QLxF1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="202216149"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:13:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com
Subject: [PATCH 1/1] drm/xe/guc: Document GuC submission backend
Date: Tue, 30 Sep 2025 07:13:16 -0700
Message-Id: <20250930141316.1552516-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930141316.1552516-1-matthew.brost@intel.com>
References: <20250930141316.1552516-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add kernel-doc to xe_guc_submit.c describing the submission path,
the per-queue single-threaded model with pause/resume, the driver shadow
state machine and lost-H2G replay, job timeout handling, recovery flows
(GT reset, PM resume, VF resume), and reclaim constraints.

v2:
 - Mirror tweaks for clarity
 - Add new doc to Xe rst files
v3:
 - Clarify global vs per-queue stop / start
 - Clarify VF resume flow
 - Add section for 'Waiters during VF resume'
 - Add section for 'Page-faulting queues during VF migration'
 - Add section for 'GuC-ID assignment'
 - Add section for 'Reference counting and final queue destruction'
v4:
 - s/VF resume/VF post migration recovery (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/xe/index.rst     |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+)

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 88b22fad880e..692c544b164c 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -28,3 +28,4 @@ DG2, etc is provided to prototype the driver.
    xe_device
    xe-drm-usage-stats.rst
    xe_configfs
+   xe_guc_submit
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 70306f902ba5..cd5e506527fe 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -46,6 +46,288 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+/*
+ * DOC: Overview
+ *
+ * The GuC submission backend is responsible for submitting GPU jobs to the GuC
+ * firmware, assigning per-queue GuC IDs, tracking submission state via a
+ * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
+ * outstanding jobs, managing job timeouts and queue teardown, and providing
+ * recovery when GuC state is lost. It is built on top of the DRM scheduler
+ * (drm_sched).
+ *
+ * GuC ID assignment:
+ * ------------------
+ * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
+ * H2G/G2H to identify the queue and remains reserved until final destruction,
+ * when the GuC is known to hold no references to it.
+ *
+ * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
+ * G2H handlers and to iterate all queues when required (e.g., recovery). This
+ * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
+ * lookups are acceptable in paths where the queue’s lifetime is otherwise
+ * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
+ *
+ * Basic submission flow
+ * ---------------------
+ * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
+ *
+ * 1) Emit the job's ring instructions.
+ * 2) Advance the LRC ring tail:
+ *    - width == 1: simple memory write,
+ *    - width  > 1: append a GuC workqueue (WQ) item.
+ * 3) If the queue is unregistered, issue a register H2G for the context.
+ * 4) Trigger execution via a scheduler enable or context submit command.
+ * 5) Return the job's hardware fence to the DRM scheduler.
+ *
+ * Registration, scheduler enable, and submit commands are issued as host-to-GuC
+ * (H2G) messages over the Command Transport (CT) layer, like all GuC
+ * interactions.
+ *
+ * Completion path
+ * ---------------
+ * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
+ * is called; it drops the job's reference, typically freeing it.
+ *
+ * Control-plane messages:
+ * -----------------------
+ * GuC submission scheduler messages form the control plane for queue cleanup,
+ * toggling runnability, and modifying queue properties (e.g., scheduler
+ * priority, timeslice, preemption timeout). Messages are initiated via queue
+ * vfuncs that append a control message to the queue. They are processed on the
+ * same single-threaded DRM scheduler workqueue that runs ->run_job() and
+ * ->free_job().
+ *
+ * Lockless model:
+ * ---------------
+ * ->run_job(), ->free_job(), and the message handlers execute as work items on
+ * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
+ * mutual exclusion: only one of these items can run at a time. As a result,
+ * these paths are lockless with respect to per-queue state tracking. (Global
+ * or cross-queue data structures still use their own synchronization.)
+ *
+ * Stopping / starting:
+ * --------------------
+ * The submission backend supports two scopes of quiesce control:
+ *
+ *  - Per-queue stop/start:
+ *    The single-threaded DRM scheduler workqueue for a specific queue can be
+ *    stopped and started dynamically. Stopping synchronously quiesces that
+ *    queue's worker (lets any in-flight item finish and prevents new items from
+ *    starting), yielding a stable snapshot while an external operation (e.g.,
+ *    job timeout handling) inspects/updates state and performs any required
+ *    fixups. While stopped, no submission, message, or ->free_job() work runs
+ *    for that queue. When the operation completes, the queue is started; any
+ *    pending items are then processed in order on the same worker. Other queues
+ *    continue to run unaffected.
+ *
+ *  - Global (per-GT) stop/start:
+ *    Implemented on top of the per-queue stop/start primitive: the driver
+ *    stops (or starts) each queue on the GT to obtain a device-wide stable
+ *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
+ *    VF post migration recovery). Queues created while the global stop is in
+ *    effect (i.e., future queues) initialize in the stopped state and remain
+ *    stopped until the global start. After recovery fixups are complete, a
+ *    global start iterates queues to start all eligible ones and resumes normal
+ *    submission.
+ *
+ * State machine:
+ * --------------
+ * The submission state machine is the driver's shadow of the GuC-visible queue
+ * state (e.g., registered, runnable, scheduler properties). It tracks the
+ * transitions we intend to make (issued as H2G commands), marking them pending
+ * until acknowledged via G2H or otherwise observed as applied. It also records
+ * the origin of each transition (->run_job(), timeout handler, explicit control
+ * message, etc.).
+ *
+ * Because H2G commands and/or GuC submission state can be lost across GT reset,
+ * PM resume, or VF post migration recovery, this bookkeeping lets recovery
+ * decide which operations to replay, which to elide, and which need fixups,
+ * restoring a consistent queue state without additional per-queue locks.
+ *
+ * Job timeouts:
+ * -------------
+ * To prevent jobs from running indefinitely and violating dma-fence signaling
+ * rules, the DRM scheduler tracks how long each job has been running. If a
+ * threshold is exceeded, it calls ->timeout_job().
+ *
+ * ->timeout_job() stops the queue, samples the LRC context timestamps to
+ * confirm the job actually started and has exceeded the allowed runtime, and
+ * then, if confirmed, signals all pending jobs' fences and initiates queue
+ * teardown. Finally, the queue is started.
+ *
+ * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
+ * that is shared with other recovery paths (e.g., GT reset handling, VF
+ * resume). This guarantees only one recovery action executes at a time.
+ *
+ * Queue teardown:
+ * ---------------
+ * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
+ * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
+ * in-flight jobs detected on the queue during GT reset.
+ *
+ * In all cases teardown is driven via the timeout path by setting the queue's
+ * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
+ *
+ * Reference counting and final queue destruction:
+ * -----------------------------------------------
+ * Jobs reference-count the queue; queues hold a reference to the VM. When a
+ * queue's reference count reaches zero (e.g., all jobs are freed and the
+ * userspace handle is closed), the queue is not destroyed immediately because
+ * the GuC may still reference its state.
+ *
+ * Instead, a control-plane cleanup message is appended to remove GuC-side
+ * references (e.g., disable runnability, deregister). Once the final G2H
+ * confirming that GuC no longer references the queue is eligible for
+ * destruction.
+ *
+ * To avoid freeing the queue from within its own DRM scheduler workqueue (which
+ * would risk use-after-free), the actual destruction is deferred to a separate
+ * work item queued on a dedicated destruction workqueue.
+ *
+ * GT resets:
+ * ----------
+ * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
+ * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
+ * as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues (global submission stop). Per-queue workers finish any
+ *      in-flight item and then stop; newly created queues during the window
+ *      initialize in the stopped state.
+ *    - Abort any waits on CT/G2H to avoid deadlock.
+ *
+ * 2) Sanitize driver shadow state:
+ *    - For each queue, clear GuC-derived bits in the submission state machine
+ *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
+ *    - Convert/flush any side effects of lost H2G.
+ *
+ * 3) Decide teardown vs. replay:
+ *    - If a queue's LRC seqno indicates that a job started but did not
+ *      complete, initiate teardown for that queue via the timeout path.
+ *    - If no job started, keep the queue for replay.
+ *
+ * 4) Resume:
+ *    - Start remaining queues; resubmit pending jobs.
+ *    - Queues marked for teardown remain stopped/destroyed.
+ *
+ * The entire sequence runs on the per-GT single-threaded recovery worker,
+ * ensuring only one recovery action executes at a time; a runtime PM reference
+ * is held for the duration.
+ *
+ * PM resume:
+ * ----------
+ * PM resume assumes all GuC state is lost (the device may have been powered
+ * down). It reuses the GT reset recovery path, but executes in the context of
+ * the caller that wakes the device (runtime PM or system resume).
+ *
+ * Suspend entry:
+ *  - Control-plane message work is quiesced; state toggles that require an
+ *    active device are not enqueued while suspended.
+ *  - Per-queue scheduler workers are stopped before the device is allowed to
+ *    suspend.
+ *  - Barring driver bugs, no queues should have in-flight jobs at
+ *    suspend/resume..
+ *
+ * On resume, run the GT reset recovery flow and then start eligible queues.
+ *
+ * Runtime PM and state-change ordering:
+ * -------------------------------------
+ * Runtime/system PM transitions must not race with per-queue submission and
+ * state updates.
+ *
+ * Execution contexts and RPM sources:
+ *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
+ *    executed with an active RPM ref held by the in-flight job.
+ *  - Control-plane message work:
+ *    enqueued from IOCTL paths that already hold an RPM ref; the message path
+ *    itself does not get/put RPM. State toggles are only issued while active.
+ *    During suspend entry, message work is quiesced and no new toggles are
+ *    enqueued until after resume.
+ *  - G2H handlers:
+ *    dispatched with an RPM ref guaranteed by the CT layer.
+ *  - Recovery phases (GT reset/VF post migration recovery):
+ *    explicitly get/put an RPM ref for their duration on the per-GT recovery
+ *    worker.
+ *
+ * Consequence:
+ *  - All submission/state mutations run with an RPM reference. The PM core
+ *    cannot enter suspend while these updates are in progress, and resume is
+ *    complete before updates execute. This prevents PM state changes from
+ *    racing with queue state changes.
+ *
+ * VF post migration recovery:
+ * ---------------------------
+ * VF post migration recovery resembles a GT reset, but GuC submission state is
+ * expected to persist across migration; in-flight H2G commands may be lost, and
+ * GGTT base/offsets may change. Recovery proceeds as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
+ *      snapshot.
+ *    - Queues created while VF post migration recovery is in-flight initialize
+ *      in the stopped state.
+ *
+ * 2) Treat H2G as lost and prepare in-place resubmission (GuC/CT down):
+ *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
+ *      bits to a safe baseline and tag the ops as "needs replay".
+ *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
+ *      tail equal to the head (and, for WQ-based submission, set the WQ
+ *      descriptor head == tail) so that when the GuC comes up it will not process
+ *      any entries that were built with stale GGTT addresses.
+ *    - Reset the software ring tail to the original value captured at the
+ *      submission of the oldest pending job, so the write pointer sits exactly
+ *      where that job was originally emitted.
+ *
+ * 3) Replay and resubmit once GuC/CT is live:
+ *    - VF post migration recovery invokes ->run_job() for pending jobs;
+ *      ->emit_job() overwrites ring instructions in place, fixes GGTT fields,
+ *      then advances the LRC tail (and WQ descriptor for width > 1). Required
+ *      submission H2G(s) are reissued and fresh WQ entries are written.
+ *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
+ *      in order via the message path.
+ *    - Start the queues to process the queued control-plane operations and run
+ *      the resubmitted jobs.
+ *
+ * The goal is to preserve both job and queue state; no teardown is performed
+ * in this flow. The sequence runs on the per-GT single-threaded recovery
+ * worker with a held runtime PM reference.
+ *
+ * Waiters during VF post migration recovery
+ * -----------------------------------------
+ * The submission backend frequently uses wait_event_timeout() to wait on
+ * GuC-driven conditions. Across VF migration/recovery two issues arise:
+ * 1) The timeout does not account for migration downtime and may expire
+ *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
+ *    signaling a fence).
+ * 2) Some waits target GuC work that cannot complete until VF recovery
+ *    finishes; these typically sit on the queue-stopping path.
+ *
+ * To handle this, all waiters must atomically test the "GuC down / VF-recovery
+ * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
+ * after wakeup. The flag is coherent with VF migration: vCPUs observe it
+ * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
+ * If set, the waiter must either (a) abort the wait without side effects, or
+ * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
+ * that occur while GuC/CT are down are non-fatal—the VF-recovery path will
+ * rebuild state—and must not trigger recovery or teardown.
+ *
+ * Relation to reclaim:
+ * --------------------
+ * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
+ * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
+ * message handling, and all recovery paths) lies on the reclaim path and must
+ * be reclaim-safe.
+ *
+ * Practical implications:
+ * - No memory allocations in these paths (avoid any allocation that could
+ *   recurse into reclaim or sleep).
+ * - The global submission-state lock may be taken from reclaim-tainted contexts
+ *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
+ *   must not allocate or take locks that can recurse into reclaim while holding
+ *   it; keep the critical section to state/xarray updates.
+ */
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
-- 
2.34.1

