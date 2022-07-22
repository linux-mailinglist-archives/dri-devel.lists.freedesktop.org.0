Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8853C57D9D3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 07:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5332BDDE;
	Fri, 22 Jul 2022 05:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C72A768;
 Fri, 22 Jul 2022 05:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658468858; x=1690004858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VtwUE2JoQhbrgtYPVYBKi1/iDx7BipcpwhpOrWi27FM=;
 b=h3pMXNcMe3z4+KIqSH8AthD6bECvHgRD3qgQWNGpBhEctbd7lnxP55vq
 zDXvu2b4T798Qf8l5iKUHBM4l2rbN6ZvfneCO2tF3r9QQ06zngT0nu179
 OkU7Aixk7u97YvVwZZtQUSwURh1yHnHdsInCQsGqb2fCQo1jRr8ab2FYa
 MC1UICCXOsLqyLqURimg50BJoRogSFxdx58UOZS2lTHrQrIwhPrmo7y8v
 vDUE9vr75sBV7Jabgup2xvDVpHnTmLofe0x2jYgu/qalj7SauPgzkaYmv
 pdZ8YYsyxIyw0PgbBG/OCQ/94hfi/n7gKjlpesfcRqtQ2qGw3j0Ub3pxg g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="284794268"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; d="scan'208";a="284794268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 22:47:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; d="scan'208";a="657080316"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 22:47:34 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/drm_edid: Refactor HFVSDB parsing for DSC1.2
Date: Fri, 22 Jul 2022 11:16:47 +0530
Message-Id: <20220722054647.3511645-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: swati2.sharma@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC capabilities are given in bytes 11-13 of VSDB (i.e. bytes 8-10 of
SCDS). Since minimum length of Data block is 7, all bytes greater than 7
must be read only after checking the length of the data block.

This patch adds check for data block length before reading relavant DSC
bytes. It also corrects min DSC BPC to 8, and minor refactoring for
better readability, and proper log messages.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 124 +++++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bbc25e3b7220..f683a8d5fd31 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5703,12 +5703,58 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
+static void drm_parse_dsc_slice_info(u8 dsc_max_slices,
+				     struct drm_hdmi_dsc_cap *hdmi_dsc)
+{
+	switch (dsc_max_slices) {
+	case 1:
+		hdmi_dsc->max_slices = 1;
+		hdmi_dsc->clk_per_slice = 340;
+		break;
+	case 2:
+		hdmi_dsc->max_slices = 2;
+		hdmi_dsc->clk_per_slice = 340;
+		break;
+	case 3:
+		hdmi_dsc->max_slices = 4;
+		hdmi_dsc->clk_per_slice = 340;
+		break;
+	case 4:
+		hdmi_dsc->max_slices = 8;
+		hdmi_dsc->clk_per_slice = 340;
+		break;
+	case 5:
+		hdmi_dsc->max_slices = 8;
+		hdmi_dsc->clk_per_slice = 400;
+		break;
+	case 6:
+		hdmi_dsc->max_slices = 12;
+		hdmi_dsc->clk_per_slice = 400;
+		break;
+	case 7:
+		hdmi_dsc->max_slices = 16;
+		hdmi_dsc->clk_per_slice = 400;
+		break;
+	case 0:
+	default:
+		hdmi_dsc->max_slices = 0;
+		hdmi_dsc->clk_per_slice = 0;
+	}
+}
+
 /* Sink Capability Data Structure */
 static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 				      const u8 *hf_scds)
 {
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
+	u8 db_length = hf_scds[0] & 0x1F;
+	u8 dsc_max_frl_rate;
+	u8 dsc_max_slices;
+	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
+
+	if (db_length < 7 || db_length > 31)
+		return;
 
 	display->has_hdmi_infoframe = true;
 
@@ -5749,17 +5795,25 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	if (hf_scds[7]) {
 		u8 max_frl_rate;
-		u8 dsc_max_frl_rate;
-		u8 dsc_max_slices;
-		struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
 
-		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
 		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+		if (max_frl_rate)
+			DRM_DEBUG_KMS("HDMI2.1 FRL support detected\n");
+
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
+
+		drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
+	}
+
+	if (db_length < 11)
+		return;
+
+	if (hf_scds[11]) {
 		hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
 
 		if (hdmi_dsc->v_1p2) {
+			DRM_DEBUG_KMS("HDMI DSC1.2 support detected\n");
 			hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
 			hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
 
@@ -5770,52 +5824,28 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
 				hdmi_dsc->bpc_supported = 10;
 			else
-				hdmi_dsc->bpc_supported = 0;
-
-			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
-			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
-					     &hdmi_dsc->max_frl_rate_per_lane);
-			hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
-
-			dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
-			switch (dsc_max_slices) {
-			case 1:
-				hdmi_dsc->max_slices = 1;
-				hdmi_dsc->clk_per_slice = 340;
-				break;
-			case 2:
-				hdmi_dsc->max_slices = 2;
-				hdmi_dsc->clk_per_slice = 340;
-				break;
-			case 3:
-				hdmi_dsc->max_slices = 4;
-				hdmi_dsc->clk_per_slice = 340;
-				break;
-			case 4:
-				hdmi_dsc->max_slices = 8;
-				hdmi_dsc->clk_per_slice = 340;
-				break;
-			case 5:
-				hdmi_dsc->max_slices = 8;
-				hdmi_dsc->clk_per_slice = 400;
-				break;
-			case 6:
-				hdmi_dsc->max_slices = 12;
-				hdmi_dsc->clk_per_slice = 400;
-				break;
-			case 7:
-				hdmi_dsc->max_slices = 16;
-				hdmi_dsc->clk_per_slice = 400;
-				break;
-			case 0:
-			default:
-				hdmi_dsc->max_slices = 0;
-				hdmi_dsc->clk_per_slice = 0;
-			}
+				/* Supports min 8 BPC if DSC1.2 is supported*/
+				hdmi_dsc->bpc_supported = 8;
 		}
 	}
 
-	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
+	if (db_length < 12)
+		return;
+
+	if (hdmi_dsc->v_1p2 && hf_scds[12]) {
+		dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
+		drm_parse_dsc_slice_info(dsc_max_slices, hdmi_dsc);
+
+		dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
+		drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
+				     &hdmi_dsc->max_frl_rate_per_lane);
+	}
+
+	if (db_length < 13)
+		return;
+
+	if (hdmi_dsc->v_1p2 && hf_scds[13])
+		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-- 
2.25.1

