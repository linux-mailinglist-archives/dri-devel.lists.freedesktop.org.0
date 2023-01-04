Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9D65D03B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15510E546;
	Wed,  4 Jan 2023 10:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7E110E543;
 Wed,  4 Jan 2023 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826778; x=1704362778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8znsmtVPHIkNBWyXZuMfnHLDOTvC0SP8/M06gHu6dbE=;
 b=CofhdiL0gU6/Lo2MQdcZoL0lcI2ZlnpbDtZPV+5A8V18P4Lcr3S1gDwz
 4ksJkGtuasgfzdt2Zib6HLwbQ/8utlpIsDKV73y5ljSRF7yzWRQ2DASlx
 SjFcSTii3ut6sqrkgqFMjCRrdIbG3s8lL6v3Q/WWj1s+WOPgq+U4mliNN
 HqYOnYcAVsgZgdUhNBY5awlnD7DaQCa3yW2x04JLzN59D1Xmni0xuA22Y
 C7QMoiPk+E4CxyfoL8ZUAX8fqzvIlH2FBFGeFLUoDlWrtIGzkxUY9Gt41
 VjYO50RW6bAoeEO3Ifng940EC9Jvisl2w7jqpW/tppGbTqCi76ZG4D6ed w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301588773"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301588773"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762627613"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="762627613"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 08/22] drm/edid: split CTA Y420VDB info and mode parsing
Date: Wed,  4 Jan 2023 12:05:23 +0200
Message-Id: <3bc5fe6650a6ce4249803f7192096764ea724e05.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Separate the parsing of display info and modes from the CTA
Y420VDB. This is prerequisite work for overall better separation of the
two parsing steps.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ead7a4ce0422..076ba125c38d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4497,10 +4497,8 @@ drm_display_mode_from_vic_index(struct drm_connector *connector, int vic_index)
 static int do_y420vdb_modes(struct drm_connector *connector,
 			    const u8 *svds, u8 svds_len)
 {
-	int modes = 0, i;
 	struct drm_device *dev = connector->dev;
-	struct drm_display_info *info = &connector->display_info;
-	struct drm_hdmi_info *hdmi = &info->hdmi;
+	int modes = 0, i;
 
 	for (i = 0; i < svds_len; i++) {
 		u8 vic = svd_to_vic(svds[i]);
@@ -4512,13 +4510,10 @@ static int do_y420vdb_modes(struct drm_connector *connector,
 		newmode = drm_mode_duplicate(dev, cea_mode_for_vic(vic));
 		if (!newmode)
 			break;
-		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
 		drm_mode_probed_add(connector, newmode);
 		modes++;
 	}
 
-	if (modes > 0)
-		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
 	return modes;
 }
 
@@ -5876,6 +5871,26 @@ static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
 	return false;
 }
 
+/* CTA-861-H YCbCr 4:2:0 Video Data Block (CTA Y420VDB) */
+static void parse_cta_y420vdb(struct drm_connector *connector,
+			      const struct cea_db *db)
+{
+	struct drm_display_info *info = &connector->display_info;
+	struct drm_hdmi_info *hdmi = &info->hdmi;
+	const u8 *svds = cea_db_data(db) + 1;
+	int i;
+
+	for (i = 0; i < cea_db_payload_len(db) - 1; i++) {
+		u8 vic = svd_to_vic(svds[i]);
+
+		if (!drm_valid_cea_vic(vic))
+			continue;
+
+		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
+		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
+	}
+}
+
 static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
@@ -6216,6 +6231,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_microsoft_vsdb(connector, data);
 		else if (cea_db_is_y420cmdb(db))
 			parse_cta_y420cmdb(connector, db, &y420cmdb_map);
+		else if (cea_db_is_y420vdb(db))
+			parse_cta_y420vdb(connector, db);
 		else if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, data);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
-- 
2.34.1

