Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81193617843
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16510E5B5;
	Thu,  3 Nov 2022 08:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EAE10E0A3;
 Thu,  3 Nov 2022 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667462622; x=1698998622;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=/BVOA7sTf8y/ibGTvRDSxdg/byS+uONMQysYuwwaac4=;
 b=B4ZrbqprGhsyfDRWEEJSgelgqm4QVyixLizO0+4g3z8+HpfsaKHYdFMf
 RvdUTgRcHskclGqcBPlMTsk4yvtFEc2zJheWZ8r3XWlRqWv43M2RcbUCn
 nvb2Ot9K7A4GMEui9eLvXSIMxaJMgGFd3dGBBVZ8CtGRDkfwDXIWpT9mf
 ELoxynSMALLQSTa8wuOYde/UDnrp8mf1rh9p2Wb3xT9Y60Ho+kVRSzJFe
 1DUtA/2GgT7RzmT840oYFRnUmbnlu9gHWcWYcpJoZG8eHjJ7exHn0YVs2
 W82TGWpCpds9T/V8zsxCq8OUn//TSflWa4Np1nlwzCp+ijpzuAzd9Ia5s w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="371715197"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="371715197"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 01:03:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="667879132"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="667879132"
Received: from dbyrne3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.13.192])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 01:03:38 -0700
Date: Thu, 3 Nov 2022 10:03:35 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <Y2N11wu175p6qeEN@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

This amends the previous PR that did cause a build error with clang:

https://lists.freedesktop.org/archives/dri-devel/2022-October/377713.html

Quite naturally, it includes a fix to the hwmon code tested with Clang
version 14.0.5 and GCC 12.2.1.

Additionally there is a screen flickering fix for DG2 (#7306) abd one more
DG2 W/A. Eliminating spurious WARN on DG1.

Dust up Gen2-Gen5 machines to apply and test the latest CS timestamping
fixes for from Ville (archeologist, neutral, human).

Then a few more smaller cleanups and selftest additions.

Regards, Joonas

***

drm-intel-gt-next-2022-11-03:

Driver Changes:

- Fix for #7306: [Arc A380] white flickering when using arc as a
  secondary gpu (Matt A)
- Add Wa_18017747507 for DG2 (Wayne)
- Avoid spurious WARN on DG1 due to incorrect cache_dirty flag
  (Niranjana, Matt A)
- Corrections to CS timestamp support for Gen5 and earlier (Ville)

- Fix a build error used with clang compiler on hwmon (GG)
- Improvements to LMEM handling with RPM (Anshuman, Matt A)
- Cleanups in dmabuf code (Mike)

- Selftest improvements (Matt A)

The following changes since commit 7860d720a84c74b2761c6b7995392a798ab0a3cb:

  drm/msm: Fix build break with recent mm tree (2022-09-30 10:13:49 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-11-03

for you to fetch changes up to 8f956e9a2c9bdb22ac50c8b7656e2ea29c2e656c:

  drm/i915/hwmon: Fix a build error used with clang compiler (2022-11-03 09:34:22 +0200)

----------------------------------------------------------------
Driver Changes:

- Fix for #7306: [Arc A380] white flickering when using arc as a
  secondary gpu (Matt A)
- Add Wa_18017747507 for DG2 (Wayne)
- Avoid spurious WARN on DG1 due to incorrect cache_dirty flag
  (Niranjana, Matt A)
- Corrections to CS timestamp support for Gen5 and earlier (Ville)

- Fix a build error used with clang compiler on hwmon (GG)
- Improvements to LMEM handling with RPM (Anshuman, Matt A)
- Cleanups in dmabuf code (Mike)

- Selftest improvements (Matt A)

----------------------------------------------------------------
Alan Previn (4):
      drm/i915/guc: Add error-capture init warnings when needed
      drm/i915/guc: Add compute reglist for guc err capture
      drm/i915/guc: Fix GuC error capture sizing estimation and reporting
      drm/i915/guc: Remove intel_context:number_committed_requests counter

Andi Shyti (1):
      drm/i915/trace: Remove unused frequency trace

Andrzej Hajda (2):
      drm/i915: use intel_uncore_rmw when appropriate
      drm/i915/gt: use intel_uncore_rmw when appropriate

Anshuman Gupta (2):
      drm/i915: Encapsulate lmem rpm stuff in intel_runtime_pm
      drm/i915/dgfx: Grab wakeref at i915_ttm_unmap_virtual

Aravind Iddamsetty (1):
      drm/i915/mtl: enable local stolen memory

Ashutosh Dixit (5):
      drm/i915/mtl: PERF_LIMIT_REASONS changes for MTL
      drm/i915/rps: Freq caps for MTL
      drm/i915: Perf_limit_reasons are only available for Gen11+
      drm/i915/hwmon: Expose card reactive critical power
      drm/i915/hwmon: Expose power1_max_interval

Chris Wilson (6):
      drm/i915/gt: Cleanup partial engine discovery failures
      drm/i915/gem: Really move i915_gem_context.link under ref protection
      drm/i915/gt: Restrict forced preemption to the active context
      drm/i915/gt: Use i915_vm_put on ppgtt_create error paths
      drm/i915/gt: Move scratch page into system memory on all platforms
      drm/i915/gt: Bump the reset-failure timeout to 60s

Colin Ian King (2):
      drm/i915/gem: remove redundant assignments to variable ret
      drm/i915/perf: remove redundant variable 'taken'

Dale B Stimson (4):
      drm/i915/hwmon: Add HWMON infrastructure
      drm/i915/hwmon: Power PL1 limit and TDP setting
      drm/i915/hwmon: Show device level energy usage
      drm/i915/hwmon: Extend power/energy for XEHPSDV

Daniele Ceraolo Spurio (7):
      drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
      drm/i915/dg2: setup HuC loading via GSC
      drm/i915/huc: track delayed HuC load with a fence
      drm/i915/huc: stall media submission until HuC is loaded
      drm/i915/huc: better define HuC status getparam possible return values.
      drm/i915/huc: define gsc-compatible HuC fw for DG2
      drm/i915/huc: bump timeout for delayed load and reduce print verbosity

Gustavo Sousa (1):
      drm/i915/xelp: Add Wa_1806527549

Gwan-gyeong Mun (2):
      drm/i915/gt: Remove unused function prototype
      drm/i915/hwmon: Fix a build error used with clang compiler

Jani Nikula (1):
      drm/i915: move i915_coherent_map_type() to i915_gem_pages.c and un-inline

Janusz Krzysztofik (1):
      drm/i915/gem: Flush contexts on driver release

John Harrison (6):
      drm/i915/guc: Fix release build bug in 'remove log size module parameters'
      drm/i915/guc: Enable compute scheduling on DG2
      drm/i915/guc: Limit scheduling properties to avoid overflow
      drm/i915: Fix compute pre-emption w/a to apply to compute engines
      drm/i915: Make the heartbeat play nice with long pre-emption timeouts
      drm/i915: Improve long running compute w/a for GuC submission

Karolina Drobnik (1):
      i915/i915_gem_context: Remove debug message in i915_gem_context_create_ioctl

Lionel Landwerlin (1):
      drm/i915/perf: complete programming whitelisting for XEHPSDV

Lucas De Marchi (7):
      drm/i915: Add missing mask when reading GEN12_DSMBASE
      drm/i915: Split i915_gem_init_stolen()
      drm/i915/dgfx: Make failure to setup stolen non-fatal
      drm/i915: Noop lrc_init_wa_ctx() on recent/future platforms
      drm/i915: Fix __gen125_emit_bb_start() without WA
      drm/i915/gt: Document function to decode register state context
      drm/i915/gt: Fix platform prefix

Matt Atwood (1):
      drm/i915/dg2: introduce Wa_22015475538

Matt Roper (21):
      drm/i915/mtl: Add MTL forcewake support
      drm/i915: Split GAM and MSLICE steering
      drm/i915/mtl: Define engine context layouts
      drm/i915: Document and future-proof preemption control policy
      drm/i915/gen8: Create separate reg definitions for new MCR registers
      drm/i915/xehp: Create separate reg definitions for new MCR registers
      drm/i915/gt: Drop a few unused register definitions
      drm/i915/gt: Correct prefix on a few registers
      drm/i915/gt: Add intel_gt_mcr_multicast_rmw() operation
      drm/i915/xehp: Check for faults on primary GAM
      drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()
      drm/i915: Define MCR registers explicitly
      drm/i915/gt: Always use MCR functions on multicast registers
      drm/i915/guc: Handle save/restore of MCR registers explicitly
      drm/i915/gt: Add MCR-specific workaround initializers
      drm/i915: Define multicast registers as a new type
      drm/i915/xelpg: Add multicast steering
      drm/i915/xelpmp: Add multicast steering for media GT
      drm/i915/pvc: Update forcewake domain for CCS register ranges
      drm/i915/xelpg: Fix write to MTL_MCR_SELECTOR
      drm/i915/mtl: Add missing steering table terminators

Matthew Auld (13):
      drm/i915/ttm: implement access_memory
      drm/i915: remove the TODO in pin_and_fence_fb_obj
      drm/i915/display: handle migration for dpt
      drm/i915: allow control over the flags when migrating
      drm/i915/display: consider DG2_RC_CCS_CC when migrating buffers
      drm/i915: check memory is mappable in read_from_page
      drm/i915: add back GEN12_BDSM_MASK
      drm/i915: restore stolen memory behaviour for DG2
      drm/i915: enable PS64 support for DG2
      drm/i915/uapi: expose GTT alignment
      Revert "drm/i915/uapi: expose GTT alignment"
      drm/i915/dmabuf: fix sg_table handling in map_dma_buf
      drm/i915/selftests: exercise GPU access from the importer

Matthew Brost (1):
      drm/i915/guc: Delay disabling guc_id scheduling for better hysteresis

Michael J. Ruhl (2):
      drm/i915/dmabuf: dmabuf cleanup
      drm/i915/dmabuf: Use scatterlist for_each_sg API

Nathan Chancellor (1):
      drm/i915: Fix CFI violations in gt_sysfs

Niranjana Vishwanathapura (2):
      drm/i915: Remove unwanted pointer unpacking
      drm/i915: Do not set cache_dirty for DGFX

Nirmoy Das (5):
      drm/i915: Do not cleanup obj with NULL bo->resource
      drm/i915: Improve debug print in vm_fault_ttm
      drm/i915: Fix a potential UAF at device unload
      drm/i915: remove excessive i915_gem_drain_freed_objects
      drm/i915: Refactor ttm ghost obj detection

Prathap Kumar Valsan (1):
      drm/i915/gt: Flush to global observation point before breadcrumb write

Riana Tauro (4):
      drm/i915/guc/slpc: Run SLPC selftests on all tiles
      drm/i915/selftests: Add helper function measure_power
      drm/i915/guc/slpc: Add SLPC selftest live_slpc_power
      drm/i915/hwmon: Add HWMON current voltage support

Robert Beckett (1):
      drm/i915: stop abusing swiotlb_max_segment

Tejas Upadhyay (1):
      drm/i915/ehl: Update MOCS table for EHL

Thomas Hellström (1):
      drm/i915: Fix display problems after resume

Tilak Tangudu (1):
      drm/i915/debugfs: Add perf_limit_reasons in debugfs

Tomas Winkler (5):
      mei: add support to GSC extended header
      mei: bus: enable sending gsc commands
      mei: adjust extended header kdocs
      mei: pxp: support matching with a gfx discrete card
      drm/i915/pxp: add huc authentication and loading command

Tvrtko Ursulin (7):
      drm/i915: Make GEM resume all engines
      drm/i915: Make GEM suspend all GTs
      drm/i915: Handle all GTs on driver (un)load paths
      drm/i915/selftests: Remove flush_scheduled_work() from live_execlists
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915/guc: Fix revocation of non-persistent contexts
      drm/i915/selftests: Stop using kthread_stop()

Umesh Nerlige Ramappa (14):
      drm/i915/perf: Fix OA filtering logic for GuC mode
      drm/i915/perf: Add 32-bit OAG and OAR formats for DG2
      drm/i915/perf: Fix noa wait predication for DG2
      drm/i915/perf: Determine gen12 oa ctx offset at runtime
      drm/i915/perf: Enable bytes per clock reporting in OA
      drm/i915/perf: Simply use stream->ctx
      drm/i915/perf: Move gt-specific data from i915->perf to gt->perf
      drm/i915/perf: Replace gt->perf.lock with stream->lock for file ops
      drm/i915/perf: Use gt-specific ggtt for OA and noa-wait buffers
      drm/i915/perf: Store a pointer to oa_format in oa_buffer
      drm/i915/perf: Add Wa_1508761755:dg2
      drm/i915/perf: Apply Wa_18013179988
      drm/i915/perf: Save/restore EU flex counters across reset
      drm/i915/perf: Enable OA for DG2

Ville Syrjälä (9):
      drm/i915: Extract intel_mmio_bar()
      drm/i915: Name our BARs based on the spec
      drm/i915: s/HAS_BAR2_SMEM_STOLEN/HAS_LMEMBAR_SMEM_STOLEN/
      drm/i915: Fix cs timestamp frequency for ctg/elk/ilk
      drm/i915: Stop claiming cs timestamp frquency on gen2/3
      drm/i915: Fix cs timestamp frequency for cl/bw
      drm/i915/selftests: Run MI_BB perf selftests on SNB
      drm/i915/selftests: Test RING_TIMESTAMP on gen4/5
      drm/i915/selftests: Run the perf MI_BB tests on gen4/5

Vinay Belgaumkar (5):
      drm/i915: Add a wrapper for frequency debugfs
      drm/i915/slpc: Update the frequency debugfs
      drm/i915/slpc: Optmize waitboost for SLPC
      drm/i915/slpc: Use platform limits for min/max frequency
      drm/i915/guc: Support OA when Wa_16011777198 is enabled

Vitaly Lubart (3):
      mei: bus: extend bus API to support command streamer API
      mei: pxp: add command streamer API to the PXP driver
      drm/i915/pxp: implement function for sending tee stream command

Wayne Boyer (1):
      drm/i915/dg2: Introduce Wa_18017747507

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |  75 +++
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/i915/Kconfig.profile               |  26 +-
 drivers/gpu/drm/i915/Makefile                      |  14 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  63 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  51 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   5 -
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  49 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   8 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  12 +
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |  35 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         | 261 +++++---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            | 120 +++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   5 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    | 157 ++++-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 118 ++--
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |  79 ++-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   1 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  55 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |  12 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  92 +--
 drivers/gpu/drm/i915/gt/intel_context.c            |   5 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |  11 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   9 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   6 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 113 +++-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |  39 ++
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  15 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  25 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  26 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   4 +
 drivers/gpu/drm/i915/gt/intel_gsc.c                |  23 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 | 141 +++-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |  38 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             | 305 ++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |  24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      | 196 ++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            | 181 +++--
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        | 480 +++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |  23 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  43 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 143 +++-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_migrate.c            |   1 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  20 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                | 265 +++++++-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   3 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 577 ++++++++++------
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |   9 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |  22 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  50 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |  36 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  51 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |   1 +
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  12 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            | 190 +++++-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   2 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |  25 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |   9 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |  16 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  71 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 119 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |  61 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  43 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        | 103 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 358 ++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             | 262 +++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |  31 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |  34 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h          |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  24 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   4 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |  14 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   8 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  30 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  52 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   3 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |  12 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  | 732 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h                  |  20 +
 drivers/gpu/drm/i915/i915_pci.c                    |   9 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 582 ++++++++++++----
 drivers/gpu/drm/i915/i915_perf.h                   |   2 +
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |   6 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |  47 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  22 +
 drivers/gpu/drm/i915/i915_reg_defs.h               |  27 +-
 drivers/gpu/drm/i915/i915_request.c                |  24 +
 drivers/gpu/drm/i915/i915_request.h                |   5 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |  34 +-
 drivers/gpu/drm/i915/i915_selftest.h               |   2 +
 drivers/gpu/drm/i915/i915_trace.h                  |  15 -
 drivers/gpu/drm/i915/i915_vma.c                    |   9 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   3 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   2 +-
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |  21 +
 drivers/gpu/drm/i915/intel_pci_config.h            |  28 +-
 drivers/gpu/drm/i915/intel_pm.c                    | 205 +++---
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   5 +
 drivers/gpu/drm/i915/intel_runtime_pm.h            |  22 +
 drivers/gpu/drm/i915/intel_uncore.c                | 280 +++++++-
 drivers/gpu/drm/i915/intel_uncore.h                |   2 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  32 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |  32 -
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |  69 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h           |  13 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h           |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |  11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           | 139 +++-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h           |   5 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h |  23 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |   6 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  10 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |  16 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      | 252 ++++---
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   4 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   1 -
 drivers/misc/mei/bus.c                             | 146 +++-
 drivers/misc/mei/client.c                          |  55 +-
 drivers/misc/mei/hbm.c                             |  13 +
 drivers/misc/mei/hw-me.c                           |   7 +-
 drivers/misc/mei/hw.h                              |  89 ++-
 drivers/misc/mei/interrupt.c                       |  47 +-
 drivers/misc/mei/mei_dev.h                         |   8 +
 drivers/misc/mei/pxp/mei_pxp.c                     |  38 +-
 include/drm/i915_pxp_tee_interface.h               |   5 +
 include/linux/mei_cl_bus.h                         |   6 +
 include/uapi/drm/i915_drm.h                        |  62 +-
 153 files changed, 6868 insertions(+), 2117 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
