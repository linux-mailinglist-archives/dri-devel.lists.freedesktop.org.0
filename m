Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44774E4879
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6010E59D;
	Tue, 22 Mar 2022 21:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE38110E58A;
 Tue, 22 Mar 2022 21:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985297; x=1679521297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gk6HPLqqbZs+uoAjK5hBPiCgjmTuXYH9dBsafHzYmBM=;
 b=jkLBv3nXcvLCdjkqN+bXszqaSqlnAsC5egxkzormnq73/LWW7PA1ysXU
 kUiMDp8B1AtsIxXVlYCbJ2hNmMqEY99LAgrgotWZZ+rTVSBbbv0cH5bzG
 bxny1z7+6PcU/3WZZmNuZ9erbPellVTyJmhO6UY+TPPiyUg0etRejjDcv
 2DXtVzO3uovb/YDqpYn8e+5JGz5o1wzOAuAH7692nD+XcZKGIQR+8m2iD
 Dnq3r5VI7fcateAdOLGyIcm7Dv4unRSEI8ANmdnbqUOPG+SmYFqCduKRK
 UBsJMalVEsz3Vx1mrUtF1wVs2xTh67GW/G63oYWR7Jvf4sz1mh2QZtBmq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282795445"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="282795445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="637222940"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 08/19] drm/edid: convert drm_edid_to_speaker_allocation() to use
 cea db iter
Date: Tue, 22 Mar 2022 23:40:37 +0200
Message-Id: <5ba02714b6a559fcb56608e41d964830cbb2db23.1647985054.git.jani.nikula@intel.com>
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

Use the cea db iterator for speaker allocation. We'll still stop at the
first speaker data block, but not at the first CEA extension if that
doesn't have the info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 47 ++++++++++++--------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d92ce5d540c3..992b3578a73f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4916,42 +4916,25 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  */
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int count = 0;
-	int i, start, end, dbl;
-	const u8 *cea;
 
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
-
-		if (cea_db_tag(db) == CEA_DB_SPEAKER) {
-			dbl = cea_db_payload_len(db);
-
-			/* Speaker Allocation Data Block */
-			if (dbl == 3) {
-				*sadb = kmemdup(&db[1], dbl, GFP_KERNEL);
-				if (!*sadb)
-					return -ENOMEM;
-				count = dbl;
-				break;
-			}
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_tag(db) == CEA_DB_SPEAKER &&
+		    cea_db_payload_len(db) == 3) {
+			*sadb = kmemdup(db->data, cea_db_payload_len(db),
+					GFP_KERNEL);
+			if (!*sadb)
+				return -ENOMEM;
+			count = cea_db_payload_len(db);
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
+	DRM_DEBUG_KMS("Found %d Speaker Allocation Data Blocks\n", count);
 
 	return count;
 }
-- 
2.30.2

