Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC5C2E4A6
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E310E4DE;
	Mon,  3 Nov 2025 22:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxB+wyfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA110E4E2;
 Mon,  3 Nov 2025 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209466; x=1793745466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ylR4oWs1fix+HF49f9BVxuvOIC7WzOneQ5NP3rhwtA=;
 b=FxB+wyfvzv1ZvxhRryNH9uL2Gtay+Bcpzx8vr3HhJPdshn3CbGywRkok
 DJ0AH4s6bFb6Im5qRYf0137wKsHQtmlcPttJqP+Lt7/W+3WGLGyORessy
 PnS68dQuO+JWuu1nhU/L4vflWmOQx1oQDiCphDPBeLvc/40F+ywbJQOF8
 FjMubP9BtpIBlFKZ/6FpropP1OmmsHPgpozr6T7EUjLDjSzS/vZZoSCya
 a/ijd0J1m3eqdc9P7FXBKOK9ZzfwoxDXCOPZDUD9oQWSgVFG3cFhVo+Ix
 sgN0Xh6UT9DWpqnTAP3Yt66xiVNy4JHlG1suBrKJlA/2B++/14RAiF9kl A==;
X-CSE-ConnectionGUID: 4fsuLuuNQtunTbc763oH5w==
X-CSE-MsgGUID: 3WMIv5A9RaSs36wtcs9Uqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74899629"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74899629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:46 -0800
X-CSE-ConnectionGUID: N2UnATGSQ5er/VO6lklEsw==
X-CSE-MsgGUID: OU5eJPxHQCmhn4aFvIIplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187707535"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 14:37:44 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for LT
 phy
Date: Tue,  4 Nov 2025 03:39:55 +0530
Message-Id: <20251103220957.1229608-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251103220957.1229608-1-animesh.manna@intel.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
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

Enable LT phy for transmitting LFPS during aux-less alpm.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  5 ++-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 35 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  2 ++
 .../gpu/drm/i915/display/intel_lt_phy_regs.h  |  3 ++
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 733ef4559131..f6450ebea2a8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3781,7 +3781,10 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
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
index af48d6cde226..87659a9d9847 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -7,6 +7,7 @@
 
 #include "i915_reg.h"
 #include "i915_utils.h"
+#include "intel_alpm.h"
 #include "intel_cx0_phy.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
@@ -1998,3 +1999,37 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
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
+	intel_wakeref_t wakeref;
+	int i;
+	u8 owned_lane_mask;
+
+	if (!intel_alpm_is_alpm_aux_less(enc_to_intel_dp(encoder), crtc_state))
+		return;
+
+	owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
+
+	wakeref = intel_lt_phy_transaction_begin(encoder);
+
+	for (i = 0; i < 4; i++) {
+		int tx = i % 2 + 1;
+		u8 lane_mask = i < 2 ? INTEL_LT_PHY_LANE0 : INTEL_LT_PHY_LANE1;
+
+		if (!(owned_lane_mask & lane_mask))
+			continue;
+
+		intel_lt_phy_rmw(encoder, lane_mask, LT_PHY_CMN_CTL(tx, 0),
+				 LT_PHY_CMN_LFPS_ENABLE,
+				 LT_PHY_CMN_LFPS_ENABLE, MB_WRITE_COMMITTED);
+	}
+
+	intel_lt_phy_transaction_end(encoder, wakeref);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index a538d4c69210..7391dd7252d7 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -38,6 +38,8 @@ void intel_lt_phy_pll_state_verify(struct intel_atomic_state *state,
 void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *crtc_state);
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
+void intel_xe3plpd_mac_transmit_lfps(struct intel_encoder *encoder,
+				     const struct intel_crtc_state *crtc_state);
 
 #define HAS_LT_PHY(display) (DISPLAY_VER(display) >= 35)
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
index 9223487d764e..8a19b7cb59dc 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
@@ -36,6 +36,9 @@
 #define LT_PHY_TXY_CTL10_MAC(idx)	_MMIO(LT_PHY_TXY_CTL10(idx))
 #define  LT_PHY_TX_LANE_ENABLE		REG_BIT8(0)
 
+#define LT_PHY_CMN_CTL(idx, control)	(0x800 + (0x200 * ((idx) - 1)) + (control))
+#define  LT_PHY_CMN_LFPS_ENABLE		REG_BIT8(1)
+
 /* LT Phy Vendor Register */
 #define LT_PHY_VDR_0_CONFIG	0xC02
 #define  LT_PHY_VDR_DP_PLL_ENABLE	REG_BIT(7)
-- 
2.29.0

