Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC836023CA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 07:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44D610EE44;
	Tue, 18 Oct 2022 05:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FD810EE44;
 Tue, 18 Oct 2022 05:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666071088; x=1697607088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uAI6j854cEInicmF3cCQLucv179kOVPGSvE/gCJhnJo=;
 b=dKKOPZMHahqQCtprNN7600LEa7JW1y0IzCa7U9XHRFFVbaU/3Pvyoww9
 ryOvwoq7+hUgASENZ3tmkSEwRp2ACpKR2kiIkqH+L6TzDxITZmIxgRbCH
 LLutKe3i6XaASZVUThizqWkDBC+adjqFOi+NVNXCAr2Kg9DYxNSAGHb24
 ooSLN6xXcU3/V6ggB2KsMKwyY7sBGErIwKOK4MDN0xGGSAFcPZBHC08uz
 /XwOiR6qIzA8bPA9TsnS1xCiyO+vnEMxQcv65YeHc4rQapFzzbUOMJ0c8
 Bol/HSjtpZ309P+/l+AO9F04VQ9YrSZPmYmZCI8AIR29s5EVylXdMwePu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="307662703"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="307662703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 22:31:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="733461901"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="733461901"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 22:31:25 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Parse VRR cap fields from HFVSDB block
Date: Tue, 18 Oct 2022 11:01:48 +0530
Message-Id: <20221018053148.1798008-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, intel-gfx@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch parses HFVSDB fields for VRR capabilities of an
HDMI2.1 sink and stores the VRR caps in a new structure in
drm_hdmi_info.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 26 ++++++++++++++++++++++++--
 include/drm/drm_connector.h | 27 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47465b9765f1..bb1f7d899580 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5823,6 +5823,21 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
+static void drm_parse_vrr_info(struct drm_hdmi_vrr_cap *hdmi_vrr,
+			       const u8 *hf_scds)
+{
+	if (hf_scds[8] & DRM_EDID_CNMVRR)
+		hdmi_vrr->cnm_vrr = true;
+	if (hf_scds[8] & DRM_EDID_CINEMA_VRR)
+		hdmi_vrr->cinema_vrr = true;
+	if (hf_scds[8] & DRM_EDID_MDELTA)
+		hdmi_vrr->m_delta = true;
+
+	hdmi_vrr->vrr_min = hf_scds[9] & DRM_EDID_VRR_MIN_MASK;
+	hdmi_vrr->vrr_max = (hf_scds[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2;
+	hdmi_vrr->vrr_max |= hf_scds[10] & DRM_EDID_VRR_MAX_LOWER_MASK;
+}
+
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 			       const u8 *hf_scds)
 {
@@ -5901,9 +5916,11 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
+	struct drm_hdmi_vrr_cap *hdmi_vrr = &hdmi->vrr_cap;
 	int max_tmds_clock = 0;
 	u8 max_frl_rate = 0;
 	bool dsc_support = false;
+	bool vrr_support = false;
 
 	display->has_hdmi_infoframe = true;
 
@@ -5949,14 +5966,19 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
 
+	if (cea_db_payload_len(hf_scds) >= 8 && hf_scds[8]) {
+		drm_parse_vrr_info(hdmi_vrr, hf_scds);
+		vrr_support = true;
+	}
+
 	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 		dsc_support = true;
 	}
 
 	drm_dbg_kms(connector->dev,
-		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
-		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
+		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, VRR support: %s, DSC 1.2 support: %s\n",
+		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(vrr_support), str_yes_no(dsc_support));
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b1b2df48d42c..ec6ef71ab5cd 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -219,6 +219,30 @@ struct drm_hdmi_dsc_cap {
 	u8 total_chunk_kbytes;
 };
 
+
+/**
+ * struct drm_hdmi_vrr_cap - VRR capabilities of HDMI sink
+ * Describes the VRR support provided by HDMI 2.1 sink.
+ * The information is fetched fom additional HFVSDB blocks defined
+ * for HDMI 2.1.
+ */
+struct drm_hdmi_vrr_cap {
+	/** @cnm_vrr: sink supports negative Mvrr values*/
+	bool cnm_vrr;
+
+	/** @cinema_vrr: sink supports fractional and integer media rates < VRRmin*/
+	bool cinema_vrr;
+
+	/** @m_delta: sink can anticipate and compensate for frame-to-frame variation in Mvrr */
+	bool m_delta;
+
+	/** @vrr_min: VRRmin - lowest framerate in Hz that sink can support in VRR */
+	u8 vrr_min;
+
+	/** @vrr_max: VRRmax - highest framerate in Hz that sink can support in VRR */
+	u16 vrr_max;
+};
+
 /**
  * struct drm_hdmi_info - runtime information about the connected HDMI sink
  *
@@ -259,6 +283,9 @@ struct drm_hdmi_info {
 
 	/** @dsc_cap: DSC capabilities of the sink */
 	struct drm_hdmi_dsc_cap dsc_cap;
+
+	/** @vrr_cap: VRR capabilities of the sink */
+	struct drm_hdmi_vrr_cap vrr_cap;
 };
 
 /**
-- 
2.25.1

