Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E8501274
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE110FCFF;
	Thu, 14 Apr 2022 15:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B910FCFF;
 Thu, 14 Apr 2022 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948904; x=1681484904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9+SHWqV26mwgE6ZzT52bR3T+TNWXFIRbLch36yzGpI0=;
 b=Ah0DWG6wBp31SMN/7qoAxW0uQFxnem0luW340u2NUfwDlWRc28WUCm7n
 vns/hiJIlWBD92jLdmGP3Y6VZylK9UqkrF4dYWtCZnSDYCDfKtq2BFES0
 B5YumG1vrz+Nh+Y3BzZqBt3na+VCrSON/iD2U7RGppP/zwz5jm4sL1gik
 /RVKYa+GTz/zY4up2QqDvrqTnlzV/o6bCS3siJ2HZHGocHbqF3OrAOHIv
 ysd6yw/+csRLdDgx4MIvzNlakpTS+8zB0NDUwhFbko8OR2mrOKRuHjqe0
 XF2uz181DixOU6YQAEaxE/gjkEXWE4AaGySoB/fwI8ue5RCQg0yZDWW/A Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="325855775"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="325855775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="661408856"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/19] drm/edid: convert drm_edid_to_sad() to use cea db iter
Date: Thu, 14 Apr 2022 18:06:52 +0300
Message-Id: <610ef8d6e8ebdbf49ebf5e9e86da801115bd0689.1649948562.git.jani.nikula@intel.com>
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

Use the cea db iterator for short audio descriptors. We'll still stop at
the first audio data block, but not at the first CTA Extension if that
doesn't have the info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index dac6a400905b..164a2020f9e1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5031,40 +5031,21 @@ static void drm_edid_to_eld(struct drm_connector *connector,
  */
 int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int count = 0;
-	int i, start, end, dbl;
-	const u8 *cea;
-
-	cea = drm_find_cea_extension(edid);
-	if (!cea) {
-		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
-		return 0;
-	}
-
-	if (cea_revision(cea) < 3) {
-		DRM_DEBUG_KMS("SAD: wrong CEA revision\n");
-		return 0;
-	}
-
-	if (cea_db_offsets(cea, &start, &end)) {
-		DRM_DEBUG_KMS("SAD: invalid data block offsets\n");
-		return -EPROTO;
-	}
-
-	for_each_cea_db(cea, i, start, end) {
-		const u8 *db = &cea[i];
 
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
 
-			dbl = cea_db_payload_len(db);
-
-			count = dbl / 3; /* SAD is 3B */
+			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
 			*sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
 			if (!*sads)
 				return -ENOMEM;
 			for (j = 0; j < count; j++) {
-				const u8 *sad = &db[1 + j * 3];
+				const u8 *sad = &db->data[j * 3];
 
 				(*sads)[j].format = (sad[0] & 0x78) >> 3;
 				(*sads)[j].channels = sad[0] & 0x7;
@@ -5074,6 +5055,9 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
+	DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
 
 	return count;
 }
-- 
2.30.2

