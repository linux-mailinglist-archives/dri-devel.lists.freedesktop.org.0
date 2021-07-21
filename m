Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D13D136B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66E6E930;
	Wed, 21 Jul 2021 16:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E38E6E88A;
 Wed, 21 Jul 2021 16:11:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198669902"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="198669902"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564786540"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:11:42 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/14] drm/i915/guc: Enable GuC based power management
 features
Date: Wed, 21 Jul 2021 09:11:06 -0700
Message-Id: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series enables Single Loop Power Control (SLPC) feature in GuC.
GuC implements various power management algorithms as part of it's
operation. These need to be specifically enabled by KMD. They replace
the legacy host based management of these features.

With this series, we will enable two PM features - GTPerf and GuCRC. These
are the Turbo and RC6 equivalents of the host based version. GuC provides
various interfaces via host-to-guc messaging, which allows KMD to enable
these features after GuC is loaded and GuC submission is enabled. We will
specifically disable the IA/GT Balancer and Duty Cycle control features in
SLPC.

To enable GTPerf, KMD sends a specific h2g message after setting up
some shared data structures. As part of this, we will gate host RPS as 
well. GuC takes over the duties of requesting frequencies by monitoring
GPU busyness. We can influence what GuC requests by modifying the min 
and max frequencies setup by SLPC through the sysfs interfaces that have
been exposed by legacy Turbo. SLPC typically requests efficient frequency
instead of minimum frequency to optimize performance. It also does not
necessarily stick to platform max, and can request frequencies that are
much higher since pcode will ultimately grant the appropriate values.
However, we will force it to adhere to platform min and max values so as
to maintain legacy behavior. SLPC does not have the concept of waitboost,
so the boost_freq sysfs will show a '0' value for now. There is a patch
forthcoming to ensure the interface is not exposed when SLPC is enabled.

GuCRC is enabled similarly through a h2g message. We still need to enable
RC6 feature bit (GEN6_RC_CTL_RC6_ENABLE) before we send this out.
Render/Media power gating still needs to be enabled by host as before.
GuC will take care of setting up the hysterisis values for RC6, host
does not need to set this up anymore.

v2: Address review comments (Michal W)

Matthew Brost (1):
  drm/i915/guc: SQUASHED PATCH - DO NOT REVIEW

Vinay Belgaumkar (13):
  drm/i915/guc/slpc: Initial definitions for SLPC
  drm/i915/guc/slpc: Gate Host RPS when SLPC is enabled
  drm/i915/guc/slpc: Adding SLPC communication interfaces
  drm/i915/guc/slpc: Allocate, initialize and release SLPC
  drm/i915/guc/slpc: Enable SLPC and add related H2G events
  drm/i915/guc/slpc: Add methods to set min/max frequency
  drm/i915/guc/slpc: Add get max/min freq hooks
  drm/i915/guc/slpc: Add debugfs for SLPC info
  drm/i915/guc/slpc: Enable ARAT timer interrupt
  drm/i915/guc/slpc: Cache platform frequency limits
  drm/i915/guc/slpc: Sysfs hooks for SLPC
  drm/i915/guc/slpc: Add SLPC selftest
  drm/i915/guc/rc: Setup and enable GUCRC feature

 drivers/gpu/drm/i915/Makefile                 |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   21 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   16 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |   50 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   50 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   63 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   57 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |    4 +
 .../drm/i915/gt/intel_execlists_submission.c  |   89 +-
 .../drm/i915/gt/intel_execlists_submission.h  |    4 -
 drivers/gpu/drm/i915/gt/intel_gt.c            |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   22 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   50 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   42 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  190 ++
 drivers/gpu/drm/i915/gt/intel_rps.h           |   11 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   34 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   22 +
 .../drm/i915/gt/selftest_engine_heartbeat.h   |    2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  322 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   50 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  318 ++
 drivers/gpu/drm/i915/gt/selftest_slpc.h       |   12 +
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  132 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   21 +
 .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  201 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  100 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  107 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  464 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  133 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   17 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   48 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   90 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   81 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     |   31 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  607 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |   42 +
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   29 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2823 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   18 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  125 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   15 +
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   32 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
 drivers/gpu/drm/i915/i915_pmu.c               |    2 +-
 drivers/gpu/drm/i915/i915_reg.h               |    7 +
 drivers/gpu/drm/i915/i915_request.c           |  174 +-
 drivers/gpu/drm/i915/i915_request.h           |   28 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   16 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   10 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   22 +
 drivers/gpu/drm/i915/i915_sysfs.c             |   77 +-
 drivers/gpu/drm/i915/i915_trace.h             |  201 +-
 .../drm/i915/selftests/i915_live_selftests.h  |    1 +
 drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |    2 +-
 .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |   89 +
 .../i915/selftests/intel_scheduler_helpers.h  |   35 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
 include/uapi/drm/i915_drm.h                   |    9 +
 80 files changed, 6762 insertions(+), 959 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

-- 
2.25.0

