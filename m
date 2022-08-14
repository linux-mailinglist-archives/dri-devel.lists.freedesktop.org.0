Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0585926F7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 01:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFEB9AFBB;
	Sun, 14 Aug 2022 23:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858696202;
 Sun, 14 Aug 2022 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660520847; x=1692056847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3VOmdLi3nAM7UJj7qMQFP7OU0cqzv+9jg3OZkB4mh3w=;
 b=EjC6BJ/fJ5fyfUvlutKtkc1bnBY6JFTLAZkJctPVH+ZsKm08ZZ/alffw
 7JTMsTwEXtiYibnjFMzccffZepgovW1E6nwYeGg6/J6l7saQLTBeTpqKg
 9kDzyVY2Eo+ymOasifRbNB8bT5yDUFVdqxivsutdj284P6wjeU93A/eHH
 rBvznH/2u0aelxzKig3xBcKiQ3bLxVsi2S8JyOcO7J20PUcguwh7yUCLZ
 NgyJm2sXBwnqNykIIPA3mYC1YU4ymPCduYr2QyQrcQOFro2jdw0Xl9JEq
 9l8Fc7wns61cD6mdzEGeBRTPEk+jKvF5mioDRe0cTM1rNVQz5mxPRJA6k w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="271633337"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="271633337"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 16:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="603021589"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga007.jf.intel.com with ESMTP; 14 Aug 2022 16:47:25 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Date: Sun, 14 Aug 2022 16:46:54 -0700
Message-Id: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
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

BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 +++++++++++----------
 drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index c7d381ad90cf..281a086fc265 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1108,6 +1108,9 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
 	} else {
 		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
 		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
+		caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
+					       intel_uncore_read(to_gt(i915)->uncore,
+					       GEN10_FREQ_INFO_REC));
 		caps->min_freq = (rp_state_cap >> 16) & 0xff;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index e1fa1f32f29e..70a2af5f518d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -465,6 +465,29 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
 	return ret;
 }
 
+static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
+{
+	int ret = 0;
+
+	if (ignore) {
+		ret = slpc_set_param(slpc,
+				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
+				     ignore);
+		if (!ret)
+			return slpc_set_param(slpc,
+					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					      slpc->min_freq);
+	} else {
+		ret = slpc_unset_param(slpc,
+				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
+		if (!ret)
+			return slpc_unset_param(slpc,
+						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
+	}
+
+	return ret;
+}
+
 /**
  * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
@@ -491,6 +514,14 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 
+		/* Ignore efficient freq if lower min freq is requested */
+		ret = slpc_ignore_eff_freq(slpc, val < slpc->rp1_freq);
+		if (unlikely(ret)) {
+			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
+					 ERR_PTR(ret));
+			return ret;
+		}
+
 		ret = slpc_set_param(slpc,
 				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 				     val);
@@ -587,7 +618,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 		return ret;
 
 	if (!slpc->min_freq_softlimit) {
-		slpc->min_freq_softlimit = slpc->min_freq;
+		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
+		if (unlikely(ret))
+			return ret;
 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
 	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
 		return intel_guc_slpc_set_min_freq(slpc,
@@ -597,29 +630,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
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
@@ -679,14 +689,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
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

