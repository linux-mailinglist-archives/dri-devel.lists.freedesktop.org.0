Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2E5F1774
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AF310E484;
	Sat,  1 Oct 2022 00:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4B410E484;
 Sat,  1 Oct 2022 00:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664584932; x=1696120932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x7EcMXr1UubUyzuquPZblu1EW6W/+xVYNLRgy2qjmjE=;
 b=L21sJEXZ4F2rv9mJmKI1wld+1Tq3J1jyvoSYJe/NTlQv6U58BCXKHWJN
 KwBeKmhRzNdLQf+I2SPlG/kjRX3Rf7xNjt8hqo1mOsyw1seCgRAO94Wos
 poc0iJfmgL78Sytlvq+0Pk/4TwpkPATDGHtm34G+NOR78ECyLYiUOZrpQ
 0QnU4RJRqYE1ce7fsTRACTZaR+ybVxajfq2l+8hiOIH7rhYgPzKIhGScb
 BKvqytxO7PQFgSRDlpswCV3LaJYV87BBBkZ+GgzihuJPsektw3ZtfYe1K
 fGE1BI2QuYECsY0cH09Lav2nEZHn+9emiUk5F2Wxz0Qrh7BTmg8y3GciG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="328706554"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="328706554"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="656137817"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="656137817"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 30 Sep 2022 17:42:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/slpc: Update frequency debugfs for SLPC
Date: Fri, 30 Sep 2022 17:41:20 -0700
Message-Id: <20221001004120.2696-1-vinay.belgaumkar@intel.com>
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

Create a wrapper to print out the frequency debugfs for
SLPC and non-SLPC cases. Most of the RPS related information
is no longer valid when SLPC is enabled.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 157 +-------------
 drivers/gpu/drm/i915/gt/intel_rps.c           | 205 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h           |   2 +
 3 files changed, 208 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 9fd4d9255a97..d5afa08c54e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -344,162 +344,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
 		drm_printf(p, "efficient (RPe) frequency: %d MHz\n",
 			   intel_gpu_freq(rps, rps->efficient_freq));
 	} else if (GRAPHICS_VER(i915) >= 6) {
-		u32 rp_state_limits;
-		u32 gt_perf_status;
-		struct intel_rps_freq_caps caps;
-		u32 rpmodectl, rpinclimit, rpdeclimit;
-		u32 rpstat, cagf, reqf;
-		u32 rpcurupei, rpcurup, rpprevup;
-		u32 rpcurdownei, rpcurdown, rpprevdown;
-		u32 rpupei, rpupt, rpdownei, rpdownt;
-		u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
-
-		rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
-		gen6_rps_get_freq_caps(rps, &caps);
-		if (IS_GEN9_LP(i915))
-			gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
-		else
-			gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
-
-		/* RPSTAT1 is in the GT power well */
-		intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
-
-		reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
-		if (GRAPHICS_VER(i915) >= 9) {
-			reqf >>= 23;
-		} else {
-			reqf &= ~GEN6_TURBO_DISABLE;
-			if (IS_HASWELL(i915) || IS_BROADWELL(i915))
-				reqf >>= 24;
-			else
-				reqf >>= 25;
-		}
-		reqf = intel_gpu_freq(rps, reqf);
-
-		rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
-		rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
-		rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
-
-		rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
-		rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
-		rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
-		rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
-		rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
-		rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
-		rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
-
-		rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
-		rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
-
-		rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
-		rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
-
-		cagf = intel_rps_read_actual_frequency(rps);
-
-		intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
-
-		if (GRAPHICS_VER(i915) >= 11) {
-			pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
-			pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
-			/*
-			 * The equivalent to the PM ISR & IIR cannot be read
-			 * without affecting the current state of the system
-			 */
-			pm_isr = 0;
-			pm_iir = 0;
-		} else if (GRAPHICS_VER(i915) >= 8) {
-			pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
-			pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
-			pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
-			pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
-		} else {
-			pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
-			pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
-			pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
-			pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
-		}
-		pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
-
-		drm_printf(p, "Video Turbo Mode: %s\n",
-			   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
-		drm_printf(p, "HW control enabled: %s\n",
-			   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
-		drm_printf(p, "SW control enabled: %s\n",
-			   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
-
-		drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
-			   pm_ier, pm_imr, pm_mask);
-		if (GRAPHICS_VER(i915) <= 10)
-			drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
-				   pm_isr, pm_iir);
-		drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
-			   rps->pm_intrmsk_mbz);
-		drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
-		drm_printf(p, "Render p-state ratio: %d\n",
-			   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
-		drm_printf(p, "Render p-state VID: %d\n",
-			   gt_perf_status & 0xff);
-		drm_printf(p, "Render p-state limit: %d\n",
-			   rp_state_limits & 0xff);
-		drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
-		drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
-		drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
-		drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
-		drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
-		drm_printf(p, "CAGF: %dMHz\n", cagf);
-		drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
-			   rpcurupei,
-			   intel_gt_pm_interval_to_ns(gt, rpcurupei));
-		drm_printf(p, "RP CUR UP: %d (%lldns)\n",
-			   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
-		drm_printf(p, "RP PREV UP: %d (%lldns)\n",
-			   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
-		drm_printf(p, "Up threshold: %d%%\n",
-			   rps->power.up_threshold);
-		drm_printf(p, "RP UP EI: %d (%lldns)\n",
-			   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
-		drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
-			   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
-
-		drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
-			   rpcurdownei,
-			   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
-		drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
-			   rpcurdown,
-			   intel_gt_pm_interval_to_ns(gt, rpcurdown));
-		drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
-			   rpprevdown,
-			   intel_gt_pm_interval_to_ns(gt, rpprevdown));
-		drm_printf(p, "Down threshold: %d%%\n",
-			   rps->power.down_threshold);
-		drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
-			   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
-		drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
-			   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
-
-		drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
-			   intel_gpu_freq(rps, caps.min_freq));
-		drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
-			   intel_gpu_freq(rps, caps.rp1_freq));
-		drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
-			   intel_gpu_freq(rps, caps.rp0_freq));
-		drm_printf(p, "Max overclocked frequency: %dMHz\n",
-			   intel_gpu_freq(rps, rps->max_freq));
-
-		drm_printf(p, "Current freq: %d MHz\n",
-			   intel_gpu_freq(rps, rps->cur_freq));
-		drm_printf(p, "Actual freq: %d MHz\n", cagf);
-		drm_printf(p, "Idle freq: %d MHz\n",
-			   intel_gpu_freq(rps, rps->idle_freq));
-		drm_printf(p, "Min freq: %d MHz\n",
-			   intel_gpu_freq(rps, rps->min_freq));
-		drm_printf(p, "Boost freq: %d MHz\n",
-			   intel_gpu_freq(rps, rps->boost_freq));
-		drm_printf(p, "Max freq: %d MHz\n",
-			   intel_gpu_freq(rps, rps->max_freq));
-		drm_printf(p,
-			   "efficient (RPe) frequency: %d MHz\n",
-			   intel_gpu_freq(rps, rps->efficient_freq));
+		gen6_rps_frequency_dump(rps, p);
 	} else {
 		drm_puts(p, "no P-state info available\n");
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 17b40b625e31..d0847bd4b90f 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2219,6 +2219,211 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
 		return intel_gpu_freq(rps, rps->min_freq);
 }
 
+static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+	struct intel_uncore *uncore = gt->uncore;
+	struct intel_rps_freq_caps caps;
+	u32 pm_mask;
+
+	gen6_rps_get_freq_caps(rps, &caps);
+	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
+
+	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
+	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
+	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
+	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.min_freq));
+	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp1_freq));
+	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp0_freq));
+	drm_printf(p, "Current freq: %d MHz\n",
+		   intel_rps_get_requested_frequency(rps));
+	drm_printf(p, "Actual freq: %d MHz\n",
+		   intel_rps_read_actual_frequency(rps));
+	drm_printf(p, "Min freq: %d MHz\n",
+		   intel_rps_get_min_frequency(rps));
+	drm_printf(p, "Boost freq: %d MHz\n",
+		   intel_rps_get_boost_frequency(rps));
+	drm_printf(p, "Max freq: %d MHz\n",
+		   intel_rps_get_max_frequency(rps));
+	drm_printf(p,
+		   "efficient (RPe) frequency: %d MHz\n",
+		   intel_gpu_freq(rps, caps.rp1_freq));
+}
+
+static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+	struct drm_i915_private *i915 = gt->i915;
+	struct intel_uncore *uncore = gt->uncore;
+	struct intel_rps_freq_caps caps;
+	u32 rp_state_limits;
+	u32 gt_perf_status;
+	u32 rpmodectl, rpinclimit, rpdeclimit;
+	u32 rpstat, cagf, reqf;
+	u32 rpcurupei, rpcurup, rpprevup;
+	u32 rpcurdownei, rpcurdown, rpprevdown;
+	u32 rpupei, rpupt, rpdownei, rpdownt;
+	u32 pm_ier, pm_imr, pm_isr, pm_iir, pm_mask;
+
+	rp_state_limits = intel_uncore_read(uncore, GEN6_RP_STATE_LIMITS);
+	gen6_rps_get_freq_caps(rps, &caps);
+	if (IS_GEN9_LP(i915))
+		gt_perf_status = intel_uncore_read(uncore, BXT_GT_PERF_STATUS);
+	else
+		gt_perf_status = intel_uncore_read(uncore, GEN6_GT_PERF_STATUS);
+
+	/* RPSTAT1 is in the GT power well */
+	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
+
+	reqf = intel_uncore_read(uncore, GEN6_RPNSWREQ);
+	if (GRAPHICS_VER(i915) >= 9) {
+		reqf >>= 23;
+	} else {
+		reqf &= ~GEN6_TURBO_DISABLE;
+		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
+			reqf >>= 24;
+		else
+			reqf >>= 25;
+	}
+	reqf = intel_gpu_freq(rps, reqf);
+
+	rpmodectl = intel_uncore_read(uncore, GEN6_RP_CONTROL);
+	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
+	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
+
+	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
+	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
+	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
+	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
+	rpcurdownei = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN_EI) & GEN6_CURIAVG_MASK;
+	rpcurdown = intel_uncore_read(uncore, GEN6_RP_CUR_DOWN) & GEN6_CURBSYTAVG_MASK;
+	rpprevdown = intel_uncore_read(uncore, GEN6_RP_PREV_DOWN) & GEN6_CURBSYTAVG_MASK;
+
+	rpupei = intel_uncore_read(uncore, GEN6_RP_UP_EI);
+	rpupt = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
+
+	rpdownei = intel_uncore_read(uncore, GEN6_RP_DOWN_EI);
+	rpdownt = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
+
+	cagf = intel_rps_read_actual_frequency(rps);
+
+	intel_uncore_forcewake_put(uncore, FORCEWAKE_ALL);
+
+	if (GRAPHICS_VER(i915) >= 11) {
+		pm_ier = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE);
+		pm_imr = intel_uncore_read(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK);
+		/*
+		 * The equivalent to the PM ISR & IIR cannot be read
+		 * without affecting the current state of the system
+		 */
+		pm_isr = 0;
+		pm_iir = 0;
+	} else if (GRAPHICS_VER(i915) >= 8) {
+		pm_ier = intel_uncore_read(uncore, GEN8_GT_IER(2));
+		pm_imr = intel_uncore_read(uncore, GEN8_GT_IMR(2));
+		pm_isr = intel_uncore_read(uncore, GEN8_GT_ISR(2));
+		pm_iir = intel_uncore_read(uncore, GEN8_GT_IIR(2));
+	} else {
+		pm_ier = intel_uncore_read(uncore, GEN6_PMIER);
+		pm_imr = intel_uncore_read(uncore, GEN6_PMIMR);
+		pm_isr = intel_uncore_read(uncore, GEN6_PMISR);
+		pm_iir = intel_uncore_read(uncore, GEN6_PMIIR);
+	}
+	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
+
+	drm_printf(p, "Video Turbo Mode: %s\n",
+		   str_yes_no(rpmodectl & GEN6_RP_MEDIA_TURBO));
+	drm_printf(p, "HW control enabled: %s\n",
+		   str_yes_no(rpmodectl & GEN6_RP_ENABLE));
+	drm_printf(p, "SW control enabled: %s\n",
+		   str_yes_no((rpmodectl & GEN6_RP_MEDIA_MODE_MASK) == GEN6_RP_MEDIA_SW_MODE));
+
+	drm_printf(p, "PM IER=0x%08x IMR=0x%08x, MASK=0x%08x\n",
+		   pm_ier, pm_imr, pm_mask);
+	if (GRAPHICS_VER(i915) <= 10)
+		drm_printf(p, "PM ISR=0x%08x IIR=0x%08x\n",
+			   pm_isr, pm_iir);
+	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
+		   rps->pm_intrmsk_mbz);
+	drm_printf(p, "GT_PERF_STATUS: 0x%08x\n", gt_perf_status);
+	drm_printf(p, "Render p-state ratio: %d\n",
+		   (gt_perf_status & (GRAPHICS_VER(i915) >= 9 ? 0x1ff00 : 0xff00)) >> 8);
+	drm_printf(p, "Render p-state VID: %d\n",
+		   gt_perf_status & 0xff);
+	drm_printf(p, "Render p-state limit: %d\n",
+		   rp_state_limits & 0xff);
+	drm_printf(p, "RPSTAT1: 0x%08x\n", rpstat);
+	drm_printf(p, "RPMODECTL: 0x%08x\n", rpmodectl);
+	drm_printf(p, "RPINCLIMIT: 0x%08x\n", rpinclimit);
+	drm_printf(p, "RPDECLIMIT: 0x%08x\n", rpdeclimit);
+	drm_printf(p, "RPNSWREQ: %dMHz\n", reqf);
+	drm_printf(p, "CAGF: %dMHz\n", cagf);
+	drm_printf(p, "RP CUR UP EI: %d (%lldns)\n",
+		   rpcurupei,
+		   intel_gt_pm_interval_to_ns(gt, rpcurupei));
+	drm_printf(p, "RP CUR UP: %d (%lldns)\n",
+		   rpcurup, intel_gt_pm_interval_to_ns(gt, rpcurup));
+	drm_printf(p, "RP PREV UP: %d (%lldns)\n",
+		   rpprevup, intel_gt_pm_interval_to_ns(gt, rpprevup));
+	drm_printf(p, "Up threshold: %d%%\n",
+		   rps->power.up_threshold);
+	drm_printf(p, "RP UP EI: %d (%lldns)\n",
+		   rpupei, intel_gt_pm_interval_to_ns(gt, rpupei));
+	drm_printf(p, "RP UP THRESHOLD: %d (%lldns)\n",
+		   rpupt, intel_gt_pm_interval_to_ns(gt, rpupt));
+
+	drm_printf(p, "RP CUR DOWN EI: %d (%lldns)\n",
+		   rpcurdownei,
+		   intel_gt_pm_interval_to_ns(gt, rpcurdownei));
+	drm_printf(p, "RP CUR DOWN: %d (%lldns)\n",
+		   rpcurdown,
+		   intel_gt_pm_interval_to_ns(gt, rpcurdown));
+	drm_printf(p, "RP PREV DOWN: %d (%lldns)\n",
+		   rpprevdown,
+		   intel_gt_pm_interval_to_ns(gt, rpprevdown));
+	drm_printf(p, "Down threshold: %d%%\n",
+		   rps->power.down_threshold);
+	drm_printf(p, "RP DOWN EI: %d (%lldns)\n",
+		   rpdownei, intel_gt_pm_interval_to_ns(gt, rpdownei));
+	drm_printf(p, "RP DOWN THRESHOLD: %d (%lldns)\n",
+		   rpdownt, intel_gt_pm_interval_to_ns(gt, rpdownt));
+
+	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.min_freq));
+	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp1_freq));
+	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
+		   intel_gpu_freq(rps, caps.rp0_freq));
+	drm_printf(p, "Max overclocked frequency: %dMHz\n",
+		   intel_gpu_freq(rps, rps->max_freq));
+
+	drm_printf(p, "Current freq: %d MHz\n",
+		   intel_gpu_freq(rps, rps->cur_freq));
+	drm_printf(p, "Actual freq: %d MHz\n", cagf);
+	drm_printf(p, "Idle freq: %d MHz\n",
+		   intel_gpu_freq(rps, rps->idle_freq));
+	drm_printf(p, "Min freq: %d MHz\n",
+		   intel_gpu_freq(rps, rps->min_freq));
+	drm_printf(p, "Boost freq: %d MHz\n",
+		   intel_gpu_freq(rps, rps->boost_freq));
+	drm_printf(p, "Max freq: %d MHz\n",
+		   intel_gpu_freq(rps, rps->max_freq));
+	drm_printf(p,
+		   "efficient (RPe) frequency: %d MHz\n",
+		   intel_gpu_freq(rps, rps->efficient_freq));
+}
+
+void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
+{
+	if (rps_uses_slpc(rps))
+		return slpc_frequency_dump(rps, p);
+	else
+		return rps_frequency_dump(rps, p);
+}
+
 static int set_max_freq(struct intel_rps *rps, u32 val)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index 4509dfdc52e0..c408c26c5192 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -10,6 +10,7 @@
 #include "i915_reg_defs.h"
 
 struct i915_request;
+struct drm_printer;
 
 void intel_rps_init_early(struct intel_rps *rps);
 void intel_rps_init(struct intel_rps *rps);
@@ -54,6 +55,7 @@ void intel_rps_lower_unslice(struct intel_rps *rps);
 u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
 bool rps_read_mask_mmio(struct intel_rps *rps, i915_reg_t reg32, u32 mask);
 
+void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p);
 void gen5_rps_irq_handler(struct intel_rps *rps);
 void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
 void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
-- 
2.35.1

