Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851501ADC02
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70466EB98;
	Fri, 17 Apr 2020 11:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA2A6EB94;
 Fri, 17 Apr 2020 11:16:01 +0000 (UTC)
IronPort-SDR: 7OjamDzvbm1egl6ATjPxHsx5PqFgrhPmEDoKNjJ8U8JqWoJpKMvUPHEq+CAqb/ie638Sr2zR6m
 24nD/izUi8jg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 04:16:01 -0700
IronPort-SDR: fCrUybo0Db7f36DZfxKycK1u9jaeZcU37LrlVfh5CG9t/Pf5+KH78Q9Plo4nv6SMCxoYjQHRI9
 Zl8lFTRIVXDw==
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="428196068"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.214.228.24])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 04:15:51 -0700
Date: Fri, 17 Apr 2020 14:15:48 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <20200417111548.GA15033@jlahtine-desk.ger.corp.intel.com>
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

This pull contains a backmerge of drm-next and pulls the phy-compliance
branch from Maarten.

On the uAPI front, drop some machine generated perf OA configs from
915 now that they mostly passed from userspace. Add new perf OA interfaces
to limit CPU overhead and to allow benchmarking full EU performance (instead
of always limiting to half EUs for media compatibility).

Missing workarounds for Elkhartlake, more Tigerlake PCI IDs, workarounds
and fixes.

Fix for 5k dual DP displays on Skylake, support for Apple 15" BMP 2017 (v3)
display. Type-C display hot plug made more resilent. YUV444 for SKL+.

Improvements to soft-RC6 mitigation, general power management and yielding
a GPU timeslice when on user semaphore.

An audio fixes for Gen9+ and one targeting JSL.

Then the usual refactorings, and fixes to CI found issues.

Regards, Joonas

***

drm-intel-next-2020-04-17:

UAPI Changes:

- drm/i915/perf: introduce global sseu pinning
  Allow userspace to request at perf/OA open full SSEU configuration
  on the system to be able to benchmark 3D workloads, at the cost of not
  being able to run media workloads. (Lionel)

  Userspace changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/4021

- drm/i915/perf: add new open param to configure polling of OA buffer
  Let application choose how often the OA buffer should be checked on
  the CPU side for data availability for choosig between CPU overhead
  and realtime nature of data.

  Userspace changes: https://patchwork.freedesktop.org/series/74655/

  (i915 perf recorder is a tool to capture i915 perf data for viewing
  in GPUVis.)

- drm/i915/perf: remove generated code
  Removal of the machine generated perf/OA test configurations from i915.
  Used by Mesa v17.1-18.0, and shortly replaced by userspace supplied OA
  configurations. Removal of configs causes affected Mesa versions to
  fall back to earlier kernel behaviour (potentially missing metrics).
  (Lionel)

Cross-subsystem Changes:

- Backmerge of drm-next

- Includes tag 'topic/phy-compliance-2020-04-08' from
  git://anongit.freedesktop.org/drm/drm-misc

Driver Changes:

- Fix for GitLab issue #27: Support 5k tiled dual DP display on SKL (Ville)
- Fix https://github.com/thesofproject/linux/issues/1719: Broken audio after
  S3 resume on JSL platforms. (Kai)
- Add new Tigerlake PCI IDs (Swathi D.)
- Add missing Tigerlake W/As (Matt R.)
- Extended Wa_2006604312 to EHL (Matt A)
- Add DPCD link_rate quirk for Apple 15" MBP 2017 (v3) (Mario)
- Make Wa_14010229206 apply to all Tigerlake steppings (Swathi d)
- Extend hotplug detect retry on TypeC connectors to 5 seconds (Imre)
- Yield the timeslice if caught waiting on a user semaphore (Chris)
- Limit the residual W/A batch to Haswell due to instability on IVB/BYT (Ch=
ris)
- TBT AUX should use TC power well ops on Tigerlake (Matt R)
- Update PMINTRMSK holding fw to make it effective for RPS (Francisco, Chri=
s)
- Add YUV444 packed format support for skl+ (Stanislav)
- Invalidate OA TLB when closing perf stream to avoid corruption (Umesh)
- HDCP: fix Ri prime check done during link check (Oliver)
- Rearm heartbeat on sysfs interval change (Chris)
- Fix crtc nv12 etc. plane bitmasks for DPMS off (Ville)
- Treat idling as a RPS downclock event (Chris)
- Leave rps->cur_freq on unpark (Chris)
- Ignore short pulse when EDP panel powered off (Anshuman)
- Keep the engine awake until the next jiffie, to avoid ping-pong on
  moderate load (Chris)
- Select the deepest available parking mode for rc6 on IVB (Chris)
- Optimizations to direct submission execlist path (Chris)
- Avoid NULL pointer dereference at intel_read_infoframe() (Chris)
- Fix mode private_flags comparison at atomic_check (Uma, Ville)
- Use forced codec wake on all gen9+ platforms (Kai)
- Schedule oa_config after modifying the contexts (Chris, Lionel)
- Explicitly reset both reg and context runtime on GPU reset (Chris)
- Don't enable DDI IO power on a TypeC port in TBT mode (Imre)
- Fixes to TGL, ICL and EHL vswing tables (Jose)
- Fill all the unused space in the GGTT (Chris, imre)
- Ignore readonly failures when updating relocs (Chris)
- Attempt to find free space earlier for non-pinned VMAs (Chris)
- Only wait for GPU activity before unbinding a GGTT fence (Chris)
- Avoid data loss on small userspace perf OA polling (Ashutosh)
- Watch out for unevictable nodes during eviction (Matt A)
- Reinforce the barrier after GTT updates for Ironlake (Chris)

- Convert various parts of driver to use drm_device based logging (Wambui, =
Jani)
- Avoid dereferencing already closed context for engine (Chris)
- Enable non-contiguous pipe fusing (Anshuman)
- Add HW readout of Gamma LUT on ICL (Swati S.)
- Use explicit flag to mark unreachable intel_context (Chris)
- Cancel a hung context if already closed (Chris)
- Add DP VSC/HDR SDP data structures and write routines (Gwan-gyeong)
- Report context-is-closed prior to pinning at execbuf (Chris)
- Mark timeline->cacheline as destroyed after rcu grace period (Chris)
- Avoid live-lock with i915_vma_parked() (Chris)
- Avoid gem_context->mutex for simple vma lookup (Chris)
- Rely on direct submission to the queue (Chris)
- Configure DSI transcoder to operate in TE GATE command mode (Vandita)
- Add DI vblank calculation for command mode (Vandita)
- Disable periodic command mode if programmed by GOP (Vandita)
- Use private flags to indicate TE in cmd mode (Vandita)
- Make fences a nice-to-have for FBC on GEN9+ (Jose)
- Fix work queuing issue with mixed virtual engine/physical engine
  submissions (Chris)
- Drop final few uses of drm_i915_private.engine (Chris)
- Return early after MISSING_CASE for write_dp_sdp (Chris)
- Include port sync state in the state dump (Ville)
- ELSP workaround switching back to a completed context (Chris)
- Include priority info in trace_ports (Chris)
- Allow for different modes of interruptible i915_active_wait (Chris)
- Split eb_vma into its own allocation (Chris)
- Don't read perf head/tail pointers outside critical section (Lionel)
- Pause CS flow before execlists reset (Chris)
- Make fence revocation unequivocal (Chris)
- Drop cached obj->bind_count (Chris)
- Peek at the next submission for error interrupts (Chris)
- Utilize rcu iteration of context engines (Chris)
- Keep a per-engine request pool for power management ops (Chris)
- Refactor port sync code into normal modeset flow (Ville)
- Check current i915_vma.pin_count status first on unbind (Chris)
- Free request pool from virtual engines (Chris)
- Flush all the reloc_gpu batch (Chris)
- Make exclusive awaits on i915_active optional and allow async waits (Chri=
s)
- Wait until the context is finally retired before releasing engines (Chris)

- Prefer '%ps' for printing function symbol names (Chris)
- Allow setting generic data pointer on intel GT debugfs (Andi)
- Constify DP link computation code more (Ville)
- Simplify MST master transcoder computation (Ville)
- Move TRANS_DDI_FUNC_CTL2 programming where it belongs (Ville)
- Move icl_get_trans_port_sync_config() into the DDI code (Ville)
- Add definitions for VRR registers and bits (Aditya)
- Refactor hardware fence code (Chris)
- Start passing latency as parameter to WM calculation (Stanislav)
- Kernel selftest and debug tracing improvements (Matt A, Chris, Mika)
- Fixes to CI found corner cases and lockdep splats (Chris)
- Overall fixes and refactoring to GEM code (Chris)
- Overall fixes and refactoring to display code (Ville)
- GuC/HuC code improvements (Daniele, Michal Wa)
- Static code checker fixes (Nathan, Ville, Colin, Chris)
- Fix spelling mistake (Chen)
The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2020-04-17

for you to fetch changes up to b06ef327e26367b9286a2079b31cde8d2161c0d8:

  drm/i915: Update DRIVER_DATE to 20200417 (2020-04-17 09:35:00 +0300)

----------------------------------------------------------------
UAPI Changes:

- drm/i915/perf: introduce global sseu pinning
  Allow userspace to request at perf/OA open full SSEU configuration
  on the system to be able to benchmark 3D workloads, at the cost of not
  being able to run media workloads. (Lionel)

  Userspace changes: https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/4021

- drm/i915/perf: add new open param to configure polling of OA buffer
  Let application choose how often the OA buffer should be checked on
  the CPU side for data availability for choosig between CPU overhead
  and realtime nature of data.

  Userspace changes: https://patchwork.freedesktop.org/series/74655/

  (i915 perf recorder is a tool to capture i915 perf data for viewing
  in GPUVis.)

- drm/i915/perf: remove generated code
  Removal of the machine generated perf/OA test configurations from i915.
  Used by Mesa v17.1-18.0, and shortly replaced by userspace supplied OA
  configurations. Removal of configs causes affected Mesa versions to
  fall back to earlier kernel behaviour (potentially missing metrics).
  (Lionel)

Cross-subsystem Changes:

- Backmerge of drm-next

- Includes tag 'topic/phy-compliance-2020-04-08' from
  git://anongit.freedesktop.org/drm/drm-misc

Driver Changes:

- Fix for GitLab issue #27: Support 5k tiled dual DP display on SKL (Ville)
- Fix https://github.com/thesofproject/linux/issues/1719: Broken audio after
  S3 resume on JSL platforms. (Kai)
- Add new Tigerlake PCI IDs (Swathi D.)
- Add missing Tigerlake W/As (Matt R.)
- Extended Wa_2006604312 to EHL (Matt A)
- Add DPCD link_rate quirk for Apple 15" MBP 2017 (v3) (Mario)
- Make Wa_14010229206 apply to all Tigerlake steppings (Swathi d)
- Extend hotplug detect retry on TypeC connectors to 5 seconds (Imre)
- Yield the timeslice if caught waiting on a user semaphore (Chris)
- Limit the residual W/A batch to Haswell due to instability on IVB/BYT (Ch=
ris)
- TBT AUX should use TC power well ops on Tigerlake (Matt R)
- Update PMINTRMSK holding fw to make it effective for RPS (Francisco, Chri=
s)
- Add YUV444 packed format support for skl+ (Stanislav)
- Invalidate OA TLB when closing perf stream to avoid corruption (Umesh)
- HDCP: fix Ri prime check done during link check (Oliver)
- Rearm heartbeat on sysfs interval change (Chris)
- Fix crtc nv12 etc. plane bitmasks for DPMS off (Ville)
- Treat idling as a RPS downclock event (Chris)
- Leave rps->cur_freq on unpark (Chris)
- Ignore short pulse when EDP panel powered off (Anshuman)
- Keep the engine awake until the next jiffie, to avoid ping-pong on
  moderate load (Chris)
- Select the deepest available parking mode for rc6 on IVB (Chris)
- Optimizations to direct submission execlist path (Chris)
- Avoid NULL pointer dereference at intel_read_infoframe() (Chris)
- Fix mode private_flags comparison at atomic_check (Uma, Ville)
- Use forced codec wake on all gen9+ platforms (Kai)
- Schedule oa_config after modifying the contexts (Chris, Lionel)
- Explicitly reset both reg and context runtime on GPU reset (Chris)
- Don't enable DDI IO power on a TypeC port in TBT mode (Imre)
- Fixes to TGL, ICL and EHL vswing tables (Jose)
- Fill all the unused space in the GGTT (Chris, imre)
- Ignore readonly failures when updating relocs (Chris)
- Attempt to find free space earlier for non-pinned VMAs (Chris)
- Only wait for GPU activity before unbinding a GGTT fence (Chris)
- Avoid data loss on small userspace perf OA polling (Ashutosh)
- Watch out for unevictable nodes during eviction (Matt A)
- Reinforce the barrier after GTT updates for Ironlake (Chris)

- Convert various parts of driver to use drm_device based logging (Wambui, =
Jani)
- Avoid dereferencing already closed context for engine (Chris)
- Enable non-contiguous pipe fusing (Anshuman)
- Add HW readout of Gamma LUT on ICL (Swati S.)
- Use explicit flag to mark unreachable intel_context (Chris)
- Cancel a hung context if already closed (Chris)
- Add DP VSC/HDR SDP data structures and write routines (Gwan-gyeong)
- Report context-is-closed prior to pinning at execbuf (Chris)
- Mark timeline->cacheline as destroyed after rcu grace period (Chris)
- Avoid live-lock with i915_vma_parked() (Chris)
- Avoid gem_context->mutex for simple vma lookup (Chris)
- Rely on direct submission to the queue (Chris)
- Configure DSI transcoder to operate in TE GATE command mode (Vandita)
- Add DI vblank calculation for command mode (Vandita)
- Disable periodic command mode if programmed by GOP (Vandita)
- Use private flags to indicate TE in cmd mode (Vandita)
- Make fences a nice-to-have for FBC on GEN9+ (Jose)
- Fix work queuing issue with mixed virtual engine/physical engine
  submissions (Chris)
- Drop final few uses of drm_i915_private.engine (Chris)
- Return early after MISSING_CASE for write_dp_sdp (Chris)
- Include port sync state in the state dump (Ville)
- ELSP workaround switching back to a completed context (Chris)
- Include priority info in trace_ports (Chris)
- Allow for different modes of interruptible i915_active_wait (Chris)
- Split eb_vma into its own allocation (Chris)
- Don't read perf head/tail pointers outside critical section (Lionel)
- Pause CS flow before execlists reset (Chris)
- Make fence revocation unequivocal (Chris)
- Drop cached obj->bind_count (Chris)
- Peek at the next submission for error interrupts (Chris)
- Utilize rcu iteration of context engines (Chris)
- Keep a per-engine request pool for power management ops (Chris)
- Refactor port sync code into normal modeset flow (Ville)
- Check current i915_vma.pin_count status first on unbind (Chris)
- Free request pool from virtual engines (Chris)
- Flush all the reloc_gpu batch (Chris)
- Make exclusive awaits on i915_active optional and allow async waits (Chri=
s)
- Wait until the context is finally retired before releasing engines (Chris)

- Prefer '%ps' for printing function symbol names (Chris)
- Allow setting generic data pointer on intel GT debugfs (Andi)
- Constify DP link computation code more (Ville)
- Simplify MST master transcoder computation (Ville)
- Move TRANS_DDI_FUNC_CTL2 programming where it belongs (Ville)
- Move icl_get_trans_port_sync_config() into the DDI code (Ville)
- Add definitions for VRR registers and bits (Aditya)
- Refactor hardware fence code (Chris)
- Start passing latency as parameter to WM calculation (Stanislav)
- Kernel selftest and debug tracing improvements (Matt A, Chris, Mika)
- Fixes to CI found corner cases and lockdep splats (Chris)
- Overall fixes and refactoring to GEM code (Chris)
- Overall fixes and refactoring to display code (Ville)
- GuC/HuC code improvements (Daniele, Michal Wa)
- Static code checker fixes (Nathan, Ville, Colin, Chris)
- Fix spelling mistake (Chen)

----------------------------------------------------------------
Aditya Swarup (1):
      drm/i915/tgl: Add definitions for VRR registers and bits

Andi Shyti (1):
      drm/i915/gt: allow setting generic data pointer

Animesh Manna (7):
      drm/amd/display: Align macro name as per DP spec
      drm/dp: get/set phy compliance pattern
      drm/i915/dp: Made intel_dp_adjust_train() non-static
      drm/i915/dp: Preparation for DP phy compliance auto test
      drm/i915/dp: Add debugfs entry for DP phy compliance
      drm/i915/dp: Register definition for DP compliance register
      drm/i915/dp: Program vswing, pre-emphasis, test-pattern

Anshuman Gupta (2):
      drm/i915: Enable non-contiguous pipe fusing
      drm/i915/edp: Ignore short pulse when panel powered off

Ashutosh Dixit (1):
      drm/i915/perf: Do not clear pollin for small user read buffers

Chen Zhou (1):
      drm/i915/gt: fix spelling mistake "undeflow" -> "underflow"

Chris Wilson (80):
      drm/i915/gt: Restrict gen7 w/a batch to Haswell
      drm/i915: Move GGTT fence registers under gt/
      drm/i915/gt: Pull restoration of GGTT fences underneath the GT
      drm/i915: Remove manual save/resume of fence register state
      drm/i915/gt: Allocate i915_fence_reg array
      drm/i915/gt: Restore check for invalid vma for fencing
      drm/i915/gem: Check for a closed context when looking up an engine
      drm/i915: Fix up documentation paths after file moving
      drm/i915/gt: Always reschedule the new heartbeat
      drm/i915: Prefer '%ps' for printing function symbol names
      drm/i915: Use explicit flag to mark unreachable intel_context
      drm/i915/gt: Cancel a hung context if already closed
      drm/i915/gt: Report context-is-closed prior to pinning
      drm/i915/gt: Use the correct err_unlock unwind path for a closed cont=
ext
      drm/i915/gt: Treat idling as a RPS downclock event
      drm/i915/gt: Leave rps->cur_freq on unpark
      drm/i915/gt: Mark timeline->cacheline as destroyed after rcu grace pe=
riod
      drm/i915: Avoid live-lock with i915_vma_parked()
      drm/i915/gem: Avoid gem_context->mutex for simple vma lookup
      drm/i915: Rely on direct submission to the queue
      drm/i915: Extend intel_wakeref to support delayed puts
      drm/i915/gt: Delay release of engine-pm after last retirement
      drm/i915/gt: Only delay the context barrier pm
      drm/i915/gt: Select the deepest available parking mode for rc6
      drm/i915/execlists: Drop setting sibling priority hint on virtual eng=
ines
      drm/i915/selftests: Measure the energy consumed while in RC6
      drm/i915/execlists: Pull tasklet interrupt-bh local to direct submiss=
ion
      drm/i915: Immediately execute the fenced work
      drm/i915/gt: Stage the transfer of the virtual breadcrumb
      drm/i915: Drop final few uses of drm_i915_private.engine
      drm/i915/display: Remove useless but deadly local
      drm/i915/display: Return early after MISSING_CASE for write_dp_sdp
      drm/i915: Differentiate between aliasing-ppgtt and ggtt pinning
      drm/i915/execlists: Workaround switching back to a completed context
      drm/i915/execlists: Include priority info in trace_ports
      drm/i915/selftests: Check timeout before flush and cond checks
      drm/i915: Allow for different modes of interruptible i915_active_wait
      drm/i915: Wrap i915_active in a simple kreffed struct
      drm/i915/perf: Schedule oa_config after modifying the contexts
      drm/i915/gem: Split eb_vma into its own allocation
      drm/i915/execlists: Explicitly reset both reg and context runtime
      drm/i915/execlists: Double check breadcrumb before crying foul
      drm/i915: Defer kicking the tasklet until all rescheduling is complete
      drm/i915/gt: Include a few tracek for timeslicing
      drm/i915/selftests: Tidy up an error message for live_error_interrupt
      drm/i915/execlists: Pause CS flow before reset
      drm/i915/gt: Include the execlists CCID of each port in the engine du=
mp
      drm/i915/gt: Fill all the unused space in the GGTT
      drm/i915/gem: Ignore readonly failures when updating relocs
      drm/i915/gt: Align engine dump active/pending
      drm/i915/gem: Try allocating va from free space
      drm/i915/gt: Only wait for GPU activity before unbinding a GGTT fence
      drm/i915/gt: Store the fence details on the fence
      drm/i915/gt: Make fence revocation unequivocal
      drm/i915/gem: Drop cached obj->bind_count
      drm/i915/uc: Cleanup kerneldoc warnings
      drm/i915/execlists: Peek at the next submission for error interrupts
      drm/i915/gem: Utilize rcu iteration of context engines
      drm/i915/selftests: Check for has-reset before testing hostile contex=
ts
      drm/i915: Keep a per-engine request pool
      drm/i915: Avoid setting timer->expires to 0
      drm/i915: Revoke mmap before fence
      drm/i915: Check current i915_vma.pin_count status first on unbind
      drm/i915/selftests: Wait until we start timeslicing after a submit
      drm/i915/gt: Free request pool from virtual engines
      drm/i915/gem: Flush all the reloc_gpu batch
      drm/i915/gem: Take DBG_FORCE_RELOC into account prior to using reloc_=
gpu
      drm/i915: Make exclusive awaits on i915_active optional
      drm/i915: Allow asynchronous waits on the i915_active barriers
      drm/i915/gem: Wait until the context is finally retired before releas=
ing engines
      drm/i915/gem: Promote 'remain' to unsigned long
      drm/i915/gt: Yield the timeslice if caught waiting on a user semaphore
      drm/i915/selftests: Drop vestigal timeslicing assert
      drm/i915/gt: Mark up racy read of intel_ring.head
      drm/i915/gt: Mark up racy check of breadcrumb irq enabled
      drm/i915/selftests: Take an explicit ref for rq->batch
      drm/i915/selftests: Check for an already completed timeslice
      agp/intel: Reinforce the barrier after GTT updates
      drm/i915/selftests: Exercise basic RPS interrupt generation
      drm/i915/gt: Update PMINTRMSK holding fw

Colin Ian King (1):
      drm/i915: remove redundant assignment to variable err

Daniele Ceraolo Spurio (5):
      drm/i915/guc: drop stage_pool debugfs
      drm/i915/huc: make "support huc" reflect HW capabilities
      drm/i915/debugfs: move uC printers and update debugfs file names
      drm/i915/uc: Move uC debugfs to its own folder under GT
      drm/i915/uc: do not free err log on uc_fini

Gwan-gyeong Mun (4):
      drm: Add DP1.4 VSC SDP Payload related Data Structures
      drm/i915/dp: Add compute routine for DP VSC SDP
      drm/i915/dp: Add compute routine for DP HDR Metadata Infoframe SDP
      drm/i915/dp: Add writing of DP SDPs

Imre Deak (3):
      drm/i915/icl+: Don't enable DDI IO power on a TypeC port in TBT mode
      drm/i915: Add a retry counter for hotplug detect retries
      drm/i915: Extend hotplug detect retry on TypeC connectors to 5 seconds

Jani Nikula (30):
      drm/i915/ddi: use struct drm_device based logging
      drm/i915/display_power: use struct drm_device based logging
      drm/i915/dp_aux_backlight: use struct drm_device based logging
      drm/i915/dp_mst: use struct drm_device based logging
      drm/i915/dsi: use struct drm_device based logging
      drm/i915/hdmi: use struct drm_device based logging
      drm/i915/dsi: use struct drm_device based logging
      drm/i915/connector: use MISSING_CASE instead of logging
      drm/i915/tv: use struct drm_device based logging
      drm/i915/display: clean up intel_PLL_is_valid()
      drm/i915/display: use struct drm_device based logging
      drm/i915/psr: use struct drm_device based logging
      drm/i915/wopcm: convert to drm device based logging
      drm/i915/audio: use struct drm_device based logging
      drm/i915/panel: use struct drm_device based logging
      drm/i915/tc: use struct drm_device based logging
      drm/i915/dp: use struct drm_device based logging
      drm/i915/crt: use struct drm_device based logging
      drm/i915/debugfs: use struct drm_device based logging
      drm/i915/bw: use struct drm_device based logging
      drm/i915/state: use struct drm_device based logging
      drm/i915/switcheroo: use struct drm_device based logging
      drm/i915/uc: prefer struct drm_device based logging
      drm/i915/error: prefer struct drm_device based logging
      drm/i915/pmu: prefer struct drm_device based logging
      drm/i915/dram: prefer struct drm_device based logging
      drm/i915/uncore: prefer struct drm_device based logging
      drm/i915/stolen: prefer struct drm_device based logging
      drm/i915/gt: prefer struct drm_device based logging
      drm/i915/uc: prefer struct drm_device based logging

Joonas Lahtinen (3):
      Merge drm/drm-next into drm-intel-next-queued
      Merge tag 'topic/phy-compliance-2020-04-08' of git://anongit.freedesk=
top.org/drm/drm-misc into drm-intel-next-queued
      drm/i915: Update DRIVER_DATE to 20200417

Jos=E9 Roberto de Souza (4):
      drm/i915/display/fbc: Make fences a nice-to-have for GEN9+
      drm/i915/dp: Return the right vswing tables
      drm/i915/dp/ehl: Update vswing table for HBR and RBR
      drm/i915/tc/icl: Update TC vswing tables

Kai Vehmanen (2):
      drm/i915: use forced codec wake on all gen9+ platforms
      drm/i915: do AUD_FREQ_CNTRL state save on all gen9+ platforms

Lionel Landwerlin (7):
      drm/i915/perf: remove generated code
      drm/i915/perf: remove redundant power configuration register override
      drm/i915/perf: introduce global sseu pinning
      drm/i915/perf: rework aging tail workaround
      drm/i915/perf: move pollin setup to non hw specific code
      drm/i915/perf: add new open param to configure polling of OA buffer
      drm/i915/perf: don't read head/tail pointers outside critical section

Mario Kleiner (1):
      drm/i915/dp: Add dpcd link_rate quirk for Apple 15" MBP 2017 (v3)

Matt Atwood (1):
      drm/i915/ehl: extended Wa_2006604312 to ehl

Matt Roper (4):
      drm/i915/tgl: Add Wa_14010477008:tgl
      drm/i915/tgl: Extend Wa_1409767108:tgl to B0 stepping
      drm/i915/tgl: Initialize multicast register steering for workarounds
      drm/i915/tgl: TBT AUX should use TC power well ops

Matthew Auld (3):
      drm/i915/selftests/perf: watch out for stolen objects
      drm/i915/selftests: mark huge_gem_object as not shrinkable
      drm/i915/evict: watch out for unevictable nodes

Michal Wajdeczko (2):
      drm/i915/huc: Add more errors for I915_PARAM_HUC_STATUS
      drm/i915/huc: Fix HuC register used in debugfs

Mika Kuoppala (1):
      drm/i915: Report all failed registers for ctx isolation

Nathan Chancellor (1):
      drm/i915: Cast remain to unsigned long in eb_relocate_vma

Oliver Barta (1):
      drm/i915: HDCP: fix Ri prime check done during link check

Stanislav Lisovskiy (2):
      drm/i915: Start passing latency as parameter
      drm/i915: Add YUV444 packed format support for skl+

Swathi Dhanavanthri (2):
      drm/i915/tgl: Add new PCI IDs to TGL
      drm/i915/tgl: Make Wa_14010229206 permanent

Swati Sharma (1):
      drm/i915/color: Extract icl_read_luts()

Uma Shankar (1):
      drm/i915/display: Fix mode private_flags comparison at atomic_check

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Invalidate OA TLB on when closing perf stream

Vandita Kulkarni (5):
      drm/i915/dsi: Configure transcoder operation for command mode.
      drm/i915/dsi: Add vblank calculation for command mode
      drm/i915/dsi: Add cmd mode flags in display mode private flags
      drm/i915/dsi: Add check for periodic command mode
      drm/i915/dsi: Use private flags to indicate TE in cmd mode

Ville Syrj=E4l=E4 (16):
      drm/i915: Fix crtc nv12 etc. plane bitmasks for DPMS off
      drm/i915: Get rid of silly void* from MST code
      drm: Constify adjusted_mode a bit
      drm/i915/mst: Use .compute_config_late() to compute master transcoder
      drm/i915: Move TRANS_DDI_FUNC_CTL2 programming where it belongs
      drm/i915: Drop usless master_transcoder assignments
      drm/i915: Move icl_get_trans_port_sync_config() into the DDI code
      drm/i915: Use REG_FIELD_PREP() & co. for TRANS_DDI_FUNC_CTL2
      drm/i915: Include port sync state in the state dump
      drm/i915: Store cpu_transcoder_mask in device info
      drm/i915: Implement port sync for SKL+
      drm/i915: Eliminate port sync copy pasta
      drm/i915: Fix port sync code to work with >2 pipes
      drm/i915: Do pipe updates after enables for everyone
      drm/i915: Pass atomic state to encoder hooks
      drm/i915: Move the port sync DP_TP_CTL stuff to the encoder hook

Wambui Karuga (10):
      drm/i915/fbc: convert to drm_device based logging macros.
      drm/i915/fbdev: convert to drm_device based logging.
      drm/i915/hdcp: convert to struct drm_device based logging.
      drm/i915/ggtt: convert to drm_device based logging macros.
      drm/i915/lrc: convert to struct drm_device based logging macros.
      drm/i915/rc6: convert to struct drm_device based logging macros.
      drm/i915/renderstate: use struct drm_device based logging macros.
      drm/i915/ring_submission: use drm_device based logging macros.
      drm/i915/rps: use struct drm_device based logging macros.
      drm/i915/workarounds: convert to drm_device based logging macros.

 Documentation/gpu/i915.rst                         |   6 +-
 drivers/char/agp/intel-gtt.c                       |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  96 +++
 drivers/gpu/drm/i915/Makefile                      |  23 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             | 167 +++-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  21 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   2 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  18 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   9 +-
 drivers/gpu/drm/i915/display/intel_color.c         | 121 ++-
 drivers/gpu/drm/i915/display/intel_connector.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  36 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 522 ++++++++----
 drivers/gpu/drm/i915/display/intel_ddi.h           |   3 +-
 drivers/gpu/drm/i915/display/intel_display.c       | 470 +++--------
 drivers/gpu/drm/i915/display/intel_display.h       |   8 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  36 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  39 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 932 +++++++++++++++++=
----
 drivers/gpu/drm/i915/display/intel_dp.h            |   4 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  84 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   9 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   4 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 153 ++--
 drivers/gpu/drm/i915/display/intel_dsi.c           |   9 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   9 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  84 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  96 ++-
 drivers/gpu/drm/i915/display/intel_global_state.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 256 ++++--
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  16 +-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  22 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  22 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |   3 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  47 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  22 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  25 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  47 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |  15 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  85 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 365 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 -
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |   3 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   4 -
 .../gpu/drm/i915/gem/selftests/i915_gem_object.c   |   2 +-
 drivers/gpu/drm/i915/gt/debugfs_engines.c          |   2 +-
 drivers/gpu/drm/i915/gt/debugfs_gt.c               |  15 +-
 drivers/gpu/drm/i915/gt/debugfs_gt.h               |   9 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |  10 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   6 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   5 +
 drivers/gpu/drm/i915/gt/intel_engine.h             |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 127 +--
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |   6 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  12 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  52 +-
 .../intel_ggtt_fencing.c}                          | 170 ++--
 .../intel_ggtt_fencing.h}                          |  17 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 252 ++++--
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  39 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  16 +-
 drivers/gpu/drm/i915/gt/intel_ring.h               |   5 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  33 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                | 105 +--
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  33 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |  12 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  21 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   2 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 117 ++-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |  45 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             | 223 +++++
 drivers/gpu/drm/i915/gt/selftest_rps.h             |  11 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  46 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |  42 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.h     |  14 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  14 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.h          |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  97 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c | 124 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.h |  15 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  53 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c     |  36 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.h     |  14 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |  17 -
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h          |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  35 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |  30 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.h      |  14 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  56 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   3 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |   2 +-
 drivers/gpu/drm/i915/i915_active.c                 | 137 ++-
 drivers/gpu/drm/i915/i915_active.h                 |  14 +-
 drivers/gpu/drm/i915/i915_debugfs.c                | 298 +------
 drivers/gpu/drm/i915/i915_drv.c                    |   4 -
 drivers/gpu/drm/i915/i915_drv.h                    |  13 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  20 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |   7 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
 drivers/gpu/drm/i915/i915_irq.c                    |   8 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  23 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 628 +++++++-------
 drivers/gpu/drm/i915/i915_perf_types.h             |  46 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   4 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 130 ++-
 drivers/gpu/drm/i915/i915_request.c                |  29 +-
 drivers/gpu/drm/i915/i915_request.h                |   2 +
 drivers/gpu/drm/i915/i915_scheduler.c              |  10 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |   2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |   5 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h          |  23 +
 drivers/gpu/drm/i915/i915_switcheroo.c             |   4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   3 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  93 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   4 +-
 drivers/gpu/drm/i915/intel_device_info.c           |  41 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_dram.c                  |   3 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  12 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  24 +-
 drivers/gpu/drm/i915/intel_uncore.h                |   6 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  12 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |  22 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |  22 +-
 drivers/gpu/drm/i915/oa/i915_oa_bdw.c              |  90 --
 drivers/gpu/drm/i915/oa/i915_oa_bdw.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_bxt.c              |  88 --
 drivers/gpu/drm/i915/oa/i915_oa_bxt.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_cflgt2.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_cflgt2.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_cflgt3.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_cflgt3.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_chv.c              |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_chv.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_cnl.c              | 101 ---
 drivers/gpu/drm/i915/oa/i915_oa_cnl.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_glk.c              |  88 --
 drivers/gpu/drm/i915/oa/i915_oa_glk.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_hsw.c              | 118 ---
 drivers/gpu/drm/i915/oa/i915_oa_hsw.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_icl.c              |  98 ---
 drivers/gpu/drm/i915/oa/i915_oa_icl.h              |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_kblgt2.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_kblgt2.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_kblgt3.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_kblgt3.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_sklgt2.c           |  88 --
 drivers/gpu/drm/i915/oa/i915_oa_sklgt2.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_sklgt3.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_sklgt3.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_sklgt4.c           |  89 --
 drivers/gpu/drm/i915/oa/i915_oa_sklgt4.h           |  16 -
 drivers/gpu/drm/i915/oa/i915_oa_tgl.c              | 121 ---
 drivers/gpu/drm/i915/oa/i915_oa_tgl.h              |  16 -
 drivers/gpu/drm/i915/selftests/i915_active.c       |  12 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   2 -
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |  26 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   1 -
 drivers/gpu/drm/i915/selftests/i915_perf.c         |  98 ++-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  16 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   5 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   6 +-
 include/drm/drm_dp_helper.h                        | 170 +++-
 include/drm/i915_pciids.h                          |   8 +-
 include/uapi/drm/i915_drm.h                        |  24 +
 192 files changed, 5326 insertions(+), 4357 deletions(-)
 rename drivers/gpu/drm/i915/{i915_gem_fence_reg.c =3D> gt/intel_ggtt_fenci=
ng.c} (88%)
 rename drivers/gpu/drm/i915/{i915_gem_fence_reg.h =3D> gt/intel_ggtt_fenci=
ng.h} (86%)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_rps.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_rps.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_bdw.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_bdw.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_bxt.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_bxt.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cflgt2.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cflgt2.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cflgt3.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cflgt3.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_chv.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_chv.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cnl.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_cnl.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_glk.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_glk.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_hsw.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_hsw.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_icl.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_icl.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_kblgt2.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_kblgt2.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_kblgt3.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_kblgt3.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt2.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt2.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt3.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt3.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt4.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_sklgt4.h
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_tgl.c
 delete mode 100644 drivers/gpu/drm/i915/oa/i915_oa_tgl.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
