Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D512E88185C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6A10EF8D;
	Wed, 20 Mar 2024 20:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMRrAC1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19E910E87F;
 Wed, 20 Mar 2024 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710965495; x=1742501495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DF4ZiHAKcy1VIx8v3ufCmrKZY3bJwj+ZNDm2aKzShbg=;
 b=WMRrAC1Gfb2iX3C7TKB1/HiVeqkm9zd997P6OIlqcCyurjg6xBvAE5Gc
 O3Wg8a0J1MmUyY0/6LCdnun5kX18bmYhtrBpHgVT4pCKb++LDjC+cQM+Z
 PzcjPBSWGmIVgMewsBk9ObGyZ/+VBktQSCbD+pOccswdQU24e7DfLb+a4
 FfrD0WBUvXqbXLRMz7GrHRVzuYz3YBeBrMSs2Qrdh1Z6RH+FOwivW9o7d
 pszMvdOJbuol0iHwtQowFVj9hr5ceEJFrdfAyhZlf2e2dfvX0I47ltG8Y
 PY975GnmVSSNT9U54FsmuKKNa/U2vUMKT3hwZ6lAtuQW2TyP7qZzoVJjy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31352352"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31352352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14246538"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:34 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/i915/dp_mst: Enable HBLANK expansion quirk for UHBR
 rates
Date: Wed, 20 Mar 2024 22:11:51 +0200
Message-ID: <20240320201152.3487892-12-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240320201152.3487892-1-imre.deak@intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling the 5k@60Hz uncompressed mode on the MediaTek/Dell U3224KBA
monitor results in a blank screen, at least on MTL platforms on UHBR
link rates with some (<30) uncompressed bpp values. Enabling compression
fixes the problem, so do that for now. Windows enables DSC always if the
sink supports it and forcing it to enable the mode without compression
leads to the same problem above (which suggests a panel issue with
uncompressed mode).

The same 5k mode on non-UHBR link rates is not affected and lower
resolution modes are not affected either. The problem is similar to the
one fixed by the HBLANK expansion quirk on Synaptics hubs, with the
difference that the problematic mode has a longer HBLANK duration. Also
the monitor doesn't report supporting HBLANK expansion; either its
internal MST hub does the expansion internally - similarly to the
Synaptics hub - or the issue has another root cause, but still related
to the mode's short HBLANK duration. Enable the quirk for the monitor
adjusting the detection for the above differences.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c     |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 22 +++++++++++++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f5d4be8978660..3e8e1bb59dea3 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2281,6 +2281,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
 	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
 	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
+	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */
+	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
 };
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 76a8fb21b8e52..b5224fe6cc16b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -407,15 +407,22 @@ static int mode_hblank_period_ns(const struct drm_display_mode *mode)
 
 static bool
 hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
-				 const struct intel_crtc_state *crtc_state)
+				 const struct intel_crtc_state *crtc_state,
+				 const struct link_config_limits *limits)
 {
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
+	bool is_uhbr_sink = connector->mst_port &&
+			    drm_dp_uhbr_channel_coding_supported(connector->mst_port->dpcd);
+	int hblank_limit = is_uhbr_sink ? 500 : 300;
 
 	if (!connector->dp.dsc_hblank_expansion_quirk)
 		return false;
 
-	if (mode_hblank_period_ns(adjusted_mode) > 300)
+	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))
+		return false;
+
+	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
 		return false;
 
 	return true;
@@ -431,7 +438,7 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int min_bpp_x16 = limits->link.min_bpp_x16;
 
-	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state))
+	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state, limits))
 		return true;
 
 	if (!dsc) {
@@ -1539,7 +1546,14 @@ static bool detect_dsc_hblank_expansion_quirk(const struct intel_connector *conn
 			      DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC))
 		return false;
 
-	if (!(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
+	/*
+	 * UHBR (MST sink) devices requiring this quirk doesn't advertise the
+	 * HBLANK expansion support. Presuming that they perform HBLANK
+	 * expansion internally, or are affected by this issue on modes with a
+	 * short HBLANK for other reasons.
+	 */
+	if (!drm_dp_uhbr_channel_coding_supported(dpcd) &&
+	    !(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
 		return false;
 
 	drm_dbg_kms(&i915->drm,
-- 
2.43.3

