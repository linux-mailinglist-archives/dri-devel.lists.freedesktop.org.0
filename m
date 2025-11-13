Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57499C5769F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7407210E813;
	Thu, 13 Nov 2025 12:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PE0qxfU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352D810E814;
 Thu, 13 Nov 2025 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036953; x=1794572953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TVWr0mOq2MKwxv1wzCesZJYeaoxJLj9ftQtoRcOAdfA=;
 b=PE0qxfU1aK9Y85bZGOabT5cYqDVeTD6YQ1+s0kZxn0UBqQ8xv0Qy0nNB
 a3N/MSWvrEJdr2/o4TrEnM7ZMXSrxJCp0zNn60JtSvZYpK7ITDvdX/Oul
 isZ/+vdtlLYqI/ZbHjuaU8IyyxdomKI3aOP2ArytZTiBz6RO86Nd+soIB
 4WeV3NKeoUvc2u/n5K4xQBnWdmrccPFbs7uqi81eu3saOTHMjRiVEUWQC
 C50M0H+QvAcFXX/ywt115P56pTyi6i7MPBAXW9iOqnVOGZEAUU588RxLG
 ckxzjk2wovVqs2hZPpJonqdJDB+hI0jvgCp6LVb3OgXRbE5Y/x2WHRAge Q==;
X-CSE-ConnectionGUID: cy1M2ok2Tr6yg+O0FeiY0Q==
X-CSE-MsgGUID: 1h3Rq6NeTt6+bCzHxOH8aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677920"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:29:13 -0800
X-CSE-ConnectionGUID: oi9WAKywTr+Y/SnJ9i6SKg==
X-CSE-MsgGUID: 302TYW/UT0u4jLr5eSEs4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757765"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:29:11 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for LT
 PHY
Date: Thu, 13 Nov 2025 17:31:17 +0530
Message-Id: <20251113120119.1437955-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable MAC to transmit LFPS via LT PHY during aux-less alpm.

v2:
- Correct commit description. [Suraj]
- Remove loop as no dependency on the transmitter LT_PHY_CMN_CTL0. [Suraj]
v3: Cosmetic changes. [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  5 +++-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 27 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  2 ++
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |  3 +++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 002ccd47856d..89ce3d13246a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3777,7 +3777,10 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 	 *     ii. Enable MAC Transmits LFPS in the "PHY Common Control 0" PIPE
 	 *         register
 	 */
-	intel_lnl_mac_transmit_lfps(encoder, crtc_state);
+	if (HAS_LT_PHY(display))
+		intel_xe3plpd_mac_transmit_lfps(encoder, crtc_state);
+	else
+		intel_lnl_mac_transmit_lfps(encoder, crtc_state);
 }
 
 static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index a67eb4f7f897..a1a5aed116b7 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include "i915_reg.h"
+#include "intel_alpm.h"
 #include "intel_cx0_phy.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
@@ -2325,3 +2326,29 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
 		intel_lt_phy_pll_disable(encoder);
 
 }
+
+/*
+ * According to HAS we need to enable MAC Transmitting LFPS in the "PHY Common
+ * Control 0" PIPE register in case of AUX Less ALPM is going to be used. This
+ * function is doing that and is called by link retrain sequence.
+ */
+void intel_xe3plpd_mac_transmit_lfps(struct intel_encoder *encoder,
+				     const struct intel_crtc_state *crtc_state)
+{
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	intel_wakeref_t wakeref;
+	u8 owned_lane_mask;
+
+	if (!intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
+		return;
+
+	wakeref = intel_lt_phy_transaction_begin(encoder);
+
+	owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
+
+	intel_lt_phy_rmw(encoder, owned_lane_mask, LT_PHY_CMN_CTL_0,
+			 LT_PHY_CMN_LFPS_ENABLE,
+			 LT_PHY_CMN_LFPS_ENABLE, MB_WRITE_COMMITTED);
+
+	intel_lt_phy_transaction_end(encoder, wakeref);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index b7911acd7dcd..5cea01b1756a 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -41,6 +41,8 @@ intel_lt_phy_calculate_hdmi_state(struct intel_lt_phy_pll_state *lt_state,
 void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state);
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
+void intel_xe3plpd_mac_transmit_lfps(struct intel_encoder *encoder,
+				     const struct intel_crtc_state *crtc_state);
 
 #define HAS_LT_PHY(display) (DISPLAY_VER(display) >= 35)
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
index 98ccc069a69b..c50dbad28b78 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
@@ -35,6 +35,9 @@
 #define LT_PHY_TXY_CTL10_MAC(idx)	_MMIO(LT_PHY_TXY_CTL10(idx))
 #define  LT_PHY_TX_LANE_ENABLE		REG_BIT8(0)
 
+#define LT_PHY_CMN_CTL_0		(0x800)
+#define  LT_PHY_CMN_LFPS_ENABLE		REG_BIT8(1)
+
 /* LT Phy Vendor Register */
 #define LT_PHY_VDR_0_CONFIG	0xC02
 #define  LT_PHY_VDR_DP_PLL_ENABLE	REG_BIT(7)
-- 
2.29.0

