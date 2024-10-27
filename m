Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F49B1C5F
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5512F10E199;
	Sun, 27 Oct 2024 07:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LHK9Y45A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186E10E199
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:20 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7ea9739647bso2297803a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015480; x=1730620280; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmZ562TWvSEYWHmls9zLStGOVmuvMcWc95tM3sj3JQY=;
 b=LHK9Y45AyryAPTIk/XMG+uVSMztOX/zS1IAz1Uwb379BVS9SeYXKnJZ2dXRF09iJtr
 KTrEqqFvGD5alGciquinI5Uyz9ylYCFNJvX616k8VGaTMWJ5HO/vbR6K0sTNPC2xe4Xj
 gHpi3N8cX25eXEk0QbAADDF14pQq7AdwTj0Yav9CFUKfrZbkOhioTfsYACrgfp3UkhkD
 RWZnQjRsiS+eH/JdW/2Xti3KuBcfEeRWxXF87xDEVBl0/O7wbkzEl6WIqxlgPguDhikf
 CpavZYjZrsKihRcKrFw5ZiLP+fFDz+Ixph3nUoA7+hJ3KkHzglGJBv4NDp7cEAKi156Z
 9Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015480; x=1730620280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmZ562TWvSEYWHmls9zLStGOVmuvMcWc95tM3sj3JQY=;
 b=QiA9xshCCGZprhJcSr+6iObrXwP40fjFFsKtRSvAvRk9aSZuoNWOxrkjlfDZM2V+9Y
 Z6X6UWwoosAv+0xuez+aldp7Ker8rs/klSsdC64UDGJfuPWGT4rZ9ScGixB0LULEvfQE
 vQeYkpVhJsLfP1OO3DIdtitBYz3zy8CqjY4CkIYV090sRG00GyFRRQtDuSUSkzy3CsUx
 Y6QhlzNzIgWCsOxI9/u9hFZiB2tc6JbSXXI4ClGh4RU+dgVtVUY6UHBWAv77OnfA5m/0
 47OcFb1ByF2vAcq8t/9gOHSulWZh81odlrCs4slBfJCBDXSgFeyyr5WPspbsY3KbWBIK
 c+Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL7gqYHamSC6Y/lRVLWp5gc3THICIKkQ77uODBDPEjHrvi8/t4nLb+6QUsTlKB/GWJ3eeR7MKnyxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRQso9PwUXE0cpMKZFWgnYO80bDQUF091TE/2tv8UhRlIgPHYm
 x+BCRNI8bLtZGPZ9c2WQRUNacPK0TgsZiWCvf4M6qM/VIg4dMyms
X-Google-Smtp-Source: AGHT+IGQOtCWxcizTXgrVFo4n+U3UJmE7USmLMCsyGi09knUS1pUdt+OcSuQZ9umOqmOBlQN2YlcjQ==
X-Received: by 2002:a05:6a20:4c9b:b0:1d9:3b81:cdd3 with SMTP id
 adf61e73a8af0-1d9a83ab2d9mr5780061637.1.1730015479652; 
 Sun, 27 Oct 2024 00:51:19 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:19 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/edid: convert drm_parse_hdmi_vsdb_video to use struct
 cea_db *
Date: Sun, 27 Oct 2024 13:21:04 +0530
Message-ID: <20241027075108.14273-2-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
References: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
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

Address the following
	FIXME: convert parsers to use struct cea_db
in the parser drm_parse_hdmi_vsdb_video

cea_db contains len and then data. Appropriately change the indices
when referring to individual elements (db[n] becomes data[n-1]).

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..e07e39c0caa0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6259,32 +6259,33 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
-					   const u8 *hdmi)
+					   const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	unsigned int dc_bpc = 0;
+	const u8 *hdmi = cea_db_data(db);
 
 	/* HDMI supports at least 8 bpc */
 	info->bpc = 8;
 
-	if (cea_db_payload_len(hdmi) < 6)
+	if (cea_db_payload_len(db) < 6)
 		return;
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
+	if (hdmi[5] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
 			    connector->base.id, connector->name);
 	}
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
+	if (hdmi[5] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
 			    connector->base.id, connector->name);
 	}
 
-	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
+	if (hdmi[5] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
@@ -6302,7 +6303,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	info->bpc = dc_bpc;
 
 	/* YCRCB444 is optional according to spec. */
-	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
+	if (hdmi[5] & DRM_EDID_HDMI_DC_Y444) {
 		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
 			    connector->base.id, connector->name);
@@ -6312,7 +6313,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * Spec says that if any deep color mode is supported at all,
 	 * then deep color 36 bit must be supported.
 	 */
-	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
+	if (!(hdmi[5] & DRM_EDID_HDMI_DC_36)) {
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
 			    connector->base.id, connector->name);
 	}
@@ -6320,19 +6321,20 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 
 /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
-drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
+drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	u8 len = cea_db_payload_len(db);
+	const u8 *data = cea_db_data(db);
 
 	info->is_hdmi = true;
 
-	info->source_physical_address = (db[4] << 8) | db[5];
+	info->source_physical_address = (data[3] << 8) | data[4];
 
 	if (len >= 6)
-		info->dvi_dual = db[6] & 1;
+		info->dvi_dual = data[5] & 1;
 	if (len >= 7)
-		info->max_tmds_clock = db[7] * 5000;
+		info->max_tmds_clock = data[6] * 5000;
 
 	/*
 	 * Try to infer whether the sink supports HDMI infoframes.
@@ -6340,7 +6342,7 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
 	 * supports infoframes if HDMI_Video_present is set.
 	 */
-	if (len >= 8 && db[8] & BIT(5))
+	if (len >= 8 && data[7] & BIT(5))
 		info->has_hdmi_infoframe = true;
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
@@ -6412,7 +6414,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		const u8 *data = (const u8 *)db;
 
 		if (cea_db_is_hdmi_vsdb(db))
-			drm_parse_hdmi_vsdb_video(connector, data);
+			drm_parse_hdmi_vsdb_video(connector, db);
 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
 			 cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_scds(connector, data);
-- 
2.47.0

