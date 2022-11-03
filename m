Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264D6173C4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 02:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A410E55E;
	Thu,  3 Nov 2022 01:33:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669B10E55A;
 Thu,  3 Nov 2022 01:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667439196; x=1698975196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XJVUY0ypgogvw5FGeRhx5Q+ydRs2Px4kwblb6tXcbxk=;
 b=cCyucFIliEqjlgqOyZDRJADe04XKdbgKUM8pJa0gSWmhcj0eYwK1FY8p
 LpcWY4oegQVSsV2pziMz31kVUtT9UzQH4p9J4tERLdU5xKA9mago4RF1p
 URVdAbeUkil3CWChRSYkKQ4ehjT1piQAUK3fjG1g3NuFMZXz6fmXOHUl+
 sOw1nhnMfhDrIwyFFqpUp7IJttfxoz0nX3zgtpYfdLkD+m1bdhdrfERkB
 4qgSENgETo0AfAahHbCS2DHyWvQaLI7sx4tqAgZMxBVBSQLh2OrwZ3SJl
 ZtzqU0d/Mj0Y6hK9j+hNKNNjjXUN8qJqyidOA8VSYUMBxgDIwRKJKGGO9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289272147"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="289272147"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 18:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777115116"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="777115116"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 18:33:15 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915: Don't wait forever in drop_caches
Date: Wed,  2 Nov 2022 18:35:02 -0700
Message-Id: <20221103013502.2804729-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

At the end of each test, IGT does a drop caches call via debugfs with
special flags set. One of the possible paths waits for idle with an
infinite timeout. That causes problems for debugging issues when CI
catches a "can't go idle" test failure. Best case, the CI system times
out (after 90s), attempts a bunch of state dump actions and then
reboots the system to recover it. Worst case, the CI system can't do
anything at all and then times out (after 1000s) and simply reboots.
Sometimes a serial port log of dmesg might be available, sometimes not.

So rather than making life hard for ourselves, change the timeout to
be 10s rather than infinite. Also, trigger the standard
wedge/reset/recover sequence so that testing can continue with a
working system (if possible).

v2: Rationalise timeout defines (review feedback from Jani & Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 10 ++++++++--
 drivers/gpu/drm/i915/i915_drv.h     |  2 --
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index ae987e92251dd..a224584ea4eb1 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -621,6 +621,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
 			i915_perf_noa_delay_set,
 			"%llu\n");
 
+#define DROPCACHE_IDLE_ENGINES_TIMEOUT_MS	200
+#define DROPCACHE_IDLE_GT_TIMEOUT		(HZ * 10)
+
 #define DROP_UNBOUND	BIT(0)
 #define DROP_BOUND	BIT(1)
 #define DROP_RETIRE	BIT(2)
@@ -641,6 +644,7 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
 		  DROP_RESET_ACTIVE | \
 		  DROP_RESET_SEQNO | \
 		  DROP_RCU)
+
 static int
 i915_drop_caches_get(void *data, u64 *val)
 {
@@ -654,14 +658,16 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
 	int ret;
 
 	if (val & DROP_RESET_ACTIVE &&
-	    wait_for(intel_engines_are_idle(gt), I915_IDLE_ENGINES_TIMEOUT))
+	    wait_for(intel_engines_are_idle(gt), DROPCACHE_IDLE_ENGINES_TIMEOUT_MS))
 		intel_gt_set_wedged(gt);
 
 	if (val & DROP_RETIRE)
 		intel_gt_retire_requests(gt);
 
 	if (val & (DROP_IDLE | DROP_ACTIVE)) {
-		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
+		ret = intel_gt_wait_for_idle(gt, DROPCACHE_IDLE_GT_TIMEOUT);
+		if (ret == -ETIME)
+			intel_gt_set_wedged(gt);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 05b3300cc4edf..4c2adaad8e9ed 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -162,8 +162,6 @@ struct i915_gem_mm {
 	u32 shrink_count;
 };
 
-#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
-
 unsigned long i915_fence_context_timeout(const struct drm_i915_private *i915,
 					 u64 context);
 
-- 
2.37.3

