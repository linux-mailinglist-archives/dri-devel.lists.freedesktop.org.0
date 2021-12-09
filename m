Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC3846EF20
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511F110E23C;
	Thu,  9 Dec 2021 16:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEC610E119;
 Thu,  9 Dec 2021 13:14:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="238318661"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="238318661"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:14:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="463230303"
Received: from bstach-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.211.238])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:14:35 -0800
Date: Thu, 9 Dec 2021 13:14:33 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YbIBOeqhn+nPzaYD@tursulin-mobl2>
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

Here goes the first PR towards 5.17.

On the bugfixing front most user visible items are a fix for GPU hangs caused by
certain media and OpenCL workloads applicable from Gen9 (Skylake) onward, a fix
for GPU hangs in Gnome shell on Tigerlake platforms and a fix for runtime power
management handling in the PXP code.

Other than that there is a bunch of bugfixes relating to the GuC backend
(locking, error capture, engine resets, incorrect error handling in the uapi
entry points, selftest timeout increases where required, removing a tracepoint
field).

Continuing with the GuC but on the feature front, it has gained support for
wait boosting and accurate engine busyness statistics bringing it closer to
parity with the existing driver paths.

Among other fixes, most interesting ones are closing the missed async clflush
under memory pressure corner case, making sure MOCS cannot be used to bypass the
last level cache when reading the scratch page and improving the robustness of
error capture under memory pressure.

With regards to new platform support a few DG2 and XeHP SDV workarounds have
arrived, together with some fixes for DG2 buffer migration. Also some
code refactoring happened to prepare for more future platforms.

Work on discrete memory enablement and TTM has continued with good pace, both
by fixing code previously merged and by adding new functionality. Failsafe and
asynchronous migration would be the headline features here, fixing both
possible security issues and also improving eviction performance.

TTM backend has also gained support for cached system memory which improves
performance during shrinking and prepares the code base for using TTM with
integrated GPUs.

Other than these headline features and fixes, there is a bunch of smaller
cleanups and further fixups as usual.

There are also two drm-next backmarges from the rc2 timeframe which Thomas and
Maarten needed for their feature work on async migration and ongoing driver
refactoring.

Regards,

Tvrtko

***

drm-intel-gt-next-2021-12-09:

Core Changes:

- Fix PENDING_ERROR leak in dma_fence_array_signaled() (Thomas Hellström)

Driver Changes:

- Fix runtime PM handling during PXP suspend (Tejas Upadhyay)
- Improve eviction performance on discrete by implementing async TTM moves (Thomas Hellström, Maarten Lankhorst)
- Improve robustness of error capture under memory pressure (Thomas Hellström)
- Fix GuC PMU versus GPU reset handling (Umesh Nerlige Ramappa)
- Use per device iommu check (Tvrtko Ursulin)
- Make error capture work with async migration (Thomas Hellström)
- Revert incorrect implementation of Wa_1508744258 causing hangs (José Roberto de Souza)
- Disable coarse power gating on some DG2 steppings workaround (Matt Roper)
- Add IC cache invalidation workaround on DG2 (Ramalingam C)
- Move two Icelake workarounds to the right place (Raviteja Goud Talla)
- Fix error pointer dereference in i915_gem_do_execbuffer() (Dan Carpenter)
- Fixup a couple of generic and DG2 specific issues in migration code (Matthew Auld)

- Fix kernel-doc warnings in i915_drm_object.c (Randy Dunlap)
- Drop stealing of bits from i915_sw_fence function pointer (Matthew Brost)
- Introduce new macros for i915 PTE (Michael Cheng)
- Prep work for engine reset by reset domain lookup (Tejas Upadhyay)

- Fixup drm-intel-gt-next build failure (Matthew Auld)
- Fix live_engine_busy_stats selftests in GuC mode (Umesh Nerlige Ramappa)
- Remove dma_resv_prune (Maarten Lankhorst)
- Preserve huge pages enablement after driver reload (Matthew Auld)
- Fix a NULL pointer dereference in igt_request_rewind() (selftests) (Zhou Qingyang)
- Add workaround numbers to GEN7_COMMON_SLICE_CHICKEN1 whitelisting (José Roberto de Souza)
- Increase timeouts in i915_gem_contexts selftests to handle GuC being slower (Bruce Chang)

drm-intel-gt-next-2021-11-22:

Driver Changes:

- Fix media and OpenCL system hangs on Gen9 due a missing workaround (Cooper)
- Fix build on non-x86 due missing wbinvd_on_all_cpus (Matthew Auld)
- Fix recursive lock in GuC submission (Matthew Brost)
- Revert 'guc_id' from i915_request tracepoint (Joonas)
- Improve accuracy of engine busyness query with GuC submission (Umesh)
- Always flush the scratch page so Bypass-LLC MOCS works correctly (Matthew Auld)
- Stop caching the scratch page (Matthew Auld)
- Make sure to flush even if async flush unexpectedly fails (Matthew Auld)
- Skip flushing when obtaining dmabuf pages on discrete (Matthew Auld)
- Implement waitboosting with GuC submission (Vinay)
- Failsafe migration blits (Thomas)
- Fix per-engine resets with GuC submission (Matthew Brost, Thomas)
- Fix error capture in GuC mode (John)
- Fix gem_madvise for ttm+shmem objects (Thomas)
- Fix illegal addition to shrinker list with the TTM backend (Thomas)
- Skip error capture when wedged on init (Tvrtko)
- fix NULL vs IS_ERR() checking when creating GuC parallel contexts (Dan)
- Drain the ttm delayed workqueue too (Maarten)
- Add initial Xe_HP SDV workarounds (Stuart)
- Add initial DG2 gt/ctx/engine workarounds and programm HW settings (Matt)

- Faster shrinking of cached system memory objects from the TTM backend plus backend prep work (Matthew Auld)
- Introduce refcounted sg-tables (Thomas)
- Stop using obj->cache_dirty on discrete altogether (Matthew Auld)
- Track graphics and media steppings separately in code (José)
- Rework some irq functions to take intel_gt as argument (Paulo)
- Split general MMIO setup from per-GT uncore init (Daniele)
- Prep work work for TTM backend eviction and dma_resv locking (Maarten, Matthew Auld)

- Fix some selftests to work with GuC (Matthew Brost)
- Fix inconsistent IS_ERR and PTR_ERR (Kai)
- Use ERR_CAST instead of ERR_PTR(PTR_ERR()) (Wan)
- Remove some dead struct fwd decl from i915_drv.h (Daniel)
- Fixup dma_fence_wait usage (Matthew)
- Remove gen6_ppgtt_unpin_all (Maarten)
- Rework context handling in hugepages selftests (Maarten)

The following changes since commit c18c8891111bb5e014e144716044991112f16833:

  Merge tag 'drm-misc-next-2021-11-18' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-11-23 09:38:55 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-12-09

for you to fetch changes up to 20cddfcc82e642e4682c48af91f0702fbbd623a0:

  drm/i915/gt: Use hw_engine_masks as reset_domains (2021-12-08 18:27:05 -0500)

----------------------------------------------------------------
Core Changes:

- Fix PENDING_ERROR leak in dma_fence_array_signaled() (Thomas Hellström)

Driver Changes:

- Fix runtime PM handling during PXP suspend (Tejas Upadhyay)
- Improve eviction performance on discrete by implementing async TTM moves (Thomas Hellström, Maarten Lankhorst)
- Improve robustness of error capture under memory pressure (Thomas Hellström)
- Fix GuC PMU versus GPU reset handling (Umesh Nerlige Ramappa)
- Use per device iommu check (Tvrtko Ursulin)
- Make error capture work with async migration (Thomas Hellström)
- Revert incorrect implementation of Wa_1508744258 causing hangs (José Roberto de Souza)
- Disable coarse power gating on some DG2 steppings workaround (Matt Roper)
- Add IC cache invalidation workaround on DG2 (Ramalingam C)
- Move two Icelake workarounds to the right place (Raviteja Goud Talla)
- Fix error pointer dereference in i915_gem_do_execbuffer() (Dan Carpenter)
- Fixup a couple of generic and DG2 specific issues in migration code (Matthew Auld)

- Fix kernel-doc warnings in i915_drm_object.c (Randy Dunlap)
- Drop stealing of bits from i915_sw_fence function pointer (Matthew Brost)
- Introduce new macros for i915 PTE (Michael Cheng)
- Prep work for engine reset by reset domain lookup (Tejas Upadhyay)

- Fixup drm-intel-gt-next build failure (Matthew Auld)
- Fix live_engine_busy_stats selftests in GuC mode (Umesh Nerlige Ramappa)
- Remove dma_resv_prune (Maarten Lankhorst)
- Preserve huge pages enablement after driver reload (Matthew Auld)
- Fix a NULL pointer dereference in igt_request_rewind() (selftests) (Zhou Qingyang)
- Add workaround numbers to GEN7_COMMON_SLICE_CHICKEN1 whitelisting (José Roberto de Souza)
- Increase timeouts in i915_gem_contexts selftests to handle GuC being slower (Bruce Chang)

----------------------------------------------------------------
Bruce Chang (1):
      drm/i915/selftests: Follow up on increase timeout in i915_gem_contexts selftests

Cooper Chiou (1):
      drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9

Dan Carpenter (3):
      drm/i915/guc: fix NULL vs IS_ERR() checking
      drm/i915/ttm: Fix error code in i915_ttm_eviction_valuable()
      drm/i915: Fix error pointer dereference in i915_gem_do_execbuffer()

Daniel Vetter (1):
      drm/i915: Remove some dead struct fwd decl from i915_drv.h

Daniele Ceraolo Spurio (1):
      drm/i915: split general MMIO setup from per-GT uncore init

John Harrison (1):
      drm/i915/guc: Refcount context during error capture

Joonas Lahtinen (3):
      Merge drm/drm-next into drm-intel-gt-next
      MAINTAINERS: Add Tvrtko as drm/i915 co-maintainer
      drm/i915: Revert 'guc_id' from i915_request tracepoint

José Roberto de Souza (5):
      drm/i915: Add struct to hold IP version
      drm/i915: Track media IP stepping separated from GT
      drm/i915: Rename GT_STEP to GRAPHICS_STEP
      Revert "drm/i915: Implement Wa_1508744258"
      drm/i915: Add workaround numbers to GEN7_COMMON_SLICE_CHICKEN1 whitelisting

Kai Song (1):
      drm/i915/selftests: Fix inconsistent IS_ERR and PTR_ERR

Maarten Lankhorst (9):
      drm/i915: Remove gen6_ppgtt_unpin_all
      drm/i915/selftests: Rework context handling in hugepages selftests
      drm/i915: Create a dummy object for gen6 ppgtt
      drm/i915: Create a full object for mock_ring, v2.
      drm/i915: vma is always backed by an object.
      drm/i915: Remove resv from i915_vma
      drm/i915: Drain the ttm delayed workqueue too
      drm/i915: Add support for moving fence waiting
      drm/i915: Remove dma_resv_prune

Matt Roper (4):
      drm/i915/dg2: Add initial gt/ctx/engine workarounds
      drm/i915/dg2: Program recommended HW settings
      drm/i915: Don't read query SSEU for non-existent slice 0 on old platforms
      drm/i915/dg2: Add Wa_16011777198

Matthew Auld (23):
      drm/i915/dmabuf: fix broken build
      drm/i915/ttm: add tt shmem backend
      drm/i915/gtt: drop unneeded make_unshrinkable
      drm/i915: drop unneeded make_unshrinkable in free_object
      drm/i915: add some kernel-doc for shrink_pin and friends
      drm/i915/ttm: move shrinker management into adjust_lru
      drm/i915/ttm: use cached system pages when evicting lmem
      drm/i915/ttm: enable shmem tt backend
      drm/i915/gtt: flush the scratch page
      drm/i915/gtt: stop caching the scratch page
      drm/i915/clflush: fixup handling of cache_dirty
      drm/i915/clflush: disallow on discrete
      drm/i915: move cpu_write_needs_clflush
      drm/i915: stop setting cache_dirty on discrete
      drm/i915/dmabuf: drop the flush on discrete
      drm/i915: fixup dma_fence_wait usage
      drm/i915: move the pre_pin earlier
      drm/i915/ttm: fixup build failure
      drm/i915/gemfs: don't mark huge_opt as static
      drm/i915/migrate: don't check the scratch page
      drm/i915/migrate: fix offset calculation
      drm/i915/migrate: fix length calculation
      drm/i915/selftests: handle object rounding

Matthew Brost (5):
      drm/i915/selftests: Increase timeout in requests perf selftest
      drm/i915/selftests: Update live.evict to wait on requests / idle GPU after each loop
      drm/i915/guc: Fix recursive lock in GuC submission
      drm/i915/resets: Don't set / test for per-engine reset bits with GuC submission
      drm/i915: Drop stealing of bits from i915_sw_fence function pointer

Michael Cheng (1):
      drm/i915: Introduce new macros for i915 PTE

Paulo Zanoni (1):
      drm/i915: rework some irq functions to take intel_gt as argument

Ramalingam C (1):
      drm/i915/dg2: Add Wa_16013000631

Randy Dunlap (1):
      drm/i915/gem: placate scripts/kernel-doc

Raviteja Goud Talla (1):
      drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()

Stuart Summers (1):
      drm/i915/xehpsdv: Add initial workarounds

Tejas Upadhyay (2):
      drm/i915/gt: Hold RPM wakelock during PXP suspend
      drm/i915/gt: Use hw_engine_masks as reset_domains

Thomas Hellström (16):
      drm/i915/gem: Break out some shmem backend utils
      drm/i915: Introduce refcounted sg-tables
      drm/i915/ttm: Reorganize the ttm move code
      drm/i915/ttm: Failsafe migration blits
      drm/i915/gem: Fix gem_madvise for ttm+shmem objects
      drm/i915/selftests: Use clear_and_wake_up_bit() for the per-engine reset bitlocks
      drm/i915/ttm: Fix illegal addition to shrinker list
      drm/i915/ttm: Move the i915_gem_obj_copy_ttm() function
      drm/i915/ttm: Drop region reference counting
      drm/i915/ttm: Correctly handle waiting for gpu when shrinking
      drm/i915/ttm: Implement asynchronous TTM moves
      drm/i915/ttm: Update i915_gem_obj_copy_ttm() to be asynchronous
      drm/i915: Avoid allocating a page array for the gpu coredump
      drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code
      dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
      drm/i915: Update error capture code to avoid using the current vma state

Tvrtko Ursulin (5):
      drm/i915: Skip error capture when wedged on init
      Merge drm/drm-next into drm-intel-gt-next
      Revert "drm/i915/dmabuf: fix broken build"
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Use per device iommu check

Umesh Nerlige Ramappa (5):
      drm/i915/pmu: Add a name to the execlists stats
      drm/i915/pmu: Connect engine busyness stats from GuC to pmu
      drm/i915/pmu: Avoid with_intel_runtime_pm within spinlock
      drm/i915/pmu: Increase the live_engine_busy_stats sample period
      drm/i915/pmu: Fix synchronization of PMU callback with reset

Vinay Belgaumkar (4):
      drm/i915/guc/slpc: Define and initialize boost frequency
      drm/i915/guc/slpc: Add waitboost functionality for SLPC
      drm/i915/guc/slpc: Update boost sysfs hooks for SLPC
      drm/i915/guc/slpc: Check GuC status before freq boost

Wan Jiabing (1):
      drm/i915: Use ERR_CAST instead of ERR_PTR(PTR_ERR())

Zhou Qingyang (1):
      drm/i915/gem: Fix a NULL pointer dereference in igt_request_rewind()

 MAINTAINERS                                        |   1 +
 drivers/dma-buf/dma-fence-array.c                  |   6 +-
 drivers/gpu/drm/i915/Makefile                      |   3 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
 drivers/gpu/drm/i915/dma_resv_utils.c              |  17 -
 drivers/gpu/drm/i915/dma_resv_utils.h              |  13 -
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  22 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     | 142 +++-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |  44 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  75 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  40 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  46 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 195 +++--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  97 ++-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 765 +++++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  41 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       | 874 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h       |  41 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  12 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |   5 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    | 130 +--
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |   2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   4 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |  24 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               | 135 ++--
 drivers/gpu/drm/i915/gt/gen6_ppgtt.h               |   2 -
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  11 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |  16 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  68 +-
 drivers/gpu/drm/i915/gt/intel_engine_stats.h       |  33 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  84 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  37 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   9 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   5 +
 drivers/gpu/drm/i915/gt/intel_migrate.c            |   8 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  15 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |  12 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  58 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  72 ++
 drivers/gpu/drm/i915/gt/intel_rps.h                |   3 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 502 ++++++++++--
 drivers/gpu/drm/i915/gt/mock_engine.c              |  38 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |  35 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  20 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |   1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  30 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h         |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  13 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        | 155 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |  13 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 290 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   2 +
 drivers/gpu/drm/i915/gvt/gtt.c                     |  12 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   1 +
 drivers/gpu/drm/i915/i915_drv.c                    |  18 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  83 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              | 233 ++++--
 drivers/gpu/drm/i915/i915_gpu_error.h              |   4 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  26 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  18 +-
 drivers/gpu/drm/i915/i915_reg.h                    | 156 +++-
 drivers/gpu/drm/i915/i915_request.c                |  69 +-
 drivers/gpu/drm/i915/i915_request.h                |  20 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |  62 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |  76 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |  28 +-
 drivers/gpu/drm/i915/i915_sw_fence.h               |  23 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |   2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |  19 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  98 ++-
 drivers/gpu/drm/i915/i915_vma.h                    |   9 +-
 drivers/gpu/drm/i915/i915_vma_snapshot.c           | 134 ++++
 drivers/gpu/drm/i915/i915_vma_snapshot.h           | 112 +++
 drivers/gpu/drm/i915/i915_vma_types.h              |   1 -
 drivers/gpu/drm/i915/intel_device_info.c           |  33 +-
 drivers/gpu/drm/i915/intel_device_info.h           |  12 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |  26 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   9 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  39 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |  50 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |   7 +-
 drivers/gpu/drm/i915/intel_step.c                  |  77 +-
 drivers/gpu/drm/i915/intel_step.h                  |   3 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  17 +-
 drivers/gpu/drm/i915/intel_uncore.h                |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |  37 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h            |  19 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |  19 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |  14 +-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c     |   2 +-
 drivers/gpu/drm/i915/selftests/igt_reset.c         |   2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   8 +-
 drivers/gpu/drm/i915/selftests/lib_sw_fence.c      |   8 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   4 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |  19 +-
 114 files changed, 4609 insertions(+), 1397 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h
