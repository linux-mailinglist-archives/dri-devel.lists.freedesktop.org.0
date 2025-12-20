Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBDCD397A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59310E267;
	Sun, 21 Dec 2025 01:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HI1sGIuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B85D10E229
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:46:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b7ffe26edc1so39394166b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 03:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766231216; x=1766836016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Kxr5ddmQKReA91nA03TLo36yhYjQYmk2iEDV4ATAeY=;
 b=HI1sGIuyqsiPE8hFaIbpD5EgnavpQMd2U8Dh1qqLYBOB4DH70pdVK1cWl+YYYNVEEr
 4+G7TM6JQBGklnUYUKxKzgty6RcZoNto+uRNoaI/+4gL8smNyPq5rp4lmLAcWjvQ2Yq1
 doG8gXr/dzImFYZQi6OiIGqE123Xj8jH1Q1CMfsAWcrqtCkQ4QtR4GS2yrOex9NrE7ei
 rAZC6s4oo6Cvtaj1KX0PaTaHPk0ZJz94jdtUHDy6gya5eCjLM62OduE+R87WnD9L8b6O
 T+HA+aZPcQ7mXj/+Q4qFGsK9wdan9NEQT6OgT+TWRUJumq/9itgLuwRl7hFx1qN8fd86
 7RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766231216; x=1766836016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Kxr5ddmQKReA91nA03TLo36yhYjQYmk2iEDV4ATAeY=;
 b=fRkr3ZsW1GXqh6h9vDGJ6HdcH1pu9Q5oQy5T195IhZygFeVOas5dC1okCMud4qpTAx
 EnRUZeZn0uwX1dyw5pXJROhLHyvhcM0mCa9eSML5sos3cRqw7WPirQI+2C64/VMBD6V8
 HUYzXHzL4VZvLy5JwU15k7koQmfHyETmeF7lCy7K8kJurElnqyuDNmBmOX2pMh3imZro
 QeGCJdKDvtuowEt9pCQvR4qf8hllhhiCScfX1AzKi0Qj6z5XUPfRgIue854+6bKmk0T5
 m6j9PfPiOQIlQ2cIukXgDzcuGHxqRGuViFcL6zJ0HN7GrcWuZGMsW5awjJQx1OaPInTD
 joqw==
X-Gm-Message-State: AOJu0YzlkHd+moTJ6XV7dlRtw2V3y+ErlSfZi+jyovJWjBZb9L9fzlpT
 sGfTAf3V0qPt22YJuaEuDICzwE00XLrhArcgCWMkzuGqA3kaQTSXdZW6
X-Gm-Gg: AY/fxX4H/mwhGbSgpvxM4Lp3JzCC4Pl3soSs8WndbUoJqk+oUULBg0+OOkUY0ZhjkYR
 4PAMrK4OXTRhPU6LdgEEu2J98avEaHV4cWa2yuuD1O+cl0fiw0lSA2PvYSCFRt3SfwbQkJobVsR
 +pHEu2YuWjhFbycYVR94OOZBev5S138TvFpjL+OYdwzAuqwMjMPpXLOl0wgJr0e9SwLKVjicR2q
 DSHWmKK2QWsIBSNt3mXbTSUxwu3yMTYt/NCBHmAhKO9CsrRBWj8+HsqgZh+peISS6Lqn8pMr9Y8
 L7i9DXXVx7nR8BupQ+bkuVhyE9e0yD1wJbnkIb/XdUjD/F0sb3BrueoTauo+Q1PUDDnV0O5Srxr
 b1CEeSCmsznKWLxOEaa+uuR3N3vgiLv2FoynIpYh/GThhzgrO1ZPv8qvrc+W3vP9Gc1N0prgidp
 3HR9JheroVtB6sTTzz9SNCsBVfxphsxOVMkWVmqlEQpa++u9juk3UrMfrbnS7JW9wN
X-Google-Smtp-Source: AGHT+IH7wWv7EZ4MK00T1q4GjZttTeK1d4HACQz7QEcs955FA/z0aehTGE03UMfQb5gCYn+K2q5kqw==
X-Received: by 2002:a17:907:2da7:b0:b71:a627:3d9a with SMTP id
 a640c23a62f3a-b803695c415mr322917966b.0.1766231215354; 
 Sat, 20 Dec 2025 03:46:55 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5bdb9sm495449066b.7.2025.12.20.03.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 03:46:55 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bernhard.berger@gmail.com
Subject: [PATCH 2/4] drm/edid: parse HDMI VRR information
Date: Sat, 20 Dec 2025 12:46:47 +0100
Message-ID: <20251220114649.169147-3-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
References: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Adds a struct to hold HDMI VRR information. `supported` here is an
additional property which allows easier parsing in consumers and adds a
bit of logic used by most driver to decide if VRR is worthwhile.

Additionally, edid-decode seems to throw errors if VRRmin is above 48 Hz
and VRRmax is below 100 Hz. I'm not sure if it's based on an actual HDMI
spec or, again, is showing "best practices".

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/drm_edid.c  | 19 +++++++++++++++++--
 include/drm/drm_connector.h | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bb6cee249749..981b3b28c94b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6149,6 +6149,19 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
+static void drm_parse_vrr_info(struct drm_connector *connector, const u8 *db)
+{
+	struct drm_hdmi_vrr_cap *vrr = &connector->display_info.hdmi.vrr_cap;
+
+	vrr->supported = false;
+	if (!(cea_db_payload_len(db) >= 10) || !db[9] || !db[10])
+		return;
+
+	vrr->min_hz = db[9] & DRM_EDID_VRR_MIN_MASK;
+	vrr->max_hz = (db[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2 | db[10];
+	vrr->supported = (vrr->min_hz > 0) && (vrr->max_hz - vrr->min_hz > 10);
+}
+
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 			       const u8 *hf_scds)
 {
@@ -6277,6 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	if (cea_db_payload_len(hf_scds) >= 8 && hf_scds[8])
 		hdmi->allm_supported = hf_scds[8] & DRM_EDID_ALLM;
 
+	drm_parse_vrr_info(connector, hf_scds);
 	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 		dsc_support = true;
@@ -6287,8 +6301,9 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		    connector->base.id, connector->name,
 		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
 	drm_dbg_kms(connector->dev,
-		"[CONNECTOR:%d:%s] ALLM support: %s\n",
-		connector->base.id, connector->name, str_yes_no(hdmi->allm_supported));
+		"[CONNECTOR:%d:%s] ALLM support: %s, VRR support: %s, VRR min Hz: %u, VRR max Hz: %u\n",
+		connector->base.id, connector->name, str_yes_no(hdmi->allm_supported),
+		str_yes_no(hdmi->vrr_cap.supported), hdmi->vrr_cap.min_hz, hdmi->vrr_cap.max_hz);
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ac84884a96a5..8663daccf1db 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -254,6 +254,23 @@ struct drm_scdc {
 	struct drm_scrambling scrambling;
 };
 
+/**
+ * struct drm_hdmi_vrr_cap - Information about VRR capabilities of a HDMI sink
+ *
+ * Describes the VRR support provided by HDMI 2.1 sink. The information is
+ * fetched fom additional HFVSDB blocks defined for HDMI 2.1.
+ */
+struct drm_hdmi_vrr_cap {
+	/** @supported: flag for vrr support by sink */
+	bool supported;
+
+	/** @min_hz : minimum supported variable refresh rate */
+	u16 min_hz;
+
+	/** @max_hz : maximum supported variable refresh rate */
+	u16 max_hz;
+};
+
 /**
  * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
  *
@@ -333,6 +350,9 @@ struct drm_hdmi_info {
 	/** @allm_supported: flag for auto low latency mode support by sink */
 	bool allm_supported;
 
+	/** @vrr_cap: VRR capabilities of the sink */
+	struct drm_hdmi_vrr_cap vrr_cap;
+
 	/** @dsc_cap: DSC capabilities of the sink */
 	struct drm_hdmi_dsc_cap dsc_cap;
 };
-- 
2.52.0

