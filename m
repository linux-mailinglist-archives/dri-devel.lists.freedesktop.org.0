Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28B9B1C64
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DE610E23E;
	Sun, 27 Oct 2024 07:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fuIXm/3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877A10E23E
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:35 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71ea2643545so2683410b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015495; x=1730620295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOn93d9tLichC+5tHiWOkakuU/3lAA1dF93RrhXoO/E=;
 b=fuIXm/3vl4qzUw0wL76tytZledvi5/STniodkyayLib5b94Mc0S1Cl0XBkNfipxRuC
 bleYAktajGHDDbf03zcXqSHu6g9gKjn7qWr8EECZzIn2kPRMaUHc+2X8x6TOk67MiyV7
 VMsvq0VqlJgylCNv8pTn5Q+wMgBKwlDPLPMOWduEdO4EXTMbNKvJ62cU4OsY4g6QcNxb
 stFGhjO+2a8WgRvWFvvEm2QEy0YO2SzuRJRLG1HQb0sZxU0gyNv/zwKzS2sQwpESbhM9
 RkyGyMqw4odBLLCxlX9dLmmCPUbIMGNOoSNXTTszDSUMYOYW7PIwhZos8CpbKNAd55Ax
 nYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015495; x=1730620295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOn93d9tLichC+5tHiWOkakuU/3lAA1dF93RrhXoO/E=;
 b=VcY/qLi2uxz6pH6lf8OFAIFYBrgCdw+IFXFKvg0w7k+bfP2zJW7QVqNVT0pTdDCoFU
 JFPFNJAXZLvlvc16yl8H4dUI0IJvlheyBiaXM/0lkMQPi9VgnfCE7uQu8nBFkkssyZZZ
 Qpt4nHfYNHOkQR1vObgBriHrVLx1nFRXDO1c+uUH3x1DztKD6P6fjAfwjwVA1lViBizi
 mj+IPQMvkAYXi9GdMzVMVY8x9pKUZJARa3GvOrsZNL/UsqW0u7d43lklfv0Hh0qWmjD6
 +0vdg2LB9Ftq9b4Sv2DBpn59WpIqosKX4B8yCiddJTxeG4VU5X0qseOHvVxty4kmyvmL
 qIFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vygVnp7HIInqLAlXe8XIgCpWp/sMItzRqVvAwtB7sng2bQPxkGtTEIpt+UGFrsY0bImC7Kahekk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXpFN6dWzN6o5MjadcgJrqhyO5n8AXEDJfCHj9qJGiqnXe0YGC
 3qe/EY7iMnU6wWXSQu6xmAP5z1AWnStn+2zxsLVFwE0NQFWqjDWZ
X-Google-Smtp-Source: AGHT+IHuwf5v8s7V3KbWx323aO0dVtPL/Va9rCXnkmlyIBRqfcRtNaZ7kC0WQpGCrrX/ks4HwY371A==
X-Received: by 2002:a05:6a00:b55:b0:71e:744a:3fbd with SMTP id
 d2e1a72fcca58-7206306df29mr7284417b3a.20.1730015494847; 
 Sun, 27 Oct 2024 00:51:34 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:34 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/edid: convert drm_parse_hdr_metadata_block to use
 struct cea_db *
Date: Sun, 27 Oct 2024 13:21:08 +0530
Message-ID: <20241027075108.14273-6-vamsikrishna.brahmajosyula@gmail.com>
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
in the parser drm_parse_hdr_metadata_block

cea_db contains len and then data. Appropriately change the indices
when referring to individual elements (db[n] becomes data[n-1]).

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d9fa994a3acc..8b2b75885027 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5418,7 +5418,7 @@ static void drm_calculate_luminance_range(struct drm_connector *connector)
 
 static uint8_t eotf_supported(const u8 *edid_ext)
 {
-	return edid_ext[2] &
+	return edid_ext[1] &
 		(BIT(HDMI_EOTF_TRADITIONAL_GAMMA_SDR) |
 		 BIT(HDMI_EOTF_TRADITIONAL_GAMMA_HDR) |
 		 BIT(HDMI_EOTF_SMPTE_ST2084) |
@@ -5427,28 +5427,29 @@ static uint8_t eotf_supported(const u8 *edid_ext)
 
 static uint8_t hdr_metadata_type(const u8 *edid_ext)
 {
-	return edid_ext[3] &
+	return edid_ext[2] &
 		BIT(HDMI_STATIC_METADATA_TYPE1);
 }
 
 static void
-drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
+drm_parse_hdr_metadata_block(struct drm_connector *connector, const struct cea_db *db)
 {
 	u16 len;
 
 	len = cea_db_payload_len(db);
+	const u8 *data = cea_db_data(db);
 
 	connector->hdr_sink_metadata.hdmi_type1.eotf =
-						eotf_supported(db);
+						eotf_supported(data);
 	connector->hdr_sink_metadata.hdmi_type1.metadata_type =
-						hdr_metadata_type(db);
+						hdr_metadata_type(data);
 
 	if (len >= 4)
-		connector->hdr_sink_metadata.hdmi_type1.max_cll = db[4];
+		connector->hdr_sink_metadata.hdmi_type1.max_cll = data[3];
 	if (len >= 5)
-		connector->hdr_sink_metadata.hdmi_type1.max_fall = db[5];
+		connector->hdr_sink_metadata.hdmi_type1.max_fall = data[4];
 	if (len >= 6) {
-		connector->hdr_sink_metadata.hdmi_type1.min_cll = db[6];
+		connector->hdr_sink_metadata.hdmi_type1.min_cll = data[5];
 
 		/* Calculate only when all values are available */
 		drm_calculate_luminance_range(connector);
@@ -6416,9 +6417,6 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
-		/* FIXME: convert parsers to use struct cea_db */
-		const u8 *data = (const u8 *)db;
-
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, db);
 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
@@ -6433,7 +6431,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 		else if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, db);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
-			drm_parse_hdr_metadata_block(connector, data);
+			drm_parse_hdr_metadata_block(connector, db);
 		else if (cea_db_tag(db) == CTA_DB_VIDEO)
 			parse_cta_vdb(connector, db);
 		else if (cea_db_tag(db) == CTA_DB_AUDIO)
-- 
2.47.0

