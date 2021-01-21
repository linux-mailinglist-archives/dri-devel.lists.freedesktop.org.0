Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144F2FEE08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7706E0DB;
	Thu, 21 Jan 2021 15:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9556E0D0;
 Thu, 21 Jan 2021 15:07:55 +0000 (UTC)
IronPort-SDR: 32SDO6rhRnWHaYJjdN/13By42s/I6X405IT3f/ryNN+fzrzZDiIa3BgRP4rkoKlRpTc0QYm01l
 RBjmRS1L00vg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="243355148"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="243355148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 07:07:54 -0800
IronPort-SDR: SsbHI5J+g4AYIJUe85qEYF7T6rs6S8fPtNcswe1wnmZxCs8yb4ps1K9XlyRpCAcx6h2/BMR0vV
 ALSRkDQ1eZyQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="427387482"
Received: from declanmu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.25])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 07:07:50 -0800
Date: Thu, 21 Jan 2021 17:07:47 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <20210121150747.GA58732@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here is the final PR for v5.12.

One more fix for the clear residuals security mitigation.

Per-engine reset for Gen7 to avoid collateral damage when some
workloads misbehave, flip priority boosting when using explicit
fences (sync_file), improving suspend/freeze speed and avoiding
casual eviction of used framebuffers.

The rest is usual refactoring, cleanup and prep for upcoming
features.

Regards, Joonas

PS. There will be one warning due to duplicate Fixes: line (one pointing
to drm-intel-gt-next and other to drm-intel-fixes).

dim: ace44e13e577 ("drm/i915/gt: Clear CACHE_MODE prior to clearing residuals"): Fixes: SHA1 in not pointing at an ancestor:
dim:     09aa9e45863e ("drm/i915/gt: Restore clear-residual mitigations for Ivybridge, Baytrail")

I think it's fine to add in advance, assuming the -fixes has been pulled,
to avoid missing such patch. Otherwise the chance is that the tooling
misses picking the Fixes for Fixes which has happened in past.

***

drm-intel-gt-next-2021-01-21-1:

Cross-subsystem Changes:

- Includes gvt-gt-next-2021-01-18 + header check fix for GVT

Driver Changes:

- Fix for #2955: Clear potentially malicious register state before
  executing clear residuals security mitigation (Chris)
- Fixes that lead to marking per-engine-reset as supported on Gen7
  (Chris)
- Remove per-client stats from debugfs/i915_gem_objects) (Tvrtko, Chris)
- Add arbitration check before semaphore wait (Chris)
- Apply interactive priority to explicit flip fences (Chris)
- Make GEM errors non-fatal by default to help capturing logs during
  development (Chris)
- Fix object page offset within a region in error capture (CQ, Matt A)
- Close race between enable_breadcrumbs and cancel_breadcrumbs (Chris)
- Almagamate clflushes on suspend/freeze to speed up S/R (Chris)
- Protect used framebuffers from casual eviction (Chris)

- Fix the sgt.pfn sanity check (Kui, Matt A)
- Reduce locking around i915_request.lock and ctx->engines_mutex (Chris)
- Simplify tracking for engine->fw_active and stats.active (Chris)
- Constrain pool objects by mapping type (Chris, Matt A)
- Use shrinkable status for unknown swizzle quirks (Chris)
- Do not suspend bonded requests if one hangs (Chris)
- Restore "Skip over completed active execlists" optimization (Chris)

- Move stolen node into GEM object union (Chris)
. Split gem_create into own file (Matt A)
- Convert object_create into object_init in LMEM region code (Matt A)
- Reduce test_and_set_bit to set_bit in i915_request_submit() (Chris)
- Mark up protected uses of 'i915_request_completed' (Chris)
- Remove extraneous inline modifiers (Chris)
- Add function to define defaults for GuC/HuC enable (John)

- Improve code locality by moving closer to single user (Matt A, Chris)
- Compiler warning fixes (Matt A, Chris)
- Selftest / CI improvements (Chris)

The following changes since commit fb5cfcaa2efbb4c71abb1dfbc8f4da727e0bfd89:

  Merge tag 'drm-intel-gt-next-2021-01-14' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-01-15 15:03:36 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-01-21-1

for you to fetch changes up to 69b4b99842201bc24c98ba66b922d8879e190483:

  drm/i915/gvt: Add missing forward decl of intel_vgpu for HDRTEST (2021-01-21 15:51:21 +0200)

----------------------------------------------------------------
Cross-subsystem Changes:

- Includes gvt-gt-next-2021-01-18 + header check fix for GVT

Driver Changes:

- Fix for #2955: Clear potentially malicious register state before
  executing clear residuals security mitigation (Chris)
- Fixes that lead to marking per-engine-reset as supported on Gen7
  (Chris)
- Remove per-client stats from debugfs/i915_gem_objects) (Tvrtko, Chris)
- Add arbitration check before semaphore wait (Chris)
- Apply interactive priority to explicit flip fences (Chris)
- Make GEM errors non-fatal by default to help capturing logs during
  development (Chris)
- Fix object page offset within a region in error capture (CQ, Matt A)
- Close race between enable_breadcrumbs and cancel_breadcrumbs (Chris)
- Almagamate clflushes on suspend/freeze to speed up S/R (Chris)
- Protect used framebuffers from casual eviction (Chris)

- Fix the sgt.pfn sanity check (Kui, Matt A)
- Reduce locking around i915_request.lock and ctx->engines_mutex (Chris)
- Simplify tracking for engine->fw_active and stats.active (Chris)
- Constrain pool objects by mapping type (Chris, Matt A)
- Use shrinkable status for unknown swizzle quirks (Chris)
- Do not suspend bonded requests if one hangs (Chris)
- Restore "Skip over completed active execlists" optimization (Chris)

- Move stolen node into GEM object union (Chris)
. Split gem_create into own file (Matt A)
- Convert object_create into object_init in LMEM region code (Matt A)
- Reduce test_and_set_bit to set_bit in i915_request_submit() (Chris)
- Mark up protected uses of 'i915_request_completed' (Chris)
- Remove extraneous inline modifiers (Chris)
- Add function to define defaults for GuC/HuC enable (John)

- Improve code locality by moving closer to single user (Matt A, Chris)
- Compiler warning fixes (Matt A, Chris)
- Selftest / CI improvements (Chris)

----------------------------------------------------------------
CQ Tang (1):
      drm/i915/error: Fix object page offset within a region

Chris Wilson (34):
      drm/i915/gt: Reapply ppgtt enabling after engine resets
      drm/i915/gt: Prune 'inline' from execlists
      drm/i915/gt: Prune inlines
      drm/i915: Mark up protected uses of 'i915_request_completed'
      drm/i915: Drop i915_request.lock serialisation around await_start
      drm/i915/gem: Reduce ctx->engine_mutex for reading the clone source
      drm/i915/gem: Reduce ctx->engines_mutex for get_engines()
      drm/i915: Reduce test_and_set_bit to set_bit in i915_request_submit()
      drm/i915/gt: Drop atomic for engine->fw_active tracking
      drm/i915/gt: Extract busy-stats for ring-scheduler
      drm/i915/gt: Convert stats.active to plain unsigned int
      drm/i915/gt: Clear CACHE_MODE prior to clearing residuals
      drm/i915/gt: Add arbitration check before semaphore wait
      drm/i915: Add DEBUG_GEM to the recommended CI config
      drm/i915: Make GEM errors non-fatal by default
      drm/i915/gt: One more flush for Baytrail clear residuals
      drm/i915/selftests: Prepare the selftests for engine resets with ring submission
      drm/i915/gt: Lift stop_ring() to reset_prepare
      drm/i915/gt: Disable the ring before resetting HEAD/TAIL
      drm/i915/gt: Pull ring submission resume under its caller forcewake
      drm/i915: Mark per-engine-reset as supported on gen7
      drm/i915/gem: Remove per-client stats from debugfs/i915_gem_objects
      drm/i915/gem: Make i915_gem_object_flush_write_domain() static
      drm/i915/display: Apply interactive priority to explicit flip fences
      drm/i915/gt: Close race between enable_breadcrumbs and cancel_breadcrumbs
      drm/i915/gem: Almagamate clflushes on suspend
      drm/i915/gem: Almagamate clflushes on freeze
      drm/i915/gem: Move stolen node into GEM object union
      drm/i915/gem: Use shrinkable status for unknown swizzle quirks
      drm/i915/gem: Protect used framebuffers from casual eviction
      drm/i915/gem: Drop lru bumping on display unpinning
      drm/i915/gt: Do not suspend bonded requests if one hangs
      drm/i915/gt: Skip over completed active execlists, again
      drm/i915/gvt: Add missing forward decl of intel_vgpu for HDRTEST

John Harrison (1):
      drm/i915/uc: Add function to define defaults for GuC/HuC enable

Joonas Lahtinen (2):
      Merge drm/drm-next into drm-intel-gt-next
      Merge tag 'gvt-gt-next-2021-01-18' of https://github.com/intel/gvt-linux into drm-intel-gt-next

Kui Wen (1):
      drm/i915: Fix the sgt.pfn sanity check

Matthew Auld (7):
      drm/i915/gem: split gem_create into own file
      drm/i915/gem: sanity check object size in gem_create
      drm/i915/region: convert object_create into object_init
      drm/i915: add back static declaration
      drm/i915: move i915_map_type into i915_gem_object_types.h
      drm/i915/pool: constrain pool objects by mapping type
      drm/i915/region: don't leak the object on error

Yan Zhao (11):
      drm/i915/gvt: parse init context to update cmd accessible reg whitelist
      drm/i915/gvt: scan VM ctx pages
      drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
      drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
      drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
      drm/i915/gvt: export find_mmio_info
      drm/i915/gvt: make width of mmio_attribute bigger
      drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
      drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
      drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
      drm/i915/gvt: unify lri cmd handler and mmio handlers

 drivers/gpu/drm/i915/Kconfig.debug                 |  22 +-
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_display.c       |  23 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   4 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  65 ++--
 drivers/gpu/drm/i915/gem/i915_gem_create.c         | 113 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         | 104 +++----
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  47 ---
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  36 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |  41 +--
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  28 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  70 ++---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  46 ++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  15 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |  23 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  13 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  13 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  16 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  12 +-
 drivers/gpu/drm/i915/gt/intel_engine_stats.h       |  60 ++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   6 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   | 145 ++++-----
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.h     |   3 +-
 .../gpu/drm/i915/gt/intel_gt_buffer_pool_types.h   |   4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   4 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   5 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    | 209 ++++++-------
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  18 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |  11 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  31 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   7 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              | 335 ++++++++++++++++-----
 drivers/gpu/drm/i915/gvt/cmd_parser.h              |   5 +
 drivers/gpu/drm/i915/gvt/gvt.h                     |  37 ++-
 drivers/gpu/drm/i915/gvt/handlers.c                |  15 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |   3 +
 drivers/gpu/drm/i915/gvt/reg.h                     |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |  22 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   4 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                | 144 +--------
 drivers/gpu/drm/i915/i915_gem.c                    | 130 +-------
 drivers/gpu/drm/i915/i915_gem.h                    |   9 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |  13 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   4 +-
 drivers/gpu/drm/i915/i915_mm.c                     |   2 +-
 drivers/gpu/drm/i915/i915_params.h                 |   1 +
 drivers/gpu/drm/i915/i915_pci.c                    |   5 +-
 drivers/gpu/drm/i915/i915_request.c                |  43 +--
 drivers/gpu/drm/i915/i915_scheduler.c              |   2 +-
 drivers/gpu/drm/i915/i915_vma.h                    |  15 +
 drivers/gpu/drm/i915/i915_vma_types.h              |   3 +
 drivers/gpu/drm/i915/intel_memory_region.h         |   8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |  10 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |  19 +-
 78 files changed, 1191 insertions(+), 997 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_create.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_engine_stats.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
