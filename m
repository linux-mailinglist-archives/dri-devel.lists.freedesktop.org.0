Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224E51FC21
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8E210EF12;
	Mon,  9 May 2022 12:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCADD10EF36;
 Mon,  9 May 2022 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097917; x=1683633917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=377riFLDGOx+3N8DE56v6GlHwMdxk1ZvQoI94qjVehc=;
 b=bhZf+voNO+KJGqqzfhSuBVUFDYn9CeYLWGtpUweHs3Cx0wDSpsDKOZy0
 4f7u3d/KEixGcoss88P9jaqW2Q5IMgF7eYQezqmvIP75dtguuIN0CuEXk
 A9n4CvTqOvNEggWtAHyZmiS/Pe81td1pRGKxTO0TIq+jRWOHLrIrTNinM
 8qI1PBf+3ZjPUlOYtGSU54BIkyShnWX9MJRdXSCRYn2AdKVbL8v0ZEdnd
 VMcn5JZxMRcic9unYK6IwJZWvkOmDIqtlpcy7b7pomsjHs3/dL/O2y7ga
 Ivi8TpBm5UOukWalgCakL7nsq3OvpQCUcJGRkdzicfweIy/NEm+A9/xBQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="267869407"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="267869407"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622937404"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/25] drm/edid: convert cea_db_iter_edid_begin() to
 drm_edid
Date: Mon,  9 May 2022 15:03:20 +0300
Message-Id: <7d9f060815086e1e4ea037dbfb9fd8ad54d1f25e.1652097712.git.jani.nikula@intel.com>
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

v2: Handle NULL drm_edid

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f072cfba9dd9..bd14010ed1c5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4448,12 +4448,13 @@ static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
 		oui(data[2], data[1], data[0]) == vendor_oui;
 }
 
-static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
+static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
+				   struct cea_db_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
 
-	drm_edid_iter_begin(edid, &iter->edid_iter);
-	displayid_iter_edid_begin(edid, &iter->displayid_iter);
+	drm_edid_iter_begin(drm_edid ? drm_edid->edid : NULL, &iter->edid_iter);
+	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
 }
 
 static const struct cea_db *
@@ -4675,7 +4676,7 @@ static int add_cea_modes(struct drm_connector *connector,
 	struct cea_db_iter iter;
 	int modes = 0;
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *hdmi = NULL, *video = NULL;
 		u8 hdmi_len = 0, video_len = 0;
@@ -4926,7 +4927,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_PRODUCT_CODE0] = drm_edid->edid->prod_code[0];
 	eld[DRM_ELD_PRODUCT_CODE1] = drm_edid->edid->prod_code[1];
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *data = cea_db_data(db);
 		int len = cea_db_payload_len(db);
@@ -4979,7 +4980,7 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
@@ -5032,7 +5033,7 @@ static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
 	struct cea_db_iter iter;
 	int count = 0;
 
-	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_SPEAKER &&
 		    cea_db_payload_len(db) == 3) {
@@ -5123,7 +5124,7 @@ static bool _drm_detect_hdmi_monitor(const struct drm_edid *drm_edid)
 	 * Because HDMI identifier is in Vendor Specific Block,
 	 * search it from all data blocks of CEA extension.
 	 */
-	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_is_hdmi_vsdb(db)) {
 			hdmi = true;
@@ -5177,7 +5178,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
 		goto end;
 	}
 
-	cea_db_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			const u8 *data = cea_db_data(db);
@@ -5536,7 +5537,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	}
 	drm_edid_iter_end(&edid_iter);
 
-	cea_db_iter_edid_begin(drm_edid->edid, &iter);
+	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
-- 
2.30.2

