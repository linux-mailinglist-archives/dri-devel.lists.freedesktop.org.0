Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA815185333
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 01:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19A66EC7E;
	Sat, 14 Mar 2020 00:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5086E083;
 Sat, 14 Mar 2020 00:15:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 17:15:03 -0700
X-IronPort-AV: E=Sophos;i="5.70,550,1574150400"; d="scan'208";a="322942159"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 17:15:03 -0700
Date: Fri, 13 Mar 2020 17:15:35 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next for 5.7-rc1
Message-ID: <20200314001535.GA2969344@intel.com>
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

Hi Dave and Daniel,

Here goes drm-intel-next-2020-03-13:

UAPI Changes:

On i915 we have a new UAPI to allow userspace to specify CS ring buffer siz=
e on
construction (I915_CONTEXT_PARAM_RINGSIZE) and also new sysfs entries expos=
ing
various engine properties

GVT Changes:

On GVT we have VFIO edid getting expanded to all platforms and a big cleanu=
p around attr
group, unused vblank complete, kvmgt, Intel engine and dev_priv usages.

i915 Changes:

It's also important to highlight a big chunk of work to stabilize Tiger Lak=
e,
which is now out of require_force_probe protection so it gets probed by
default.

As usual, I tried to organize the 215 patches in some buckets of changes:

- new UAPI to allow userspace to specify CS ring buffer size on construction
  (I915_CONTEXT_PARAM_RINGSIZE) -  (Chris)
- New sysfs entries exposing various engine properties (Chris)
- Tiger Lake is out of require_force_probe protection (Jose)
- Changes in many places around active requests, reset and heartbeat (Chris)
- Stop assigning drm-dev_private pointer (Jani)
- Many code refactor in many places, including intel_modeset_init,
  increasing use of intel_uncore_*, vgpu, and gvt stuff (Jani)
- Fixes around display pipe iterators (Anshuman)
- Tigerlake enabling work (Matt Ropper, Matt Atwood, Ville, Lucas, Daniele,
  Jose, Anusha, Vivek, Swathi, Caz. Kai)
- Code clean-up like reducing use of drm/i915_drv.h, removing unused
  registers, removing garbage warns, and some other code polishing (Jani, L=
ucas,
  Ville)
- Selftests fixes, improvements and additions (Chris, Dan, Aditya, Matt Aul=
d)
- Fix plane possible_crtcs bit mask (Anshuman)
- Fixes and cleanup on GLK pre production identification and w/a (Ville)
- Fix display orientation on few cases (Hans, Ville)
- dbuf clean-up and improvements for slice arrays handling (Ville)
- Improvement around min cdclk calculation (Stanislav)
- Fixes and refactor around display PLLs (Imre)
- Other execlists and perf fixes (Chris)
- Documentation fixes (Jani, Chris)
- Fix build issue (Anshuman)
- Many more fixes around the locking mechanisms (Chris)
- Other fixes and debugability info around preemption (Chris, Tvrtko)
- Add mechanism to submit a context WA on ring submission (Mika)
- Clear all Eu/L3 resitual context (Prathap)
- More changes around local memory (Abdiel, Matt, Chris)
- Fix RPS (Chris)
- DP MST fix (Lyude)
- Display FBC fixes (Jose, RK)
- debugfs cleanup (Tvrtko)
- More convertion towards drm_debive based loggin (Wambui, Ram)
- Avoid potential buffer overflow (Takashi)
- Ice Lake and Elkhart Lake workarounds (Matt Roper)

Thanks,
Rodrigo.

The following changes since commit 53e3ca6749186b5c147964bddc4eb47ba8b5f69e:

  drm/i915: Update DRIVER_DATE to 20200225 (2020-02-25 10:41:22 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2020-03-13

for you to fetch changes up to 217a485c8399634abacd2f138b3524d2e78e8aad:

  drm/i915: Update DRIVER_DATE to 20200313 (2020-03-13 17:09:52 -0700)

----------------------------------------------------------------
UAPI Changes:

On i915 we have a new UAPI to allow userspace to specify CS ring buffer siz=
e on
construction (I915_CONTEXT_PARAM_RINGSIZE) and also new sysfs entries expos=
ing
various engine properties

GVT Changes:

VFIO edid getting expanded to all platforms and a big cleanup around attr
group, unused vblank complete, kvmgt, Intel engine and dev_priv usages.

i915 Changes:

- new UAPI to allow userspace to specify CS ring buffer size on construction
  (I915_CONTEXT_PARAM_RINGSIZE) -  (Chris)
- New sysfs entries exposing various engine properties (Chris)
- Tiger Lake is out of require_force_probe protection (Jose)
- Changes in many places around active requests, reset and heartbeat (Chris)
- Stop assigning drm-dev_private pointer (Jani)
- Many code refactor in many places, including intel_modeset_init,
  increasing use of intel_uncore_*, vgpu, and gvt stuff (Jani)
- Fixes around display pipe iterators (Anshuman)
- Tigerlake enabling work (Matt Ropper, Matt Atwood, Ville, Lucas, Daniele,
  Jose, Anusha, Vivek, Swathi, Caz. Kai)
- Code clean-up like reducing use of drm/i915_drv.h, removing unused
  registers, removing garbage warns, and some other code polishing (Jani, L=
ucas,
  Ville)
- Selftests fixes, improvements and additions (Chris, Dan, Aditya, Matt Aul=
d)
- Fix plane possible_crtcs bit mask (Anshuman)
- Fixes and cleanup on GLK pre production identification and w/a (Ville)
- Fix display orientation on few cases (Hans, Ville)
- dbuf clean-up and improvements for slice arrays handling (Ville)
- Improvement around min cdclk calculation (Stanislav)
- Fixes and refactor around display PLLs (Imre)
- Other execlists and perf fixes (Chris)
- Documentation fixes (Jani, Chris)
- Fix build issue (Anshuman)
- Many more fixes around the locking mechanisms (Chris)
- Other fixes and debugability info around preemption (Chris, Tvrtko)
- Add mechanism to submit a context WA on ring submission (Mika)
- Clear all Eu/L3 resitual context (Prathap)
- More changes around local memory (Abdiel, Matt, Chris)
- Fix RPS (Chris)
- DP MST fix (Lyude)
- Display FBC fixes (Jose, RK)
- debugfs cleanup (Tvrtko)
- More convertion towards drm_debive based loggin (Wambui, Ram)
- Avoid potential buffer overflow (Takashi)
- Ice Lake and Elkhart Lake workarounds (Matt Roper)

----------------------------------------------------------------
Abdiel Janulgue (1):
      drm/i915/phys: unconditionally call release_memory_region

Aditya Swarup (1):
      drm/i915/selftests: Fix uninitialized variable

Anshuman Gupta (10):
      drm/i915: Iterate over pipes and skip the disabled one
      drm/i915: Remove (pipe =3D=3D crtc->index) assumption
      drm/i915: Fix broken transcoder err state
      drm/i915: Get first crtc instead of PIPE_A crtc
      drm/i915: Add WARN_ON in intel_get_crtc_for_pipe()
      drm/i915: Fix broken num_entries in skl_ddb_allocation_overlaps
      drm/i915: Fix wrongly populated plane possible_crtcs bit mask
      drm/i915: Fix kbuild test robot build error
      drm/i915/hdcp: Mandate (seq_num_V=3D=3D0) at first RecvId msg
      drm/i915/hdcp: Fix config_stream_type() ret value

Anusha Srivatsa (1):
      drm/i915/tgl: Extend Wa_1606931601 for all steppings

Caz Yokoyama (1):
      Revert "drm/i915/tgl: Add extra hdc flush workaround"

Chris Wilson (76):
      drm/i915: Flush idle barriers when waiting
      drm/i915: Allow userspace to specify ringsize on construction
      drm/i915/gem: Honour O_NONBLOCK before throttling execbuf submissions
      drm/i915: Skip barriers inside waits
      drm/i915/selftests: Disable heartbeat around manual pulse tests
      drm/i915/gt: Check engine-is-awake on reset later
      drm/i915/gt: Pull marking vm as closed underneath the vm->mutex
      drm/i915/selftests: Verify LRC isolation
      drm/i915/selftests: Check recovery from corrupted LRC
      drm/i915: Protect i915_request_await_start from early waits
      drm/i915/perf: Mark up the racy use of perf->exclusive_stream
      drm/i915/perf: Manually acquire engine-wakeref around use of kernel_c=
ontext
      drm/i915/selftests: Wait for the context switch
      drm/i915/selftests: Be a little more lenient for reset workers
      drm/i915/gt: Reset queue_priority_hint after wedging
      drm/i915/gt: Expose engine properties via sysfs
      drm/i915/gt: Expose engine->mmio_base via sysfs
      drm/i915/gt: Expose timeslice duration to sysfs
      drm/i915/gt: Expose busywait duration to sysfs
      drm/i915/gt: Expose reset stop timeout via sysfs
      drm/i915/gt: Expose preempt reset timeout via sysfs
      drm/i915/gt: Expose heartbeat interval via sysfs
      drm/i915/perf: Reintroduce wait on OA configuration completion
      drm/i915/execlists: Check the sentinel is alone in the ELSP
      drm/i915: Fix doclinks
      drm/i915/gem: Consolidate ctx->engines[] release
      drm/i915/gt: Prevent allocation on a banned context
      drm/i915/gem: Check that the context wasn't closed during setup
      drm/i915: Drop vma is-closed assertion on insert
      drm/i915/gt: Drop the timeline->mutex as we wait for retirement
      drm/i915: Drop inspection of execbuf flags during evict
      drm/i915/gem: Extract transient execbuf flags from i915_vma
      drm/i915/gem: Only call eb_lookup_vma once during execbuf ioctl
      drm/i915/gvt: Inlcude intel_gvt.h where needed
      drm/i915: Apply i915_request_skip() on submission
      drm/i915/gt: Propagate change in error status to children on unhold
      drm/i915/gt: Cancel banned contexts after GT reset
      drm/i915: Actually emit the await_start
      drm/i915: Return early for await_start on same timeline
      drm/i915/execlists: Show the "switch priority hint" in dumps
      drm/i915/gvt: cleanup debugfs scan_nonprivbb
      drm/i915/gvt: Wean gvt off dev_priv->engine[]
      drm/i915/gvt: Wean gvt off using dev_priv
      drm/i915: Assert requests within a context are submitted in order
      drm/i915: Always propagate the invocation to i915_schedule
      drm/i915/gem: Limit struct_mutex to eb_reserve
      drm/i915: Do not poison i915_request.link on removal
      drm/i915/selftests: Apply a heavy handed flush to i915_active
      drm/i915/execlists: Enable timeslice on partial virtual engine dequeue
      drm/i915/gt: Close race between cacheline_retire and free
      drm/i915/gt: Wait for the wa batch to be pinned
      drm/i915/gt: Mark up intel_rps.active for racy reads
      drm/i915: Mark racy read of intel_engine_cs.saturated
      drm/i915/execlists: Mark up the racy access to switch_priority_hint
      drm/i915: Mark up unlocked update of i915_request.hwsp_seqno
      drm/i915/gt: Mark up racy check of last list element
      drm/i915/execlists: Mark up read of i915_request.fence.flags
      drm/i915/execlsts: Mark up racy inspection of current i915_request pr=
iority
      drm/i915/gt: Mark up intel_rps.active for racy reads
      drm/i915/gt: Defend against concurrent updates to execlists->active
      drm/i915: Improve the start alignment of bonded pairs
      drm/i915: Defer semaphore priority bumping to a workqueue
      drm/i915: Tweak scheduler's kick_submission()
      drm/i915/gt: Mark up racy reads for intel_context.inflight
      drm/i915: Mark up racy read of active rq->engine
      drm/i915/execlists: Mark up data-races in virtual engines
      drm/i915: Extend i915_request_await_active to use all timelines
      drm/i915/gt: Pull checking rps->pm_events under the irq_lock
      drm/i915/execlists: Track active elements during dequeue
      drm/i915/gem: Mark up the racy read of the mmap_singleton
      drm/i915/gem: Mark up sw-fence notify function
      drm/i915/gem: Take a copy of the engines for context_barrier_task
      drm/i915/gem: Drop relocation slowpath
      drm/i915/selftests: Use igt_random_offset()
      drm/i915/gt: Wait for RCUs frees before asserting idle on unload
      drm/i915/selftest: Add more poison patterns

Dan Carpenter (1):
      drm/i915/selftests: Fix return in assert_mmap_offset()

Daniele Ceraolo Spurio (2):
      drm/i915/ggtt: do not set bits 1-11 in gen12 ptes
      drm/i915/huc: update TGL HuC to v7.0.12

Hans de Goede (4):
      drm/i915/dsi: Remove readback of panel orientation on BYT / CHT
      drm/i915/dp: Use BDB_GENERAL_FEATURES VBT block info for builtin pane=
l-orientation
      drm/i915: panel: Use intel_panel_compute_brightness() from pwm_setup_=
backlight()
      drm/i915: Add invert-brightness quirk for Thundersoft TST178 tablet

Imre Deak (14):
      drm/i915: Fix bounds check in intel_get_shared_dpll_id()
      drm/i915: Move DPLL HW readout/sanitize fns to intel_dpll_mgr.c
      drm/i915: Keep the global DPLL state in a DPLL specific struct
      drm/i915: Move the DPLL vfunc inits after the func defines
      drm/i915/hsw: Use the DPLL ID when calculating DPLL clock
      drm/i915: Move DPLL frequency calculation to intel_dpll_mgr.c
      drm/i915/skl: Parametrize the DPLL ref clock instead of open-coding it
      drm/i915/hsw: Rename the get HDMI/DP DPLL funcs to get WRPLL/LCPLL
      drm/i915/hsw: Split out the SPLL parameter calculation
      drm/i915/hsw: Split out the WRPLL, LCPLL, SPLL frequency calculation
      drm/i915/skl, cnl: Split out the WRPLL/LCPLL frequency calculation
      drm/i915/hsw: Use the read-out WRPLL/SPLL state instead of reading ou=
t again
      drm/i915: Unify the DPLL ref clock frequency tracking
      drm/i915: Fix documentation for intel_dpll_get_freq()

Jani Nikula (15):
      drm/i915: stop assigning drm->dev_private pointer
      drm/i915: split intel_modeset_init() to pre/post irq install
      drm/i915: significantly reduce the use of <drm/i915_drm.h>
      drm/i915: split out intel_dram.[ch] from i915_drv.c
      drm/i915/dram: use intel_uncore_*() functions for register access
      drm/i915/drv: use intel_uncore_write() for register access
      drm/i915/crc: move pipe_crc from drm_i915_private to intel_crtc
      drm/i915/dram: hide the dram structs better
      drm/i915: add i915_ioc32.h for compat
      drm/i915: remove unused orig_clock i915 member
      drm/i915: fix documentation build after rename
      drm/i915: move watermark structs more towards usage
      drm/i915/vgpu: improve vgpu abstractions
      drm/i915/gvt: make intel_gvt_active internal to intel_gvt
      drm/i915/gvt: only include intel_gvt.h where needed

Jos=E9 Roberto de Souza (12):
      drm/i915/tgl: Implement Wa_1409804808
      drm/i915/tgl: Implement Wa_1806527549
      drm/i915/tgl: Add note to Wa_1607297627
      drm/i915/tgl: Add note about Wa_1607063988
      drm/i915/tgl: Fix the Wa number of a fix
      drm/i915/tgl: Add note about Wa_1409142259
      drm/i915/tgl: Add Wa number to WaAllowPMDepthAndInvocationCountAccess=
FromUMD
      drm/i915/dmc: Use firmware v2.06 for TGL
      drm/i915/gen11: Moving WAs to rcs_engine_wa_init()
      drm/i915/tgl: Move and restrict Wa_1408615072
      drm/i915/display: Deactive FBC in fastsets when disabled by parameter
      drm/i915/tgl: Remove require_force_probe protection

Julian Stecklina (2):
      drm/i915/gvt: remove unused vblank_done completion
      drm/i915/gvt: make gvt oblivious of kvmgt data structures

Kai Vehmanen (1):
      drm/i915: Add missing HDMI audio pixel clocks for gen12

Lucas De Marchi (2):
      drm/i915: remove ICP_PP_CONTROL
      drm/i915/tgl: Add Wa_1608008084

Lyude Paul (4):
      drm/dp: Introduce EDID-based quirks
      drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen 4K AMOLED p=
anel
      drm/i915: Force DPCD backlight mode for some Dell CML 2020 panels
      drm/i915/mst: Hookup DRM DP MST late_register/early_unregister callba=
cks

Matt Atwood (2):
      drm/i915/tgl: Add Wa_1606054188:tgl
      drm/i915/tgl: Add Wa_1409085225, Wa_14010229206

Matt Roper (9):
      drm/i915/tgl: Allow DC5/DC6 entry while PG2 is active
      drm/i915/ehl: Check PHY type before reading DPLL frequency
      drm/i915/tgl: Don't treat unslice registers as masked
      drm/i915: Handle all MCR ranges
      drm/i915: Add Wa_1209644611:icl,ehl
      drm/i915: Add Wa_1604278689:icl,ehl
      drm/i915: Add Wa_1406306137:icl,ehl
      drm/i915: Apply Wa_1406680159:icl,ehl as an engine workaround
      drm/i915: Add Wa_1605460711 / Wa_1408767742 to ICL and EHL

Matthew Auld (4):
      drm/i915: be more solid in checking the alignment
      drm/i915: properly sanity check batch_start_offset
      drm/i915/buddy: avoid double list_add
      drm/i915/selftests: try to rein in alloc_smoke

Mika Kuoppala (1):
      drm/i915: Add mechanism to submit a context WA on ring submission

Pankaj Bharadiya (2):
      drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
      drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available

Prathap Kumar Valsan (1):
      drm/i915/gen7: Clear all EU/L3 residual contexts

Radhakrishna Sripada (1):
      drm/i915/display: Do not write in removed FBC fence registers

Ramalingam C (1):
      drm/i915/hdcp: conversion to struct drm_device based logging macros.

Rodrigo Vivi (3):
      Merge tag 'gvt-next-2020-02-26' of https://github.com/intel/gvt-linux=
 into drm-intel-next-queued
      Merge tag 'gvt-next-2020-03-10' of https://github.com/intel/gvt-linux=
 into drm-intel-next-queued
      drm/i915: Update DRIVER_DATE to 20200313

Stanislav Lisovskiy (1):
      drm/i915: Use intel_plane_data_rate for min_cdclk calculation

Swathi Dhanavanthri (1):
      drm/i915/tgl: Make Wa_1606700617 permanent

Swati Sharma (1):
      drm/i915/display: Decrease log level

Takashi Iwai (1):
      drm/i915/gt: Use scnprintf() for avoiding potential buffer overflow

Tina Zhang (2):
      drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable
      drm/i915/gvt: Fix dma-buf display blur issue on CFL

Tvrtko Ursulin (3):
      drm/i915/tgl: WaDisableGPGPUMidThreadPreemption
      drm/i915: Remove debugfs i915_drpc_info and i915_forcewake_domains
      drm/i915/gen12: Disable preemption timeout

Ville Syrj=E4l=E4 (25):
      drm/i915: Set up PIPE_MISC truncate bit on tgl+
      drm/i915: Add glk to intel_detect_preproduction_hw()
      drm/i915: Nuke pre-production GLK HDMI w/a 1139
      drm/i915: Limit display Wa_1405510057 to gen11
      drm/i915: Drop WaDDIIOTimeout:glk
      drm/i915: Fix 90/270 degree rotated RGB565 src coord checks
      drm/i915: Handle some leftover s/intel_crtc/crtc/
      drm/i915: Remove garbage WARNs
      drm/i915: Add missing commas to dbuf tables
      drm/i915: Use a sentinel to terminate the dbuf slice arrays
      drm/i915: Polish CHV .load_luts() a bit
      drm/i915: Don't check uv_wm in skl_plane_wm_equals()
      drm/i915: Don't check for wm changes until we've compute the wms fully
      drm/i915: Enable transition watermarks for glk
      drm/i915: Implement display w/a 1140 for glk/cnl
      drm/i915: Polish CHV CGM CSC loading
      drm/i915: Clean up i9xx_load_luts_internal()
      drm/i915: Split i9xx_read_lut_8() to gmch vs. ilk variants
      drm/i915: s/blob_data/lut/
      drm/i915: s/chv_read_cgm_lut/chv_read_cgm_gamma/
      drm/i915: Clean up integer types in color code
      drm/i915: Refactor LUT read functions
      drm/i915: Fix readout of PIPEGCMAX
      drm/i915: Pass the crtc to the low level read_lut() funcs
      drm/i915: Lock gmbus/aux mutexes while changing cdclk

Vivek Kasireddy (1):
      drm/i915/hotplug: Use phy to get the hpd_pin instead of the port (v5)

Wambui Karuga (7):
      drm/i915/dsb: convert to drm_device based logging macros.
      drm/i915/fifo_underrun: convert to drm_device based logging.
      drm/i915/gmbus: convert to drm_device based logging,
      drm/i915/hotplug: convert to drm_device based logging.
      drm/i915/lpe_audio: convert to drm_device based logging macros.
      drm/i915/lvds: convert to drm_device based logging macros.
      drm/i915/overlay: convert to drm_device based logging.

Zhenyu Wang (3):
      drm/i915/gvt: remove unused type attributes
      drm/i915/gvt: Enable vfio edid for all GVT supported platform
      Merge drm-intel-next-queued into gvt-next

 Documentation/gpu/i915.rst                         |   8 +-
 drivers/gpu/drm/drm_dp_helper.c                    |  79 ++
 drivers/gpu/drm/drm_dp_mst_topology.c              |   3 +-
 drivers/gpu/drm/i915/Kconfig.profile               |  25 +-
 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  18 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  24 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   3 +
 drivers/gpu/drm/i915/display/intel_audio.c         |  10 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   1 -
 drivers/gpu/drm/i915/display/intel_bios.h          |   2 -
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  22 +
 drivers/gpu/drm/i915/display/intel_color.c         | 434 ++++++-----
 drivers/gpu/drm/i915/display/intel_crt.c           |   1 -
 drivers/gpu/drm/i915/display/intel_csr.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           | 461 +----------
 drivers/gpu/drm/i915/display/intel_ddi.h           |   4 -
 drivers/gpu/drm/i915/display/intel_display.c       | 131 ++--
 drivers/gpu/drm/i915/display/intel_display.h       |  10 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  18 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  63 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  21 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   2 -
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  24 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  35 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 848 +++++++++++++++++=
----
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |  14 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  28 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   1 -
 drivers/gpu/drm/i915/display/intel_dvo.c           |   1 -
 drivers/gpu/drm/i915/display/intel_fbc.c           |  62 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   1 -
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  29 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  34 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 115 +--
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   2 -
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  10 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |   2 -
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  73 +-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   2 -
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |  23 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  44 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |   2 -
 drivers/gpu/drm/i915/display/intel_overlay.c       |  12 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  18 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  17 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |  10 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   1 -
 drivers/gpu/drm/i915/display/intel_sdvo.h          |   2 -
 drivers/gpu/drm/i915/display/intel_sprite.c        |  80 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   1 -
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   2 -
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  55 +-
 drivers/gpu/drm/i915/gem/i915_gem_client_blt.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 362 ++++++---
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 734 +++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 -
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  15 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   2 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |   2 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   3 +
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         | 402 ++++++++++
 drivers/gpu/drm/i915/gt/gen7_renderclear.h         |  15 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  27 +
 drivers/gpu/drm/i915/gt/hsw_clear_kernel.c         |  61 ++
 drivers/gpu/drm/i915/gt/intel_context.c            |   5 +
 drivers/gpu/drm/i915/gt/intel_context_param.c      |  63 ++
 drivers/gpu/drm/i915/gt/intel_context_param.h      |  14 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |  15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  37 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  15 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |  17 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |  14 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  29 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   7 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 178 +++--
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   9 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  21 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    | 149 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  45 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 154 +++-
 drivers/gpu/drm/i915/gt/ivb_clear_kernel.c         |  61 ++
 drivers/gpu/drm/i915/gt/mock_engine.c              |   4 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |  30 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             | 790 +++++++++++++++++=
+-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c | 296 +++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c            | 445 +++++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.h            |  13 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |  84 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |  27 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              | 208 +++--
 drivers/gpu/drm/i915/gvt/debugfs.c                 |  45 +-
 drivers/gpu/drm/i915/gvt/display.c                 |  25 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   8 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |  25 +-
 drivers/gpu/drm/i915/gvt/execlist.c                | 103 ++-
 drivers/gpu/drm/i915/gvt/execlist.h                |   5 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   6 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |  16 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |  63 +-
 drivers/gpu/drm/i915/gvt/gvt.c                     |  43 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |  62 +-
 drivers/gpu/drm/i915/gvt/handlers.c                | 203 ++---
 drivers/gpu/drm/i915/gvt/interrupt.c               |  21 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   | 309 +++++---
 drivers/gpu/drm/i915/gvt/mmio.c                    |  32 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |   4 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            | 127 ++-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |   5 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |  25 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               | 253 +++---
 drivers/gpu/drm/i915/gvt/scheduler.h               |   9 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |  18 +-
 drivers/gpu/drm/i915/i915_active.c                 | 123 ++-
 drivers/gpu/drm/i915/i915_active.h                 |   8 +-
 drivers/gpu/drm/i915/i915_buddy.c                  |   3 +-
 drivers/gpu/drm/i915/i915_debugfs.c                | 216 ------
 drivers/gpu/drm/i915/i915_drv.c                    | 517 +------------
 drivers/gpu/drm/i915/i915_drv.h                    | 143 +---
 drivers/gpu/drm/i915/i915_gem.c                    |   1 -
 drivers/gpu/drm/i915/i915_gem_evict.c              |  17 +-
 drivers/gpu/drm/i915/i915_gem_fence_reg.c          |   3 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   2 -
 drivers/gpu/drm/i915/i915_ioc32.c                  |   7 +-
 drivers/gpu/drm/i915/i915_ioc32.h                  |  17 +
 drivers/gpu/drm/i915/i915_irq.c                    |  31 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  73 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |   3 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  26 +-
 drivers/gpu/drm/i915/i915_request.c                | 273 ++++---
 drivers/gpu/drm/i915/i915_request.h                |  14 +-
 drivers/gpu/drm/i915/i915_scheduler.c              |  10 +-
 drivers/gpu/drm/i915/i915_suspend.c                |   2 -
 drivers/gpu/drm/i915/i915_sysfs.c                  |   3 +
 drivers/gpu/drm/i915/i915_utils.c                  |   1 -
 drivers/gpu/drm/i915/i915_utils.h                  |  27 +-
 drivers/gpu/drm/i915/i915_vgpu.c                   |  31 +-
 drivers/gpu/drm/i915/i915_vgpu.h                   |  25 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   3 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |  11 -
 drivers/gpu/drm/i915/intel_device_info.c           |   1 +
 drivers/gpu/drm/i915/intel_dram.c                  | 500 ++++++++++++
 drivers/gpu/drm/i915/intel_dram.h                  |  14 +
 drivers/gpu/drm/i915/intel_gvt.c                   |   6 +
 drivers/gpu/drm/i915/intel_pm.c                    | 257 +++----
 drivers/gpu/drm/i915/selftests/i915_active.c       |  78 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |  25 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |   1 +
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   1 -
 include/drm/drm_dp_helper.h                        |  21 +-
 include/drm/i915_mei_hdcp_interface.h              |   1 -
 include/uapi/drm/i915_drm.h                        |  21 +
 175 files changed, 7081 insertions(+), 4178 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/gen7_renderclear.c
 create mode 100644 drivers/gpu/drm/i915/gt/gen7_renderclear.h
 create mode 100644 drivers/gpu/drm/i915/gt/hsw_clear_kernel.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.h
 create mode 100644 drivers/gpu/drm/i915/gt/ivb_clear_kernel.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_ring_submission.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_engines.c
 create mode 100644 drivers/gpu/drm/i915/gt/sysfs_engines.h
 create mode 100644 drivers/gpu/drm/i915/i915_ioc32.h
 create mode 100644 drivers/gpu/drm/i915/intel_dram.c
 create mode 100644 drivers/gpu/drm/i915/intel_dram.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
