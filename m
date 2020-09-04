Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D173725D091
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 06:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EE66EA76;
	Fri,  4 Sep 2020 04:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233646EA70;
 Fri,  4 Sep 2020 04:30:15 +0000 (UTC)
IronPort-SDR: hY3csjwJ/stjW1AhbatPKFBe+7L6SKXEMMdNjlPYs3b/OcY8O7iaTFrTGi180gzH/snnzEmumY
 RWqQHtFFyueA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157699521"
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="157699521"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 21:30:14 -0700
IronPort-SDR: eZgxnZmJectH9/hL3q2QOVJ+MnNv02m5w+4FTWXhtLnIKaTaQn65/4sSvQW+yrlJiaKZkFcFb+
 AaWCmLsmRr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,388,1592895600"; d="scan'208";a="447154749"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.28])
 by orsmga004.jf.intel.com with ESMTP; 03 Sep 2020 21:30:13 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/dp: TPS4 PHY test pattern compliance support
Date: Fri,  4 Sep 2020 09:55:03 +0530
Message-Id: <1599193504-2754-2-git-send-email-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599193504-2754-1-git-send-email-vidya.srinivas@intel.com>
References: <20200723003627.31198-1-khaled.almahallawy@intel.com>
 <1599193504-2754-1-git-send-email-vidya.srinivas@intel.com>
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
