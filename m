Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070EC688B87
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09DA10E6C3;
	Fri,  3 Feb 2023 00:11:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2796910E6B5;
 Fri,  3 Feb 2023 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675383102; x=1706919102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4YRrj0a6wxAe/TQ2VEWOfH5z2lXTx66bxJee1W3gG4=;
 b=GWNVjKijI5mp8+PnX7XY3vSN4Xa8+ReVfwU7QMkz1GWdMaSgK0UlEyUQ
 vyTMoccAleELOrDoKyxvSHIVi4KoooCkDx5QswJuIVJjtrAnOQuAlPbhq
 DsRyfljwi5BoZ0oSq1Bf4UEci25WeK1lX8PqBc2m6l/Je0XDSNWVyKaOv
 KqeuzVxneY1wCwdQbYgRB9YJKdqkgeEO+4Fc+fLTkYjWERkd20zYF8TIR
 aQOb5QURBrfSJUqEyQP6F1695syRyUeD1x2e4MYekTzXOyz6YKaM4d1Pc
 rLbuiTVGbsKFTzdBRMNgWq77jI8ULb6ajm7QEOm79rLQY4VYC9u0xd5S2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393204048"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393204048"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789487443"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="789487443"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 16:11:40 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/6] drm/i915/guc: More debug print updates - GuC SLPC
Date: Thu,  2 Feb 2023 16:11:42 -0800
Message-Id: <20230203001143.3323433-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
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

Update a bunch more debug prints to use the new GT based scheme.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c   |  8 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 60 ++++++++-------------
 2 files changed, 26 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index b5855091cf6a9..23b287cefb943 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -6,6 +6,7 @@
 #include <linux/string_helpers.h>
 
 #include "intel_guc_rc.h"
+#include "intel_guc_print.h"
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
 
@@ -70,13 +71,12 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
 
 	ret = guc_action_control_gucrc(guc, enable);
 	if (ret) {
-		i915_probe_error(guc_to_gt(guc)->i915, "Failed to %s GuC RC (%pe)\n",
-				 str_enable_disable(enable), ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to %s RC (%pe)\n",
+				str_enable_disable(enable), ERR_PTR(ret));
 		return ret;
 	}
 
-	drm_info(&gt->i915->drm, "GuC RC: %s\n",
-		 str_enabled_disabled(enable));
+	guc_info(guc, "RC: %s\n", str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 63464933cbceb..91f4fa499cec4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_guc_slpc.h"
+#include "intel_guc_print.h"
 #include "intel_mchbar_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
@@ -171,14 +172,13 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
 static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
 	int ret;
 
 	ret = guc_action_slpc_query(guc, offset);
 	if (unlikely(ret))
-		i915_probe_error(i915, "Failed to query task state (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to query task state (%pe)\n",
+				ERR_PTR(ret));
 
 	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
 
@@ -188,15 +188,14 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	int ret;
 
 	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
 
 	ret = guc_action_slpc_set_param(guc, id, value);
 	if (ret)
-		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
-				 id, value, ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to set param %d to %u (%pe)\n",
+				id, value, ERR_PTR(ret));
 
 	return ret;
 }
@@ -212,8 +211,8 @@ static int slpc_unset_param(struct intel_guc_slpc *slpc, u8 id)
 
 static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
@@ -236,8 +235,7 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 					freq);
 		if (ret)
-			drm_notice(&i915->drm,
-				   "Failed to send set_param for min freq(%d): (%d)\n",
+			guc_notice(guc, "Failed to send set_param for min freq(%d): (%d)\n",
 				   freq, ret);
 	}
 
@@ -267,7 +265,6 @@ static void slpc_boost_work(struct work_struct *work)
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -275,9 +272,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
 	if (unlikely(err)) {
-		i915_probe_error(i915,
-				 "Failed to allocate SLPC struct (err=%pe)\n",
-				 ERR_PTR(err));
+		guc_probe_error(guc, "Failed to allocate SLPC struct (err=%pe)\n", ERR_PTR(err));
 		return err;
 	}
 
@@ -338,7 +333,6 @@ static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
 
 static int slpc_reset(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct intel_guc *guc = slpc_to_guc(slpc);
 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
 	int ret;
@@ -346,15 +340,15 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
 	ret = guc_action_slpc_reset(guc, offset);
 
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC reset action failed (%pe)\n",
+				ERR_PTR(ret));
 		return ret;
 	}
 
 	if (!ret) {
 		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
-			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
-					 slpc_get_state_string(slpc));
+			guc_probe_error(guc, "SLPC not enabled! State = %s\n",
+					slpc_get_state_string(slpc));
 			return -EIO;
 		}
 	}
@@ -495,8 +489,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
 			     val < slpc->rp1_freq);
 	if (ret) {
-		i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq (%pe)\n",
+				ERR_PTR(ret));
 		goto out;
 	}
 
@@ -611,15 +605,12 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 
 static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	int slpc_min_freq;
 	int ret;
 
 	ret = intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq);
 	if (ret) {
-		drm_err(&i915->drm,
-			"Failed to get min freq: (%d)\n",
-			ret);
+		guc_err(slpc_to_guc(slpc), "Failed to get min freq: (%d)\n", ret);
 		return false;
 	}
 
@@ -685,9 +676,7 @@ int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
 		if (ret)
-			drm_err(&i915->drm,
-				"Override gucrc mode %d failed %d\n",
-				mode, ret);
+			guc_err(slpc_to_guc(slpc), "Override gucrc mode %d failed %d\n", mode, ret);
 	}
 
 	return ret;
@@ -702,9 +691,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_unset_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE);
 		if (ret)
-			drm_err(&i915->drm,
-				"Unsetting gucrc mode failed %d\n",
-				ret);
+			guc_err(slpc_to_guc(slpc), "Unsetting gucrc mode failed %d\n", ret);
 	}
 
 	return ret;
@@ -725,7 +712,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
  */
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
 	int ret;
 
 	GEM_BUG_ON(!slpc->vma);
@@ -734,8 +721,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	ret = slpc_reset(slpc);
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC Reset event returned (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
@@ -743,7 +729,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	if (unlikely(ret < 0))
 		return ret;
 
-	intel_guc_pm_intrmsk_enable(to_gt(i915));
+	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
 
 	slpc_get_rp_values(slpc);
 
@@ -753,16 +739,14 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to set SLPC max to RP0 (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
 	/* Revert SLPC min/max to softlimits if necessary */
 	ret = slpc_set_softlimits(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to set SLPC softlimits (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.39.1

