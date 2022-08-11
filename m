Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE558F761
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 07:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740FDA1F9B;
	Thu, 11 Aug 2022 05:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D457A1F45
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 05:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660196883; x=1691732883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qnvaoTUMoOqUlGkaHukknlPyZe/BCIMzFBNHjJBktWY=;
 b=dkt91QMlRjWm/Fbf4Q7aFxPQepDVUhSouu9Mj64u/NoGKE0JzjXnn+bQ
 c6oSBTAiOw5ycZoylvb7HO+3MKbhnFNGSGWEvHupOKNhMX94cbKFDcm0h
 YELhfw32ny86LmGRQ3F9GYNKdqgp+A9ywm5xW1MP4Cedp30aCXAFS37Qp
 ZRbdyTA0VG5kPwt3HhOaddwMJlMvlWWN+Jav4QDuLNB9ZBfXOVFct8aFc
 dkVhuze2zOsQhIlRORAUX4Ymtw88UHVGrdzwkpvpLQ32MfAeKhbLbNMja
 TR1kHnPBE93/op7lSKC8dj4qy3iK//hTkxmyrDqod8CaG2VTqJowERH8i Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="377556006"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="377556006"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:48:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="747690459"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:48:01 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/edid: Avoid multiple log lines for HFVSDB parsing
Date: Thu, 11 Aug 2022 11:17:18 +0530
Message-Id: <20220811054718.2115917-5-ankit.k.nautiyal@intel.com>
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

Replace multiple log lines with a single log line at the end of
parsing HF-VSDB. Also use drm_dbg_kms instead of DRM_DBG_KMS, and
add log for DSC1.2 support.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c9c3a9c8fa26..7a319d570297 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5781,6 +5781,9 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
+	u32 max_tmds_clock = 0;
+	u8 max_frl_rate = 0;
+	bool dsc_support = false;
 
 	display->has_hdmi_infoframe = true;
 
@@ -5800,14 +5803,13 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	 */
 
 	if (hf_scds[5]) {
-		/* max clock is 5000 KHz times block value */
-		u32 max_tmds_clock = hf_scds[5] * 5000;
 		struct drm_scdc *scdc = &hdmi->scdc;
 
+		/* max clock is 5000 KHz times block value */
+		max_tmds_clock = hf_scds[5] * 5000;
+
 		if (max_tmds_clock > 340000) {
 			display->max_tmds_clock = max_tmds_clock;
-			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
-				display->max_tmds_clock);
 		}
 
 		if (scdc->supported) {
@@ -5820,9 +5822,6 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	}
 
 	if (hf_scds[7]) {
-		u8 max_frl_rate;
-
-		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
 		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
@@ -5830,8 +5829,14 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
 
-	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
+	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
+		dsc_support = true;
+	}
+
+	drm_dbg_kms(connector->dev,
+		    "HF-VSDB: max TMDS clock:%d Khz, HDMI2.1 support:%s, DSC1.2 support:%s\n",
+		    max_tmds_clock, max_frl_rate ? "yes" : "no", dsc_support ? "yes" : "no");
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-- 
2.25.1

