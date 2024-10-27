Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BE9B1C60
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56A710E1A7;
	Sun, 27 Oct 2024 07:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rec5AdiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEF810E1A7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:24 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71e592d7f6eso2234801b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015484; x=1730620284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZG1M3TOUyG+goANQU6k5RDo7M15PqSr1tl6HcqlXoB0=;
 b=Rec5AdiSDJKQgCJGYEe78HHqwHnEPnkzXDHDIdNOqQnGg8spQjcoWr1e1cYRNvfnCC
 owuEoTcX/UiBwrvXCIitWgEass3YLmYGy1emfmeYO+nbsGw3Xi1KldGpaaf+PMBsDlPx
 DgqJdylzZ6puEbFJhLoKCwxOyOgLOrjCKu6Y1EPNfxVOU2nZptEylfFHqgHeHU8mTqur
 wFaIvkyUbFctf+IjzOxdq6d/YfFsQHzzfCrIV7LWJJNI35C3brxFMiNRePIbiaaFrLvv
 cWGaCQgCCwWUBUGnWQH5BjIKxq4ojaXgpPD4x/j0acdZIj1XWwjwyShWljmt4WtEnF90
 OgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015484; x=1730620284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZG1M3TOUyG+goANQU6k5RDo7M15PqSr1tl6HcqlXoB0=;
 b=OPNdreUfizKtbbhphtSDLkgwSNAqMH5Ob1og3SiJluuzMD0dZqsAqSqQb0UeRqbbgi
 V2gmW52RLncAluVn7ePdw1Y+aCbbexAIs3t///mvtvZLe6vGmG/5t5YJqZslKKXkqi5c
 ER7gYXuYEdELptIoWPNm4fWvCexWPxDBch1+XElCuZRkq8DxMOkRQSrPEabvB7e6bhEA
 WtSDaPuKytIUEM5E/z8S7IkDfAwbX/uOJtf0xLuv0NXQ6fbUkpJ41g+OvYOWrGtAozTu
 uwX2G+w3Cjo3GLUjWG9lq1Kch8tseJOnPtJR0lJ0RJF2zGwnpKuA1MIYrjX9rnrVOXM3
 tg8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1XecTMAGCYvuTmXECHJICMI0lLiVRKiGlPaafRyf3wFEmcajJgGM7IE3/XlxvX+RslwwmOavXu9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXB/w/lKyzVrDcm4mjpffBXuH/JmxNBSuacZ5eXartMfOHHu70
 6Enpr5oDGEU/8gOPOs3iYseyBMmEIIyykW7CP0LPo9U9YhHr7qeq
X-Google-Smtp-Source: AGHT+IHIMFVfUloVq/h0b+q0MYGiJAE0Rd6mTPhC9+G2coAhYQIVYiwDm9CC3QiVWcu7OqTvAjY4fA==
X-Received: by 2002:a05:6a00:c85:b0:71e:f4:dbc with SMTP id
 d2e1a72fcca58-7206309375fmr7351107b3a.25.1730015483426; 
 Sun, 27 Oct 2024 00:51:23 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:22 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] drm/edid: convert drm_parse_hdmi_forum_scds to use struct
 cea_db *
Date: Sun, 27 Oct 2024 13:21:05 +0530
Message-ID: <20241027075108.14273-3-vamsikrishna.brahmajosyula@gmail.com>
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
in the parser drm_parse_hdmi_forum_scds and related methods

cea_db contains len and then data. Appropriately change the indices
when referring to individual elements (db[n] becomes data[n-1]).

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 56 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e07e39c0caa0..f79d8fbdb62b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6112,45 +6112,48 @@ void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8 *max_rate_per_lane
 }
 
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
-					       const u8 *db)
+					       const struct cea_db *db)
 {
 	u8 dc_mask;
 	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
+	const u8 *data = cea_db_data(db);
 
-	dc_mask = db[7] & DRM_EDID_YCBCR420_DC_MASK;
+	dc_mask = data[6] & DRM_EDID_YCBCR420_DC_MASK;
 	hdmi->y420_dc_modes = dc_mask;
 }
 
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
-			       const u8 *hf_scds)
+			       const struct cea_db *db)
 {
-	hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
+	const u8 *hf_scds = cea_db_data(db);
+
+	hdmi_dsc->v_1p2 = hf_scds[10] & DRM_EDID_DSC_1P2;
 
 	if (!hdmi_dsc->v_1p2)
 		return;
 
-	hdmi_dsc->native_420 = hf_scds[11] & DRM_EDID_DSC_NATIVE_420;
-	hdmi_dsc->all_bpp = hf_scds[11] & DRM_EDID_DSC_ALL_BPP;
+	hdmi_dsc->native_420 = hf_scds[10] & DRM_EDID_DSC_NATIVE_420;
+	hdmi_dsc->all_bpp = hf_scds[10] & DRM_EDID_DSC_ALL_BPP;
 
-	if (hf_scds[11] & DRM_EDID_DSC_16BPC)
+	if (hf_scds[10] & DRM_EDID_DSC_16BPC)
 		hdmi_dsc->bpc_supported = 16;
-	else if (hf_scds[11] & DRM_EDID_DSC_12BPC)
+	else if (hf_scds[10] & DRM_EDID_DSC_12BPC)
 		hdmi_dsc->bpc_supported = 12;
-	else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
+	else if (hf_scds[10] & DRM_EDID_DSC_10BPC)
 		hdmi_dsc->bpc_supported = 10;
 	else
 		/* Supports min 8 BPC if DSC 1.2 is supported*/
 		hdmi_dsc->bpc_supported = 8;
 
-	if (cea_db_payload_len(hf_scds) >= 12 && hf_scds[12]) {
+	if (cea_db_payload_len(db) >= 12 && hf_scds[11]) {
 		u8 dsc_max_slices;
 		u8 dsc_max_frl_rate;
 
-		dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
+		dsc_max_frl_rate = (hf_scds[11] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
 				     &hdmi_dsc->max_frl_rate_per_lane);
 
-		dsc_max_slices = hf_scds[12] & DRM_EDID_DSC_MAX_SLICES;
+		dsc_max_slices = hf_scds[11] & DRM_EDID_DSC_MAX_SLICES;
 
 		switch (dsc_max_slices) {
 		case 1:
@@ -6188,26 +6191,27 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 		}
 	}
 
-	if (cea_db_payload_len(hf_scds) >= 13 && hf_scds[13])
-		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
+	if (cea_db_payload_len(db) >= 13 && hf_scds[12])
+		hdmi_dsc->total_chunk_kbytes = hf_scds[12] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
 }
 
 /* Sink Capability Data Structure */
 static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
-				      const u8 *hf_scds)
+				      const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &info->hdmi;
 	struct drm_hdmi_dsc_cap *hdmi_dsc = &hdmi->dsc_cap;
+	const u8 *hf_scds = cea_db_data(db);
 	int max_tmds_clock = 0;
 	u8 max_frl_rate = 0;
 	bool dsc_support = false;
 
 	info->has_hdmi_infoframe = true;
 
-	if (hf_scds[6] & 0x80) {
+	if (hf_scds[5] & 0x80) {
 		hdmi->scdc.supported = true;
-		if (hf_scds[6] & 0x40)
+		if (hf_scds[5] & 0x40)
 			hdmi->scdc.read_request = true;
 	}
 
@@ -6220,11 +6224,11 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	 * Lets check it out.
 	 */
 
-	if (hf_scds[5]) {
+	if (hf_scds[4]) {
 		struct drm_scdc *scdc = &hdmi->scdc;
 
 		/* max clock is 5000 KHz times block value */
-		max_tmds_clock = hf_scds[5] * 5000;
+		max_tmds_clock = hf_scds[4] * 5000;
 
 		if (max_tmds_clock > 340000) {
 			info->max_tmds_clock = max_tmds_clock;
@@ -6234,21 +6238,21 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 			scdc->scrambling.supported = true;
 
 			/* Few sinks support scrambling for clocks < 340M */
-			if ((hf_scds[6] & 0x8))
+			if ((hf_scds[5] & 0x8))
 				scdc->scrambling.low_rates = true;
 		}
 	}
 
-	if (hf_scds[7]) {
-		max_frl_rate = (hf_scds[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+	if (hf_scds[6]) {
+		max_frl_rate = (hf_scds[6] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
 		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
 				     &hdmi->max_frl_rate_per_lane);
 	}
 
-	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
+	drm_parse_ycbcr420_deep_color_info(connector, db);
 
-	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
-		drm_parse_dsc_info(hdmi_dsc, hf_scds);
+	if (cea_db_payload_len(db) >= 11 && hf_scds[10]) {
+		drm_parse_dsc_info(hdmi_dsc, db);
 		dsc_support = true;
 	}
 
@@ -6417,7 +6421,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_hdmi_vsdb_video(connector, db);
 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
 			 cea_db_is_hdmi_forum_scdb(db))
-			drm_parse_hdmi_forum_scds(connector, data);
+			drm_parse_hdmi_forum_scds(connector, db);
 		else if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, data);
 		else if (cea_db_is_y420cmdb(db))
-- 
2.47.0

