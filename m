Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3094CA085
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2198410F2AC;
	Wed,  2 Mar 2022 09:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82D10F2AB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646212927; x=1677748927;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=2MgKnFhFc6dWsYfhJiYydsk0WO25IriAjeObmCyJEm4=;
 b=TJrIR9dfRDCMMx35jdgoBsGdUVkYChcKqwuHZsgjubUdFFDJgmmfTdKL
 wa5Eml8REVpGN4tXcXL/66xOUBiU2Gcyldnq0cm9LBS6qyl3FEIQurIqM
 IMJSFc4ebvOVhaG2aRsql6bqjVoGKBTeX1QIV1Zo4WgSrj9OCJ2WwozLp
 5ieo+M7vbbvXghHjjBjSx2hdZBqNGWIKO8f/hh8iNCCz6vVpvRi5uzeqi
 vLqmuXbOcBO+eK9sPAaPOqkXdgQqwwVBDNR8qDwYXWPNyZaQnLJiJbBLF
 jr2BOmz9mLltgkannbEa81RDWjDwhZQa5adnXp9OuNBsT+VZFG82COKR0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="252187710"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="252187710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 01:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="807012031"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2022 01:22:05 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v4 1/5] drm/edid: seek for available CEA block from specific EDID
 block index
Date: Wed,  2 Mar 2022 17:35:07 +0800
Message-Id: <20220302093511.30299-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302093511.30299-1-shawn.c.lee@intel.com>
References: <20220302093511.30299-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_find_cea_extension() always look for a top level CEA block. Pass
ext_index from caller then this function to search next available
CEA ext block from a specific EDID block pointer.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 42 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a504542238ed..375e70d9de86 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3353,16 +3353,14 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+static const u8 *drm_find_cea_extension(const struct edid *edid, int *ext_index)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
-	int ext_index = 0;
 
-	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
+	/* Look for a CEA extension block from ext_index */
+	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index);
 	if (cea)
 		return cea;
 
@@ -3643,10 +3641,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
 	LIST_HEAD(list);
-	int modes = 0;
+	int modes = 0, ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	if (!drm_find_cea_extension(edid, &ext_index))
 		return 0;
 
 	/*
@@ -4321,11 +4319,11 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
-	const u8 *db, *hdmi = NULL, *video = NULL;
+	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
-	int modes = 0;
+	int modes = 0, ext_index = 0;
 
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (cea && cea_revision(cea) >= 3) {
 		int i, start, end;
 
@@ -4562,7 +4560,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
 	const u8 *db;
-	int total_sad_count = 0;
+	int total_sad_count = 0, ext_index = 0;
 	int mnl;
 	int dbl;
 
@@ -4571,7 +4569,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4655,11 +4653,11 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  */
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4717,11 +4715,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  */
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4814,9 +4812,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i;
-	int start_offset, end_offset;
+	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return false;
 
@@ -4853,9 +4851,9 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	const u8 *edid_ext;
 	int i, j;
 	bool has_audio = false;
-	int start_offset, end_offset;
+	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		goto end;
 
@@ -5177,9 +5175,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 {
 	struct drm_display_info *info = &connector->display_info;
 	const u8 *edid_ext;
-	int i, start, end;
+	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return;
 
-- 
2.17.1

