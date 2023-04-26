Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E76EF865
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 18:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47EC10E1E6;
	Wed, 26 Apr 2023 16:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12EB10E1DF;
 Wed, 26 Apr 2023 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682526391; x=1714062391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Tb64pCqpaZv7itm0AuAXxsOPFO+ecxgH9Ovs/Ou7KA=;
 b=C2L8yN+ChFow2A3AEZeOnx8RNE4GaFCM9hotmOpOYf8W72omNlHWnVRC
 r/c4krJrkvUh0G1SIUdeVH1sFbqqB58LfM+iObvYfOi1OtrVn9pe7vg2G
 Ar5sbfZ+tALUAGUBHwGbf0C5f66gaNbk2GjIccDqOjnYEC75N92kG3AYX
 5lnacNdoxQLDaNe24+ZSSpeC1yI2B9vCaphkevT2pzznxm86xN0p4fZ3K
 iGSd1P1Ls8FBhU678W/u4zkL94GpE0z/fLW0yyyPHmMzVaL8OnSXcc/MJ
 jvaH7ORO36AQF7N3DPFJdDATSBdOO32CpPqFCR+J4g05pJA7oUgdqos1L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331394304"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="331394304"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694011467"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="694011467"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga002.jf.intel.com with ESMTP; 26 Apr 2023 09:26:19 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Set wedged if enable guc communication failed
Date: Wed, 26 Apr 2023 09:11:33 -0700
Message-Id: <20230426161133.1009519-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add err code check for enable_communication on resume path. When resume failed, we can no longer use the GPU, marking the GPU as wedged.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c |  7 ++++++-
 drivers/gpu/drm/i915/gt/intel_reset.c | 19 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_reset.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++--
 4 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index e02cb90723ae..775ce511f810 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -373,8 +373,13 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
 	intel_ggtt_restore_fences(gt->ggtt);
 
 	ret = intel_uc_runtime_resume(&gt->uc);
-	if (ret)
+	if (ret && intel_uc_uses_guc_submission(&gt->uc)) {
+		/* Resume failed on GuC submission, we can no longer use the GPU, marking the GPU
+		 * as wedged.
+		 */
+		intel_gt_set_wedged_flag(gt);
 		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 195ff72d7a14..05142761770a 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -962,6 +962,20 @@ static void nop_submit_request(struct i915_request *request)
 	}
 }
 
+void intel_gt_set_wedged_flag(struct intel_gt *gt)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	if (test_bit(I915_WEDGED, &gt->reset.flags))
+		return;
+
+	for_each_engine(engine, gt, id)
+		engine->submit_request = nop_submit_request;
+
+	set_bit(I915_WEDGED, &gt->reset.flags);
+}
+
 static void __intel_gt_set_wedged(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
@@ -984,8 +998,8 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 	if (!INTEL_INFO(gt->i915)->gpu_reset_clobbers_display)
 		__intel_gt_reset(gt, ALL_ENGINES);
 
-	for_each_engine(engine, gt, id)
-		engine->submit_request = nop_submit_request;
+
+	intel_gt_set_wedged_flag(gt);
 
 	/*
 	 * Make sure no request can slip through without getting completed by
@@ -993,7 +1007,6 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 	 * in nop_submit_request.
 	 */
 	synchronize_rcu_expedited();
-	set_bit(I915_WEDGED, &gt->reset.flags);
 
 	/* Mark all executing requests as skipped */
 	local_bh_disable();
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
index 25c975b6e8fc..3796b8d877b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset.h
@@ -42,6 +42,7 @@ int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int *srcu);
 int __must_check intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu);
 void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
 
+void intel_gt_set_wedged_flag(struct intel_gt *gt);
 void intel_gt_set_wedged(struct intel_gt *gt);
 bool intel_gt_unset_wedged(struct intel_gt *gt);
 int intel_gt_terminally_wedged(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4ccb4be4c9cb..62c5a953991c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -700,8 +700,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 	/* Make sure we enable communication if and only if it's disabled */
 	GEM_BUG_ON(enable_communication == intel_guc_ct_enabled(&guc->ct));
 
-	if (enable_communication)
-		guc_enable_communication(guc);
+	if (enable_communication) {
+		err = guc_enable_communication(guc);
+		if (err) {
+			DRM_DEBUG_DRIVER("Failed to enable communication, %pe", ERR_PTR(err));
+			return err;
+		}
+	}
 
 	/* If we are only resuming GuC communication but not reloading
 	 * GuC, we need to ensure the ARAT timer interrupt is enabled
-- 
2.34.1

