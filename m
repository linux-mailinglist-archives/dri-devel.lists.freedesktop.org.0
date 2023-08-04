Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EB76FC3E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209310E6C5;
	Fri,  4 Aug 2023 08:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82010E6C2;
 Fri,  4 Aug 2023 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691138718; x=1722674718;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=QUYHrQ5cywXRdPaODCJidIlLaIXsoSlbQGR+ALoABP4=;
 b=WUBy3gwVMX8oKzOpSyv36BSqz/K4pTWWUS7joqlemnQ4QO/1TrKb+6AV
 sIiPwY49C7CZ0+0jemHvtCZ4wHSC5td5OeZLX+vDJ2TBlLV9CkklSayvW
 OU4IY4hy3JImBvXYByOtZwW0XI0clex95mPkzKuvZG655YsRXJzeSk5u+
 1lb0EUxDKvzUU/OG27Yd9yWWPG50jrvbZ4TxWIvsCW+AJGJ3nsMkQdjMp
 IeTzaMSnWWH63ki83dQy4vUHinVgLdddTb8NMT1ta6v8INp4240Y/1uur
 q/pjKI0vzEfJH3iYBBYu+c0H7onM1ZzGtvHG9GNLhJFyBQcy46IYd3jDU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373754253"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="373754253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 01:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759508588"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="759508588"
Received: from reshmapa-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.0.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 01:45:07 -0700
Date: Fri, 4 Aug 2023 11:45:04 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZMy6kDd9npweR4uy@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes the first drm-intel-gt-next PR for v6.6.

We have a fix for infinite GPU wait race condition found by CI,
then improved tweakability of RPS algo and fixes to GuC SLPC for
tuning the frequency behavior of the system.

OA report zeroing fix, Aux CCS invalidation fix on Gen12 and
addition of missing W/A for TGL, RKL, DG1, DG2 and ADL.

Then some Meteorlake enabling patches and the usual amount of debugging
and code structure improvements, static checker fixes and fixes for
potential UAF and error handling paths.

Regards, Joonas

PS. Hoping to backmerge drm-next early next week to bring in some
drm-intel-gt-next dependencies before the final PR.

drm-intel-gt-next-2023-08-04:

Driver Changes:

- Avoid infinite GPU waits by avoiding premature release of request's
  reusable memory (Chris, Janusz)
- Expose RPS thresholds in sysfs (Tvrtko)
- Apply GuC SLPC min frequency softlimit correctly (Vinay)
- Restore SLPC efficient freq earlier (Vinay)
- Consider OA buffer boundary when zeroing out reports (Umesh)
- Extend Wa_14015795083 to TGL, RKL, DG1 and ADL (Matt R)
- Fix context workarounds with non-masked regs on MTL/DG2 (Lucas)
- Enable the CCS_FLUSH bit in the pipe control and in the CS for MTL+ (Andi)
- Update MTL workarounds 14018778641, 22016122933 (Tejas, Zhanjun)
- Ensure memory quiesced before AUX CCS invalidation (Jonathan)

- Add a gsc_info debugfs (Daniele)
- Invalidate the TLBs on each GT on multi-GT device (Chris)
- Fix a VMA UAF for multi-gt platform (Nirmoy)
- Do not use stolen on MTL due to HW bug (Nirmoy)
- Check HuC and GuC version compatibility on MTL (Daniele)
- Dump perf_limit_reasons for slow GuC init debug (Vinay)
- Replace kmap() with kmap_local_page() (Sumitra, Ira)
- Add sentinel to xehp_oa_b_counters for KASAN (Andrzej)
- Add the gen12_needs_ccs_aux_inv helper (Andi)
- Fixes and updates for GSC memory allocation (Daniele)
- Fix one wrong caching mode enum usage (Tvrtko)
- Fixes for GSC wakeref (Alan)

- Static checker fixes (Harshit, Arnd, Dan, Cristophe, David, Andi)
- Rename flags with bit_group_X according to the datasheet (Andi)
- Use direct alias for i915 in requests (Andrzej)
- Replace i915->gt0 with to_gt(i915) (Andi)
- Use the i915_vma_flush_writes helper (Tvrtko)
- Selftest improvements (Alan)
- Remove dead code (Tvrtko)

The following changes since commit 24335848e543dc95c9e2ffa0108d879ffefd0442:

  drm/i915/gsc: Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv() (2023-06-08 02:11:04 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-08-04

for you to fetch changes up to 28e671114fb0f28f334fac8d0a6b9c395c7b0498:

  drm/i915/guc/slpc: Restore efficient freq earlier (2023-08-02 11:08:02 -0700)

----------------------------------------------------------------
Driver Changes:

- Avoid infinite GPU waits by avoidin premature release of request's
  reusable memory (Chris, Janusz)
- Expose RPS thresholds in sysfs (Tvrtko)
- Apply GuC SLPC min frequency softlimit correctly (Vinay)
- Restore SLPC efficient freq earlier (Vinay)
- Consider OA buffer boundary when zeroing out reports (Umesh)
- Extend Wa_14015795083 to TGL, RKL, DG1 and ADL (Matt R)
- Fix context workarounds with non-masked regs on MTL/DG2 (Lucas)
- Enable the CCS_FLUSH bit in the pipe control and in the CS for MTL+ (Andi)
- Update MTL workarounds 14018778641, 22016122933 (Tejas, Zhanjun)
- Ensure memory quiesced before AUX CCS invalidation (Jonathan)

- Add a gsc_info debugfs (Daniele)
- Invalidate the TLBs on each GT on multi-GT device (Chris)
- Fix a VMA UAF for multi-gt platform (Nirmoy)
- Do not use stolen on MTL due to HW bug (Nirmoy)
- Check HuC and GuC version compatibility on MTL (Daniele)
- Dump perf_limit_reasons for slow GuC init debug (Vinay)
- Replace kmap() with kmap_local_page() (Sumitra, Ira)
- Add sentinel to xehp_oa_b_counters for KASAN (Andrzej)
- Add the gen12_needs_ccs_aux_inv helper (Andi)
- Fixes and updates for GSC memory allocation (Daniele)
- Fix one wrong caching mode enum usage (Tvrtko)
- Fixes for GSC wakeref (Alan)

- Static checker fixes (Harshit, Arnd, Dan, Cristophe, David, Andi)
- Rename flags with bit_group_X according to the datasheet (Andi)
- Use direct alias for i915 in requests (Andrzej)
- Replace i915->gt0 with to_gt(i915) (Andi)
- Use the i915_vma_flush_writes helper (Tvrtko)
- Selftest improvements (Alan)
- Remove dead code (Tvrtko)

----------------------------------------------------------------
Alan Previn (3):
      drm/i915/gsc: take a wakeref for the proxy-init-completion check
      drm/i915/gsc: Fix intel_gsc_uc_fw_proxy_init_done with directed wakerefs
      drm/i915/selftest/gsc: Ensure GSC Proxy init completes before selftests

Andi Shyti (8):
      drm/i915: Replace i915->gt0 with to_gt(i915)
      drm/i915/gt: Cleanup aux invalidation registers
      drm/i915: Add the gen12_needs_ccs_aux_inv helper
      drm/i915/gt: Rename flags with bit_group_X according to the datasheet
      drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control and in the CS
      drm/i915/gt: Support aux invalidation on all engines
      i915/drm/gt: Move the gt defines in the gt directory
      drm/i915: Remove unnecessary include

Andrzej Hajda (2):
      drm/i915/perf: add sentinel to xehp_oa_b_counters
      drm/i915: use direct alias for i915 in requests

Arnd Bergmann (1):
      drm/i915: make i915_drm_client_fdinfo() reference conditional again

Chris Wilson (2):
      drm/i915/gt: Move TLB invalidation to its own file
      drm/i915: Invalidate the TLBs on each GT

Christophe JAILLET (1):
      drm/i915: Fix an error handling path in igt_write_huge()

Dan Carpenter (1):
      drm/i915: Fix a NULL vs IS_ERR() bug

Daniele Ceraolo Spurio (5):
      drm/i915/gsc: fixes and updates for GSC memory allocation
      drm/i915/mtl/gsc: extract release and security versions from the gsc binary
      drm/i915/mtl/gsc: query the GSC FW for its compatibility version
      drm/i915/mtl/gsc: Add a gsc_info debugfs
      drm/i915/huc: check HuC and GuC version compatibility on MTL

David Reaver (1):
      drm/i915/huc: fix intel_huc.c doc bulleted list format error

Harshit Mogalapalli (1):
      drm/i915/huc: Fix missing error code in intel_huc_init()

Janusz Krzysztofik (1):
      drm/i915: Fix premature release of request's reusable memory

Jonathan Cavitt (2):
      drm/i915/gt: Ensure memory quiesced before invalidation
      drm/i915/gt: Poll aux invalidation register bit on invalidation

Lucas De Marchi (7):
      drm/i915/gt: Move wal_get_fw_for_rmw()
      drm/i915/gt: Clear all bits from GEN12_FF_MODE2
      drm/i915/gt: Fix context workarounds with non-masked regs
      drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
      drm/i915/gt: Enable read back on XEHP_FF_MODE2
      drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
      drm/i915/gt: Also check set bits in clr_set()

Matt Roper (1):
      drm/i915: Extend Wa_14015795083 platforms

Nirmoy Das (2):
      drm/i915: Fix a VMA UAF for multi-gt platform
      drm/i915/gt: Do not use stolen on MTL

Sumitra Sharma (1):
      drm/i915: Replace kmap() with kmap_local_page()

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018778641

Tvrtko Ursulin (8):
      drm/i915: Remove some dead "code"
      drm/i915: Remove dead code from gen8_pte_encode
      drm/i915: Fix one wrong caching mode enum usage
      drm/i915: Move setting of rps thresholds to init
      drm/i915: Record default rps threshold values
      drm/i915: Add helpers for managing rps thresholds
      drm/i915: Expose RPS thresholds in sysfs
      drm/i915: Use the i915_vma_flush_writes helper

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Consider OA buffer boundary when zeroing out reports

Vinay Belgaumkar (3):
      drm/i915/guc/slpc: Apply min softlimit correctly
      drm/i915/guc: Dump perf_limit_reasons for debug
      drm/i915/guc/slpc: Restore efficient freq earlier

Zhanjun Dong (1):
      drm/i915/mtl: Update cache coherency setting for context structure

 drivers/gpu/drm/i915/Makefile                      |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  25 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   6 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |   2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           | 152 +++++----
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |  21 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   3 -
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   1 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 | 144 +--------
 drivers/gpu/drm/i915/gt/intel_gt.h                 |  12 -
 drivers/gpu/drm/i915/gt/intel_gt_defines.h         |  11 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  16 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        | 108 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  26 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  10 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   4 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   3 -
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  83 ++++-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   4 +
 drivers/gpu/drm/i915/gt/intel_tlb.c                | 159 ++++++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h                |  29 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 148 ++++-----
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   4 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |   3 +-
 .../gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h  |  75 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          | 340 ++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          | 139 ++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c  |  39 +++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h  |  14 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  24 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 126 ++++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   4 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |   2 +-
 drivers/gpu/drm/i915/i915_active.c                 |  99 ++++--
 drivers/gpu/drm/i915/i915_driver.c                 |   2 +-
 drivers/gpu/drm/i915/i915_drm_client.h             |   2 -
 drivers/gpu/drm/i915/i915_drv.h                    |   1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   4 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  14 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  26 +-
 drivers/gpu/drm/i915/i915_request.c                |  13 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  10 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  15 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   2 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   2 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |  31 ++
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |  14 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
 70 files changed, 1553 insertions(+), 542 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
