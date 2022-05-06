Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A9251D566
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5884710FC12;
	Fri,  6 May 2022 10:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B8110FC11;
 Fri,  6 May 2022 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831951; x=1683367951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7nXUEpE3MDUfjDL4p858dRiWkyiXpAgX8bi9JKUjqs=;
 b=UZ0Bk9sfQp5sfEyp7GqtX4D/7cYihZWmxcldeDECksTyN/bE4WlSBUgk
 p8SPE2T9UA0zEXkuF5uzA0zqX++AAIJH2ezu+WEdlbGlU3MIRt9ofAHrf
 ZHzMO/+Cmu7yd/0OBwk3vccqBfxmcW4IafFg2F11h9IzM7IuCY7zbPAKk
 fLqfwgmuU+KWO53+zhbvobvPFwwVxHi6YKFkZ/5JIpX8rPfa3AN0+ApfJ
 cEy+x19N+owuCEM62+zz1Q5EqHQlCyFpQ6CutG24urQ3keQzfHClqL6XM
 3ii40RM60CJKqV7iwnnPJP2zVyyGdP00z1vm246uh8wYYeyEGio/ab74u g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248959751"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248959751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="632871801"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/25] drm/edid: convert cea_db_iter_edid_begin() to drm_edid
Date: Fri,  6 May 2022 13:10:28 +0300
Message-Id: <6c0917122d9bbbf4a40ec7e28878cd22429e91c4.1651830939.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 706552ae00ea..82a242a71ecf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4430,12 +4430,13 @@ static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
 		oui(data[2], data[1], data[0]) == vendor_oui;
 }
 
-static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
+static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
+				   struct cea_db_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
 
-	drm_edid_iter_begin(edid, &iter->edid_iter);
-	displayid_iter_edid_begin(edid, &iter->displayid_iter);
+	drm_edid_iter_begin(drm_edid->edid, &iter->edid_iter);
+	displayid_iter_edid_begin(drm_edid->edid, &iter->displayid_iter);
 }
 
 static const struct cea_db *
@@ -4657,7 +4658,7 @@ static int add_cea_modes(struct drm_connector *connector,
 	struct cea_db_iter iter;
 	int modes = 0;
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *hdmi = NULL, *video = NULL;
 		u8 hdmi_len = 0, video_len = 0;
@@ -4908,7 +4909,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_PRODUCT_CODE0] = drm_edid->edid->prod_code[0];
 	eld[DRM_ELD_PRODUCT_CODE1] = drm_edid->edid->prod_code[1];
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *data = cea_db_data(db);
 		int len = cea_db_payload_len(db);
@@ -4961,7 +4962,7 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
@@ -5017,7 +5018,7 @@ static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
 		    cea_db_payload_len(db) == 3) {
@@ -5110,7 +5111,7 @@ static bool _drm_detect_hdmi_monitor(const struct drm_edid *drm_edid)
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_is_hdmi_vsdb(db)) {
 			hdmi = true;
@@ -5167,7 +5168,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 		goto end;
 	}
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			const u8 *data = cea_db_data(db);
@@ -5529,7 +5530,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	}
 	drm_edid_iter_end(&edid_iter);
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
-- 
2.30.2

