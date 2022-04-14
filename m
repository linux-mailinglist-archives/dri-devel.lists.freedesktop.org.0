Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8A50127C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698BF10FD0C;
	Thu, 14 Apr 2022 15:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9410FD0F;
 Thu, 14 Apr 2022 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948914; x=1681484914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4niLel28+IMLEaHcmO7uPWmP0A8HCa/uRSIfLqUpvQA=;
 b=Qq1z6k/DTXTRXJx2N4oA/CTxChvmV6qBz1iKq8I3rZlZPWovvkMGCPie
 X3RCVgRMtlGktl3PyMTN3Z2GzD4bbhzYzVPWvsEGWXuQwzVUKp1aVSFCR
 figBAVgUT/cwk9u7qsBwI3nQRwkpSI7EKrfm02TrrMx7aYCKcFrppVX0Y
 uD12fKobTFMks5HV8dZ23Jpw6SqCyRAAwoLYnPeE+/sLni7uIx7Nv34Vb
 PwP3GJFpJKA2TcvcPLPP8Vu8Mmk+azdCelte/lN6qfRXh887nlWA1/Md7
 LeiGW2nBv/8k/B7zBOE5WrK6JGqpRME1jWMSuw/fR3/ZyHGJddFR2M1KX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="325855869"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="325855869"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="591219231"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/19] drm/edid: convert drm_parse_cea_ext() to use cea db iter
Date: Thu, 14 Apr 2022 18:06:55 +0300
Message-Id: <ec713490029350819f63ad471e6eb00c1e0cec3b.1649948563.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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

Iterate through all CTA data blocks across all CTA Extensions and
DisplayID data blocks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e47bbcd103e6..91f15b561d78 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5520,8 +5520,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			      const struct edid *edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, start, end;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5540,26 +5541,26 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 	}
 
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
 		if (cea_db_is_hdmi_forum_vsdb(db) ||
 		    cea_db_is_hdmi_forum_scdb(db))
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

