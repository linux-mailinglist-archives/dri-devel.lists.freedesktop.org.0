Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BF3DF74A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFF289D00;
	Tue,  3 Aug 2021 22:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B866B89B48;
 Tue,  3 Aug 2021 22:11:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745887"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745887"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512690"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/46] Parallel submission aka multi-bb execbuf
Date: Tue,  3 Aug 2021 15:28:57 -0700
Message-Id: <20210803222943.27686-1-matthew.brost@intel.com>
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

In addition to selftests in the series, an IGT is available implemented
in the first 4 patches [2].

Media UMD changes to land soon.

This series is broken into 5 parts.

1. A series of GuC patches which introduces a state machine to deal with
flow control conditions gracefully (e.g. don't punt them to the user).
These are patches 1-12.

2. Update the GuC backend / connections to uAPI to configure it for
parallel submission. These are patches 13-30. 

3. Update execbuf IOCTL to accept more than 1 BB in a single IOCTL.
These are patches 31-44.

4. A weak execlists implemenation for parallel submission. Patch 45. 

5. Add a heuristic to enable issue schedule disables immediately after
unpin. Not all that related but wanted to get this out on the list for
review and based on the tip of all of these patches. Patch 46.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/92028/
[2] https://patchwork.freedesktop.org/series/93071/

Matthew Brost (46):
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
  drm/i915/doc: Update parallel submit doc to point to i915_drm.h
  drm/i915/guc: Add basic GuC multi-lrc selftest
  drm/i915/guc: Extend GuC flow control selftest for multi-lrc
  drm/i915/guc: Implement no mid batch preemption for multi-lrc
  drm/i915: Move secure execbuf check to execbuf2
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
  drm/i915: Hold all parallel requests until last request, properly
    handle error
  drm/i915/guc: Handle errors in multi-lrc requests
  drm/i915: Enable multi-bb execbuf
  drm/i915/execlists: Weak parallel submission support for execlists
  drm/i915/guc: Add delay before disabling scheduling on contexts

 Documentation/gpu/rfc/i915_parallel_execbuf.h |  122 -
 Documentation/gpu/rfc/i915_scheduler.rst      |    4 +-
 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  159 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  582 ++-
 .../i915/gem/selftests/i915_gem_coherency.c   |    2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |    2 +-
 .../i915/gem/selftests/i915_gem_execbuffer.c  |   14 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |    2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |    2 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  236 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   81 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   62 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   12 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   66 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |    4 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |    5 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |    1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  233 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |    3 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    8 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   13 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c |   35 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h |   32 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |    3 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   31 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           |    6 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   10 +
 .../gpu/drm/i915/gt/intel_ring_submission.c   |    5 +-
 drivers/gpu/drm/i915/gt/mock_engine.c         |    4 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   46 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   43 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |    9 +
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   59 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   10 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 3159 +++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |    2 +
 .../i915/gt/uc/intel_guc_submission_types.h   |   67 +
 .../i915/gt/uc/selftest_guc_flow_control.c    |  891 +++++
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  179 +
 drivers/gpu/drm/i915/i915_query.c             |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  120 +-
 drivers/gpu/drm/i915/i915_request.h           |   23 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   22 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |    3 +
 drivers/gpu/drm/i915/i915_selftest.h          |    2 +
 drivers/gpu/drm/i915/i915_trace.h             |   10 +
 drivers/gpu/drm/i915/i915_vma.c               |   13 +-
 drivers/gpu/drm/i915/i915_vma.h               |   16 +-
 drivers/gpu/drm/i915/intel_wakeref.c          |    5 +
 drivers/gpu/drm/i915/intel_wakeref.h          |    1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |    2 +-
 .../drm/i915/selftests/i915_live_selftests.h  |    2 +
 drivers/gpu/drm/i915/selftests/i915_perf.c    |    2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |    2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |    2 +-
 .../i915/selftests/intel_scheduler_helpers.c  |   12 +
 .../i915/selftests/intel_scheduler_helpers.h  |    2 +
 include/uapi/drm/i915_drm.h                   |  136 +-
 63 files changed, 5741 insertions(+), 862 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_flow_control.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c

-- 
2.28.0

