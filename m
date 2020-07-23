Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF822A3BF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 02:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AF66E17B;
	Thu, 23 Jul 2020 00:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62A56E111;
 Thu, 23 Jul 2020 00:36:31 +0000 (UTC)
IronPort-SDR: S/dWEbIlBAVoF8sselSGJR58DaGDMfsMq0ZRek3fEOIdzP5GIr4e/nyRln/lXyO6BOR7VbduZB
 tTrpcteQukzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="147938041"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="147938041"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 17:36:31 -0700
IronPort-SDR: VJfQy1+hjn8BV7AyN9F9+kbOngxJwDVFqwrRKMdy4+G1Vnae1La6VYOW7/QR80mfX/nb40JQ8F
 PJZ7Azfo3vww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="488644366"
Received: from kialmah1-desk.jf.intel.com (HELO kialmah1-desk.vprodemo.com)
 ([134.134.156.178])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2020 17:36:31 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/dp: TPS4 PHY test pattern compliance support
Date: Wed, 22 Jul 2020 17:36:27 -0700
Message-Id: <20200723003627.31198-2-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723003627.31198-1-khaled.almahallawy@intel.com>
References: <20200723003627.31198-1-khaled.almahallawy@intel.com>
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
Cc: manasi.d.navare@intel.com, animesh.manna@intel.com,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support for TPS4 (CP2520 Pattern 3) PHY pattern source tests.

v2: uniform bit names TP4a/b/c (Manasi)

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h         |  4 ++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d6295eb20b63..4b74b2ec5665 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5371,7 +5371,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 			&intel_dp->compliance.test_data.phytest;
 	struct intel_crtc *crtc = to_intel_crtc(dig_port->base.base.crtc);
 	enum pipe pipe = crtc->pipe;
-	u32 pattern_val;
+	u32 pattern_val, dp_tp_ctl;
 
 	switch (data->phy_pattern) {
 	case DP_PHY_TEST_PATTERN_NONE:
@@ -5411,7 +5411,7 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 			       DDI_DP_COMP_CTL_ENABLE |
 			       DDI_DP_COMP_CTL_CUSTOM80);
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
 		/*
 		 * FIXME: Ideally pattern should come from DPCD 0x24A. As
 		 * current firmware of DPR-100 could not set it, so hardcoding
@@ -5423,6 +5423,16 @@ static void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
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
index a0d31f3bf634..c586595b9e76 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9982,6 +9982,10 @@ enum skl_power_gate {
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
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
