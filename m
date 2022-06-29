Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229855FDAA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 12:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95512BC05;
	Wed, 29 Jun 2022 10:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CEC12BBFE;
 Wed, 29 Jun 2022 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656499505; x=1688035505;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vH3+l2+F7SRb1mTzzPdVGF+ue6c4bBjE1LbI/oijHgo=;
 b=myO7OhavJBM/k993mrfaBU+n4c7laoGa0vwLyfp3NKpPh0O6SztJR1Au
 UsKg/bxrXVQFca1SQBcGqvaxkKM8R0jwerk4O8sDmCslOoacTig/ewP/P
 FLoPPtKtYRHnsoW8gyc9BuKrV0p+PpVjK+LEJIsEwqullFk59Im10lREl
 wJIrW5QTxKn9yPH77tUOESX2wgSvSMJSXsjOySiFvMTNMaQf6vNExxs2e
 LK/YEO1aepRo1VXFnkQ+bZ1u9HmdyMNaHZbISCoN5qeMQlWS26dSE+Axy
 XvZmBnZSP2ClqG9JKgd+axqVPLVfTJ8/Y4YDiWopYBVGELsrMKU0uXJ7c g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="345990370"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="345990370"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 03:45:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="917559434"
Received: from dmurr12x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.211.77])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 03:45:01 -0700
Date: Wed, 29 Jun 2022 11:45:00 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YrwtLM081SQUG1Dc@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

This is the first pull request for 5.20 merge window.

A lot of fixes across the board, a few improvements and quite a lot of driver
refactoring to prepare for Ponte Vecchio, and then a bunch of Ponte Vecchio
early enablement on top.

In terms of improvements, we now enable huge pages on Icelake and above
regardless of the IOMMU status. This is after confirming with hardware
architects and measuring the performance regression which we had on older
platforms is gone.

Resume speed on modern integrated platforms has also been improved with around
100ms improvement measured.

DG2 has gained HuC support and some new workarounds.

In terms of fixes, the headline ones are:

* Driver load on DG2 small BAR configurations has been fixed to not crash.

* GuC backend has fixed the EU scheduling priority for DG2 and in general fixed
  reset handling, improved error capture and optimised performance of querying
  engine busyness.

* Rendering corruption on Haswell and older platforms caused by some recent
  refactoring has also been fixed, as was the dma_resv handling in the
  relatively new multi-batch execbuf code.

* Temporary and unintended relaxation of the persistent contexts handling in the
  protocontext code has been fixed up before it hopefully "escaped" into the
  wild.

* Reset handling on Icelake and above has been improved with a new workaround
  which should improve the stability in some corner cases.

* Processes which use non-persistent context and abruptly exit will now be
  allowed to exit gracefuly without triggering resets and error capture in the
  logs.

* A bunch more as mentioned in the tag summary.

On the uapi front we have deprecation of some legacy get params on Xe_HP+ and
media block frequency control exposed in per gt sysfs.

Outside i915 we have a rename in the intel-gtt module and one cross-merge from
drm-intel-next.

Regards,

Tvrtko

drm-intel-gt-next-2022-06-29:
UAPI Changes:

- Expose per tile media freq factor in sysfs (Ashutosh Dixit, Dale B Stimson)
- Document memory residency and Flat-CCS capability of obj (Ramalingam C)
- Disable GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK on Xe_HP+ (Matt Roper)

Cross-subsystem Changes:

- Rename intel-gtt symbols (Lucas De Marchi)

Core Changes:

Driver Changes:

- Support programming the EU priority in the GuC descriptor (DG2) (Matthew Brost)
- DG2 HuC loading support (Daniele Ceraolo Spurio)
- Fix build error without CONFIG_PM (YueHaibing)
- Enable THP on Icelake and beyond (Tvrtko Ursulin)
- Only setup private tmpfs mount when needed and fix logging (Tvrtko Ursulin)
- Make __guc_reset_context aware of guilty engines (Umesh Nerlige Ramappa)
- DG2 small bar memory probing fixes (Nirmoy Das)
- Remove unnecessary GuC err capture noise (Alan Previn)
- Fix i915_gem_object_ggtt_pin_ww regression on old platforms (Maarten Lankhorst)
- Fix undefined behavior in GuC backend due to shift overflowing the constant (Borislav Petkov)
- New DG2 workarounds (Swathi Dhanavanthri, Anshuman Gupta)
- Report no hwconfig support on ADL-N (Balasubramani Vivekanandan)
- Fix error_state_read ptr + offset use (Alan Previn)
- Expose per tile media freq factor in sysfs (Ashutosh Dixit, Dale B Stimson)
- Fix memory leaks in per-gt sysfs (Ashutosh Dixit)
- Fix dma_resv fence handling in multi-batch execbuf (Nirmoy Das)
- Add extra registers to GPU error dump on Gen11+ (Stuart Summers)
- More PVC+DG2 workarounds (Matt Roper)
- Improve user experience and driver robustness under SIGINT or similar (Tvrtko Ursulin)
- Don't show engine classes not present (Tvrtko Ursulin)
- Improve on suspend / resume time with VT-d enabled (Thomas Hellström)
- Add missing else (katrinzhou)
- Don't leak lmem mapping in vma_evict (Juha-Pekka Heikkila)
- Add smem fallback allocation for dpt (Juha-Pekka Heikkila)
- Tweak the ordering in cpu_write_needs_clflush (Matthew Auld)
- Do not access rq->engine without a reference (Niranjana Vishwanathapura)
- Revert "drm/i915: Hold reference to intel_context over life of i915_request" (Niranjana Vishwanathapura)
- Don't update engine busyness stats too frequently (Alan Previn)
- Add additional steps for Wa_22011802037 for execlist backend (Umesh Nerlige Ramappa)
- Fix a lockdep warning at error capture (Nirmoy Das)

- Ponte Vecchio prep work and new blitter engines (Matt Roper, John Harrison, Lucas De Marchi)
- Read correct RP_STATE_CAP register (PVC) (Matt Roper)
- Define MOCS table for PVC (Ayaz A Siddiqui)
- Driver refactor and support Ponte Vecchio forcewake handling (Matt Roper)
- Remove additional 3D flags from PIPE_CONTROL (Ponte Vecchio) (Stuart Summers)
- XEHPSDV and PVC do not use HuC (Daniele Ceraolo Spurio)
- Extract stepping information from PCI revid (Ponte Vecchio) (Matt Roper)
- Add initial PVC workarounds (Stuart Summers)
- SSEU handling driver refactor and Ponte Vecchio support (Matt Roper)
- GuC depriv applies to PVC (Matt Roper)
- Add register steering (Ponte Vecchio) (Matt Roper)
- Add recommended MMIO setting (Ponte Vecchio) (Matt Roper)

- Move multicast register handling to a dedicated file (Matt Roper)
- Cleanup interface for MCR operations (Matt Roper)
- Extend i915_vma_pin_iomap() (CQ Tang)
- Re-do the intel-gtt split (Lucas De Marchi)
- Correct duplicated/misplaced GT register definitions (Matt Roper)
- Prefer "XEHP_" prefix for registers (Matt Roper)

- Don't use DRM_DEBUG_WARN_ON for unexpected l3bank/mslice config (Tvrtko Ursulin)
- Don't use DRM_DEBUG_WARN_ON for ring unexpectedly not idle (Tvrtko Ursulin)
- Make drop_pages() return bool (Lucas De Marchi)
- Fix CFI violation with show_dynamic_id() (Nathan Chancellor)
- Use i915_probe_error instead of drm_error in GuC code (Vinay Belgaumkar)
- Fix use of static in macro mismatch (Andi Shyti)
- Update tiled blits selftest (Bommu Krishnaiah)
- Future-proof platform checks (Matt Roper)
- Only include what's needed (Jani Nikula)
- remove accidental static from a local variable (Jani Nikula)
- Add global forcewake request to drpc (Vinay Belgaumkar)
- Fix spelling typo in comment (pengfuyuan)
- Increase timeout for live_parallel_switch selftest (Akeem G Abodunrin)
- Use non-blocking H2G for waitboost (Vinay Belgaumkar)
The following changes since commit 5f38c3fb55ce3814b4353320d7a205068a420e48:

  drm/i915/pcode: Add a couple of pcode helpers (2022-05-20 09:11:45 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-06-29

for you to fetch changes up to a06968563775181690125091f470a8655742dcbf:

  drm/i915: Fix a lockdep warning at error capture (2022-06-29 14:52:50 +0530)

----------------------------------------------------------------
UAPI Changes:

- Expose per tile media freq factor in sysfs (Ashutosh Dixit, Dale B Stimson)
- Document memory residency and Flat-CCS capability of obj (Ramalingam C)
- Disable GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK on Xe_HP+ (Matt Roper)

Cross-subsystem Changes:

- Rename intel-gtt symbols (Lucas De Marchi)

Core Changes:

Driver Changes:

- Support programming the EU priority in the GuC descriptor (DG2) (Matthew Brost)
- DG2 HuC loading support (Daniele Ceraolo Spurio)
- Fix build error without CONFIG_PM (YueHaibing)
- Enable THP on Icelake and beyond (Tvrtko Ursulin)
- Only setup private tmpfs mount when needed and fix logging (Tvrtko Ursulin)
- Make __guc_reset_context aware of guilty engines (Umesh Nerlige Ramappa)
- DG2 small bar memory probing fixes (Nirmoy Das)
- Remove unnecessary GuC err capture noise (Alan Previn)
- Fix i915_gem_object_ggtt_pin_ww regression on old platforms (Maarten Lankhorst)
- Fix undefined behavior in GuC backend due to shift overflowing the constant (Borislav Petkov)
- New DG2 workarounds (Swathi Dhanavanthri, Anshuman Gupta)
- Report no hwconfig support on ADL-N (Balasubramani Vivekanandan)
- Fix error_state_read ptr + offset use (Alan Previn)
- Expose per tile media freq factor in sysfs (Ashutosh Dixit, Dale B Stimson)
- Fix memory leaks in per-gt sysfs (Ashutosh Dixit)
- Fix dma_resv fence handling in multi-batch execbuf (Nirmoy Das)
- Add extra registers to GPU error dump on Gen11+ (Stuart Summers)
- More PVC+DG2 workarounds (Matt Roper)
- Improve user experience and driver robustness under SIGINT or similar (Tvrtko Ursulin)
- Don't show engine classes not present (Tvrtko Ursulin)
- Improve on suspend / resume time with VT-d enabled (Thomas Hellström)
- Add missing else (katrinzhou)
- Don't leak lmem mapping in vma_evict (Juha-Pekka Heikkila)
- Add smem fallback allocation for dpt (Juha-Pekka Heikkila)
- Tweak the ordering in cpu_write_needs_clflush (Matthew Auld)
- Do not access rq->engine without a reference (Niranjana Vishwanathapura)
- Revert "drm/i915: Hold reference to intel_context over life of i915_request" (Niranjana Vishwanathapura)
- Don't update engine busyness stats too frequently (Alan Previn)
- Add additional steps for Wa_22011802037 for execlist backend (Umesh Nerlige Ramappa)
- Fix a lockdep warning at error capture (Nirmoy Das)

- Ponte Vecchio prep work and new blitter engines (Matt Roper, John Harrison, Lucas De Marchi)
- Read correct RP_STATE_CAP register (PVC) (Matt Roper)
- Define MOCS table for PVC (Ayaz A Siddiqui)
- Driver refactor and support Ponte Vecchio forcewake handling (Matt Roper)
- Remove additional 3D flags from PIPE_CONTROL (Ponte Vecchio) (Stuart Summers)
- XEHPSDV and PVC do not use HuC (Daniele Ceraolo Spurio)
- Extract stepping information from PCI revid (Ponte Vecchio) (Matt Roper)
- Add initial PVC workarounds (Stuart Summers)
- SSEU handling driver refactor and Ponte Vecchio support (Matt Roper)
- GuC depriv applies to PVC (Matt Roper)
- Add register steering (Ponte Vecchio) (Matt Roper)
- Add recommended MMIO setting (Ponte Vecchio) (Matt Roper)

- Move multicast register handling to a dedicated file (Matt Roper)
- Cleanup interface for MCR operations (Matt Roper)
- Extend i915_vma_pin_iomap() (CQ Tang)
- Re-do the intel-gtt split (Lucas De Marchi)
- Correct duplicated/misplaced GT register definitions (Matt Roper)
- Prefer "XEHP_" prefix for registers (Matt Roper)

- Don't use DRM_DEBUG_WARN_ON for unexpected l3bank/mslice config (Tvrtko Ursulin)
- Don't use DRM_DEBUG_WARN_ON for ring unexpectedly not idle (Tvrtko Ursulin)
- Make drop_pages() return bool (Lucas De Marchi)
- Fix CFI violation with show_dynamic_id() (Nathan Chancellor)
- Use i915_probe_error instead of drm_error in GuC code (Vinay Belgaumkar)
- Fix use of static in macro mismatch (Andi Shyti)
- Update tiled blits selftest (Bommu Krishnaiah)
- Future-proof platform checks (Matt Roper)
- Only include what's needed (Jani Nikula)
- remove accidental static from a local variable (Jani Nikula)
- Add global forcewake request to drpc (Vinay Belgaumkar)
- Fix spelling typo in comment (pengfuyuan)
- Increase timeout for live_parallel_switch selftest (Akeem G Abodunrin)
- Use non-blocking H2G for waitboost (Vinay Belgaumkar)

----------------------------------------------------------------
Akeem G Abodunrin (1):
      drm/i915/selftests: Increase timeout for live_parallel_switch

Alan Previn (3):
      drm/i915/guc: Remove unnecessary GuC err capture noise
      drm/i915/reset: Fix error_state_read ptr + offset use
      drm/i915/guc: Don't update engine busyness stats too frequently

Andi Shyti (1):
      drm/i915/gt: Fix use of static in macro mismatch

Anshuman Gupta (1):
      drm/i915/dg2: Add Wa_14015795083

Ashutosh Dixit (3):
      drm/i915/gt: Add media freq factor to per-gt sysfs
      drm/i915/pcode: Init pcode on different gt's
      drm/i915/gt: Fix memory leaks in per-gt sysfs

Ayaz A Siddiqui (1):
      drm/i915/pvc: Define MOCS table for PVC

Balasubramani Vivekanandan (1):
      drm/i915/hwconfig: Report no hwconfig support on ADL-N

Bommu Krishnaiah (1):
      drm/i915: Update tiled blits selftest

Borislav Petkov (1):
      drm/i915/uc: Fix undefined behavior due to shift overflowing the constant

CQ Tang (1):
      drm/i915: extend i915_vma_pin_iomap()

Dale B Stimson (1):
      drm/i915/gt: Add media RP0/RPn to per-gt sysfs

Daniele Ceraolo Spurio (5):
      drm/i915/huc: drop intel_huc_is_authenticated
      drm/i915/huc: Add fetch support for gsc-loaded HuC binary
      drm/i915/huc: Prepare for GSC-loaded HuC
      drm/i915/huc: Don't fail the probe if HuC init fails
      drm/i915/guc: XEHPSDV and PVC do not use HuC

Jani Nikula (2):
      drm/i915/client: only include what's needed
      drm/i915/uc: remove accidental static from a local variable

John Harrison (1):
      drm/i915/pvc: Reduce stack usage in reset selftest with extra blitter engine

José Roberto de Souza (7):
      drm/i915: Drop has_gt_uc from device info
      drm/i915: Drop has_rc6 from device info
      drm/i915: Drop has_reset_engine from device info
      drm/i915: Drop has_logical_ring_elsq from device info
      drm/i915: Drop has_ddi from device info
      drm/i915: Drop has_dp_mst from device info
      drm/i915: Drop has_psr from device info

Juha-Pekka Heikkila (2):
      drm/i915: don't leak lmem mapping in vma_evict
      drm/i915/display: Add smem fallback allocation for dpt

Lucas De Marchi (5):
      drm/i915/gem: Make drop_pages() return bool
      drm/i915/pvc: skip all copy engines from aux table invalidate
      drm/i915/pvc: read fuses for link copy engines
      agp/intel: Rename intel-gtt symbols
      drm/i915/gt: Re-do the intel-gtt split

Maarten Lankhorst (1):
      drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap

Matt Roper (27):
      drm/i915/pvc: Read correct RP_STATE_CAP register
      drm/i915/gvt: Use intel_engine_mask_t for ring mask
      drm/i915/pvc: Engine definitions for new copy engines
      drm/i915/pvc: Interrupt support for new copy engines
      drm/i915/pvc: Reset support for new copy engines
      drm/i915/uncore: Reorganize and document shadow and forcewake tables
      drm/i915/pvc: Add forcewake support
      drm/i915/pvc: Add new BCS engines to GuC engine list
      drm/i915/hwconfig: Future-proof platform checks
      drm/i915/pvc: Extract stepping information from PCI revid
      drm/i915/xehp: Use separate sseu init function
      drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
      drm/i915/sseu: Simplify gen11+ SSEU handling
      drm/i915/sseu: Don't try to store EU mask internally in UAPI format
      drm/i915/sseu: Disassociate internal subslice mask representation from uapi
      drm/i915/pvc: Add SSEU changes
      drm/i915/pvc: GuC depriv applies to PVC
      drm/i915/dg2: Correct DSS check for Wa_1308578152
      drm/i915: More PVC+DG2 workarounds
      drm/i915/xehp: Correct steering initialization
      drm/i915/pvc: Add register steering
      drm/i915/pvc: Adjust EU per SS according to HAS_ONE_EU_PER_FUSE_BIT()
      drm/i915/pvc: Add recommended MMIO setting
      drm/i915/gt: Move multicast register handling to a dedicated file
      drm/i915/gt: Cleanup interface for MCR operations
      drm/i915: Correct duplicated/misplaced GT register definitions
      drm/i915: Prefer "XEHP_" prefix for registers

Matthew Auld (1):
      drm/i915: tweak the ordering in cpu_write_needs_clflush

Matthew Brost (1):
      drm/i915/guc: Support programming the EU priority in the GuC descriptor

Nathan Chancellor (1):
      drm/i915: Fix CFI violation with show_dynamic_id()

Niranjana Vishwanathapura (2):
      drm/i915: Do not access rq->engine without a reference
      Revert "drm/i915: Hold reference to intel_context over life of i915_request"

Nirmoy Das (5):
      drm/i915: return -EIO on lmem setup failure
      drm/i915: determine lmem_size properly
      drm/i915: gracefully error out on platform with small-bar
      drm/i915: Individualize fences before adding to dma_resv obj
      drm/i915: Fix a lockdep warning at error capture

Ramalingam C (1):
      uapi/drm/i915: Document memory residency and Flat-CCS capability of obj

Stuart Summers (3):
      drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL
      drm/i915/pvc: Add initial PVC workarounds
      drm/i915: Add extra registers to GPU error dump

Swathi Dhanavanthri (2):
      drm/i915/dg2: Add workaround 22014600077
      drm/i915/dg2: Extend Wa_22010954014 to DG2-G11 and DG2-G12

Thomas Hellström (1):
      drm/i915: Improve on suspend / resume time with VT-d enabled

Tvrtko Ursulin (14):
      drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected l3bank/mslice config
      drm/i915: Don't use DRM_DEBUG_WARN_ON for ring unexpectedly not idle
      drm/i915: Enable THP on Icelake and beyond
      drm/i915: Only setup private tmpfs mount when needed and fix logging
      Revert "drm/i915: Drop has_psr from device info"
      Revert "drm/i915: Drop has_dp_mst from device info"
      Revert "drm/i915: Drop has_ddi from device info"
      Revert "drm/i915: Drop has_logical_ring_elsq from device info"
      Revert "drm/i915: Drop has_reset_engine from device info"
      Revert "drm/i915: Drop has_rc6 from device info"
      Revert "drm/i915: Drop has_gt_uc from device info"
      Merge tag 'drm-intel-next-2022-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next
      drm/i915: Improve user experience and driver robustness under SIGINT or similar
      drm/i915/fdinfo: Don't show engine classes not present

Umesh Nerlige Ramappa (2):
      i915/guc/reset: Make __guc_reset_context aware of guilty engines
      drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend

Vinay Belgaumkar (3):
      drm/i915/guc/rc: Use i915_probe_error instead of drm_error
      drm/i915: Add global forcewake request to drpc
      drm/i915/guc/slpc: Use non-blocking H2G for waitboost

YueHaibing (1):
      drm/i915/gt: Fix build error without CONFIG_PM

katrinzhou (1):
      drm/i915/gem: add missing else

pengfuyuan (1):
      drm/i915: Fix spelling typo in comment

 Documentation/gpu/drm-usage-stats.rst              |  112 ++
 Documentation/gpu/i915.rst                         |   40 +
 Documentation/gpu/index.rst                        |    1 +
 MAINTAINERS                                        |    1 +
 drivers/char/agp/intel-gtt.c                       |   58 +-
 drivers/gpu/drm/i915/Kconfig                       |    3 +-
 drivers/gpu/drm/i915/Makefile                      |   11 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   18 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   56 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  103 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    6 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   15 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   23 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   50 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |    7 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   12 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  146 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |    4 -
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   52 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |    1 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |   50 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.h              |    3 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  250 ++-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   12 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |    5 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |    2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  186 ++-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |   11 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   12 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   53 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   40 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   28 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  251 +++-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   25 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   13 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   89 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  238 ++-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |  132 ++
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h          |   27 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   68 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |  224 +++
 drivers/gpu/drm/i915/gt/intel_gsc.h                |   37 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  294 ++--
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   31 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    4 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   29 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  497 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |   34 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   18 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   48 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   98 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |  117 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |   30 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  779 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h        |   15 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   29 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   56 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   96 +-
 drivers/gpu/drm/i915/gt/intel_hwconfig.h           |   21 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  114 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |   36 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  385 ++++-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   24 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    8 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   31 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    9 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   13 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  128 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |    6 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |   15 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  478 +++---
 drivers/gpu/drm/i915/gt/intel_sseu.h               |  122 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |   60 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  201 ++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   86 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    9 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   63 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  259 +++-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   16 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |    6 +
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |    2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |   15 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |    2 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |  218 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   52 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  188 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 1584 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |   33 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   93 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |  164 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  125 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |    7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |    3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  114 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  661 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   97 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   28 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  137 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |    9 +
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   12 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   73 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |  160 ++
 drivers/gpu/drm/i915/i915_drm_client.h             |   68 +
 drivers/gpu/drm/i915/i915_drv.h                    |   51 +-
 drivers/gpu/drm/i915/i915_file_private.h           |    3 +
 drivers/gpu/drm/i915/i915_gem.c                    |   89 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   11 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  324 ++--
 drivers/gpu/drm/i915/i915_gpu_error.h              |   44 +-
 drivers/gpu/drm/i915/i915_params.c                 |    3 +
 drivers/gpu/drm/i915/i915_params.h                 |    1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   47 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    4 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |    2 +-
 drivers/gpu/drm/i915/i915_query.c                  |  108 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   46 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |    2 -
 drivers/gpu/drm/i915/i915_request.c                |   57 +-
 drivers/gpu/drm/i915/i915_request.h                |    2 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |  327 +---
 drivers/gpu/drm/i915/i915_sysfs.h                  |    3 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    4 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  214 +--
 drivers/gpu/drm/i915/i915_vma.h                    |   15 -
 drivers/gpu/drm/i915/i915_vma_resource.c           |    2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |    6 +
 drivers/gpu/drm/i915/i915_vma_types.h              |    8 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    1 +
 drivers/gpu/drm/i915/intel_device_info.h           |    8 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |    2 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |    8 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   23 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |    7 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |    1 +
 drivers/gpu/drm/i915/intel_step.c                  |   70 +-
 drivers/gpu/drm/i915/intel_step.h                  |    4 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  332 ++--
 drivers/gpu/drm/i915/intel_uncore.h                |    9 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   18 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   13 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |    4 +
 drivers/misc/mei/Kconfig                           |   14 +
 drivers/misc/mei/Makefile                          |    3 +
 drivers/misc/mei/bus-fixup.c                       |   25 +
 drivers/misc/mei/gsc-me.c                          |  259 ++++
 drivers/misc/mei/hw-me.c                           |   29 +-
 drivers/misc/mei/hw-me.h                           |    2 +
 include/drm/intel-gtt.h                            |   24 +-
 include/linux/mei_aux.h                            |   19 +
 include/uapi/drm/i915_drm.h                        |  369 ++++-
 181 files changed, 10550 insertions(+), 2810 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
 create mode 100644 drivers/misc/mei/gsc-me.c
 create mode 100644 include/linux/mei_aux.h
