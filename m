Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B2D39475
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 12:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E2310E09E;
	Sun, 18 Jan 2026 11:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="nTkmg5VH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Sat, 17 Jan 2026 21:12:10 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97C210E15B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1768684330;
 bh=IAaSa4wat2ffqk/i/+1FIeDn4rpbQkurBn98MuS0Uzw=;
 b=nTkmg5VHQX1sNAsX8/+k4g+tG50V1tSwscQvgasrJTqBmV9gg2YbA60p3siLUc5VWMYg0qXWS
 NZSUaWwLYr5aWwaTM/08BIFd+WOkh+CfrOqz3MTh1HWkkwWBMZsWhUSDqn6c0exdChaiNmbGo5Z
 bTam1yP+0BmWk8TwMVyDEB+q6Dk3StftIGh4J9xBwxeRSvJKqI/5M6/Hs2H3yWYka9O/K9X5HJ+
 G8TISokdjTVLvK9RSr0USJTvoIOKrd/+3KAfBe7U7TgjWX30ULqp6HjgTtYmc7K3loh7lu6vYNf
 mPDw5BfMy/W7bDZYuk8CrY1fIeEZBGBd6uaxdAnr3s5Q==
X-Forward-Email-ID: 696bf66d0ec748e38cfba62a
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.3.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: dri-devel@lists.freedesktop.org
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Date: Sat, 17 Jan 2026 15:51:39 -0500
Message-ID: <20260117205139.13991-1-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 18 Jan 2026 11:13:39 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_parse_hdmi_vsdb_video is one of the parsers that still do not use the
cea_db struct, and currently passes a u8 pointer.

Set the correct struct type and update references to the data accordingly.
This also makes the same change to drm_parse_hdmi_deep_color_info as
necessary.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 26bb7710a..15bd99e65 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-					   const u8 *hdmi)
+					   const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	unsigned int dc_bpc = 0;
@@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	/* HDMI supports at least 8 bpc */
 	info->bpc = 8;
 
-	if (cea_db_payload_len(hdmi) < 6)
+	if (cea_db_payload_len(db) < 6)
 		return;
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
+	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
 			    connector->base.id, connector->name);
 	}
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
+	if (db->data[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
 			    connector->base.id, connector->name);
 	}
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
+	if (db->data[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
@@ -6333,7 +6333,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	info->bpc = dc_bpc;
 
 	/* YCRCB444 is optional according to spec. */
-	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
+	if (db->data[6] & DRM_EDID_HDMI_DC_Y444) {
 		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
 			    connector->base.id, connector->name);
@@ -6343,7 +6343,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * Spec says that if any deep color mode is supported at all,
 	 * then deep color 36 bit must be supported.
 	 */
-	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
+	if (!(db->data[6] & DRM_EDID_HDMI_DC_36)) {
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
 			    connector->base.id, connector->name);
 	}
@@ -6351,19 +6351,19 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
-drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
+drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	u8 len = cea_db_payload_len(db);
 
 	info->is_hdmi = true;
 
-	info->source_physical_address = (db[4] << 8) | db[5];
+	info->source_physical_address = (db->data[4] << 8) | db->data[5];
 
 	if (len >= 6)
-		info->dvi_dual = db[6] & 1;
+		info->dvi_dual = db->data[6] & 1;
 	if (len >= 7)
-		info->max_tmds_clock = db[7] * 5000;
+		info->max_tmds_clock = db->data[7] * 5000;
 
 	/*
 	 * Try to infer whether the sink supports HDMI infoframes.
@@ -6371,7 +6371,7 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
 	 * supports infoframes if HDMI_Video_present is set.
 	 */
-	if (len >= 8 && db[8] & BIT(5))
+	if (len >= 8 && db->data[8] & BIT(5))
 		info->has_hdmi_infoframe = true;
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
@@ -6443,7 +6443,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		const u8 *data = (const u8 *)db;
 
 		if (cea_db_is_hdmi_vsdb(db))
-			drm_parse_hdmi_vsdb_video(connector, data);
+			drm_parse_hdmi_vsdb_video(connector, db);
 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
 			 cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_scds(connector, data);
-- 
2.51.0

