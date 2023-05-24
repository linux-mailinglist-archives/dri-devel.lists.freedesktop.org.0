Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1470FD84
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33FB10E1C9;
	Wed, 24 May 2023 18:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC49C10E087;
 Wed, 24 May 2023 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951755; x=1716487755;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=vWHEffKgv9AhBg5wvRb5vGxU/DH/DsD4luP6z5N0Xuo=;
 b=CJjUe6utoqVrLll5IBXpUZmKH7qupQ+B/DYBk6DwkEiYfWO3n+bVQF+b
 sR2hilG2NrMr7uqaUiLQK87DCCnLSSsDs8ZoZ0HAqMK1hf5vYvNh4gp+j
 i2p2qFHx+o5hTIhK2Ga6uzxOWUo5z4dVaDrs0nVG/aFDrvijBSQ/O5vwd
 Uy+MtOdR2KqjBBwXvNpVS9gtuhiKlmAJc/RWEbH6zxjLqwxVp+E8hwp2J
 zu+Qctp0OVm+Jkx050F/zb1ihbavJJBl4w/pDET/vbsaxP6JzeoOrRV6/
 wlrnQtXe9SnmOKUW97GKJlSrMWDl4/xhbG7d5Tur2P5zFqvA/C4uUnKCp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="334004368"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="334004368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 11:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848866918"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="848866918"
Received: from bmhacket-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.218.245])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 11:09:10 -0700
Date: Wed, 24 May 2023 19:09:08 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZG5SxCWRSkZhTDtY@tursulin-desk>
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

Hi Dave, Daniel,

Here goes the first pull request for 6.5.

In terms of headline features probably the fact GuC platforms can now show per
client engine utilisation sticks out the most.

Then there is a bunch of fixes where those in the area of GuC error capture,
SLPS and firmware loading dominate the picture.

Meteorlake platform enablement continues full steam ahead with workarounds,
multi-tile refactoring, PMU support, PXP support, and prep work for sunsetting
the set caching ioctl to be replaced with direct PAT index programming from
userspace probably in the next pull request.

Finally there is smaller than usual amount of driver cleanups and refactorings
and a spinkle of selftest fixups and such.

Btw the next and final pull request for 6.5 I aim to send two weeks from now.

Regards,

Tvrtko

drm-intel-gt-next-2023-05-24:
UAPI Changes:

- New getparam for querying PXP support and load status

Cross-subsystem Changes:

- GSC/MEI proxy driver

Driver Changes:

Fixes/improvements/new stuff:

- Avoid clearing pre-allocated framebuffers with the TTM backend (Nirmoy Das)
- Implement framebuffer mmap support (Nirmoy Das)
- Disable sampler indirect state in bindless heap (Lionel Landwerlin)
- Avoid out-of-bounds access when loading HuC (Lucas De Marchi)
- Actually return an error if GuC version range check fails (John Harrison)
- Get mutex and rpm ref just once in hwm_power_max_write (Ashutosh Dixit)
- Disable PL1 power limit when loading GuC firmware (Ashutosh Dixit)
- Block in hwmon while waiting for GuC reset to complete (Ashutosh Dixit)
- Provide sysfs for SLPC efficient freq (Vinay Belgaumkar)
- Add support for total context runtime for GuC back-end (Umesh Nerlige Ramappa)
- Enable fdinfo for GuC backends (Umesh Nerlige Ramappa)
- Don't capture Gen8 regs on Xe devices (John Harrison)
- Fix error capture for virtual engines (John Harrison)
- Track patch level versions on reduced version firmware files (John Harrison)
- Decode another GuC load failure case (John Harrison)
- GuC loading and firmware table handling fixes (John Harrison)
- Fix confused register capture list creation (John Harrison)
- Dump error capture to kernel log (John Harrison)
- Dump error capture to dmesg on CTB error (John Harrison)
- Disable rps_boost debugfs when SLPC is used (Vinay Belgaumkar)

Future platform enablement:

- Disable stolen memory backed FB for A0 [mtl] (Nirmoy Das)
- Various refactors for multi-tile enablement (Andi Shyti, Tejas Upadhyay)
- Extend Wa_22011802037 to MTL A-step (Madhumitha Tolakanahalli Pradeep)
- WA to clear RDOP clock gating [mtl] (Haridhar Kalvala)
- Set has_llc=0 [mtl] (Fei Yang)
- Define MOCS and PAT tables for MTL (Madhumitha Tolakanahalli Pradeep)
- Add PTE encode function [mtl] (Fei Yang)
- fix mocs selftest [mtl] (Fei Yang)
- Workaround coherency issue for Media [mtl] (Fei Yang)
- Add workaround 14018778641 [mtl] (Tejas Upadhyay)
- Implement Wa_14019141245 [mtl] (Radhakrishna Sripada)
- Fix the wa number for Wa_22016670082 [mtl] (Radhakrishna Sripada)
- Use correct huge page manager for MTL (Jonathan Cavitt)
- GSC/MEI support for Meteorlake (Alexander Usyskin, Daniele Ceraolo Spurio)
- Define GuC firmware version for MTL (John Harrison)
- Drop FLAT CCS check [mtl] (Pallavi Mishra)
- Add MTL for remapping CCS FBs [mtl] (Clint Taylor)
- Meteorlake PXP enablement (Alan Previn)
- Do not enable render power-gating on MTL (Andrzej Hajda)
- Add MTL performance tuning changes (Radhakrishna Sripada)
- Extend Wa_16014892111 to MTL A-step (Radhakrishna Sripada)
- PMU multi-tile support (Tvrtko Ursulin)
- End support for set caching ioctl [mtl] (Fei Yang)

Driver refactors:

- Use i915 instead of dev_priv insied the file_priv structure (Andi Shyti)
- Use proper parameter naming in for_each_engine() (Andi Shyti)
- Use gt_err for GT info (Tejas Upadhyay)
- Consolidate duplicated capture list code (John Harrison)
- Capture list naming clean up (John Harrison)
- Use kernel-doc -Werror when CONFIG_DRM_I915_WERROR=y (Jani Nikula)
- Preparation for using PAT index (Fei Yang)
- Use pat_index instead of cache_level (Fei Yang)

Miscellaneous:

- Fix memory leaks in i915 selftests (Cong Liu)
- Record GT error for gt failure (Tejas Upadhyay)
- Migrate platform-dependent mock hugepage selftests to live (Jonathan Cavitt)
- Update the SLPC selftest (Vinay Belgaumkar)
- Throw out set() wrapper (Jani Nikula)
- Large driver kernel doc cleanup (Jani Nikula)
- Fix probe injection CI failures after recent change (John Harrison)
- Make unexpected firmware versions an error in debug builds (John Harrison)
- Silence UBSAN uninitialized bool variable warning (Ashutosh Dixit)
- Fix memory leaks in function live_nop_switch (Cong Liu)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Joonas Lahtinen)
The following changes since commit 55bf14961db9da61220e6f04bc9919c94b1a6585:

  Merge tag 'mediatek-drm-next-6.4' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2023-04-11 12:28:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-05-24

for you to fetch changes up to 0fbcf57077c47b444e91b9ce8a243e6f7f53693d:

  drm/i915/mtl: end support for set caching ioctl (2023-05-23 10:15:26 +0200)

----------------------------------------------------------------
UAPI Changes:

- New getparam for querying PXP support and load status

Cross-subsystem Changes:

- GSC/MEI proxy driver

Driver Changes:

Fixes/improvements/new stuff:

- Avoid clearing pre-allocated framebuffers with the TTM backend (Nirmoy Das)
- Implement framebuffer mmap support (Nirmoy Das)
- Disable sampler indirect state in bindless heap (Lionel Landwerlin)
- Avoid out-of-bounds access when loading HuC (Lucas De Marchi)
- Actually return an error if GuC version range check fails (John Harrison)
- Get mutex and rpm ref just once in hwm_power_max_write (Ashutosh Dixit)
- Disable PL1 power limit when loading GuC firmware (Ashutosh Dixit)
- Block in hwmon while waiting for GuC reset to complete (Ashutosh Dixit)
- Provide sysfs for SLPC efficient freq (Vinay Belgaumkar)
- Add support for total context runtime for GuC back-end (Umesh Nerlige Ramappa)
- Enable fdinfo for GuC backends (Umesh Nerlige Ramappa)
- Don't capture Gen8 regs on Xe devices (John Harrison)
- Fix error capture for virtual engines (John Harrison)
- Track patch level versions on reduced version firmware files (John Harrison)
- Decode another GuC load failure case (John Harrison)
- GuC loading and firmware table handling fixes (John Harrison)
- Fix confused register capture list creation (John Harrison)
- Dump error capture to kernel log (John Harrison)
- Dump error capture to dmesg on CTB error (John Harrison)
- Disable rps_boost debugfs when SLPC is used (Vinay Belgaumkar)

Future platform enablement:

- Disable stolen memory backed FB for A0 [mtl] (Nirmoy Das)
- Various refactors for multi-tile enablement (Andi Shyti, Tejas Upadhyay)
- Extend Wa_22011802037 to MTL A-step (Madhumitha Tolakanahalli Pradeep)
- WA to clear RDOP clock gating [mtl] (Haridhar Kalvala)
- Set has_llc=0 [mtl] (Fei Yang)
- Define MOCS and PAT tables for MTL (Madhumitha Tolakanahalli Pradeep)
- Add PTE encode function [mtl] (Fei Yang)
- fix mocs selftest [mtl] (Fei Yang)
- Workaround coherency issue for Media [mtl] (Fei Yang)
- Add workaround 14018778641 [mtl] (Tejas Upadhyay)
- Implement Wa_14019141245 [mtl] (Radhakrishna Sripada)
- Fix the wa number for Wa_22016670082 [mtl] (Radhakrishna Sripada)
- Use correct huge page manager for MTL (Jonathan Cavitt)
- GSC/MEI support for Meteorlake (Alexander Usyskin, Daniele Ceraolo Spurio)
- Define GuC firmware version for MTL (John Harrison)
- Drop FLAT CCS check [mtl] (Pallavi Mishra)
- Add MTL for remapping CCS FBs [mtl] (Clint Taylor)
- Meteorlake PXP enablement (Alan Previn)
- Do not enable render power-gating on MTL (Andrzej Hajda)
- Add MTL performance tuning changes (Radhakrishna Sripada)
- Extend Wa_16014892111 to MTL A-step (Radhakrishna Sripada)
- PMU multi-tile support (Tvrtko Ursulin)
- End support for set caching ioctl [mtl] (Fei Yang)

Driver refactors:

- Use i915 instead of dev_priv insied the file_priv structure (Andi Shyti)
- Use proper parameter naming in for_each_engine() (Andi Shyti)
- Use gt_err for GT info (Tejas Upadhyay)
- Consolidate duplicated capture list code (John Harrison)
- Capture list naming clean up (John Harrison)
- Use kernel-doc -Werror when CONFIG_DRM_I915_WERROR=y (Jani Nikula)
- Preparation for using PAT index (Fei Yang)
- Use pat_index instead of cache_level (Fei Yang)

Miscellaneous:

- Fix memory leaks in i915 selftests (Cong Liu)
- Record GT error for gt failure (Tejas Upadhyay)
- Migrate platform-dependent mock hugepage selftests to live (Jonathan Cavitt)
- Update the SLPC selftest (Vinay Belgaumkar)
- Throw out set() wrapper (Jani Nikula)
- Large driver kernel doc cleanup (Jani Nikula)
- Fix probe injection CI failures after recent change (John Harrison)
- Make unexpected firmware versions an error in debug builds (John Harrison)
- Silence UBSAN uninitialized bool variable warning (Ashutosh Dixit)
- Fix memory leaks in function live_nop_switch (Cong Liu)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Joonas Lahtinen)

----------------------------------------------------------------
Alan Previn (8):
      drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
      drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
      drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
      drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
      drm/i915/pxp: Add ARB session creation and cleanup
      drm/i915/uapi/pxp: Add a GET_PARAM for PXP
      drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
      drm/i915/pxp: Enable PXP with MTL-GSC-CS

Alexander Usyskin (2):
      drm/i915/mtl: Define GSC Proxy component interface
      mei: gsc_proxy: add gsc proxy driver

Andi Shyti (3):
      drm/i915: Make IRQ reset and postinstall multi-gt aware
      drm/i915/i915_drv: Use proper parameter naming in for_each_engine()
      drm/i915/i915_drv: Use i915 instead of dev_priv insied the file_priv structure

Andrzej Hajda (1):
      drm/i915/mtl: do not enable render power-gating on MTL

Ashutosh Dixit (4):
      drm/i915/hwmon: Get mutex and rpm ref just once in hwm_power_max_write
      drm/i915/guc: Disable PL1 power limit when loading GuC firmware
      drm/i915/hwmon: Block waiting for GuC reset to complete
      drm/i915/hwmon: Silence UBSAN uninitialized bool variable warning

Clint Taylor (1):
      drm/i915/mtl: Add MTL for remapping CCS FBs

Cong Liu (2):
      drm/i915: Fix memory leaks in i915 selftests
      drm/i915: Fix memory leaks in function live_nop_switch

Daniele Ceraolo Spurio (2):
      drm/i915/gsc: add initial support for GSC proxy
      drm/i915/gsc: add support for GSC proxy interrupt

Fei Yang (7):
      drm/i915/mtl: Set has_llc=0
      drm/i915/mtl: fix mocs selftest
      drm/i915/mtl: Add PTE encode function
      drm/i915/mtl: workaround coherency issue for Media
      drm/i915: preparation for using PAT index
      drm/i915: use pat_index instead of cache_level
      drm/i915/mtl: end support for set caching ioctl

Haridhar Kalvala (1):
      drm/i915/mtl: WA to clear RDOP clock gating

Jani Nikula (25):
      drm/i915/rc6: throw out set() wrapper
      drm/i915/gvt: fix intel_vgpu_alloc_resource() kernel-doc parameter
      drm/i915/vma: fix kernel-doc function name for i915_vma_size()
      drm/i915/utils: drop kernel-doc from __wait_for()
      drm/i915/vma: document struct i915_vma_resource wakeref member
      drm/i915/perf: fix i915_perf_ioctl_version() kernel-doc
      drm/i915/error: fix i915_capture_error_state() kernel-doc
      drm/i915/request: drop kernel-doc
      drm/i915/gem: fix i915_gem_object_lookup_rcu() kernel-doc parameter name
      drm/i915/engine: fix kernel-doc function name for intel_engine_cleanup_common()
      drm/i915/context: fix kernel-doc parameter descriptions
      drm/i915/gtt: fix i915_vm_resv_put() kernel-doc parameter name
      drm/i915/engine: hide preempt_hang selftest member from kernel-doc
      drm/i915/guc: add dbgfs_node member kernel-doc
      drm/i915/guc: drop lots of kernel-doc markers
      drm/i915/guc: add intel_guc_state_capture member docs for ads_null_cache and max_mmio_per_node
      drm/i915/active: fix kernel-doc for function parameters
      drm/i915/pmu: drop kernel-doc
      drm/i915/pxp: fix kernel-doc for member dev_link
      drm/i915/scatterlist: fix kernel-doc parameter documentation
      drm/i915/vma: fix struct i915_vma_bindinfo kernel-doc
      drm/i915/gem: fix function pointer member kernel-doc
      drm/i915/scatterlist: fix kernel-doc
      drm/i915/ttm: fix i915_ttm_to_gem() kernel-doc
      drm/i915: use kernel-doc -Werror when CONFIG_DRM_I915_WERROR=y

John Harrison (16):
      drm/i915/guc: Actually return an error if GuC version range check fails
      drm/i915/guc: Don't capture Gen8 regs on Xe devices
      drm/i915/guc: Consolidate duplicated capture list code
      drm/i915/guc: Capture list naming clean up
      drm/i915/guc: Fix error capture for virtual engines
      drm/i915/uc: Track patch level versions on reduced version firmware files
      drm/i915/mtl: Define GuC firmware version for MTL
      drm/i915/guc: Decode another GuC load failure case
      drm/i915/guc: Print status register when waiting for GuC to load
      drm/i915/uc: Enhancements to firmware table validation
      drm/i915/uc: Reject duplicate entries in firmware table
      drm/i915/uc: Make unexpected firmware versions an error in debug builds
      drm/i1915/guc: Fix probe injection CI failures after recent change
      drm/i915/guc: Fix confused register capture list creation
      drm/i915: Dump error capture to kernel log
      drm/i915/guc: Dump error capture to dmesg on CTB error

Jonathan Cavitt (2):
      drm/i915: Migrate platform-dependent mock hugepage selftests to live
      drm/i915: Use correct huge page manager for MTL

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Lionel Landwerlin (1):
      drm/i915: disable sampler indirect state in bindless heap

Lucas De Marchi (1):
      drm/i915/gt: Avoid out-of-bounds access when loading HuC

Madhumitha Tolakanahalli Pradeep (2):
      drm/i915/mtl: Extend Wa_22011802037 to MTL A-step
      drm/i915/mtl: Define MOCS and PAT tables for MTL

Nirmoy Das (6):
      drm/i915/ttm: Add I915_BO_PREALLOC
      drm/i915/display: Set I915_BO_ALLOC_USER for fb
      drm/i915: Add a function to mmap framebuffer obj
      drm/i915/display: Add helper func to get intel_fbdev from drm_fb_helper
      drm/i915/display: Implement fb_mmap callback function
      drm/i915/mtl: Disable stolen memory backed FB for A0

Pallavi Mishra (1):
      drm/i915/mtl: Drop FLAT CCS check

Radhakrishna Sripada (4):
      drm/i915/mtl: Implement Wa_14019141245
      drm/i915/mtl: Fix the wa number for Wa_22016670082
      drm/i915/mtl: Add MTL performance tuning changes
      drm/i915/mtl: Extend Wa_16014892111 to MTL A-step

Tejas Upadhyay (7):
      drm/i915/gt: Consider multi-gt instead of to_gt()
      drm/i915/gem: Consider multi-gt instead of to_gt()
      drm/i915/selftests: Consider multi-gt instead of to_gt()
      drm/i915/selftest: Record GT error for gt failure
      drm/i915/mtl: Add workaround 14018778641
      drm/i915/gt: Use gt_err for GT info
      drm/i915/selftests: Use gt_err for GT info

Tvrtko Ursulin (7):
      drm/i915/pmu: Change bitmask of enabled events to u32
      drm/i915/pmu: Support PMU for all engines
      drm/i915/pmu: Skip sampling engines with no enabled counters
      drm/i915/pmu: Transform PMU parking code to be GT based
      drm/i915/pmu: Add reference counting to the sampling timer
      drm/i915/pmu: Prepare for multi-tile non-engine counters
      drm/i915/pmu: Export counters from all tiles

Umesh Nerlige Ramappa (2):
      i915/pmu: Add support for total context runtime for GuC back-end
      drm/i915/fdinfo: Enable fdinfo for GuC backends

Vinay Belgaumkar (3):
      drm/i915/guc/slpc: Provide sysfs for efficient freq
      drm/i915/selftest: Update the SLPC selftest
      drm/i915/guc/slpc: Disable rps_boost debugfs

 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |  14 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   9 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  38 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |  61 ++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           | 148 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.h           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  60 ++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  68 +++-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |  13 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    | 108 +++--
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  18 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  10 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  84 ++--
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |   3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   5 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |   8 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  84 ++--
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  25 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  35 ++
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  47 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  36 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   4 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  51 +--
 drivers/gpu/drm/i915/gt/intel_migrate.h            |  13 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |  70 +++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                | 167 ++++----
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  75 +++-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |   3 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |  47 ++-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   3 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   8 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  42 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |   4 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |   1 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |  20 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  23 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       | 424 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h       |  18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  76 +++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |  17 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  | 102 +++++
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |  27 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  36 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     | 269 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  59 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |   6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  40 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  75 +++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  16 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 295 +++++++++-----
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |   2 +-
 drivers/gpu/drm/i915/i915_active.h                 |  14 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  51 ++-
 drivers/gpu/drm/i915/i915_drm_client.c             |   6 +-
 drivers/gpu/drm/i915/i915_drv.h                    | 452 ++++++++++-----------
 drivers/gpu/drm/i915/i915_gem.c                    |  27 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   7 +
 drivers/gpu/drm/i915/i915_gpu_error.c              | 153 ++++++-
 drivers/gpu/drm/i915/i915_gpu_error.h              |  10 +
 drivers/gpu/drm/i915/i915_hwmon.c                  |  87 +++-
 drivers/gpu/drm/i915/i915_hwmon.h                  |   7 +
 drivers/gpu/drm/i915/i915_irq.c                    |  17 +-
 drivers/gpu/drm/i915/i915_pci.c                    |  81 +++-
 drivers/gpu/drm/i915/i915_perf.c                   |   1 +
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |   4 -
 drivers/gpu/drm/i915/i915_pmu.c                    | 294 ++++++++++----
 drivers/gpu/drm/i915/i915_pmu.h                    |  28 +-
 drivers/gpu/drm/i915/i915_request.h                |  52 +--
 drivers/gpu/drm/i915/i915_scatterlist.h            |   9 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  16 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |  46 ++-
 drivers/gpu/drm/i915/i915_vma_types.h              |   2 -
 drivers/gpu/drm/i915/intel_device_info.h           |   5 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               | 102 +++--
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |   2 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |  24 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |   6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         | 444 ++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |  43 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |   3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h          |  27 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |  25 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |  24 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |   5 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |   8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  19 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |  47 ++-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   9 +
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |   8 +-
 drivers/misc/mei/Kconfig                           |   2 +-
 drivers/misc/mei/Makefile                          |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig                 |  14 +
 drivers/misc/mei/gsc_proxy/Makefile                |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c         | 208 ++++++++++
 include/drm/i915_component.h                       |   3 +-
 include/drm/i915_gsc_proxy_mei_interface.h         |  53 +++
 include/uapi/drm/i915_drm.h                        |  51 ++-
 131 files changed, 4317 insertions(+), 1217 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h
