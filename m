Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6953D3045
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB63B6F5AA;
	Thu, 22 Jul 2021 23:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505236EADF;
 Thu, 22 Jul 2021 23:36:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="208659255"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="208659255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="470860929"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/33] Remaining patches for basic GuC submission 
Date: Thu, 22 Jul 2021 16:53:53 -0700
Message-Id: <20210722235426.31831-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The remaining patches for basic GuC submission [1]. Need 4 more RB and
CI results to get this merged. 

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/91840/

Daniele Ceraolo Spurio (1):
  drm/i915/guc: Unblock GuC submission on Gen11+

John Harrison (11):
  drm/i915/guc: Make hangcheck work with GuC virtual engines
  drm/i915/guc: Don't complain about reset races
  drm/i915/guc: Enable GuC engine reset
  drm/i915/guc: Fix for error capture after full GPU reset with GuC
  drm/i915/guc: Hook GuC scheduling policies up
  drm/i915/guc: Connect reset modparam updates to GuC policy flags
  drm/i915/guc: Include scheduling policies in the debugfs state dump
  drm/i915/guc: Add golden context to GuC ADS
  drm/i915/selftest: Better error reporting from hangcheck selftest
  drm/i915/selftest: Fix hangcheck self test for GuC submission
  drm/i915/selftest: Bump selftest timeouts for hangcheck

Matthew Brost (18):
  drm/i915/guc: GuC virtual engines
  drm/i915: Hold reference to intel_context over life of i915_request
  drm/i915/guc: Disable bonding extension with GuC submission
  drm/i915/guc: Direct all breadcrumbs for a class to single breadcrumbs
  drm/i915: Add i915_sched_engine destroy vfunc
  drm/i915: Move active request tracking to a vfunc
  drm/i915/guc: Reset implementation for new GuC interface
  drm/i915: Reset GPU immediately if submission is disabled
  drm/i915/guc: Add disable interrupts to guc sanitize
  drm/i915/guc: Suspend/resume implementation for new interface
  drm/i915/guc: Handle context reset notification
  drm/i915/guc: Handle engine reset failure notification
  drm/i915/guc: Enable the timer expired interrupt for GuC
  drm/i915/guc: Capture error state on context reset
  drm/i915/guc: Implement banned contexts for GuC submission
  drm/i915/guc: Support request cancellation
  drm/i915/selftest: Increase some timeouts in live_requests
  drm/i915/guc: Implement GuC priority management

Rahul Kumar Singh (1):
  drm/i915/selftest: Fix MOCS selftest for GuC submission

Signed-off-by: John Harrison (1):
  drm/i915/guc: Provide mmio list to be saved/restored on engine reset

Signed-off-by: Rahul Kumar Singh (1):
  drm/i915/selftest: Fix workarounds selftest for GuC submission

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   15 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   16 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |   36 +
 drivers/gpu/drm/i915/gt/intel_context.h       |   23 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |   31 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   57 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  182 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |    4 +
 .../drm/i915/gt/intel_execlists_submission.c  |   89 +-
 .../drm/i915/gt/intel_execlists_submission.h  |    4 -
 drivers/gpu/drm/i915/gt/intel_gt.c            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    6 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   50 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   58 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   34 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   22 +
 .../drm/i915/gt/selftest_engine_heartbeat.h   |    2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  322 +++-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   50 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  134 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   38 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  464 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   11 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |    2 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 1601 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  101 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |    6 +
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   32 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
 drivers/gpu/drm/i915/i915_reg.h               |    1 +
 drivers/gpu/drm/i915/i915_request.c           |  162 +-
 drivers/gpu/drm/i915/i915_request.h           |   21 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   16 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   10 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   22 +
 drivers/gpu/drm/i915/i915_trace.h             |   37 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |   88 +
 .../i915/selftests/intel_scheduler_helpers.h  |   33 +
 include/uapi/drm/i915_drm.h                   |    9 +
 55 files changed, 3490 insertions(+), 635 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

-- 
2.28.0

