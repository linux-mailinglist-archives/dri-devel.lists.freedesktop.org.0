Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A0501268
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8F210FF89;
	Thu, 14 Apr 2022 15:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9344910FF85;
 Thu, 14 Apr 2022 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948891; x=1681484891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5BQGGLf7qYhSCVdd89Vfe0kXT67SvDbbnvcGwoJFs08=;
 b=CnXxm75T+JOP6h5oRiSFrosdM81qrUku6fIC8IkYYjLRDd3K31T5N0PU
 RzkpCxs0RyRJZ8z5W26GDKWl/6HarZXlHXhJahCHgE3sVSvFlfjhXACjF
 PfukPRGpsqApFMk0qwq0FV5I/QywiticSbsdiq593vHksQ9v7GyEWEqbL
 iRsLkz31J6wYBg/mzG5cI2iGK3N9anrIciXQXSuqFSCTxGGbX6GvHEK2I
 cnbCo+udEYXsfqWVAtwSPCC+spWUZRRkzN0TDY7AbXrbCg+ly1zDEOJPq
 5l6OanwBDs/5KtF43F/RHtLASkMHmei3bYuTM2DI36YEqSHg7j2AcdBXG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="243538338"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="243538338"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="526946760"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/19] drm/edid: convert drm_detect_monitor_audio() to use cea
 db iter
Date: Thu, 14 Apr 2022 18:06:54 +0300
Message-Id: <c29824342359838f5566ccc71ce0955d40f9938f.1649948563.git.jani.nikula@intel.com>
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

Iterate through all CEA data blocks.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b1fac281fd85..e47bbcd103e6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5190,10 +5190,10 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(const struct edid *edid)
 {
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	const u8 *edid_ext;
-	int i, j;
 	bool has_audio = false;
-	int start_offset, end_offset;
 
 	edid_ext = drm_find_cea_extension(edid);
 	if (!edid_ext)
@@ -5207,18 +5207,21 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 	}
 
-	if (cea_db_offsets(edid_ext, &start_offset, &end_offset))
-		goto end;
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		if (cea_db_tag(db) == CTA_DB_AUDIO) {
+			const u8 *data = cea_db_data(db);
+			int i;
 
-	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == CTA_DB_AUDIO) {
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

