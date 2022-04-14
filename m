Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A1501273
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731210E00B;
	Thu, 14 Apr 2022 15:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ED710E00B;
 Thu, 14 Apr 2022 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948903; x=1681484903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sMkCARBdbCjp9/ZHyaRd0YEGcFQeDShNiROgCIOc9YA=;
 b=BEDuryfM4S8VobklGIpeXRfOKW0Rz+a2OFFAKgcmAUCP22zUKwKq2PLt
 ozPaC9WRNBTj/il4ENlWQBicCyaSZtLVRkBMGYMMtezLkVjhYrS4UCcj+
 7DO4nojAyr6xW2wJwK8Hx7KVkgTb/WNjnNMFqaVLaGvz0qwpFnD6YLxjJ
 A/JtfyXrGUuaNcqU74EZbdDOwkqDI87Gopu3PdhlreLRrymPj+rQ4wKtf
 ChLc9RkKV5XBznrrBpY/57zprIjzPSicRAo/V6NQdcdv3qyU7ykSxb5Kh
 9zc3fxXIcpTVcoPTnkcOaH470N1Ls/1qgxIUC/2CgK+Cs6Y5zl9uhvHJ3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="244836265"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="244836265"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="645654848"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/19] drm/edid: convert drm_edid_to_eld() to use cea db iter
Date: Thu, 14 Apr 2022 18:06:56 +0300
Message-Id: <89b7d83488d7b0dd252efb9b66cbc2da27ab34a7.1649948563.git.jani.nikula@intel.com>
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

Iterate through all CTA data blocks across all CTA extensions and
DisplayID data blocks. This may gather more data than before, and if
there's duplicated data, some is overwritten by whichever comes last.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 64 +++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 91f15b561d78..fa7f2bf68da3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4935,12 +4935,12 @@ static void clear_eld(struct drm_connector *connector)
 static void drm_edid_to_eld(struct drm_connector *connector,
 			    const struct edid *edid)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
-	const u8 *db;
 	int total_sad_count = 0;
 	int mnl;
-	int dbl;
 
 	clear_eld(connector);
 
@@ -4966,43 +4966,37 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_PRODUCT_CODE0] = edid->prod_code[0];
 	eld[DRM_ELD_PRODUCT_CODE1] = edid->prod_code[1];
 
-	if (cea_revision(cea) >= 3) {
-		int i, start, end;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		const u8 *data = cea_db_data(db);
+		int len = cea_db_payload_len(db);
 		int sad_count;
 
-		if (cea_db_offsets(cea, &start, &end)) {
-			start = 0;
-			end = 0;
-		}
-
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
-
-			switch (cea_db_tag(db)) {
-			case CTA_DB_AUDIO:
-				/* Audio Data Block, contains SADs */
-				sad_count = min(dbl / 3, 15 - total_sad_count);
-				if (sad_count >= 1)
-					memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_sad_count)],
-					       &db[1], sad_count * 3);
-				total_sad_count += sad_count;
-				break;
-			case CTA_DB_SPEAKER:
-				/* Speaker Allocation Data Block */
-				if (dbl >= 1)
-					eld[DRM_ELD_SPEAKER] = db[1];
-				break;
-			case CTA_DB_VENDOR:
-				/* HDMI Vendor-Specific Data Block */
-				if (cea_db_is_hdmi_vsdb(db))
-					drm_parse_hdmi_vsdb_audio(connector, db);
-				break;
-			default:
-				break;
-			}
+		switch (cea_db_tag(db)) {
+		case CTA_DB_AUDIO:
+			/* Audio Data Block, contains SADs */
+			sad_count = min(len / 3, 15 - total_sad_count);
+			if (sad_count >= 1)
+				memcpy(&eld[DRM_ELD_CEA_SAD(mnl, total_sad_count)],
+				       data, sad_count * 3);
+			total_sad_count += sad_count;
+			break;
+		case CTA_DB_SPEAKER:
+			/* Speaker Allocation Data Block */
+			if (len >= 1)
+				eld[DRM_ELD_SPEAKER] = data[0];
+			break;
+		case CTA_DB_VENDOR:
+			/* HDMI Vendor-Specific Data Block */
+			if (cea_db_is_hdmi_vsdb(db))
+				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db);
+			break;
+		default:
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
 	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= total_sad_count << DRM_ELD_SAD_COUNT_SHIFT;
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
-- 
2.30.2

