Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3073ED807
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A6289E9B;
	Mon, 16 Aug 2021 13:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF589E3B;
 Mon, 16 Aug 2021 13:56:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279607056"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="279607056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="441091153"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:56:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 00/22] Clean up GuC CI failures, simplify locking,
 and kernel DOC
Date: Mon, 16 Aug 2021 06:51:17 -0700
Message-Id: <20210816135139.10060-1-matthew.brost@intel.com>
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

Daniel Vetter pointed out that locking in the GuC submission code was
overly complicated, let's clean this up a bit before introducing more
features in the GuC submission backend.

Also fix some CI failures, port fixes from our internal tree, and add a
few more selftests for coverage.

Lastly, add some kernel DOC explaining how the GuC submission backend
works.

v2: Fix logic error in 'Workaround reset G2H is received after schedule
done G2H', don't propagate errors to dependent fences in execlists
submissiom, resolve checkpatch issues, resend to correct lists

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (22):
  drm/i915/guc: Fix blocked context accounting
  drm/i915/guc: Fix outstanding G2H accounting
  drm/i915/guc: Unwind context requests in reverse order
  drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
  drm/i915/guc: Workaround reset G2H is received after schedule done G2H
  drm/i915/execlists: Do not propagate errors to dependent fences
  drm/i915/selftests: Add a cancel request selftest that triggers a
    reset
  drm/i915/guc: Don't enable scheduling on a banned context, guc_id
    invalid, not registered
  drm/i915/selftests: Fix memory corruption in live_lrc_isolation
  drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H
  drm/i915/guc: Take context ref when cancelling request
  drm/i915/guc: Don't touch guc_state.sched_state without a lock
  drm/i915/guc: Reset LRC descriptor if register returns -ENODEV
  drm/i915: Allocate error capture in atomic context
  drm/i915/guc: Flush G2H work queue during reset
  drm/i915/guc: Release submit fence from an IRQ
  drm/i915/guc: Move guc_blocked fence to struct guc_state
  drm/i915/guc: Rework and simplify locking
  drm/i915/guc: Proper xarray usage for contexts_lookup
  drm/i915/guc: Drop pin count check trick between sched_disable and
    re-pin
  drm/i915/guc: Move GuC priority fields in context under guc_active
  drm/i915/guc: Add GuC kernel doc

 drivers/gpu/drm/i915/gt/intel_context.c       |   5 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  68 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   4 -
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  19 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 690 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++
 drivers/gpu/drm/i915/i915_gpu_error.c         |  37 +-
 drivers/gpu/drm/i915/i915_request.h           |  23 +-
 drivers/gpu/drm/i915/i915_trace.h             |   8 +-
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 drivers/gpu/drm/i915/selftests/i915_request.c | 100 +++
 .../i915/selftests/intel_scheduler_helpers.c  |  12 +
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 14 files changed, 813 insertions(+), 311 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

-- 
2.32.0

