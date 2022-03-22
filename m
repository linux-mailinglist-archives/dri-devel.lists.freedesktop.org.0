Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB164E487F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146E10E59F;
	Tue, 22 Mar 2022 21:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B47C10E598;
 Tue, 22 Mar 2022 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985311; x=1679521311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dV3wM9hymUSGeYqHYh5jNDplGegty0VQ9BhEzNdEyYA=;
 b=c5L6BJiwYc5a6WA3uNriCUHriwV1JuJZfNNz8JN7gt1ntVsKVjRMchsu
 JHSyoBWMiH47jvpaRQqvkfeXXU3y8Fpf3o/v+WbUV1whajlzdhMfQcNjV
 NcrlDwi1VhsFDr9efhNGeVJEmVJGJoSXTFlLyARQ6g7fMNBk9ScABtwhD
 uojadGVl0LtHPNfN8SgjlpIezPSRHMiei9rTjVUCT5/4ah+4p+CIZjbUT
 8PqTI3Slxr1hqqRPhP/eLgQs02E6/j7b9k2kynKQSYQz2VCuq+loUbhI2
 DDrwIgptE0eTGkAQb42ydjRy56bB+3zHYtZfVfIZS/yBP8sZKrCXFFY6Y w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="258146073"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="258146073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="552273456"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 11/19] drm/edid: convert drm_detect_monitor_audio() to use cea
 db iter
Date: Tue, 22 Mar 2022 23:40:40 +0200
Message-Id: <e8dd2d0b8faffcab8c83af4c9adbb1e0b9ff8df3.1647985054.git.jani.nikula@intel.com>
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

Iterate through all CEA data blocks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 399e69dc1aed..77763d94dd93 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5013,10 +5013,10 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(struct edid *edid)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, j;
 	bool has_audio = false;
-	int start_offset, end_offset;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5029,18 +5029,21 @@ bool drm_detect_monitor_audio(struct edid *edid)
 		goto end;
 	}
 
-	if (cea_db_offsets(edid_ext, &start_offset, &end_offset))
-		goto end;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_tag(db) == CEA_DB_AUDIO) {
+			const u8 *data = cea_db_data(db);
+			int i;
 
-	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == CEA_DB_AUDIO) {
-			has_audio = true;
-			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
+			for (i = 0; i < cea_db_payload_len(db); i += 3)
 				DRM_DEBUG_KMS("CEA audio format %d\n",
-					      (edid_ext[i + j] >> 3) & 0xf);
-			goto end;
+					      (data[i] >> 3) & 0xf);
+			has_audio = true;
+			break;
 		}
 	}
+	cea_db_iter_end(&iter);
+
 end:
 	return has_audio;
 }
-- 
2.30.2

