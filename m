Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825C5BA9F4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 12:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3AD10E3E1;
	Fri, 16 Sep 2022 10:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9E410E358;
 Fri, 16 Sep 2022 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663322765; x=1694858765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAtujI/X+HtVu3N2st1GeqMvEyEDBpCkDypcwfxtGN8=;
 b=YjCjk6Qb7KvWrsYzsMtEDPQSCVmyRFQR+3ivtzMj1zv3S8LHHAQ1CEEN
 yjCoC/3H3OTL7wjFdzi489DK7/UdRYyL9y/9sj5YVH9CDbgUG+KxV30nq
 GcF0tcT2cIyWaRCnlJLAK7FLGZDYPZ/lOhkrugcgYS9zu4aVwBqbgCcLl
 jMx1wLk/O42IVl1LlgOweuVbQgrtjx+xzEUBSaYyxKTvsHztCXA4c06DJ
 a63ekqVcbDShSa1oPnjNMudFbyioPmudcWUR8ULaSSBfFM97yU3U/xwxJ
 625nbsmnyzfJe9I0ZPiPIAHQ5td+J/Id/jhJBlMISM7q6/Ux2Nex4E6sL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="360698706"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360698706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:06:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="793051733"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:06:03 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/edid: Avoid multiple log lines for HFVSDB parsing
Date: Fri, 16 Sep 2022 15:35:51 +0530
Message-Id: <20220916100551.2531750-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
References: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, intel-gfx@lists.freedesktop.org,
 uma.shankar@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace multiple log lines with a single log line at the end of
parsing HF-VSDB. Also use drm_dbg_kms instead of DRM_DBG_KMS, and
add log for DSC1.2 support.

v2: Fixed the formatting issues in the logging (Jani).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 27bdbdf6d345..1c61e3af79c6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5830,6 +5830,9 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	struct drm_display_info *display = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &display->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
+	int max_tmds_clock = 0;
+	u8 max_frl_rate = 0;
+	bool dsc_support = false;
 
 	display->has_hdmi_infoframe = true;
 
@@ -5849,14 +5852,13 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
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
@@ -5869,9 +5871,6 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	}
 
 	if (hf_scds[7]) {
-		u8 max_frl_rate;
-
-		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
 		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
@@ -5879,8 +5878,14 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
 
-	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11])
+	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
+		dsc_support = true;
+	}
+
+	drm_dbg_kms(connector->dev,
+		    "HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
+		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-- 
2.25.1

