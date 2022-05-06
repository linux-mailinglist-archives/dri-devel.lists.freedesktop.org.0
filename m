Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660B51D567
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E2A10FC13;
	Fri,  6 May 2022 10:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD710FC1E;
 Fri,  6 May 2022 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831956; x=1683367956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6LDxdtQYUkASkFBDQs7eOIByaY2ltq+zt9/8Sgo85Ag=;
 b=iFhnjP3IyC4jJzUBB22EgwMOk74MObuchbnn4eivBRfAPVdRvfw6bVvP
 LDT1mORgR7qXW7pQZnHROYyNkH/l6i+CI7mVDLbxsrz0SgxvvV8GePVfB
 QCRbYjujyHZ86vU6zWPtSXSdwvLUWKC65AMhexgBq+ct4R17UiFoofwmH
 eV5CJbAo2yG0JMAIGVo0Y5zF9RJoqVx8+4zOiijkBvCoSE+wWul4JJ9b+
 1ir8zHCIWM2SbTVKPsiDAAOJKeteg9AJ7eM1MmpYCrzxgjy+OU3j6YdxR
 yl62VX/Z2nr+LQct48AtuYli4qcbCXApv0K4BtQA79kxSDzVnUMKjTk3u w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331413843"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="331413843"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="812320624"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/25] drm/edid: convert drm_edid_iter_begin() to drm_edid
Date: Fri,  6 May 2022 13:10:29 +0300
Message-Id: <b5a6c2cee5083728867db66cca76e895a89c07a3.1651830939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 82a242a71ecf..b453bbf2f642 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1614,36 +1614,36 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
  * struct drm_edid_iter iter;
  * const u8 *block;
  *
- * drm_edid_iter_begin(edid, &iter);
+ * drm_edid_iter_begin(drm_edid, &iter);
  * drm_edid_iter_for_each(block, &iter) {
  *         // do stuff with block
  * }
  * drm_edid_iter_end(&iter);
  */
 struct drm_edid_iter {
-	const struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* Current block index. */
 	int index;
 };
 
-static void drm_edid_iter_begin(const struct edid *edid,
+static void drm_edid_iter_begin(const struct drm_edid *drm_edid,
 				struct drm_edid_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
 
-	iter->edid = edid;
+	iter->drm_edid = drm_edid;
 }
 
 static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
 {
 	const void *block = NULL;
 
-	if (!iter->edid)
+	if (!iter->drm_edid)
 		return NULL;
 
-	if (iter->index < edid_block_count(iter->edid))
-		block = edid_block_data(iter->edid, iter->index++);
+	if (iter->index < edid_block_count(iter->drm_edid->edid))
+		block = edid_block_data(iter->drm_edid->edid, iter->index++);
 
 	return block;
 }
@@ -2593,7 +2593,7 @@ static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&(drm_edid->edid->detailed_timings[i]), closure);
 
-	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(ext, &edid_iter) {
 		switch (*ext) {
 		case CEA_EXT:
@@ -4435,7 +4435,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
 {
 	memset(iter, 0, sizeof(*iter));
 
-	drm_edid_iter_begin(drm_edid->edid, &iter->edid_iter);
+	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
 	displayid_iter_edid_begin(drm_edid->edid, &iter->displayid_iter);
 }
 
@@ -5153,7 +5153,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] == CEA_EXT) {
 			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
@@ -5509,7 +5509,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 
-	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] != CEA_EXT)
 			continue;
-- 
2.30.2

