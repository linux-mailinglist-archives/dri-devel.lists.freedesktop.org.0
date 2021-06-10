Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93413A288C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752E86ECB8;
	Thu, 10 Jun 2021 09:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F216ECAC;
 Thu, 10 Jun 2021 09:40:40 +0000 (UTC)
IronPort-SDR: 6ANeh589toJZQo0eNhIank8TqWa1279LH1XGdbjZUrZEdII0hWKvccTc0yWzwbJpXFNQJ16DY/
 IqvV53J2BFTw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="226657243"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="226657243"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 02:40:37 -0700
IronPort-SDR: Tv/0bP9LlmJXs5VjWpYudqn5+E+3U226INkJ7vsdbOVC5mxJJov/auoUT4OZEzuMR6qci6wUMn
 /eowueHA4Zjg==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="552995574"
Received: from jwalsh5-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.28.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 02:40:33 -0700
Date: Thu, 10 Jun 2021 12:40:31 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YMHeDxg9VLiFtyn3@jlahtine-mobl.ger.corp.intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here's the final -gt-next PR for 5.14.

Two major uAPI changes for new Gen12+ platforms: Stop supporting
old MMAP IOCTL (excl. TGL) and require use of MMAP_OFFSET instead.
Start enabling HuC loading by default (excl. TGL and RKL).

Revert for io_mapping_map_user which was already in -fixes.

Enabling of the TTM device and memory managers for handling LMEM
on dGFX (currently replaces the buddy allocator). Note that this
only impacts the platforms behind force probe protection.

A lot of improvments to the GuC submission backend to prepare for
enabling on newer platforms.

Only a couple other reworks and fixes.

Regards, Joonas

***

drm-intel-gt-next-2021-06-10:

UAPI Changes:

- Disable mmap ioctl for gen12+ (excl. TGL-LP)
- Start enabling HuC loading by default for upcoming Gen12+
  platforms (excludes TGL and RKL)

Core Changes:

- Backmerge of drm-next

Driver Changes:

- Revert "i915: use io_mapping_map_user" (Eero, Matt A)
- Initialize the TTM device and memory managers (Thomas)
- Major rework to the GuC submission backend to prepare
  for enabling on new platforms (Michal Wa., Daniele,
  Matt B, Rodrigo)
- Fix i915_sg_page_sizes to record dma segments rather
  than physical pages (Thomas)

- Locking rework to prep for TTM conversion (Thomas)
- Replace IS_GEN and friends with GRAPHICS_VER (Lucas)
- Use DEVICE_ATTR_RO macro (Yue)
- Static code checker fixes (Zhihao)

The following changes since commit ccd1950c2f7e38ae45aeefb99a08b39407cd6c63:

  Merge tag 'drm-intel-gt-next-2021-05-28' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-06-02 14:15:54 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-06-10

for you to fetch changes up to 47c65b3853f88d105017ef512a521794db51bfeb:

  drm/i915/uc: Use platform specific defaults for GuC/HuC enabling (2021-06-09 10:52:03 -0700)

----------------------------------------------------------------
UAPI Changes:

- Disable mmap ioctl for gen12+ (excl. TGL-LP)
- Start enabling HuC loading by default for upcoming Gen12+
  platforms (excludes TGL and RKL)

Core Changes:

- Backmerge of drm-next

Driver Changes:

- Revert "i915: use io_mapping_map_user" (Eero, Matt A)
- Initialize the TTM device and memory managers (Thomas)
- Major rework to the GuC submission backend to prepare
  for enabling on new platforms (Michal Wa., Daniele,
  Matt B, Rodrigo)
- Fix i915_sg_page_sizes to record dma segments rather
  than physical pages (Thomas)

- Locking rework to prep for TTM conversion (Thomas)
- Replace IS_GEN and friends with GRAPHICS_VER (Lucas)
- Use DEVICE_ATTR_RO macro (Yue)
- Static code checker fixes (Zhihao)

----------------------------------------------------------------
Daniele Ceraolo Spurio (4):
      drm/i915/guc: skip disabling CTBs before sanitizing the GuC
      drm/i915/guc: use probe_error log for CT enablement failure
      drm/i915/guc: enable only the user interrupt when using GuC submission
      drm/i915/guc: Use guc_class instead of engine_class in fw interface

John Harrison (1):
      drm/i915/uc: Use platform specific defaults for GuC/HuC enabling

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Lucas De Marchi (3):
      drm/i915/gt: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915/gt: Add remaining conversions to GRAPHICS_VER
      drm/i915/gem: replace IS_GEN and friends with GRAPHICS_VER

Maarten Lankhorst (1):
      drm/i915: Disable mmap ioctl for gen12+

Matthew Auld (1):
      Revert "i915: use io_mapping_map_user"

Matthew Brost (2):
      drm/i915/guc: Drop guc->interrupts.enabled
      drm/i915/guc: Ensure H2G buffer updates visible before tail update

Michal Wajdeczko (12):
      drm/i915/guc: Keep strict GuC ABI definitions
      drm/i915/guc: Stop using fence/status from CTB descriptor
      drm/i915: Promote ptrdiff() to i915_utils.h
      drm/i915/guc: Only rely on own CTB size
      drm/i915/guc: Don't repeat CTB layout calculations
      drm/i915/guc: Replace CTB array with explicit members
      drm/i915/guc: Update sizes of CTB buffers
      drm/i915/guc: Start protecting access to CTB descriptors
      drm/i915/guc: Stop using mutex while sending CTB messages
      drm/i915/guc: Don't receive all G2H messages in irq handler
      drm/i915/guc: Always copy CT message to new allocation
      drm/i915/guc: Early initialization of GuC send registers

Rodrigo Vivi (1):
      drm/i915/guc: Remove sample_forcewake h2g action

Thomas Hellström (5):
      drm/i915: Untangle the vma pages_mutex
      drm/i915: Don't free shared locks while shared
      drm/i915: Fix i915_sg_page_sizes to record dma segments rather than physical pages
      drm/i915/ttm Initialize the ttm device and memory managers
      drm/i915/ttm: Embed a ttm buffer object in the i915 gem object

YueHaibing (1):
      drm/i915: use DEVICE_ATTR_RO macro

Zhihao Cheng (1):
      drm/i915/selftests: Fix return value check in live_breadcrumbs_smoketest()

 drivers/gpu/drm/i915/Kconfig                       |   2 +-
 drivers/gpu/drm/i915/Makefile                      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  59 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  10 +
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  22 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         | 120 ----
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  26 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   9 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   2 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |  10 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   4 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  16 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  14 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |  10 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |  40 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |   2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   2 +-
 drivers/gpu/drm/i915/gt/intel_context_sseu.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  60 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   4 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  18 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  37 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |  34 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  29 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c          |  10 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  59 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  28 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |   6 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  46 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   8 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   8 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  16 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |  27 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |   2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  14 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  64 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  60 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |  14 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |   6 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  66 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   4 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   8 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   8 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |   4 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   8 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   4 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   6 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  16 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |   6 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |  51 ++
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h | 106 +++
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |  52 ++
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |  14 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  63 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 532 ++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        | 233 +-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  37 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  14 +-
 drivers/gpu/drm/i915/i915_buddy.c                  | 435 ------------
 drivers/gpu/drm/i915/i915_buddy.h                  | 131 ----
 drivers/gpu/drm/i915/i915_drv.c                    |  13 +
 drivers/gpu/drm/i915/i915_drv.h                    |  11 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   1 +
 drivers/gpu/drm/i915/i915_globals.c                |   1 -
 drivers/gpu/drm/i915/i915_globals.h                |   1 -
 drivers/gpu/drm/i915/i915_mm.c                     |  44 ++
 drivers/gpu/drm/i915/i915_params.c                 |   2 +-
 drivers/gpu/drm/i915/i915_params.h                 |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   8 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |  70 ++
 drivers/gpu/drm/i915/i915_scatterlist.h            |  20 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |  30 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   5 +
 drivers/gpu/drm/i915/i915_vma.c                    |  29 +-
 drivers/gpu/drm/i915/i915_vma.h                    |   5 -
 drivers/gpu/drm/i915/intel_memory_region.c         | 180 ++---
 drivers/gpu/drm/i915/intel_memory_region.h         |  44 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            | 220 ++++++
 drivers/gpu/drm/i915/intel_region_ttm.h            |  32 +
 drivers/gpu/drm/i915/selftests/i915_buddy.c        | 789 ---------------------
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |   1 -
 drivers/gpu/drm/i915/selftests/i915_request.c      |   4 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   | 133 ++--
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |  10 +
 drivers/gpu/drm/i915/selftests/mock_region.c       |  70 +-
 108 files changed, 1888 insertions(+), 2723 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
