Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E353225D049
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 06:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B086E225;
	Fri,  4 Sep 2020 04:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BD46E22B;
 Fri,  4 Sep 2020 04:18:37 +0000 (UTC)
IronPort-SDR: hsEZU01pqFi7UL93TPBfVJXqCtjpGIYb5tQBTncQBL3mf4Zai/kV9jIK3XaaJ484FpytHgEqGA
 wcOb6+5nJC+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175745515"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="175745515"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:18:37 -0700
IronPort-SDR: ODh+1Zi7nZEONBuZn00QyB5ZDub+bxQBD/pqHRa3JPuVg3D2Pe7Sa8f74M12HAAThIbTKdSKkC
 pmXrHd+HHWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="339527309"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2020 21:18:35 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/dp: TPS4 PHY test pattern compliance support
Date: Fri,  4 Sep 2020 09:43:08 +0530
Message-Id: <1599192789-2602-3-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599192789-2602-1-git-send-email-vidya.srinivas@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <1599192789-2602-1-git-send-email-vidya.srinivas@intel.com>
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
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Khaled Almahallawy <khaled.almahallawy@intel.com>

Adding support for TPS4 (CP2520 Pattern 3) PHY pattern source tests.

v2: uniform bit names TP4a/b/c (Manasi)

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h         |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 04231ca5643b..a8a3ffcef5dc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5403,7 +5403,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 			&intel_dp->compliance.test_data.phytest;
 	struct intel_crtc *crtc = to_intel_crtc(dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 pattern_val;
+	u32 pattern_val, dp_tp_ctl;
 
 	switch (data->phy_pattern) {
 	case DP_PHY_TEST_PATTERN_NONE:
@@ -5443,7 +5443,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_CUSTOM80);
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
 		/*
 		 * FIXME: Ideally pattern should come from DPCD 0x24A. As
 		 * current firmware of DPR-100 could not set it, so hardcoding
@@ -5455,6 +5455,16 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 			       DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_HBR2 |
 			       pattern_val);
 		break;
+		case DP_PHY_TEST_PATTERN_CP2520_PAT3:
+			DRM_DEBUG_KMS("Set TPS4 Phy Test Pattern\n");
+			intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe), 0x0);
+			dp_tp_ctl = intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
+			dp_tp_ctl &= ~DP_TP_CTL_TRAIN_PAT4_SEL_MASK;
+			dp_tp_ctl |= DP_TP_CTL_TRAIN_PAT4_SEL_TP4a;
+			dp_tp_ctl &= ~DP_TP_CTL_LINK_TRAIN_MASK;
+			dp_tp_ctl |= DP_TP_CTL_LINK_TRAIN_PAT4;
+			intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl);
+			break;
 	default:
 		WARN(1, "Invalid Phy Test Pattern\n");
 	}
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ab4b1abd4364..4850890918dc 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9974,6 +9974,10 @@ enum skl_power_gate {
 #define  DP_TP_CTL_MODE_SST			(0 << 27)
 #define  DP_TP_CTL_MODE_MST			(1 << 27)
 #define  DP_TP_CTL_FORCE_ACT			(1 << 25)
+#define  DP_TP_CTL_TRAIN_PAT4_SEL_MASK		(3 << 19)
+#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4a		(0 << 19)
+#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4b		(1 << 19)
+#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4c		(2 << 19)
 #define  DP_TP_CTL_ENHANCED_FRAME_ENABLE	(1 << 18)
 #define  DP_TP_CTL_FDI_AUTOTRAIN		(1 << 15)
 #define  DP_TP_CTL_LINK_TRAIN_MASK		(7 << 8)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
