Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4D3F36B6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BD36EB37;
	Fri, 20 Aug 2021 22:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6D6EB2B;
 Fri, 20 Aug 2021 22:50:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580029"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580029"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098553"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 00/27] Parallel submission aka multi-bb execbuf
Date: Fri, 20 Aug 2021 15:44:19 -0700
Message-Id: <20210820224446.30620-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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

First patch in the series in a squashed patch of [3] and does not need
to be reviewed here.

The execbuf IOCTL changes have been done in a single large patch (#24)
as all the changes flow together and I believe a single patch will be
better if some one has to lookup this change in the future. Can split in
a series of smaller patches if desired.

This code is available in a public [4] repo for UMD teams to test there
code on.

v2: Drop complicated state machine to block in kernel if no guc_ids
available, perma-pin parallel contexts, reworker execbuf IOCTL to be a
series of loops inside the IOCTL rather than 1 large one on the outside,
address Daniel Vetter's comments, rebase on [3]  

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/92028/
[2] https://patchwork.freedesktop.org/series/93071/
[3] https://patchwork.freedesktop.org/series/93704/
[4] https://gitlab.freedesktop.org/mbrost/mbrost-drm-intel/-/tree/drm-intel-parallel

Matthew Brost (27):
  drm/i915/guc: Squash Clean up GuC CI failures, simplify locking, and
    kernel DOC
  drm/i915/guc: Allow flexible number of context ids
  drm/i915/guc: Connect the number of guc_ids to debugfs
  drm/i915/guc: Take GT PM ref when deregistering context
  drm/i915: Add GT PM unpark worker
  drm/i915/guc: Take engine PM when a context is pinned with GuC
    submission
  drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
  drm/i915: Add logical engine mapping
  drm/i915: Expose logical engine instance to user
  drm/i915/guc: Introduce context parent-child relationship
  drm/i915/guc: Implement parallel context pin / unpin functions
  drm/i915/guc: Add multi-lrc context registration
  drm/i915/guc: Ensure GuC schedule operations do not operate on child
    contexts
  drm/i915/guc: Assign contexts in parent-child relationship consecutive
    guc_ids
  drm/i915/guc: Implement multi-lrc submission
  drm/i915/guc: Insert submit fences between requests in parent-child
    relationship
  drm/i915/guc: Implement multi-lrc reset
  drm/i915/guc: Update debugfs for GuC multi-lrc
  drm/i915: Fix bug in user proto-context creation that leaked contexts
  drm/i915/guc: Connect UAPI to GuC multi-lrc interface
  drm/i915/doc: Update parallel submit doc to point to i915_drm.h
  drm/i915/guc: Add basic GuC multi-lrc selftest
  drm/i915/guc: Implement no mid batch preemption for multi-lrc
  drm/i915: Multi-BB execbuf
  drm/i915/guc: Handle errors in multi-lrc requests
  drm/i915: Enable multi-bb execbuf
  drm/i915/execlists: Weak parallel submission support for execlists

 Documentation/gpu/rfc/i915_parallel_execbuf.h |  122 -
 Documentation/gpu/rfc/i915_scheduler.rst      |    4 +-
 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  222 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  765 ++++--
 drivers/gpu/drm/i915/gt/intel_context.c       |   58 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   52 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  148 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   12 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   66 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |    9 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   20 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |    5 +
 .../drm/i915/gt/intel_execlists_submission.c  |   68 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |    3 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |    8 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   23 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c |   35 +
 .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h |   40 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   10 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |    7 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |    6 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |   29 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   61 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   30 +-
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |   36 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   10 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 2312 +++++++++++++----
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  126 +
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  180 ++
 drivers/gpu/drm/i915/i915_gpu_error.c         |   39 +-
 drivers/gpu/drm/i915/i915_query.c             |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  120 +-
 drivers/gpu/drm/i915/i915_request.h           |   40 +-
 drivers/gpu/drm/i915/i915_trace.h             |   12 +-
 drivers/gpu/drm/i915/i915_vma.c               |   21 +-
 drivers/gpu/drm/i915/i915_vma.h               |   13 +-
 drivers/gpu/drm/i915/intel_wakeref.c          |    5 +
 drivers/gpu/drm/i915/intel_wakeref.h          |   13 +
 .../drm/i915/selftests/i915_live_selftests.h  |    2 +
 drivers/gpu/drm/i915/selftests/i915_request.c |  100 +
 .../i915/selftests/intel_scheduler_helpers.c  |   12 +
 .../i915/selftests/intel_scheduler_helpers.h  |    2 +
 include/uapi/drm/i915_drm.h                   |  136 +-
 49 files changed, 3928 insertions(+), 1099 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c

-- 
2.32.0

