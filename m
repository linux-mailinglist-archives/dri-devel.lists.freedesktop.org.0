Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407E68CEA8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 06:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4D310E2E6;
	Tue,  7 Feb 2023 05:07:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022CD10E2E6;
 Tue,  7 Feb 2023 05:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675746429; x=1707282429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VlWrJxb4K9LbQgkYC4ocsUoNp8bNplZpPDd2WFwAf2U=;
 b=jv26s4yTq3TVO7S8q3mNPI1IblWDgSzhTjS9l7TTAvYQf18GqhfO55dp
 qibfAvYbUWQh0TQ3l6FPhAST0nFWKRPsJv2oGjT09fD8KCXe49B+elOP8
 3A1r5oucIATpNPtEKnq2tA+BXh5TjbUkkH8ODh64IB4HP26/EakPgdmPk
 OCcbTyAna5IYT/DPrGWvzT5oM1ZEwP5m8620Ix/ItllXxb/Wd5RX12odo
 Mglz0erQH70Hn7a14bXtYpNA2flaRTfGGUiCXFDrxr5XXIpkeDzBIxy+3
 qpTi2vErCC8Lz9xtqpXledueWBcvKUvzcUrmZ8aKamqHfRszRECpfgP2w A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309049944"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="309049944"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 21:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840631509"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="840631509"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 21:07:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 5/6] drm/i915/guc: More debug print updates - GuC SLPC
Date: Mon,  6 Feb 2023 21:07:16 -0800
Message-Id: <20230207050717.1833718-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
References: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Update a bunch more debug prints to use the new GT based scheme.

v2: Also change prints to use %pe for error values (MichalW).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c   |  8 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 61 ++++++++-------------
 2 files changed, 26 insertions(+), 43 deletions(-)

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
index 63464933cbceb..026d73855f36c 100644
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
@@ -171,14 +172,12 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
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
+		guc_probe_error(guc, "Failed to query task state: %pe\n", ERR_PTR(ret));
 
 	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
 
@@ -188,15 +187,14 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
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
+		guc_probe_error(guc, "Failed to set param %d to %u: %pe\n",
+				id, value, ERR_PTR(ret));
 
 	return ret;
 }
@@ -212,8 +210,8 @@ static int slpc_unset_param(struct intel_guc_slpc *slpc, u8 id)
 
 static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct intel_guc *guc = slpc_to_guc(slpc);
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
@@ -236,9 +234,8 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 					freq);
 		if (ret)
-			drm_notice(&i915->drm,
-				   "Failed to send set_param for min freq(%d): (%d)\n",
-				   freq, ret);
+			guc_notice(guc, "Failed to send set_param for min freq(%d): %pe\n",
+				   freq, ERR_PTR(ret));
 	}
 
 	return ret;
@@ -267,7 +264,6 @@ static void slpc_boost_work(struct work_struct *work)
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -275,9 +271,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
 	if (unlikely(err)) {
-		i915_probe_error(i915,
-				 "Failed to allocate SLPC struct (err=%pe)\n",
-				 ERR_PTR(err));
+		guc_probe_error(guc, "Failed to allocate SLPC struct: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
@@ -338,7 +332,6 @@ static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
 
 static int slpc_reset(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct intel_guc *guc = slpc_to_guc(slpc);
 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
 	int ret;
@@ -346,15 +339,14 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
 	ret = guc_action_slpc_reset(guc, offset);
 
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC reset action failed: %pe\n", ERR_PTR(ret));
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
@@ -495,8 +487,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
 			     val < slpc->rp1_freq);
 	if (ret) {
-		i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(slpc_to_guc(slpc), "Failed to toggle efficient freq: %pe\n",
+				ERR_PTR(ret));
 		goto out;
 	}
 
@@ -611,15 +603,12 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 
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
+		guc_err(slpc_to_guc(slpc), "Failed to get min freq: %pe\n", ERR_PTR(ret));
 		return false;
 	}
 
@@ -685,9 +674,8 @@ int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
 		if (ret)
-			drm_err(&i915->drm,
-				"Override gucrc mode %d failed %d\n",
-				mode, ret);
+			guc_err(slpc_to_guc(slpc), "Override RC mode %d failed: %pe\n",
+				mode, ERR_PTR(ret));
 	}
 
 	return ret;
@@ -702,9 +690,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_unset_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE);
 		if (ret)
-			drm_err(&i915->drm,
-				"Unsetting gucrc mode failed %d\n",
-				ret);
+			guc_err(slpc_to_guc(slpc), "Unsetting RC mode failed: %pe\n", ERR_PTR(ret));
 	}
 
 	return ret;
@@ -725,7 +711,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
  */
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
 	int ret;
 
 	GEM_BUG_ON(!slpc->vma);
@@ -734,8 +720,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	ret = slpc_reset(slpc);
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC Reset event returned: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
@@ -743,7 +728,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	if (unlikely(ret < 0))
 		return ret;
 
-	intel_guc_pm_intrmsk_enable(to_gt(i915));
+	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
 
 	slpc_get_rp_values(slpc);
 
@@ -753,16 +738,14 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to set SLPC max to RP0: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
 	/* Revert SLPC min/max to softlimits if necessary */
 	ret = slpc_set_softlimits(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "Failed to set SLPC softlimits: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 
-- 
2.39.1

