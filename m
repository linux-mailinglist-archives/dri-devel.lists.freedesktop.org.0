Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3F6D9157
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621C10EB16;
	Thu,  6 Apr 2023 08:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023510EB16;
 Thu,  6 Apr 2023 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680769094; x=1712305094;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qV8iL4Ukuflzgs5T++vnrmF5Cy1cecv/B586KUibWu4=;
 b=d78DCrA4l93RIagnFW9fCFDSZ080+2NxsNaBYDbVTkjDBl8ug6Sub5q6
 37ZZ/jaqnGtkkx6LZ/E5pK111P1Gg+j66bMlCHqg2hpsbyOlhbEupNd93
 z26hw2mbfWlWUk8RoBQVcMebbJyOZhwy/B6rEMAqEobnKVYZ/dqzD8wKc
 k+pJXdcTUW3MbmS+CiCu2Zwi3Y8yivAOrjEAJEJPMFiH81MF05treROkl
 mFCAqHO+EYy1CFMUXZ76+ZIpW03v9FMsEbMqw7ols7luVlmJbvhcjWlos
 6B2NsRwG9RSev4dkiVnYOQjtpbtkH+kDQM7VC6k6oTD0X4sX++AmKVpx6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345274918"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345274918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 01:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664362930"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="664362930"
Received: from dsobolev-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.29.103])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 01:18:07 -0700
Date: Thu, 6 Apr 2023 11:18:06 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZC6APj/feB+jBf2d@jlahtine-mobl.ger.corp.intel.com>
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

Here goes the final drm-intel-gt-next pull request for v6.4.

As top items we have a fix for context runtime accounting, Meteorlake
enabling, DMAR error noise elimination due to GPU error capture, BAR
resizing forcewake fix and memory contents clearing fix for discrete.
More robust GuC loading on systems with IFWI that leaves GPU to slow
frequency and a potential UAF closed on perf add_config IOCTL.

There is also change to the uAPI headers to eliminate flexible-array
member kernel-wide request, which does not impact binaries and also
should not impact compilation.

Then the usual amount of smaller fixes and cleanups. A good amount of
kerneldoc fixes included.

Best Regards, Joonas

***

drm-intel-gt-next-2023-04-06:

UAPI Changes:

- (Build-time only, should not have any impact)
  drm/i915/uapi: Replace fake flex-array with flexible-array member

  "Zero-length arrays as fake flexible arrays are deprecated and we are
  moving towards adopting C99 flexible-array members instead."

  This is on core kernel request moving towards GCC 13.

Driver Changes:

- Fix context runtime accounting on sysfs fdinfo for heavy workloads (Tvrtko)
- Add support for OA media units on MTL (Umesh)
- Add new workarounds for Meteorlake (Daniele, Radhakrishna, Haridhar)
- Fix sysfs to read actual frequency for MTL and Gen6 and earlier
  (Ashutosh)
- Synchronize i915/BIOS on C6 enabling on MTL (Vinay)
- Fix DMAR error noise due to GPU error capture (Andrej)
- Fix forcewake during BAR resize on discrete (Andrzej)
- Flush lmem contents after construction on discrete (Chris)
- Fix GuC loading timeout on systems where IFWI programs low boot
  frequency (John)
- Fix race condition UAF in i915_perf_add_config_ioctl (Min)

- Sanitycheck MMIO access early in driver load and during forcewake
  (Matt)
- Wakeref fixes for GuC RC error scenario and active VM tracking (Chris)
- Cancel HuC delayed load timer on reset (Daniele)
- Limit double GT reset to pre-MTL (Daniele)
- Use i915 instead of dev_priv insied the file_priv structure (Andi)
- Improve GuC load error reporting (John)
- Simplify VCS/BSD engine selection logic (Tvrtko)
- Perform uc late init after probe error injection (Andrzej)
- Fix format for perf_limit_reasons in debugfs (Vinay)
- Create per-gt debugfs files (Andi)

- Documentation and kerneldoc fixes (Nirmoy, Lee)
- Selftest improvements (Fei, Jonathan)

The following changes since commit d2a9692ad4295e227e3352fdbf14b8491b01e1c9:

  drm/i915/gt: make kobj attributes const (2023-03-15 12:20:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-04-06

for you to fetch changes up to 4b51210f98c2b89ce37aede5b8dc5105be0572c6:

  drm/i915/mtl: Add Wa_14017856879 (2023-04-05 07:59:12 -0700)

----------------------------------------------------------------
UAPI Changes:

- (Build-time only, should not have any impact)
  drm/i915/uapi: Replace fake flex-array with flexible-array member

  "Zero-length arrays as fake flexible arrays are deprecated and we are
  moving towards adopting C99 flexible-array members instead."

  This is on core kernel request moving towards GCC 13.

Driver Changes:

- Fix context runtime accounting on sysfs fdinfo for heavy workloads (Tvrtko)
- Add support for OA media units on MTL (Umesh)
- Add new workarounds for Meteorlake (Daniele, Radhakrishna, Haridhar)
- Fix sysfs to read actual frequency for MTL and Gen6 and earlier
  (Ashutosh)
- Synchronize i915/BIOS on C6 enabling on MTL (Vinay)
- Fix DMAR error noise due to GPU error capture (Andrej)
- Fix forcewake during BAR resize on discrete (Andrzej)
- Flush lmem contents after construction on discrete (Chris)
- Fix GuC loading timeout on systems where IFWI programs low boot
  frequency (John)
- Fix race condition UAF in i915_perf_add_config_ioctl (Min)

- Sanitycheck MMIO access early in driver load and during forcewake
  (Matt)
- Wakeref fixes for GuC RC error scenario and active VM tracking (Chris)
- Cancel HuC delayed load timer on reset (Daniele)
- Limit double GT reset to pre-MTL (Daniele)
- Use i915 instead of dev_priv insied the file_priv structure (Andi)
- Improve GuC load error reporting (John)
- Simplify VCS/BSD engine selection logic (Tvrtko)
- Perform uc late init after probe error injection (Andrzej)
- Fix format for perf_limit_reasons in debugfs (Vinay)
- Create per-gt debugfs files (Andi)

- Documentation and kerneldoc fixes (Nirmoy, Lee)
- Selftest improvements (Fei, Jonathan)

----------------------------------------------------------------
Andi Shyti (3):
      drm/i915/gt: Create per-gt debugfs files
      drm/i915/debugfs: Enable upper layer interfaces to act on all gt's
      drm/i915: Use i915 instead of dev_priv insied the file_priv structure

Andrzej Hajda (4):
      drm/i915/gt: prevent forcewake releases during BAR resize
      drm/i915/gt: introduce vm->scratch_range callback
      drm/i915: add guard page to ggtt->error_capture
      drm/i915/gt: perform uc late init after probe error injection

Ashutosh Dixit (1):
      drm/i915/pmu: Use functions common with sysfs to read actual freq

Chris Wilson (3):
      drm/i915/gem: Flush lmem contents after construction
      drm/i915/perf: Drop wakeref on GuC RC error
      drm/i915/gt: Hold a wakeref for the active VM

Daniele Ceraolo Spurio (3):
      drm/i915/huc: Cancel HuC delayed load timer on reset.
      drm/i915: limit double GT reset to pre-MTL
      drm/i915/gsc: implement wa 14015076503

Fei Yang (1):
      drm/i915/selftests: keep same cache settings as timeline

Gustavo A. R. Silva (1):
      drm/i915/uapi: Replace fake flex-array with flexible-array member

Haridhar Kalvala (1):
      drm/i915/mtl: Add Wa_14017856879

John Harrison (2):
      drm/i915/guc: Improve GuC load error reporting
      drm/i915/guc: Allow for very slow GuC loading

Jonathan Cavitt (1):
      drm/i915/selftests: Drop igt_cs_tlb

Lee Jones (13):
      drm/i915/i915_scatterlist: Fix kerneldoc formatting issue - missing '@'
      drm/i915/intel_region_ttm: Provide missing description for 'offset' param
      drm/i915/gt/intel_rps: Demote a kerneldoc abuse for ips_ping_for_i915_load()
      drm/i915/gem/i915_gem_create: Provide the function names for proper kerneldoc headers
      drm/i915/gem/i915_gem_domain: Provide function names to complete proper kerneldoc
      drm/i915/gem/i915_gem_ttm_pm: Provide a couple of missing descriptions for 'flags' and remove some superfluous ones
      drm/i915/gem/i915_gem_ttm: Demote half-filled kerneldoc
      drm/i915/gem/i915_gem_ttm_move: Provide a couple of missing descriptions for 'num_pages' and 'ctx'
      drm/i915/gem/i915_gem_wait: Provide function name to validate the kerneldoc header
      drm/i915/gem/i915_gem_object: Demote non-kerneldoc header with no param descriptions
      drm/i915/i915_gem: Provide function names to complete the expected kerneldoc format
      drm/i915/gt/uc/intel_guc_hwconfig: Demote a few non-conforming kerneldoc headers
      drm/i915/i915_vma: Provide one missing param and demote another non-kerneldoc header

Matt Roper (2):
      drm/i915: Sanitycheck MMIO access early in driver load
      drm/i915: Check for unreliable MMIO during forcewake

Min Li (1):
      drm/i915: fix race condition UAF in i915_perf_add_config_ioctl

Nirmoy Das (1):
      drm/i915/gt: Update engine_init_common documentation

Radhakrishna Sripada (2):
      drm/i915/mtl: Add workarounds Wa_14017066071 and Wa_14017654203
      drm/i915/mtl: Add Wa_22015279794

Tvrtko Ursulin (2):
      drm/i915: Simplify vcs/bsd engine selection
      drm/i915: Fix context runtime accounting

Umesh Nerlige Ramappa (10):
      drm/i915/perf: Validate OA sseu config outside switch
      drm/i915/perf: Group engines into respective OA groups
      drm/i915/perf: Fail modprobe if i915_perf_init fails on OOM
      drm/i915/perf: Parse 64bit report header formats correctly
      drm/i915/perf: Handle non-power-of-2 reports
      drm/i915/perf: Add engine class instance parameters to perf
      drm/i915/perf: Add support for OA media units
      drm/i915/perf: Pass i915 object to perf revision helper
      drm/i915/perf: Wa_14017512683: Disable OAM if media C6 is enabled in BIOS
      drm/i915/mtl: Disable C6 on MTL A0 for media

Vinay Belgaumkar (2):
      drm/i915: Fix format for perf_limit_reasons
      drm/i915/mtl: Synchronize i915/BIOS on C6 enabling

 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  22 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |  15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   9 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  10 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  12 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  43 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   9 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  27 +
 drivers/gpu/drm/i915/gt/intel_rc6.h                |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6_types.h          |   2 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |  25 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              | 119 ++++-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  40 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |   4 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  19 +
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |  14 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |  17 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          | 141 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |   2 +
 drivers/gpu/drm/i915/i915_debugfs.c                |  36 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   4 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |   2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   2 +
 drivers/gpu/drm/i915/i915_file_private.h           |   2 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  10 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   1 +
 drivers/gpu/drm/i915/i915_perf.c                   | 570 ++++++++++++++++-----
 drivers/gpu/drm/i915/i915_perf.h                   |   4 +-
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |  78 +++
 drivers/gpu/drm/i915/i915_perf_types.h             |  75 ++-
 drivers/gpu/drm/i915/i915_pmu.c                    |  10 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  14 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |   2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   3 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   1 +
 drivers/gpu/drm/i915/intel_region_ttm.c            |   1 +
 drivers/gpu/drm/i915/intel_uncore.c                |  47 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      | 356 -------------
 include/uapi/drm/i915_drm.h                        |  25 +-
 63 files changed, 1241 insertions(+), 637 deletions(-)
