Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EE799C80
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 05:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06310E0AD;
	Sun, 10 Sep 2023 03:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66CF10E05F;
 Sun, 10 Sep 2023 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694318328; x=1725854328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kQTYGaJk8H1kwhbMXB/e1Mu/vDhP+7vNrK1CB+dwSBs=;
 b=iKrLvWTSyDl+NNfGzIpzzkCWn6Bi2cxr6fb3rUO38TP3Ugv7vlRaMToC
 DP4a6vzqb9XXwhLRYKq0r6DEy/eYfgvp9USGFdExhke2PqrgH3+TQ7WcD
 Hs9EauN1xYqbUZVnriYl9VM7jw1lAG/NtTZQrz1BfVyvDTkKD0lFCSEhR
 ujhJJfVw+e5qBkJZ7OXar49dFfHqrBsJLiipoXDvvH8fxm8mEYXSiz0/J
 yDLeQT/iAyY3hF+cdaVQSvSB+TZfbJjQVu8uK8znFZSBKt1VsBsDXi9G3
 Te2OCHc7JkFzOmZF9tROwMGcRJ/s4u1N5x5cvGJk/k9qE5xgFSSDCoEo+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381684297"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="381684297"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 20:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736377104"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="736377104"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 20:58:47 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Sat,  9 Sep 2023 20:58:43 -0700
Message-Id: <20230910035846.493766-1-alan.previn.teres.alexis@intel.com>
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
Cc: , Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
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

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  7 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 81 ++++++++++++++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +
 drivers/gpu/drm/i915/intel_wakeref.c          | 14 +++-
 drivers/gpu/drm/i915/intel_wakeref.h          |  6 +-
 8 files changed, 101 insertions(+), 20 deletions(-)


base-commit: f8d21cb17a99b75862196036bb4bb93ee9637b74
-- 
2.39.0

