Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96E4E4881
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8781B10E5A7;
	Tue, 22 Mar 2022 21:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39C10E59E;
 Tue, 22 Mar 2022 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985314; x=1679521314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T1XqzJihaBVomW4IBodzCh/VU6Riw/taUvye2GQ9n1Q=;
 b=g77x6IS6w+qCQbgQI4Yh/ZyqQkyG/orezAObnDu8AcSSB2QP95Q4WYZL
 21+WIW2LDUzhF8DR5oja5j7F9ZVsIhPZcpe+21tj+vlXN8qZxqfNm/x5r
 pdIaNQpcVLV92KJ6oUz4ok6QQI2EfkYo9Qqz7GzE9qFLwE6RJgRD/kgSV
 B0Kk41GYTC5jJHITGtmrznO2Y0KW5mOomqsjYU+1sNov6m78js5uXxizN
 XLFRg/XD6Mg/p7EmZPfaqdnPjyDYp/KeobooXTAh0VBVO1rlfB4n7d5v/
 5UQCx7HOr4/JbSR2r7BUsCcefmO01xbYei3UVGeuriPllA5KLSLv5MhX3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="258146092"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="258146092"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="785556571"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 12/19] drm/edid: convert drm_parse_cea_ext() to use cea db iter
Date: Tue, 22 Mar 2022 23:40:41 +0200
Message-Id: <ee6a966b92203342e02037543b9e1ca86fbd9142.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Iterate through all CEA data blocks across all CEA extensions and
DisplayID data blocks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 77763d94dd93..d4bf9ef09c3c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5342,8 +5342,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, start, end;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5358,25 +5359,25 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	if (edid_ext[3] & EDID_CEA_YCRCB422)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
-	if (cea_db_offsets(edid_ext, &start, &end))
-		return;
-
-	for_each_cea_db(edid_ext, i, start, end) {
-		const u8 *db = &edid_ext[i];
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		/* FIXME: convert parsers to use struct cea_db */
+		const u8 *data = (const u8 *)db;
 
 		if (cea_db_is_hdmi_vsdb(db))
-			drm_parse_hdmi_vsdb_video(connector, db);
+			drm_parse_hdmi_vsdb_video(connector, data);
 		if (cea_db_is_hdmi_forum_vsdb(db))
-			drm_parse_hdmi_forum_vsdb(connector, db);
+			drm_parse_hdmi_forum_vsdb(connector, data);
 		if (cea_db_is_microsoft_vsdb(db))
-			drm_parse_microsoft_vsdb(connector, db);
+			drm_parse_microsoft_vsdb(connector, data);
 		if (cea_db_is_y420cmdb(db))
-			drm_parse_y420cmdb_bitmap(connector, db);
+			drm_parse_y420cmdb_bitmap(connector, data);
 		if (cea_db_is_vcdb(db))
-			drm_parse_vcdb(connector, db);
+			drm_parse_vcdb(connector, data);
 		if (cea_db_is_hdmi_hdr_metadata_block(db))
-			drm_parse_hdr_metadata_block(connector, db);
+			drm_parse_hdr_metadata_block(connector, data);
 	}
+	cea_db_iter_end(&iter);
 }
 
 static
-- 
2.30.2

