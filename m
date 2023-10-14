Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9BB7C91F9
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 03:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8704910E09E;
	Sat, 14 Oct 2023 01:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7CD10E034;
 Sat, 14 Oct 2023 01:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245456; x=1728781456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=txXHICsUlPRUZho6EIAfv37c/vsQwUuxncwRv4578ww=;
 b=Wol2N96Rpobe2V2LgqXwg7gTn0WWquVB4e7+8RVOHech8dEoxaDavDil
 GwQtKh6sdCi3IR6PWq3bdr3HM42qG61GnpznwvmvH5CDWe7CRPhS2qddl
 fyF+V1YNpgWgJYPNCxw7BszDPkPsg69/wknhuhq984lPTeGqNd/fBU4F1
 w82Rbdiimzbz2FwQsnbC4KEV/3AFzGQR/OlB+iumYcQz+MCZZ4Xal8ppT
 Ru1FyhJwdla4GX8hVstlL+9u+9XEhnxyo0pTNmW/3WsywR/+zu7S3hXo8
 +z5mZImRm1LxQA7/f2a+yl+J++ASACQEDOPSbilxSYdtFQhPflgPL+HZ+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364656948"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364656948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 18:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898756731"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="898756731"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 18:02:24 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Fri, 13 Oct 2023 18:04:10 -0700
Message-Id: <20231014010413.256468-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the result of debugging issues root caused to
races between the GuC's destroyed_worker_func being triggered
vs repeating suspend-resume cycles with concurrent delayed
fence signals for engine-freeing.

The reproduction steps require that an app is launched right
before the start of the suspend cycle where it creates a
new gem context and submits a tiny workload that would
complete in the middle of the suspend cycle. However this
app uses dma-buffer sharing or dma-fence with non-GPU
objects or signals that eventually triggers a FENCE_FREE
via__i915_sw_fence_notify that connects to engines_notify ->
free_engines_rcu -> intel_context_put ->
kref_put(&ce->ref..) that queues the worker after the GuCs
CTB has been disabled (i.e. after i915-gem's suspend-late).

This sequence is a corner-case and required repeating this
app->suspend->resume cycle ~1500 times across 4 identical
systems to see it once. That said, based on above callstack,
it is clear that merely flushing the context destruction worker,
which is obviously missing and needed, isn't sufficient.

Because of that, this series adds additional patches besides
the obvious (Patch #1) flushing of the worker during the
suspend flows. It also includes (Patch #2) closing a race
between sending the context-deregistration H2G vs the CTB
getting disabled in the midst of it (by detecing the failure
and unrolling the guc-lrc-unpin flow) and (Patch #32) not
infinitely waiting in intel_gt_pm_wait_timeout_for_idle
when in the suspend-flow.

NOTE: We are still observing one more wakeref leak from gt
but not necessarilty guc. We are still debugging this so
this series will very likely get rev'd up again.

Changes from prior revs:
   v4: - In Patch #2, change the position of the calls into
         rcu_barrier based on latest testing data. (Alan/Anshuman).
       - In Patch #3, fix the timeout value selection for the
         final gt-pm idle-wait that was incorrectly using a 'ns'
         #define as a milisec timeout.
   v3: - In Patch #3, when deregister_context fails, instead
         of calling intel_gt_pm_put(that might sleep), call
         __intel_wakeref_put (without ASYNC flag) (Rodrigo/Anshuman).
       - In wait_for_suspend add an rcu_barrier before we
         proceed to wait for idle. (Anshuman)
   v2: - Patch #2 Restructure code in guc_lrc_desc_unpin so
         it's more readible to differentiate (1)direct guc-id
         cleanup ..vs (2) sending the H2G ctx-destroy action ..
         vs (3) the unrolling steps if the H2G fails.
       - Patch #2 Add a check to close the race sooner by checking
         for intel_guc_is_ready from destroyed_worker_func.
       - Patch #2 When guc_submission_send_busy_loop gets a
         failure from intel_guc_send_busy_loop, we need to undo
         i.e. decrement the outstanding_submission_g2h.
       - Patch #3 In wait_for_suspend, fix checking of return from
         intel_gt_pm_wait_timeout_for_idle to now use -ETIMEDOUT
         and add documentation for intel_wakeref_wait_for_idle.
         (Rodrigo).

Alan Previn (3):
  drm/i915/guc: Flush context destruction worker at suspend
  drm/i915/guc: Close deregister-context race against CT-loss
  drm/i915/gt: Timeout when waiting for idle in suspending

 drivers/gpu/drm/i915/gem/i915_gem_pm.c        | 10 +++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  7 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 86 ++++++++++++++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +
 drivers/gpu/drm/i915/intel_wakeref.c          | 14 ++-
 drivers/gpu/drm/i915/intel_wakeref.h          |  6 +-
 9 files changed, 116 insertions(+), 20 deletions(-)


base-commit: 13e6d61391ba3da0e26ce5c788d1fe26e036294c
-- 
2.39.0

