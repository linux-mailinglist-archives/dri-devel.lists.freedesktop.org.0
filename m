Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED458E42E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 02:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89288DF82F;
	Wed, 10 Aug 2022 00:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF40BDF7E6;
 Wed, 10 Aug 2022 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660092213; x=1691628213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9D74/qZCe/VWsjW3YltQLfgj6t+AO7P4OXWI1xp7RvM=;
 b=i36Uj2lwuD1FpBfLg5+Mk0r8GvItdXyzOrSEBHsPuiU6IFrVkeQUhc7W
 0LFa5+1CIebh2oEcyVjL4kDUdQVGQK4dpRwlWfrwZ2PfCj90tLuADPjZd
 tv1g1LWRowsRRMon2QodtgrlWFpxWq+7FBXJlql9VEi0iisdOrUffFiZi
 V8+fnRoZwMlQKOpbdBCOGI0jCMAY3t89BRjvhXzY5H+ym5/c8NDxg+Myo
 umbXuRKAoWH2cab/v1zAdRgwvpjQD4hGW1LU3CM05+cNOwIBPRsPZOw3q
 8Y8JlUO61LtS1x5CEGT2wPe9aqCyk0yCP9G9MlqjqRd3oLEbDk/MpPVPo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="271351301"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; d="scan'208";a="271351301"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 17:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; d="scan'208";a="581021751"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 17:43:31 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Date: Tue,  9 Aug 2022 17:03:06 -0700
Message-Id: <20220810000306.5476-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host Turbo operates at efficient frequency when GT is not idle unless
the user or workload has forced it to a higher level. Replicate the same
behavior in SLPC by allowing the algorithm to use efficient frequency.
We had disabled it during boot due to concerns that it might break
kernel ABI for min frequency. However, this is not the case, since
SLPC will still abide by the (min,max) range limits and pcode forces
frequency to 0 anyways when GT is in C6.

We also see much better perf numbers with benchmarks like glmark2 with
efficient frequency usage enabled.

Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency limits")

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 52 ---------------------
 1 file changed, 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index e1fa1f32f29e..4b824da3048a 100644
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
@@ -597,29 +576,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
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
@@ -679,14 +635,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
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
-- 
2.35.1

