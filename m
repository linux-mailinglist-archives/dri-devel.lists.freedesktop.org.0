Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB65946F3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 01:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F68DD6F04;
	Mon, 15 Aug 2022 23:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902ADD6EF5;
 Mon, 15 Aug 2022 23:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660605745; x=1692141745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3BYs7DEwqC7+7x0zkYz3ETq3+BLk8JS8wrbtxUjRzqY=;
 b=evVxGHKQHX/UVbP4EscIlBIN8iee01V6lTAB9+jGFOHbKPkiBYwllMSF
 lFZPs11UGkX5M2NmhaYqrwnGOaRy3Q4kFRDxsz3t4xqntOP9sJdaGPtC5
 Ib3qxlRphWqxKPvP8YgV5C6Xz2/V7/C0mf0e/vZSAgkf6jdKC0oOV/bdw
 VuMQjn3Kz0pUKQhmeAFaJv4g3aP3djcJE4rSR623MBs2yReP4Osq0ac6/
 k4yNznEf2pJ1CiSatJUC0hGZB4UFh76UrWQO/aDlRpleTt/mErWvJP6jC
 DrLFiYv8nnPsUoy4dxJXCl14onWrGhtlR++n/lOLxsaGDjPucQMrF1lyF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="290832445"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="290832445"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 16:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="666854740"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2022 16:22:19 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Date: Mon, 15 Aug 2022 16:22:04 -0700
Message-Id: <20220815232204.34900-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host Turbo operates at efficient frequency when GT is not idle unless
the user or workload has forced it to a higher level. Replicate the same
behavior in SLPC by allowing the algorithm to use efficient frequency.
We had disabled it during boot due to concerns that it might break
kernel ABI for min frequency. However, this is not the case since
SLPC will still abide by the (min,max) range limits.

With this change, min freq will be at efficient frequency level at init
instead of fused min (RPn). If user chooses to reduce min freq below the
efficient freq, we will turn off usage of efficient frequency and honor
the user request. When a higher value is written, it will get toggled
back again.

The patch also corrects the register which needs to be read for obtaining
the correct efficient frequency for Gen9+.

We see much better perf numbers with benchmarks like glmark2 with
efficient frequency usage enabled as expected.

v2: Address review comments (Rodrigo)

BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         |  7 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 ++++-----------------
 drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
 3 files changed, 22 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index c7d381ad90cf..8c289a032103 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1107,7 +1107,12 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
 		caps->min_freq = (rp_state_cap >>  0) & 0xff;
 	} else {
 		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
-		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
+		if (GRAPHICS_VER(i915) >= 10)
+			caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
+						       intel_uncore_read(to_gt(i915)->uncore,
+						       GEN10_FREQ_INFO_REC));
+		else
+			caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
 		caps->min_freq = (rp_state_cap >> 16) & 0xff;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index e1fa1f32f29e..9d49ccef03bb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -137,17 +137,6 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
-{
-	u32 request[] = {
-		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
-		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
-		id,
-	};
-
-	return intel_guc_send(guc, request, ARRAY_SIZE(request));
-}
-
 static bool slpc_is_running(struct intel_guc_slpc *slpc)
 {
 	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
@@ -201,16 +190,6 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
 	return ret;
 }
 
-static int slpc_unset_param(struct intel_guc_slpc *slpc,
-			    u8 id)
-{
-	struct intel_guc *guc = slpc_to_guc(slpc);
-
-	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
-
-	return guc_action_slpc_unset_param(guc, id);
-}
-
 static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
@@ -491,6 +470,16 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 
+		/* Ignore efficient freq if lower min freq is requested */
+		ret = slpc_set_param(slpc,
+				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+				     val < slpc->rp1_freq);
+		if (unlikely(ret)) {
+			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
+					 ERR_PTR(ret));
+			return ret;
+		}
+
 		ret = slpc_set_param(slpc,
 				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 				     val);
@@ -587,7 +576,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 		return ret;
 
 	if (!slpc->min_freq_softlimit) {
-		slpc->min_freq_softlimit = slpc->min_freq;
+		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
+		if (unlikely(ret))
+			return ret;
 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
 	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
 		return intel_guc_slpc_set_min_freq(slpc,
@@ -597,29 +588,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
-static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
-{
-	int ret = 0;
-
-	if (ignore) {
-		ret = slpc_set_param(slpc,
-				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-				     ignore);
-		if (!ret)
-			return slpc_set_param(slpc,
-					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
-					      slpc->min_freq);
-	} else {
-		ret = slpc_unset_param(slpc,
-				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
-		if (!ret)
-			return slpc_unset_param(slpc,
-						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
-	}
-
-	return ret;
-}
-
 static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
 {
 	/* Force SLPC to used platform rp0 */
@@ -679,14 +647,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	slpc_get_rp_values(slpc);
 
-	/* Ignore efficient freq and set min to platform min */
-	ret = slpc_ignore_eff_freq(slpc, true);
-	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
-				 ERR_PTR(ret));
-		return ret;
-	}
-
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index 2aad2f0cc8db..ffc702b79579 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -196,6 +196,9 @@
 #define   RP1_CAP_MASK				REG_GENMASK(15, 8)
 #define   RPN_CAP_MASK				REG_GENMASK(23, 16)
 
+#define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
+#define   RPE_MASK				REG_GENMASK(15, 8)
+
 /* snb MCH registers for priority tuning */
 #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
 #define   SSKPD_NEW_WM0_MASK_HSW		REG_GENMASK64(63, 56)
-- 
2.35.1

