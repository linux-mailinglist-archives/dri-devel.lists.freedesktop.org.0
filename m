Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72793FE6BC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 02:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B0C6E405;
	Thu,  2 Sep 2021 00:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361056E405;
 Thu,  2 Sep 2021 00:52:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198468225"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198468225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="646030140"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:52:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, John.C.Harrison@Intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 00/25] Clean up GuC CI failures, simplify locking,
 and kernel DOC
Date: Wed,  1 Sep 2021 17:49:57 -0700
Message-Id: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
v3: Fix issue kicking tasklet, drop guc_active, fix ref counting in
xarray, add guc_id sub structure, drop inline fuctions, and various
other cleanup suggested by Daniel
v4: Address Daniele's feedback, rebase to tip, resend for CI
v5 [Daniele taking over while Matt is out]: drop patches 8 and 27 for
now (not critical, Matt will update and resend when he's back), address
review comments, improve kerneldoc. Also move all code related to busy
loop to patch 2 so we have a standalone fix.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> #v5

Matthew Brost (25):
  drm/i915/guc: Fix blocked context accounting
  drm/i915/guc: Fix outstanding G2H accounting
  drm/i915/guc: Unwind context requests in reverse order
  drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
  drm/i915/guc: Process all G2H message at once in work queue
  drm/i915/guc: Workaround reset G2H is received after schedule done G2H
  Revert "drm/i915/gt: Propagate change in error status to children on
    unhold"
  drm/i915/guc: Kick tasklet after queuing a request
  drm/i915/guc: Don't enable scheduling on a banned context, guc_id
    invalid, not registered
  drm/i915/guc: Copy whole golden context, set engine state size of
    subset
  drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H
  drm/i915/guc: Take context ref when cancelling request
  drm/i915/guc: Don't touch guc_state.sched_state without a lock
  drm/i915/guc: Reset LRC descriptor if register returns -ENODEV
  drm/i915: Allocate error capture in nowait context
  drm/i915/guc: Flush G2H work queue during reset
  drm/i915/guc: Release submit fence from an irq_work
  drm/i915/guc: Move guc_blocked fence to struct guc_state
  drm/i915/guc: Rework and simplify locking
  drm/i915/guc: Proper xarray usage for contexts_lookup
  drm/i915/guc: Drop pin count check trick between sched_disable and
    re-pin
  drm/i915/guc: Move GuC priority fields in context under guc_active
  drm/i915/guc: Move fields protected by guc->contexts_lock into sub
    structure
  drm/i915/guc: Drop guc_active move everything into guc_state
  drm/i915/guc: Add GuC kernel doc

 Documentation/gpu/i915.rst                    |   2 +
 drivers/gpu/drm/i915/gt/intel_context.c       |  19 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  80 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   4 -
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  68 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 921 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 127 +++
 drivers/gpu/drm/i915/i915_gpu_error.c         |  39 +-
 drivers/gpu/drm/i915/i915_request.h           |  26 +-
 drivers/gpu/drm/i915/i915_trace.h             |  12 +-
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../i915/selftests/intel_scheduler_helpers.c  |  12 +
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 16 files changed, 884 insertions(+), 467 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

-- 
2.25.1

