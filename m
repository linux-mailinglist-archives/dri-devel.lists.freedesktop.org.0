Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381512F6438
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 16:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B256E41A;
	Thu, 14 Jan 2021 15:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEC16E41A;
 Thu, 14 Jan 2021 15:22:44 +0000 (UTC)
IronPort-SDR: mB/1zfeFZKRr5b1kT5kIKD7MxUbXn8QxL62D6vBONXqiRfexXRwlU8r0+pj65T5UVfCj/r79fR
 Dy3Q82KXOMFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="239929149"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="239929149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 07:22:43 -0800
IronPort-SDR: RoUoH+6R1elsnQQdMzIC2y6pfMQjGUMsjpDEdV0qLh+G46DKyOw+i1hLUUWa30tLgOqoGk2Gim
 48Hx1MsmqGhg==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="353937512"
Received: from rbanner-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.214.242.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 07:22:36 -0800
Date: Thu, 14 Jan 2021 17:22:32 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <20210114152232.GA21588@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here is the first PR for v5.12. There are quite a few patches
accumulated after the holidays as usual:

Most importantly there are fixes to the clear residual security
mitigations to avoid GPU hangs caused by them. Further there is
option to allow the user to decide to disable such mitigations
similar to CPU side (i915.mitigations=3Dauto,!residuals), if they
are an expert user and wish to do so. Of course, usual caveats
apply to disabling any security mitigations!

For Tigerlake, a fix to reduce the likelihood of DMAR errors when
IOMMU is enabled (MTBF bump from 10 secs to hours) and correction
to detecting the device stepping. Addition of W/As for DG1 and TGL.

Tuning the RPS algorithm further to limit to RPe on parking an
engine. Plenty of refactoring, cleanups and optimizing code in
preparation of upcoming series. The usual amount of selftest and
documentation fixes.

Then there are 3 other fixes for user reported/visible bugs;
GPU hang due to wrong MOCS caching for index used by HW, false
error message for case where GuC firmware doesn't load on first
instance of the retry-loop and supplementing the GuC firmware
table for Cometlake SKUs.

Fixes for pre-emption on Gen8-era devices. Build and runtime
fixes for 32-bit machines.

Regards, Joonas

PS. After you merge this, I will proceed to backmerge drm-next so
that we can have a common topic branches for din and dign as
requested by Jani and Rodrigo.

***

drm-intel-gt-next-2021-01-14:

UAPI Changes:
- Deprecate I915_PMU_LAST and optimize state tracking (Tvrtko)

  Avoid relying on last item ABI marker in i915_drm.h, add a
  comment to mark as deprecated.

Driver Changes:

- Restore clear residuals security mitigations for Ivybridge and
  Baytrail (Chris)
- Close #1858: Allow sysadmin to choose applied GPU security mitigations
  through i915.mitigations=3D... similar to CPU (Chris)
- Fix for #2024: GPU hangs on HSW GT1 (Chris)
- Fix for #2707: Driver hang when editing UVs in Blender (Chris, Ville)
- Fix for #2797: False positive GuC loading error message (Chris)
- Fix for #2859: Missing GuC firmware for older Cometlakes (Chris)
- Lessen probability of GPU hang due to DMAR faults [reason 7,
  next page table ptr is invalid] on Tigerlake (Chris)
- Fix REVID macros for TGL to fetch correct stepping (Aditya)
- Limit frequency drop to RPe on parking (Chris, Edward)
- Limit W/A 1406941453 to TGL, RKL and DG1 (Swathi)
- Make W/A 22010271021 permanent on DG1 (Lucas)
- Implement W/A 16011163337 to prevent a HS/DS hang on DG1 (Swathi)
- Only disable preemption on gen8 render engines (Chris)
- Disable arbitration around Braswell's PDP updates (Chris)
- Disable arbitration on no-preempt requests (Chris)
- Check for arbitration after writing start seqno before busywaiting (Chris)
- Retain default context state across shrinking (Venkata, CQ)
- Fix mismatch between misplaced vma check and vma insert for 32-bit
  addressing userspaces (Chris, CQ)
- Propagate error for vmap() failure instead kernel NULL deref (Chris)
- Propagate error from cancelled submit due to context closure
  immediately (Chris)
- Fix RCU race on HWSP tracking per request (Chris)
- Clear CMD parser shadow and GPU reloc batches (Matt A)

- Populate logical context during first pin (Maarten)
- Optimistically prune dma-resv from the shrinker (Chris)
- Fix for virtual engine ownership race (Chris)
- Remove timeslice suppression to restore fairness for virtual engines (Chr=
is)
- Rearrange IVB/HSW workarounds properly between GT and engine (Chris)
- Taint the reset mutex with the shrinker (Chris)
- Replace direct submit with direct call to tasklet (Chris)
- Multiple corrections to virtual engine dequeue and breadcrumbs code (Chri=
s)
- Avoid wakeref from potentially hard IRQ context in PMU (Tvrtko)
- Use raw clock for RC6 time estimation in PMU (Tvrtko)
- Differentiate OOM failures from invalid map types (Chris)
- Fix Gen9 to have 64 MOCS entries similar to Gen11 (Chris)
- Ignore repeated attempts to suspend request flow across reset (Chris)
- Remove livelock from "do_idle_maps" VT-d W/A (Chris)
- Cancel the preemption timeout early in case engine reset fails (Chris)
- Code flow optimization in the scheduling code (Chris)
- Clear the execlists timers upon reset (Chris)
- Drain the breadcrumbs just once (Chris, Matt A)
- Track the overall GT awake/busy time (Chris)
- Tweak submission tasklet flushing to avoid starvation (Chris)
- Track timelines created using the HWSP to restore on resume (Chris)
- Use cmpxchg64 for 32b compatilibity for active tracking (Chris)
- Prefer recycling an idle GGTT fence to avoid GPU wait (Chris)

- Restructure GT code organization for clearer split between GuC
  and execlists (Chris, Daniele, John, Matt A)
- Remove GuC code that will remain unused by new interfaces (Matt B)
- Restructure the CS timestamp clocks code to local to GT (Chris)
- Fix error return paths in perf code (Zhang)
- Replace idr_init() by idr_init_base() in perf (Deepak)
- Fix shmem_pin_map error path (Colin)
- Drop redundant free_work worker for GEM contexts (Chris, Mika)
- Increase readability and understandability of intel_workarounds.c (Lucas)
- Defer enabling the breadcrumb interrupt to after submission (Chris)
- Deal with buddy alloc block sizes beyond 4G (Venkata, Chris)
- Encode fence specific waitqueue behaviour into the wait.flags (Chris)
- Don't cancel the breadcrumb interrupt shadow too early (Chris)
- Cancel submitted requests upon context reset (Chris)
- Use correct locks in GuC code (Tvrtko)
- Prevent use of engine->wa_ctx after error (Chris, Matt R)

- Fix build warning on 32-bit (Arnd)
- Avoid memory leak if platform would have more than 16 W/A (Tvrtko)
- Avoid unnecessary #if CONFIG_PM in PMU code (Chris, Tvrtko)
- Improve debugging output (Chris, Tvrtko, Matt R)
- Make file local variables static (Jani)
- Avoid uint*_t types in i915 (Jani)
- Selftest improvements (Chris, Matt A, Dan)
- Documentation fixes (Chris, Jose)

The following changes since commit 31b05212360cbf3af3c2e1b7f42e176e0eebedb5:

  Merge branch 'linux-5.11' of git://github.com/skeggsb/linux into drm-next=
 (2020-11-16 07:25:46 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-0=
1-14

for you to fetch changes up to 368fd0d79c099493f2b8e80f2ffaa6f70dd0461a:

  drm/i915/selftests: fix the uint*_t types that have crept in (2021-01-14 =
11:52:07 +0200)

----------------------------------------------------------------
UAPI Changes:
- Deprecate I915_PMU_LAST and optimize state tracking (Tvrtko)

  Avoid relying on last item ABI marker in i915_drm.h, add a
  comment to mark as deprecated.

Cross-subsystem Changes:

Core Changes:

Driver Changes:

- Restore clear residuals security mitigations for Ivybridge and
  Baytrail (Chris)
- Close #1858: Allow sysadmin to choose applied GPU security mitigations
  through i915.mitigations=3D... similar to CPU (Chris)
- Fix for #2024: GPU hangs on HSW GT1 (Chris)
- Fix for #2707: Driver hang when editing UVs in Blender (Chris, Ville)
- Fix for #2797: False positive GuC loading error message (Chris)
- Fix for #2859: Missing GuC firmware for older Cometlakes (Chris)
- Lessen probability of GPU hang due to DMAR faults [reason 7,
  next page table ptr is invalid] on Tigerlake (Chris)
- Fix REVID macros for TGL to fetch correct stepping (Aditya)
- Limit frequency drop to RPe on parking (Chris, Edward)
- Limit W/A 1406941453 to TGL, RKL and DG1 (Swathi)
- Make W/A 22010271021 permanent on DG1 (Lucas)
- Implement W/A 16011163337 to prevent a HS/DS hang on DG1 (Swathi)
- Only disable preemption on gen8 render engines (Chris)
- Disable arbitration around Braswell's PDP updates (Chris)
- Disable arbitration on no-preempt requests (Chris)
- Check for arbitration after writing start seqno before busywaiting (Chris)
- Retain default context state across shrinking (Venkata, CQ)
- Fix mismatch between misplaced vma check and vma insert for 32-bit
  addressing userspaces (Chris, CQ)
- Propagate error for vmap() failure instead kernel NULL deref (Chris)
- Propagate error from cancelled submit due to context closure
  immediately (Chris)
- Fix RCU race on HWSP tracking per request (Chris)
- Clear CMD parser shadow and GPU reloc batches (Matt A)

- Populate logical context during first pin (Maarten)
- Optimistically prune dma-resv from the shrinker (Chris)
- Fix for virtual engine ownership race (Chris)
- Remove timeslice suppression to restore fairness for virtual engines (Chr=
is)
- Rearrange IVB/HSW workarounds properly between GT and engine (Chris)
- Taint the reset mutex with the shrinker (Chris)
- Replace direct submit with direct call to tasklet (Chris)
- Multiple corrections to virtual engine dequeue and breadcrumbs code (Chri=
s)
- Avoid wakeref from potentially hard IRQ context in PMU (Tvrtko)
- Use raw clock for RC6 time estimation in PMU (Tvrtko)
- Differentiate OOM failures from invalid map types (Chris)
- Fix Gen9 to have 64 MOCS entries similar to Gen11 (Chris)
- Ignore repeated attempts to suspend request flow across reset (Chris)
- Remove livelock from "do_idle_maps" VT-d W/A (Chris)
- Cancel the preemption timeout early in case engine reset fails (Chris)
- Code flow optimization in the scheduling code (Chris)
- Clear the execlists timers upon reset (Chris)
- Drain the breadcrumbs just once (Chris, Matt A)
- Track the overall GT awake/busy time (Chris)
- Tweak submission tasklet flushing to avoid starvation (Chris)
- Track timelines created using the HWSP to restore on resume (Chris)
- Use cmpxchg64 for 32b compatilibity for active tracking (Chris)
- Prefer recycling an idle GGTT fence to avoid GPU wait (Chris)

- Restructure GT code organization for clearer split between GuC
  and execlists (Chris, Daniele, John, Matt A)
- Remove GuC code that will remain unused by new interfaces (Matt B)
- Restructure the CS timestamp clocks code to local to GT (Chris)
- Fix error return paths in perf code (Zhang)
- Replace idr_init() by idr_init_base() in perf (Deepak)
- Fix shmem_pin_map error path (Colin)
- Drop redundant free_work worker for GEM contexts (Chris, Mika)
- Increase readability and understandability of intel_workarounds.c (Lucas)
- Defer enabling the breadcrumb interrupt to after submission (Chris)
- Deal with buddy alloc block sizes beyond 4G (Venkata, Chris)
- Encode fence specific waitqueue behaviour into the wait.flags (Chris)
- Don't cancel the breadcrumb interrupt shadow too early (Chris)
- Cancel submitted requests upon context reset (Chris)
- Use correct locks in GuC code (Tvrtko)
- Prevent use of engine->wa_ctx after error (Chris, Matt R)

- Fix build warning on 32-bit (Arnd)
- Avoid memory leak if platform would have more than 16 W/A (Tvrtko)
- Avoid unnecessary #if CONFIG_PM in PMU code (Chris, Tvrtko)
- Improve debugging output (Chris, Tvrtko, Matt R)
- Make file local variables static (Jani)
- Avoid uint*_t types in i915 (Jani)
- Selftest improvements (Chris, Matt A, Dan)
- Documentation fixes (Chris, Jose)

----------------------------------------------------------------
Aditya Swarup (2):
      drm/i915/tgl: Fix REVID macros for TGL to fetch correct stepping
      drm/i915/tgl: Add bound checks and simplify TGL REVID macros

Arnd Bergmann (1):
      drm/i915: fix shift warning

Chris Wilson (117):
      drm/i915/gt: Ignore dt=3D=3D0 for reporting underflows
      drm/i915/gt: Remember to free the virtual breadcrumbs
      drm/i915/gvt: Remove incorrect kerneldoc marking
      drm/i915/gt: Include semaphore status in print_request()
      drm/i915: Lift i915_request_show()
      drm/i915/gt: Update request status flags for debug pretty-printer
      drm/i915/gt: Show all active timelines for debugging
      drm/i915: Lift waiter/signaler iterators
      drm/i915/gem: Remove incorrect early dbg print
      drm/i915/selftests: Improve granularity for mocs reset checks
      drm/i915/selftests: Small tweak to put the termination conditions tog=
ether
      drm/i915/gt: Plug IPS into intel_rps_set
      drm/i915/gt: Defer enabling the breadcrumb interrupt to after submiss=
ion
      drm/i915/gt: Track signaled breadcrumbs outside of the breadcrumb spi=
nlock
      drm/i915/gt: Don't cancel the interrupt shadow too early
      drm/i915/gt: Free stale request on destroying the virtual engine
      drm/i915/gt: Program mocs:63 for cache eviction on gen9
      drm/i915/gt: Decouple completed requests on unwind
      drm/i915/gt: Check for a completed last request once
      drm/i915/gt: Protect context lifetime with RCU
      drm/i915/gt: Split the breadcrumb spinlock between global and contexts
      drm/i915/gt: Move the breadcrumb to the signaler if completed upon ca=
ncel
      drm/i915/gt: Declare gen9 has 64 mocs entries!
      drm/i915/gt: Limit frequency drop to RPe on parking
      drm/i915/gem: Differentiate oom failures from invalid map types
      drm/i915/gem: Report error for vmap() failure
      drm/i915/selftests: Tidy prng constructor for client blits
      drm/i915/gem: Limit lmem scatterlist elements to UINT_MAX
      Revert "drm/i915/lmem: Limit block size to 4G"
      drm/i915/gem: Propagate error from cancelled submit due to context cl=
osure
      drm/i915/gt: Ignore repeated attempts to suspend request flow across =
reset
      drm/i915/gt: Cancel the preemption timeout on responding to it
      drm/i915/gt: Include reset failures in the trace
      drm/i915/gt: Clear the execlists timers upon reset
      drm/i915/selftests: Improve error reporting for igt_mock_max_segment
      drm/i915/gem: Drop false !i915_vma_is_closed assertion
      drm/i915: Remove livelock from "do_idle_maps" vtd w/a
      drm/i915: Sleep around performing iommu unmaps on Tigerlake
      drm/i915/gt: Remove uninterruptible parameter from intel_gt_wait_for_=
idle
      drm/i915/gt: Move move context layout registers and offsets to lrc_re=
g.h
      drm/i915/gt: Rename lrc.c to execlists_submission.c
      drm/i915/gt: Mark legacy ring context as lost
      drm/i915/gt: Wean workaround selftests off GEM context
      drm/i915: Fix mismatch between misplaced vma check and vma insert
      drm/i915/gem: Drop free_work for GEM contexts
      drm/i915/gt: Move gen8 CS emitters into gen8_engine_cs.h
      drm/i915: Encode fence specific waitqueue behaviour into the wait.fla=
gs
      drm/i915/gt: Drain the breadcrumbs just once
      drm/i915/gt: Track the overall awake/busy time
      drm/i915: Check for rq->hwsp validity after acquiring RCU lock
      drm/i915/gt: Another tweak for flushing the tasklets
      drm/i915/gt: Split logical ring contexts from execlist submission
      drm/i915/gt: Provide a utility to create a scratch buffer
      drm/i915/gt: Track all timelines created using the HWSP
      drm/i915/selftests: Kick timeslice until selftest yields
      drm/i915/selftests: Flush the preemption request before waiting
      drm/i915/selftests: Be paranoid and flush the tasklet before checking=
 status
      drm/i915: Use cmpxchg64 for 32b compatilibity
      drm/i915/uc: Squelch load failure error message
      drm/i915/selftests: Remove redundant live_context for eviction
      drm/i915/selftests: Confirm CS_TIMESTAMP / CTX_TIMESTAMP share a clock
      drm/i915/gt: Consolidate the CS timestamp clocks
      drm/i915/gt: Prefer recycling an idle fence
      drm/i915/gem: Optimistically prune dma-resv from the shrinker.
      drm/i915/gt: Replace direct submit with direct call to tasklet
      drm/i915/gt: Use virtual_engine during execlists_dequeue
      drm/i915/gt: Decouple inflight virtual engines
      drm/i915/gt: Defer schedule_out until after the next dequeue
      drm/i915/gt: Remove virtual breadcrumb before transfer
      drm/i915/gt: Shrink the critical section for irq signaling
      drm/i915/gt: Resubmit the virtual engine on schedule-out
      drm/i915/gt: Simplify virtual engine handling for execlists_hold()
      drm/i915/gt: ce->inflight updates are now serialised
      drm/i915/gt: Refactor heartbeat request construction and submission
      drm/i915/gt: Define guc firmware blob for older Cometlakes
      drm/i915/gem: Peek at the inflight context
      drm/i915/gt: Taint the reset mutex with the shrinker
      drm/i915/gt: Cancel submitted requests upon context reset
      drm/i915/gt: Pull context closure check from request submit to schedu=
le-in
      drm/i915: Drop i915_request.lock requirement for intel_rps_boost()
      drm/i915/gt: Rearrange snb workarounds
      drm/i915/gt: Rearrange hsw workarounds
      drm/i915/selftests: Guard against redifinition of SZ_8G
      drm/i915/selftests: Set error returns
      drm/i915: Set rawclk earlier during mmio probe
      drm/i915/gt: Allow failed resets without assertion
      drm/i915/gt: Check the virtual still matches upon locking
      drm/i915/selftests: Switch 4k kmalloc to use get_free_page for alignm=
ent
      drm/i915/selftests: Break out of the lrc layout test after register m=
ismatch
      drm/i915/selftests: Improve handling of iomem around stolen
      drm/i915: Wrap our timer_list.expires checking
      drm/i915/gt: Remove timeslice suppression
      drm/i915/gt: Prevent use of engine->wa_ctx after error
      drm/i915/selftests: Skip unstable timing measurements
      drm/i915/selftests: Rearrange ktime_get to reduce latency against CS
      drm/i915/gt: Restore ce->signal flush before releasing virtual engine
      drm/i915/gt: Only retire on the last breadcrumb if the last request
      drm/i915/gt: Only disable preemption on gen8 render engines
      drm/i915/gt: Disable arbitration on no-preempt requests
      drm/i915/gt: Exercise lrc_wa_ctx initialisation failure
      drm/i915/gt: Remove unused function 'dword_in_page'
      drm/i915/gt: Mark up a debug-only function
      drm/i915: Refactor marking a request as EIO
      drm/i915/gt: Disable arbitration around Braswell's pdp updates
      drm/i915/selftests: Include engine name after reset failure
      drm/i915/gt: Limit VFE threads based on GT
      drm/i915/gt: Restore clear-residual mitigations for Ivybridge, Baytra=
il
      drm/i915: Allow the sysadmin to override security mitigations
      drm/i915/gem: Remove stolen node before releasing the region
      drm/i915/selftests: Allow huge_gem_object to kick the shrinker
      drm/i915/gt: Check for arbitration after writing start seqno
      drm/i915/gt: Perform an arbitration check before busywaiting
      drm/i915/selftests: Force a failed engine reset
      drm/i915/selftests: Bump the scheduling error threshold for fast hear=
tbeats
      drm/i915/gt: Replace open-coded intel_engine_stop_cs()
      drm/i915/gt: Rearrange vlv workarounds
      drm/i915/gt: Rearrange ivb workarounds

Colin Ian King (1):
      drm/i915: fix size_t greater or equal to zero comparison

Dan Carpenter (2):
      drm/i915/gem: Check the correct variable in selftest
      drm/i915/selftests: Fix some error codes

Daniele Ceraolo Spurio (4):
      drm/i915: split gen8+ flush and bb_start emission functions
      drm/i915/guc: do not dump execlists state with GuC submission
      drm/i915/guc: init engine directly in GuC submission mode
      drm/i915/guc: stop calling execlists_set_default_submission

Deepak R Varma (1):
      drm/i915/perf: replace idr_init() by idr_init_base()

Jani Nikula (3):
      drm/i915/region: make intel_region_map static
      drm/i915/lmem: make intel_region_lmem_ops static
      drm/i915/selftests: fix the uint*_t types that have crept in

John Harrison (1):
      drm/i915: Correct location of Wa_1408615072

Jos=E9 Roberto de Souza (1):
      doc: Fix build of documentation after i915 file rename

Lucas De Marchi (7):
      drm/i915/dg1: make Wa_22010271021 permanent
      drm/i915: remove WA_SET_BIT_MASKED()
      drm/i915: remove WA_CLR_BIT_MASKED()
      drm/i915: remove WA_SET_FIELD_MASKED()
      drm/i915/gt: stop ignoring read with wa_masked_field_set
      drm/i915/gt: rename wa_write_masked_or()
      drm/i915/gt: document masked registers

Maarten Lankhorst (1):
      drm/i915: Populate logical context during first pin.

Matt Roper (1):
      drm/i915: Clarify error message on failed workaround

Matthew Auld (5):
      drm/i915/selftest: also consider non-contiguous objects
      drm/i915/selftest: assert we get 2M GTT pages
      drm/i915: clear the shadow batch
      drm/i915: clear the gpu reloc batch
      drm/i915: move region_lmem under gt

Matthew Brost (1):
      drm/i915/guc: Delete GuC code unused in future patches

Swathi Dhanavanthri (2):
      drm/i915/tgl, rkl, dg1: Apply WA_1406941453 to TGL, RKL and DG1
      drm/i915/dg1: Implement WA_16011163337

Tvrtko Ursulin (8):
      drm/i915: Avoid memory leak with more than 16 workarounds on a list
      drm/i915: Show timeline dependencies for debug
      drm/i915/guc: Use correct lock for accessing guc->mmio_msg
      drm/i915/guc: Use correct lock for CT event handler
      drm/i915/pmu: Deprecate I915_PMU_LAST and optimize state tracking
      drm/i915/pmu: Don't grab wakeref when enabling events
      drm/i915/pmu: Use raw clock for rc6 estimation
      drm/i915/pmu: Remove !CONFIG_PM code

Venkata Ramana Nayana (1):
      drm/i915/gt: Retain default context state across shrinking

Venkata Sandeep Dhanalakota (1):
      drm/i915/lmem: Limit block size to 4G

Zhang Xiaoxu (2):
      drm/i915/selftests: Fix wrong return value of perf_series_engines()
      drm/i915/selftests: Fix wrong return value of perf_request_latency()

 Documentation/gpu/i915.rst                         |    2 +-
 drivers/gpu/drm/i915/Makefile                      |    6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    1 +
 drivers/gpu/drm/i915/dma_resv_utils.c              |   17 +
 drivers/gpu/drm/i915/dma_resv_utils.h              |   13 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   67 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   24 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   32 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   36 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    8 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |    2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   22 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    4 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |    1 +
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    1 +
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |    1 +
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |   27 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |  157 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  633 ++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |  127 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  365 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h        |   17 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   15 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   15 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   11 +-
 drivers/gpu/drm/i915/gt/intel_context_sseu.c       |    1 -
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   48 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   93 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  151 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   59 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   10 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   16 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   | 3929 +++++++++++
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   47 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   18 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   22 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |  197 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.h     |    8 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   49 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |    7 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   25 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   29 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 6798 ++++------------=
----
 drivers/gpu/drm/i915/gt/intel_lrc.h                |  167 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h            |   41 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   25 +-
 drivers/gpu/drm/i915/{ =3D> gt}/intel_region_lmem.c  |    2 +-
 drivers/gpu/drm/i915/{ =3D> gt}/intel_region_lmem.h  |    2 -
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |    3 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   96 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |    2 +
 drivers/gpu/drm/i915/gt/intel_ring.c               |    2 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   73 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   63 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |    2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |  109 +-
 drivers/gpu/drm/i915/gt/intel_timeline.h           |   25 +-
 drivers/gpu/drm/i915/gt/intel_timeline_types.h     |    2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  648 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   15 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |    1 +
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   13 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |  203 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c       | 4741 ++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |    8 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  157 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 4771 +-------------
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   80 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |    1 +
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   19 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |    5 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   14 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  196 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |    9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   16 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |    7 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  457 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   23 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    1 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |    2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    1 +
 drivers/gpu/drm/i915/gvt/mmio_context.h            |    2 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +
 drivers/gpu/drm/i915/i915_active.c                 |    7 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   28 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   39 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    3 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   54 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    2 -
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   25 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    2 +-
 drivers/gpu/drm/i915/i915_mitigations.c            |  146 +
 drivers/gpu/drm/i915/i915_mitigations.h            |   13 +
 drivers/gpu/drm/i915/i915_pci.c                    |    2 -
 drivers/gpu/drm/i915/i915_perf.c                   |   17 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  117 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |   35 +-
 drivers/gpu/drm/i915/i915_request.c                |  139 +-
 drivers/gpu/drm/i915/i915_request.h                |   49 +-
 drivers/gpu/drm/i915/i915_scheduler.c              |   32 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |    7 +
 drivers/gpu/drm/i915/i915_scheduler_types.h        |   10 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |   25 +-
 drivers/gpu/drm/i915/i915_utils.c                  |    2 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    7 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  157 -
 drivers/gpu/drm/i915/intel_device_info.h           |    4 -
 drivers/gpu/drm/i915/intel_memory_region.c         |    2 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |    5 -
 drivers/gpu/drm/i915/selftests/i915_gem.c          |    4 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |   18 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    1 +
 drivers/gpu/drm/i915/selftests/i915_perf.c         |    2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |   17 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |    4 +
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  110 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    2 -
 include/uapi/drm/i915_drm.h                        |    3 +-
 133 files changed, 13896 insertions(+), 12352 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 create mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
 create mode 100644 drivers/gpu/drm/i915/gt/gen8_engine_cs.c
 create mode 100644 drivers/gpu/drm/i915/gt/gen8_engine_cs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_execlists_submission.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_execlists_submission.h
 rename drivers/gpu/drm/i915/{ =3D> gt}/intel_region_lmem.c (97%)
 rename drivers/gpu/drm/i915/{ =3D> gt}/intel_region_lmem.h (80%)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_execlists.c
 create mode 100644 drivers/gpu/drm/i915/i915_mitigations.c
 create mode 100644 drivers/gpu/drm/i915/i915_mitigations.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
