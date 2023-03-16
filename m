Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB66BD050
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 13:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995F10E0A9;
	Thu, 16 Mar 2023 12:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7233410E0A9;
 Thu, 16 Mar 2023 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971510; x=1710507510;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ENg8skYCFr/MmPXikreWW9N16ZSnRWxDiXFmeOHYENs=;
 b=DrrG/EERipx/pqBjqUE1dsGUZ4vlSVoRWdUULWOe5XCvYPY5u4kdWtks
 BOlKu7Qp47ciMzMnVFgrM+V5AnxjzVx0sTTO5d8fgdIFQHbhd5NKgClSW
 WNbVa+JxsGdboYn3xSz6laTNg8x5UNROyf3Y182aXGEsqBwU8DOKRha6o
 d1lFoTRgpwZFLM8d6YhPrJi6P+FyNfLGTLPlV5dxnlqKV2Ligu7yvhxDA
 vO0WHF7RYtDJQHCo67Ga8Rw2vM3/UBDM3kFo+EVx1MhkDwZ2kjgfDLckm
 EY5z55LR44jL+fKiGe8xrKd49rQn+NKyg0ccxLlUDvIhlri+Mx+lYB0Ko Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336668747"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336668747"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="682305496"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="682305496"
Received: from hmolloy-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.15.189])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:58:26 -0700
Date: Thu, 16 Mar 2023 14:58:23 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZBMSb42yjjzczRhj@jlahtine-mobl.ger.corp.intel.com>
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

Here's the first batch of drm-intel-gt-next towards v6.4.

There is an important performance monitoring fix (#6333), more
resiliency to pcode load delay and avoiding caching problems on LLC
systems for ring buffers. Stolen memory probing fix and a
missing register whitelisting for Gen12. Fix for potential OOB access
on SSEU max_subslices array.

Improvements to error capture on GuC, corrections to workarounds
power domains across Gen11/Gen12 with subject to runtime PM.

Then the regular bunch of smaller tweaks, restructuring and cleanups
not to forget documentation, sparse and selftest improvements.

Regards, Joonas

***

drm-intel-gt-next-2023-03-16:

Driver Changes:

- Fix issue #6333: "list_add corruption" and full system lockup from
  performance monitoring (Janusz)
- Give the punit time to settle before fatally failing (Aravind, Chris)
- Don't use stolen memory or BAR for ring buffers on LLC platforms (John)
- Add missing ecodes and correct timeline seqno on GuC error captures (John)
- Make sure DSM size has correct 1MiB granularity on Gen12+ (Nirmoy,
  Lucas)
- Fix potential SSEU max_subslices array-index-out-of-bounds access on Gen11 (Andrea)
- Whitelist COMMON_SLICE_CHICKEN3 for UMD access on Gen12+ (Matt R.)
- Apply Wa_1408615072/Wa_1407596294 correctly on Gen11 (Matt R)
- Apply LNCF/LBCF workarounds correctly on XeHP SDV/PVC/DG2 (Matt R)
- Implement Wa_1606376872 for Xe_LP (Gustavo)
- Consider GSI offset when doing MCR lookups on Meteorlake+ (Matt R.)
- Add engine TLB invalidation for Meteorlake (Matt R.)
- Fix GSC Driver-FLR completion on Meteorlake (Alan)
- Fix GSC races on driver load/unload on Meteorlake+ (Daniele)
- Disable MC6 for MTL A step (Badal)

- Consolidate TLB invalidation flow (Tvrtko)
- Improve debug GuC/HuC debug messages (Michal Wa., John)
- Move fd_install after last use of fence (Rob)
- Initialize the obj flags for shmem objects (Aravind)
- Fix missing debug object activation (Nirmoy)
- Probe lmem before the stolen portion (Matt A)
- Improve clean up of GuC busyness stats worker (John)
- Fix missing return code checks in GuC submission init (John)
- Annotate two more workaround/tuning registers as MCR on PVC (Matt R)
- Fix GEN8_MISCCPCTL definition and remove unused INF_UNIT_LEVEL_CLKGATE (Lucas)
- Use sysfs_emit() and sysfs_emit_at() (Nirmoy)
- Make kobj_type structures constant (Thomas W.)
- make kobj attributes const on gt/ (Jani)
- Remove the unused virtualized start hack on buddy allocator (Matt A)
- Remove redundant check for DG1 (Lucas)
- Move DG2 tuning to the right function (Lucas)
- Rename dev_priv to i915 for private data naming consistency in gt/ (Andi)
- Remove unnecessary whitelisting of CS_CTX_TIMESTAMP on Xe_HP platforms (Matt R.)
-

- Escape wildcard in method names in kerneldoc (Bagas)
- Selftest improvements (Chris, Jonathan, Tvrtko, Anshuman, Tejas)
- Fix sparse warnings (Jani)
The following changes since commit 003e11ed2ef4af01b808f0f193eaa5a32f32383b:

  drm/i915/mtl: Wa_22011802037: don't complain about missing regs on MTL (2023-01-31 15:17:30 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-03-16

for you to fetch changes up to d2a9692ad4295e227e3352fdbf14b8491b01e1c9:

  drm/i915/gt: make kobj attributes const (2023-03-15 12:20:11 +0200)

----------------------------------------------------------------
Driver Changes:

- Fix issue #6333: "list_add corruption" and full system lockup from
  performance monitoring (Janusz)
- Give the punit time to settle before fatally failing (Aravind, Chris)
- Don't use stolen memory or BAR for ring buffers on LLC platforms (John)
- Add missing ecodes and correct timeline seqno on GuC error captures (John)
- Make sure DSM size has correct 1MiB granularity on Gen12+ (Nirmoy,
  Lucas)
- Fix potential SSEU max_subslices array-index-out-of-bounds access on Gen11 (Andrea)
- Whitelist COMMON_SLICE_CHICKEN3 for UMD access on Gen12+ (Matt R.)
- Apply Wa_1408615072/Wa_1407596294 correctly on Gen11 (Matt R)
- Apply LNCF/LBCF workarounds correctly on XeHP SDV/PVC/DG2 (Matt R)
- Implement Wa_1606376872 for Xe_LP (Gustavo)
- Consider GSI offset when doing MCR lookups on Meteorlake+ (Matt R.)
- Add engine TLB invalidation for Meteorlake (Matt R.)
- Fix GSC Driver-FLR completion on Meteorlake (Alan)
- Fix GSC races on driver load/unload on Meteorlake+ (Daniele)
- Disable MC6 for MTL A step (Badal)

- Consolidate TLB invalidation flow (Tvrtko)
- Improve debug GuC/HuC debug messages (Michal Wa., John)
- Move fd_install after last use of fence (Rob)
- Initialize the obj flags for shmem objects (Aravind)
- Fix missing debug object activation (Nirmoy)
- Probe lmem before the stolen portion (Matt A)
- Improve clean up of GuC busyness stats worker (John)
- Fix missing return code checks in GuC submission init (John)
- Annotate two more workaround/tuning registers as MCR on PVC (Matt R)
- Fix GEN8_MISCCPCTL definition and remove unused INF_UNIT_LEVEL_CLKGATE (Lucas)
- Use sysfs_emit() and sysfs_emit_at() (Nirmoy)
- Make kobj_type structures constant (Thomas W.)
- make kobj attributes const on gt/ (Jani)
- Remove the unused virtualized start hack on buddy allocator (Matt A)
- Remove redundant check for DG1 (Lucas)
- Move DG2 tuning to the right function (Lucas)
- Rename dev_priv to i915 for private data naming consistency in gt/ (Andi)
- Remove unnecessary whitelisting of CS_CTX_TIMESTAMP on Xe_HP platforms (Matt R.)
-

- Escape wildcard in method names in kerneldoc (Bagas)
- Selftest improvements (Chris, Jonathan, Tvrtko, Anshuman, Tejas)
- Fix sparse warnings (Jani)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/gsc: Fix the Driver-FLR completion

Andi Shyti (1):
      drm/i915/gt: Rename dev_priv to i915 for private data naming consistency

Andrea Righi (1):
      drm/i915/sseu: fix max_subslices array-index-out-of-bounds access

Anshuman Gupta (2):
      drm/i915/selftest: Fix engine timestamp and ktime disparity
      drm/i915/selftest: Fix ktime_get() and h/w access order

Aravind Iddamsetty (2):
      drm/i915: Initialize the obj flags for shmem objects
      drm/i915/pcode: Give the punit time to settle before fatally failing

Badal Nilawar (1):
      drm/i915/mtl: Disable MC6 for MTL A step

Bagas Sanjaya (1):
      drm/i915/doc: Escape wildcard in method names

Chris Wilson (1):
      drm/i915/gt: Add selftests for TLB invalidation

Daniele Ceraolo Spurio (2):
      drm/i915/gsc: flush the GSC worker before wedging on unload
      drm/i915/gsc: Fix race between HW init and GSC FW load

Gustavo Sousa (1):
      drm/i915/xelp: Implement Wa_1606376872

Jani Nikula (3):
      drm/i915/gt: add sparse lock annotation to avoid warnings
      drm/i915/pxp: fix __le64 access to get rid of sparse warning
      drm/i915/gt: make kobj attributes const

Janusz Krzysztofik (1):
      drm/i915/active: Fix misuse of non-idle barriers as fence trackers

John Harrison (13):
      drm/i915/guc: More debug print updates - UC firmware
      drm/i915/guc: More debug print updates - GSC firmware
      drm/i915/guc: More debug print updates - GuC reg capture
      drm/i915/guc: More debug print updates - GuC selftests
      drm/i915/guc: More debug print updates - GuC SLPC
      drm/i915/guc: More debug print updates - GuC logging
      drm/i915: Don't use stolen memory for ring buffers with LLC
      drm/i915: Don't use BAR mappings for ring buffers with LLC
      drm/i915/guc: Improve clean up of busyness stats worker
      drm/i915/guc: Fix missing return code checks in submission init
      drm/i915/guc: Fix missing ecodes
      drm/i915/guc: Clean up of register capture search
      drm/i915: Include timeline seqno in error capture

Jonathan Cavitt (1):
      drm/i915/mtl: X-Tile support changes to client blits

Lucas De Marchi (4):
      drm/i915: Fix GEN8_MISCCPCTL
      drm/i915: Remove unused/wrong INF_UNIT_LEVEL_CLKGATE
      drm/i915: Remove redundant check for DG1
      drm/i915: Move DG2 tuning to the right function

Matt Roper (7):
      drm/i915/pvc: Annotate two more workaround/tuning registers as MCR
      drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list
      drm/i915/xehp: LNCF/LBCF workarounds should be on the GT list
      drm/i915/xelpmp: Consider GSI offset when doing MCR lookups
      drm/i915/mtl: Add engine TLB invalidation
      drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access
      drm/i915: Stop whitelisting CS_CTX_TIMESTAMP on Xe_HP platforms

Matthew Auld (2):
      drm/i915: probe lmem before the stolen portion
      drm/i915/ttm: remove the virtualized start hack

Michal Wajdeczko (2):
      drm/i915/guc: Improve debug message on context reset notification
      drm/i915/huc: Add and use HuC oriented print macros

Nirmoy Das (3):
      drm/i915/gt: Use sysfs_emit() and sysfs_emit_at()
      drm/i915: Make sure dsm_size has correct granularity
      drm/i915/active: Fix missing debug object activation

Rob Clark (1):
      drm/i915: Move fd_install after last use of fence

Tejas Upadhyay (1):
      drm/i915/selftest: Remove avoidable init assignment

Thomas Weiﬂschuh (1):
      drm/i915: Make kobj_type structures constant

Tvrtko Ursulin (2):
      drm/i915: Consolidate TLB invalidation flow
      drm/i915/selftests: Fix live_requests for all engines

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   2 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  19 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          | 137 +++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  14 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |   1 +
 drivers/gpu/drm/i915/gt/intel_gsc.h                |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 | 165 +++------
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  27 --
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  16 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   8 +
 drivers/gpu/drm/i915/gt/intel_reset_types.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |   6 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   4 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |   2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 160 +++++----
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  10 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             | 388 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |  72 ++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  28 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  78 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  21 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h       |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |  21 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  61 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 140 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  44 +--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  56 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 116 +++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  42 +--
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |  23 +-
 .../gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c    |  11 +-
 drivers/gpu/drm/i915/i915_active.c                 |  28 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  10 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   3 +
 drivers/gpu/drm/i915/i915_gpu_error.h              |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |   9 -
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   7 -
 drivers/gpu/drm/i915/intel_pcode.c                 |  35 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  10 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  13 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |   2 +-
 .../gpu/drm/i915/selftests/i915_live_selftests.h   |   1 +
 drivers/gpu/drm/i915/selftests/i915_request.c      | 134 ++++---
 54 files changed, 1283 insertions(+), 701 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_tlb.c
