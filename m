Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914F5A4E8F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C8B10F2CB;
	Mon, 29 Aug 2022 13:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848F10F2CB;
 Mon, 29 Aug 2022 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661781053; x=1693317053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riI8zs3Zj2Svr5saLGFIBJR9wQQbRS/Wig1IHcgUW2E=;
 b=NEp05L8oIjUIU4gibkNE1+2LW701UASrOk/ma+ieCrSOsMacm55uu0vq
 DbiPttg7mHlG8tmVX6wlZCc4kmxvvT+W6+3TonefKI73RKNAHoenWGYdY
 kptCc5Pzci+Pbv8uY9rT6aXTtG18+Bqu537ycO3COG8yCsm/y4KQaeWXc
 tGgei5medJiCv7VSb9JNge16L7h7tcAMX3iuGM+DlJ1GFw3Jx2LqxZdRv
 MX6Hc0znl5VjtIQ5tsYzOgmcpNEWMERou4WCJ8aHsolmJFKnd/h4f8YE5
 XsUNsUJ2ICgvFSn+Wmd7adpcvGoEy/QCEgXYGJR/ncUvDJyBmwH/RwGAJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="296171597"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="296171597"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 06:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="607450606"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2022 06:50:48 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to
 separate function
Date: Mon, 29 Aug 2022 16:51:37 +0300
Message-Id: <20220829135137.27669-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
In-Reply-To: <20220829095832.21770-5-stanislav.lisovskiy@intel.com>
References: <20220829095832.21770-5-stanislav.lisovskiy@intel.com>
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are using almost same code to loop through bpps while calling
drm_dp_atomic_find_vcpi_slots - lets remove this duplication by
introducing a new function intel_dp_mst_find_vcpi_slots_for_bpp

v2: Fix pbn_div calculation - shouldn't matter if its DSC or not.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 86 +++++++++++----------
 1 file changed, 45 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 94d7e7f84c51..7dcbdcd1cb48 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -44,10 +44,14 @@
 #include "intel_hotplug.h"
 #include "skl_scaler.h"
 
-static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
-					    struct intel_crtc_state *crtc_state,
-					    struct drm_connector_state *conn_state,
-					    struct link_config_limits *limits)
+static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
+						struct intel_crtc_state *crtc_state,
+						int max_bpp,
+						int min_bpp,
+						struct link_config_limits *limits,
+						struct drm_connector_state *conn_state,
+						int step,
+						bool dsc)
 {
 	struct drm_atomic_state *state = crtc_state->uapi.state;
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
@@ -58,7 +62,6 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int bpp, slots = -EINVAL;
 	int ret = 0;
 
@@ -72,18 +75,20 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	// TODO: Handle pbn_div changes by adding a new MST helper
 	if (!mst_state->pbn_div) {
 		mst_state->pbn_div = drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
-							      limits->max_rate,
-							      limits->max_lane_count);
+							      crtc_state->port_clock,
+							      crtc_state->lane_count);
 	}
 
-	for (bpp = limits->max_bpp; bpp >= limits->min_bpp; bpp -= 2 * 3) {
+	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
 		crtc_state->pipe_bpp = bpp;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       crtc_state->pipe_bpp,
-						       false);
+						       dsc ? bpp << 4 : crtc_state->pipe_bpp,
+						       dsc);
+
 		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
-						      connector->port, crtc_state->pbn);
+						      connector->port,
+						      crtc_state->pbn);
 		if (slots == -EDEADLK)
 			return slots;
 		if (slots >= 0) {
@@ -101,11 +106,32 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 	if (ret && slots >= 0)
 		slots = ret;
 
-	if (slots < 0) {
+	if (slots < 0)
 		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
 			    slots);
+
+	return slots;
+}
+
+
+static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
+					    struct intel_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    struct link_config_limits *limits)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
+	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
+	int slots = -EINVAL;
+
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, limits->max_bpp,
+						     limits->min_bpp, limits,
+						     conn_state, 2 * 3, false);
+
+	if (slots < 0)
 		return slots;
-	}
 
 	intel_link_compute_m_n(crtc_state->pipe_bpp,
 			       crtc_state->lane_count,
@@ -123,25 +149,21 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 						struct drm_connector_state *conn_state,
 						struct link_config_limits *limits)
 {
-	struct drm_atomic_state *state = crtc_state->uapi.state;
-	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
-	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
+	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
 					   DP_DPCD_QUIRK_CONSTANT_N);
-	int bpp, slots = -EINVAL;
+	int slots = -EINVAL;
 	int i, num_bpc;
 	u8 dsc_bpc[3] = {0};
 	int min_bpp, max_bpp;
 	u8 dsc_max_bpc;
 
-	crtc_state->lane_count = limits->max_lane_count;
-	crtc_state->port_clock = limits->max_rate;
-
 	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
 	if (DISPLAY_VER(i915) >= 12)
 		dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
@@ -162,29 +184,11 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
 		    min_bpp, max_bpp);
 
-	for (bpp = max_bpp; bpp >= min_bpp; bpp -= 2 * 3) {
-		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       bpp << 4,
-						       true);
+	slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp, min_bpp,
+						     limits, conn_state, 2 * 3, true);
 
-		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
-						      connector->port,
-						      crtc_state->pbn, 0);
-
-		drm_dbg_kms(&i915->drm, "Trying bpp %d got %d pbn %d slots\n",
-			    bpp, crtc_state->pbn, slots);
-
-		if (slots == -EDEADLK)
-			return slots;
-		if (slots >= 0)
-			break;
-	}
-
-	if (slots < 0) {
-		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
-			    slots);
+	if (slots < 0)
 		return slots;
-	}
 
 	intel_link_compute_m_n(crtc_state->pipe_bpp,
 			       crtc_state->lane_count,
-- 
2.24.1.485.gad05a3d8e5

