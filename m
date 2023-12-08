Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95180A89C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFD610E2AD;
	Fri,  8 Dec 2023 16:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6068F10E293;
 Fri,  8 Dec 2023 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702052308; x=1733588308;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=eNUeTgAulbzlZJiCr18dDw4ZNg/Mqd3bdc4GXTtv+Nw=;
 b=el9LqK/CqZxtEGjsgIAFg5iVJ/SMg/VMu/cqF+b9ujSK9IyCXO+RVss2
 T5QcodP6ssCHECBQTFhrTn4JbzL2qeIccMmTbguEOCn17Zgh8T8sv9odx
 3FLwxAhk6dxixRqEOFtqc4LUuAu6UizDcINS2OGkrU4yV7fLVbVR/0jR4
 M/3GanfRBty94TnARk3fhaSfGwKt+f76XPVdtRzB7RsaC/JNrpp1SdO+f
 0sTtQohZYWw1a8XAwSg2WaLX9l6Ql1y6r0JOgUYbma9qc3hrQ0LXbgdUE
 G2FY6ALFoTi0Wj6mVf3jW82N94SdwqNU7d8xhoIpRqIt9tK4+j8dQAg9T A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480621698"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480621698"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 08:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890169947"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890169947"
Received: from wcyu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.27.89])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 08:18:18 -0800
Date: Fri, 8 Dec 2023 18:18:15 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZXNBcsSwJEVsq9On@jlahtine-mobl.ger.corp.intel.com>
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

Hi Dave & Sima,

A rather late first drm-intel-gt-next PR towards v6.8.

As most significant change we have addition of the DRM fdinfo memory stats
functionality. Then DG2 and MTL workaround additions and fixes and a few
for older platforms as well. PMU WARN_ON splat cleanup.

The rest is mostly code cleanups and fixes for odd corner cases.

Best Regards, Joonas

***

drm-intel-gt-next-2023-12-08:

UAPI Changes:

-   drm/i915: Implement fdinfo memory stats printing

    Use the newly added drm_print_memory_stats helper to show memory
    utilisation of our objects in drm/driver specific fdinfo output.

    To collect the stats we walk the per memory regions object lists
    and accumulate object size into the respective drm_memory_stats
    categories.

Cross-subsystem Changes:

- Backmerge of drm-next (to bring drm-intel-next for PXP changes)

Driver Changes:

- Wa_18028616096 now applies to all DG2 (Matt R)
- Drop Wa_22014600077 on all DG2 (Matt R)
- Add new ATS-M device ID (Haridhar)
- More Meteorlake (MTL) workarounds (Matt R, Dnyaneshwar, Jonathan,
  Gustavo, Radhakrishna)
- PMU WARN_ON cleanup on driver unbind (Umesh)
- Limit GGTT WC flushing workaround to pre BXT/ICL platforms
- Complement implementation for Wa_16018031267 / Wa_16018063123
  (Andrzej, Jonathan, Nirmoy, Chris)

- Properly print internal GSC engine in trace logs (Tvrtko)
- Track gt pm wakerefs (Andrzej)
- Fix null deref bugs on perf code when perf is disabled (Harshit,
  Tvrtko)
- Fix __i915_request_create memory leak on driver unbind (Andrzej)
- Remove spurious unsupported HuC message on MTL (Daniele)
- Read a shadowed mmio register for ggtt flush (Vinay)
- Add missing new-line to GT_TRACE (Andrzej)
- Add drm_dbgs for critical PXP events (Alan)
- Skip pxp init if gt is wedged (Zhanjun)

- Replace custom intel runtime_pm tracker with ref_tracker library
  (Andrzej)
- Compiler warning/static checker/coding style cleanups (Arnd, Nirmoy,
  Soumya, Gilbert, Dorcas, Kunwu, Sam, Tvrtko)
- Code structure and helper cleanups (Jani, Tvrtko, Andi)
- Selftest improvements (John, Tvrtko, Andrzej)

The following changes since commit 11ae5eb516b656e8a0e4efbea90ea24c152a346d:

  Merge tag 'topic/vmemdup-user-array-2023-10-24-1' of git://anongit.freedesktop.org/drm/drm into drm-next (2023-10-24 11:13:29 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-12-08

for you to fetch changes up to be5bcc4be9d9d3ae294072441a66fe39b74e5bba:

  drm/i915/guc: Create the guc_to_i915() wrapper (2023-12-08 12:31:01 +0100)

----------------------------------------------------------------
UAPI Changes:

-   drm/i915: Implement fdinfo memory stats printing

    Use the newly added drm_print_memory_stats helper to show memory
    utilisation of our objects in drm/driver specific fdinfo output.

    To collect the stats we walk the per memory regions object lists
    and accumulate object size into the respective drm_memory_stats
    categories.

Cross-subsystem Changes:

- Backmerge of drm-next (to bring drm-intel-next for PXP changes)

Driver Changes:

- Wa_18028616096 now applies to all DG2 (Matt R)
- Drop Wa_22014600077 on all DG2 (Matt R)
- Add new ATS-M device ID (Haridhar)
- More Meteorlake (MTL) workarounds (Matt R, Dnyaneshwar, Jonathan,
  Gustavo, Radhakrishna)
- PMU WARN_ON cleanup on driver unbind (Umesh)
- Limit GGTT WC flushing workaround to pre BXT/ICL platforms
- Complement implementation for Wa_16018031267 / Wa_16018063123
  (Andrzej, Jonathan, Nirmoy, Chris)

- Properly print internal GSC engine in trace logs (Tvrtko)
- Track gt pm wakerefs (Andrzej)
- Fix null deref bugs on perf code when perf is disabled (Harshit,
  Tvrtko)
- Fix __i915_request_create memory leak on driver unbind (Andrzej)
- Remove spurious unsupported HuC message on MTL (Daniele)
- Read a shadowed mmio register for ggtt flush (Vinay)
- Add missing new-line to GT_TRACE (Andrzej)
- Add drm_dbgs for critical PXP events (Alan)
- Skip pxp init if gt is wedged (Zhanjun)

- Replace custom intel runtime_pm tracker with ref_tracker library
  (Andrzej)
- Compiler warning/static checker/coding style cleanups (Arnd, Nirmoy,
  Soumya, Gilbert, Dorcas, Kunwu, Sam, Tvrtko)
- Code structure and helper cleanups (Jani, Tvrtko, Andi)
- Selftest improvements (John, Tvrtko, Andrzej)

----------------------------------------------------------------
Alan Previn (1):
      drm/i915/pxp: Add drm_dbgs for critical PXP events.

Andi Shyti (1):
      drm/i915/guc: Create the guc_to_i915() wrapper

Andrzej Hajda (8):
      drm/i915: Reserve some kernel space per vm
      drm/i915: Add WABB blit for Wa_16018031267 / Wa_16018063123
      drm/i915/gt: add selftest to exercise WABB
      drm/i915/gt: add missing new-line to GT_TRACE
      drm/i915: do not clean GT table on error path
      drm/i915: Replace custom intel runtime_pm tracker with ref_tracker library
      drm/i915: Track gt pm wakerefs
      drm/i915/selftests: wait for active idle event in i915_active_unlock_wait

Arnd Bergmann (1):
      drm/i915/mtl: avoid stringop-overflow warning

Daniele Ceraolo Spurio (1):
      drm/i915/huc: Stop printing about unsupported HuC on MTL

Dnyaneshwar Bhadane (2):
      drm/i915/mtl: Add Wa_22016670082
      drm/i915/mtl: Add Wa_14019821291

Dorcas AnonoLitunya (1):
      drm/i915/gt: Remove prohibited space after opening parenthesis

Gilbert Adikankwu (1):
      drm/i915/gt: Remove unncessary {} from if-else

Gustavo Sousa (1):
      drm/i915/xelpmp: Add Wa_16021867713

Haridhar Kalvala (1):
      drm/i915: ATS-M device ID update

Harshit Mogalapalli (1):
      i915/perf: Fix NULL deref bugs with drm_dbg() calls

Jani Nikula (6):
      drm/i915/pmu: add pmu_to_i915() helper
      drm/i915/pmu: add event_to_pmu() helper
      drm/i915/pmu: rearrange hrtimer pointer chasing
      drm/i915: make some error capture functions static
      drm/i915: move gpu error debugfs to i915_gpu_error.c
      drm/i915: move gpu error sysfs to i915_gpu_error.c

John Harrison (2):
      drm/i915/guc: Fix for potential false positives in GuC hang selftest
      drm/i915/guc: Add a selftest for FAST_REQUEST errors

Jonathan Cavitt (2):
      drm/i915: Set copy engine arbitration for Wa_16018031267 / Wa_16018063123
      drm/i915/gt: Temporarily disable CPU caching into DMA for MTL

Kunwu Chan (1):
      drm/i915: Fix potential spectre vulnerability

Matt Roper (3):
      drm/i915/mcr: Hold GT forcewake during steering operations
      drm/i915/dg2: Wa_18028616096 now applies to all DG2
      drm/i915/dg2: Drop Wa_22014600077

Nirmoy Das (2):
      drm/i915/gt: Use proper priority enum instead of 0
      drm/i915: Flush WC GGTT only on required platforms

Radhakrishna Sripada (1):
      drm/i915/mtl: Update Wa_22018931422

Sam James (1):
      drm: i915: Adapt to -Walloc-size

Soumya Negi (1):
      drm/i915/gt: Remove {} from if-else

Tvrtko Ursulin (12):
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Add ability for tracking buffer objects per client
      drm/i915: Record which client owns a VM
      drm/i915: Track page table backing store usage
      drm/i915: Account ring buffer and context state storage
      drm/i915: Add stable memory region names
      drm/i915: Implement fdinfo memory stats printing
      drm/i915: Remove return type from i915_drm_client_remove_object
      drm/i915: Add __rcu annotation to cursor when iterating client objects
      drm/i915/gsc: Mark internal GSC engine with reserved uabi class
      drm/i915/selftests: Fix engine reset count storage for multi-tile
      drm/i915: Use internal class when counting engine resets

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Check if pmu is closed before stopping event

Vinay Belgaumkar (1):
      drm/i915: Read a shadowed mmio register for ggtt flush

Zhanjun Dong (1):
      drm/i915: Skip pxp init if gt is wedged

 drivers/gpu/drm/i915/Kconfig.debug                 |  18 ++
 drivers/gpu/drm/i915/display/intel_display_power.c |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  16 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  12 ++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  21 ++
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |  10 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  14 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |   4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |  43 ++++
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  13 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |  14 ++
 drivers/gpu/drm/i915/gt/intel_context.h            |   4 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   7 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |   8 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |  39 ++--
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  58 ++++--
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  13 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   9 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  23 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |  38 +++-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |   3 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |  26 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   5 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                | 100 +++++++++-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |  16 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |   7 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  38 ++--
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |  20 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   5 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |  65 ++++--
 drivers/gpu/drm/i915/gt/selftest_reset.c           |  10 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  17 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  23 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   5 -
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          | 115 +++++++++++
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                | 108 +---------
 drivers/gpu/drm/i915/i915_driver.c                 |  10 +-
 drivers/gpu/drm/i915/i915_drm_client.c             | 108 ++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h             |  42 ++++
 drivers/gpu/drm/i915/i915_gpu_error.c              | 194 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_gpu_error.h              |  44 ++--
 drivers/gpu/drm/i915/i915_perf.c                   |  15 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  86 ++++----
 drivers/gpu/drm/i915/i915_sysfs.c                  |  79 +-------
 drivers/gpu/drm/i915/intel_memory_region.c         |  19 ++
 drivers/gpu/drm/i915/intel_memory_region.h         |   1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            | 221 ++-------------------
 drivers/gpu/drm/i915/intel_runtime_pm.h            |  11 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |  35 +++-
 drivers/gpu/drm/i915/intel_wakeref.h               |  73 ++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |  18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |   5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |   6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |   1 +
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |   9 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.h     |   3 +-
 include/drm/i915_pciids.h                          |   3 +-
 80 files changed, 1322 insertions(+), 695 deletions(-)
