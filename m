Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4E76DBA0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 01:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A10288C3D;
	Wed,  2 Aug 2023 23:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341210E155;
 Wed,  2 Aug 2023 23:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019304; x=1722555304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5t7TYLgeUB/BlwNsuUpdESjXCqLfPW0/alO2/ZN2AIU=;
 b=XlXvmt0vFP4XRQIRik3jZimLeSIUpnpWJxFu/h7yzUHfKyNGt7SNK1Rx
 chbWNeD/vbr/npw+IJHq2XJPmv7d/vlFRbF5gaiaMn6bfJQVtui6goLlL
 PouQSjKJ0ztoz6DYK7cYT86dHG7rkzpgNnX9hHTOryr1Y7epjLKzn0QRN
 Mzgz+AZ4ncxhoLTu7uZ3xrjbY/nWrZNwo8+CRWXWWnM1ee/fdT7eaJTIi
 nOompwWzOq+hRomOb3QVp2FIfRAGV+gFa5Df5pPiPVN12496oy3dN1TrO
 gx9loGQT79sYKB4kHCDQjTBsjx0A/P8GmPJdIUxzeA/9xnjdVGWLd54qN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367185052"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="367185052"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853030277"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="853030277"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 16:35:02 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 0/3] Resolve suspend-resume racing with GuC
 destroy-context-worker
Date: Wed,  2 Aug 2023 16:34:58 -0700
Message-Id: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the result of debugging issues root caused to
races between the GuC's destroyed_worker_func being triggered vs
repeating suspend-resume cycles with concurrent delayed
fence signals for engine-freeing.

The reproduction steps require that an app is created right before
the start of the suspend cycle where it creates a new gem
context and submits a tiny workload that would complete in the
middle of the suspend cycle. However this app uses dma-buffer
sharing or dma-fence with non-GPU objects or signals that
eventually triggers a FENCE_FREE via__i915_sw_fence_notify that
connects to engines_notify -> free_engines_rcu ->
intel_context_put -> kref_put(&ce->ref..) that queues the
worker after the GuCs CTB has been disabled (i.e. after
i915-gem's suspend-late flows).

This sequence is a corner-case and required repeating this
app->suspend->resume cycle ~1500 times across 4 identical
systems to see it once. That said, based on above callstack,
it is clear that merely flushing the context destruction worker,
which is obviously missing and needed, isn't sufficient.

Because of that, this series adds additional patches besides
the obvious flushing of the worker during the suspend flows.
It includes (1) closing a race between sending the context-
deregistration H2G vs the CTB getting disabled in the midst of it
(by detecing the failure and unrolling the guc-lrc-unpin flow) and
(2) not infinitely waiting in intel_gt_pm_wait_timeout_for_idle
when in the suspend-flow.

Alan Previn (3):
  drm/i915/guc: Flush context destruction worker at suspend
  drm/i915/guc: Close deregister-context race against CT-loss
  drm/i915/gt: Timeout when waiting for idle in suspending

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         | 13 +++++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  7 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 +++++++++++++++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  1 +
 drivers/gpu/drm/i915/intel_wakeref.c          | 14 ++++--
 drivers/gpu/drm/i915/intel_wakeref.h          |  5 ++-
 9 files changed, 80 insertions(+), 14 deletions(-)


base-commit: 20610a111d61d6945d578360942dc5c7bd828eb5
-- 
2.39.0

