Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301C58F760
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 07:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7168AA1F93;
	Thu, 11 Aug 2022 05:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E14DA1F62
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660196881; x=1691732881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wYpekYwgyES3XW+MkMdMUgh293oFwoIYxmBDiNT5sqQ=;
 b=kletwhnTzAJU02vn0DaA6CFW6Ws9miOce3MCyPmLdx3bxZg/pwUKEz/F
 8fn8d+IfE7/SWzau9vkddzJE2TxA3Ot3a9u43O22RegT8yvrUzNrMrC0/
 Gh7PYbZr8AYSx8BGKVtLutLkdw7DV5PXTrgtqSvaNbk4ynDa+pYO1JWCg
 GX8nHgm1eul/sOxCN1w2fz1cyWZWU0hBuJolV6y3+qth9RrBIaFKzB7li
 D218tyTuYtlM/iDYqIgWq6JVGWKq3rhxeTXRlH+VvFgOCCraVPhRIU2E9
 omyId31EAnXBRU5RSrpUp2FlnbfmPpG2PdbRBCaV2cUc8fAFPLq9opXss Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="377555998"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="377555998"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:48:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="747690450"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:47:57 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/edid: Refactor HFVSDB parsing for DSC1.2
Date: Thu, 11 Aug 2022 11:17:17 +0530
Message-Id: <20220811054718.2115917-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
References: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
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
Cc: uma.shankar@intel.com, swati2.sharma@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC capabilities are given in bytes 11-13 of VSDB (i.e. bytes 8-10 of
SCDS). Since minimum length of Data block is 7, all bytes greater than 7
must be read only after checking the length of the data block.

This patch adds check for data block length before reading relavant DSC
bytes.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 93 ++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ffff1d08b3a4..c9c3a9c8fa26 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5706,9 +5706,6 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 			       const u8 *hf_scds)
 {
-	u8 dsc_max_slices;
-	u8 dsc_max_frl_rate;
-
 	hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
 
 	if (!hdmi_dsc->v_1p2)
@@ -5727,47 +5724,54 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 		/* Supports min 8 BPC if DSC1.2 is supported*/
 		hdmi_dsc->bpc_supported = 8;
 
-	dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
-	drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
-			     &hdmi_dsc->max_frl_rate_per_lane);
-	hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
+	if (cea_db_payload_len(hf_scds) >= 12 && hf_scds[12]) {
+		u8 dsc_max_slices;
+		u8 dsc_max_frl_rate;
 
-	dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
+		dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
+		drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
+				     &hdmi_dsc->max_frl_rate_per_lane);
 
-	switch (dsc_max_slices) {
-	case 1:
-		hdmi_dsc->max_slices = 1;
-		hdmi_dsc->clk_per_slice = 340;
-		break;
-	case 2:
-		hdmi_dsc->max_slices = 2;
-		hdmi_dsc->clk_per_slice = 340;
-		break;
-	case 3:
-		hdmi_dsc->max_slices = 4;
-		hdmi_dsc->clk_per_slice = 340;
-		break;
-	case 4:
-		hdmi_dsc->max_slices = 8;
-		hdmi_dsc->clk_per_slice = 340;
-		break;
-	case 5:
-		hdmi_dsc->max_slices = 8;
-		hdmi_dsc->clk_per_slice = 400;
-		break;
-	case 6:
-		hdmi_dsc->max_slices = 12;
-		hdmi_dsc->clk_per_slice = 400;
-		break;
-	case 7:
-		hdmi_dsc->max_slices = 16;
-		hdmi_dsc->clk_per_slice = 400;
-		break;
-	case 0:
-	default:
-		hdmi_dsc->max_slices = 0;
-		hdmi_dsc->clk_per_slice = 0;
+		dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
+
+		switch (dsc_max_slices) {
+		case 1:
+			hdmi_dsc->max_slices = 1;
+			hdmi_dsc->clk_per_slice = 340;
+			break;
+		case 2:
+			hdmi_dsc->max_slices = 2;
+			hdmi_dsc->clk_per_slice = 340;
+			break;
+		case 3:
+			hdmi_dsc->max_slices = 4;
+			hdmi_dsc->clk_per_slice = 340;
+			break;
+		case 4:
+			hdmi_dsc->max_slices = 8;
+			hdmi_dsc->clk_per_slice = 340;
+			break;
+		case 5:
+			hdmi_dsc->max_slices = 8;
+			hdmi_dsc->clk_per_slice = 400;
+			break;
+		case 6:
+			hdmi_dsc->max_slices = 12;
+			hdmi_dsc->clk_per_slice = 400;
+			break;
+		case 7:
+			hdmi_dsc->max_slices = 16;
+			hdmi_dsc->clk_per_slice = 400;
+			break;
+		case 0:
+		default:
+			hdmi_dsc->max_slices = 0;
+			hdmi_dsc->clk_per_slice = 0;
+		}
 	}
+
+	if (cea_db_payload_len(hf_scds) >= 13 && hf_scds[13])
+		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 }
 
 /* Sink Capability Data Structure */
@@ -5776,6 +5780,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 {
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
+	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 
 	display->has_hdmi_infoframe = true;
 
@@ -5816,17 +5821,17 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	if (hf_scds[7]) {
 		u8 max_frl_rate;
-		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 
 		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
 		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
-
-		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 	}
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
+
+	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
+		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-- 
2.25.1

