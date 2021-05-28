Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D027393DC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5C86F586;
	Fri, 28 May 2021 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD76E041;
 Fri, 28 May 2021 07:26:05 +0000 (UTC)
IronPort-SDR: dbxrt3ykJS6+y6tvrjH1N5SBJCrvLM1ZSrMeK8BLe8srLQ86Z1vskrQMUPIo55ndcIIyC7pNsk
 HB+CyJtVRn3Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="190026101"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="190026101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 00:26:03 -0700
IronPort-SDR: I9OpP+7nImXKVKB2f8cFPD1h7vGQSNIifP6Ymixckr4ejT6nC/kjSLaBxQW/2Ht5yOQPYOo6Wa
 Mzs3pcmuwarQ==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="445501494"
Received: from srobinso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.5.219])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 00:26:00 -0700
Date: Fri, 28 May 2021 10:25:57 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <YLCbBR22BsQ/dpJB@jlahtine-mobl.ger.corp.intel.com>
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

Here's drm-intel-gt-next pull request.

Most notably it has the reworked DG1 uAPI (behind CONFIG_BROKEN)
as requested. Important fix for Gitlab issues #3293 and #3450 and
one another kernel crash. Adds missing workarounds for Gen11 and
Gen12. Hiding of modparams for compiled-out features. Conversion
to use trylock shrinking for BSW VT-d and BXT.

Then there are the uAPI kerneldoc improvements as part of the DG1
uAPI rework. Usual amount smaller fixes, code refactoring and
cleanups as prep for upcoming patches.

Regards, Joonas

***

drm-intel-gt-next-2021-05-28:

UAPI Changes:
- Add reworked uAPI for DG1 behind CONFIG_BROKEN (Matt A, Abdiel)

Driver Changes:

- Fix for Gitlab issues #3293 and #3450:
  Avoid kernel crash on older L-shape memory machines

- Hide modparams for compiled-out features (Tvrtko)
- Add Wa_14010733141 (VDBox SFC reset) for Gen11+ (Aditya)
- Fix crash in auto_retire active retire callback due to
  misalignment (Stephane)
- Use trylock in shrinker for GGTT on BSW VT-d and BXT (Maarten)
- Fix overlay active retire callback alignment (Tvrtko)
- Eliminate need to align active retire callbacks (Matt A, Ville,
  Daniel)
- Program FF_MODE2 tuning value for all Gen12 platforms (Caz)
- Add Wa_14011060649 for TGL,RKL,DG1 and ADLS (Swathi)
- Create stolen memory region from local memory on DG1 (CQ)
- Place PD in LMEM on dGFX (Matt A)
- Use WC when default state object is allocated in LMEM (Venkata)
- Determine the coherent map type based on object location (Venkata)
- Use lmem physical addresses for fb_mmap() on discrete (Mohammed)
- Bypass aperture on fbdev when LMEM is available (Anusha)
- Return error value when displayable BO not in LMEM for dGFX (Mohammed)
- Do release kernel context if breadcrumb measure fails (Janusz)
- Apply Wa_22010271021 for all Gen11 platforms (Caz)
- Fix unlikely ref count race in arming the watchdog timer (Tvrtko)
- Check actual RC6 enable status in PMU (Tvrtko)
- Fix a double free in gen8_preallocate_top_level_pdp (Lv)
- Remove erroneous i915_is_ggtt check for
  I915_GEM_OBJECT_UNBIND_VM_TRYLOCK (Maarten)

- Convert uAPI headers to real kerneldoc (Matt A)
- Clean up kerneldoc warnings headers (Matt A, Maarten)
- Fail driver if LMEM training failed (Matt R)
- Avoid div-by-zero on Gen2 (Ville)
- Read C0DRB3/C1DRB3 as 16 bits again and add _BW suffix (Ville)
- Remove reference to struct drm_device.pdev (Thomas)
- Increase separation between GuC and execlists code (Chris, Matt B)

- Use might_alloc() (Bernard)
- Split DGFX_FEATURES from GEN12_FEATURES (Lucas)
- Deduplicate Wa_22010271021 programming on (Jose)
- Drop duplicate WaDisable4x2SubspanOptimization:hsw (Tvrtko)
- Selftest improvements (Chris, Hsin-Yi, Tvrtko)
- Shuffle around init_memory_region for stolen (Matt)
- Typo fixes (wengjianfeng)

The following changes since commit 425390c5dce6da76578389629d19517fcd79c959:

  drm/i915: split dgfx features from gen 12 (2021-04-14 13:05:06 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2021-05-28

for you to fetch changes up to 5b26d57fdb499c2363f3d895ef008e73ec02eb9b:

  drm/i915: Add Wa_14010733141 (2021-05-27 11:05:09 -0700)

----------------------------------------------------------------
UAPI Changes:
- Add reworked uAPI for DG1 behind CONFIG_BROKEN (Matt A, Abdiel)

Driver Changes:

- Fix for Gitlab issues #3293 and #3450:
  Avoid kernel crash on older L-shape memory machines

- Add Wa_14010733141 (VDBox SFC reset) for Gen11+ (Aditya)
- Fix crash in auto_retire active retire callback due to
  misalignment (Stephane)
- Fix overlay active retire callback alignment (Tvrtko)
- Eliminate need to align active retire callbacks (Matt A, Ville,
  Daniel)
- Program FF_MODE2 tuning value for all Gen12 platforms (Caz)
- Add Wa_14011060649 for TGL,RKL,DG1 and ADLS (Swathi)
- Create stolen memory region from local memory on DG1 (CQ)
- Place PD in LMEM on dGFX (Matt A)
- Use WC when default state object is allocated in LMEM (Venkata)
- Determine the coherent map type based on object location (Venkata)
- Use lmem physical addresses for fb_mmap() on discrete (Mohammed)
- Bypass aperture on fbdev when LMEM is available (Anusha)
- Return error value when displayable BO not in LMEM for dGFX (Mohammed)
- Do release kernel context if breadcrumb measure fails (Janusz)
- Hide modparams for compiled-out features (Tvrtko)
- Apply Wa_22010271021 for all Gen11 platforms (Caz)
- Fix unlikely ref count race in arming the watchdog timer (Tvrtko)
- Check actual RC6 enable status in PMU (Tvrtko)
- Fix a double free in gen8_preallocate_top_level_pdp (Lv)
- Use trylock in shrinker for GGTT on BSW VT-d and BXT (Maarten)
- Remove erroneous i915_is_ggtt check for
  I915_GEM_OBJECT_UNBIND_VM_TRYLOCK (Maarten)

- Convert uAPI headers to real kerneldoc (Matt A)
- Clean up kerneldoc warnings headers (Matt A, Maarten)
- Fail driver if LMEM training failed (Matt R)
- Avoid div-by-zero on Gen2 (Ville)
- Read C0DRB3/C1DRB3 as 16 bits again and add _BW suffix (Ville)
- Remove reference to struct drm_device.pdev (Thomas)
- Increase separation between GuC and execlists code (Chris, Matt B)

- Use might_alloc() (Bernard)
- Split DGFX_FEATURES from GEN12_FEATURES (Lucas)
- Deduplicate Wa_22010271021 programming on (Jose)
- Drop duplicate WaDisable4x2SubspanOptimization:hsw (Tvrtko)
- Selftest improvements (Chris, Hsin-Yi, Tvrtko)
- Shuffle around init_memory_region for stolen (Matt)
- Typo fixes (wengjianfeng)

----------------------------------------------------------------
Abdiel Janulgue (1):
      drm/i915/query: Expose memory regions through the query uAPI

Aditya Swarup (1):
      drm/i915: Add Wa_14010733141

Anusha Srivatsa (1):
      drm/i915/lmem: Bypass aperture when lmem is available

Bernard Zhao (1):
      drm/i915: Use might_alloc()

CQ Tang (2):
      drm/i915: Create stolen memory region from local memory
      drm/i915/stolen: enforce the min_page_size contract

Caz Yokoyama (2):
      drm/i915/gen12: Add recommended hardware tuning value
      drm/i915/icl: add Wa_22010271021 for all gen11

Chris Wilson (6):
      drm/i915/selftests: Skip aperture remapping selftest where there is no aperture
      drm/i915/selftests: Only query RAPL for integrated power measurements
      drm/i915/gem: Pin the L-shape quirked object as unshrinkable
      drm/i915/gt: Move engine setup out of set_default_submission
      drm/i915/gt: Move submission_method into intel_gt
      drm/i915/gt: Move CS interrupt handler to the backend

Hsin-Yi Wang (1):
      drm/i915/selftests: Rename pm_ prefixed functions names

Janusz Krzysztofik (1):
      drm/i915/gt: Do release kernel context if breadcrumb measure fails

Joonas Lahtinen (1):
      Merge tag 'topic/intel-gen-to-ver-2021-04-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next

José Roberto de Souza (1):
      drm/i915: Move Wa_16011163337 to gen12_ctx_workarounds_init()

Lv Yunlong (1):
      drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pdp

Maarten Lankhorst (4):
      drm/i915: Fix docbook descriptions for i915_gem_shrinker
      drm/i915: Fix docbook descriptions for i915_cmd_parser
      drm/i915: Use trylock in shrinker for ggtt on bsw vt-d and bxt, v2.
      drm/i915: Remove erroneous i915_is_ggtt check for I915_GEM_OBJECT_UNBIND_VM_TRYLOCK

Matt Roper (1):
      drm/i915/lmem: Fail driver init if LMEM training failed

Matthew Auld (19):
      drm/i915/uapi: fix kernel doc warnings
      drm/i915/uapi: convert i915_user_extension to kernel doc
      drm/i915/uapi: convert i915_query and friend to kernel doc
      drm/doc: add section for driver uAPI
      drm/i915/stolen: treat stolen local as normal local memory
      drm/i915/stolen: actually mark as contiguous
      drm/i915/gtt: map the PD up front
      drm/i915/gtt/dgfx: place the PD in LMEM
      drm/doc/rfc: i915 DG1 uAPI
      drm/i915: mark stolen as private
      drm/i915: rework gem_create flow for upcoming extensions
      drm/i915/uapi: introduce drm_i915_gem_create_ext
      drm/i915/uapi: implement object placement extension
      drm/i915/lmem: support optional CPU clearing for special internal use
      drm/i915/gem: clear userspace buffers for LMEM
      drm/i915/gem: hide new uAPI behind CONFIG_BROKEN
      drm/i915: drop the __i915_active_call pointer packing
      drm/i915/stolen: shuffle around init_memory_region
      drm/doc/rfc: drop the i915_gem_lmem.h header

Mohammed Khajapasha (2):
      drm/i915/fbdev: Use lmem physical addresses for fb_mmap() on discrete
      drm/i915: Return error value when bo not in LMEM for discrete

Stéphane Marchesin (1):
      drm/i915: Fix crash in auto_retire

Swathi Dhanavanthri (1):
      drm/i915: Add Wa_14011060649

Thomas Zimmermann (1):
      drm/i915/gem: Remove reference to struct drm_device.pdev

Tvrtko Ursulin (6):
      drm/i915: Take request reference before arming the watchdog timer
      drm/i915/pmu: Check actual RC6 status
      drm/i915/overlay: Fix active retire callback alignment
      drm/i915/selftests: Fix active retire callback alignment
      drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
      drm/i915/params: Align visibility of device level and global modparams

Venkata Ramana Nayana (1):
      drm/i915/dg1: Fix mapping type for default state object

Venkata Sandeep Dhanalakota (1):
      drm/i915: Update the helper to set correct mapping

Ville Syrjälä (3):
      drm/i915: Avoid div-by-zero on gen2
      drm/i915: Read C0DRB3/C1DRB3 as 16 bits again
      drm/i915: Give C0DRB3/C1DRB3 a _BW suffix

wengjianfeng (1):
      drm/i915/gt: fix typo issue

 Documentation/gpu/driver-uapi.rst                  |   8 +
 Documentation/gpu/index.rst                        |   1 +
 Documentation/gpu/rfc/i915_gem_lmem.rst            | 131 +++++++
 Documentation/gpu/rfc/index.rst                    |   4 +
 drivers/gpu/drm/i915/display/intel_display.c       |  10 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  51 ++-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         | 345 ++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |  22 ++
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         | 159 +++++++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   3 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  11 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  26 ++
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |  13 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  32 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  21 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  14 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |  95 +++--
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |   3 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  10 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  82 ++---
 drivers/gpu/drm/i915/gt/intel_gt_irq.h             |  23 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   7 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  91 +++--
 drivers/gpu/drm/i915/gt/intel_gtt.h                |  12 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   4 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |   7 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              | 201 +++++++----
 drivers/gpu/drm/i915/gt/intel_ring.c               |  11 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  12 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   2 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        | 100 ++++--
 drivers/gpu/drm/i915/gt/mock_engine.c              |   2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |   3 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   4 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   4 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |  32 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   6 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  64 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   4 +-
 drivers/gpu/drm/i915/i915_active.c                 |  11 +-
 drivers/gpu/drm/i915/i915_active.h                 |  11 +-
 drivers/gpu/drm/i915/i915_active_types.h           |   5 -
 drivers/gpu/drm/i915/i915_cmd_parser.c             |  18 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |   4 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   1 +
 drivers/gpu/drm/i915/i915_drv.h                    |  29 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  25 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  10 +-
 drivers/gpu/drm/i915/i915_params.h                 |   8 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  10 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   4 +-
 drivers/gpu/drm/i915/i915_query.c                  |  62 ++++
 drivers/gpu/drm/i915/i915_reg.h                    |  17 +-
 drivers/gpu/drm/i915/i915_request.c                |   5 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  31 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |  29 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |  18 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  12 +
 drivers/gpu/drm/i915/selftests/i915_active.c       |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |  20 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |  10 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   3 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |   3 +
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   4 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  87 ++++-
 drivers/gpu/drm/i915/selftests/librapl.c           |  10 +
 drivers/gpu/drm/i915/selftests/librapl.h           |   4 +
 include/uapi/drm/i915_drm.h                        | 393 +++++++++++++++++++--
 92 files changed, 2018 insertions(+), 575 deletions(-)
 create mode 100644 Documentation/gpu/driver-uapi.rst
 create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
