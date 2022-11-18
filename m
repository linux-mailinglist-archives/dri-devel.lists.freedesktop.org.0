Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6B62F0AC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0670510E1F4;
	Fri, 18 Nov 2022 09:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831A410E1F4;
 Fri, 18 Nov 2022 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668762753; x=1700298753;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Y3apXotWIE6g1eJI9xmlRrU+QHCDL5uz5zS/hSLBSNs=;
 b=ggbFKvrcLz7JpfSpvctH9rWov3KzztLfqCdcKWKnGj+XZSbfQIMeDEv0
 VfR7hcga4J10T/cH2DV7eyTWPzeKoXRzu2+7JUjYbskwVDJiQHdkXfX5K
 z/ArkKJ1eDC8ZJAlgxnhAWRgpzgnZZE5i0CECiJryyvSzMA2fda8okwnG
 DfBIfhHMvqRQWXz29/dukYl3diBfGku86wiMFJnc2nVjY0S8J7uhj4P/u
 Sr6FxQocIMwX3CKpuHrNZsQpNWh1n4zCk4QgY0Rpmg52xQsrwUEwwvRQV
 FxlZsW9XwETK43Q8QCNb5o9fk2FhVuxS0YPeSU6h2R2e4YJ+J6bEF08L7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="293485355"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="293485355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 01:12:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703673629"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="703673629"
Received: from hazimham-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.1.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 01:12:25 -0800
Date: Fri, 18 Nov 2022 11:12:23 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <Y3dMd9HDpfDehhWm@jlahtine-mobl.ger.corp.intel.com>
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

Here goes the last drm-intel-gt-next feature pull req for v6.2.

We have a couple of important fixes around memory management (TTM
and userptr), then demoting GuC kernel contexts to normal priority and
Meteorlake enabling.

Beyond that it's smaller fixes to code structure and corner cases.

Note the backmerge of drm-next to bring in v6.1-rc1 which had needed
dependencies for which I gave heads-up in IRC.

Regards, Joonas

**

drm-intel-gt-next-2022-11-18:

Core Changes:

- Backmerge of drm-next

Driver Changes:

- Restore probe_range behaviour for userptr (Matt A)
- Fix use-after-free on lmem_userfault_list (Matt A)
- Never purge busy TTM objects (Matt A)
- Meteorlake enabling (Daniele, Badal, Daniele, Stuart, Aravind, Alan)
- Demote GuC kernel contexts to normal priority (John)

- Use RC6 residency types as arguments to residency functions (Ashutosh,
  Rodrigo, Jani)
- Convert some legacy DRM debugging macros to new ones (Tvrtko)
- Don't deadlock GuC busyness stats vs reset (John)
- Remove excessive line feeds in GuC state dumps (John)
- Use i915_sg_dma_sizes() for all backends (Matt A)
- Prefer REG_FIELD_GET in intel_rps_get_cagf (Ashutosh, Rodrigo)
- Use GEN12_RPSTAT register for GT freq (Don, Badal, Ashutosh)
- Remove unwanted TTM ghost obj check (Matt A)
- Update workaround documentation (Lucas)

- Coding style and static checker fixes and cleanups
  (Jani, Umesh, Tvrtko, Lucas, Andrzej)
- Selftest improvements (Chris, Daniele, Riana, Andrzej)

The following changes since commit 60ba8c5bd94e17ab4b024f5cecf8b48e2cf36412:

  Merge tag 'drm-intel-gt-next-2022-11-03' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-11-04 17:33:34 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2022-11-18

for you to fetch changes up to 4bb9ca7ee07455bec0a802ecf0aa5b09496888e2:

  drm/i915/mtl: C6 residency and C state type for MTL SAMedia (2022-11-17 10:47:12 -0500)

----------------------------------------------------------------
Core Changes:

- Backmerge of drm-next

Driver Changes:

- Restore probe_range behaviour for userptr (Matt A)
- Fix use-after-free on lmem_userfault_list (Matt A)
- Never purge busy TTM objects (Matt A)
- Meteorlake enabling (Daniele, Badal, Daniele, Stuart, Aravind, Alan)
- Demote GuC kernel contexts to normal priority (John)

- Use RC6 residency types as arguments to residency functions (Ashutosh,
  Rodrigo, Jani)
- Convert some legacy DRM debugging macros to new ones (Tvrtko)
- Don't deadlock GuC busyness stats vs reset (John)
- Remove excessive line feeds in GuC state dumps (John)
- Use i915_sg_dma_sizes() for all backends (Matt A)
- Prefer REG_FIELD_GET in intel_rps_get_cagf (Ashutosh, Rodrigo)
- Use GEN12_RPSTAT register for GT freq (Don, Badal, Ashutosh)
- Remove unwanted TTM ghost obj check (Matt A)
- Update workaround documentation (Lucas)

- Coding style and static checker fixes and cleanups
  (Jani, Umesh, Tvrtko, Lucas, Andrzej)
- Selftest improvements (Chris, Daniele, Riana, Andrzej)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/pxp: Separate PXP FW interface structures for both v42 and 43

Andrzej Hajda (2):
      drm/i915: call i915_request_await_object from _i915_vma_move_to_active
      drm/i915/selftests: add igt_vma_move_to_active_unlocked

Aravind Iddamsetty (1):
      drm/i915/mtl: Handle wopcm per-GT and limit calculations.

Ashutosh Dixit (2):
      drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
      drm/i915/gt: Use RC6 residency types as arguments to residency functions

Badal Nilawar (3):
      drm/i915/mtl: Add Wa_14017073508 for SAMedia
      drm/i915/mtl: Modify CAGF functions for MTL
      drm/i915/mtl: C6 residency and C state type for MTL SAMedia

Chris Wilson (1):
      drm/i915/selftests: Reduce oversaturation of request smoketesting

Daniele Ceraolo Spurio (12):
      drm/i915/mtl: add initial definitions for GSC CS
      drm/i915/mtl: pass the GSC CS info to the GuC
      drm/i915/mtl: add GSC CS interrupt support
      drm/i915/mtl: add GSC CS reset support
      drm/i915/mtl: don't expose GSC command streamer to the user
      drm/i915/guc: don't hardcode BCS0 in guc_hang selftest
      drm/i915/huc: only load HuC on GTs that have VCS engines
      drm/i915/uc: fetch uc firmwares for each GT
      drm/i915/uc: use different ggtt pin offsets for uc loads
      drm/i915/guc: define media GT GuC send regs
      drm/i915/guc: handle interrupts from media GuC
      drm/i915/guc: add the GSC CS to the GuC capture list

Don Hiatt (1):
      drm/i915: Use GEN12_RPSTAT register for GT freq

Jani Nikula (1):
      drm/i915/pxp: use <> instead of "" for headers in include/

John Harrison (3):
      drm/i915/guc: Remove excessive line feeds in state dumps
      drm/i915/guc: Properly initialise kernel contexts
      drm/i915/guc: Don't deadlock busyness stats vs reset

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Lucas De Marchi (2):
      Documentation/gpu: Fix section in the wrong scope
      drm/i915: Update workaround documentation

Matthew Auld (5):
      drm/i915/userptr: restore probe_range behaviour
      drm/i915/ttm: fix uaf with lmem_userfault_list handling
      drm/i915/ttm: add some sanity checks for lmem_userfault_list
      drm/i915: use i915_sg_dma_sizes() for all backends
      drm/i915/ttm: never purge busy objects

Nirmoy Das (1):
      drm/i915: Remove unwanted ghost obj check

Riana Tauro (1):
      drm/i915/guc/slpc: Add selftest for slpc tile-tile interaction

Stuart Summers (1):
      drm/i915/guc: Add GuC deprivilege feature to MTL

Tvrtko Ursulin (3):
      drm/i915: Partial abandonment of legacy DRM logging macros
      drm/i915: Simplify internal helper function signature
      drm/i915: Fix vma allocator debug

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Fix kernel-doc warning

 Documentation/gpu/drm-usage-stats.rst              |   1 -
 Documentation/gpu/i915.rst                         |   2 +-
 drivers/gpu/drm/i915/Makefile                      |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  43 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  20 +--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   9 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |   2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  10 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  22 +---
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   4 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  16 +--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  10 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |   8 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h |  14 +++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   9 ++
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |  28 ++++-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  13 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             | 104 +++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  27 +++++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |  88 ++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  25 ++--
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  64 ++++++----
 drivers/gpu/drm/i915/gt/intel_rc6.h                |  11 +-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h          |  15 ++-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  18 ++-
 drivers/gpu/drm/i915/gt/intel_reset.h              |   1 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |  57 +++++++--
 drivers/gpu/drm/i915/gt/intel_rps.h                |   2 +
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c        |  43 +++++--
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h        |   0
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 134 ++++++++++++---------
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |   3 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  14 +--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |  35 +-----
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  33 ++---
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   5 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   6 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   8 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  70 ++++++++++-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |  26 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  47 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  11 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  15 ++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  29 +++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  12 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  46 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  14 +++
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |   8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   5 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   2 -
 drivers/gpu/drm/i915/i915_drv.h                    |  16 ++-
 drivers/gpu/drm/i915/i915_gem.c                    |   8 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   2 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  12 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   1 +
 drivers/gpu/drm/i915/i915_perf.c                   |  18 +--
 drivers/gpu/drm/i915/i915_perf_types.h             |   4 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   9 +-
 drivers/gpu/drm/i915/i915_query.c                  |  12 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  10 ++
 drivers/gpu/drm/i915/i915_sysfs.c                  |   3 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  21 ++--
 drivers/gpu/drm/i915/i915_vma.h                    |   1 +
 drivers/gpu/drm/i915/intel_uncore.c                |  21 ++--
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h  |  28 +++++
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |  26 ++++
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |  35 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |  13 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |  12 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h |  57 ---------
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   5 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  14 +--
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |  20 +--
 drivers/gpu/drm/i915/selftests/mock_region.c       |   2 +-
 97 files changed, 1023 insertions(+), 631 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
 delete mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
