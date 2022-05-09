Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AE51FC22
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA1110EF48;
	Mon,  9 May 2022 12:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADA210EF18;
 Mon,  9 May 2022 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097921; x=1683633921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=crxphi9DPRapv44g2oK30KY4En+Qnv+ue1NtbhYohrA=;
 b=CfTfxOcKpi6fcN7DB11Kry9CATiCw/xmb3kdR4L2MjPY05dHtXLGvhHX
 r3/gEtopVV5lM5Xl/4mpNsMsGogIQEdB5afgQ1aalGeOAvk9ryw9DP1j9
 kMwysF3r4NsN+ifxqlUlmd35z2hXVDVQAwS00/nNfOJ8PwFQPLcR/RRM6
 b6NqFlngFY575inS5yLTG/mLl20VzA28xw36gfHsp/zbBG/9n8cbubwqe
 LQZuEjyVPCFpdK0bR/hVqYA835TI3ziGUrVLOzs8mcgom2jTd/Ny5RwEn
 Yx0augDzBA477QTf9FOn+qZ2DOGorRtjcicZQUl0E596fgYDIE5pWJasM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="269167795"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="269167795"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="813447983"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/25] drm/edid: convert drm_edid_iter_begin() to drm_edid
Date: Mon,  9 May 2022 15:03:21 +0300
Message-Id: <24dfb5fd9026ebef573bb55b368b94e56cae5cec.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

v2: Rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bd14010ed1c5..d857d1d74c82 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1632,36 +1632,36 @@ static const struct drm_edid *drm_edid_legacy_init(struct drm_edid *drm_edid,
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
@@ -2611,7 +2611,7 @@ static void drm_for_each_detailed_block(const struct drm_edid *drm_edid,
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&drm_edid->edid->detailed_timings[i], closure);
 
-	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(ext, &edid_iter) {
 		switch (*ext) {
 		case CEA_EXT:
@@ -4453,7 +4453,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
 {
 	memset(iter, 0, sizeof(*iter));
 
-	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &iter->edid_iter);
+	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
 	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
 }
 
@@ -5163,7 +5163,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 	const u8 *edid_ext;
 	bool has_audio = false;
 
-	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] == CEA_EXT) {
 			has_audio = edid_ext[3] & EDID_BASIC_AUDIO;
@@ -5516,7 +5516,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 
-	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] != CEA_EXT)
 			continue;
-- 
2.30.2

