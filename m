Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460517283CC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A90210E5D5;
	Thu,  8 Jun 2023 15:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4611010E0B8;
 Thu,  8 Jun 2023 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686238490; x=1717774490;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Sy9tlv6ZaWAkRETGtbxvEMc95D8XZ5Kbs6wHvWGezss=;
 b=gFps5VXYHbdBL2Wo4qaLnk0T2jt6ZWc36imr6YfwKA/2rGlxTEjTUkZY
 wgBJYEHX+g/iNfqn/xKIXh3tJMHTbDlff/9sqAyLX7OtCSHpzUHryXHnr
 D2CdLfZF+qH3tBbm5SBYt2it0ayGIUqETjOcXPc1Vypw9ayF2AzIusWsf
 9addLWNM8zerSMFKW2IygWCKqXBwGIrYIOan5cqgjV3Ku2IS5dHOsxb4R
 yYzhppNUVdSOAe4HvCJMYVBs7lSll/wwpAsnpA0YfRjiF7e/ClSI/K+jF
 MnxmdF9KPIqtBvws+BI7+KJopqaw42LonDAIYPyxGbL6OSYpKGACDosBc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443709001"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="443709001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739797780"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739797780"
Received: from rirwin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.213.239.227])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 08:34:46 -0700
Date: Thu, 8 Jun 2023 16:34:44 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZIH09fqe5v5yArsu@tursulin-desk>
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

Hi Dave, Daniel,

Here goes the final pull request for 6.5.

A few improvements to robustness of dealing with GuC communication issues,
compute applications, small BAR systems perf/OA monitoring.

Then a little bit more of Meteorlake enablement which this time round
includes the HuC loading code, another workaround, and UAPI for letting Mesa
set the PAT index when creating buffer objects.

And a bunch of small cleanups for different kconfig options, compilers, or
failures in error handling in selftests for hyphotetical scenarios. Some code
base cleanups here and there too.

Regards,

Tvrtko

drm-intel-gt-next-2023-06-08:
UAPI Changes:

- I915_GEM_CREATE_EXT_SET_PAT for Mesa on Meteorlake.

Driver Changes:

Fixes/improvements/new stuff:

- Use large rings for compute contexts (Chris Wilson)
- Better logging/debug of unexpected GuC communication issues (Michal Wajdeczko)
- Clear out entire reports after reading if not power of 2 size (Ashutosh Dixit)
- Limit lmem allocation size to succeed on SmallBars (Andrzej Hajda)
- perf/OA capture robustness improvements on DG2 (Umesh Nerlige Ramappa)
- Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv() (Dan Carpenter)

Future platform enablement:

- Add workaround 14016712196 (Tejas Upadhyay)
- HuC loading for MTL (Daniele Ceraolo Spurio)
- Allow user to set cache at BO creation (Fei Yang)

Miscellaneous:

- Use system include style for drm headers (Jani Nikula)
- Drop legacy CTB definitions (Michal Wajdeczko)
- Turn off the timer to sample frequencies when GT is parked (Ashutosh Dixit)
- Make PMU sample array two-dimensional (Ashutosh Dixit)
- Use the correct error value when kernel_context() fails (Andi Shyti)
- Fix second parameter type of pre-gen8 pte_encode callbacks (Nathan Chancellor)
- Fix parameter in gmch_ggtt_insert_{entries, page}() (Nathan Chancellor)
- Fix size_t format specifier in gsccs_send_message() (Nathan Chancellor)
- Use the fdinfo helper (Tvrtko Ursulin)
- Add some missing error propagation (Tvrtko Ursulin)
- Reduce I915_MAX_GT to 2 (Matt Atwood)
- Rename I915_PMU_MAX_GTS to I915_PMU_MAX_GT (Matt Atwood)
- Remove some obsolete definitions (John Harrison)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Tvrtko Ursulin)
The following changes since commit 2e1492835e439fceba57a5b0f9b17da8e78ffa3d:

  Merge tag 'drm-misc-next-2023-06-01' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-06-02 13:39:00 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-06-08

for you to fetch changes up to 24335848e543dc95c9e2ffa0108d879ffefd0442:

  drm/i915/gsc: Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv() (2023-06-08 02:11:04 +0200)

----------------------------------------------------------------
UAPI Changes:

- I915_GEM_CREATE_EXT_SET_PAT for Mesa on Meteorlake.

Driver Changes:

Fixes/improvements/new stuff:

- Use large rings for compute contexts (Chris Wilson)
- Better logging/debug of unexpected GuC communication issues (Michal Wajdeczko)
- Clear out entire reports after reading if not power of 2 size (Ashutosh Dixit)
- Limit lmem allocation size to succeed on SmallBars (Andrzej Hajda)
- perf/OA capture robustness improvements on DG2 (Umesh Nerlige Ramappa)
- Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv() (Dan Carpenter)

Future platform enablement:

- Add workaround 14016712196 (Tejas Upadhyay)
- HuC loading for MTL (Daniele Ceraolo Spurio)
- Allow user to set cache at BO creation (Fei Yang)

Miscellaneous:

- Use system include style for drm headers (Jani Nikula)
- Drop legacy CTB definitions (Michal Wajdeczko)
- Turn off the timer to sample frequencies when GT is parked (Ashutosh Dixit)
- Make PMU sample array two-dimensional (Ashutosh Dixit)
- Use the correct error value when kernel_context() fails (Andi Shyti)
- Fix second parameter type of pre-gen8 pte_encode callbacks (Nathan Chancellor)
- Fix parameter in gmch_ggtt_insert_{entries, page}() (Nathan Chancellor)
- Fix size_t format specifier in gsccs_send_message() (Nathan Chancellor)
- Use the fdinfo helper (Tvrtko Ursulin)
- Add some missing error propagation (Tvrtko Ursulin)
- Reduce I915_MAX_GT to 2 (Matt Atwood)
- Rename I915_PMU_MAX_GTS to I915_PMU_MAX_GT (Matt Atwood)
- Remove some obsolete definitions (John Harrison)

Merges:

- Merge drm/drm-next into drm-intel-gt-next (Tvrtko Ursulin)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Use the correct error value when kernel_context() fails

Andrzej Hajda (1):
      drm/i915/gt: limit lmem allocation size to succeed on SmallBars

Ashutosh Dixit (3):
      drm/i915/perf: Clear out entire reports after reading if not power of 2 size
      drm/i915/pmu: Turn off the timer to sample frequencies when GT is parked
      drm/i915/pmu: Make PMU sample array two-dimensional

Chris Wilson (1):
      drm/i915/gem: Use large rings for compute contexts

Dan Carpenter (1):
      drm/i915/gsc: Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv()

Daniele Ceraolo Spurio (7):
      drm/i915/uc: perma-pin firmwares
      drm/i915/huc: Parse the GSC-enabled HuC binary
      drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
      drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
      drm/i915/mtl/huc: auth HuC via GSC
      drm/i915/mtl/huc: Use the media gt for the HuC getparam
      drm/i915/huc: define HuC FW version for MTL

Fei Yang (1):
      drm/i915: Allow user to set cache at BO creation

Jani Nikula (1):
      drm/i915/gsc: use system include style for drm headers

John Harrison (1):
      drm/i915/guc: Remove some obsolete definitions

Matt Atwood (2):
      drm/i915: Reduce I915_MAX_GT to 2
      drm/i915: rename I915_PMU_MAX_GTS to I915_PMU_MAX_GT

Michal Wajdeczko (4):
      drm/i915/guc: Use FAST_REQUEST for non-blocking H2G calls
      drm/i915/guc: Update log for unsolicited CTB response
      drm/i915/guc: Track all sent actions to GuC
      drm/i915/guc: Drop legacy CTB definitions

Nathan Chancellor (3):
      drm/i915/gt: Fix second parameter type of pre-gen8 pte_encode callbacks
      drm/i915/gt: Fix parameter in gmch_ggtt_insert_{entries, page}()
      drm/i915/pxp: Fix size_t format specifier in gsccs_send_message()

Tejas Upadhyay (1):
      drm/i915/gt: Add workaround 14016712196

Tvrtko Ursulin (3):
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Use the fdinfo helper
      drm/i915/selftests: Add some missing error propagation

Umesh Nerlige Ramappa (2):
      i915/perf: Drop the aging_tail logic in perf OA
      i915/perf: Do not add ggtt offset to hw_tail

 drivers/gpu/drm/i915/Kconfig.debug                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |  40 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   6 +
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  14 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |  38 ++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |  29 +--
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |   8 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |  12 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |  11 +-
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |  21 --
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |  30 +++
 .../gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h  |  74 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  34 ++-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  81 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |  11 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |  33 ---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             | 224 ++++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |  26 ++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          | 235 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h          |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h       |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           | 133 +++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  26 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |   6 -
 drivers/gpu/drm/i915/i915_driver.c                 |   6 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |  65 +-----
 drivers/gpu/drm/i915/i915_drm_client.h             |  22 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   4 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   6 +-
 drivers/gpu/drm/i915/i915_getparam.c               |   6 +-
 drivers/gpu/drm/i915/i915_perf.c                   | 121 +++++------
 drivers/gpu/drm/i915/i915_perf_types.h             |  12 --
 drivers/gpu/drm/i915/i915_pmu.c                    |  34 +--
 drivers/gpu/drm/i915/i915_pmu.h                    |   8 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   3 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |  17 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |   2 +-
 include/uapi/drm/i915_drm.h                        |  44 +++-
 45 files changed, 1058 insertions(+), 444 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
