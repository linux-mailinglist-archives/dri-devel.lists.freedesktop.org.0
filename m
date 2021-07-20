Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E493D02CA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D146899FF;
	Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29EC899FF;
 Tue, 20 Jul 2021 20:40:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421872"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421872"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906053"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 00/42] Parallel submission aka multi-bb execbuf 
Date: Tue, 20 Jul 2021 13:57:20 -0700
Message-Id: <20210720205802.39610-1-matthew.brost@intel.com>
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

As discussed in [1] we are introducing a new parallel submission uAPI
for the i915 which allows more than 1 BB to be submitted in an execbuf
IOCTL. This is the implemenation for both GuC and execlists.

This series is broken into 5 parts.

1. Basic GuC submission. Patch 1 which the squashed version of series
[2].

2. A series of GuC patches which introduces a state machine to deal with
flow control conditions gracefully (e.g. don't punt them to the user).
These are patches 2-13.

3. Update the GuC backend / connections to uAPI to configure it for
parallel submission. These are patches 14-29. 

4. Update execbuf IOCTL to accept more than 1 BB in a single IOCTL.
These are patches 30-41.

5. A weak execlists implemenation for parallel submission. Patch 42. 

Looking for initial feedback all parts except #1.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/92028/
[2] https://patchwork.freedesktop.org/series/91840/

Matthew Brost (42):
  drm/i915/guc: GuC submission squashed into single patch
  drm/i915/guc: Allow flexible number of context ids
  drm/i915/guc: Connect the number of guc_ids to debugfs
  drm/i915/guc: Don't return -EAGAIN to user when guc_ids exhausted
  drm/i915/guc: Don't allow requests not ready to consume all guc_ids
  drm/i915/guc: Introduce guc_submit_engine object
  drm/i915/guc: Check return of __xa_store when registering a context
  drm/i915/guc: Non-static lrc descriptor registration buffer
  drm/i915/guc: Take GT PM ref when deregistering context
  drm/i915: Add GT PM unpark worker
  drm/i915/guc: Take engine PM when a context is pinned with GuC
    submission
  drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
  drm/i915/guc: Selftest for GuC flow control
  drm/i915: Add logical engine mapping
  drm/i915: Expose logical engine instance to user
  drm/i915/guc: Introduce context parent-child relationship
  drm/i915/guc: Implement GuC parent-child context pin / unpin functions
  drm/i915/guc: Add multi-lrc context registration
  drm/i915/guc: Ensure GuC schedule operations do not operate on child
    contexts
  drm/i915/guc: Assign contexts in parent-child relationship consecutive
    guc_ids
  drm/i915/guc: Add hang check to GuC submit engine
  drm/i915/guc: Add guc_child_context_destroy
  drm/i915/guc: Implement multi-lrc submission
  drm/i915/guc: Insert submit fences between requests in parent-child
    relationship
  drm/i915/guc: Implement multi-lrc reset
  drm/i915/guc: Update debugfs for GuC multi-lrc
  drm/i915: Connect UAPI to GuC multi-lrc interface
  drm/i915/guc: Add basic GuC multi-lrc selftest
  drm/i915/guc: Implement BB boundary preemption for multi-lrc
  i915/drm: Move secure execbuf check to execbuf2
  drm/i915: Move input/exec fence handling to i915_gem_execbuffer2
  drm/i915: Move output fence handling to i915_gem_execbuffer2
  drm/i915: Return output fence from i915_gem_do_execbuffer
  drm/i915: Store batch index in struct i915_execbuffer
  drm/i915: Allow callers of i915_gem_do_execbuffer to override the
    batch index
  drm/i915: Teach execbuf there can be more than one batch in the
    objects list
  drm/i915: Only track object dependencies on first request
  drm/i915: Force parallel contexts to use copy engine for reloc
  drm/i915: Multi-batch execbuffer2
  drm/i915: Eliminate unnecessary VMA calls for multi-BB submission
  drm/i915: Enable multi-bb execbuf
  drm/i915/execlists: Parallel submission support for execlists

 drivers/gpu/drm/i915/Makefile                 |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  176 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  541 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |    3 +-
 .../i915/gem/selftests/i915_gem_execbuffer.c  |   14 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |    6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   44 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |   16 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |    7 +
 drivers/gpu/drm/i915/gt/intel_context.c       |  275 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   82 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  115 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   67 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  242 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   71 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |    5 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   14 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |    4 +
 .../drm/i915/gt/intel_execlists_submission.c  |  313 +-
 .../drm/i915/gt/intel_execlists_submission.h  |    4 -
 drivers/gpu/drm/i915/gt/intel_gt.c            |   24 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   13 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c |   35 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h |   32 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |   21 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   |    9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |    3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   23 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           |    6 +-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |    1 -
 drivers/gpu/drm/i915/gt/intel_reset.c         |   58 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   47 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |    4 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   46 +-
 .../gpu/drm/i915/gt/intel_workarounds_types.h |    1 +
 drivers/gpu/drm/i915/gt/mock_engine.c         |   38 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   10 +
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   22 +
 .../drm/i915/gt/selftest_engine_heartbeat.h   |    2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  314 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   50 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  132 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   16 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   82 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  126 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  465 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  175 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   25 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   56 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   98 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 4961 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   20 +-
 .../i915/gt/uc/intel_guc_submission_types.h   |   67 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  101 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   11 +
 .../i915/gt/uc/selftest_guc_flow_control.c    |  581 ++
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  168 +
 drivers/gpu/drm/i915/i915_debugfs_params.c    |   31 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |    1 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |   25 +-
 drivers/gpu/drm/i915/i915_query.c             |    2 +
 drivers/gpu/drm/i915/i915_reg.h               |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  288 +-
 drivers/gpu/drm/i915/i915_request.h           |   43 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   36 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |   13 +-
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   22 +
 drivers/gpu/drm/i915/i915_trace.h             |  199 +-
 drivers/gpu/drm/i915/i915_vma.c               |   13 +-
 drivers/gpu/drm/i915/i915_vma.h               |   16 +-
 drivers/gpu/drm/i915/intel_wakeref.c          |    5 +
 drivers/gpu/drm/i915/intel_wakeref.h          |    1 +
 .../drm/i915/selftests/i915_live_selftests.h  |    2 +
 drivers/gpu/drm/i915/selftests/i915_request.c |    4 +-
 .../gpu/drm/i915/selftests/igt_flush_test.c   |    2 +-
 .../gpu/drm/i915/selftests/igt_live_test.c    |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |  101 +
 .../i915/selftests/intel_scheduler_helpers.h  |   36 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |    3 +-
 include/uapi/drm/i915_drm.h                   |  135 +-
 87 files changed, 9648 insertions(+), 1224 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
 create mode 100644 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h

-- 
2.28.0

