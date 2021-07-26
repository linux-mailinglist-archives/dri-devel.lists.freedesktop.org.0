Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E23D67CF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 22:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0373040;
	Mon, 26 Jul 2021 20:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94996E8D5;
 Mon, 26 Jul 2021 19:08:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199486856"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="199486856"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 12:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="566278086"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2021 12:08:28 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/15] drm/i915/guc: SQUASHED PATCH - DO NOT REVIEW
Date: Mon, 26 Jul 2021 12:07:46 -0700
Message-Id: <20210726190800.26762-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jul 2021 20:02:32 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Fernando Pacheco <fernando.pacheco@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jose Souza <jose.souza@intel.com>,
 Rahul Kumar Singh <rahul.kumar.singh@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

From the series here - https://patchwork.freedesktop.org/series/92984/
and in review here - https://patchwork.freedesktop.org/series/92912/

Implement GuC virtual engines. Rather simple implementation, basically
just allocate an engine, setup context enter / exit function to virtual
engine specific functions, set all other variables / functions to guc
versions, and set the engine mask to that of all the siblings.

v2: Update to work with proto-ctx
v3:
 (Daniele)
  - Drop include, add comment to intel_virtual_engine_has_heartbeat

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/i915/guc: Make hangcheck work with GuC virtual engines

The serial number tracking of engines happens at the backend of
request submission and was expecting to only be given physical
engines. However, in GuC submission mode, the decomposition of virtual
to physical engines does not happen in i915. Instead, requests are
submitted to their virtual engine mask all the way through to the
hardware (i.e. to GuC). This would mean that the heart beat code
thinks the physical engines are idle due to the serial number not
incrementing. Which in turns means hangcheck does not work for
GuC virtual engines.

This patch updates the tracking to decompose virtual engines into
their physical constituents and tracks the request against each. This
is not entirely accurate as the GuC will only be issuing the request
to one physical engine. However, it is the best that i915 can do given
that it has no knowledge of the GuC's scheduling decisions.

Downside of this is that all physical engines constituting a GuC
virtual engine will be periodically unparked (even during just a single
context executing) in order to be pinged with a heartbeat request.
However the power and performance cost of this is not expected to be
measurable (due low frequency of heartbeat pulses) and it is considered
an easier option than trying to make changes to GuC firmware.

v2:
 (Tvrtko)
  - Update commit message
  - Have default behavior if no vfunc present

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915: Hold reference to intel_context over life of i915_request

Hold a reference to the intel_context over life of an i915_request.
Without this an i915_request can exist after the context has been
destroyed (e.g. request retired, context closed, but user space holds a
reference to the request from an out fence). In the case of GuC
submission + virtual engine, the engine that the request references is
also destroyed which can trigger bad pointer dref in fence ops (e.g.
i915_fence_get_driver_name). We could likely change
i915_fence_get_driver_name to avoid touching the engine but let's just
be safe and hold the intel_context reference.

v2:
 (John Harrison)
  - Update comment explaining how GuC mode and execlists mode deal with
    virtual engines differently

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Disable bonding extension with GuC submission

Update the bonding extension to return -ENODEV when using GuC submission
as this extension fundamentally will not work with the GuC submission
interface.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs

With GuC virtual engines the physical engine which a request executes
and completes on isn't known to the i915. Therefore we can't attach a
request to a physical engines breadcrumbs. To work around this we create
a single breadcrumbs per engine class when using GuC submission and
direct all physical engine interrupts to this breadcrumbs.

v2:
 (John H)
  - Rework header file structure so intel_engine_mask_t can be in
    intel_engine_types.h

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915: Add i915_sched_engine destroy vfunc

This is required to allow backend specific cleanup

v2:
 (John H)
  - Rework commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915: Move active request tracking to a vfunc

Move active request tracking to a backend vfunc rather than assuming all
backends want to do this in the manner. In the of case execlists /
ring submission the tracking is on the physical engine while with GuC
submission it is on the context.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Reset implementation for new GuC interface

Reset implementation for new GuC interface. This is the legacy reset
implementation which is called when the i915 owns the engine hang check.
Future patches will offload the engine hang check to GuC but we will
continue to maintain this legacy path as a fallback and this code path
is also required if the GuC dies.

With the new GuC interface it is not possible to reset individual
engines - it is only possible to reset the GPU entirely. This patch
forces an entire chip reset if any engine hangs.

v2:
 (Michal)
  - Check for -EPIPE rather than -EIO (CT deadlock/corrupt check)
v3:
 (John H)
  - Split into a series of smaller patches
v4:
 (John H)
  - Fix typo
  - Add braces around if statements in reset code
v5:
 (Checkpatch)
  - Fix warnings

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

drm/i915: Reset GPU immediately if submission is disabled

If submission is disabled by the backend for any reason, reset the GPU
immediately in the heartbeat code as the backend can't be reenabled
until the GPU is reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Add disable interrupts to guc sanitize

Add disable GuC interrupts to intel_guc_sanitize(). Part of this
requires moving the guc_*_interrupt wrapper function into header file
intel_guc.h.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Suspend/resume implementation for new interface

The new GuC interface introduces an MMIO H2G command,
INTEL_GUC_ACTION_RESET_CLIENT, which is used to implement suspend. This
MMIO tears down any active contexts generating a context reset G2H CTB
for each. Once that step completes the GuC tears down the CTB
channels. It is safe to suspend once this MMIO H2G command completes
and all G2H CTBs have been processed. In practice the i915 will likely
never receive a G2H as suspend should only be called after the GPU is
idle.

Resume is implemented in the same manner as before - simply reload the
GuC firmware and reinitialize everything (e.g. CTB channels, contexts,
etc..).

v2:
 (Michel / John H)
  - INTEL_GUC_ACTION_RESET_CLIENT 0x5B01 -> 0x5507

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Handle context reset notification

GuC will issue a reset on detecting an engine hang and will notify
the driver via a G2H message. The driver will service the notification
by resetting the guilty context to a simple state or banning it
completely.

v2:
 (John Harrison)
  - Move msg[0] lookup after length check
v3:
 (John Harrison)
  - s/drm_dbg/drm_err

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Handle engine reset failure notification

GuC will notify the driver, via G2H, if it fails to
reset an engine. We recover by resorting to a full GPU
reset.

v2:
 (John Harrison):
  - s/drm_dbg/drm_err

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Enable the timer expired interrupt for GuC

The GuC can implement execution qunatums, detect hung contexts and
other such things but it requires the timer expired interrupt to do so.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Provide mmio list to be saved/restored on engine reset

The driver must provide GuC with a list of mmio registers
that should be saved/restored during a GuC-based engine reset.
Unfortunately, the list must be dynamically allocated as its size is
variable. That means the driver must generate the list twice - once to
work out the size and a second time to actually save it.

v2:
 (Alan / CI)
  - GEN7_GT_MODE -> GEN6_GT_MODE to fix WA selftest failure

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Don't complain about reset races

It is impossible to seal all race conditions of resets occurring
concurrent to other operations. At least, not without introducing
excesive mutex locking. Instead, don't complain if it occurs. In
particular, don't complain if trying to send a H2G during a reset.
Whatever the H2G was about should get redone once the reset is over.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Enable GuC engine reset

Clear the 'disable resets' flag to allow GuC to reset hung contexts
(detected via pre-emption timeout).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Capture error state on context reset

We receive notification of an engine reset from GuC at its
completion. Meaning GuC has potentially cleared any HW state
we may have been interested in capturing. GuC resumes scheduling
on the engine post-reset, as the resets are meant to be transparent,
further muddling our error state.

There is ongoing work to define an API for a GuC debug state dump. The
suggestion for now is to manually disable FW initiated resets in cases
where debug state is needed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Fix for error capture after full GPU reset with GuC

In the case of a full GPU reset (e.g. because GuC has died or because
GuC's hang detection has been disabled), the driver can't rely on GuC
reporting the guilty context. Instead, the driver needs to scan all
active contexts and find one that is currently executing, as per the
execlist mode behaviour. In GuC mode, this scan is different to
execlist mode as the active request list is handled very differently.

Similarly, the request state dump in debugfs needs to be handled
differently when in GuC submission mode.

Also refactured some of the request scanning code to avoid duplication
across the multiple code paths that are now replicating it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Hook GuC scheduling policies up

Use the official driver default scheduling policies for configuring
the GuC scheduler rather than a bunch of hardcoded values.

v2:
 (Matthew Brost)
  - Move I915_ENGINE_WANT_FORCED_PREEMPTION to later patch

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

drm/i915/guc: Connect reset modparam updates to GuC policy flags

Changing the reset module parameter has no effect on a running GuC.
The corresponding entry in the ADS must be updated and then the GuC
informed via a Host2GuC message.

The new debugfs interface to module parameters allows this to happen.
However, connecting the parameter data address back to anything useful
is messy. One option would be to pass a new private data structure
address through instead of just the parameter pointer. However, that
means having a new (and different) data structure for each parameter
and a new (and different) write function for each parameter. This
method keeps everything generic by instead using a string lookup on
the directory entry name.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Include scheduling policies in the debugfs state dump

Added the scheduling policy parameters to the 'guc_info' debugfs state
dump.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Add golden context to GuC ADS

The media watchdog mechanism involves GuC doing a silent reset and
continue of the hung context. This requires the i915 driver provide a
golden context to GuC in the ADS.

v2:
 (Matthew Brost):
  - Fix memory corruption in shmem_read
 (John H)
  - Use locals rather than defines for LR_* + SKIP_SIZE

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Implement banned contexts for GuC submission

When using GuC submission, if a context gets banned disable scheduling
and mark all inflight requests as complete.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

drm/i915/guc: Support request cancellation

This adds GuC backend support for i915_request_cancel(), which in turn
makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.

This implementation makes use of fence while there are likely simplier
options. A fence was chosen because of another feature coming soon
which requires a user to block on a context until scheduling is
disabled. In that case we return the fence to the user and the user can
wait on that fence.

v2:
 (Daniele)
  - A comment about locking the blocked incr / decr
  - A comments about the use of the fence
  - Update commit message explaining why fence
  - Delete redundant check blocked count in unblock function
  - Ring buffer implementation
  - Comment about blocked in submission path
  - Shorter rpm path

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

drm/i915/selftest: Better error reporting from hangcheck selftest

There are many ways in which the hangcheck selftest can fail. Very few
of them actually printed an error message to say what happened. So,
fill in the missing messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/i915/selftest: Fix workarounds selftest for GuC submission

When GuC submission is enabled, the GuC controls engine resets. Rather
than explicitly triggering a reset, the driver must submit a hanging
context to GuC and wait for the reset to occur.

Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/selftest: Fix MOCS selftest for GuC submission

When GuC submission is enabled, the GuC controls engine resets. Rather
than explicitly triggering a reset, the driver must submit a hanging
context to GuC and wait for the reset to occur.

Signed-off-by: Rahul Kumar Singh <rahul.kumar.singh@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/selftest: Increase some timeouts in live_requests

Requests may take slightly longer with GuC submission, let's increase
the timeouts in live_requests.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/selftest: Fix hangcheck self test for GuC submission

When GuC submission is enabled, the GuC controls engine resets. Rather
than explicitly triggering a reset, the driver must submit a hanging
context to GuC and wait for the reset to occur.

Conversely, one of the tests specifically sends hanging batches to the
engines but wants them to sit around until a manual reset of the full
GT (including GuC itself). That means disabling GuC based engine
resets to prevent those from killing the hanging batch too soon. So,
add support to the scheduling policy helper for disabling resets as
well as making them quicker!

In GuC submission mode, the 'is engine idle' test basically turns into
'is engine PM wakelock held'. Independently, there is a heartbeat
disable helper function that the tests use. For unexplained reasons,
this acquires the engine wakelock before disabling the heartbeat and
only releases it when re-enabling the heartbeat. As one of the tests
tries to do a wait for idle in the middle of a heartbeat disabled
section, it is therefore guaranteed to always fail. Added a 'no_pm'
variant of the heartbeat helper that allows the engine to be asleep
while also having heartbeats disabled.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

drm/i915/selftest: Bump selftest timeouts for hangcheck

Some testing environments and some heavier tests are slower than
previous limits allowed for. For example, it can take multiple seconds
for the 'context has been reset' notification handler to reach the
'kill the requests' code in the 'active' version of the 'reset
engines' test. During which time the selftest gets bored, gives up
waiting and fails the test.

There is also an async thread that the selftest uses to pump work
through the hardware in parallel to the context that is marked for
reset. That also could get bored waiting for completions and kill the
test off.

Lastly, the flush at the of various test sections can also see
timeouts due to the large amount of work backed up. This is also true
of the live_hwsp_read test.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

drm/i915/guc: Implement GuC priority management

Implement a simple static mapping algorithm of the i915 priority levels
(int, -1k to 1k exposed to user) to the 4 GuC levels. Mapping is as
follows:

i915 level < 0          -> GuC low level     (3)
i915 level == 0         -> GuC normal level  (2)
i915 level < INT_MAX    -> GuC high level    (1)
i915 level == INT_MAX   -> GuC highest level (0)

We believe this mapping should cover the UMD use cases (3 distinct user
levels + 1 kernel level).

In addition to static mapping, a simple counter system is attached to
each context tracking the number of requests inflight on the context at
each level. This is needed as the GuC levels are per context while in
the i915 levels are per request.

v2:
 (Daniele)
  - Add BUILD_BUG_ON to enforce ordering of priority levels
  - Add missing lockdep to guc_prio_fini
  - Check for return before setting context registered flag
  - Map DISPLAY priority or higher to highest guc prio
  - Update comment for guc_prio

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/i915/guc: Unblock GuC submission on Gen11+

Unblock GuC submission on Gen11+ platforms.

v2:
 (Martin Peres / John H)
  - Delete debug message when GuC is disabled by default on certain
    platforms

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   15 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   16 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |   36 +
 drivers/gpu/drm/i915/gt/intel_context.h       |   23 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   31 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   57 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  183 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   70 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |    4 +
 .../drm/i915/gt/intel_execlists_submission.c  |   89 +-
 .../drm/i915/gt/intel_execlists_submission.h  |    4 -
 drivers/gpu/drm/i915/gt/intel_gt.c            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   50 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   58 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   34 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   22 +
 .../drm/i915/gt/selftest_engine_heartbeat.h   |    2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  322 +++-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   50 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  132 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   38 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  464 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   11 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |    2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 1600 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  101 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |    6 +
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   32 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
 drivers/gpu/drm/i915/i915_reg.h               |    1 +
 drivers/gpu/drm/i915/i915_request.c           |  162 +-
 drivers/gpu/drm/i915/i915_request.h           |   21 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   16 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   10 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   22 +
 drivers/gpu/drm/i915/i915_trace.h             |   37 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |   88 +
 .../i915/selftests/intel_scheduler_helpers.h  |   33 +
 include/uapi/drm/i915_drm.h                   |    9 +
 55 files changed, 3488 insertions(+), 634 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 10b3bb6207ba..ab7679957623 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -280,6 +280,7 @@ i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
 i915-$(CONFIG_DRM_I915_SELFTEST) += \
 	gem/selftests/i915_gem_client_blt.o \
 	gem/selftests/igt_gem_utils.o \
+	selftests/intel_scheduler_helpers.o \
 	selftests/i915_random.o \
 	selftests/i915_selftest.o \
 	selftests/igt_atomic.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 89ca401bf9ae..05c3ee191710 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -74,7 +74,6 @@
 #include "gt/intel_context_param.h"
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_engine_user.h"
-#include "gt/intel_execlists_submission.h" /* virtual_engine */
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
@@ -363,9 +362,6 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
 	if (!HAS_EXECLISTS(i915))
 		return -ENODEV;
 
-	if (intel_uc_uses_guc_submission(&i915->gt.uc))
-		return -ENODEV; /* not implement yet */
-
 	if (get_user(idx, &ext->engine_index))
 		return -EFAULT;
 
@@ -495,6 +491,11 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
 		return -EINVAL;
 	}
 
+	if (intel_engine_uses_guc(master)) {
+		DRM_DEBUG("bonding extension not supported with GuC submission");
+		return -ENODEV;
+	}
+
 	if (get_user(num_bonds, &ext->num_bonds))
 		return -EFAULT;
 
@@ -950,8 +951,8 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 			break;
 
 		case I915_GEM_ENGINE_TYPE_BALANCED:
-			ce = intel_execlists_create_virtual(pe[n].siblings,
-							    pe[n].num_siblings);
+			ce = intel_engine_create_virtual(pe[n].siblings,
+							 pe[n].num_siblings);
 			break;
 
 		case I915_GEM_ENGINE_TYPE_INVALID:
@@ -1083,7 +1084,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
 	for_each_gem_engine(ce, engines, it) {
 		struct intel_engine_cs *engine;
 
-		if (ban && intel_context_set_banned(ce))
+		if (ban && intel_context_ban(ce, NULL))
 			continue;
 
 		/*
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 38cc42783dfb..209cf265bf74 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -15,28 +15,14 @@
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
 
-static bool irq_enable(struct intel_engine_cs *engine)
+static bool irq_enable(struct intel_breadcrumbs *b)
 {
-	if (!engine->irq_enable)
-		return false;
-
-	/* Caller disables interrupts */
-	spin_lock(&engine->gt->irq_lock);
-	engine->irq_enable(engine);
-	spin_unlock(&engine->gt->irq_lock);
-
-	return true;
+	return intel_engine_irq_enable(b->irq_engine);
 }
 
-static void irq_disable(struct intel_engine_cs *engine)
+static void irq_disable(struct intel_breadcrumbs *b)
 {
-	if (!engine->irq_disable)
-		return;
-
-	/* Caller disables interrupts */
-	spin_lock(&engine->gt->irq_lock);
-	engine->irq_disable(engine);
-	spin_unlock(&engine->gt->irq_lock);
+	intel_engine_irq_disable(b->irq_engine);
 }
 
 static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
@@ -57,7 +43,7 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 	WRITE_ONCE(b->irq_armed, true);
 
 	/* Requests may have completed before we could enable the interrupt. */
-	if (!b->irq_enabled++ && irq_enable(b->irq_engine))
+	if (!b->irq_enabled++ && b->irq_enable(b))
 		irq_work_queue(&b->irq_work);
 }
 
@@ -76,7 +62,7 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
 	GEM_BUG_ON(!b->irq_enabled);
 	if (!--b->irq_enabled)
-		irq_disable(b->irq_engine);
+		b->irq_disable(b);
 
 	WRITE_ONCE(b->irq_armed, false);
 	intel_gt_pm_put_async(b->irq_engine->gt);
@@ -259,6 +245,9 @@ static void signal_irq_work(struct irq_work *work)
 			llist_entry(signal, typeof(*rq), signal_node);
 		struct list_head cb_list;
 
+		if (rq->engine->sched_engine->retire_inflight_request_prio)
+			rq->engine->sched_engine->retire_inflight_request_prio(rq);
+
 		spin_lock(&rq->lock);
 		list_replace(&rq->fence.cb_list, &cb_list);
 		__dma_fence_signal__timestamp(&rq->fence, timestamp);
@@ -281,7 +270,7 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
 	if (!b)
 		return NULL;
 
-	b->irq_engine = irq_engine;
+	kref_init(&b->ref);
 
 	spin_lock_init(&b->signalers_lock);
 	INIT_LIST_HEAD(&b->signalers);
@@ -290,6 +279,10 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
 	spin_lock_init(&b->irq_lock);
 	init_irq_work(&b->irq_work, signal_irq_work);
 
+	b->irq_engine = irq_engine;
+	b->irq_enable = irq_enable;
+	b->irq_disable = irq_disable;
+
 	return b;
 }
 
@@ -303,9 +296,9 @@ void intel_breadcrumbs_reset(struct intel_breadcrumbs *b)
 	spin_lock_irqsave(&b->irq_lock, flags);
 
 	if (b->irq_enabled)
-		irq_enable(b->irq_engine);
+		b->irq_enable(b);
 	else
-		irq_disable(b->irq_engine);
+		b->irq_disable(b);
 
 	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
@@ -325,11 +318,14 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
 	}
 }
 
-void intel_breadcrumbs_free(struct intel_breadcrumbs *b)
+void intel_breadcrumbs_free(struct kref *kref)
 {
+	struct intel_breadcrumbs *b = container_of(kref, typeof(*b), ref);
+
 	irq_work_sync(&b->irq_work);
 	GEM_BUG_ON(!list_empty(&b->signalers));
 	GEM_BUG_ON(b->irq_armed);
+
 	kfree(b);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
index 3ce5ce270b04..be0d4f379a85 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
@@ -9,7 +9,7 @@
 #include <linux/atomic.h>
 #include <linux/irq_work.h>
 
-#include "intel_engine_types.h"
+#include "intel_breadcrumbs_types.h"
 
 struct drm_printer;
 struct i915_request;
@@ -17,7 +17,7 @@ struct intel_breadcrumbs;
 
 struct intel_breadcrumbs *
 intel_breadcrumbs_create(struct intel_engine_cs *irq_engine);
-void intel_breadcrumbs_free(struct intel_breadcrumbs *b);
+void intel_breadcrumbs_free(struct kref *kref);
 
 void intel_breadcrumbs_reset(struct intel_breadcrumbs *b);
 void __intel_breadcrumbs_park(struct intel_breadcrumbs *b);
@@ -48,4 +48,16 @@ void i915_request_cancel_breadcrumb(struct i915_request *request);
 void intel_context_remove_breadcrumbs(struct intel_context *ce,
 				      struct intel_breadcrumbs *b);
 
+static inline struct intel_breadcrumbs *
+intel_breadcrumbs_get(struct intel_breadcrumbs *b)
+{
+	kref_get(&b->ref);
+	return b;
+}
+
+static inline void intel_breadcrumbs_put(struct intel_breadcrumbs *b)
+{
+	kref_put(&b->ref, intel_breadcrumbs_free);
+}
+
 #endif /* __INTEL_BREADCRUMBS__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
index 3a084ce8ff5e..72dfd3748c4c 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
@@ -7,10 +7,13 @@
 #define __INTEL_BREADCRUMBS_TYPES__
 
 #include <linux/irq_work.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "intel_engine_types.h"
+
 /*
  * Rather than have every client wait upon all user interrupts,
  * with the herd waking after every interrupt and each doing the
@@ -29,6 +32,7 @@
  * the overhead of waking that client is much preferred.
  */
 struct intel_breadcrumbs {
+	struct kref ref;
 	atomic_t active;
 
 	spinlock_t signalers_lock; /* protects the list of signalers */
@@ -42,7 +46,10 @@ struct intel_breadcrumbs {
 	bool irq_armed;
 
 	/* Not all breadcrumbs are attached to physical HW */
+	intel_engine_mask_t	engine_mask;
 	struct intel_engine_cs *irq_engine;
+	bool	(*irq_enable)(struct intel_breadcrumbs *b);
+	void	(*irq_disable)(struct intel_breadcrumbs *b);
 };
 
 #endif /* __INTEL_BREADCRUMBS_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index baa05fddd690..477c42d7d693 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -366,6 +366,12 @@ static int __intel_context_active(struct i915_active *active)
 	return 0;
 }
 
+static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
+				 enum i915_sw_fence_notify state)
+{
+	return NOTIFY_DONE;
+}
+
 void
 intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 {
@@ -393,9 +399,19 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 
+	spin_lock_init(&ce->guc_active.lock);
+	INIT_LIST_HEAD(&ce->guc_active.requests);
+
 	ce->guc_id = GUC_INVALID_LRC_ID;
 	INIT_LIST_HEAD(&ce->guc_id_link);
 
+	/*
+	 * Initialize fence to be complete as this is expected to be complete
+	 * unless there is a pending schedule disable outstanding.
+	 */
+	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
+	i915_sw_fence_commit(&ce->guc_blocked);
+
 	i915_active_init(&ce->active,
 			 __intel_context_active, __intel_context_retire, 0);
 }
@@ -506,6 +522,26 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 	return rq;
 }
 
+struct i915_request *intel_context_find_active_request(struct intel_context *ce)
+{
+	struct i915_request *rq, *active = NULL;
+	unsigned long flags;
+
+	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
+
+	spin_lock_irqsave(&ce->guc_active.lock, flags);
+	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
+				    sched.link) {
+		if (i915_request_completed(rq))
+			break;
+
+		active = rq;
+	}
+	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+
+	return active;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 974ef85320c2..876bdb08303c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -16,6 +16,7 @@
 #include "intel_engine_types.h"
 #include "intel_ring_types.h"
 #include "intel_timeline_types.h"
+#include "i915_trace.h"
 
 #define CE_TRACE(ce, fmt, ...) do {					\
 	const struct intel_context *ce__ = (ce);			\
@@ -69,6 +70,13 @@ intel_context_is_pinned(struct intel_context *ce)
 	return atomic_read(&ce->pin_count);
 }
 
+static inline void intel_context_cancel_request(struct intel_context *ce,
+						struct i915_request *rq)
+{
+	GEM_BUG_ON(!ce->ops->cancel_request);
+	return ce->ops->cancel_request(ce, rq);
+}
+
 /**
  * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
  * @ce - the context
@@ -200,6 +208,9 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
 
 struct i915_request *intel_context_create_request(struct intel_context *ce);
 
+struct i915_request *
+intel_context_find_active_request(struct intel_context *ce);
+
 static inline bool intel_context_is_barrier(const struct intel_context *ce)
 {
 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
@@ -240,6 +251,18 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
 	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
 }
 
+static inline bool intel_context_ban(struct intel_context *ce,
+				     struct i915_request *rq)
+{
+	bool ret = intel_context_set_banned(ce);
+
+	trace_intel_context_ban(ce);
+	if (ce->ops->ban)
+		ce->ops->ban(ce, rq);
+
+	return ret;
+}
+
 static inline bool
 intel_context_force_single_submission(const struct intel_context *ce)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 4a5518d295c2..fe555551c2d2 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -13,12 +13,14 @@
 #include <linux/types.h>
 
 #include "i915_active_types.h"
+#include "i915_sw_fence.h"
 #include "i915_utils.h"
 #include "intel_engine_types.h"
 #include "intel_sseu.h"
 
-#define CONTEXT_REDZONE POISON_INUSE
+#include "uc/intel_guc_fwif.h"
 
+#define CONTEXT_REDZONE POISON_INUSE
 DECLARE_EWMA(runtime, 3, 8);
 
 struct i915_gem_context;
@@ -35,11 +37,16 @@ struct intel_context_ops {
 
 	int (*alloc)(struct intel_context *ce);
 
+	void (*ban)(struct intel_context *ce, struct i915_request *rq);
+
 	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
 	int (*pin)(struct intel_context *ce, void *vaddr);
 	void (*unpin)(struct intel_context *ce);
 	void (*post_unpin)(struct intel_context *ce);
 
+	void (*cancel_request)(struct intel_context *ce,
+			       struct i915_request *rq);
+
 	void (*enter)(struct intel_context *ce);
 	void (*exit)(struct intel_context *ce);
 
@@ -47,6 +54,12 @@ struct intel_context_ops {
 
 	void (*reset)(struct intel_context *ce);
 	void (*destroy)(struct kref *kref);
+
+	/* virtual engine/context interface */
+	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
+						unsigned int count);
+	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
+					       unsigned int sibling);
 };
 
 struct intel_context {
@@ -156,6 +169,13 @@ struct intel_context {
 		struct list_head fences;
 	} guc_state;
 
+	struct {
+		/** lock: protects everything in guc_active */
+		spinlock_t lock;
+		/** requests: active requests on this context */
+		struct list_head requests;
+	} guc_active;
+
 	/* GuC scheduling state flags that do not require a lock. */
 	atomic_t guc_sched_state_no_lock;
 
@@ -169,6 +189,15 @@ struct intel_context {
 	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
 	 */
 	struct list_head guc_id_link;
+
+	/* GuC context blocked fence */
+	struct i915_sw_fence guc_blocked;
+
+	/*
+	 * GuC priority management
+	 */
+	u8 guc_prio;
+	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
 };
 
 #endif /* __INTEL_CONTEXT_TYPES__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index f911c1224ab2..c2a5640ae055 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -212,6 +212,9 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
 
 void intel_engine_init_execlists(struct intel_engine_cs *engine);
 
+bool intel_engine_irq_enable(struct intel_engine_cs *engine);
+void intel_engine_irq_disable(struct intel_engine_cs *engine);
+
 static inline void __intel_engine_reset(struct intel_engine_cs *engine,
 					bool stalled)
 {
@@ -237,12 +240,15 @@ __printf(3, 4)
 void intel_engine_dump(struct intel_engine_cs *engine,
 		       struct drm_printer *m,
 		       const char *header, ...);
+void intel_engine_dump_active_requests(struct list_head *requests,
+				       struct i915_request *hung_rq,
+				       struct drm_printer *m);
 
 ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
 				   ktime_t *now);
 
 struct i915_request *
-intel_engine_find_active_request(struct intel_engine_cs *engine);
+intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
 struct intel_context *
@@ -273,13 +279,60 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
 	return intel_engine_has_preemption(engine);
 }
 
+struct intel_context *
+intel_engine_create_virtual(struct intel_engine_cs **siblings,
+			    unsigned int count);
+
+static inline bool
+intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
+{
+	/*
+	 * For non-GuC submission we expect the back-end to look at the
+	 * heartbeat status of the actual physical engine that the work
+	 * has been (or is being) scheduled on, so we should only reach
+	 * here with GuC submission enabled.
+	 */
+	GEM_BUG_ON(!intel_engine_uses_guc(engine));
+
+	return intel_guc_virtual_engine_has_heartbeat(engine);
+}
+
 static inline bool
 intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
 {
 	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
 		return false;
 
-	return READ_ONCE(engine->props.heartbeat_interval_ms);
+	if (intel_engine_is_virtual(engine))
+		return intel_virtual_engine_has_heartbeat(engine);
+	else
+		return READ_ONCE(engine->props.heartbeat_interval_ms);
+}
+
+static inline struct intel_engine_cs *
+intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
+{
+	GEM_BUG_ON(!intel_engine_is_virtual(engine));
+	return engine->cops->get_sibling(engine, sibling);
+}
+
+static inline void
+intel_engine_set_hung_context(struct intel_engine_cs *engine,
+			      struct intel_context *ce)
+{
+	engine->hung_ce = ce;
+}
+
+static inline void
+intel_engine_clear_hung_context(struct intel_engine_cs *engine)
+{
+	intel_engine_set_hung_context(engine, NULL);
+}
+
+static inline struct intel_context *
+intel_engine_get_hung_context(struct intel_engine_cs *engine)
+{
+	return engine->hung_ce;
 }
 
 #endif /* _INTEL_RINGBUFFER_H_ */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 43c3fb2aeb13..dea0e522c5c7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -798,7 +798,7 @@ static int engine_setup_common(struct intel_engine_cs *engine)
 err_cmd_parser:
 	i915_sched_engine_put(engine->sched_engine);
 err_sched_engine:
-	intel_breadcrumbs_free(engine->breadcrumbs);
+	intel_breadcrumbs_put(engine->breadcrumbs);
 err_status:
 	cleanup_status_page(engine);
 	return err;
@@ -1007,7 +1007,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 	GEM_BUG_ON(!list_empty(&engine->sched_engine->requests));
 
 	i915_sched_engine_put(engine->sched_engine);
-	intel_breadcrumbs_free(engine->breadcrumbs);
+	intel_breadcrumbs_put(engine->breadcrumbs);
 
 	intel_engine_fini_retire(engine);
 	intel_engine_cleanup_cmd_parser(engine);
@@ -1324,6 +1324,30 @@ bool intel_engines_are_idle(struct intel_gt *gt)
 	return true;
 }
 
+bool intel_engine_irq_enable(struct intel_engine_cs *engine)
+{
+	if (!engine->irq_enable)
+		return false;
+
+	/* Caller disables interrupts */
+	spin_lock(&engine->gt->irq_lock);
+	engine->irq_enable(engine);
+	spin_unlock(&engine->gt->irq_lock);
+
+	return true;
+}
+
+void intel_engine_irq_disable(struct intel_engine_cs *engine)
+{
+	if (!engine->irq_disable)
+		return;
+
+	/* Caller disables interrupts */
+	spin_lock(&engine->gt->irq_lock);
+	engine->irq_disable(engine);
+	spin_unlock(&engine->gt->irq_lock);
+}
+
 void intel_engines_reset_default_submission(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
@@ -1660,6 +1684,98 @@ static void print_properties(struct intel_engine_cs *engine,
 			   read_ul(&engine->defaults, p->offset));
 }
 
+static void engine_dump_request(struct i915_request *rq, struct drm_printer *m, const char *msg)
+{
+	struct intel_timeline *tl = get_timeline(rq);
+
+	i915_request_show(m, rq, msg, 0);
+
+	drm_printf(m, "\t\tring->start:  0x%08x\n",
+		   i915_ggtt_offset(rq->ring->vma));
+	drm_printf(m, "\t\tring->head:   0x%08x\n",
+		   rq->ring->head);
+	drm_printf(m, "\t\tring->tail:   0x%08x\n",
+		   rq->ring->tail);
+	drm_printf(m, "\t\tring->emit:   0x%08x\n",
+		   rq->ring->emit);
+	drm_printf(m, "\t\tring->space:  0x%08x\n",
+		   rq->ring->space);
+
+	if (tl) {
+		drm_printf(m, "\t\tring->hwsp:   0x%08x\n",
+			   tl->hwsp_offset);
+		intel_timeline_put(tl);
+	}
+
+	print_request_ring(m, rq);
+
+	if (rq->context->lrc_reg_state) {
+		drm_printf(m, "Logical Ring Context:\n");
+		hexdump(m, rq->context->lrc_reg_state, PAGE_SIZE);
+	}
+}
+
+void intel_engine_dump_active_requests(struct list_head *requests,
+				       struct i915_request *hung_rq,
+				       struct drm_printer *m)
+{
+	struct i915_request *rq;
+	const char *msg;
+	enum i915_request_state state;
+
+	list_for_each_entry(rq, requests, sched.link) {
+		if (rq == hung_rq)
+			continue;
+
+		state = i915_test_request_state(rq);
+		if (state < I915_REQUEST_QUEUED)
+			continue;
+
+		if (state == I915_REQUEST_ACTIVE)
+			msg = "\t\tactive on engine";
+		else
+			msg = "\t\tactive in queue";
+
+		engine_dump_request(rq, m, msg);
+	}
+}
+
+static void engine_dump_active_requests(struct intel_engine_cs *engine, struct drm_printer *m)
+{
+	struct i915_request *hung_rq = NULL;
+	struct intel_context *ce;
+	bool guc;
+
+	/*
+	 * No need for an engine->irq_seqno_barrier() before the seqno reads.
+	 * The GPU is still running so requests are still executing and any
+	 * hardware reads will be out of date by the time they are reported.
+	 * But the intention here is just to report an instantaneous snapshot
+	 * so that's fine.
+	 */
+	lockdep_assert_held(&engine->sched_engine->lock);
+
+	drm_printf(m, "\tRequests:\n");
+
+	guc = intel_uc_uses_guc_submission(&engine->gt->uc);
+	if (guc) {
+		ce = intel_engine_get_hung_context(engine);
+		if (ce)
+			hung_rq = intel_context_find_active_request(ce);
+	} else {
+		hung_rq = intel_engine_execlist_find_hung_request(engine);
+	}
+
+	if (hung_rq)
+		engine_dump_request(hung_rq, m, "\t\thung");
+
+	if (guc)
+		intel_guc_dump_active_requests(engine, hung_rq, m);
+	else
+		intel_engine_dump_active_requests(&engine->sched_engine->requests,
+						  hung_rq, m);
+}
+
 void intel_engine_dump(struct intel_engine_cs *engine,
 		       struct drm_printer *m,
 		       const char *header, ...)
@@ -1704,39 +1820,9 @@ void intel_engine_dump(struct intel_engine_cs *engine,
 		   i915_reset_count(error));
 	print_properties(engine, m);
 
-	drm_printf(m, "\tRequests:\n");
-
 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-	rq = intel_engine_find_active_request(engine);
-	if (rq) {
-		struct intel_timeline *tl = get_timeline(rq);
-
-		i915_request_show(m, rq, "\t\tactive ", 0);
-
-		drm_printf(m, "\t\tring->start:  0x%08x\n",
-			   i915_ggtt_offset(rq->ring->vma));
-		drm_printf(m, "\t\tring->head:   0x%08x\n",
-			   rq->ring->head);
-		drm_printf(m, "\t\tring->tail:   0x%08x\n",
-			   rq->ring->tail);
-		drm_printf(m, "\t\tring->emit:   0x%08x\n",
-			   rq->ring->emit);
-		drm_printf(m, "\t\tring->space:  0x%08x\n",
-			   rq->ring->space);
-
-		if (tl) {
-			drm_printf(m, "\t\tring->hwsp:   0x%08x\n",
-				   tl->hwsp_offset);
-			intel_timeline_put(tl);
-		}
+	engine_dump_active_requests(engine, m);
 
-		print_request_ring(m, rq);
-
-		if (rq->context->lrc_reg_state) {
-			drm_printf(m, "Logical Ring Context:\n");
-			hexdump(m, rq->context->lrc_reg_state, PAGE_SIZE);
-		}
-	}
 	drm_printf(m, "\tOn hold?: %lu\n",
 		   list_count(&engine->sched_engine->hold));
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
@@ -1796,18 +1882,32 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
 	return total;
 }
 
-static bool match_ring(struct i915_request *rq)
+struct intel_context *
+intel_engine_create_virtual(struct intel_engine_cs **siblings,
+			    unsigned int count)
 {
-	u32 ring = ENGINE_READ(rq->engine, RING_START);
+	if (count == 0)
+		return ERR_PTR(-EINVAL);
 
-	return ring == i915_ggtt_offset(rq->ring->vma);
+	if (count == 1)
+		return intel_context_create(siblings[0]);
+
+	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
+	return siblings[0]->cops->create_virtual(siblings, count);
 }
 
 struct i915_request *
-intel_engine_find_active_request(struct intel_engine_cs *engine)
+intel_engine_execlist_find_hung_request(struct intel_engine_cs *engine)
 {
 	struct i915_request *request, *active = NULL;
 
+	/*
+	 * This search does not work in GuC submission mode. However, the GuC
+	 * will report the hanging context directly to the driver itself. So
+	 * the driver should never get here when in GuC mode.
+	 */
+	GEM_BUG_ON(intel_uc_uses_guc_submission(&engine->gt->uc));
+
 	/*
 	 * We are called by the error capture, reset and to dump engine
 	 * state at random points in time. In particular, note that neither is
@@ -1839,14 +1939,7 @@ intel_engine_find_active_request(struct intel_engine_cs *engine)
 
 	list_for_each_entry(request, &engine->sched_engine->requests,
 			    sched.link) {
-		if (__i915_request_is_complete(request))
-			continue;
-
-		if (!__i915_request_has_started(request))
-			continue;
-
-		/* More than one preemptible request may match! */
-		if (!match_ring(request))
+		if (i915_test_request_state(request) != I915_REQUEST_ACTIVE)
 			continue;
 
 		active = request;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index b6a305e6a974..74775ae961b2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -70,12 +70,38 @@ static void show_heartbeat(const struct i915_request *rq,
 {
 	struct drm_printer p = drm_debug_printer("heartbeat");
 
-	intel_engine_dump(engine, &p,
-			  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
-			  engine->name,
-			  rq->fence.context,
-			  rq->fence.seqno,
-			  rq->sched.attr.priority);
+	if (!rq) {
+		intel_engine_dump(engine, &p,
+				  "%s heartbeat not ticking\n",
+				  engine->name);
+	} else {
+		intel_engine_dump(engine, &p,
+				  "%s heartbeat {seqno:%llx:%lld, prio:%d} not ticking\n",
+				  engine->name,
+				  rq->fence.context,
+				  rq->fence.seqno,
+				  rq->sched.attr.priority);
+	}
+}
+
+static void
+reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
+{
+	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
+		show_heartbeat(rq, engine);
+
+	if (intel_engine_uses_guc(engine))
+		/*
+		 * GuC itself is toast or GuC's hang detection
+		 * is disabled. Either way, need to find the
+		 * hang culprit manually.
+		 */
+		intel_guc_find_hung_context(engine);
+
+	intel_gt_handle_error(engine->gt, engine->mask,
+			      I915_ERROR_CAPTURE,
+			      "stopped heartbeat on %s",
+			      engine->name);
 }
 
 static void heartbeat(struct work_struct *wrk)
@@ -102,6 +128,11 @@ static void heartbeat(struct work_struct *wrk)
 	if (intel_gt_is_wedged(engine->gt))
 		goto out;
 
+	if (i915_sched_engine_disabled(engine->sched_engine)) {
+		reset_engine(engine, engine->heartbeat.systole);
+		goto out;
+	}
+
 	if (engine->heartbeat.systole) {
 		long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
 
@@ -139,13 +170,7 @@ static void heartbeat(struct work_struct *wrk)
 			engine->sched_engine->schedule(rq, &attr);
 			local_bh_enable();
 		} else {
-			if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
-				show_heartbeat(rq, engine);
-
-			intel_gt_handle_error(engine->gt, engine->mask,
-					      I915_ERROR_CAPTURE,
-					      "stopped heartbeat on %s",
-					      engine->name);
+			reset_engine(engine, rq);
 		}
 
 		rq->emitted_jiffies = jiffies;
@@ -194,6 +219,25 @@ void intel_engine_park_heartbeat(struct intel_engine_cs *engine)
 		i915_request_put(fetch_and_zero(&engine->heartbeat.systole));
 }
 
+void intel_gt_unpark_heartbeats(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		if (intel_engine_pm_is_awake(engine))
+			intel_engine_unpark_heartbeat(engine);
+}
+
+void intel_gt_park_heartbeats(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id)
+		intel_engine_park_heartbeat(engine);
+}
+
 void intel_engine_init_heartbeat(struct intel_engine_cs *engine)
 {
 	INIT_DELAYED_WORK(&engine->heartbeat.work, heartbeat);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
index a488ea3e84a3..5da6d809a87a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.h
@@ -7,6 +7,7 @@
 #define INTEL_ENGINE_HEARTBEAT_H
 
 struct intel_engine_cs;
+struct intel_gt;
 
 void intel_engine_init_heartbeat(struct intel_engine_cs *engine);
 
@@ -16,6 +17,9 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
 void intel_engine_park_heartbeat(struct intel_engine_cs *engine);
 void intel_engine_unpark_heartbeat(struct intel_engine_cs *engine);
 
+void intel_gt_park_heartbeats(struct intel_gt *gt);
+void intel_gt_unpark_heartbeats(struct intel_gt *gt);
+
 int intel_engine_pulse(struct intel_engine_cs *engine);
 int intel_engine_flush_barriers(struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 3f308a920b50..ed91bcff20eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -21,7 +21,6 @@
 #include "i915_pmu.h"
 #include "i915_priolist_types.h"
 #include "i915_selftest.h"
-#include "intel_breadcrumbs_types.h"
 #include "intel_sseu.h"
 #include "intel_timeline_types.h"
 #include "intel_uncore.h"
@@ -52,6 +51,7 @@ struct i915_sched_engine;
 struct intel_gt;
 struct intel_ring;
 struct intel_uncore;
+struct intel_breadcrumbs;
 
 typedef u32 intel_engine_mask_t;
 #define ALL_ENGINES ((intel_engine_mask_t)~0ul)
@@ -298,6 +298,8 @@ struct intel_engine_cs {
 	/* keep a request in reserve for a [pm] barrier under oom */
 	struct i915_request *request_pool;
 
+	struct intel_context *hung_ce;
+
 	struct llist_head barrier_tasks;
 
 	struct intel_context *kernel_context; /* pinned */
@@ -382,6 +384,8 @@ struct intel_engine_cs {
 	void		(*park)(struct intel_engine_cs *engine);
 	void		(*unpark)(struct intel_engine_cs *engine);
 
+	void		(*bump_serial)(struct intel_engine_cs *engine);
+
 	void		(*set_default_submission)(struct intel_engine_cs *engine);
 
 	const struct intel_context_ops *cops;
@@ -412,6 +416,12 @@ struct intel_engine_cs {
 
 	void		(*release)(struct intel_engine_cs *engine);
 
+	/*
+	 * Add / remove request from engine active tracking
+	 */
+	void		(*add_active_request)(struct i915_request *rq);
+	void		(*remove_active_request)(struct i915_request *rq);
+
 	struct intel_engine_execlists execlists;
 
 	/*
@@ -433,6 +443,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_IS_VIRTUAL       BIT(5)
 #define I915_ENGINE_HAS_RELATIVE_MMIO BIT(6)
 #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
+#define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 84142127ebd8..8f8bea08e734 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -11,6 +11,7 @@
 #include "intel_engine.h"
 #include "intel_engine_user.h"
 #include "intel_gt.h"
+#include "uc/intel_guc_submission.h"
 
 struct intel_engine_cs *
 intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance)
@@ -115,6 +116,9 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
 			disabled |= (I915_SCHEDULER_CAP_ENABLED |
 				     I915_SCHEDULER_CAP_PRIORITY);
 
+		if (intel_uc_uses_guc_submission(&i915->gt.uc))
+			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
+
 		for (i = 0; i < ARRAY_SIZE(map); i++) {
 			if (engine->flags & BIT(map[i].engine))
 				enabled |= BIT(map[i].sched);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index be99a74e6e09..de5f9c86b9a4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -114,6 +114,7 @@
 #include "gen8_engine_cs.h"
 #include "intel_breadcrumbs.h"
 #include "intel_context.h"
+#include "intel_engine_heartbeat.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_stats.h"
 #include "intel_execlists_submission.h"
@@ -199,6 +200,9 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
 	return container_of(engine, struct virtual_engine, base);
 }
 
+static struct intel_context *
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+
 static struct i915_request *
 __active_request(const struct intel_timeline * const tl,
 		 struct i915_request *rq,
@@ -2584,11 +2588,26 @@ static int execlists_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void execlists_context_cancel_request(struct intel_context *ce,
+					     struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = NULL;
+
+	i915_request_active_engine(rq, &engine);
+
+	if (engine && intel_engine_pulse(engine))
+		intel_gt_handle_error(engine->gt, engine->mask, 0,
+				      "request cancellation by %s",
+				      current->comm);
+}
+
 static const struct intel_context_ops execlists_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
 	.alloc = execlists_context_alloc,
 
+	.cancel_request = execlists_context_cancel_request,
+
 	.pre_pin = execlists_context_pre_pin,
 	.pin = execlists_context_pin,
 	.unpin = lrc_unpin,
@@ -2599,6 +2618,8 @@ static const struct intel_context_ops execlists_context_ops = {
 
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
+
+	.create_virtual = execlists_create_virtual,
 };
 
 static int emit_pdps(struct i915_request *rq)
@@ -3152,6 +3173,42 @@ static void execlists_park(struct intel_engine_cs *engine)
 	cancel_timer(&engine->execlists.preempt);
 }
 
+static void add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void remove_from_engine(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine, *locked;
+
+	/*
+	 * Virtual engines complicate acquiring the engine timeline lock,
+	 * as their rq->engine pointer is not stable until under that
+	 * engine lock. The simple ploy we use is to take the lock then
+	 * check that the rq still belongs to the newly locked engine.
+	 */
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched_engine->lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched_engine->lock);
+		spin_lock(&engine->sched_engine->lock);
+		locked = engine;
+	}
+	list_del_init(&rq->sched.link);
+
+	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	spin_unlock_irq(&locked->sched_engine->lock);
+
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static bool can_preempt(struct intel_engine_cs *engine)
 {
 	if (GRAPHICS_VER(engine->i915) > 8)
@@ -3246,6 +3303,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 
 	engine->cops = &execlists_context_ops;
 	engine->request_alloc = execlists_request_alloc;
+	engine->add_active_request = add_to_engine;
+	engine->remove_active_request = remove_from_engine;
 
 	engine->reset.prepare = execlists_reset_prepare;
 	engine->reset.rewind = execlists_reset_rewind;
@@ -3452,7 +3511,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 	intel_context_fini(&ve->context);
 
 	if (ve->base.breadcrumbs)
-		intel_breadcrumbs_free(ve->base.breadcrumbs);
+		intel_breadcrumbs_put(ve->base.breadcrumbs);
 	if (ve->base.sched_engine)
 		i915_sched_engine_put(ve->base.sched_engine);
 	intel_engine_free_request_pool(&ve->base);
@@ -3549,11 +3608,24 @@ static void virtual_context_exit(struct intel_context *ce)
 		intel_engine_pm_put(ve->siblings[n]);
 }
 
+static struct intel_engine_cs *
+virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
+{
+	struct virtual_engine *ve = to_virtual_engine(engine);
+
+	if (sibling >= ve->num_siblings)
+		return NULL;
+
+	return ve->siblings[sibling];
+}
+
 static const struct intel_context_ops virtual_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
 	.alloc = virtual_context_alloc,
 
+	.cancel_request = execlists_context_cancel_request,
+
 	.pre_pin = virtual_context_pre_pin,
 	.pin = virtual_context_pin,
 	.unpin = lrc_unpin,
@@ -3563,6 +3635,8 @@ static const struct intel_context_ops virtual_context_ops = {
 	.exit = virtual_context_exit,
 
 	.destroy = virtual_context_destroy,
+
+	.get_sibling = virtual_get_sibling,
 };
 
 static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
@@ -3711,20 +3785,13 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
 }
 
-struct intel_context *
-intel_execlists_create_virtual(struct intel_engine_cs **siblings,
-			       unsigned int count)
+static struct intel_context *
+execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 {
 	struct virtual_engine *ve;
 	unsigned int n;
 	int err;
 
-	if (count == 0)
-		return ERR_PTR(-EINVAL);
-
-	if (count == 1)
-		return intel_context_create(siblings[0]);
-
 	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
 	if (!ve)
 		return ERR_PTR(-ENOMEM);
@@ -3836,6 +3903,8 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			 "v%dx%d", ve->base.class, count);
 		ve->base.context_size = sibling->context_size;
 
+		ve->base.add_active_request = sibling->add_active_request;
+		ve->base.remove_active_request = sibling->remove_active_request;
 		ve->base.emit_bb_start = sibling->emit_bb_start;
 		ve->base.emit_flush = sibling->emit_flush;
 		ve->base.emit_init_breadcrumb = sibling->emit_init_breadcrumb;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index ad4f3e1a0fde..a1aa92c983a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -32,10 +32,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
 							int indent),
 				   unsigned int max);
 
-struct intel_context *
-intel_execlists_create_virtual(struct intel_engine_cs **siblings,
-			       unsigned int count);
-
 bool
 intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 46441607d18b..a64aa43f7cd9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -654,6 +654,8 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		goto err_gt;
 
+	intel_uc_init_late(&gt->uc);
+
 	err = i915_inject_probe_error(gt->i915, -EIO);
 	if (err)
 		goto err_gt;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index d86825437516..cd7b96005d29 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -170,8 +170,6 @@ static void gt_sanitize(struct intel_gt *gt, bool force)
 	if (intel_gt_is_wedged(gt))
 		intel_gt_unset_wedged(gt);
 
-	intel_uc_sanitize(&gt->uc);
-
 	for_each_engine(engine, gt, id)
 		if (engine->reset.prepare)
 			engine->reset.prepare(engine);
@@ -187,6 +185,8 @@ static void gt_sanitize(struct intel_gt *gt, bool force)
 			__intel_engine_reset(engine, false);
 	}
 
+	intel_uc_reset(&gt->uc, false);
+
 	for_each_engine(engine, gt, id)
 		if (engine->reset.finish)
 			engine->reset.finish(engine);
@@ -239,6 +239,8 @@ int intel_gt_resume(struct intel_gt *gt)
 		goto err_wedged;
 	}
 
+	intel_uc_reset_finish(&gt->uc);
+
 	intel_rps_enable(&gt->rps);
 	intel_llc_enable(&gt->llc);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 9586613ee399..91200c43951f 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -22,7 +22,6 @@
 #include "intel_reset.h"
 
 #include "uc/intel_guc.h"
-#include "uc/intel_guc_submission.h"
 
 #define RESET_MAX_RETRIES 3
 
@@ -39,21 +38,6 @@ static void rmw_clear_fw(struct intel_uncore *uncore, i915_reg_t reg, u32 clr)
 	intel_uncore_rmw_fw(uncore, reg, clr, 0);
 }
 
-static void skip_context(struct i915_request *rq)
-{
-	struct intel_context *hung_ctx = rq->context;
-
-	list_for_each_entry_from_rcu(rq, &hung_ctx->timeline->requests, link) {
-		if (!i915_request_is_active(rq))
-			return;
-
-		if (rq->context == hung_ctx) {
-			i915_request_set_error_once(rq, -EIO);
-			__i915_request_skip(rq);
-		}
-	}
-}
-
 static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
 {
 	struct drm_i915_file_private *file_priv = ctx->file_priv;
@@ -88,10 +72,8 @@ static bool mark_guilty(struct i915_request *rq)
 	bool banned;
 	int i;
 
-	if (intel_context_is_closed(rq->context)) {
-		intel_context_set_banned(rq->context);
+	if (intel_context_is_closed(rq->context))
 		return true;
-	}
 
 	rcu_read_lock();
 	ctx = rcu_dereference(rq->context->gem_context);
@@ -123,11 +105,9 @@ static bool mark_guilty(struct i915_request *rq)
 	banned = !i915_gem_context_is_recoverable(ctx);
 	if (time_before(jiffies, prev_hang + CONTEXT_FAST_HANG_JIFFIES))
 		banned = true;
-	if (banned) {
+	if (banned)
 		drm_dbg(&ctx->i915->drm, "context %s: guilty %d, banned\n",
 			ctx->name, atomic_read(&ctx->guilty_count));
-		intel_context_set_banned(rq->context);
-	}
 
 	client_mark_guilty(ctx, banned);
 
@@ -149,6 +129,8 @@ static void mark_innocent(struct i915_request *rq)
 
 void __i915_request_reset(struct i915_request *rq, bool guilty)
 {
+	bool banned = false;
+
 	RQ_TRACE(rq, "guilty? %s\n", yesno(guilty));
 	GEM_BUG_ON(__i915_request_is_complete(rq));
 
@@ -156,13 +138,15 @@ void __i915_request_reset(struct i915_request *rq, bool guilty)
 	if (guilty) {
 		i915_request_set_error_once(rq, -EIO);
 		__i915_request_skip(rq);
-		if (mark_guilty(rq))
-			skip_context(rq);
+		banned = mark_guilty(rq);
 	} else {
 		i915_request_set_error_once(rq, -EAGAIN);
 		mark_innocent(rq);
 	}
 	rcu_read_unlock();
+
+	if (banned)
+		intel_context_ban(rq->context, rq);
 }
 
 static bool i915_in_reset(struct pci_dev *pdev)
@@ -832,6 +816,8 @@ static int gt_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
 		__intel_engine_reset(engine, stalled_mask & engine->mask);
 	local_bh_enable();
 
+	intel_uc_reset(&gt->uc, true);
+
 	intel_ggtt_restore_fences(gt->ggtt);
 
 	return err;
@@ -856,6 +842,8 @@ static void reset_finish(struct intel_gt *gt, intel_engine_mask_t awake)
 		if (awake & engine->mask)
 			intel_engine_pm_put(engine);
 	}
+
+	intel_uc_reset_finish(&gt->uc);
 }
 
 static void nop_submit_request(struct i915_request *request)
@@ -909,6 +897,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 	for_each_engine(engine, gt, id)
 		if (engine->reset.cancel)
 			engine->reset.cancel(engine);
+	intel_uc_cancel_requests(&gt->uc);
 	local_bh_enable();
 
 	reset_finish(gt, awake);
@@ -1197,6 +1186,9 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
 	ENGINE_TRACE(engine, "flags=%lx\n", gt->reset.flags);
 	GEM_BUG_ON(!test_bit(I915_RESET_ENGINE + engine->id, &gt->reset.flags));
 
+	if (intel_engine_uses_guc(engine))
+		return -ENODEV;
+
 	if (!intel_engine_pm_get_if_awake(engine))
 		return 0;
 
@@ -1207,13 +1199,10 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
 			   "Resetting %s for %s\n", engine->name, msg);
 	atomic_inc(&engine->i915->gpu_error.reset_engine_count[engine->uabi_class]);
 
-	if (intel_engine_uses_guc(engine))
-		ret = intel_guc_reset_engine(&engine->gt->uc.guc, engine);
-	else
-		ret = intel_gt_reset_engine(engine);
+	ret = intel_gt_reset_engine(engine);
 	if (ret) {
 		/* If we fail here, we expect to fallback to a global reset */
-		ENGINE_TRACE(engine, "Failed to reset, err: %d\n", ret);
+		ENGINE_TRACE(engine, "Failed to reset %s, err: %d\n", engine->name, ret);
 		goto out;
 	}
 
@@ -1347,7 +1336,8 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	 * Try engine reset when available. We fall back to full reset if
 	 * single reset fails.
 	 */
-	if (intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
+	if (!intel_uc_uses_guc_submission(&gt->uc) &&
+	    intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
 		local_bh_disable();
 		for_each_engine_masked(engine, gt, engine_mask, tmp) {
 			BUILD_BUG_ON(I915_RESET_MODESET >= I915_RESET_ENGINE);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5c4d204d07cc..2958e2fae380 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -16,6 +16,7 @@
 #include "intel_reset.h"
 #include "intel_ring.h"
 #include "shmem_utils.h"
+#include "intel_engine_heartbeat.h"
 
 /* Rough estimate of the typical request size, performing a flush,
  * set-context and then emitting the batch.
@@ -586,9 +587,44 @@ static void ring_context_reset(struct intel_context *ce)
 	clear_bit(CONTEXT_VALID_BIT, &ce->flags);
 }
 
+static void ring_context_ban(struct intel_context *ce,
+			     struct i915_request *rq)
+{
+	struct intel_engine_cs *engine;
+
+	if (!rq || !i915_request_is_active(rq))
+		return;
+
+	engine = rq->engine;
+	lockdep_assert_held(&engine->sched_engine->lock);
+	list_for_each_entry_continue(rq, &engine->sched_engine->requests,
+				     sched.link)
+		if (rq->context == ce) {
+			i915_request_set_error_once(rq, -EIO);
+			__i915_request_skip(rq);
+		}
+}
+
+static void ring_context_cancel_request(struct intel_context *ce,
+					struct i915_request *rq)
+{
+	struct intel_engine_cs *engine = NULL;
+
+	i915_request_active_engine(rq, &engine);
+
+	if (engine && intel_engine_pulse(engine))
+		intel_gt_handle_error(engine->gt, engine->mask, 0,
+				      "request cancellation by %s",
+				      current->comm);
+}
+
 static const struct intel_context_ops ring_context_ops = {
 	.alloc = ring_context_alloc,
 
+	.cancel_request = ring_context_cancel_request,
+
+	.ban = ring_context_ban,
+
 	.pre_pin = ring_context_pre_pin,
 	.pin = ring_context_pin,
 	.unpin = ring_context_unpin,
@@ -1047,6 +1083,25 @@ static void setup_irq(struct intel_engine_cs *engine)
 	}
 }
 
+static void add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void remove_from_engine(struct i915_request *rq)
+{
+	spin_lock_irq(&rq->engine->sched_engine->lock);
+	list_del_init(&rq->sched.link);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	spin_unlock_irq(&rq->engine->sched_engine->lock);
+
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static void setup_common(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
@@ -1064,6 +1119,9 @@ static void setup_common(struct intel_engine_cs *engine)
 	engine->reset.cancel = reset_cancel;
 	engine->reset.finish = reset_finish;
 
+	engine->add_active_request = add_to_engine;
+	engine->remove_active_request = remove_from_engine;
+
 	engine->cops = &ring_context_ops;
 	engine->request_alloc = ring_request_alloc;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 06e9a8ed4e03..0c8e7f2b06f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1877,6 +1877,10 @@ void intel_rps_init(struct intel_rps *rps)
 
 	if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) < 11)
 		rps->pm_intrmsk_mbz |= GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC;
+
+	/* GuC needs ARAT expired interrupt unmasked */
+	if (intel_uc_uses_guc_submission(&rps_to_gt(rps)->uc))
+		rps->pm_intrmsk_mbz |= ARAT_EXPIRED_INTRMSK;
 }
 
 void intel_rps_sanitize(struct intel_rps *rps)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3aa5ce3cda8b..9173df59821a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -150,13 +150,14 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 }
 
 static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
-		   u32 clear, u32 set, u32 read_mask)
+		   u32 clear, u32 set, u32 read_mask, bool masked_reg)
 {
 	struct i915_wa wa = {
 		.reg  = reg,
 		.clr  = clear,
 		.set  = set,
 		.read = read_mask,
+		.masked_reg = masked_reg,
 	};
 
 	_wa_add(wal, &wa);
@@ -165,7 +166,7 @@ static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
 static void
 wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
 {
-	wa_add(wal, reg, clear, set, clear);
+	wa_add(wal, reg, clear, set, clear, false);
 }
 
 static void
@@ -200,20 +201,20 @@ wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
 static void
 wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val);
+	wa_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
 }
 
 static void
 wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val);
+	wa_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
 }
 
 static void
 wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
 		    u32 mask, u32 val)
 {
-	wa_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask);
+	wa_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask, true);
 }
 
 static void gen6_ctx_workarounds_init(struct intel_engine_cs *engine,
@@ -533,10 +534,10 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
 	wa_masked_en(wal, ICL_HDC_MODE, HDC_FORCE_NON_COHERENT);
 
 	/* WaEnableFloatBlendOptimization:icl */
-	wa_write_clr_set(wal,
-			 GEN10_CACHE_MODE_SS,
-			 0, /* write-only, so skip validation */
-			 _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE));
+	wa_add(wal, GEN10_CACHE_MODE_SS, 0,
+	       _MASKED_BIT_ENABLE(FLOAT_BLEND_OPTIMIZATION_ENABLE),
+	       0 /* write-only, so skip validation */,
+	       true);
 
 	/* WaDisableGPGPUMidThreadPreemption:icl */
 	wa_masked_field_set(wal, GEN8_CS_CHICKEN1,
@@ -581,7 +582,7 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
 	       FF_MODE2,
 	       FF_MODE2_TDS_TIMER_MASK,
 	       FF_MODE2_TDS_TIMER_128,
-	       0);
+	       0, false);
 }
 
 static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
@@ -619,7 +620,7 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
 	       FF_MODE2,
 	       FF_MODE2_GS_TIMER_MASK,
 	       FF_MODE2_GS_TIMER_224,
-	       0);
+	       0, false);
 
 	/*
 	 * Wa_14012131227:dg1
@@ -795,7 +796,7 @@ hsw_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	wa_add(wal,
 	       HSW_ROW_CHICKEN3, 0,
 	       _MASKED_BIT_ENABLE(HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE),
-		0 /* XXX does this reg exist? */);
+	       0 /* XXX does this reg exist? */, true);
 
 	/* WaVSRefCountFullforceMissDisable:hsw */
 	wa_write_clr(wal, GEN7_FF_THREAD_MODE, GEN7_FF_VS_REF_CNT_FFME);
@@ -1824,10 +1825,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * disable bit, which we don't touch here, but it's good
 		 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
 		 */
-		wa_add(wal, GEN7_GT_MODE, 0,
-		       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK,
-				     GEN6_WIZ_HASHING_16x4),
-		       GEN6_WIZ_HASHING_16x4);
+		wa_masked_field_set(wal,
+				    GEN7_GT_MODE,
+				    GEN6_WIZ_HASHING_MASK,
+				    GEN6_WIZ_HASHING_16x4);
 	}
 
 	if (IS_GRAPHICS_VER(i915, 6, 7))
@@ -1877,10 +1878,10 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 * disable bit, which we don't touch here, but it's good
 		 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
 		 */
-		wa_add(wal,
-		       GEN6_GT_MODE, 0,
-		       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK, GEN6_WIZ_HASHING_16x4),
-		       GEN6_WIZ_HASHING_16x4);
+		wa_masked_field_set(wal,
+				    GEN6_GT_MODE,
+				    GEN6_WIZ_HASHING_MASK,
+				    GEN6_WIZ_HASHING_16x4);
 
 		/* WaDisable_RenderCache_OperationalFlush:snb */
 		wa_masked_dis(wal, CACHE_MODE_0, RC_OP_FLUSH_ENABLE);
@@ -1901,7 +1902,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		wa_add(wal, MI_MODE,
 		       0, _MASKED_BIT_ENABLE(VS_TIMER_DISPATCH),
 		       /* XXX bit doesn't stick on Broadwater */
-		       IS_I965G(i915) ? 0 : VS_TIMER_DISPATCH);
+		       IS_I965G(i915) ? 0 : VS_TIMER_DISPATCH, true);
 
 	if (GRAPHICS_VER(i915) == 4)
 		/*
@@ -1916,7 +1917,8 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		 */
 		wa_add(wal, ECOSKPD,
 		       0, _MASKED_BIT_ENABLE(ECO_CONSTANT_BUFFER_SR_DISABLE),
-		       0 /* XXX bit doesn't stick on Broadwater */);
+		       0 /* XXX bit doesn't stick on Broadwater */,
+		       true);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
index c214111ea367..1e873681795d 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
@@ -15,6 +15,7 @@ struct i915_wa {
 	u32		clr;
 	u32		set;
 	u32		read;
+	bool		masked_reg;
 };
 
 struct i915_wa_list {
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 68970398e4ef..2c1af030310c 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -235,6 +235,34 @@ static void mock_submit_request(struct i915_request *request)
 	spin_unlock_irqrestore(&engine->hw_lock, flags);
 }
 
+static void mock_add_to_engine(struct i915_request *rq)
+{
+	lockdep_assert_held(&rq->engine->sched_engine->lock);
+	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
+}
+
+static void mock_remove_from_engine(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine, *locked;
+
+	/*
+	 * Virtual engines complicate acquiring the engine timeline lock,
+	 * as their rq->engine pointer is not stable until under that
+	 * engine lock. The simple ploy we use is to take the lock then
+	 * check that the rq still belongs to the newly locked engine.
+	 */
+
+	locked = READ_ONCE(rq->engine);
+	spin_lock_irq(&locked->sched_engine->lock);
+	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
+		spin_unlock(&locked->sched_engine->lock);
+		spin_lock(&engine->sched_engine->lock);
+		locked = engine;
+	}
+	list_del_init(&rq->sched.link);
+	spin_unlock_irq(&locked->sched_engine->lock);
+}
+
 static void mock_reset_prepare(struct intel_engine_cs *engine)
 {
 }
@@ -284,7 +312,7 @@ static void mock_engine_release(struct intel_engine_cs *engine)
 	GEM_BUG_ON(timer_pending(&mock->hw_delay));
 
 	i915_sched_engine_put(engine->sched_engine);
-	intel_breadcrumbs_free(engine->breadcrumbs);
+	intel_breadcrumbs_put(engine->breadcrumbs);
 
 	intel_context_unpin(engine->kernel_context);
 	intel_context_put(engine->kernel_context);
@@ -321,6 +349,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 	engine->base.emit_flush = mock_emit_flush;
 	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
 	engine->base.submit_request = mock_submit_request;
+	engine->base.add_active_request = mock_add_to_engine;
+	engine->base.remove_active_request = mock_remove_from_engine;
 
 	engine->base.reset.prepare = mock_reset_prepare;
 	engine->base.reset.rewind = mock_reset_rewind;
@@ -370,7 +400,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
 	return 0;
 
 err_breadcrumbs:
-	intel_breadcrumbs_free(engine->breadcrumbs);
+	intel_breadcrumbs_put(engine->breadcrumbs);
 err_schedule:
 	i915_sched_engine_put(engine->sched_engine);
 	return -ENOMEM;
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index 4896e4ccad50..317eebf086c3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -405,3 +405,25 @@ void st_engine_heartbeat_enable(struct intel_engine_cs *engine)
 	engine->props.heartbeat_interval_ms =
 		engine->defaults.heartbeat_interval_ms;
 }
+
+void st_engine_heartbeat_disable_no_pm(struct intel_engine_cs *engine)
+{
+	engine->props.heartbeat_interval_ms = 0;
+
+	/*
+	 * Park the heartbeat but without holding the PM lock as that
+	 * makes the engines appear not-idle. Note that if/when unpark
+	 * is called due to the PM lock being acquired later the
+	 * heartbeat still won't be enabled because of the above = 0.
+	 */
+	if (intel_engine_pm_get_if_awake(engine)) {
+		intel_engine_park_heartbeat(engine);
+		intel_engine_pm_put(engine);
+	}
+}
+
+void st_engine_heartbeat_enable_no_pm(struct intel_engine_cs *engine)
+{
+	engine->props.heartbeat_interval_ms =
+		engine->defaults.heartbeat_interval_ms;
+}
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
index cd27113d5400..81da2cd8e406 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.h
@@ -9,6 +9,8 @@
 struct intel_engine_cs;
 
 void st_engine_heartbeat_disable(struct intel_engine_cs *engine);
+void st_engine_heartbeat_disable_no_pm(struct intel_engine_cs *engine);
 void st_engine_heartbeat_enable(struct intel_engine_cs *engine);
+void st_engine_heartbeat_enable_no_pm(struct intel_engine_cs *engine);
 
 #endif /* SELFTEST_ENGINE_HEARTBEAT_H */
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 22a124b134b6..f12ffe797639 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
 
 	for (n = 0; n < nctx; n++) {
-		ve[n] = intel_execlists_create_virtual(siblings, nsibling);
+		ve[n] = intel_engine_create_virtual(siblings, nsibling);
 		if (IS_ERR(ve[n])) {
 			err = PTR_ERR(ve[n]);
 			nctx = n;
@@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
 	 * restrict it to our desired engine within the virtual engine.
 	 */
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_close;
@@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
 		i915_request_add(rq);
 	}
 
-	ce = intel_execlists_create_virtual(siblings, nsibling);
+	ce = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ce)) {
 		err = PTR_ERR(ce);
 		goto out;
@@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
 
 	/* XXX We do not handle oversubscription and fairness with normal rq */
 	for (n = 0; n < nsibling; n++) {
-		ce = intel_execlists_create_virtual(siblings, nsibling);
+		ce = intel_engine_create_virtual(siblings, nsibling);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
 			goto out;
@@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
 	if (err)
 		goto out_scratch;
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_scratch;
@@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	if (igt_spinner_init(&spin, gt))
 		return -ENOMEM;
 
-	ve = intel_execlists_create_virtual(siblings, nsibling);
+	ve = intel_engine_create_virtual(siblings, nsibling);
 	if (IS_ERR(ve)) {
 		err = PTR_ERR(ve);
 		goto out_spin;
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 7aea10aa1fb4..08f011f893b2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -17,6 +17,8 @@
 #include "selftests/igt_flush_test.h"
 #include "selftests/igt_reset.h"
 #include "selftests/igt_atomic.h"
+#include "selftests/igt_spinner.h"
+#include "selftests/intel_scheduler_helpers.h"
 
 #include "selftests/mock_drm.h"
 
@@ -378,6 +380,7 @@ static int igt_reset_nop(void *arg)
 			ce = intel_context_create(engine);
 			if (IS_ERR(ce)) {
 				err = PTR_ERR(ce);
+				pr_err("[%s] Create context failed: %d!\n", engine->name, err);
 				break;
 			}
 
@@ -387,6 +390,8 @@ static int igt_reset_nop(void *arg)
 				rq = intel_context_create_request(ce);
 				if (IS_ERR(rq)) {
 					err = PTR_ERR(rq);
+					pr_err("[%s] Create request failed: %d!\n",
+					       engine->name, err);
 					break;
 				}
 
@@ -401,24 +406,31 @@ static int igt_reset_nop(void *arg)
 		igt_global_reset_unlock(gt);
 
 		if (intel_gt_is_wedged(gt)) {
+			pr_err("[%s] GT is wedged!\n", engine->name);
 			err = -EIO;
 			break;
 		}
 
 		if (i915_reset_count(global) != reset_count + ++count) {
-			pr_err("Full GPU reset not recorded!\n");
+			pr_err("[%s] Reset not recorded: %d vs %d + %d!\n",
+			       engine->name, i915_reset_count(global), reset_count, count);
 			err = -EINVAL;
 			break;
 		}
 
 		err = igt_flush_test(gt->i915);
-		if (err)
+		if (err) {
+			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
 			break;
+		}
 	} while (time_before(jiffies, end_time));
 	pr_info("%s: %d resets\n", __func__, count);
 
-	if (igt_flush_test(gt->i915))
+	if (igt_flush_test(gt->i915)) {
+		pr_err("Post flush failed: %d!\n", err);
 		err = -EIO;
+	}
+
 	return err;
 }
 
@@ -440,9 +452,19 @@ static int igt_reset_nop_engine(void *arg)
 		IGT_TIMEOUT(end_time);
 		int err;
 
+		if (intel_engine_uses_guc(engine)) {
+			/* Engine level resets are triggered by GuC when a hang
+			 * is detected. They can't be triggered by the KMD any
+			 * more. Thus a nop batch cannot be used as a reset test
+			 */
+			continue;
+		}
+
 		ce = intel_context_create(engine);
-		if (IS_ERR(ce))
+		if (IS_ERR(ce)) {
+			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
 			return PTR_ERR(ce);
+		}
 
 		reset_count = i915_reset_count(global);
 		reset_engine_count = i915_reset_engine_count(global, engine);
@@ -549,9 +571,15 @@ static int igt_reset_fail_engine(void *arg)
 		IGT_TIMEOUT(end_time);
 		int err;
 
+		/* Can't manually break the reset if i915 doesn't perform it */
+		if (intel_engine_uses_guc(engine))
+			continue;
+
 		ce = intel_context_create(engine);
-		if (IS_ERR(ce))
+		if (IS_ERR(ce)) {
+			pr_err("[%s] Create context failed: %d!\n", engine->name, err);
 			return PTR_ERR(ce);
+		}
 
 		st_engine_heartbeat_disable(engine);
 		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
@@ -686,8 +714,12 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 	for_each_engine(engine, gt, id) {
 		unsigned int reset_count, reset_engine_count;
 		unsigned long count;
+		bool using_guc = intel_engine_uses_guc(engine);
 		IGT_TIMEOUT(end_time);
 
+		if (using_guc && !active)
+			continue;
+
 		if (active && !intel_engine_can_store_dword(engine))
 			continue;
 
@@ -705,13 +737,24 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		count = 0;
 		do {
-			if (active) {
-				struct i915_request *rq;
+			struct i915_request *rq = NULL;
+			struct intel_selftest_saved_policy saved;
+			int err2;
+
+			err = intel_selftest_modify_policy(engine, &saved,
+							   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
+			if (err) {
+				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
+				break;
+			}
 
+			if (active) {
 				rq = hang_create_request(&h, engine);
 				if (IS_ERR(rq)) {
 					err = PTR_ERR(rq);
-					break;
+					pr_err("[%s] Create hang request failed: %d!\n",
+					       engine->name, err);
+					goto restore;
 				}
 
 				i915_request_get(rq);
@@ -727,34 +770,59 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 
 					i915_request_put(rq);
 					err = -EIO;
-					break;
+					goto restore;
 				}
+			}
 
-				i915_request_put(rq);
+			if (!using_guc) {
+				err = intel_engine_reset(engine, NULL);
+				if (err) {
+					pr_err("intel_engine_reset(%s) failed, err:%d\n",
+					       engine->name, err);
+					goto skip;
+				}
 			}
 
-			err = intel_engine_reset(engine, NULL);
-			if (err) {
-				pr_err("intel_engine_reset(%s) failed, err:%d\n",
-				       engine->name, err);
-				break;
+			if (rq) {
+				/* Ensure the reset happens and kills the engine */
+				err = intel_selftest_wait_for_rq(rq);
+				if (err)
+					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
+					       engine->name, rq->fence.context,
+					       rq->fence.seqno, rq->context->guc_id, err);
 			}
 
+skip:
+			if (rq)
+				i915_request_put(rq);
+
 			if (i915_reset_count(global) != reset_count) {
 				pr_err("Full GPU reset recorded! (engine reset expected)\n");
 				err = -EINVAL;
-				break;
+				goto restore;
 			}
 
-			if (i915_reset_engine_count(global, engine) !=
-			    ++reset_engine_count) {
-				pr_err("%s engine reset not recorded!\n",
-				       engine->name);
-				err = -EINVAL;
-				break;
+			/* GuC based resets are not logged per engine */
+			if (!using_guc) {
+				if (i915_reset_engine_count(global, engine) !=
+				    ++reset_engine_count) {
+					pr_err("%s engine reset not recorded!\n",
+					       engine->name);
+					err = -EINVAL;
+					goto restore;
+				}
 			}
 
 			count++;
+
+restore:
+			err2 = intel_selftest_restore_policy(engine, &saved);
+			if (err2)
+				pr_err("[%s] Restore policy failed: %d!\n", engine->name, err);
+			if (err == 0)
+				err = err2;
+			if (err)
+				break;
 		} while (time_before(jiffies, end_time));
 		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		st_engine_heartbeat_enable(engine);
@@ -765,12 +833,16 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
 			break;
 
 		err = igt_flush_test(gt->i915);
-		if (err)
+		if (err) {
+			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
 			break;
+		}
 	}
 
-	if (intel_gt_is_wedged(gt))
+	if (intel_gt_is_wedged(gt)) {
+		pr_err("GT is wedged!\n");
 		err = -EIO;
+	}
 
 	if (active)
 		hang_fini(&h);
@@ -807,7 +879,7 @@ static int active_request_put(struct i915_request *rq)
 	if (!rq)
 		return 0;
 
-	if (i915_request_wait(rq, 0, 5 * HZ) < 0) {
+	if (i915_request_wait(rq, 0, 10 * HZ) < 0) {
 		GEM_TRACE("%s timed out waiting for completion of fence %llx:%lld\n",
 			  rq->engine->name,
 			  rq->fence.context,
@@ -837,6 +909,7 @@ static int active_engine(void *data)
 		ce[count] = intel_context_create(engine);
 		if (IS_ERR(ce[count])) {
 			err = PTR_ERR(ce[count]);
+			pr_err("[%s] Create context #%ld failed: %d!\n", engine->name, count, err);
 			while (--count)
 				intel_context_put(ce[count]);
 			return err;
@@ -852,6 +925,7 @@ static int active_engine(void *data)
 		new = intel_context_create_request(ce[idx]);
 		if (IS_ERR(new)) {
 			err = PTR_ERR(new);
+			pr_err("[%s] Create request #%d failed: %d!\n", engine->name, idx, err);
 			break;
 		}
 
@@ -867,8 +941,10 @@ static int active_engine(void *data)
 		}
 
 		err = active_request_put(old);
-		if (err)
+		if (err) {
+			pr_err("[%s] Request put failed: %d!\n", engine->name, err);
 			break;
+		}
 
 		cond_resched();
 	}
@@ -876,6 +952,9 @@ static int active_engine(void *data)
 	for (count = 0; count < ARRAY_SIZE(rq); count++) {
 		int err__ = active_request_put(rq[count]);
 
+		if (err)
+			pr_err("[%s] Request put #%ld failed: %d!\n", engine->name, count, err);
+
 		/* Keep the first error */
 		if (!err)
 			err = err__;
@@ -916,10 +995,13 @@ static int __igt_reset_engines(struct intel_gt *gt,
 		struct active_engine threads[I915_NUM_ENGINES] = {};
 		unsigned long device = i915_reset_count(global);
 		unsigned long count = 0, reported;
+		bool using_guc = intel_engine_uses_guc(engine);
 		IGT_TIMEOUT(end_time);
 
-		if (flags & TEST_ACTIVE &&
-		    !intel_engine_can_store_dword(engine))
+		if (flags & TEST_ACTIVE) {
+			if (!intel_engine_can_store_dword(engine))
+				continue;
+		} else if (using_guc)
 			continue;
 
 		if (!wait_for_idle(engine)) {
@@ -949,6 +1031,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 					  "igt/%s", other->name);
 			if (IS_ERR(tsk)) {
 				err = PTR_ERR(tsk);
+				pr_err("[%s] Thread spawn failed: %d!\n", engine->name, err);
 				goto unwind;
 			}
 
@@ -958,16 +1041,27 @@ static int __igt_reset_engines(struct intel_gt *gt,
 
 		yield(); /* start all threads before we begin */
 
-		st_engine_heartbeat_disable(engine);
+		st_engine_heartbeat_disable_no_pm(engine);
 		set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
 		do {
 			struct i915_request *rq = NULL;
+			struct intel_selftest_saved_policy saved;
+			int err2;
+
+			err = intel_selftest_modify_policy(engine, &saved,
+							   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
+			if (err) {
+				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
+				break;
+			}
 
 			if (flags & TEST_ACTIVE) {
 				rq = hang_create_request(&h, engine);
 				if (IS_ERR(rq)) {
 					err = PTR_ERR(rq);
-					break;
+					pr_err("[%s] Create hang request failed: %d!\n",
+					       engine->name, err);
+					goto restore;
 				}
 
 				i915_request_get(rq);
@@ -983,32 +1077,44 @@ static int __igt_reset_engines(struct intel_gt *gt,
 
 					i915_request_put(rq);
 					err = -EIO;
-					break;
+					goto restore;
 				}
+			} else {
+				intel_engine_pm_get(engine);
 			}
 
-			err = intel_engine_reset(engine, NULL);
-			if (err) {
-				pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
-				       engine->name, test_name, err);
-				break;
+			if (!using_guc) {
+				err = intel_engine_reset(engine, NULL);
+				if (err) {
+					pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
+					       engine->name, test_name, err);
+					goto restore;
+				}
+			}
+
+			if (rq) {
+				/* Ensure the reset happens and kills the engine */
+				err = intel_selftest_wait_for_rq(rq);
+				if (err)
+					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
+					       engine->name, rq->fence.context,
+					       rq->fence.seqno, rq->context->guc_id, err);
 			}
 
 			count++;
 
 			if (rq) {
 				if (rq->fence.error != -EIO) {
-					pr_err("i915_reset_engine(%s:%s):"
-					       " failed to reset request %llx:%lld\n",
+					pr_err("i915_reset_engine(%s:%s): failed to reset request %lld:%lld [0x%04X]\n",
 					       engine->name, test_name,
 					       rq->fence.context,
-					       rq->fence.seqno);
+					       rq->fence.seqno, rq->context->guc_id);
 					i915_request_put(rq);
 
 					GEM_TRACE_DUMP();
 					intel_gt_set_wedged(gt);
 					err = -EIO;
-					break;
+					goto restore;
 				}
 
 				if (i915_request_wait(rq, 0, HZ / 5) < 0) {
@@ -1027,12 +1133,15 @@ static int __igt_reset_engines(struct intel_gt *gt,
 					GEM_TRACE_DUMP();
 					intel_gt_set_wedged(gt);
 					err = -EIO;
-					break;
+					goto restore;
 				}
 
 				i915_request_put(rq);
 			}
 
+			if (!(flags & TEST_ACTIVE))
+				intel_engine_pm_put(engine);
+
 			if (!(flags & TEST_SELF) && !wait_for_idle(engine)) {
 				struct drm_printer p =
 					drm_info_printer(gt->i915->drm.dev);
@@ -1044,22 +1153,34 @@ static int __igt_reset_engines(struct intel_gt *gt,
 						  "%s\n", engine->name);
 
 				err = -EIO;
-				break;
+				goto restore;
 			}
+
+restore:
+			err2 = intel_selftest_restore_policy(engine, &saved);
+			if (err2)
+				pr_err("[%s] Restore policy failed: %d!\n", engine->name, err2);
+			if (err == 0)
+				err = err2;
+			if (err)
+				break;
 		} while (time_before(jiffies, end_time));
 		clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
-		st_engine_heartbeat_enable(engine);
+		st_engine_heartbeat_enable_no_pm(engine);
 
 		pr_info("i915_reset_engine(%s:%s): %lu resets\n",
 			engine->name, test_name, count);
 
-		reported = i915_reset_engine_count(global, engine);
-		reported -= threads[engine->id].resets;
-		if (reported != count) {
-			pr_err("i915_reset_engine(%s:%s): reset %lu times, but reported %lu\n",
-			       engine->name, test_name, count, reported);
-			if (!err)
-				err = -EINVAL;
+		/* GuC based resets are not logged per engine */
+		if (!using_guc) {
+			reported = i915_reset_engine_count(global, engine);
+			reported -= threads[engine->id].resets;
+			if (reported != count) {
+				pr_err("i915_reset_engine(%s:%s): reset %lu times, but reported %lu\n",
+				       engine->name, test_name, count, reported);
+				if (!err)
+					err = -EINVAL;
+			}
 		}
 
 unwind:
@@ -1078,15 +1199,18 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			}
 			put_task_struct(threads[tmp].task);
 
-			if (other->uabi_class != engine->uabi_class &&
-			    threads[tmp].resets !=
-			    i915_reset_engine_count(global, other)) {
-				pr_err("Innocent engine %s was reset (count=%ld)\n",
-				       other->name,
-				       i915_reset_engine_count(global, other) -
-				       threads[tmp].resets);
-				if (!err)
-					err = -EINVAL;
+			/* GuC based resets are not logged per engine */
+			if (!using_guc) {
+				if (other->uabi_class != engine->uabi_class &&
+				    threads[tmp].resets !=
+				    i915_reset_engine_count(global, other)) {
+					pr_err("Innocent engine %s was reset (count=%ld)\n",
+					       other->name,
+					       i915_reset_engine_count(global, other) -
+					       threads[tmp].resets);
+					if (!err)
+						err = -EINVAL;
+				}
 			}
 		}
 
@@ -1101,8 +1225,10 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			break;
 
 		err = igt_flush_test(gt->i915);
-		if (err)
+		if (err) {
+			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
 			break;
+		}
 	}
 
 	if (intel_gt_is_wedged(gt))
@@ -1180,12 +1306,15 @@ static int igt_reset_wait(void *arg)
 	igt_global_reset_lock(gt);
 
 	err = hang_init(&h, gt);
-	if (err)
+	if (err) {
+		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
 		goto unlock;
+	}
 
 	rq = hang_create_request(&h, engine);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
+		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
 		goto fini;
 	}
 
@@ -1310,12 +1439,15 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	/* Check that we can recover an unbind stuck on a hanging request */
 
 	err = hang_init(&h, gt);
-	if (err)
+	if (err) {
+		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
 		return err;
+	}
 
 	obj = i915_gem_object_create_internal(gt->i915, SZ_1M);
 	if (IS_ERR(obj)) {
 		err = PTR_ERR(obj);
+		pr_err("[%s] Create object failed: %d!\n", engine->name, err);
 		goto fini;
 	}
 
@@ -1330,12 +1462,14 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	arg.vma = i915_vma_instance(obj, vm, NULL);
 	if (IS_ERR(arg.vma)) {
 		err = PTR_ERR(arg.vma);
+		pr_err("[%s] VMA instance failed: %d!\n", engine->name, err);
 		goto out_obj;
 	}
 
 	rq = hang_create_request(&h, engine);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
+		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
 		goto out_obj;
 	}
 
@@ -1347,6 +1481,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	err = i915_vma_pin(arg.vma, 0, 0, pin_flags);
 	if (err) {
 		i915_request_add(rq);
+		pr_err("[%s] VMA pin failed: %d!\n", engine->name, err);
 		goto out_obj;
 	}
 
@@ -1363,8 +1498,14 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	i915_vma_lock(arg.vma);
 	err = i915_request_await_object(rq, arg.vma->obj,
 					flags & EXEC_OBJECT_WRITE);
-	if (err == 0)
+	if (err == 0) {
 		err = i915_vma_move_to_active(arg.vma, rq, flags);
+		if (err)
+			pr_err("[%s] Move to active failed: %d!\n", engine->name, err);
+	} else {
+		pr_err("[%s] Request await failed: %d!\n", engine->name, err);
+	}
+
 	i915_vma_unlock(arg.vma);
 
 	if (flags & EXEC_OBJECT_NEEDS_FENCE)
@@ -1392,6 +1533,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	tsk = kthread_run(fn, &arg, "igt/evict_vma");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
+		pr_err("[%s] Thread spawn failed: %d!\n", engine->name, err);
 		tsk = NULL;
 		goto out_reset;
 	}
@@ -1508,17 +1650,29 @@ static int igt_reset_queue(void *arg)
 		goto unlock;
 
 	for_each_engine(engine, gt, id) {
+		struct intel_selftest_saved_policy saved;
 		struct i915_request *prev;
 		IGT_TIMEOUT(end_time);
 		unsigned int count;
+		bool using_guc = intel_engine_uses_guc(engine);
 
 		if (!intel_engine_can_store_dword(engine))
 			continue;
 
+		if (using_guc) {
+			err = intel_selftest_modify_policy(engine, &saved,
+							   SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK);
+			if (err) {
+				pr_err("[%s] Modify policy failed: %d!\n", engine->name, err);
+				goto fini;
+			}
+		}
+
 		prev = hang_create_request(&h, engine);
 		if (IS_ERR(prev)) {
 			err = PTR_ERR(prev);
-			goto fini;
+			pr_err("[%s] Create 'prev' hang request failed: %d!\n", engine->name, err);
+			goto restore;
 		}
 
 		i915_request_get(prev);
@@ -1532,7 +1686,8 @@ static int igt_reset_queue(void *arg)
 			rq = hang_create_request(&h, engine);
 			if (IS_ERR(rq)) {
 				err = PTR_ERR(rq);
-				goto fini;
+				pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
+				goto restore;
 			}
 
 			i915_request_get(rq);
@@ -1557,7 +1712,7 @@ static int igt_reset_queue(void *arg)
 
 				GEM_TRACE_DUMP();
 				intel_gt_set_wedged(gt);
-				goto fini;
+				goto restore;
 			}
 
 			if (!wait_until_running(&h, prev)) {
@@ -1575,7 +1730,7 @@ static int igt_reset_queue(void *arg)
 				intel_gt_set_wedged(gt);
 
 				err = -EIO;
-				goto fini;
+				goto restore;
 			}
 
 			reset_count = fake_hangcheck(gt, BIT(id));
@@ -1586,7 +1741,7 @@ static int igt_reset_queue(void *arg)
 				i915_request_put(rq);
 				i915_request_put(prev);
 				err = -EINVAL;
-				goto fini;
+				goto restore;
 			}
 
 			if (rq->fence.error) {
@@ -1595,7 +1750,7 @@ static int igt_reset_queue(void *arg)
 				i915_request_put(rq);
 				i915_request_put(prev);
 				err = -EINVAL;
-				goto fini;
+				goto restore;
 			}
 
 			if (i915_reset_count(global) == reset_count) {
@@ -1603,7 +1758,7 @@ static int igt_reset_queue(void *arg)
 				i915_request_put(rq);
 				i915_request_put(prev);
 				err = -EINVAL;
-				goto fini;
+				goto restore;
 			}
 
 			i915_request_put(prev);
@@ -1618,9 +1773,24 @@ static int igt_reset_queue(void *arg)
 
 		i915_request_put(prev);
 
-		err = igt_flush_test(gt->i915);
+restore:
+		if (using_guc) {
+			int err2 = intel_selftest_restore_policy(engine, &saved);
+
+			if (err2)
+				pr_err("%s:%d> [%s] Restore policy failed: %d!\n",
+				       __func__, __LINE__, engine->name, err2);
+			if (err == 0)
+				err = err2;
+		}
 		if (err)
+			goto fini;
+
+		err = igt_flush_test(gt->i915);
+		if (err) {
+			pr_err("[%s] Flush failed: %d!\n", engine->name, err);
 			break;
+		}
 	}
 
 fini:
@@ -1653,12 +1823,15 @@ static int igt_handle_error(void *arg)
 		return 0;
 
 	err = hang_init(&h, gt);
-	if (err)
+	if (err) {
+		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
 		return err;
+	}
 
 	rq = hang_create_request(&h, engine);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
+		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
 		goto err_fini;
 	}
 
@@ -1743,12 +1916,15 @@ static int igt_atomic_reset_engine(struct intel_engine_cs *engine,
 		return err;
 
 	err = hang_init(&h, engine->gt);
-	if (err)
+	if (err) {
+		pr_err("[%s] Hang init failed: %d!\n", engine->name, err);
 		return err;
+	}
 
 	rq = hang_create_request(&h, engine);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
+		pr_err("[%s] Create hang request failed: %d!\n", engine->name, err);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index 8763bbeca0f7..13d25bf2a94a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -10,6 +10,7 @@
 #include "gem/selftests/mock_context.h"
 #include "selftests/igt_reset.h"
 #include "selftests/igt_spinner.h"
+#include "selftests/intel_scheduler_helpers.h"
 
 struct live_mocs {
 	struct drm_i915_mocs_table table;
@@ -318,7 +319,8 @@ static int live_mocs_clean(void *arg)
 }
 
 static int active_engine_reset(struct intel_context *ce,
-			       const char *reason)
+			       const char *reason,
+			       bool using_guc)
 {
 	struct igt_spinner spin;
 	struct i915_request *rq;
@@ -335,9 +337,13 @@ static int active_engine_reset(struct intel_context *ce,
 	}
 
 	err = request_add_spin(rq, &spin);
-	if (err == 0)
+	if (err == 0 && !using_guc)
 		err = intel_engine_reset(ce->engine, reason);
 
+	/* Ensure the reset happens and kills the engine */
+	if (err == 0)
+		err = intel_selftest_wait_for_rq(rq);
+
 	igt_spinner_end(&spin);
 	igt_spinner_fini(&spin);
 
@@ -345,21 +351,23 @@ static int active_engine_reset(struct intel_context *ce,
 }
 
 static int __live_mocs_reset(struct live_mocs *mocs,
-			     struct intel_context *ce)
+			     struct intel_context *ce, bool using_guc)
 {
 	struct intel_gt *gt = ce->engine->gt;
 	int err;
 
 	if (intel_has_reset_engine(gt)) {
-		err = intel_engine_reset(ce->engine, "mocs");
-		if (err)
-			return err;
-
-		err = check_mocs_engine(mocs, ce);
-		if (err)
-			return err;
+		if (!using_guc) {
+			err = intel_engine_reset(ce->engine, "mocs");
+			if (err)
+				return err;
+
+			err = check_mocs_engine(mocs, ce);
+			if (err)
+				return err;
+		}
 
-		err = active_engine_reset(ce, "mocs");
+		err = active_engine_reset(ce, "mocs", using_guc);
 		if (err)
 			return err;
 
@@ -395,19 +403,33 @@ static int live_mocs_reset(void *arg)
 
 	igt_global_reset_lock(gt);
 	for_each_engine(engine, gt, id) {
+		bool using_guc = intel_engine_uses_guc(engine);
+		struct intel_selftest_saved_policy saved;
 		struct intel_context *ce;
+		int err2;
+
+		err = intel_selftest_modify_policy(engine, &saved,
+						   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
+		if (err)
+			break;
 
 		ce = mocs_context_create(engine);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
-			break;
+			goto restore;
 		}
 
 		intel_engine_pm_get(engine);
-		err = __live_mocs_reset(&mocs, ce);
-		intel_engine_pm_put(engine);
 
+		err = __live_mocs_reset(&mocs, ce, using_guc);
+
+		intel_engine_pm_put(engine);
 		intel_context_put(ce);
+
+restore:
+		err2 = intel_selftest_restore_policy(engine, &saved);
+		if (err == 0)
+			err = err2;
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 7a38ce40feb2..e623ac45f4aa 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -12,6 +12,7 @@
 #include "selftests/igt_flush_test.h"
 #include "selftests/igt_reset.h"
 #include "selftests/igt_spinner.h"
+#include "selftests/intel_scheduler_helpers.h"
 #include "selftests/mock_drm.h"
 
 #include "gem/selftests/igt_gem_utils.h"
@@ -261,28 +262,34 @@ static int do_engine_reset(struct intel_engine_cs *engine)
 	return intel_engine_reset(engine, "live_workarounds");
 }
 
+static int do_guc_reset(struct intel_engine_cs *engine)
+{
+	/* Currently a no-op as the reset is handled by GuC */
+	return 0;
+}
+
 static int
 switch_to_scratch_context(struct intel_engine_cs *engine,
-			  struct igt_spinner *spin)
+			  struct igt_spinner *spin,
+			  struct i915_request **rq)
 {
 	struct intel_context *ce;
-	struct i915_request *rq;
 	int err = 0;
 
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
-	rq = igt_spinner_create_request(spin, ce, MI_NOOP);
+	*rq = igt_spinner_create_request(spin, ce, MI_NOOP);
 	intel_context_put(ce);
 
-	if (IS_ERR(rq)) {
+	if (IS_ERR(*rq)) {
 		spin = NULL;
-		err = PTR_ERR(rq);
+		err = PTR_ERR(*rq);
 		goto err;
 	}
 
-	err = request_add_spin(rq, spin);
+	err = request_add_spin(*rq, spin);
 err:
 	if (err && spin)
 		igt_spinner_end(spin);
@@ -296,6 +303,7 @@ static int check_whitelist_across_reset(struct intel_engine_cs *engine,
 {
 	struct intel_context *ce, *tmp;
 	struct igt_spinner spin;
+	struct i915_request *rq;
 	intel_wakeref_t wakeref;
 	int err;
 
@@ -316,13 +324,24 @@ static int check_whitelist_across_reset(struct intel_engine_cs *engine,
 		goto out_spin;
 	}
 
-	err = switch_to_scratch_context(engine, &spin);
+	err = switch_to_scratch_context(engine, &spin, &rq);
 	if (err)
 		goto out_spin;
 
+	/* Ensure the spinner hasn't aborted */
+	if (i915_request_completed(rq)) {
+		pr_err("%s spinner failed to start\n", name);
+		err = -ETIMEDOUT;
+		goto out_spin;
+	}
+
 	with_intel_runtime_pm(engine->uncore->rpm, wakeref)
 		err = reset(engine);
 
+	/* Ensure the reset happens and kills the engine */
+	if (err == 0)
+		err = intel_selftest_wait_for_rq(rq);
+
 	igt_spinner_end(&spin);
 
 	if (err) {
@@ -787,9 +806,28 @@ static int live_reset_whitelist(void *arg)
 			continue;
 
 		if (intel_has_reset_engine(gt)) {
-			err = check_whitelist_across_reset(engine,
-							   do_engine_reset,
-							   "engine");
+			if (intel_engine_uses_guc(engine)) {
+				struct intel_selftest_saved_policy saved;
+				int err2;
+
+				err = intel_selftest_modify_policy(engine, &saved,
+								   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
+				if (err)
+					goto out;
+
+				err = check_whitelist_across_reset(engine,
+								   do_guc_reset,
+								   "guc");
+
+				err2 = intel_selftest_restore_policy(engine, &saved);
+				if (err == 0)
+					err = err2;
+			} else {
+				err = check_whitelist_across_reset(engine,
+								   do_engine_reset,
+								   "engine");
+			}
+
 			if (err)
 				goto out;
 		}
@@ -1235,31 +1273,41 @@ live_engine_reset_workarounds(void *arg)
 	reference_lists_init(gt, lists);
 
 	for_each_engine(engine, gt, id) {
+		struct intel_selftest_saved_policy saved;
+		bool using_guc = intel_engine_uses_guc(engine);
 		bool ok;
+		int ret2;
 
 		pr_info("Verifying after %s reset...\n", engine->name);
+		ret = intel_selftest_modify_policy(engine, &saved,
+						   SELFTEST_SCHEDULER_MODIFY_FAST_RESET);
+		if (ret)
+			break;
+
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			break;
+			goto restore;
 		}
 
-		ok = verify_wa_lists(gt, lists, "before reset");
-		if (!ok) {
-			ret = -ESRCH;
-			goto err;
-		}
+		if (!using_guc) {
+			ok = verify_wa_lists(gt, lists, "before reset");
+			if (!ok) {
+				ret = -ESRCH;
+				goto err;
+			}
 
-		ret = intel_engine_reset(engine, "live_workarounds:idle");
-		if (ret) {
-			pr_err("%s: Reset failed while idle\n", engine->name);
-			goto err;
-		}
+			ret = intel_engine_reset(engine, "live_workarounds:idle");
+			if (ret) {
+				pr_err("%s: Reset failed while idle\n", engine->name);
+				goto err;
+			}
 
-		ok = verify_wa_lists(gt, lists, "after idle reset");
-		if (!ok) {
-			ret = -ESRCH;
-			goto err;
+			ok = verify_wa_lists(gt, lists, "after idle reset");
+			if (!ok) {
+				ret = -ESRCH;
+				goto err;
+			}
 		}
 
 		ret = igt_spinner_init(&spin, engine->gt);
@@ -1280,25 +1328,41 @@ live_engine_reset_workarounds(void *arg)
 			goto err;
 		}
 
-		ret = intel_engine_reset(engine, "live_workarounds:active");
-		if (ret) {
-			pr_err("%s: Reset failed on an active spinner\n",
-			       engine->name);
-			igt_spinner_fini(&spin);
-			goto err;
+		/* Ensure the spinner hasn't aborted */
+		if (i915_request_completed(rq)) {
+			ret = -ETIMEDOUT;
+			goto skip;
+		}
+
+		if (!using_guc) {
+			ret = intel_engine_reset(engine, "live_workarounds:active");
+			if (ret) {
+				pr_err("%s: Reset failed on an active spinner\n",
+				       engine->name);
+				igt_spinner_fini(&spin);
+				goto err;
+			}
 		}
 
+		/* Ensure the reset happens and kills the engine */
+		if (ret == 0)
+			ret = intel_selftest_wait_for_rq(rq);
+
+skip:
 		igt_spinner_end(&spin);
 		igt_spinner_fini(&spin);
 
 		ok = verify_wa_lists(gt, lists, "after busy reset");
-		if (!ok) {
+		if (!ok)
 			ret = -ESRCH;
-			goto err;
-		}
 
 err:
 		intel_context_put(ce);
+
+restore:
+		ret2 = intel_selftest_restore_policy(engine, &saved);
+		if (ret == 0)
+			ret = ret2;
 		if (ret)
 			break;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 57e18babdf4b..d832c8f11c11 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -142,6 +142,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
 	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
+	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
 	INTEL_GUC_ACTION_LIMIT
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 6661dcb02239..979128e28372 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -180,6 +180,11 @@ void intel_guc_init_early(struct intel_guc *guc)
 	}
 }
 
+void intel_guc_init_late(struct intel_guc *guc)
+{
+	intel_guc_ads_init_late(guc);
+}
+
 static u32 guc_ctl_debug_flags(struct intel_guc *guc)
 {
 	u32 level = intel_guc_log_get_level(&guc->log);
@@ -524,65 +529,35 @@ int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset)
  */
 int intel_guc_suspend(struct intel_guc *guc)
 {
-	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
 	int ret;
-	u32 status;
 	u32 action[] = {
-		INTEL_GUC_ACTION_ENTER_S_STATE,
-		GUC_POWER_D1, /* any value greater than GUC_POWER_D0 */
+		INTEL_GUC_ACTION_RESET_CLIENT,
 	};
 
-	/*
-	 * If GuC communication is enabled but submission is not supported,
-	 * we do not need to suspend the GuC.
-	 */
-	if (!intel_guc_submission_is_used(guc) || !intel_guc_is_ready(guc))
+	if (!intel_guc_is_ready(guc))
 		return 0;
 
-	/*
-	 * The ENTER_S_STATE action queues the save/restore operation in GuC FW
-	 * and then returns, so waiting on the H2G is not enough to guarantee
-	 * GuC is done. When all the processing is done, GuC writes
-	 * INTEL_GUC_SLEEP_STATE_SUCCESS to scratch register 14, so we can poll
-	 * on that. Note that GuC does not ensure that the value in the register
-	 * is different from INTEL_GUC_SLEEP_STATE_SUCCESS while the action is
-	 * in progress so we need to take care of that ourselves as well.
-	 */
-
-	intel_uncore_write(uncore, SOFT_SCRATCH(14),
-			   INTEL_GUC_SLEEP_STATE_INVALID_MASK);
-
-	ret = intel_guc_send(guc, action, ARRAY_SIZE(action));
-	if (ret)
-		return ret;
-
-	ret = __intel_wait_for_register(uncore, SOFT_SCRATCH(14),
-					INTEL_GUC_SLEEP_STATE_INVALID_MASK,
-					0, 0, 10, &status);
-	if (ret)
-		return ret;
-
-	if (status != INTEL_GUC_SLEEP_STATE_SUCCESS) {
-		DRM_ERROR("GuC failed to change sleep state. "
-			  "action=0x%x, err=%u\n",
-			  action[0], status);
-		return -EIO;
+	if (intel_guc_submission_is_used(guc)) {
+		/*
+		 * This H2G MMIO command tears down the GuC in two steps. First it will
+		 * generate a G2H CTB for every active context indicating a reset. In
+		 * practice the i915 shouldn't ever get a G2H as suspend should only be
+		 * called when the GPU is idle. Next, it tears down the CTBs and this
+		 * H2G MMIO command completes.
+		 *
+		 * Don't abort on a failure code from the GuC. Keep going and do the
+		 * clean up in santize() and re-initialisation on resume and hopefully
+		 * the error here won't be problematic.
+		 */
+		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
+		if (ret)
+			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
 	}
 
-	return 0;
-}
+	/* Signal that the GuC isn't running. */
+	intel_guc_sanitize(guc);
 
-/**
- * intel_guc_reset_engine() - ask GuC to reset an engine
- * @guc:	intel_guc structure
- * @engine:	engine to be reset
- */
-int intel_guc_reset_engine(struct intel_guc *guc,
-			   struct intel_engine_cs *engine)
-{
-	/* XXX: to be implemented with submission interface rework */
-
-	return -ENODEV;
+	return 0;
 }
 
 /**
@@ -591,7 +566,12 @@ int intel_guc_reset_engine(struct intel_guc *guc,
  */
 int intel_guc_resume(struct intel_guc *guc)
 {
-	/* XXX: to be implemented with submission interface rework */
+	/*
+	 * NB: This function can still be called even if GuC submission is
+	 * disabled, e.g. if GuC is enabled for HuC authentication only. Thus,
+	 * if any code is later added here, it must be support doing nothing
+	 * if submission is disabled (as per intel_guc_suspend).
+	 */
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index d4987cd789ea..a9547069ee7e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -55,10 +55,13 @@ struct intel_guc {
 	struct ida guc_ids;
 	struct list_head guc_id_list;
 
+	bool submission_supported;
 	bool submission_selected;
 
 	struct i915_vma *ads_vma;
 	struct __guc_ads_blob *ads_blob;
+	u32 ads_regset_size;
+	u32 ads_golden_ctxt_size;
 
 	struct i915_vma *lrc_desc_pool;
 	void *lrc_desc_pool_vaddr;
@@ -182,6 +185,7 @@ static inline u32 intel_guc_ggtt_offset(struct intel_guc *guc,
 }
 
 void intel_guc_init_early(struct intel_guc *guc);
+void intel_guc_init_late(struct intel_guc *guc);
 void intel_guc_init_send_regs(struct intel_guc *guc);
 void intel_guc_write_params(struct intel_guc *guc);
 int intel_guc_init(struct intel_guc *guc);
@@ -224,9 +228,25 @@ static inline bool intel_guc_is_ready(struct intel_guc *guc)
 	return intel_guc_is_fw_running(guc) && intel_guc_ct_enabled(&guc->ct);
 }
 
+static inline void intel_guc_reset_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.reset(guc);
+}
+
+static inline void intel_guc_enable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.enable(guc);
+}
+
+static inline void intel_guc_disable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.disable(guc);
+}
+
 static inline int intel_guc_sanitize(struct intel_guc *guc)
 {
 	intel_uc_fw_sanitize(&guc->fw);
+	intel_guc_disable_interrupts(guc);
 	intel_guc_ct_sanitize(&guc->ct);
 	guc->mmio_msg = 0;
 
@@ -249,13 +269,25 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
 
 int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
 
-int intel_guc_reset_engine(struct intel_guc *guc,
-			   struct intel_engine_cs *engine);
-
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
 int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len);
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len);
+
+void intel_guc_find_hung_context(struct intel_engine_cs *engine);
+
+int intel_guc_global_policies_update(struct intel_guc *guc);
+
+void intel_guc_context_ban(struct intel_context *ce, struct i915_request *rq);
+
+void intel_guc_submission_reset_prepare(struct intel_guc *guc);
+void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
+void intel_guc_submission_reset_finish(struct intel_guc *guc);
+void intel_guc_submission_cancel_requests(struct intel_guc *guc);
 
 void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index b82145652d57..6926919bcac6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -3,8 +3,11 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
+#include <linux/bsearch.h>
+
 #include "gt/intel_gt.h"
 #include "gt/intel_lrc.h"
+#include "gt/shmem_utils.h"
 #include "intel_guc_ads.h"
 #include "intel_guc_fwif.h"
 #include "intel_uc.h"
@@ -23,6 +26,15 @@
  *      | guc_policies                          |
  *      +---------------------------------------+
  *      | guc_gt_system_info                    |
+ *      +---------------------------------------+ <== static
+ *      | guc_mmio_reg[countA] (engine 0.0)     |
+ *      | guc_mmio_reg[countB] (engine 0.1)     |
+ *      | guc_mmio_reg[countC] (engine 1.0)     |
+ *      |   ...                                 |
+ *      +---------------------------------------+ <== dynamic
+ *      | padding                               |
+ *      +---------------------------------------+ <== 4K aligned
+ *      | golden contexts                       |
  *      +---------------------------------------+
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
@@ -35,16 +47,49 @@ struct __guc_ads_blob {
 	struct guc_ads ads;
 	struct guc_policies policies;
 	struct guc_gt_system_info system_info;
+	/* From here on, location is dynamic! Refer to above diagram. */
+	struct guc_mmio_reg regset[0];
 } __packed;
 
+static u32 guc_ads_regset_size(struct intel_guc *guc)
+{
+	GEM_BUG_ON(!guc->ads_regset_size);
+	return guc->ads_regset_size;
+}
+
+static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
+{
+	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
+}
+
 static u32 guc_ads_private_data_size(struct intel_guc *guc)
 {
 	return PAGE_ALIGN(guc->fw.private_data_size);
 }
 
+static u32 guc_ads_regset_offset(struct intel_guc *guc)
+{
+	return offsetof(struct __guc_ads_blob, regset);
+}
+
+static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
+{
+	u32 offset;
+
+	offset = guc_ads_regset_offset(guc) +
+		 guc_ads_regset_size(guc);
+
+	return PAGE_ALIGN(offset);
+}
+
 static u32 guc_ads_private_data_offset(struct intel_guc *guc)
 {
-	return PAGE_ALIGN(sizeof(struct __guc_ads_blob));
+	u32 offset;
+
+	offset = guc_ads_golden_ctxt_offset(guc) +
+		 guc_ads_golden_ctxt_size(guc);
+
+	return PAGE_ALIGN(offset);
 }
 
 static u32 guc_ads_blob_size(struct intel_guc *guc)
@@ -53,15 +98,68 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
 	       guc_ads_private_data_size(guc);
 }
 
-static void guc_policies_init(struct guc_policies *policies)
+static void guc_policies_init(struct intel_guc *guc, struct guc_policies *policies)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+
 	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
 	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
-	/* Disable automatic resets as not yet supported. */
-	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	policies->global_flags = 0;
+	if (i915->params.reset < 2)
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
 	policies->is_valid = 1;
 }
 
+void intel_guc_ads_print_policy_info(struct intel_guc *guc,
+				     struct drm_printer *dp)
+{
+	struct __guc_ads_blob *blob = guc->ads_blob;
+
+	if (unlikely(!blob))
+		return;
+
+	drm_printf(dp, "Global scheduling policies:\n");
+	drm_printf(dp, "  DPC promote time   = %u\n", blob->policies.dpc_promote_time);
+	drm_printf(dp, "  Max num work items = %u\n", blob->policies.max_num_work_items);
+	drm_printf(dp, "  Flags              = %u\n", blob->policies.global_flags);
+}
+
+static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+}
+
+int intel_guc_global_policies_update(struct intel_guc *guc)
+{
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+	int ret;
+
+	if (!blob)
+		return -EOPNOTSUPP;
+
+	GEM_BUG_ON(!blob->ads.scheduler_policies);
+
+	guc_policies_init(guc, &blob->policies);
+
+	if (!intel_guc_is_ready(guc))
+		return 0;
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		ret = guc_action_policies_update(guc, blob->ads.scheduler_policies);
+
+	return ret;
+}
+
 static void guc_mapping_table_init(struct intel_gt *gt,
 				   struct guc_gt_system_info *system_info)
 {
@@ -84,53 +182,324 @@ static void guc_mapping_table_init(struct intel_gt *gt,
 }
 
 /*
- * The first 80 dwords of the register state context, containing the
- * execlists and ppgtt registers.
+ * The save/restore register list must be pre-calculated to a temporary
+ * buffer of driver defined size before it can be generated in place
+ * inside the ADS.
  */
-#define LR_HW_CONTEXT_SIZE	(80 * sizeof(u32))
+#define MAX_MMIO_REGS	128	/* Arbitrary size, increase as needed */
+struct temp_regset {
+	struct guc_mmio_reg *registers;
+	u32 used;
+	u32 size;
+};
 
-static void __guc_ads_init(struct intel_guc *guc)
+static int guc_mmio_reg_cmp(const void *a, const void *b)
+{
+	const struct guc_mmio_reg *ra = a;
+	const struct guc_mmio_reg *rb = b;
+
+	return (int)ra->offset - (int)rb->offset;
+}
+
+static void guc_mmio_reg_add(struct temp_regset *regset,
+			     u32 offset, u32 flags)
+{
+	u32 count = regset->used;
+	struct guc_mmio_reg reg = {
+		.offset = offset,
+		.flags = flags,
+	};
+	struct guc_mmio_reg *slot;
+
+	GEM_BUG_ON(count >= regset->size);
+
+	/*
+	 * The mmio list is built using separate lists within the driver.
+	 * It's possible that at some point we may attempt to add the same
+	 * register more than once. Do not consider this an error; silently
+	 * move on if the register is already in the list.
+	 */
+	if (bsearch(&reg, regset->registers, count,
+		    sizeof(reg), guc_mmio_reg_cmp))
+		return;
+
+	slot = &regset->registers[count];
+	regset->used++;
+	*slot = reg;
+
+	while (slot-- > regset->registers) {
+		GEM_BUG_ON(slot[0].offset == slot[1].offset);
+		if (slot[1].offset > slot[0].offset)
+			break;
+
+		swap(slot[1], slot[0]);
+	}
+}
+
+#define GUC_MMIO_REG_ADD(regset, reg, masked) \
+	guc_mmio_reg_add(regset, \
+			 i915_mmio_reg_offset((reg)), \
+			 (masked) ? GUC_REGSET_MASKED : 0)
+
+static void guc_mmio_regset_init(struct temp_regset *regset,
+				 struct intel_engine_cs *engine)
+{
+	const u32 base = engine->mmio_base;
+	struct i915_wa_list *wal = &engine->wa_list;
+	struct i915_wa *wa;
+	unsigned int i;
+
+	regset->used = 0;
+
+	GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
+	GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
+	GUC_MMIO_REG_ADD(regset, RING_IMR(base), false);
+
+	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
+		GUC_MMIO_REG_ADD(regset, wa->reg, wa->masked_reg);
+
+	/* Be extra paranoid and include all whitelist registers. */
+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
+		GUC_MMIO_REG_ADD(regset,
+				 RING_FORCE_TO_NONPRIV(base, i),
+				 false);
+
+	/* add in local MOCS registers */
+	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
+		GUC_MMIO_REG_ADD(regset, GEN9_LNCFCMOCS(i), false);
+}
+
+static int guc_mmio_reg_state_query(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = gt->i915;
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	struct temp_regset temp_set;
+	u32 total;
+
+	/*
+	 * Need to actually build the list in order to filter out
+	 * duplicates and other such data dependent constructions.
+	 */
+	temp_set.size = MAX_MMIO_REGS;
+	temp_set.registers = kmalloc_array(temp_set.size,
+					   sizeof(*temp_set.registers),
+					   GFP_KERNEL);
+	if (!temp_set.registers)
+		return -ENOMEM;
+
+	total = 0;
+	for_each_engine(engine, gt, id) {
+		guc_mmio_regset_init(&temp_set, engine);
+		total += temp_set.used;
+	}
+
+	kfree(temp_set.registers);
+
+	return total * sizeof(struct guc_mmio_reg);
+}
+
+static void guc_mmio_reg_state_init(struct intel_guc *guc,
+				    struct __guc_ads_blob *blob)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	struct temp_regset temp_set;
+	struct guc_mmio_reg_set *ads_reg_set;
+	u32 addr_ggtt, offset;
+	u8 guc_class;
+
+	offset = guc_ads_regset_offset(guc);
+	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+	temp_set.registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
+	temp_set.size = guc->ads_regset_size / sizeof(temp_set.registers[0]);
+
+	for_each_engine(engine, gt, id) {
+		/* Class index is checked in class converter */
+		GEM_BUG_ON(engine->instance >= GUC_MAX_INSTANCES_PER_CLASS);
+
+		guc_class = engine_class_to_guc_class(engine->class);
+		ads_reg_set = &blob->ads.reg_state_list[guc_class][engine->instance];
+
+		guc_mmio_regset_init(&temp_set, engine);
+		if (!temp_set.used) {
+			ads_reg_set->address = 0;
+			ads_reg_set->count = 0;
+			continue;
+		}
+
+		ads_reg_set->address = addr_ggtt;
+		ads_reg_set->count = temp_set.used;
+
+		temp_set.size -= temp_set.used;
+		temp_set.registers += temp_set.used;
+		addr_ggtt += temp_set.used * sizeof(struct guc_mmio_reg);
+	}
+
+	GEM_BUG_ON(temp_set.size);
+}
+
+static void fill_engine_enable_masks(struct intel_gt *gt,
+				     struct guc_gt_system_info *info)
+{
+	info->engine_enabled_masks[GUC_RENDER_CLASS] = 1;
+	info->engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
+	info->engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
+	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
+}
+
+static int guc_prep_golden_context(struct intel_guc *guc,
+				   struct __guc_ads_blob *blob)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u32 addr_ggtt, offset;
+	u32 total_size = 0, alloc_size, real_size;
+	u8 engine_class, guc_class;
+	struct guc_gt_system_info *info, local_info;
+
+	/*
+	 * Reserve the memory for the golden contexts and point GuC at it but
+	 * leave it empty for now. The context data will be filled in later
+	 * once there is something available to put there.
+	 *
+	 * Note that the HWSP and ring context are not included.
+	 *
+	 * Note also that the storage must be pinned in the GGTT, so that the
+	 * address won't change after GuC has been told where to find it. The
+	 * GuC will also validate that the LRC base + size fall within the
+	 * allowed GGTT range.
+	 */
+	if (blob) {
+		offset = guc_ads_golden_ctxt_offset(guc);
+		addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+		info = &blob->system_info;
+	} else {
+		memset(&local_info, 0, sizeof(local_info));
+		info = &local_info;
+		fill_engine_enable_masks(gt, info);
+	}
+
+	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
+		if (engine_class == OTHER_CLASS)
+			continue;
+
+		guc_class = engine_class_to_guc_class(engine_class);
+
+		if (!info->engine_enabled_masks[guc_class])
+			continue;
+
+		real_size = intel_engine_context_size(gt, engine_class);
+		alloc_size = PAGE_ALIGN(real_size);
+		total_size += alloc_size;
+
+		if (!blob)
+			continue;
+
+		blob->ads.eng_state_size[guc_class] = real_size;
+		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
+		addr_ggtt += alloc_size;
+	}
+
+	if (!blob)
+		return total_size;
+
+	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
+	return total_size;
+}
+
+static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_class)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id) {
+		if (engine->class != engine_class)
+			continue;
+
+		if (!engine->default_state)
+			continue;
+
+		return engine;
+	}
+
+	return NULL;
+}
+
+static void guc_init_golden_context(struct intel_guc *guc)
+{
 	struct __guc_ads_blob *blob = guc->ads_blob;
-	const u32 skipped_size = LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE;
-	u32 base;
+	struct intel_engine_cs *engine;
+	struct intel_gt *gt = guc_to_gt(guc);
+	u32 addr_ggtt, offset;
+	u32 total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
+	u8 *ptr;
 
-	/* GuC scheduling policies */
-	guc_policies_init(&blob->policies);
+	/* Skip execlist and PPGTT registers + HWSP */
+	const u32 lr_hw_context_size = 80 * sizeof(u32);
+	const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
+		lr_hw_context_size;
+
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return;
+
+	GEM_BUG_ON(!blob);
 
 	/*
-	 * GuC expects a per-engine-class context image and size
-	 * (minus hwsp and ring context). The context image will be
-	 * used to reinitialize engines after a reset. It must exist
-	 * and be pinned in the GGTT, so that the address won't change after
-	 * we have told GuC where to find it. The context size will be used
-	 * to validate that the LRC base + size fall within allowed GGTT.
+	 * Go back and fill in the golden context data now that it is
+	 * available.
 	 */
+	offset = guc_ads_golden_ctxt_offset(guc);
+	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+	ptr = ((u8 *)blob) + offset;
+
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
 		if (engine_class == OTHER_CLASS)
 			continue;
 
 		guc_class = engine_class_to_guc_class(engine_class);
 
-		/*
-		 * TODO: Set context pointer to default state to allow
-		 * GuC to re-init guilty contexts after internal reset.
-		 */
-		blob->ads.golden_context_lrca[guc_class] = 0;
-		blob->ads.eng_state_size[guc_class] =
-			intel_engine_context_size(guc_to_gt(guc),
-						  engine_class) -
-			skipped_size;
+		if (!blob->system_info.engine_enabled_masks[guc_class])
+			continue;
+
+		real_size = intel_engine_context_size(gt, engine_class);
+		alloc_size = PAGE_ALIGN(real_size);
+		total_size += alloc_size;
+
+		engine = find_engine_state(gt, engine_class);
+		if (!engine) {
+			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
+				engine_class);
+			blob->ads.eng_state_size[guc_class] = 0;
+			blob->ads.golden_context_lrca[guc_class] = 0;
+			continue;
+		}
+
+		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
+		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
+		addr_ggtt += alloc_size;
+
+		shmem_read(engine->default_state, skip_size, ptr + skip_size,
+			   real_size - skip_size);
+		ptr += alloc_size;
 	}
 
+	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
+}
+
+static void __guc_ads_init(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	u32 base;
+
+	/* GuC scheduling policies */
+	guc_policies_init(guc, &blob->policies);
+
 	/* System info */
-	blob->system_info.engine_enabled_masks[GUC_RENDER_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
-	blob->system_info.engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
+	fill_engine_enable_masks(gt, &blob->system_info);
 
 	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
 		hweight8(gt->info.sseu.slice_mask);
@@ -145,6 +514,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 			 GEN12_DOORBELLS_PER_SQIDI) + 1;
 	}
 
+	/* Golden contexts for re-initialising after a watchdog reset */
+	guc_prep_golden_context(guc, blob);
+
 	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
@@ -153,6 +525,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
 	blob->ads.gt_system_info = base + ptr_offset(blob, system_info);
 
+	/* MMIO save/restore list */
+	guc_mmio_reg_state_init(guc, blob);
+
 	/* Private Data */
 	blob->ads.private_data = base + guc_ads_private_data_offset(guc);
 
@@ -173,6 +548,19 @@ int intel_guc_ads_create(struct intel_guc *guc)
 
 	GEM_BUG_ON(guc->ads_vma);
 
+	/* Need to calculate the reg state size dynamically: */
+	ret = guc_mmio_reg_state_query(guc);
+	if (ret < 0)
+		return ret;
+	guc->ads_regset_size = ret;
+
+	/* Likewise the golden contexts: */
+	ret = guc_prep_golden_context(guc, NULL);
+	if (ret < 0)
+		return ret;
+	guc->ads_golden_ctxt_size = ret;
+
+	/* Now the total size can be determined: */
 	size = guc_ads_blob_size(guc);
 
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
@@ -185,6 +573,18 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	return 0;
 }
 
+void intel_guc_ads_init_late(struct intel_guc *guc)
+{
+	/*
+	 * The golden context setup requires the saved engine state from
+	 * __engines_record_defaults(). However, that requires engines to be
+	 * operational which means the ADS must already have been configured.
+	 * Fortunately, the golden context state is not needed until a hang
+	 * occurs, so it can be filled in during this late init phase.
+	 */
+	guc_init_golden_context(guc);
+}
+
 void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index b00d3ae1113a..3d85051d57e4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -7,9 +7,13 @@
 #define _INTEL_GUC_ADS_H_
 
 struct intel_guc;
+struct drm_printer;
 
 int intel_guc_ads_create(struct intel_guc *guc);
 void intel_guc_ads_destroy(struct intel_guc *guc);
+void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
+void intel_guc_ads_print_policy_info(struct intel_guc *guc,
+				     struct drm_printer *p);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 8bb6b1bbcea1..22b4733b55e2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -760,7 +760,10 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 	int ret;
 
 	if (unlikely(!ct->enabled)) {
-		WARN(1, "Unexpected send: action=%#x\n", *action);
+		struct intel_guc *guc = ct_to_guc(ct);
+		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
+
+		WARN(!uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
 		return -ENODEV;
 	}
 
@@ -984,6 +987,12 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 		ret = intel_guc_sched_done_process_msg(guc, payload, len);
 		break;
+	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
+		ret = intel_guc_context_reset_process_msg(guc, payload, len);
+		break;
+	case INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION:
+		ret = intel_guc_engine_failure_process_msg(guc, payload, len);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index 7a454c91a736..72ddfff42f7d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -10,6 +10,7 @@
 #include "intel_guc_debugfs.h"
 #include "intel_guc_log_debugfs.h"
 #include "gt/uc/intel_guc_ct.h"
+#include "gt/uc/intel_guc_ads.h"
 #include "gt/uc/intel_guc_submission.h"
 
 static int guc_info_show(struct seq_file *m, void *data)
@@ -29,6 +30,7 @@ static int guc_info_show(struct seq_file *m, void *data)
 
 	intel_guc_ct_print_info(&guc->ct, &p);
 	intel_guc_submission_print_info(guc, &p);
+	intel_guc_ads_print_policy_info(guc, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 26aadad10b12..b6338742a594 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -10,6 +10,7 @@
 #include "gt/intel_breadcrumbs.h"
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
+#include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm.h"
@@ -60,6 +61,15 @@
  *
  */
 
+/* GuC Virtual Engine */
+struct guc_virtual_engine {
+	struct intel_engine_cs base;
+	struct intel_context context;
+};
+
+static struct intel_context *
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
+
 #define GUC_REQUEST_SIZE 64 /* bytes */
 
 /*
@@ -71,6 +81,12 @@
  */
 #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
 #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
+#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
+#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		3
+#define SCHED_STATE_NO_LOCK_BLOCKED \
+	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
+#define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
+	(0xffff << SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
 static inline bool context_enabled(struct intel_context *ce)
 {
 	return (atomic_read(&ce->guc_sched_state_no_lock) &
@@ -106,6 +122,48 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
 		   &ce->guc_sched_state_no_lock);
 }
 
+static inline u32 context_blocked(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_BLOCKED_MASK) >>
+		SCHED_STATE_NO_LOCK_BLOCKED_SHIFT;
+}
+
+static inline void incr_context_blocked(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->engine->sched_engine->lock);
+	atomic_add(SCHED_STATE_NO_LOCK_BLOCKED,
+		   &ce->guc_sched_state_no_lock);
+	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
+}
+
+static inline void decr_context_blocked(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->engine->sched_engine->lock);
+	GEM_BUG_ON(!context_blocked(ce));
+
+	atomic_sub(SCHED_STATE_NO_LOCK_BLOCKED,
+		   &ce->guc_sched_state_no_lock);
+}
+
+static inline bool context_registered(struct intel_context *ce)
+{
+	return (atomic_read(&ce->guc_sched_state_no_lock) &
+		SCHED_STATE_NO_LOCK_REGISTERED);
+}
+
+static inline void set_context_registered(struct intel_context *ce)
+{
+	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
+		  &ce->guc_sched_state_no_lock);
+}
+
+static inline void clr_context_registered(struct intel_context *ce)
+{
+	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
+		   &ce->guc_sched_state_no_lock);
+}
+
 /*
  * Below is a set of functions which control the GuC scheduling state which
  * require a lock, aside from the special case where the functions are called
@@ -115,6 +173,7 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
 #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
 #define SCHED_STATE_DESTROYED				BIT(1)
 #define SCHED_STATE_PENDING_DISABLE			BIT(2)
+#define SCHED_STATE_BANNED				BIT(3)
 static inline void init_sched_state(struct intel_context *ce)
 {
 	/* Only should be called from guc_lrc_desc_pin() */
@@ -132,7 +191,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
 static inline void
 set_context_wait_for_deregister_to_register(struct intel_context *ce)
 {
-	/* Only should be called from guc_lrc_desc_pin() */
+	/* Only should be called from guc_lrc_desc_pin() without lock */
 	ce->guc_state.sched_state |=
 		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
 }
@@ -175,6 +234,23 @@ static inline void clr_context_pending_disable(struct intel_context *ce)
 	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
 }
 
+static inline bool context_banned(struct intel_context *ce)
+{
+	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
+}
+
+static inline void set_context_banned(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
+}
+
+static inline void clr_context_banned(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
+}
+
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return ce->guc_id == GUC_INVALID_LRC_ID;
@@ -230,15 +306,31 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
 
 static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
 {
+	guc->lrc_desc_pool_vaddr = NULL;
 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
 }
 
+static inline bool guc_submission_initialized(struct intel_guc *guc)
+{
+	return !!guc->lrc_desc_pool_vaddr;
+}
+
 static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
 {
-	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
+	if (likely(guc_submission_initialized(guc))) {
+		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
+		unsigned long flags;
+
+		memset(desc, 0, sizeof(*desc));
 
-	memset(desc, 0, sizeof(*desc));
-	xa_erase_irq(&guc->context_lookup, id);
+		/*
+		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
+		 * the lower level functions directly.
+		 */
+		xa_lock_irqsave(&guc->context_lookup, flags);
+		__xa_erase(&guc->context_lookup, id);
+		xa_unlock_irqrestore(&guc->context_lookup, flags);
+	}
 }
 
 static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
@@ -249,7 +341,15 @@ static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
 static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
 					   struct intel_context *ce)
 {
-	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
+	unsigned long flags;
+
+	/*
+	 * xarray API doesn't have xa_save_irqsave wrapper, so calling the
+	 * lower level functions directly.
+	 */
+	xa_lock_irqsave(&guc->context_lookup, flags);
+	__xa_store(&guc->context_lookup, id, ce, GFP_ATOMIC);
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
 }
 
 static int guc_submission_send_busy_loop(struct intel_guc *guc,
@@ -268,10 +368,10 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 	return err;
 }
 
-static int guc_wait_for_pending_msg(struct intel_guc *guc,
-				    atomic_t *wait_var,
-				    bool interruptible,
-				    long timeout)
+int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
+				   atomic_t *wait_var,
+				   bool interruptible,
+				   long timeout)
 {
 	const int state = interruptible ?
 		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
@@ -314,22 +414,54 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
 	if (!intel_uc_uses_guc_submission(&guc_to_gt(guc)->uc))
 		return 0;
 
-	return guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
-					true, timeout);
+	return intel_guc_wait_for_pending_msg(guc,
+					      &guc->outstanding_submission_g2h,
+					      true, timeout);
 }
 
+static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
+
 static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
-	int err;
+	int err = 0;
 	struct intel_context *ce = rq->context;
 	u32 action[3];
 	int len = 0;
 	u32 g2h_len_dw = 0;
-	bool enabled = context_enabled(ce);
+	bool enabled;
+
+	/*
+	 * Corner case where requests were sitting in the priority list or a
+	 * request resubmitted after the context was banned.
+	 */
+	if (unlikely(intel_context_is_banned(ce))) {
+		i915_request_put(i915_request_mark_eio(rq));
+		intel_engine_signal_breadcrumbs(ce->engine);
+		goto out;
+	}
 
 	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
 
+	/*
+	 * Corner case where the GuC firmware was blown away and reloaded while
+	 * this context was pinned.
+	 */
+	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
+		err = guc_lrc_desc_pin(ce, false);
+		if (unlikely(err))
+			goto out;
+	}
+
+	/*
+	 * The request / context will be run on the hardware when scheduling
+	 * gets enabled in the unblock.
+	 */
+	if (unlikely(context_blocked(ce)))
+		goto out;
+
+	enabled = context_enabled(ce);
+
 	if (!enabled) {
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = ce->guc_id;
@@ -351,7 +483,10 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 		clr_context_pending_enable(ce);
 		intel_context_put(ce);
 	}
+	if (likely(!err))
+		trace_i915_request_guc_submit(rq);
 
+out:
 	return err;
 }
 
@@ -406,24 +541,23 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 	if (submit) {
 		guc_set_lrc_tail(last);
 resubmit:
-		/*
-		 * We only check for -EBUSY here even though it is possible for
-		 * -EDEADLK to be returned. If -EDEADLK is returned, the GuC has
-		 * died and a full GT reset needs to be done. The hangcheck will
-		 * eventually detect that the GuC has died and trigger this
-		 * reset so no need to handle -EDEADLK here.
-		 */
 		ret = guc_add_request(guc, last);
-		if (ret == -EBUSY) {
+		if (unlikely(ret == -EPIPE))
+			goto deadlk;
+		else if (ret == -EBUSY) {
 			tasklet_schedule(&sched_engine->tasklet);
 			guc->stalled_request = last;
 			return false;
 		}
-		trace_i915_request_guc_submit(last);
 	}
 
 	guc->stalled_request = NULL;
 	return submit;
+
+deadlk:
+	sched_engine->tasklet.callback = NULL;
+	tasklet_disable_nosync(&sched_engine->tasklet);
+	return false;
 }
 
 static void guc_submission_tasklet(struct tasklet_struct *t)
@@ -450,27 +584,182 @@ static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
 		intel_engine_signal_breadcrumbs(engine);
 }
 
-static void guc_reset_prepare(struct intel_engine_cs *engine)
+static void __guc_context_destroy(struct intel_context *ce);
+static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
+static void guc_signal_context_fence(struct intel_context *ce);
+static void guc_cancel_context_requests(struct intel_context *ce);
+static void guc_blocked_fence_complete(struct intel_context *ce);
+
+static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
+{
+	struct intel_context *ce;
+	unsigned long index, flags;
+	bool pending_disable, pending_enable, deregister, destroyed, banned;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		/* Flush context */
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		/*
+		 * Once we are at this point submission_disabled() is guaranteed
+		 * to be visible to all callers who set the below flags (see above
+		 * flush and flushes in reset_prepare). If submission_disabled()
+		 * is set, the caller shouldn't set these flags.
+		 */
+
+		destroyed = context_destroyed(ce);
+		pending_enable = context_pending_enable(ce);
+		pending_disable = context_pending_disable(ce);
+		deregister = context_wait_for_deregister_to_register(ce);
+		banned = context_banned(ce);
+		init_sched_state(ce);
+
+		if (pending_enable || destroyed || deregister) {
+			atomic_dec(&guc->outstanding_submission_g2h);
+			if (deregister)
+				guc_signal_context_fence(ce);
+			if (destroyed) {
+				release_guc_id(guc, ce);
+				__guc_context_destroy(ce);
+			}
+			if (pending_enable || deregister)
+				intel_context_put(ce);
+		}
+
+		/* Not mutualy exclusive with above if statement. */
+		if (pending_disable) {
+			guc_signal_context_fence(ce);
+			if (banned) {
+				guc_cancel_context_requests(ce);
+				intel_engine_signal_breadcrumbs(ce->engine);
+			}
+			intel_context_sched_disable_unpin(ce);
+			atomic_dec(&guc->outstanding_submission_g2h);
+			spin_lock_irqsave(&ce->guc_state.lock, flags);
+			guc_blocked_fence_complete(ce);
+			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+			intel_context_put(ce);
+		}
+	}
+}
+
+static inline bool
+submission_disabled(struct intel_guc *guc)
+{
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+
+	return unlikely(!sched_engine ||
+			!__tasklet_is_enabled(&sched_engine->tasklet));
+}
+
+static void disable_submission(struct intel_guc *guc)
+{
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+
+	if (__tasklet_is_enabled(&sched_engine->tasklet)) {
+		GEM_BUG_ON(!guc->ct.enabled);
+		__tasklet_disable_sync_once(&sched_engine->tasklet);
+		sched_engine->tasklet.callback = NULL;
+	}
+}
+
+static void enable_submission(struct intel_guc *guc)
+{
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->sched_engine->lock, flags);
+	sched_engine->tasklet.callback = guc_submission_tasklet;
+	wmb();	/* Make sure callback visible */
+	if (!__tasklet_is_enabled(&sched_engine->tasklet) &&
+	    __tasklet_enable(&sched_engine->tasklet)) {
+		GEM_BUG_ON(!guc->ct.enabled);
+
+		/* And kick in case we missed a new request submission. */
+		tasklet_hi_schedule(&sched_engine->tasklet);
+	}
+	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
+}
+
+static void guc_flush_submissions(struct intel_guc *guc)
+{
+	struct i915_sched_engine * const sched_engine = guc->sched_engine;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+}
+
+void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
-	ENGINE_TRACE(engine, "\n");
+	int i;
+
+	if (unlikely(!guc_submission_initialized(guc))) {
+		/* Reset called during driver load? GuC not yet initialised! */
+		return;
+	}
+
+	intel_gt_park_heartbeats(guc_to_gt(guc));
+	disable_submission(guc);
+	guc->interrupts.disable(guc);
+
+	/* Flush IRQ handler */
+	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
+	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
+
+	guc_flush_submissions(guc);
 
 	/*
-	 * Prevent request submission to the hardware until we have
-	 * completed the reset in i915_gem_reset_finish(). If a request
-	 * is completed by one engine, it may then queue a request
-	 * to a second via its execlists->tasklet *just* as we are
-	 * calling engine->init_hw() and also writing the ELSP.
-	 * Turning off the execlists->tasklet until the reset is over
-	 * prevents the race.
+	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
+	 * each pass as interrupt have been disabled. We always scrub for
+	 * outstanding G2H as it is possible for outstanding_submission_g2h to
+	 * be incremented after the context state update.
 	 */
-	__tasklet_disable_sync_once(&engine->sched_engine->tasklet);
+	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
+		intel_guc_to_host_event_handler(guc);
+#define wait_for_reset(guc, wait_var) \
+		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
+		do {
+			wait_for_reset(guc, &guc->outstanding_submission_g2h);
+		} while (!list_empty(&guc->ct.requests.incoming));
+	}
+	scrub_guc_desc_for_outstanding_g2h(guc);
+}
+
+static struct intel_engine_cs *
+guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp, mask = ve->mask;
+	unsigned int num_siblings = 0;
+
+	for_each_engine_masked(engine, ve->gt, mask, tmp)
+		if (num_siblings++ == sibling)
+			return engine;
+
+	return NULL;
+}
+
+static inline struct intel_engine_cs *
+__context_to_physical_engine(struct intel_context *ce)
+{
+	struct intel_engine_cs *engine = ce->engine;
+
+	if (intel_engine_is_virtual(engine))
+		engine = guc_virtual_get_sibling(engine, 0);
+
+	return engine;
 }
 
-static void guc_reset_state(struct intel_context *ce,
-			    struct intel_engine_cs *engine,
-			    u32 head,
-			    bool scrub)
+static void guc_reset_state(struct intel_context *ce, u32 head, bool scrub)
 {
+	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+
+	if (intel_context_is_banned(ce))
+		return;
+
 	GEM_BUG_ON(!intel_context_is_pinned(ce));
 
 	/*
@@ -488,42 +777,133 @@ static void guc_reset_state(struct intel_context *ce,
 	lrc_update_regs(ce, engine, head);
 }
 
-static void guc_reset_rewind(struct intel_engine_cs *engine, bool stalled)
+static void guc_reset_nop(struct intel_engine_cs *engine)
 {
-	struct intel_engine_execlists * const execlists = &engine->execlists;
-	struct i915_request *rq;
+}
+
+static void guc_rewind_nop(struct intel_engine_cs *engine, bool stalled)
+{
+}
+
+static void
+__unwind_incomplete_requests(struct intel_context *ce)
+{
+	struct i915_request *rq, *rn;
+	struct list_head *pl;
+	int prio = I915_PRIORITY_INVALID;
+	struct i915_sched_engine * const sched_engine =
+		ce->engine->sched_engine;
 	unsigned long flags;
 
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	spin_lock(&ce->guc_active.lock);
+	list_for_each_entry_safe(rq, rn,
+				 &ce->guc_active.requests,
+				 sched.link) {
+		if (i915_request_completed(rq))
+			continue;
+
+		list_del_init(&rq->sched.link);
+		spin_unlock(&ce->guc_active.lock);
+
+		__i915_request_unsubmit(rq);
+
+		/* Push the request back into the queue for later resubmission. */
+		GEM_BUG_ON(rq_prio(rq) == I915_PRIORITY_INVALID);
+		if (rq_prio(rq) != prio) {
+			prio = rq_prio(rq);
+			pl = i915_sched_lookup_priolist(sched_engine, prio);
+		}
+		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
+
+		list_add_tail(&rq->sched.link, pl);
+		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+
+		spin_lock(&ce->guc_active.lock);
+	}
+	spin_unlock(&ce->guc_active.lock);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+}
+
+static void __guc_reset_context(struct intel_context *ce, bool stalled)
+{
+	struct i915_request *rq;
+	u32 head;
+
+	intel_context_get(ce);
+
+	/*
+	 * GuC will implicitly mark the context as non-schedulable
+	 * when it sends the reset notification. Make sure our state
+	 * reflects this change. The context will be marked enabled
+	 * on resubmission.
+	 */
+	clr_context_enabled(ce);
 
-	/* Push back any incomplete requests for replay after the reset. */
-	rq = execlists_unwind_incomplete_requests(execlists);
-	if (!rq)
-		goto out_unlock;
+	rq = intel_context_find_active_request(ce);
+	if (!rq) {
+		head = ce->ring->tail;
+		stalled = false;
+		goto out_replay;
+	}
 
 	if (!i915_request_started(rq))
 		stalled = false;
 
+	GEM_BUG_ON(i915_active_is_idle(&ce->active));
+	head = intel_ring_wrap(ce->ring, rq->head);
 	__i915_request_reset(rq, stalled);
-	guc_reset_state(rq->context, engine, rq->head, stalled);
 
-out_unlock:
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
+out_replay:
+	guc_reset_state(ce, head, stalled);
+	__unwind_incomplete_requests(ce);
+	intel_context_put(ce);
+}
+
+void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
+{
+	struct intel_context *ce;
+	unsigned long index;
+
+	if (unlikely(!guc_submission_initialized(guc))) {
+		/* Reset called during driver load? GuC not yet initialised! */
+		return;
+	}
+
+	xa_for_each(&guc->context_lookup, index, ce)
+		if (intel_context_is_pinned(ce))
+			__guc_reset_context(ce, stalled);
+
+	/* GuC is blown away, drop all references to contexts */
+	xa_destroy(&guc->context_lookup);
+}
+
+static void guc_cancel_context_requests(struct intel_context *ce)
+{
+	struct i915_sched_engine *sched_engine = ce_to_guc(ce)->sched_engine;
+	struct i915_request *rq;
+	unsigned long flags;
+
+	/* Mark all executing requests as skipped. */
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	spin_lock(&ce->guc_active.lock);
+	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
+		i915_request_put(i915_request_mark_eio(rq));
+	spin_unlock(&ce->guc_active.lock);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
-static void guc_reset_cancel(struct intel_engine_cs *engine)
+static void
+guc_cancel_sched_engine_requests(struct i915_sched_engine *sched_engine)
 {
-	struct i915_sched_engine * const sched_engine = engine->sched_engine;
 	struct i915_request *rq, *rn;
 	struct rb_node *rb;
 	unsigned long flags;
 
 	/* Can be called during boot if GuC fails to load */
-	if (!engine->gt)
+	if (!sched_engine)
 		return;
 
-	ENGINE_TRACE(engine, "\n");
-
 	/*
 	 * Before we call engine->cancel_requests(), we should have exclusive
 	 * access to the submission state. This is arranged for us by the
@@ -540,21 +920,16 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
 	 */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	/* Mark all executing requests as skipped. */
-	list_for_each_entry(rq, &sched_engine->requests, sched.link) {
-		i915_request_set_error_once(rq, -EIO);
-		i915_request_mark_complete(rq);
-	}
-
 	/* Flush the queued requests to the timeline list (for retiring). */
 	while ((rb = rb_first_cached(&sched_engine->queue))) {
 		struct i915_priolist *p = to_priolist(rb);
 
 		priolist_for_each_request_consume(rq, rn, p) {
 			list_del_init(&rq->sched.link);
+
 			__i915_request_submit(rq);
-			dma_fence_set_error(&rq->fence, -EIO);
-			i915_request_mark_complete(rq);
+
+			i915_request_put(i915_request_mark_eio(rq));
 		}
 
 		rb_erase_cached(&p->node, &sched_engine->queue);
@@ -569,14 +944,41 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
 	spin_unlock_irqrestore(&sched_engine->lock, flags);
 }
 
-static void guc_reset_finish(struct intel_engine_cs *engine)
+void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 {
-	if (__tasklet_enable(&engine->sched_engine->tasklet))
-		/* And kick in case we missed a new request submission. */
-		tasklet_hi_schedule(&engine->sched_engine->tasklet);
+	struct intel_context *ce;
+	unsigned long index;
+
+	xa_for_each(&guc->context_lookup, index, ce)
+		if (intel_context_is_pinned(ce))
+			guc_cancel_context_requests(ce);
+
+	guc_cancel_sched_engine_requests(guc->sched_engine);
+
+	/* GuC is blown away, drop all references to contexts */
+	xa_destroy(&guc->context_lookup);
+}
+
+void intel_guc_submission_reset_finish(struct intel_guc *guc)
+{
+	/* Reset called during driver load or during wedge? */
+	if (unlikely(!guc_submission_initialized(guc) ||
+		     test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags))) {
+		return;
+	}
 
-	ENGINE_TRACE(engine, "depth->%d\n",
-		     atomic_read(&engine->sched_engine->tasklet.count));
+	/*
+	 * Technically possible for either of these values to be non-zero here,
+	 * but very unlikely + harmless. Regardless let's add a warn so we can
+	 * see in CI if this happens frequently / a precursor to taking down the
+	 * machine.
+	 */
+	GEM_WARN_ON(atomic_read(&guc->outstanding_submission_g2h));
+	atomic_set(&guc->outstanding_submission_g2h, 0);
+
+	intel_guc_global_policies_update(guc);
+	enable_submission(guc);
+	intel_gt_unpark_heartbeats(guc_to_gt(guc));
 }
 
 /*
@@ -640,8 +1042,9 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 	ret = guc_add_request(guc, rq);
 	if (ret == -EBUSY)
 		guc->stalled_request = rq;
-	else
-		trace_i915_request_guc_submit(rq);
+
+	if (unlikely(ret == -EPIPE))
+		disable_submission(guc);
 
 	return ret;
 }
@@ -655,7 +1058,8 @@ static void guc_submit_request(struct i915_request *rq)
 	/* Will be called from irq-context when using foreign fences. */
 	spin_lock_irqsave(&sched_engine->lock, flags);
 
-	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
+	if (submission_disabled(guc) || guc->stalled_request ||
+	    !i915_sched_engine_is_empty(sched_engine))
 		queue_request(sched_engine, rq, rq_prio(rq));
 	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
 		tasklet_hi_schedule(&sched_engine->tasklet);
@@ -707,6 +1111,7 @@ static int steal_guc_id(struct intel_guc *guc)
 
 		list_del_init(&ce->guc_id_link);
 		guc_id = ce->guc_id;
+		clr_context_registered(ce);
 		set_context_guc_id_invalid(ce);
 		return guc_id;
 	} else {
@@ -798,7 +1203,8 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
 
 static int __guc_action_register_context(struct intel_guc *guc,
 					 u32 guc_id,
-					 u32 offset)
+					 u32 offset,
+					 bool loop)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_REGISTER_CONTEXT,
@@ -807,22 +1213,28 @@ static int __guc_action_register_context(struct intel_guc *guc,
 	};
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
-					     0, true);
+					     0, loop);
 }
 
-static int register_context(struct intel_context *ce)
+static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
 		ce->guc_id * sizeof(struct guc_lrc_desc);
+	int ret;
 
 	trace_intel_context_register(ce);
 
-	return __guc_action_register_context(guc, ce->guc_id, offset);
+	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
+	if (likely(!ret))
+		set_context_registered(ce);
+
+	return ret;
 }
 
 static int __guc_action_deregister_context(struct intel_guc *guc,
-					   u32 guc_id)
+					   u32 guc_id,
+					   bool loop)
 {
 	u32 action[] = {
 		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
@@ -831,16 +1243,16 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
 
 	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
 					     G2H_LEN_DW_DEREGISTER_CONTEXT,
-					     true);
+					     loop);
 }
 
-static int deregister_context(struct intel_context *ce, u32 guc_id)
+static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
 	trace_intel_context_deregister(ce);
 
-	return __guc_action_deregister_context(guc, guc_id);
+	return __guc_action_deregister_context(guc, guc_id, loop);
 }
 
 static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
@@ -865,17 +1277,25 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 {
 	desc->policy_flags = 0;
 
-	desc->execution_quantum = CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US;
-	desc->preemption_timeout = CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US;
+	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
+		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
+
+	/* NB: For both of these, zero means disabled. */
+	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
+	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
-static int guc_lrc_desc_pin(struct intel_context *ce)
+static inline u8 map_i915_prio_to_guc_prio(int prio);
+
+static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 desc_idx = ce->guc_id;
 	struct guc_lrc_desc *desc;
+	const struct i915_gem_context *ctx;
+	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
 	int ret = 0;
@@ -891,6 +1311,12 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
+	rcu_read_lock();
+	ctx = rcu_dereference(ce->gem_context);
+	if (ctx)
+		prio = ctx->sched.priority;
+	rcu_read_unlock();
+
 	reset_lrc_desc(guc, desc_idx);
 	set_lrc_desc_registered(guc, desc_idx, ce);
 
@@ -899,7 +1325,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 	desc->engine_submit_mask = adjust_engine_mask(engine->class,
 						      engine->mask);
 	desc->hw_context_desc = ce->lrc.lrca;
-	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
+	desc->priority = ce->guc_prio;
 	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
 	guc_context_policy_init(engine, desc);
 	init_sched_state(ce);
@@ -914,31 +1341,62 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
 	 */
 	if (context_registered) {
 		trace_intel_context_steal_guc_id(ce);
-		set_context_wait_for_deregister_to_register(ce);
-		intel_context_get(ce);
+		if (!loop) {
+			set_context_wait_for_deregister_to_register(ce);
+			intel_context_get(ce);
+		} else {
+			bool disabled;
+			unsigned long flags;
+
+			/* Seal race with Reset */
+			spin_lock_irqsave(&ce->guc_state.lock, flags);
+			disabled = submission_disabled(guc);
+			if (likely(!disabled)) {
+				set_context_wait_for_deregister_to_register(ce);
+				intel_context_get(ce);
+			}
+			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+			if (unlikely(disabled)) {
+				reset_lrc_desc(guc, desc_idx);
+				return 0;	/* Will get registered later */
+			}
+		}
 
 		/*
 		 * If stealing the guc_id, this ce has the same guc_id as the
 		 * context whose guc_id was stolen.
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			ret = deregister_context(ce, ce->guc_id);
+			ret = deregister_context(ce, ce->guc_id, loop);
+		if (unlikely(ret == -EBUSY)) {
+			clr_context_wait_for_deregister_to_register(ce);
+			intel_context_put(ce);
+		} else if (unlikely(ret == -ENODEV)) {
+			ret = 0;	/* Will get registered later */
+		}
 	} else {
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			ret = register_context(ce);
+			ret = register_context(ce, loop);
+		if (unlikely(ret == -EBUSY))
+			reset_lrc_desc(guc, desc_idx);
+		else if (unlikely(ret == -ENODEV))
+			ret = 0;	/* Will get registered later */
 	}
 
 	return ret;
 }
 
-static int guc_context_pre_pin(struct intel_context *ce,
-			       struct i915_gem_ww_ctx *ww,
-			       void **vaddr)
+static int __guc_context_pre_pin(struct intel_context *ce,
+				 struct intel_engine_cs *engine,
+				 struct i915_gem_ww_ctx *ww,
+				 void **vaddr)
 {
-	return lrc_pre_pin(ce, ce->engine, ww, vaddr);
+	return lrc_pre_pin(ce, engine, ww, vaddr);
 }
 
-static int guc_context_pin(struct intel_context *ce, void *vaddr)
+static int __guc_context_pin(struct intel_context *ce,
+			     struct intel_engine_cs *engine,
+			     void *vaddr)
 {
 	if (i915_ggtt_offset(ce->state) !=
 	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
@@ -949,7 +1407,19 @@ static int guc_context_pin(struct intel_context *ce, void *vaddr)
 	 * explaination of why.
 	 */
 
-	return lrc_pin(ce, ce->engine, vaddr);
+	return lrc_pin(ce, engine, vaddr);
+}
+
+static int guc_context_pre_pin(struct intel_context *ce,
+			       struct i915_gem_ww_ctx *ww,
+			       void **vaddr)
+{
+	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
+}
+
+static int guc_context_pin(struct intel_context *ce, void *vaddr)
+{
+	return __guc_context_pin(ce, ce->engine, vaddr);
 }
 
 static void guc_context_unpin(struct intel_context *ce)
@@ -965,6 +1435,21 @@ static void guc_context_post_unpin(struct intel_context *ce)
 	lrc_post_unpin(ce);
 }
 
+static void __guc_context_sched_enable(struct intel_guc *guc,
+				       struct intel_context *ce)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
+		ce->guc_id,
+		GUC_CONTEXT_ENABLE
+	};
+
+	trace_intel_context_sched_enable(ce);
+
+	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
+				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
+}
+
 static void __guc_context_sched_disable(struct intel_guc *guc,
 					struct intel_context *ce,
 					u16 guc_id)
@@ -978,31 +1463,208 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
 
 	trace_intel_context_sched_disable(ce);
-	intel_context_get(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
 				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
 }
 
-static u16 prep_context_pending_disable(struct intel_context *ce)
+static void guc_blocked_fence_complete(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->guc_state.lock);
 
-	set_context_pending_disable(ce);
-	clr_context_enabled(ce);
-
-	return ce->guc_id;
+	if (!i915_sw_fence_done(&ce->guc_blocked))
+		i915_sw_fence_complete(&ce->guc_blocked);
 }
 
-static void guc_context_sched_disable(struct intel_context *ce)
+static void guc_blocked_fence_reinit(struct intel_context *ce)
 {
-	struct intel_guc *guc = ce_to_guc(ce);
-	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
+	lockdep_assert_held(&ce->guc_state.lock);
+	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
+
+	/*
+	 * This fence is always complete unless a pending schedule disable is
+	 * outstanding. We arm the fence here and complete it when we receive
+	 * the pending schedule disable complete message.
+	 */
+	i915_sw_fence_fini(&ce->guc_blocked);
+	i915_sw_fence_reinit(&ce->guc_blocked);
+	i915_sw_fence_await(&ce->guc_blocked);
+	i915_sw_fence_commit(&ce->guc_blocked);
+}
+
+static u16 prep_context_pending_disable(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+
+	set_context_pending_disable(ce);
+	clr_context_enabled(ce);
+	guc_blocked_fence_reinit(ce);
+	intel_context_get(ce);
+
+	return ce->guc_id;
+}
+
+static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
 	unsigned long flags;
+	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
+	intel_wakeref_t wakeref;
 	u16 guc_id;
+	bool enabled;
+
+	/* Sync with submission path and unblock */
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	incr_context_blocked(ce);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	enabled = context_enabled(ce);
+	if (unlikely(!enabled || submission_disabled(guc))) {
+		if (enabled)
+			clr_context_enabled(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return &ce->guc_blocked;
+	}
+
+	/*
+	 * We add +2 here as the schedule disable complete CTB handler calls
+	 * intel_context_sched_disable_unpin (-2 to pin_count).
+	 */
+	atomic_add(2, &ce->pin_count);
+
+	guc_id = prep_context_pending_disable(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_disable(guc, ce, guc_id);
+
+	return &ce->guc_blocked;
+}
+
+static void guc_context_unblock(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+	unsigned long flags;
+	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
+	intel_wakeref_t wakeref;
+
+	GEM_BUG_ON(context_enabled(ce));
+
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (unlikely(submission_disabled(guc) ||
+		     !intel_context_is_pinned(ce) ||
+		     context_pending_disable(ce) ||
+		     context_blocked(ce) > 1)) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		goto out;
+	}
+
+	set_context_pending_enable(ce);
+	set_context_enabled(ce);
+	intel_context_get(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	with_intel_runtime_pm(runtime_pm, wakeref)
+		__guc_context_sched_enable(guc, ce);
+
+out:
+	spin_lock_irqsave(&sched_engine->lock, flags);
+	decr_context_blocked(ce);
+	spin_unlock_irqrestore(&sched_engine->lock, flags);
+}
+
+static void guc_context_cancel_request(struct intel_context *ce,
+				       struct i915_request *rq)
+{
+	if (i915_sw_fence_signaled(&rq->submit)) {
+		struct i915_sw_fence *fence = guc_context_block(ce);
+
+		i915_sw_fence_wait(fence);
+		if (!i915_request_completed(rq)) {
+			__i915_request_skip(rq);
+			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
+					true);
+		}
+		guc_context_unblock(ce);
+	}
+}
+
+static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
+						 u16 guc_id,
+						 u32 preemption_timeout)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
+		guc_id,
+		preemption_timeout
+	};
+
+	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+}
+
+static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	struct intel_runtime_pm *runtime_pm =
+		&ce->engine->gt->i915->runtime_pm;
 	intel_wakeref_t wakeref;
+	unsigned long flags;
+
+	guc_flush_submissions(guc);
 
-	if (context_guc_id_invalid(ce) ||
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	set_context_banned(ce);
+
+	if (submission_disabled(guc) ||
+	    (!context_enabled(ce) && !context_pending_disable(ce))) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		guc_cancel_context_requests(ce);
+		intel_engine_signal_breadcrumbs(ce->engine);
+	} else if (!context_pending_disable(ce)) {
+		u16 guc_id;
+
+		/*
+		 * We add +2 here as the schedule disable complete CTB handler
+		 * calls intel_context_sched_disable_unpin (-2 to pin_count).
+		 */
+		atomic_add(2, &ce->pin_count);
+
+		guc_id = prep_context_pending_disable(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		/*
+		 * In addition to disabling scheduling, set the preemption
+		 * timeout to the minimum value (1 us) so the banned context
+		 * gets kicked off the HW ASAP.
+		 */
+		with_intel_runtime_pm(runtime_pm, wakeref) {
+			__guc_context_set_preemption_timeout(guc, guc_id, 1);
+			__guc_context_sched_disable(guc, ce, guc_id);
+		}
+	} else {
+		if (!context_guc_id_invalid(ce))
+			with_intel_runtime_pm(runtime_pm, wakeref)
+				__guc_context_set_preemption_timeout(guc,
+								     ce->guc_id,
+								     1);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	}
+}
+
+static void guc_context_sched_disable(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+	unsigned long flags;
+	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
+	intel_wakeref_t wakeref;
+	u16 guc_id;
+	bool enabled;
+
+	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
 	    !lrc_desc_registered(guc, ce->guc_id)) {
 		clr_context_enabled(ce);
 		goto unpin;
@@ -1014,14 +1676,22 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 
 	/*
-	 * We have to check if the context has been pinned again as another pin
-	 * operation is allowed to pass this function. Checking the pin count,
-	 * within ce->guc_state.lock, synchronizes this function with
+	 * We have to check if the context has been disabled by another thread.
+	 * We also have to check if the context has been pinned again as another
+	 * pin operation is allowed to pass this function. Checking the pin
+	 * count, within ce->guc_state.lock, synchronizes this function with
 	 * guc_request_alloc ensuring a request doesn't slip through the
 	 * 'context_pending_disable' fence. Checking within the spin lock (can't
 	 * sleep) ensures another process doesn't pin this context and generate
 	 * a request before we set the 'context_pending_disable' flag here.
 	 */
+	enabled = context_enabled(ce);
+	if (unlikely(!enabled || submission_disabled(guc))) {
+		if (enabled)
+			clr_context_enabled(ce);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		goto unpin;
+	}
 	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		return;
@@ -1041,17 +1711,36 @@ static void guc_context_sched_disable(struct intel_context *ce)
 static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
-	unsigned long flags;
 
 	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
 	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
 	GEM_BUG_ON(context_enabled(ce));
 
-	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	set_context_destroyed(ce);
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	clr_context_registered(ce);
+	deregister_context(ce, ce->guc_id, true);
+}
+
+static void __guc_context_destroy(struct intel_context *ce)
+{
+	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
+		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
+
+	lrc_fini(ce);
+	intel_context_fini(ce);
+
+	if (intel_engine_is_virtual(ce->engine)) {
+		struct guc_virtual_engine *ve =
+			container_of(ce, typeof(*ve), context);
+
+		if (ve->base.breadcrumbs)
+			intel_breadcrumbs_put(ve->base.breadcrumbs);
 
-	deregister_context(ce, ce->guc_id);
+		kfree(ve);
+	} else {
+		intel_context_free(ce);
+	}
 }
 
 static void guc_context_destroy(struct kref *kref)
@@ -1061,18 +1750,20 @@ static void guc_context_destroy(struct kref *kref)
 	struct intel_guc *guc = ce_to_guc(ce);
 	intel_wakeref_t wakeref;
 	unsigned long flags;
+	bool disabled;
 
 	/*
 	 * If the guc_id is invalid this context has been stolen and we can free
 	 * it immediately. Also can be freed immediately if the context is not
-	 * registered with the GuC.
+	 * registered with the GuC or the GuC is in the middle of a reset.
 	 */
 	if (context_guc_id_invalid(ce)) {
-		lrc_destroy(kref);
+		__guc_context_destroy(ce);
 		return;
-	} else if (!lrc_desc_registered(guc, ce->guc_id)) {
+	} else if (submission_disabled(guc) ||
+		   !lrc_desc_registered(guc, ce->guc_id)) {
 		release_guc_id(guc, ce);
-		lrc_destroy(kref);
+		__guc_context_destroy(ce);
 		return;
 	}
 
@@ -1087,7 +1778,7 @@ static void guc_context_destroy(struct kref *kref)
 	spin_lock_irqsave(&guc->contexts_lock, flags);
 	if (context_guc_id_invalid(ce)) {
 		spin_unlock_irqrestore(&guc->contexts_lock, flags);
-		lrc_destroy(kref);
+		__guc_context_destroy(ce);
 		return;
 	}
 
@@ -1095,6 +1786,18 @@ static void guc_context_destroy(struct kref *kref)
 		list_del_init(&ce->guc_id_link);
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 
+	/* Seal race with Reset */
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	disabled = submission_disabled(guc);
+	if (likely(!disabled))
+		set_context_destroyed(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+	if (unlikely(disabled)) {
+		release_guc_id(guc, ce);
+		__guc_context_destroy(ce);
+		return;
+	}
+
 	/*
 	 * We defer GuC context deregistration until the context is destroyed
 	 * in order to save on CTBs. With this optimization ideally we only need
@@ -1117,6 +1820,144 @@ static int guc_context_alloc(struct intel_context *ce)
 	return lrc_alloc(ce, ce->engine);
 }
 
+static void guc_context_set_prio(struct intel_guc *guc,
+				 struct intel_context *ce,
+				 u8 prio)
+{
+	u32 action[] = {
+		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
+		ce->guc_id,
+		prio,
+	};
+
+	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
+		   prio > GUC_CLIENT_PRIORITY_NORMAL);
+
+	if (ce->guc_prio == prio || submission_disabled(guc) ||
+	    !context_registered(ce))
+		return;
+
+	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
+
+	ce->guc_prio = prio;
+	trace_intel_context_set_prio(ce);
+}
+
+static inline u8 map_i915_prio_to_guc_prio(int prio)
+{
+	if (prio == I915_PRIORITY_NORMAL)
+		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
+	else if (prio < I915_PRIORITY_NORMAL)
+		return GUC_CLIENT_PRIORITY_NORMAL;
+	else if (prio < I915_PRIORITY_DISPLAY)
+		return GUC_CLIENT_PRIORITY_HIGH;
+	else
+		return GUC_CLIENT_PRIORITY_KMD_HIGH;
+}
+
+static inline void add_context_inflight_prio(struct intel_context *ce,
+					     u8 guc_prio)
+{
+	lockdep_assert_held(&ce->guc_active.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+
+	++ce->guc_prio_count[guc_prio];
+
+	/* Overflow protection */
+	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+}
+
+static inline void sub_context_inflight_prio(struct intel_context *ce,
+					     u8 guc_prio)
+{
+	lockdep_assert_held(&ce->guc_active.lock);
+	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
+
+	/* Underflow protection */
+	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
+
+	--ce->guc_prio_count[guc_prio];
+}
+
+static inline void update_context_prio(struct intel_context *ce)
+{
+	struct intel_guc *guc = &ce->engine->gt->uc.guc;
+	int i;
+
+	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
+	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH > GUC_CLIENT_PRIORITY_NORMAL);
+
+	lockdep_assert_held(&ce->guc_active.lock);
+
+	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
+		if (ce->guc_prio_count[i]) {
+			guc_context_set_prio(guc, ce, i);
+			break;
+		}
+	}
+}
+
+static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
+{
+	/* Lower value is higher priority */
+	return new_guc_prio < old_guc_prio;
+}
+
+static void add_to_context(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
+
+	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
+
+	spin_lock(&ce->guc_active.lock);
+	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
+
+	if (rq->guc_prio == GUC_PRIO_INIT) {
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+	} else if (new_guc_prio_higher(rq->guc_prio, new_guc_prio)) {
+		sub_context_inflight_prio(ce, rq->guc_prio);
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+	}
+	update_context_prio(ce);
+
+	spin_unlock(&ce->guc_active.lock);
+}
+
+static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_active.lock);
+
+	if (rq->guc_prio != GUC_PRIO_INIT &&
+	    rq->guc_prio != GUC_PRIO_FINI) {
+		sub_context_inflight_prio(ce, rq->guc_prio);
+		update_context_prio(ce);
+	}
+	rq->guc_prio = GUC_PRIO_FINI;
+}
+
+static void remove_from_context(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+
+	spin_lock_irq(&ce->guc_active.lock);
+
+	list_del_init(&rq->sched.link);
+	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
+
+	/* Prevent further __await_execution() registering a cb, then flush */
+	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
+
+	guc_prio_fini(rq, ce);
+
+	spin_unlock_irq(&ce->guc_active.lock);
+
+	atomic_dec(&ce->guc_id_ref);
+	i915_request_notify_execute_cb_imm(rq);
+}
+
 static const struct intel_context_ops guc_context_ops = {
 	.alloc = guc_context_alloc,
 
@@ -1125,6 +1966,10 @@ static const struct intel_context_ops guc_context_ops = {
 	.unpin = guc_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
+	.ban = guc_context_ban,
+
+	.cancel_request = guc_context_cancel_request,
+
 	.enter = intel_context_enter_engine,
 	.exit = intel_context_exit_engine,
 
@@ -1132,6 +1977,8 @@ static const struct intel_context_ops guc_context_ops = {
 
 	.reset = lrc_reset,
 	.destroy = guc_context_destroy,
+
+	.create_virtual = guc_create_virtual,
 };
 
 static void __guc_signal_context_fence(struct intel_context *ce)
@@ -1153,8 +2000,6 @@ static void guc_signal_context_fence(struct intel_context *ce)
 {
 	unsigned long flags;
 
-	GEM_BUG_ON(!context_wait_for_deregister_to_register(ce));
-
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	clr_context_wait_for_deregister_to_register(ce);
 	__guc_signal_context_fence(ce);
@@ -1163,8 +2008,9 @@ static void guc_signal_context_fence(struct intel_context *ce)
 
 static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
 {
-	return new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
-		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id);
+	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
+		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id)) &&
+		!submission_disabled(ce_to_guc(ce));
 }
 
 static int guc_request_alloc(struct i915_request *rq)
@@ -1222,8 +2068,12 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (unlikely(ret < 0))
 		return ret;
 	if (context_needs_register(ce, !!ret)) {
-		ret = guc_lrc_desc_pin(ce);
+		ret = guc_lrc_desc_pin(ce, true);
 		if (unlikely(ret)) {	/* unwind */
+			if (ret == -EPIPE) {
+				disable_submission(guc);
+				goto out;	/* GPU will be reset */
+			}
 			atomic_dec(&ce->guc_id_ref);
 			unpin_guc_id(guc, ce);
 			return ret;
@@ -1260,6 +2110,162 @@ static int guc_request_alloc(struct i915_request *rq)
 	return 0;
 }
 
+static int guc_virtual_context_pre_pin(struct intel_context *ce,
+				       struct i915_gem_ww_ctx *ww,
+				       void **vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return __guc_context_pre_pin(ce, engine, ww, vaddr);
+}
+
+static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return __guc_context_pin(ce, engine, vaddr);
+}
+
+static void guc_virtual_context_enter(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_get(engine);
+
+	intel_timeline_enter(ce->timeline);
+}
+
+static void guc_virtual_context_exit(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_put(engine);
+
+	intel_timeline_exit(ce->timeline);
+}
+
+static int guc_virtual_context_alloc(struct intel_context *ce)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	return lrc_alloc(ce, engine);
+}
+
+static const struct intel_context_ops virtual_guc_context_ops = {
+	.alloc = guc_virtual_context_alloc,
+
+	.pre_pin = guc_virtual_context_pre_pin,
+	.pin = guc_virtual_context_pin,
+	.unpin = guc_context_unpin,
+	.post_unpin = guc_context_post_unpin,
+
+	.ban = guc_context_ban,
+
+	.cancel_request = guc_context_cancel_request,
+
+	.enter = guc_virtual_context_enter,
+	.exit = guc_virtual_context_exit,
+
+	.sched_disable = guc_context_sched_disable,
+
+	.destroy = guc_context_destroy,
+
+	.get_sibling = guc_virtual_get_sibling,
+};
+
+static bool
+guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
+{
+	struct intel_engine_cs *sibling;
+	intel_engine_mask_t tmp, mask = b->engine_mask;
+	bool result = false;
+
+	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
+		result |= intel_engine_irq_enable(sibling);
+
+	return result;
+}
+
+static void
+guc_irq_disable_breadcrumbs(struct intel_breadcrumbs *b)
+{
+	struct intel_engine_cs *sibling;
+	intel_engine_mask_t tmp, mask = b->engine_mask;
+
+	for_each_engine_masked(sibling, b->irq_engine->gt, mask, tmp)
+		intel_engine_irq_disable(sibling);
+}
+
+static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
+{
+	int i;
+
+	/*
+	 * In GuC submission mode we do not know which physical engine a request
+	 * will be scheduled on, this creates a problem because the breadcrumb
+	 * interrupt is per physical engine. To work around this we attach
+	 * requests and direct all breadcrumb interrupts to the first instance
+	 * of an engine per class. In addition all breadcrumb interrupts are
+	 * enabled / disabled across an engine class in unison.
+	 */
+	for (i = 0; i < MAX_ENGINE_INSTANCE; ++i) {
+		struct intel_engine_cs *sibling =
+			engine->gt->engine_class[engine->class][i];
+
+		if (sibling) {
+			if (engine->breadcrumbs != sibling->breadcrumbs) {
+				intel_breadcrumbs_put(engine->breadcrumbs);
+				engine->breadcrumbs =
+					intel_breadcrumbs_get(sibling->breadcrumbs);
+			}
+			break;
+		}
+	}
+
+	if (engine->breadcrumbs) {
+		engine->breadcrumbs->engine_mask |= engine->mask;
+		engine->breadcrumbs->irq_enable = guc_irq_enable_breadcrumbs;
+		engine->breadcrumbs->irq_disable = guc_irq_disable_breadcrumbs;
+	}
+}
+
+static void guc_bump_inflight_request_prio(struct i915_request *rq,
+					   int prio)
+{
+	struct intel_context *ce = rq->context;
+	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
+
+	/* Short circuit function */
+	if (prio < I915_PRIORITY_NORMAL ||
+	    rq->guc_prio == GUC_PRIO_FINI ||
+	    (rq->guc_prio != GUC_PRIO_INIT &&
+	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
+		return;
+
+	spin_lock(&ce->guc_active.lock);
+	if (rq->guc_prio != GUC_PRIO_FINI) {
+		if (rq->guc_prio != GUC_PRIO_INIT)
+			sub_context_inflight_prio(ce, rq->guc_prio);
+		rq->guc_prio = new_guc_prio;
+		add_context_inflight_prio(ce, rq->guc_prio);
+		update_context_prio(ce);
+	}
+	spin_unlock(&ce->guc_active.lock);
+}
+
+static void guc_retire_inflight_request_prio(struct i915_request *rq)
+{
+	struct intel_context *ce = rq->context;
+
+	spin_lock(&ce->guc_active.lock);
+	guc_prio_fini(rq, ce);
+	spin_unlock(&ce->guc_active.lock);
+}
+
 static void sanitize_hwsp(struct intel_engine_cs *engine)
 {
 	struct intel_timeline *tl;
@@ -1326,6 +2332,11 @@ static int guc_resume(struct intel_engine_cs *engine)
 	return 0;
 }
 
+static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
+{
+	return !sched_engine->tasklet.callback;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -1336,7 +2347,7 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
 {
 	if (context_guc_id_invalid(ce))
 		pin_guc_id(guc, ce);
-	guc_lrc_desc_pin(ce);
+	guc_lrc_desc_pin(ce, true);
 }
 
 static inline void guc_init_lrc_mapping(struct intel_guc *guc)
@@ -1374,6 +2385,15 @@ static void guc_release(struct intel_engine_cs *engine)
 	lrc_fini_wa_ctx(engine);
 }
 
+static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
+{
+	struct intel_engine_cs *e;
+	intel_engine_mask_t tmp, mask = engine->mask;
+
+	for_each_engine_masked(e, engine->gt, mask, tmp)
+		e->serial++;
+}
+
 static void guc_default_vfuncs(struct intel_engine_cs *engine)
 {
 	/* Default vfuncs which can be overridden by each engine. */
@@ -1382,13 +2402,15 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 
 	engine->cops = &guc_context_ops;
 	engine->request_alloc = guc_request_alloc;
+	engine->add_active_request = add_to_context;
+	engine->remove_active_request = remove_from_context;
 
 	engine->sched_engine->schedule = i915_schedule;
 
-	engine->reset.prepare = guc_reset_prepare;
-	engine->reset.rewind = guc_reset_rewind;
-	engine->reset.cancel = guc_reset_cancel;
-	engine->reset.finish = guc_reset_finish;
+	engine->reset.prepare = guc_reset_nop;
+	engine->reset.rewind = guc_rewind_nop;
+	engine->reset.cancel = guc_reset_nop;
+	engine->reset.finish = guc_reset_nop;
 
 	engine->emit_flush = gen8_emit_flush_xcs;
 	engine->emit_init_breadcrumb = gen8_emit_init_breadcrumb;
@@ -1400,13 +2422,13 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	engine->set_default_submission = guc_set_default_submission;
 
 	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
+	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 
 	/*
 	 * TODO: GuC supports timeslicing and semaphores as well, but they're
 	 * handled by the firmware so some minor tweaks are required before
 	 * enabling.
 	 *
-	 * engine->flags |= I915_ENGINE_HAS_TIMESLICES;
 	 * engine->flags |= I915_ENGINE_HAS_SEMAPHORES;
 	 */
 
@@ -1437,6 +2459,17 @@ static inline void guc_default_irqs(struct intel_engine_cs *engine)
 	intel_engine_set_irq_handler(engine, cs_irq_handler);
 }
 
+static void guc_sched_engine_destroy(struct kref *kref)
+{
+	struct i915_sched_engine *sched_engine =
+		container_of(kref, typeof(*sched_engine), ref);
+	struct intel_guc *guc = sched_engine->private_data;
+
+	guc->sched_engine = NULL;
+	tasklet_kill(&sched_engine->tasklet); /* flush the callback */
+	kfree(sched_engine);
+}
+
 int intel_guc_submission_setup(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
@@ -1454,7 +2487,13 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 			return -ENOMEM;
 
 		guc->sched_engine->schedule = i915_schedule;
+		guc->sched_engine->disabled = guc_sched_engine_disabled;
 		guc->sched_engine->private_data = guc;
+		guc->sched_engine->destroy = guc_sched_engine_destroy;
+		guc->sched_engine->bump_inflight_request_prio =
+			guc_bump_inflight_request_prio;
+		guc->sched_engine->retire_inflight_request_prio =
+			guc_retire_inflight_request_prio;
 		tasklet_setup(&guc->sched_engine->tasklet,
 			      guc_submission_tasklet);
 	}
@@ -1463,6 +2502,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 
 	guc_default_vfuncs(engine);
 	guc_default_irqs(engine);
+	guc_init_breadcrumbs(engine);
 
 	if (engine->class == RENDER_CLASS)
 		rcs_submission_override(engine);
@@ -1490,6 +2530,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
 	/* Note: By the time we're here, GuC may have already been reset */
 }
 
+static bool __guc_submission_supported(struct intel_guc *guc)
+{
+	/* GuC submission is unavailable for pre-Gen11 */
+	return intel_guc_is_supported(guc) &&
+	       GRAPHICS_VER(guc_to_gt(guc)->i915) >= 11;
+}
+
 static bool __guc_submission_selected(struct intel_guc *guc)
 {
 	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
@@ -1502,6 +2549,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
 
 void intel_guc_submission_init_early(struct intel_guc *guc)
 {
+	guc->submission_supported = __guc_submission_supported(guc);
 	guc->submission_selected = __guc_submission_selected(guc);
 }
 
@@ -1560,13 +2608,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 		 * register this context.
 		 */
 		with_intel_runtime_pm(runtime_pm, wakeref)
-			register_context(ce);
+			register_context(ce, true);
 		guc_signal_context_fence(ce);
 		intel_context_put(ce);
 	} else if (context_destroyed(ce)) {
 		/* Context has been destroyed */
 		release_guc_id(guc, ce);
-		lrc_destroy(&ce->ref);
+		__guc_context_destroy(ce);
 	}
 
 	decr_outstanding_submission_g2h(guc);
@@ -1606,6 +2654,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (context_pending_enable(ce)) {
 		clr_context_pending_enable(ce);
 	} else if (context_pending_disable(ce)) {
+		bool banned;
+
 		/*
 		 * Unpin must be done before __guc_signal_context_fence,
 		 * otherwise a race exists between the requests getting
@@ -1616,9 +2666,17 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		intel_context_sched_disable_unpin(ce);
 
 		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		banned = context_banned(ce);
+		clr_context_banned(ce);
 		clr_context_pending_disable(ce);
 		__guc_signal_context_fence(ce);
+		guc_blocked_fence_complete(ce);
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+		if (banned) {
+			guc_cancel_context_requests(ce);
+			intel_engine_signal_breadcrumbs(ce->engine);
+		}
 	}
 
 	decr_outstanding_submission_g2h(guc);
@@ -1627,6 +2685,170 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static void capture_error_state(struct intel_guc *guc,
+				struct intel_context *ce)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
+	intel_wakeref_t wakeref;
+
+	intel_engine_set_hung_context(engine, ce);
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		i915_capture_error_state(gt, engine->mask);
+	atomic_inc(&i915->gpu_error.reset_engine_count[engine->uabi_class]);
+}
+
+static void guc_context_replay(struct intel_context *ce)
+{
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+
+	__guc_reset_context(ce, true);
+	tasklet_hi_schedule(&sched_engine->tasklet);
+}
+
+static void guc_handle_context_reset(struct intel_guc *guc,
+				     struct intel_context *ce)
+{
+	trace_intel_context_reset(ce);
+
+	if (likely(!intel_context_is_banned(ce))) {
+		capture_error_state(guc, ce);
+		guc_context_replay(ce);
+	}
+}
+
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len)
+{
+	struct intel_context *ce;
+	int desc_idx;
+
+	if (unlikely(len != 1)) {
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	desc_idx = msg[0];
+	ce = g2h_context_lookup(guc, desc_idx);
+	if (unlikely(!ce))
+		return -EPROTO;
+
+	guc_handle_context_reset(guc, ce);
+
+	return 0;
+}
+
+static struct intel_engine_cs *
+guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u8 engine_class = guc_class_to_engine_class(guc_class);
+
+	/* Class index is checked in class converter */
+	GEM_BUG_ON(instance > MAX_ENGINE_INSTANCE);
+
+	return gt->engine_class[engine_class][instance];
+}
+
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len)
+{
+	struct intel_engine_cs *engine;
+	u8 guc_class, instance;
+	u32 reason;
+
+	if (unlikely(len != 3)) {
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	guc_class = msg[0];
+	instance = msg[1];
+	reason = msg[2];
+
+	engine = guc_lookup_engine(guc, guc_class, instance);
+	if (unlikely(!engine)) {
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			"Invalid engine %d:%d", guc_class, instance);
+		return -EPROTO;
+	}
+
+	intel_gt_handle_error(guc_to_gt(guc), engine->mask,
+			      I915_ERROR_CAPTURE,
+			      "GuC failed to reset %s (reason=0x%08x)\n",
+			      engine->name, reason);
+
+	return 0;
+}
+
+void intel_guc_find_hung_context(struct intel_engine_cs *engine)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_context *ce;
+	struct i915_request *rq;
+	unsigned long index;
+
+	/* Reset called during driver load? GuC not yet initialised! */
+	if (unlikely(!guc_submission_initialized(guc)))
+		return;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!intel_context_is_pinned(ce))
+			continue;
+
+		if (intel_engine_is_virtual(ce->engine)) {
+			if (!(ce->engine->mask & engine->mask))
+				continue;
+		} else {
+			if (ce->engine != engine)
+				continue;
+		}
+
+		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
+			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
+				continue;
+
+			intel_engine_set_hung_context(engine, ce);
+
+			/* Can only cope with one hang at a time... */
+			return;
+		}
+	}
+}
+
+void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
+				    struct i915_request *hung_rq,
+				    struct drm_printer *m)
+{
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	struct intel_context *ce;
+	unsigned long index;
+	unsigned long flags;
+
+	/* Reset called during driver load? GuC not yet initialised! */
+	if (unlikely(!guc_submission_initialized(guc)))
+		return;
+
+	xa_for_each(&guc->context_lookup, index, ce) {
+		if (!intel_context_is_pinned(ce))
+			continue;
+
+		if (intel_engine_is_virtual(ce->engine)) {
+			if (!(ce->engine->mask & engine->mask))
+				continue;
+		} else {
+			if (ce->engine != engine)
+				continue;
+		}
+
+		spin_lock_irqsave(&ce->guc_active.lock, flags);
+		intel_engine_dump_active_requests(&ce->guc_active.requests,
+						  hung_rq, m);
+		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
+	}
+}
+
 void intel_guc_submission_print_info(struct intel_guc *guc,
 				     struct drm_printer *p)
 {
@@ -1657,6 +2879,22 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 	drm_printf(p, "\n");
 }
 
+static inline void guc_log_context_priority(struct drm_printer *p,
+					    struct intel_context *ce)
+{
+	int i;
+
+	drm_printf(p, "\t\tPriority: %d\n",
+		   ce->guc_prio);
+	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
+	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
+	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
+		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
+			   i, ce->guc_prio_count[i]);
+	}
+	drm_printf(p, "\n");
+}
+
 void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					     struct drm_printer *p)
 {
@@ -1679,5 +2917,113 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
 		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
 			   ce->guc_state.sched_state,
 			   atomic_read(&ce->guc_sched_state_no_lock));
+
+		guc_log_context_priority(p, ce);
 	}
 }
+
+static struct intel_context *
+guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
+{
+	struct guc_virtual_engine *ve;
+	struct intel_guc *guc;
+	unsigned int n;
+	int err;
+
+	ve = kzalloc(sizeof(*ve), GFP_KERNEL);
+	if (!ve)
+		return ERR_PTR(-ENOMEM);
+
+	guc = &siblings[0]->gt->uc.guc;
+
+	ve->base.i915 = siblings[0]->i915;
+	ve->base.gt = siblings[0]->gt;
+	ve->base.uncore = siblings[0]->uncore;
+	ve->base.id = -1;
+
+	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
+	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
+	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
+	ve->base.saturated = ALL_ENGINES;
+
+	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
+
+	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
+
+	ve->base.cops = &virtual_guc_context_ops;
+	ve->base.request_alloc = guc_request_alloc;
+	ve->base.bump_serial = virtual_guc_bump_serial;
+
+	ve->base.submit_request = guc_submit_request;
+
+	ve->base.flags = I915_ENGINE_IS_VIRTUAL;
+
+	intel_context_init(&ve->context, &ve->base);
+
+	for (n = 0; n < count; n++) {
+		struct intel_engine_cs *sibling = siblings[n];
+
+		GEM_BUG_ON(!is_power_of_2(sibling->mask));
+		if (sibling->mask & ve->base.mask) {
+			DRM_DEBUG("duplicate %s entry in load balancer\n",
+				  sibling->name);
+			err = -EINVAL;
+			goto err_put;
+		}
+
+		ve->base.mask |= sibling->mask;
+
+		if (n != 0 && ve->base.class != sibling->class) {
+			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
+				  sibling->class, ve->base.class);
+			err = -EINVAL;
+			goto err_put;
+		} else if (n == 0) {
+			ve->base.class = sibling->class;
+			ve->base.uabi_class = sibling->uabi_class;
+			snprintf(ve->base.name, sizeof(ve->base.name),
+				 "v%dx%d", ve->base.class, count);
+			ve->base.context_size = sibling->context_size;
+
+			ve->base.add_active_request =
+				sibling->add_active_request;
+			ve->base.remove_active_request =
+				sibling->remove_active_request;
+			ve->base.emit_bb_start = sibling->emit_bb_start;
+			ve->base.emit_flush = sibling->emit_flush;
+			ve->base.emit_init_breadcrumb =
+				sibling->emit_init_breadcrumb;
+			ve->base.emit_fini_breadcrumb =
+				sibling->emit_fini_breadcrumb;
+			ve->base.emit_fini_breadcrumb_dw =
+				sibling->emit_fini_breadcrumb_dw;
+			ve->base.breadcrumbs =
+				intel_breadcrumbs_get(sibling->breadcrumbs);
+
+			ve->base.flags |= sibling->flags;
+
+			ve->base.props.timeslice_duration_ms =
+				sibling->props.timeslice_duration_ms;
+			ve->base.props.preempt_timeout_ms =
+				sibling->props.preempt_timeout_ms;
+		}
+	}
+
+	return &ve->context;
+
+err_put:
+	intel_context_put(&ve->context);
+	return ERR_PTR(err);
+}
+
+bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
+{
+	struct intel_engine_cs *engine;
+	intel_engine_mask_t tmp, mask = ve->mask;
+
+	for_each_engine_masked(engine, ve->gt, mask, tmp)
+		if (READ_ONCE(engine->props.heartbeat_interval_ms))
+			return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index 2b9470c90558..c7ef44fa0c36 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -25,11 +25,20 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
 				     struct drm_printer *p);
 void intel_guc_submission_print_context_info(struct intel_guc *guc,
 					     struct drm_printer *p);
+void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
+				    struct i915_request *hung_rq,
+				    struct drm_printer *m);
+
+bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
+
+int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
+				   atomic_t *wait_var,
+				   bool interruptible,
+				   long timeout);
 
 static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
 {
-	/* XXX: GuC submission is unavailable for now */
-	return false;
+	return guc->submission_supported;
 }
 
 static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 6d8b9233214e..da57d18d9f6b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -34,8 +34,14 @@ static void uc_expand_default_options(struct intel_uc *uc)
 		return;
 	}
 
-	/* Default: enable HuC authentication only */
-	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+	/* Intermediate platforms are HuC authentication only */
+	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
+		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
+		return;
+	}
+
+	/* Default: enable HuC authentication and GuC submission */
+	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
 }
 
 /* Reset GuC providing us with fresh state for both GuC and HuC.
@@ -120,6 +126,11 @@ void intel_uc_init_early(struct intel_uc *uc)
 		uc->ops = &uc_ops_off;
 }
 
+void intel_uc_init_late(struct intel_uc *uc)
+{
+	intel_guc_init_late(&uc->guc);
+}
+
 void intel_uc_driver_late_release(struct intel_uc *uc)
 {
 }
@@ -207,21 +218,6 @@ static void guc_handle_mmio_msg(struct intel_guc *guc)
 	spin_unlock_irq(&guc->irq_lock);
 }
 
-static void guc_reset_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.reset(guc);
-}
-
-static void guc_enable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.enable(guc);
-}
-
-static void guc_disable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.disable(guc);
-}
-
 static int guc_enable_communication(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -242,7 +238,7 @@ static int guc_enable_communication(struct intel_guc *guc)
 	guc_get_mmio_msg(guc);
 	guc_handle_mmio_msg(guc);
 
-	guc_enable_interrupts(guc);
+	intel_guc_enable_interrupts(guc);
 
 	/* check for CT messages received before we enabled interrupts */
 	spin_lock_irq(&gt->irq_lock);
@@ -265,7 +261,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_clear_mmio_msg(guc);
 
-	guc_disable_interrupts(guc);
+	intel_guc_disable_interrupts(guc);
 
 	intel_guc_ct_disable(&guc->ct);
 
@@ -323,9 +319,6 @@ static int __uc_init(struct intel_uc *uc)
 	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
 		return -ENOMEM;
 
-	/* XXX: GuC submission is unavailable for now */
-	GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
-
 	ret = intel_guc_init(guc);
 	if (ret)
 		return ret;
@@ -463,7 +456,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (ret)
 		goto err_out;
 
-	guc_reset_interrupts(guc);
+	intel_guc_reset_interrupts(guc);
 
 	/* WaEnableuKernelHeaderValidFix:skl */
 	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
@@ -565,23 +558,67 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 
-	if (!intel_guc_is_ready(guc))
+	uc->reset_in_progress = true;
+
+	/* Nothing to do if GuC isn't supported */
+	if (!intel_uc_supports_guc(uc))
 		return;
 
+	/* Firmware expected to be running when this function is called */
+	if (!intel_guc_is_ready(guc))
+		goto sanitize;
+
+	if (intel_uc_uses_guc_submission(uc))
+		intel_guc_submission_reset_prepare(guc);
+
+sanitize:
 	__uc_sanitize(uc);
 }
 
+void intel_uc_reset(struct intel_uc *uc, bool stalled)
+{
+	struct intel_guc *guc = &uc->guc;
+
+	/* Firmware can not be running when this function is called  */
+	if (intel_uc_uses_guc_submission(uc))
+		intel_guc_submission_reset(guc, stalled);
+}
+
+void intel_uc_reset_finish(struct intel_uc *uc)
+{
+	struct intel_guc *guc = &uc->guc;
+
+	uc->reset_in_progress = false;
+
+	/* Firmware expected to be running when this function is called */
+	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
+		intel_guc_submission_reset_finish(guc);
+}
+
+void intel_uc_cancel_requests(struct intel_uc *uc)
+{
+	struct intel_guc *guc = &uc->guc;
+
+	/* Firmware can not be running when this function is called  */
+	if (intel_uc_uses_guc_submission(uc))
+		intel_guc_submission_cancel_requests(guc);
+}
+
 void intel_uc_runtime_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
-	int err;
 
 	if (!intel_guc_is_ready(guc))
 		return;
 
-	err = intel_guc_suspend(guc);
-	if (err)
-		DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
+	/*
+	 * Wait for any outstanding CTB before tearing down communication /w the
+	 * GuC.
+	 */
+#define OUTSTANDING_CTB_TIMEOUT_PERIOD	(HZ / 5)
+	intel_guc_wait_for_pending_msg(guc, &guc->outstanding_submission_g2h,
+				       false, OUTSTANDING_CTB_TIMEOUT_PERIOD);
+	GEM_WARN_ON(atomic_read(&guc->outstanding_submission_g2h));
 
 	guc_disable_communication(guc);
 }
@@ -590,12 +627,16 @@ void intel_uc_suspend(struct intel_uc *uc)
 {
 	struct intel_guc *guc = &uc->guc;
 	intel_wakeref_t wakeref;
+	int err;
 
 	if (!intel_guc_is_ready(guc))
 		return;
 
-	with_intel_runtime_pm(uc_to_gt(uc)->uncore->rpm, wakeref)
-		intel_uc_runtime_suspend(uc);
+	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
+		err = intel_guc_suspend(guc);
+		if (err)
+			DRM_DEBUG_DRIVER("Failed to suspend GuC, err=%d", err);
+	}
 }
 
 static int __uc_resume(struct intel_uc *uc, bool enable_communication)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index c4cef885e984..e2da2b6e76e1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -30,13 +30,19 @@ struct intel_uc {
 
 	/* Snapshot of GuC log from last failed load */
 	struct drm_i915_gem_object *load_err_log;
+
+	bool reset_in_progress;
 };
 
 void intel_uc_init_early(struct intel_uc *uc);
+void intel_uc_init_late(struct intel_uc *uc);
 void intel_uc_driver_late_release(struct intel_uc *uc);
 void intel_uc_driver_remove(struct intel_uc *uc);
 void intel_uc_init_mmio(struct intel_uc *uc);
 void intel_uc_reset_prepare(struct intel_uc *uc);
+void intel_uc_reset(struct intel_uc *uc, bool stalled);
+void intel_uc_reset_finish(struct intel_uc *uc);
+void intel_uc_cancel_requests(struct intel_uc *uc);
 void intel_uc_suspend(struct intel_uc *uc);
 void intel_uc_runtime_suspend(struct intel_uc *uc);
 int intel_uc_resume(struct intel_uc *uc);
diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 4e2b077692cb..20424275d41e 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -6,9 +6,21 @@
 #include <linux/kernel.h>
 
 #include "i915_debugfs_params.h"
+#include "gt/intel_gt.h"
+#include "gt/uc/intel_guc.h"
 #include "i915_drv.h"
 #include "i915_params.h"
 
+#define MATCH_DEBUGFS_NODE_NAME(_file, _name) \
+	(strcmp((_file)->f_path.dentry->d_name.name, (_name)) == 0)
+
+#define GET_I915(i915, name, ptr)	\
+	do {	\
+		struct i915_params *params;	\
+		params = container_of(((void *)(ptr)), typeof(*params), name);	\
+		(i915) = container_of(params, typeof(*(i915)), params);	\
+	} while (0)
+
 /* int param */
 static int i915_param_int_show(struct seq_file *m, void *data)
 {
@@ -24,6 +36,16 @@ static int i915_param_int_open(struct inode *inode, struct file *file)
 	return single_open(file, i915_param_int_show, inode->i_private);
 }
 
+static int notify_guc(struct drm_i915_private *i915)
+{
+	int ret = 0;
+
+	if (intel_uc_uses_guc_submission(&i915->gt.uc))
+		ret = intel_guc_global_policies_update(&i915->gt.uc.guc);
+
+	return ret;
+}
+
 static ssize_t i915_param_int_write(struct file *file,
 				    const char __user *ubuf, size_t len,
 				    loff_t *offp)
@@ -81,8 +103,10 @@ static ssize_t i915_param_uint_write(struct file *file,
 				     const char __user *ubuf, size_t len,
 				     loff_t *offp)
 {
+	struct drm_i915_private *i915;
 	struct seq_file *m = file->private_data;
 	unsigned int *value = m->private;
+	unsigned int old = *value;
 	int ret;
 
 	ret = kstrtouint_from_user(ubuf, len, 0, value);
@@ -95,6 +119,14 @@ static ssize_t i915_param_uint_write(struct file *file,
 			*value = b;
 	}
 
+	if (!ret && MATCH_DEBUGFS_NODE_NAME(file, "reset")) {
+		GET_I915(i915, reset, value);
+
+		ret = notify_guc(i915);
+		if (ret)
+			*value = old;
+	}
+
 	return ret ?: len;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index a2c58b54a592..0f08bcfbe964 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1429,20 +1429,37 @@ capture_engine(struct intel_engine_cs *engine,
 {
 	struct intel_engine_capture_vma *capture = NULL;
 	struct intel_engine_coredump *ee;
-	struct i915_request *rq;
+	struct intel_context *ce;
+	struct i915_request *rq = NULL;
 	unsigned long flags;
 
 	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
 	if (!ee)
 		return NULL;
 
-	spin_lock_irqsave(&engine->sched_engine->lock, flags);
-	rq = intel_engine_find_active_request(engine);
+	ce = intel_engine_get_hung_context(engine);
+	if (ce) {
+		intel_engine_clear_hung_context(engine);
+		rq = intel_context_find_active_request(ce);
+		if (!rq || !i915_request_started(rq))
+			goto no_request_capture;
+	} else {
+		/*
+		 * Getting here with GuC enabled means it is a forced error capture
+		 * with no actual hang. So, no need to attempt the execlist search.
+		 */
+		if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
+			spin_lock_irqsave(&engine->sched_engine->lock, flags);
+			rq = intel_engine_execlist_find_hung_request(engine);
+			spin_unlock_irqrestore(&engine->sched_engine->lock,
+					       flags);
+		}
+	}
 	if (rq)
 		capture = intel_engine_coredump_add_request(ee, rq,
 							    ATOMIC_MAYFAIL);
-	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 	if (!capture) {
+no_request_capture:
 		kfree(ee);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 314194b419f0..5603377e06ca 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12316,6 +12316,7 @@ enum skl_power_gate {
 
 /* MOCS (Memory Object Control State) registers */
 #define GEN9_LNCFCMOCS(i)	_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
+#define GEN9_LNCFCMOCS_REG_COUNT	32
 
 #define __GEN9_RCS0_MOCS0	0xc800
 #define GEN9_GFX_MOCS(i)	_MMIO(__GEN9_RCS0_MOCS0 + (i) * 4)
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 6594cb2f8ebd..1f1d4a6a0eff 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -114,6 +114,9 @@ static void i915_fence_release(struct dma_fence *fence)
 {
 	struct i915_request *rq = to_request(fence);
 
+	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
+		   rq->guc_prio != GUC_PRIO_FINI);
+
 	/*
 	 * The request is put onto a RCU freelist (i.e. the address
 	 * is immediately reused), mark the fences as being freed now.
@@ -125,39 +128,17 @@ static void i915_fence_release(struct dma_fence *fence)
 	i915_sw_fence_fini(&rq->semaphore);
 
 	/*
-	 * Keep one request on each engine for reserved use under mempressure
-	 *
-	 * We do not hold a reference to the engine here and so have to be
-	 * very careful in what rq->engine we poke. The virtual engine is
-	 * referenced via the rq->context and we released that ref during
-	 * i915_request_retire(), ergo we must not dereference a virtual
-	 * engine here. Not that we would want to, as the only consumer of
-	 * the reserved engine->request_pool is the power management parking,
-	 * which must-not-fail, and that is only run on the physical engines.
-	 *
-	 * Since the request must have been executed to be have completed,
-	 * we know that it will have been processed by the HW and will
-	 * not be unsubmitted again, so rq->engine and rq->execution_mask
-	 * at this point is stable. rq->execution_mask will be a single
-	 * bit if the last and _only_ engine it could execution on was a
-	 * physical engine, if it's multiple bits then it started on and
-	 * could still be on a virtual engine. Thus if the mask is not a
-	 * power-of-two we assume that rq->engine may still be a virtual
-	 * engine and so a dangling invalid pointer that we cannot dereference
-	 *
-	 * For example, consider the flow of a bonded request through a virtual
-	 * engine. The request is created with a wide engine mask (all engines
-	 * that we might execute on). On processing the bond, the request mask
-	 * is reduced to one or more engines. If the request is subsequently
-	 * bound to a single engine, it will then be constrained to only
-	 * execute on that engine and never returned to the virtual engine
-	 * after timeslicing away, see __unwind_incomplete_requests(). Thus we
-	 * know that if the rq->execution_mask is a single bit, rq->engine
-	 * can be a physical engine with the exact corresponding mask.
+	 * Keep one request on each engine for reserved use under mempressure,
+	 * do not use with virtual engines as this really is only needed for
+	 * kernel contexts.
 	 */
-	if (is_power_of_2(rq->execution_mask) &&
-	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
+	if (!intel_engine_is_virtual(rq->engine) &&
+	    !cmpxchg(&rq->engine->request_pool, NULL, rq)) {
+		intel_context_put(rq->context);
 		return;
+	}
+
+	intel_context_put(rq->context);
 
 	kmem_cache_free(global.slab_requests, rq);
 }
@@ -204,7 +185,7 @@ static bool irq_work_imm(struct irq_work *wrk)
 	return false;
 }
 
-static void __notify_execute_cb_imm(struct i915_request *rq)
+void i915_request_notify_execute_cb_imm(struct i915_request *rq)
 {
 	__notify_execute_cb(rq, irq_work_imm);
 }
@@ -278,37 +259,6 @@ i915_request_active_engine(struct i915_request *rq,
 	return ret;
 }
 
-
-static void remove_from_engine(struct i915_request *rq)
-{
-	struct intel_engine_cs *engine, *locked;
-
-	/*
-	 * Virtual engines complicate acquiring the engine timeline lock,
-	 * as their rq->engine pointer is not stable until under that
-	 * engine lock. The simple ploy we use is to take the lock then
-	 * check that the rq still belongs to the newly locked engine.
-	 */
-	locked = READ_ONCE(rq->engine);
-	spin_lock_irq(&locked->sched_engine->lock);
-	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
-		spin_unlock(&locked->sched_engine->lock);
-		spin_lock(&engine->sched_engine->lock);
-		locked = engine;
-	}
-	list_del_init(&rq->sched.link);
-
-	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
-	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
-
-	/* Prevent further __await_execution() registering a cb, then flush */
-	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
-
-	spin_unlock_irq(&locked->sched_engine->lock);
-
-	__notify_execute_cb_imm(rq);
-}
-
 static void __rq_init_watchdog(struct i915_request *rq)
 {
 	rq->watchdog.timer.function = NULL;
@@ -405,9 +355,7 @@ bool i915_request_retire(struct i915_request *rq)
 	 * after removing the breadcrumb and signaling it, so that we do not
 	 * inadvertently attach the breadcrumb to a completed request.
 	 */
-	if (!list_empty(&rq->sched.link))
-		remove_from_engine(rq);
-	atomic_dec(&rq->context->guc_id_ref);
+	rq->engine->remove_active_request(rq);
 	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
 
 	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */
@@ -538,7 +486,7 @@ __await_execution(struct i915_request *rq,
 	if (llist_add(&cb->work.node.llist, &signal->execute_cb)) {
 		if (i915_request_is_active(signal) ||
 		    __request_in_flight(signal))
-			__notify_execute_cb_imm(signal);
+			i915_request_notify_execute_cb_imm(signal);
 	}
 
 	return 0;
@@ -669,11 +617,15 @@ bool __i915_request_submit(struct i915_request *request)
 				     request->ring->vaddr + request->postfix);
 
 	trace_i915_request_execute(request);
-	engine->serial++;
+	if (engine->bump_serial)
+		engine->bump_serial(engine);
+	else
+		engine->serial++;
+
 	result = true;
 
 	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
-	list_move_tail(&request->sched.link, &engine->sched_engine->requests);
+	engine->add_active_request(request);
 active:
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &request->fence.flags);
 	set_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags);
@@ -761,18 +713,6 @@ void i915_request_unsubmit(struct i915_request *request)
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
 }
 
-static void __cancel_request(struct i915_request *rq)
-{
-	struct intel_engine_cs *engine = NULL;
-
-	i915_request_active_engine(rq, &engine);
-
-	if (engine && intel_engine_pulse(engine))
-		intel_gt_handle_error(engine->gt, engine->mask, 0,
-				      "request cancellation by %s",
-				      current->comm);
-}
-
 void i915_request_cancel(struct i915_request *rq, int error)
 {
 	if (!i915_request_set_error_once(rq, error))
@@ -780,7 +720,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
 
 	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
 
-	__cancel_request(rq);
+	intel_context_cancel_request(rq->context, rq);
 }
 
 static int __i915_sw_fence_call
@@ -952,7 +892,19 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 		}
 	}
 
-	rq->context = ce;
+	/*
+	 * Hold a reference to the intel_context over life of an i915_request.
+	 * Without this an i915_request can exist after the context has been
+	 * destroyed (e.g. request retired, context closed, but user space holds
+	 * a reference to the request from an out fence). In the case of GuC
+	 * submission + virtual engine, the engine that the request references
+	 * is also destroyed which can trigger bad pointer dref in fence ops
+	 * (e.g. i915_fence_get_driver_name). We could likely change these
+	 * functions to avoid touching the engine but let's just be safe and
+	 * hold the intel_context reference. In execlist mode the request always
+	 * eventually points to a physical engine so this isn't an issue.
+	 */
+	rq->context = intel_context_get(ce);
 	rq->engine = ce->engine;
 	rq->ring = ce->ring;
 	rq->execution_mask = ce->engine->mask;
@@ -975,6 +927,8 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 
 	rq->rcustate = get_state_synchronize_rcu(); /* acts as smp_mb() */
 
+	rq->guc_prio = GUC_PRIO_INIT;
+
 	/* We bump the ref for the fence chain */
 	i915_sw_fence_reinit(&i915_request_get(rq)->submit);
 	i915_sw_fence_reinit(&i915_request_get(rq)->semaphore);
@@ -1029,6 +983,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
 	GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
 
 err_free:
+	intel_context_put(ce);
 	kmem_cache_free(global.slab_requests, rq);
 err_unreserve:
 	intel_context_unpin(ce);
@@ -2079,6 +2034,47 @@ void i915_request_show(struct drm_printer *m,
 		   name);
 }
 
+static bool engine_match_ring(struct intel_engine_cs *engine, struct i915_request *rq)
+{
+	u32 ring = ENGINE_READ(engine, RING_START);
+
+	return ring == i915_ggtt_offset(rq->ring->vma);
+}
+
+static bool match_ring(struct i915_request *rq)
+{
+	struct intel_engine_cs *engine;
+	bool found;
+	int i;
+
+	if (!intel_engine_is_virtual(rq->engine))
+		return engine_match_ring(rq->engine, rq);
+
+	found = false;
+	i = 0;
+	while ((engine = intel_engine_get_sibling(rq->engine, i++))) {
+		found = engine_match_ring(engine, rq);
+		if (found)
+			break;
+	}
+
+	return found;
+}
+
+enum i915_request_state i915_test_request_state(struct i915_request *rq)
+{
+	if (i915_request_completed(rq))
+		return I915_REQUEST_COMPLETE;
+
+	if (!i915_request_started(rq))
+		return I915_REQUEST_PENDING;
+
+	if (match_ring(rq))
+		return I915_REQUEST_ACTIVE;
+
+	return I915_REQUEST_QUEUED;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_request.c"
 #include "selftests/i915_request.c"
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 717e5b292046..e6a0e0ebc9aa 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -293,6 +293,15 @@ struct i915_request {
 	 */
 	struct list_head guc_fence_link;
 
+	/**
+	 * Priority level while the request is inflight. Differs from i915
+	 * scheduler priority. See comment above
+	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
+	 */
+#define	GUC_PRIO_INIT	0xff
+#define	GUC_PRIO_FINI	0xfe
+	u8 guc_prio;
+
 	I915_SELFTEST_DECLARE(struct {
 		struct list_head link;
 		unsigned long delay;
@@ -647,4 +656,16 @@ bool
 i915_request_active_engine(struct i915_request *rq,
 			   struct intel_engine_cs **active);
 
+void i915_request_notify_execute_cb_imm(struct i915_request *rq);
+
+enum i915_request_state {
+	I915_REQUEST_UNKNOWN = 0,
+	I915_REQUEST_COMPLETE,
+	I915_REQUEST_PENDING,
+	I915_REQUEST_QUEUED,
+	I915_REQUEST_ACTIVE,
+};
+
+enum i915_request_state i915_test_request_state(struct i915_request *rq);
+
 #endif /* I915_REQUEST_H */
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 561c649e59f7..17843c204356 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -241,6 +241,9 @@ static void __i915_schedule(struct i915_sched_node *node,
 	/* Fifo and depth-first replacement ensure our deps execute before us */
 	sched_engine = lock_sched_engine(node, sched_engine, &cache);
 	list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
+		struct i915_request *from = container_of(dep->signaler,
+							 struct i915_request,
+							 sched);
 		INIT_LIST_HEAD(&dep->dfs_link);
 
 		node = dep->signaler;
@@ -254,6 +257,10 @@ static void __i915_schedule(struct i915_sched_node *node,
 		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
 			   sched_engine);
 
+		/* Must be called before changing the nodes priority */
+		if (sched_engine->bump_inflight_request_prio)
+			sched_engine->bump_inflight_request_prio(from, prio);
+
 		WRITE_ONCE(node->attr.priority, prio);
 
 		/*
@@ -431,7 +438,7 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 	rcu_read_unlock();
 }
 
-void i915_sched_engine_free(struct kref *kref)
+static void default_destroy(struct kref *kref)
 {
 	struct i915_sched_engine *sched_engine =
 		container_of(kref, typeof(*sched_engine), ref);
@@ -440,6 +447,11 @@ void i915_sched_engine_free(struct kref *kref)
 	kfree(sched_engine);
 }
 
+static bool default_disabled(struct i915_sched_engine *sched_engine)
+{
+	return false;
+}
+
 struct i915_sched_engine *
 i915_sched_engine_create(unsigned int subclass)
 {
@@ -453,6 +465,8 @@ i915_sched_engine_create(unsigned int subclass)
 
 	sched_engine->queue = RB_ROOT_CACHED;
 	sched_engine->queue_priority_hint = INT_MIN;
+	sched_engine->destroy = default_destroy;
+	sched_engine->disabled = default_disabled;
 
 	INIT_LIST_HEAD(&sched_engine->requests);
 	INIT_LIST_HEAD(&sched_engine->hold);
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 650ab8e0db9f..f4d9811ade5b 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -51,8 +51,6 @@ static inline void i915_priolist_free(struct i915_priolist *p)
 struct i915_sched_engine *
 i915_sched_engine_create(unsigned int subclass);
 
-void i915_sched_engine_free(struct kref *kref);
-
 static inline struct i915_sched_engine *
 i915_sched_engine_get(struct i915_sched_engine *sched_engine)
 {
@@ -63,7 +61,7 @@ i915_sched_engine_get(struct i915_sched_engine *sched_engine)
 static inline void
 i915_sched_engine_put(struct i915_sched_engine *sched_engine)
 {
-	kref_put(&sched_engine->ref, i915_sched_engine_free);
+	kref_put(&sched_engine->ref, sched_engine->destroy);
 }
 
 static inline bool
@@ -98,4 +96,10 @@ void i915_request_show_with_schedule(struct drm_printer *m,
 				     const char *prefix,
 				     int indent);
 
+static inline bool
+i915_sched_engine_disabled(struct i915_sched_engine *sched_engine)
+{
+	return sched_engine->disabled(sched_engine);
+}
+
 #endif /* _I915_SCHEDULER_H_ */
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index 5935c3152bdc..b0a1b58c7893 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -163,12 +163,34 @@ struct i915_sched_engine {
 	 */
 	void *private_data;
 
+	/**
+	 * @destroy: destroy schedule engine / cleanup in backend
+	 */
+	void	(*destroy)(struct kref *kref);
+
+	/**
+	 * @disabled: check if backend has disabled submission
+	 */
+	bool	(*disabled)(struct i915_sched_engine *sched_engine);
+
 	/**
 	 * @kick_backend: kick backend after a request's priority has changed
 	 */
 	void	(*kick_backend)(const struct i915_request *rq,
 				int prio);
 
+	/**
+	 * @bump_inflight_request_prio: update priority of an inflight request
+	 */
+	void	(*bump_inflight_request_prio)(struct i915_request *rq,
+					      int prio);
+
+	/**
+	 * @retire_inflight_request_prio: indicate request is retired to
+	 * priority tracking
+	 */
+	void	(*retire_inflight_request_prio)(struct i915_request *rq);
+
 	/**
 	 * @schedule: adjust priority of request
 	 *
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 68b70626c3e2..806ad688274b 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -904,6 +904,7 @@ DECLARE_EVENT_CLASS(intel_context,
 			     __field(int, pin_count)
 			     __field(u32, sched_state)
 			     __field(u32, guc_sched_state_no_lock)
+			     __field(u8, guc_prio)
 			     ),
 
 		    TP_fast_assign(
@@ -912,12 +913,29 @@ DECLARE_EVENT_CLASS(intel_context,
 			   __entry->sched_state = ce->guc_state.sched_state;
 			   __entry->guc_sched_state_no_lock =
 			   atomic_read(&ce->guc_sched_state_no_lock);
+			   __entry->guc_prio = ce->guc_prio;
 			   ),
 
-		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
+		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
 			      __entry->guc_id, __entry->pin_count,
 			      __entry->sched_state,
-			      __entry->guc_sched_state_no_lock)
+			      __entry->guc_sched_state_no_lock,
+			      __entry->guc_prio)
+);
+
+DEFINE_EVENT(intel_context, intel_context_set_prio,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_reset,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
+DEFINE_EVENT(intel_context, intel_context_ban,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
 );
 
 DEFINE_EVENT(intel_context, intel_context_register,
@@ -1007,6 +1025,21 @@ trace_i915_request_out(struct i915_request *rq)
 {
 }
 
+static inline void
+trace_intel_context_set_prio(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_reset(struct intel_context *ce)
+{
+}
+
+static inline void
+trace_intel_context_ban(struct intel_context *ce)
+{
+}
+
 static inline void
 trace_intel_context_register(struct intel_context *ce)
 {
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index bd5c96a77ba3..d67710d10615 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
 		i915_request_add(rq);
 
 		err = 0;
-		if (i915_request_wait(rq, 0, HZ / 5) < 0)
+		if (i915_request_wait(rq, 0, HZ) < 0)
 			err = -ETIME;
 		i915_request_put(rq);
 		if (err)
@@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
 	}
 	igt_spinner_end(&spin);
 
-	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
+	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
 		err = -EIO;
 	i915_request_put(rq);
 
diff --git a/drivers/gpu/drm/i915/selftests/igt_flush_test.c b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
index 7b0939e3f007..a6c71fca61aa 100644
--- a/drivers/gpu/drm/i915/selftests/igt_flush_test.c
+++ b/drivers/gpu/drm/i915/selftests/igt_flush_test.c
@@ -19,7 +19,7 @@ int igt_flush_test(struct drm_i915_private *i915)
 
 	cond_resched();
 
-	if (intel_gt_wait_for_idle(gt, HZ / 5) == -ETIME) {
+	if (intel_gt_wait_for_idle(gt, HZ) == -ETIME) {
 		pr_err("%pS timed out, cancelling all further testing.\n",
 		       __builtin_return_address(0));
 
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
new file mode 100644
index 000000000000..4b328346b48a
--- /dev/null
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+//#include "gt/intel_engine_user.h"
+#include "gt/intel_gt.h"
+#include "i915_drv.h"
+#include "i915_selftest.h"
+
+#include "selftests/intel_scheduler_helpers.h"
+
+#define REDUCED_TIMESLICE	5
+#define REDUCED_PREEMPT		10
+#define WAIT_FOR_RESET_TIME	10000
+
+int intel_selftest_modify_policy(struct intel_engine_cs *engine,
+				 struct intel_selftest_saved_policy *saved,
+				 u32 modify_type)
+
+{
+	int err;
+
+	saved->reset = engine->i915->params.reset;
+	saved->flags = engine->flags;
+	saved->timeslice = engine->props.timeslice_duration_ms;
+	saved->preempt_timeout = engine->props.preempt_timeout_ms;
+
+	switch (modify_type) {
+	case SELFTEST_SCHEDULER_MODIFY_FAST_RESET:
+		/*
+		 * Enable force pre-emption on time slice expiration
+		 * together with engine reset on pre-emption timeout.
+		 * This is required to make the GuC notice and reset
+		 * the single hanging context.
+		 * Also, reduce the preemption timeout to something
+		 * small to speed the test up.
+		 */
+		engine->i915->params.reset = 2;
+		engine->flags |= I915_ENGINE_WANT_FORCED_PREEMPTION;
+		engine->props.timeslice_duration_ms = REDUCED_TIMESLICE;
+		engine->props.preempt_timeout_ms = REDUCED_PREEMPT;
+		break;
+
+	case SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK:
+		engine->props.preempt_timeout_ms = 0;
+		break;
+
+	default:
+		pr_err("Invalid scheduler policy modification type: %d!\n", modify_type);
+		return -EINVAL;
+	}
+
+	if (!intel_engine_uses_guc(engine))
+		return 0;
+
+	err = intel_guc_global_policies_update(&engine->gt->uc.guc);
+	if (err)
+		intel_selftest_restore_policy(engine, saved);
+
+	return err;
+}
+
+int intel_selftest_restore_policy(struct intel_engine_cs *engine,
+				  struct intel_selftest_saved_policy *saved)
+{
+	/* Restore the original policies */
+	engine->i915->params.reset = saved->reset;
+	engine->flags = saved->flags;
+	engine->props.timeslice_duration_ms = saved->timeslice;
+	engine->props.preempt_timeout_ms = saved->preempt_timeout;
+
+	if (!intel_engine_uses_guc(engine))
+		return 0;
+
+	return intel_guc_global_policies_update(&engine->gt->uc.guc);
+}
+
+int intel_selftest_wait_for_rq(struct i915_request *rq)
+{
+	long ret;
+
+	ret = i915_request_wait(rq, 0, WAIT_FOR_RESET_TIME);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
new file mode 100644
index 000000000000..35c098601ac0
--- /dev/null
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
+#define _INTEL_SELFTEST_SCHEDULER_HELPERS_H_
+
+#include <linux/types.h>
+
+struct i915_request;
+struct intel_engine_cs;
+
+struct intel_selftest_saved_policy {
+	u32 flags;
+	u32 reset;
+	u64 timeslice;
+	u64 preempt_timeout;
+};
+
+enum selftest_scheduler_modify {
+	SELFTEST_SCHEDULER_MODIFY_NO_HANGCHECK = 0,
+	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
+};
+
+int intel_selftest_modify_policy(struct intel_engine_cs *engine,
+				 struct intel_selftest_saved_policy *saved,
+				 enum selftest_scheduler_modify modify_type);
+int intel_selftest_restore_policy(struct intel_engine_cs *engine,
+				  struct intel_selftest_saved_policy *saved);
+int intel_selftest_wait_for_rq(struct i915_request *rq);
+
+#endif
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 975087553ea0..7f13d241417f 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -572,6 +572,15 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+/*
+ * Indicates the 2k user priority levels are statically mapped into 3 buckets as
+ * follows:
+ *
+ * -1k to -1	Low priority
+ * 0		Normal priority
+ * 1 to 1k	Highest priority
+ */
+#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.25.0

