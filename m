Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1542199C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C0D6E22F;
	Mon,  4 Oct 2021 22:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170F16E21D;
 Mon,  4 Oct 2021 22:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854259"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854259"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735446"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 00/26] Parallel submission aka multi-bb execbuf
Date: Mon,  4 Oct 2021 15:06:11 -0700
Message-Id: <20211004220637.14746-1-matthew.brost@intel.com>
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

The execbuf IOCTL changes have been done in a single large patch (#21)
as all the changes flow together and I believe a single patch will be
better if some one has to lookup this change in the future. Can split in
a series of smaller patches if desired.

This code is available in a public [3] repo for UMD teams to test there
code on.

v2: Drop complicated state machine to block in kernel if no guc_ids
available, perma-pin parallel contexts, reworker execbuf IOCTL to be a
series of loops inside the IOCTL rather than 1 large one on the outside,
address Daniel Vetter's comments
v3: Address John Harrison's comments, add a couple of patches which fix
bugs found internally

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/92028/
[2] https://patchwork.freedesktop.org/series/93071/
[3] https://gitlab.freedesktop.org/mbrost/mbrost-drm-intel/-/tree/drm-intel-parallel

Matthew Brost (26):
  drm/i915/guc: Move GuC guc_id allocation under submission state
    sub-struct
  drm/i915/guc: Take GT PM ref when deregistering context
  drm/i915/guc: Take engine PM when a context is pinned with GuC
    submission
  drm/i915/guc: Don't call switch_to_kernel_context with GuC submission
  drm/i915: Add logical engine mapping
  drm/i915: Expose logical engine instance to user
  drm/i915/guc: Introduce context parent-child relationship
  drm/i915/guc: Add multi-lrc context registration
  drm/i915/guc: Ensure GuC schedule operations do not operate on child
    contexts
  drm/i915/guc: Assign contexts in parent-child relationship consecutive
    guc_ids
  drm/i915/guc: Implement parallel context pin / unpin functions
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
  drm/i915: Make request conflict tracking understand parallel submits
  drm/i915: Update I915_GEM_BUSY IOCTL to understand composite fences
  drm/i915: Enable multi-bb execbuf
  drm/i915/execlists: Weak parallel submission support for execlists

 Documentation/gpu/rfc/i915_parallel_execbuf.h |  122 --
 Documentation/gpu/rfc/i915_scheduler.rst      |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |   60 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  225 ++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |    6 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  796 ++++++---
 drivers/gpu/drm/i915/gt/intel_context.c       |   50 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   54 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |   73 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   12 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   66 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   13 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   37 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |    7 +
 .../drm/i915/gt/intel_execlists_submission.c  |   63 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   14 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |    7 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |   12 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   26 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   49 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   24 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   27 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 1456 ++++++++++++++---
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  179 ++
 drivers/gpu/drm/i915/i915_query.c             |    2 +
 drivers/gpu/drm/i915/i915_request.c           |  143 +-
 drivers/gpu/drm/i915/i915_request.h           |   23 +
 drivers/gpu/drm/i915/i915_vma.c               |   21 +-
 drivers/gpu/drm/i915/i915_vma.h               |   13 +-
 drivers/gpu/drm/i915/intel_wakeref.h          |   12 +
 .../drm/i915/selftests/i915_live_selftests.h  |    1 +
 include/uapi/drm/i915_drm.h                   |  139 +-
 34 files changed, 3038 insertions(+), 701 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c

-- 
2.32.0

