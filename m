Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F0ABF377
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F149811B51E;
	Wed, 21 May 2025 11:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGjYp2Cu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA5F10F871;
 Wed, 21 May 2025 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828439; x=1779364439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lfk28M7CkWAMe2kZGHvzcyZ6OLm5qCHbLmCqUnu27yE=;
 b=WGjYp2CuDv8b3dhWils0Sx8mXcSV1bVrVN7lp1jN13aggzNTcnuelh9I
 pR+epib9n2jk9t4zxa5nZgtP2zMyO5LbyaxE9Nl68iSzBVJ+vRBdRx6sz
 86uhQ4Ip7fhuXRUwjDlBmG5sPxuKj+ucimKwRt3u0BhNPtID4x8KwdTDE
 tgNElXIAAdj7f/ODUReN0a6vuO6pJqteHqnMO06cp2fY1MvAzmbTasJQp
 4/VAPnxQbdn/zGFnYUeWFjx7ZI28mapEegCFGXl5N6hsFXx5peUr4jVBz
 tyImBkkaDBzT9ooMql+BTq7lIJfXV6LOa3L0m8OvB3cs+gjEXUPXtSLP6 A==;
X-CSE-ConnectionGUID: JynukjIYT6GiFUuUIUkbsA==
X-CSE-MsgGUID: YpUhpikTQWOAVDPWS6yWDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217844"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:59 -0700
X-CSE-ConnectionGUID: 4SYWmblOTA+HSkBqnAI4kg==
X-CSE-MsgGUID: Oyav8DzRTcaMdpRbwBfYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452946"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:56 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 10/12] drm/i915/display: Add function to configure LFPS
 sending
Date: Wed, 21 May 2025 14:53:17 +0300
Message-ID: <20250521115319.2380655-11-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add function to configre LFPS sending for Panel Replay according to link
training sequence in HAS document.

This assumes we are using AUX Less always if it's supported by the sink and
the source.

v2:
  - drop HAS reference
  - replay kerneldoc comment with a generic comment
  - check display version in intel_lnl_mac_transmit_lfps

Bspec: 68849
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 31 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h |  2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c     |  8 ++++-
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 91118d115fd3..75caccb65513 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3225,6 +3225,37 @@ void intel_mtl_pll_enable(struct intel_encoder *encoder,
 		intel_cx0pll_enable(encoder, crtc_state);
 }
 
+/*
+ * According to HAS we need to enable MAC Transmitting LFPS in the "PHY Common
+ * Control 0" PIPE register in case of AUX Less ALPM is going to be used. This
+ * function is doing that and is called by link retrain sequence.
+ */
+void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	u8 owned_lane_mask = intel_cx0_get_owned_lane_mask(encoder);
+	bool enable = intel_alpm_is_alpm_aux_less(enc_to_intel_dp(encoder),
+						  crtc_state);
+	int i;
+
+	if (DISPLAY_VER(display) < 20)
+		return;
+
+	for (i = 0; i < 4; i++) {
+		int tx = i % 2 + 1;
+		u8 lane_mask = i < 2 ? INTEL_CX0_LANE0 : INTEL_CX0_LANE1;
+
+		if (!(owned_lane_mask & lane_mask))
+			continue;
+
+		intel_cx0_rmw(encoder, lane_mask, PHY_CMN1_CONTROL(tx, 0),
+			      CONTROL0_MAC_TRANSMIT_LFPS,
+			      enable ? CONTROL0_MAC_TRANSMIT_LFPS : 0,
+			      MB_WRITE_COMMITTED);
+	}
+}
+
 static u8 cx0_power_control_disable_val(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
index a8f811ca5e7b..c5a7b529955b 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
@@ -43,5 +43,7 @@ void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
 				     const struct intel_crtc_state *crtc_state);
 int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder);
 void intel_cx0_pll_power_save_wa(struct intel_display *display);
+void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
+				 const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CX0_PHY_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 65ab012c3eae..70de99cc4ead 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3745,10 +3745,16 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
 	intel_dp->DP |= DDI_BUF_CTL_ENABLE;
 
 	/*
-	 * 6.k If AUX-Less ALPM is going to be enabled
+	 * 6.k If AUX-Less ALPM is going to be enabled:
 	 *     i. Configure PORT_ALPM_CTL and PORT_ALPM_LFPS_CTL here
 	 */
 	intel_alpm_port_configure(intel_dp, crtc_state);
+
+	/*
+	 *     ii. Enable MAC Transmits LFPS in the "PHY Common Control 0" PIPE
+	 *         register
+	 */
+	intel_lnl_mac_transmit_lfps(encoder, crtc_state);
 }
 
 static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
-- 
2.43.0

