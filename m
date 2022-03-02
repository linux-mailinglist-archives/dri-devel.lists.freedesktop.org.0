Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98D4CA08C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4E710F2B1;
	Wed,  2 Mar 2022 09:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702310F2B1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646212933; x=1677748933;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=OI3wGDaAY/kVXrM21OoXdftEik9bJ8NFvqYBaKEQAsc=;
 b=Z/SaSDXxEYENNq0iU+f/EQKynHDdCXUoZnB/DwPDQ62rIDDKN+0l2Dox
 U7Qgmd6fP8J/7E5GagnS2SdYFrrZlkHe/bp4ZkyGW4yuPjgQpx0gF1tlg
 pmSHpgZ+uwVI24euEzUi73EerC21SR/Zf3tZSzwaIb46VH9p6fsyRbtf1
 l89ZHRCWdYutB1It1KBMy56OfJdWyExBOHP55JalA3oAOlxOc/iwZLKcD
 P7Se5Bsz7h5NL9D7mdyNtk+I6GZLur3R/3+N3kB+967UKflCBHh8kAv1O
 GjZAVs0sMUY/O//z/HXOAE2kltaiTkqWHCvFGV+OgqsICmASzYuamYGiA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="252187742"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="252187742"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 01:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="807012191"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2022 01:22:11 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v4 5/5] drm/edid: check for HF-SCDB block
Date: Wed,  2 Mar 2022 17:35:11 +0800
Message-Id: <20220302093511.30299-6-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302093511.30299-1-shawn.c.lee@intel.com>
References: <20220302093511.30299-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Find HF-SCDB information in CEA extensions block. And retrieve
Max_TMDS_Character_Rate that support by sink device.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2b8ddc956ce2..d6b48c543c23 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3350,6 +3350,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 #define EXT_VIDEO_DATA_BLOCK_420	0x0E
 #define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
 #define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
+#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4277,6 +4278,20 @@ static bool cea_db_is_vcdb(const u8 *db)
 	return true;
 }
 
+static bool cea_db_is_hf_scdb(const u8 *db)
+{
+	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+		return false;
+
+	if (cea_db_payload_len(db) < 7)
+		return false;
+
+	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
+		return false;
+
+	return true;
+}
+
 static bool cea_db_is_y420cmdb(const u8 *db)
 {
 	if (cea_db_tag(db) != USE_EXTENDED_TAG)
@@ -4987,6 +5002,25 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 		info->rgb_quant_range_selectable = true;
 }
 
+static void drm_parse_hf_scdb(struct drm_connector *connector, const u8 *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	u32 max_tmds_clock;
+
+	DRM_DEBUG_KMS("HF-SCDB version 0x%02x\n", db[4]);
+
+	max_tmds_clock = db[5] * 5000;
+	if (info->max_tmds_clock < max_tmds_clock) {
+		info->max_tmds_clock = max_tmds_clock;
+		DRM_DEBUG_KMS("HF-SCDB: max TMDS clock %d kHz\n",
+			      info->max_tmds_clock);
+	}
+
+	/*
+	 * ToDo: Parse the remaining SCDB data if needed
+	 */
+}
+
 static
 void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8 *max_rate_per_lane)
 {
@@ -5282,6 +5316,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_y420cmdb_bitmap(connector, db);
 		if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, db);
+		if (cea_db_is_hf_scdb(db))
+			drm_parse_hf_scdb(connector, db);
 		if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, db);
 	}
-- 
2.17.1

