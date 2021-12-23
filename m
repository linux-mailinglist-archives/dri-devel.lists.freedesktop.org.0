Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6247E3B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 13:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D67610E38E;
	Thu, 23 Dec 2021 12:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DB310E38E;
 Thu, 23 Dec 2021 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640263678; x=1671799678;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TZCRjsX9YHISpjqMnnsfVd2/hs41nhVVaXYkzju/1u8=;
 b=I/Ez5a7Cd3xrlTta9xPEYDS4Aq54mNhULrD+oL8oYoWYeTDVYIJUi7Sf
 Dfh6lEueYj75AgvanWHHYGNBGCA/Ls0iOG4f+bTcwakQQPCXMRRs5vRDf
 vkgti4B+xPg0sdN8l53a0EVFqUfKE50+m2rDPlXHM9oqlAhSQgrxZQ2wr
 iNlBIylNAPXVCNEq+Mww2ldqbqMMfTIsBD0YfV3mWFmo3U+S7bHW7fuTU
 29d8Y78yacNly6VTY0+OTh6hqHYtzyolKlL0nXMvtHFhW/6isvPPmpOyh
 fg7ODMN119oXdh765nQDZ2258ENcl8qfP4gqCOInqBPK8FytnTbj9H8OS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="327131767"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="327131767"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:47:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="617479777"
Received: from bylee-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.213.175.220])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 04:47:55 -0800
Date: Thu, 23 Dec 2021 12:47:51 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YcRvKO5cyPvIxVCi@tursulin-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Here goes the final PR towards 5.17.

Effectively two largest logical items in this pull request are bugfixes, mainly
in the GuC submission backend, and continuation of the locking refactoring being
done to make both VMA and backing store handling use dma_resv locking. This is
now using the dma_resv locking in areas like the shrinker and freeing of
the object backing store.

From the smaller items we have a couple of performance optimisation regarding
access to GuC log and speed of firmware loading, sanity checking of memory
regions on driver load, plus option to do a full test via a modparam
(i915.memtest=1), and some prep work for future platforms like DG2 and XeHP SDV.

Regards,

Tvrtko

***

drm-intel-gt-next-2021-12-23:

Driver Changes:

- Added bits of DG2 support around page table handling (Stuart Summers, Matthew Auld)
- Fixed wakeref leak in PMU busyness during reset in GuC mode (Umesh Nerlige Ramappa)
- Fixed debugfs access crash if GuC failed to load (John Harrison)
- Bring back GuC error log to error capture, undoing accidental earlier breakage (Thomas Hellström)
- Fixed memory leak in error capture caused by earlier refactoring (Thomas Hellström)
- Exclude reserved stolen from driver use (Chris Wilson)
- Add memory region sanity checking and optional full test (Chris Wilson)
- Fixed buffer size truncation in TTM shmemfs backend (Robert Beckett)
- Use correct lock and don't overwrite internal data structures when stealing GuC context ids (Matthew Brost)
- Don't hog IRQs when destroying GuC contexts (John Harrison)
- Make GuC to Host communication more robust (Matthew Brost)
- Continuation of locking refactoring around VMA and backing store handling (Maarten Lankhorst)
- Improve performance of reading GuC log from debugfs (John Harrison)
- Log when GuC fails to reset an engine (John Harrison)
- Speed up GuC/HuC firmware loading by requesting RP0 (Vinay Belgaumkar)
- Further work on asynchronous VMA unbinding (Thomas Hellström, Christian König)

- Refactor GuC/HuC firmware handling to prepare for future platforms (John Harrison)
- Prepare for future different GuC/HuC firmware signing key sizes (Daniele Ceraolo Spurio, Michal Wajdeczko)
- Add noreclaim annotations (Matthew Auld)
- Remove racey GEM_BUG_ON between GPU reset and GuC communication handling (Matthew Brost)
- Refactor i915->gt with to_gt(i915) to prepare for future platforms (Michał Winiarski, Andi Shyti)
- Increase GuC log size for CONFIG_DEBUG_GEM (John Harrison)

- Fixed engine busyness in selftests when in GuC mode (Umesh Nerlige Ramappa)
- Make engine parking work with PREEMPT_RT (Sebastian Andrzej Siewior)
- Replace X86_FEATURE_PAT with pat_enabled() (Lucas De Marchi)
- Selftest for stealing of guc ids (Matthew Brost)
The following changes since commit 20cddfcc82e642e4682c48af91f0702fbbd623a0:

  drm/i915/gt: Use hw_engine_masks as reset_domains (2021-12-08 18:27:05 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-12-23

for you to fetch changes up to 6cb12fbda1c2e2fcb6d3adfe01f18eef6812e278:

  drm/i915: Use trylock instead of blocking lock for __i915_gem_free_objects. (2021-12-23 12:30:27 +0100)

----------------------------------------------------------------
Driver Changes:

- Added bits of DG2 support around page table handling (Stuart Summers, Matthew Auld)
- Fixed wakeref leak in PMU busyness during reset in GuC mode (Umesh Nerlige Ramappa)
- Fixed debugfs access crash if GuC failed to load (John Harrison)
- Bring back GuC error log to error capture, undoing accidental earlier breakage (Thomas Hellström)
- Fixed memory leak in error capture caused by earlier refactoring (Thomas Hellström)
- Exclude reserved stolen from driver use (Chris Wilson)
- Add memory region sanity checking and optional full test (Chris Wilson)
- Fixed buffer size truncation in TTM shmemfs backend (Robert Beckett)
- Use correct lock and don't overwrite internal data structures when stealing GuC context ids (Matthew Brost)
- Don't hog IRQs when destroying GuC contexts (John Harrison)
- Make GuC to Host communication more robust (Matthew Brost)
- Continuation of locking refactoring around VMA and backing store handling (Maarten Lankhorst)
- Improve performance of reading GuC log from debugfs (John Harrison)
- Log when GuC fails to reset an engine (John Harrison)
- Speed up GuC/HuC firmware loading by requesting RP0 (Vinay Belgaumkar)
- Further work on asynchronous VMA unbinding (Thomas Hellström, Christian König)

- Refactor GuC/HuC firmware handling to prepare for future platforms (John Harrison)
- Prepare for future different GuC/HuC firmware signing key sizes (Daniele Ceraolo Spurio, Michal Wajdeczko)
- Add noreclaim annotations (Matthew Auld)
- Remove racey GEM_BUG_ON between GPU reset and GuC communication handling (Matthew Brost)
- Refactor i915->gt with to_gt(i915) to prepare for future platforms (Michał Winiarski, Andi Shyti)
- Increase GuC log size for CONFIG_DEBUG_GEM (John Harrison)

- Fixed engine busyness in selftests when in GuC mode (Umesh Nerlige Ramappa)
- Make engine parking work with PREEMPT_RT (Sebastian Andrzej Siewior)
- Replace X86_FEATURE_PAT with pat_enabled() (Lucas De Marchi)
- Selftest for stealing of guc ids (Matthew Brost)

----------------------------------------------------------------
Andi Shyti (3):
      drm/i915/selftests: Use to_gt() helper
      drm/i915/pxp: Use to_gt() helper
      drm/i915: Rename i915->gt to i915->gt0

Chris Wilson (3):
      drm/i915: Exclude reserved stolen from driver use
      drm/i915: Sanitycheck device iomem on probe
      drm/i915: Test all device memory on probing

Christian König (1):
      drm/i915: remove questionable fence optimization during copy

Daniele Ceraolo Spurio (2):
      drm/i915/uc: correctly track uc_fw init failure
      drm/i915/guc: support bigger RSA keys

John Harrison (6):
      drm/i915/uc: Allow platforms to have GuC but not HuC
      drm/i915/guc: Don't go bang in GuC log if no GuC
      drm/i915/guc: Don't hog IRQs when destroying contexts
      drm/i915/guc: Speed up GuC log dumps
      drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
      drm/i915/guc: Flag an error if an engine reset fails

Lucas De Marchi (1):
      drm/i915: replace X86_FEATURE_PAT with pat_enabled()

Maarten Lankhorst (11):
      drm/i915: Remove unused bits of i915_vma/active api
      drm/i915: Change shrink ordering to use locking around unbinding.
      drm/i915: Remove pages_mutex and intel_gtt->vma_ops.set/clear_pages members, v3.
      drm/i915: Take object lock in i915_ggtt_pin if ww is not set
      drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww, v2.
      drm/i915: Ensure gem_contexts selftests work with unbind changes, v2.
      drm/i915: Ensure i915_vma tests do not get -ENOSPC with the locking changes.
      drm/i915: Trylock the object when shrinking
      drm/i915: Require object lock when freeing pages during destruction
      drm/i915: Add ww ctx to i915_gem_object_trylock
      drm/i915: Use trylock instead of blocking lock for __i915_gem_free_objects.

Matthew Auld (4):
      drm/i915/xehpsdv: set min page-size to 64K
      drm/i915/gtt/xehpsdv: move scratch page to system memory
      drm/i915: enforce min page size for scratch
      drm/i915/debugfs: add noreclaim annotations

Matthew Brost (6):
      drm/i915/guc: Use correct context lock when callig clr_context_registered
      drm/i915/guc: Only assign guc_id.id when stealing guc_id
      drm/i915/guc: Remove racey GEM_BUG_ON
      drm/i915/guc: Add extra debug on CT deadlock
      drm/i915/guc: Kick G2H tasklet if no credits
      drm/i915/guc: Selftest for stealing of guc ids

Michal Wajdeczko (1):
      drm/i915/uc: Prepare for different firmware key sizes

Michał Winiarski (7):
      drm/i915: Store backpointer to GT in uncore
      drm/i915: Introduce to_gt() helper
      drm/i915/display: Use to_gt() helper
      drm/i915/gt: Use to_gt() helper
      drm/i915/gem: Use to_gt() helper
      drm/i915/gvt: Use to_gt() helper
      drm/i915: Use to_gt() helper

Robert Beckett (1):
      drm/i915/ttm: fix large buffer population trucation

Sebastian Andrzej Siewior (1):
      drm/i915: Don't disable interrupts and pretend a lock as been acquired in __timeline_mark_lock().

Stuart Summers (1):
      drm/i915: Add has_64k_pages flag

Thomas Hellström (5):
      drm/i915: Fix coredump of perma-pinned vmas
      drm/i915: Don't leak the capture list items
      drm/i915: Avoid using the i915_fence_array when collecting dependencies
      drm/i915: Break out the i915_deps utility
      drm/i915: Require the vm mutex for i915_vma_bind()

Umesh Nerlige Ramappa (2):
      drm/i915/pmu: Wait longer for busyness data to be available from GuC
      drm/i915/pmu: Fix wakeref leak in PMU busyness during reset

Vinay Belgaumkar (1):
      drm/i915/guc: Request RP0 before loading firmware

 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  22 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  54 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  46 ++-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  11 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       | 333 ++-------------
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   4 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  69 ++--
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  26 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  16 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  23 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   3 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  40 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               | 353 +---------------
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  11 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |  21 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  27 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   9 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  24 +-
 drivers/gpu/drm/i915/gt/intel_migrate.h            |   9 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |  12 -
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  71 +++-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   2 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |  12 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   2 +-
 drivers/gpu/drm/i915/gt/selftest_engine.c          |   2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   4 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   4 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   6 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   8 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |   6 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   2 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   4 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |   6 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   6 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  12 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  33 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |  62 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  85 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  75 +---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   9 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 188 +++++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  18 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          | 175 +++++++-
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |   2 +-
 drivers/gpu/drm/i915/gvt/gvt.c                     |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   2 +-
 drivers/gpu/drm/i915/i915_active.c                 |  28 +-
 drivers/gpu/drm/i915/i915_active.h                 |  17 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  41 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   4 +-
 drivers/gpu/drm/i915/i915_deps.c                   | 237 +++++++++++
 drivers/gpu/drm/i915/i915_deps.h                   |  45 ++
 drivers/gpu/drm/i915/i915_drv.c                    |  31 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  28 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  46 ++-
 drivers/gpu/drm/i915/i915_getparam.c               |  10 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  13 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  56 +--
 drivers/gpu/drm/i915/i915_params.c                 |   3 +
 drivers/gpu/drm/i915/i915_params.h                 |   1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   2 +
 drivers/gpu/drm/i915/i915_perf.c                   |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  14 +-
 drivers/gpu/drm/i915/i915_query.c                  |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   4 +
 drivers/gpu/drm/i915/i915_request.c                |  23 ++
 drivers/gpu/drm/i915/i915_request.h                |   5 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |  22 +-
 drivers/gpu/drm/i915/i915_vma.c                    | 459 ++++++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h                    |   5 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |   1 -
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_gvt.c                   |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.c         | 128 ++++++
 drivers/gpu/drm/i915/intel_uncore.c                |   9 +-
 drivers/gpu/drm/i915/intel_uncore.h                |   3 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   4 +-
 drivers/gpu/drm/i915/selftests/i915_active.c       |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |   6 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  18 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  10 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |   4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |  17 +-
 drivers/gpu/drm/i915/selftests/igt_flush_test.c    |   2 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |   4 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   4 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  32 +-
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |  12 +-
 drivers/gpu/drm/i915/selftests/mock_uncore.c       |   2 +-
 125 files changed, 2058 insertions(+), 1371 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_deps.c
 create mode 100644 drivers/gpu/drm/i915/i915_deps.h
