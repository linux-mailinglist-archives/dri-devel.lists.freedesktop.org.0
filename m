Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B367AF3BE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407810E17A;
	Tue, 26 Sep 2023 19:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59A18920D;
 Tue, 26 Sep 2023 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755120; x=1727291120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ou2xEFxkmW6QPuc8IEdLvOVsg/J5MQWpUOt+EGVy3os=;
 b=LIgZqYPUJTXrjPtGRtyRt/U293yn1/wx1jYaMLSH+TuDPBs9o6GpYDaw
 qbSjY0vBm+5MxRLsamZh1wPHbSG3L5FJhktZQVl15xSd8Ch6nc6A8PPBm
 oAHCVpuBJXUsRha5zJIoz/OHZJm9+JPq9OF3/tOgPk948Fc/SScpuPgEq
 YUynI43ArMtEJc9wXUPOif9d/xGiI+Hcsqk/ekk4o5z6aIC/AA2EZzTKi
 uTg9Ki3P40neyKAJSA2eN19bztQSidc9nlHnGfj4vt7tWe0wIrufwzqcm
 KNbvq0yT81zYI54V050WAn1ipMROaqCI0k6J6/+OGHO2NwRiZwG8siSyt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448141888"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448141888"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819142178"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="819142178"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 12:05:19 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Tue, 26 Sep 2023 12:05:15 -0700
Message-Id: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
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

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         | 13 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 86 ++++++++++++++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +
 drivers/gpu/drm/i915/intel_wakeref.c          | 14 ++-
 drivers/gpu/drm/i915/intel_wakeref.h          |  6 +-
 8 files changed, 112 insertions(+), 20 deletions(-)


base-commit: a42554bf0755b80fdfb8e91ca35ae6835bb3534d
-- 
2.39.0

