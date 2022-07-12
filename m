Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1A572A04
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C808E976D1;
	Tue, 12 Jul 2022 23:31:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDAA976B9;
 Tue, 12 Jul 2022 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668697; x=1689204697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dT+uNgZXsC1HYSIFLrHz/ls3gdspPj2YRZC3shcCVcE=;
 b=GCxsQ/idXITZGLt7a3BG4atNPZ/MZbTXZOwsR1czHG81yS9Lh3h6i1R9
 ZyNh8r/4ejLb8LbhA7+z1Vf6Rr2jkaOpb3jFyMY19wRKeQShrqrTRNCli
 F1W1fIrGyAm+u0v6giT9AfLtqnVYYt4vErv90kCKcJaHtZlashe6f0EF4
 JjSwysd/h323zuFwSzsviiXH91/KcnGinB4s5oMN380kaqWEwLwY89+3x
 0g4KMTOlcKCyTgtIbC+2Liq5WPN4TZmdonqdbKvtpolUUuFohqoSiSOWA
 17Yh6H5OeTuO/Yk9pFiN6/489pZ/db8PGtWuARQ7g2hIRMcLqh4B6WQXq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812562"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812562"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137758"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 02/12] drm/i915/guc: Don't call ring_is_idle in GuC submission
Date: Tue, 12 Jul 2022 16:31:26 -0700
Message-Id: <20220712233136.1044951-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

The engine registers really shouldn't be touched during GuC submission
as the GuC owns the registers. Don't call ring_is_idle and tie
intel_engine_is_idle strictly to the engine pm.

Because intel_engine_is_idle tied to the engine pm, retire requests
before checking intel_engines_are_idle in gt_drop_caches, and lastly
increase the timeout in gt_drop_caches for the intel_engines_are_idle
check.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_debugfs.c       |  6 +++---
 drivers/gpu/drm/i915/i915_drv.h           |  2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 283870c659911..959a7c92e8f4d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1602,6 +1602,9 @@ static bool ring_is_idle(struct intel_engine_cs *engine)
 {
 	bool idle = true;
 
+	/* GuC submission shouldn't access HEAD & TAIL via MMIO */
+	GEM_BUG_ON(intel_engine_uses_guc(engine));
+
 	if (I915_SELFTEST_ONLY(!engine->mmio_base))
 		return true;
 
@@ -1668,6 +1671,16 @@ bool intel_engine_is_idle(struct intel_engine_cs *engine)
 	if (!i915_sched_engine_is_empty(engine->sched_engine))
 		return false;
 
+	/*
+	 * We shouldn't touch engine registers with GuC submission as the GuC
+	 * owns the registers. Let's tie the idle to engine pm, at worst this
+	 * function sometimes will falsely report non-idle when idle during the
+	 * delay to retire requests or with virtual engines and a request
+	 * running on another instance within the same class / submit mask.
+	 */
+	if (intel_engine_uses_guc(engine))
+		return false;
+
 	/* Ring stopped? */
 	return ring_is_idle(engine);
 }
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 94e5c29d2ee3a..ee5334840e9cb 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -654,13 +654,13 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
 {
 	int ret;
 
+	if (val & DROP_RETIRE || val & DROP_RESET_ACTIVE)
+		intel_gt_retire_requests(gt);
+
 	if (val & DROP_RESET_ACTIVE &&
 	    wait_for(intel_engines_are_idle(gt), I915_IDLE_ENGINES_TIMEOUT))
 		intel_gt_set_wedged(gt);
 
-	if (val & DROP_RETIRE)
-		intel_gt_retire_requests(gt);
-
 	if (val & (DROP_IDLE | DROP_ACTIVE)) {
 		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c22f29c3faa0e..53c7474dde495 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -278,7 +278,7 @@ struct i915_gem_mm {
 	u32 shrink_count;
 };
 
-#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
+#define I915_IDLE_ENGINES_TIMEOUT (500) /* in ms */
 
 unsigned long i915_fence_context_timeout(const struct drm_i915_private *i915,
 					 u64 context);
-- 
2.36.0

