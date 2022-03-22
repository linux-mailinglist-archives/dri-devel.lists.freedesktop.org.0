Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04CC4E4878
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA5810E597;
	Tue, 22 Mar 2022 21:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3168710E58A;
 Tue, 22 Mar 2022 21:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985302; x=1679521302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJYelk8ApsdKGI4k/KI0A/qXtBIXYuJ0C/mccMOITC8=;
 b=NKzEOXCV3zlDUR82h8vzQsY7SrOxKeryUOE3PO7zRZJI1gFY7AAWKvZ9
 lTuVYpSDJWtIizHjkLMI1MlM5aI5iuk76LCf8nWu5lzz/wKWdJKMfS9Wn
 /evU+AL+pxTHkBLAJ/qjsCA8NuC+UBPoz3bsgcCsFE0Nm2XKhrqTgvEiC
 Rz3ULcUC8vRgey/A5OhVCAqYL2NGR3MGdPDY4VOdrvlYJoLfawiDVpGUz
 oGwBBVDma5uCSCRBnr5vuIz3ZNIPnT9hZtvFMwZaPWmgReUevq/XaMjjT
 DtkfoVcbGOpazQ2XMlVTCx2h1tGWT7+iLw+7nslg6GRQzOLBa/cQgehi7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="237898636"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="237898636"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="647215679"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 09/19] drm/edid: convert drm_edid_to_sad() to use cea db iter
Date: Tue, 22 Mar 2022 23:40:38 +0200
Message-Id: <fb35ac3c561f6ff98374ebeb2fb3a4fb8a22974e.1647985054.git.jani.nikula@intel.com>
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

Use the cea db iterator for short audio descriptors. We'll still stop at
the first audio data block, but not at the first CEA extension if that
doesn't have the info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 992b3578a73f..e341790521d6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4854,40 +4854,21 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  */
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
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
 		if (cea_db_tag(db) == CEA_DB_AUDIO) {
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
@@ -4897,6 +4878,9 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
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

