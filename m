Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7A99A7AF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 17:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0D410EB19;
	Fri, 11 Oct 2024 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KFX3yBm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5521410EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 15:29:37 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7e9f998e1e4so1796440a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728660577; x=1729265377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d2O0wF//mc3QHjPTSSLktyXdiyqG45d84oFd85Asuek=;
 b=KFX3yBm2Swcrc08wmE0qjXteUBBZRmxHxxTVvroBlIC7NE7dMsuzz30kxVe5feerOC
 FmsClE7haT2NZ2fF5Od/0JzaHRg/EwAzBvJNoexDPRZklL1zhcV0LV8Z0opkeGrB6Dr5
 SbM+dY+XZ0eUUHMkHIphmmhOVfpOkLLD1lA6gnzBXpdIf/nvD+TIdd/fpbakfwVIAsRW
 pZyQxRJz9mQEE5B8iohnsUF62AekooCV1gDeNq0koRbDJaob0sDUfAI4Vf1jgo7udUtV
 mVY+xkeeXBo+fOJ4uzQIQ0vVeOkf4O3XVm1yuh6cnbjUL1HDjsGlj5+JJ9ETzgJ4VL6/
 cU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728660577; x=1729265377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2O0wF//mc3QHjPTSSLktyXdiyqG45d84oFd85Asuek=;
 b=NOAYmA4B/ZECFCMt0qvliDxQeit2F6mWKumdWuvaFdQ8mrwy16xEuRFzNcFSaT1lwW
 jf+42N3wRroyX8dmdOvLg3GB7RE8NLZELx7xvwNqIW3FewLyTfR9gZYJHCB/ZMlMzs3j
 0+ecU5PqBXA9J4ElqJ3j1BH1xQWvpg3pcI/LACGSisTfdDx021wPk3KTmBvyecL63vQ9
 t2g8oGSrpn/EbWtV8TZ0UrDydAUd15DB6kg1IoCNOmxCG1EnXb3bSS1k9xm6eT+mKQlO
 5itREBjKuXZbRH1Y/IXHmGPuKavn8MeIQ/owvpcZO+S57XGFc1r/b3pk5pbZLa0+LmXz
 TfPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmxxscAVePjDpLT645rL+GHI/8h1W/3iZtct+7N50V5mjTOB6g+6uxBulpnJeqBSRGrAIIdc0c5Ic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNxQjaFtYBx5rV/z8y1q1cK7Z9/W1ZKX3KfslaYwxXKwf8Rp//
 MQF2n1vpNIi6BOxNSTsDKT0Jb6EMYQSoHR55h7AT/V4/ZYRMk7ob
X-Google-Smtp-Source: AGHT+IGuY7K33VVtb1/IVAdFqPLNCq5hLo9e+WM8qmOWVaMyxPlSM6TQvdr4NBnQX4xdH5WWGBJ09g==
X-Received: by 2002:a05:6a21:393:b0:1d2:f00e:47bb with SMTP id
 adf61e73a8af0-1d8bcf3e69fmr3962128637.21.1728660576451; 
 Fri, 11 Oct 2024 08:29:36 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e2ab0a5c1sm2700140b3a.194.2024.10.11.08.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 08:29:35 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: transition to passing struct cea_db * to
 cae_db_payload_len
Date: Fri, 11 Oct 2024 20:59:29 +0530
Message-ID: <20241011152929.10145-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Address the FIXME in cea_db_payload_len
	Transition to passing struct cea_db * everywhere

Precompute the payload length in drm_parse_cea_ext and pass to
individual parsers to avoid casting struct cea_db pointer to u8
pointer where length is needed.

Since the type of payload length is inconsistent in the file,
use u8, u16 where it was already in place, use int elsewhere.

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 63 ++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..80442e8b8ac6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4977,11 +4977,8 @@ static int cea_db_tag(const struct cea_db *db)
 	return db->tag_length >> 5;
 }
 
-static int cea_db_payload_len(const void *_db)
+static int cea_db_payload_len(const struct cea_db *db)
 {
-	/* FIXME: Transition to passing struct cea_db * everywhere. */
-	const struct cea_db *db = _db;
-
 	return db->tag_length & 0x1f;
 }
 
@@ -5432,22 +5429,18 @@ static uint8_t hdr_metadata_type(const u8 *edid_ext)
 }
 
 static void
-drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
+drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db, const u16 payload_len)
 {
-	u16 len;
-
-	len = cea_db_payload_len(db);
-
 	connector->hdr_sink_metadata.hdmi_type1.eotf =
 						eotf_supported(db);
 	connector->hdr_sink_metadata.hdmi_type1.metadata_type =
 						hdr_metadata_type(db);
 
-	if (len >= 4)
+	if (payload_len >= 4)
 		connector->hdr_sink_metadata.hdmi_type1.max_cll = db[4];
-	if (len >= 5)
+	if (payload_len >= 5)
 		connector->hdr_sink_metadata.hdmi_type1.max_fall = db[5];
-	if (len >= 6) {
+	if (payload_len >= 6) {
 		connector->hdr_sink_metadata.hdmi_type1.min_cll = db[6];
 
 		/* Calculate only when all values are available */
@@ -5457,20 +5450,18 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 
 /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
-drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
+drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db, u8 payload_len)
 {
-	u8 len = cea_db_payload_len(db);
-
-	if (len >= 6 && (db[6] & (1 << 7)))
+	if (payload_len >= 6 && (db[6] & (1 << 7)))
 		connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
 
-	if (len >= 10 && hdmi_vsdb_latency_present(db)) {
+	if (payload_len >= 10 && hdmi_vsdb_latency_present(db)) {
 		connector->latency_present[0] = true;
 		connector->video_latency[0] = db[9];
 		connector->audio_latency[0] = db[10];
 	}
 
-	if (len >= 12 && hdmi_vsdb_i_latency_present(db)) {
+	if (payload_len >= 12 && hdmi_vsdb_i_latency_present(db)) {
 		connector->latency_present[1] = true;
 		connector->video_latency[1] = db[11];
 		connector->audio_latency[1] = db[12];
@@ -5695,7 +5686,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 		case CTA_DB_VENDOR:
 			/* HDMI Vendor-Specific Data Block */
 			if (cea_db_is_hdmi_vsdb(db))
-				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db);
+				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db, len);
 			break;
 		default:
 			break;
@@ -6122,7 +6113,7 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 }
 
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
-			       const u8 *hf_scds)
+			       const u8 *hf_scds, int payload_len)
 {
 	hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
 
@@ -6142,7 +6133,7 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 		/* Supports min 8 BPC if DSC 1.2 is supported*/
 		hdmi_dsc->bpc_supported = 8;
 
-	if (cea_db_payload_len(hf_scds) >= 12 && hf_scds[12]) {
+	if (payload_len >= 12 && hf_scds[12]) {
 		u8 dsc_max_slices;
 		u8 dsc_max_frl_rate;
 
@@ -6188,13 +6179,13 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 		}
 	}
 
-	if (cea_db_payload_len(hf_scds) >= 13 && hf_scds[13])
+	if (payload_len >= 13 && hf_scds[13])
 		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 }
 
 /* Sink Capability Data Structure */
 static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
-				      const u8 *hf_scds)
+				      const u8 *hf_scds, int payload_len)
 {
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &info->hdmi;
@@ -6247,8 +6238,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
 
-	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
-		drm_parse_dsc_info(hdmi_dsc, hf_scds);
+	if (payload_len >= 11 && hf_scds[11]) {
+		drm_parse_dsc_info(hdmi_dsc, hf_scds, payload_len);
 		dsc_support = true;
 	}
 
@@ -6259,7 +6250,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-					   const u8 *hdmi)
+					   const u8 *hdmi, const u8 payload_len)
 {
 	struct drm_display_info *info = &connector->display_info;
 	unsigned int dc_bpc = 0;
@@ -6267,7 +6258,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	/* HDMI supports at least 8 bpc */
 	info->bpc = 8;
 
-	if (cea_db_payload_len(hdmi) < 6)
+	if (payload_len < 6)
 		return;
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
@@ -6320,18 +6311,17 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
-drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
+drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db, const u8 payload_len)
 {
 	struct drm_display_info *info = &connector->display_info;
-	u8 len = cea_db_payload_len(db);
 
 	info->is_hdmi = true;
 
 	info->source_physical_address = (db[4] << 8) | db[5];
 
-	if (len >= 6)
+	if (payload_len >= 6)
 		info->dvi_dual = db[6] & 1;
-	if (len >= 7)
+	if (payload_len >= 7)
 		info->max_tmds_clock = db[7] * 5000;
 
 	/*
@@ -6340,14 +6330,14 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
 	 * supports infoframes if HDMI_Video_present is set.
 	 */
-	if (len >= 8 && db[8] & BIT(5))
+	if (payload_len >= 8 && db[8] & BIT(5))
 		info->has_hdmi_infoframe = true;
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
 		    connector->base.id, connector->name,
 		    info->dvi_dual, info->max_tmds_clock);
 
-	drm_parse_hdmi_deep_color_info(connector, db);
+	drm_parse_hdmi_deep_color_info(connector, db, payload_len);
 }
 
 /*
@@ -6410,12 +6400,13 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
+		int len = cea_db_payload_len(db);
 
 		if (cea_db_is_hdmi_vsdb(db))
-			drm_parse_hdmi_vsdb_video(connector, data);
+			drm_parse_hdmi_vsdb_video(connector, data, len);
 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
 			 cea_db_is_hdmi_forum_scdb(db))
-			drm_parse_hdmi_forum_scds(connector, data);
+			drm_parse_hdmi_forum_scds(connector, data, len);
 		else if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, data);
 		else if (cea_db_is_y420cmdb(db))
@@ -6425,7 +6416,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		else if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, data);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
-			drm_parse_hdr_metadata_block(connector, data);
+			drm_parse_hdr_metadata_block(connector, data, len);
 		else if (cea_db_tag(db) == CTA_DB_VIDEO)
 			parse_cta_vdb(connector, db);
 		else if (cea_db_tag(db) == CTA_DB_AUDIO)

base-commit: 1d227fcc72223cbdd34d0ce13541cbaab5e0d72f
-- 
2.47.0

