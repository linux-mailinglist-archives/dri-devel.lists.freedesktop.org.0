Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DA5BA876
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954710E3DA;
	Fri, 16 Sep 2022 08:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2124510E3CE;
 Fri, 16 Sep 2022 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663318061; x=1694854061;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4tT4Lk6hswugSMoil1fvETzpd2Zp850w38LFwZhhuaI=;
 b=f6B4ly2QLMoGKHlIDMT4lwitakyWTMqKwVqJxFLMEiQZelv74kVtL837
 o/DTEYGEPtK25IzzUbeVELsh5iIOJu5HJVlHn90hBmNb+1d9Daw7tdWOI
 gVWfpMP/0i5wxfCOx/6NtiFuwPNoENAbZ6h1GBFESzLSA4nh7MxIwOgAA
 M+2MmNukxohRlHhJ4KnjIw4MVIcur5qknJo7x7wXJLGJyFVbHEfvkIFhP
 OoAcpV63VMj7VxnRil43b56kd9CEiAwjQ/0c/tnq1X648UoTrrxExVr/c
 3Cu+r4UtgnfLtIdN/mHIRY0bGdgKAiuOTEvxUqLhFNfzOQjk24rX340q3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385236545"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="385236545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:47:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="686061003"
Received: from horanmic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.1.49])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 01:47:37 -0700
Date: Fri, 16 Sep 2022 11:47:34 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YyQ4Jgl3cpGL1/As@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes the final drm-intel-gt-next towards 6.1.

For stable platforms we have fixes for throttle reasons decoding to sysfs, GuC
version update to 7.5, XeHP SDV GSC support and the usual pile of smaller fixes.

DG2 and DG1 runtime PM is now mostly fixed for LMEM access via mmap, but kernel
internal usages still need to be reviewed. There's also at least one LMEM code
NULL deref bug to resolve [1]. Finally a bunch of Meteorlake (MTL) enabling
patches.

Note that this PR includes patches going to mei subsystem, due to the tight
coupling of the MEI/GSC code. Those are Acked-by Greg.

Regards, Joonas

[1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12135/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html

***

drm-intel-gt-next-2022-09-16:

Cross-subsystem Changes:

- MEI subsystem pieces for XeHP SDV GSC support
  These are Acked-by Greg.

Driver Changes:

- Release mmaps on RPM suspend on discrete GPUs (Anshuman)
- Update GuC version to 7.5 on DG1, DG2 and ADL
- Revert "drm/i915/dg2: extend Wa_1409120013 to DG2" (Lucas)
- MTL enabling incl. standalone media (Matt R, Lucas)
- Explicitly clear BB_OFFSET for new contexts on Gen8+ (Chris)
- Fix throttling / perf limit reason decoding (Ashutosh)
- XeHP SDV GSC support (Vitaly, Alexander, Tomas)

- Fix issues with overrding firmware file paths (John)
- Invert if-else ladders to check latest version first (Lucas)
- Cancel GuC engine busyness worker synchronously (Umesh)

- Skip applying copy engine fuses outside PVC (Lucas)
- Eliminate Gen10 frequency read function (Lucas)
- Static code checker fixes (Gaosheng)
- Selftest improvements (Chris)

The following changes since commit 04f7eb3d4582a0a4da67c86e55fda7de2df86d91:

  drm/i915: Set correct domains values at _i915_vma_move_to_active (2022-09-08 11:06:35 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-09-16

for you to fetch changes up to 8adc718881e0a70127f8843dd70e69a80de39352:

  drm/i915/uc: Update to latest GuC and use new-format GuC/HuC names (2022-09-15 18:43:33 -0700)

----------------------------------------------------------------
Cross-subsystem Changes:

- MEI subsystem pieces for XeHP SDV GSC support
  These are Acked-by Greg.

Driver Changes:

- Release mmaps on RPM suspend on discrete GPUs (Anshuman)
- Update GuC version to 7.5 on DG1, DG2 and ADL
- Revert "drm/i915/dg2: extend Wa_1409120013 to DG2" (Lucas)
- MTL enabling incl. standalone media (Matt R, Lucas)
- Explicitly clear BB_OFFSET for new contexts on Gen8+ (Chris)
- Fix throttling / perf limit reason decoding (Ashutosh)
- XeHP SDV GSC support (Vitaly, Alexander, Tomas)

- Fix issues with overrding firmware file paths (John)
- Invert if-else ladders to check latest version first (Lucas)
- Cancel GuC engine busyness worker synchronously (Umesh)

- Skip applying copy engine fuses outside PVC (Lucas)
- Eliminate Gen10 frequency read function (Lucas)
- Static code checker fixes (Gaosheng)
- Selftest improvements (Chris)

----------------------------------------------------------------
Alexander Usyskin (5):
      drm/i915/gsc: add slow_firmware flag to the gsc device definition
      drm/i915/gsc: add GSC XeHP SDV platform definition
      mei: gsc: wait for reset thread on stop
      mei: extend timeouts on slow devices
      mei: drop ready bits check after start

Anshuman Gupta (2):
      drm/i915: Refactor userfault_wakeref to re-use
      drm/i915/dgfx: Release mmap on rpm suspend

Ashutosh Dixit (1):
      drm/i915/gt: Fix perf limit reasons bit positions

Chris Wilson (4):
      drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
      drm/i915/selftests: Check for incomplete LRI from the context image
      drm/i915/selftest: Always cancel semaphore on error
      drm/i915/selftest: Clear the output buffers before GPU writes

Gaosheng Cui (1):
      drm/i915: remove unused i915_gem_lmem_obj_ops declaration

John Harrison (2):
      drm/i915/uc: Fix issues with overriding firmware files
      drm/i915/uc: Update to latest GuC and use new-format GuC/HuC names

Lucas De Marchi (7):
      Revert "drm/i915/dg2: extend Wa_1409120013 to DG2"
      drm/i915/gt: Use MEDIA_VER() when handling media fuses
      drm/i915/gt: Extract function to apply media fuses
      drm/i915: Skip applying copy engine fuses
      drm/i915: Invert if/else ladder for frequency read
      drm/i915/gt: Extract per-platform function for frequency read
      drm/i915: Invert if/else ladder for stolen init

Matt Roper (14):
      drm/i915: Move locking and unclaimed check into mmio_debug_{suspend, resume}
      drm/i915: Only hook up uncore->debug for primary uncore
      drm/i915: Use managed allocations for extra uncore objects
      drm/i915: Drop intel_gt_tile_cleanup()
      drm/i915: Prepare more multi-GT initialization
      drm/i915: Rename and expose common GT early init routine
      drm/i915: Use a DRM-managed action to release the PCI bridge device
      drm/i915: Initialize MMIO access for each GT
      drm/i915: Handle each GT on init/release and suspend/resume
      drm/i915/uncore: Add GSI offset to uncore
      drm/i915/mtl: Add gsi_offset when emitting aux table invalidation
      drm/i915/xelpmp: Expose media as another GT
      drm/i915/mtl: Use primary GT's irq lock for media GT
      drm/i915/mtl: Hook up interrupts for standalone media

Tomas Winkler (7):
      mei: add kdoc for struct mei_aux_device
      mei: add slow_firmware flag to the mei auxiliary device
      mei: gsc: use polling instead of interrupts
      mei: mkhi: add memory ready command
      mei: gsc: setup gsc extended operational memory
      mei: debugfs: add pxp mode to devstate in debugfs
      drm/i915/gsc: allocate extended operational memory in LMEM

Umesh Nerlige Ramappa (1):
      drm/i915/guc: Cancel GuC engine busyness worker synchronously

Vitaly Lubart (3):
      drm/i915/gsc: skip irq initialization if using polling
      mei: bus: export common mkhi definitions into a separate header
      mei: gsc: add transition to PXP mode in resume flow

 drivers/gpu/drm/i915/Makefile                     |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h          |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c          |  23 ++-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h          |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c        |  51 ++-----
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c           |  36 ++++-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c          |  15 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h          |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         | 156 ++++++++++---------
 drivers/gpu/drm/i915/gt/intel_engine_regs.h       |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c      |   1 -
 drivers/gpu/drm/i915/gt/intel_gsc.c               | 106 +++++++++++--
 drivers/gpu/drm/i915/gt/intel_gsc.h               |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.c                | 111 ++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt.h                |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c    | 174 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_gt_irq.c            |  35 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c         |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h           |  10 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h          |  36 ++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h               |   3 -
 drivers/gpu/drm/i915/gt/intel_lrc.c               |  29 +++-
 drivers/gpu/drm/i915/gt/intel_rps.c               |  26 ++--
 drivers/gpu/drm/i915/gt/intel_sa_media.c          |  47 ++++++
 drivers/gpu/drm/i915/gt/intel_sa_media.h          |  15 ++
 drivers/gpu/drm/i915/gt/selftest_lrc.c            | 115 +++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            |  24 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c          |  30 +++-
 drivers/gpu/drm/i915/i915_driver.c                | 105 +++++++++----
 drivers/gpu/drm/i915/i915_drv.h                   |   5 +
 drivers/gpu/drm/i915/i915_gem.c                   |   6 +-
 drivers/gpu/drm/i915/i915_irq.c                   |   4 +-
 drivers/gpu/drm/i915/i915_pci.c                   |  14 ++
 drivers/gpu/drm/i915/i915_reg.h                   |  16 +-
 drivers/gpu/drm/i915/intel_device_info.h          |   3 +
 drivers/gpu/drm/i915/intel_pm.c                   |   5 +-
 drivers/gpu/drm/i915/intel_uncore.c               |  92 +++++++-----
 drivers/gpu/drm/i915/intel_uncore.h               |  40 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c              |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c      |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c          |  14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c      |   4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c  |   1 +
 drivers/misc/mei/bus-fixup.c                      | 106 ++++++++-----
 drivers/misc/mei/client.c                         |  16 +-
 drivers/misc/mei/debugfs.c                        |  19 ++-
 drivers/misc/mei/gsc-me.c                         |  77 ++++++++--
 drivers/misc/mei/hbm.c                            |  14 +-
 drivers/misc/mei/hw-me-regs.h                     |   9 +-
 drivers/misc/mei/hw-me.c                          | 138 ++++++++++++++---
 drivers/misc/mei/hw-me.h                          |  17 ++-
 drivers/misc/mei/hw-txe.c                         |   4 +-
 drivers/misc/mei/hw.h                             |   7 +-
 drivers/misc/mei/init.c                           |  35 +++--
 drivers/misc/mei/main.c                           |   4 +-
 drivers/misc/mei/mei_dev.h                        |  35 ++++-
 drivers/misc/mei/mkhi.h                           |  55 +++++++
 drivers/misc/mei/pci-me.c                         |   4 +-
 include/linux/mei_aux.h                           |  12 ++
 64 files changed, 1423 insertions(+), 534 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_sa_media.h
 create mode 100644 drivers/misc/mei/mkhi.h
