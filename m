Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79811D1B740
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2130910E381;
	Tue, 13 Jan 2026 21:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VS7SFDzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9132410E381
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:41:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-64d00702990so1050352a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768340468; x=1768945268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnOk7xTeKASHRNhT1/DjMa9A/4WgBFppfopFsMljQZA=;
 b=VS7SFDzv6AcHSxJRdAEBpMC/ZBS/xBIZ6Nj992KG5tZI9PaSRoc63Wq5DScN4ElBxI
 fXsnRLjGX1zgOTxO8rkcv2LuQgytgnyoeZ5UQTEkCXYYMw73TYoeotqwjg5bDhekEAkZ
 y2cQXcyZrmKvZNIQnMJjU7hc7tEY1HRzq1oGT2gPfbh7Lx9vhciSciidXaDYBB6b3g+X
 +YsMJ0fmL7KNS+iWWPoC154rY6zXpBz0LWn192K35mkV5FQbdS0fPOCQts9kAelefIlW
 zZfJvXrFdpPDXkZ8qUtgbmUp6YkPMDF4z4dA/Gto+CW3jEtHqPCo/XiCrhTbHfSnZxVP
 gDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768340468; x=1768945268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jnOk7xTeKASHRNhT1/DjMa9A/4WgBFppfopFsMljQZA=;
 b=DnaNM2J4RWuCuaADnOLYm27AMwOouZ7S8/hRj6Z6+TXy8tbWzLTmNxexeSyj/HH3H0
 H9tbY5ppLEFlCisnEJO4tVKz+5H/g0eV1fF3Hi9S6+FnrWwXOgj1CigkSy6Z3Nh5Kxen
 8EUFuLJpY06qNkS6xsUVKLJsVIobH8K4XrOoFj4hjypfAjdueJIf8fFblqwgYTc2SkSU
 r/VwtQcmWQEl0we7NUJrDWIH7RDTPO5EyZmLX4PRyZYE1S7NXCitO0JOfbO7si6PMQ5M
 UkmXa2qf2TTYFKkz4bUQTV1+s3/SIdeRn/hLEWBq8+2Sa9zbkXp67GUUbOBD2jrQYNzd
 Noew==
X-Gm-Message-State: AOJu0Ywiommtu0NzM3oeI2fR4nhS0Y217hR6rmGiiZVke6JFefOUyp3I
 ZbFX+3+mEWzrvvi9uJBJO0XO1mNID0cU7KtHnJnacbjhIRuvB/EjYRaW
X-Gm-Gg: AY/fxX4eXaplARyv+VC+846Dds+dko1OSbrk1Inm9IAwkuIgxUgq6Ll7iYWcE5T07zP
 cIeqrQwsFxLBs+KWv0yQhQYX3whBoN3m7/13h2zEf/n7i+2GmLzZFG93SWF3rYDZDYho861W4Ll
 t3OpZqfBXnsIq/22+GFqxmd384xIbu85fYvFwTMqd1slHKClfNmU4gNo/4xmV6FG3Q/588ZdboF
 Belt2EbFnVBHNcafyL9WkDUYNJpHsrpMucJdNdIR+8eXBrX3Nvq04w7wjpVRgioSiCHTv5zs65J
 9ErynuPrqS+AzVtLwMtGuMOk2GUFAW7QJAE5GhrCf/vZCvJtmGHomY4FjmreVT8WwBGM00GiynQ
 L8HxhLsRwmDE8T/zqSMemPofs3YRkGss3fJZ7Inyzj/sRSqcLPJtKNqy/soBybloxj/q3b/WlPe
 m6QnV2OBGNQfvqdQP3u5g8nDdHNvsTtzQTv02Zws43Jpu6Tc9GVa1ySdyIjI9vQaP/
X-Received: by 2002:a05:6402:35ca:b0:64d:2889:cf4e with SMTP id
 4fb4d7f45d1cf-653ec47d79emr190526a12.7.1768340467986; 
 Tue, 13 Jan 2026 13:41:07 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5e0sm20858052a12.31.2026.01.13.13.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:41:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/edid: parse more info from HDMI Forum vsdb
Date: Tue, 13 Jan 2026 22:41:02 +0100
Message-ID: <20260113214104.146856-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Adds flags and a struct to hold HDMI VRR information. `supported` here
is an additional property which allows easier parsing in consumers and
adds a bit of logic used to detect malformed VRRmin/VRRmax values.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 drivers/gpu/drm/drm_edid.c  | 41 +++++++++++++++++++++++++++++++-
 include/drm/drm_connector.h | 47 +++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..1e066d614da7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6149,6 +6149,33 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 	hdmi->y420_dc_modes = dc_mask;
 }
 
+static void drm_parse_vrr_info(struct drm_hdmi_info *hdmi, const u8 *db)
+{
+	struct drm_hdmi_vrr_cap *vrr = &hdmi->vrr_cap;
+
+	if (cea_db_payload_len(db) < 8)
+		return;
+
+	hdmi->fapa_start_location = db[8] & DRM_EDID_FAPA_START_LOCATION;
+	hdmi->allm = db[8] & DRM_EDID_ALLM;
+	hdmi->fva = db[8] & DRM_EDID_FVA;
+	vrr->cnmvrr = db[8] & DRM_EDID_CNMVRR;
+	vrr->cinema_vrr = db[8] & DRM_EDID_CINEMA_VRR;
+	vrr->mdelta = db[8] & DRM_EDID_MDELTA;
+
+	if (cea_db_payload_len(db) < 9)
+		return;
+
+	vrr->vrr_min = db[9] & DRM_EDID_VRR_MIN_MASK;
+	vrr->supported = (vrr->vrr_min >= 1 && vrr->vrr_min <= 48);
+
+	if (cea_db_payload_len(db) < 10)
+		return;
+
+	vrr->vrr_max = (db[9] & DRM_EDID_VRR_MAX_UPPER_MASK) << 2 | db[10];
+	vrr->supported &= (vrr->vrr_max == 0 || vrr->vrr_max >= 100);
+}
+
 static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 			       const u8 *hf_scds)
 {
@@ -6274,7 +6301,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 	}
 
 	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
-
+	drm_parse_vrr_info(&connector->display_info.hdmi, hf_scds);
 	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
 		drm_parse_dsc_info(hdmi_dsc, hf_scds);
 		dsc_support = true;
@@ -6284,6 +6311,18 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		    "[CONNECTOR:%d:%s] HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
 		    connector->base.id, connector->name,
 		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] FAPA in blanking: %s, ALLM support: %s, Fast Vactive support: %s\n",
+		    connector->base.id, connector->name, str_yes_no(hdmi->fapa_start_location),
+		    str_yes_no(hdmi->allm), str_yes_no(hdmi->fva));
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] Negative M VRR support: %s, CinemaVRR support: %s, Mdelta: %d\n",
+		    connector->base.id, connector->name, str_yes_no(hdmi->vrr_cap.cnmvrr),
+		    str_yes_no(hdmi->vrr_cap.cinema_vrr), hdmi->vrr_cap.mdelta);
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] VRRmin: %u, VRRmax: %u, VRR supported: %s\n",
+		    connector->base.id, connector->name, hdmi->vrr_cap.vrr_min,
+		    hdmi->vrr_cap.vrr_max, str_yes_no(hdmi->vrr_cap.supported));
 }
 
 static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..296f26551206 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -254,6 +254,41 @@ struct drm_scdc {
 	struct drm_scrambling scrambling;
 };
 
+/**
+ * struct drm_hdmi_vrr_cap - Information about VRR capabilities of a HDMI sink
+ *
+ * Describes the VRR support provided by HDMI 2.1 sink. The information is
+ * fetched fom additional HFVSDB blocks defined for HDMI 2.1.
+ */
+struct drm_hdmi_vrr_cap {
+	/** @mcnmvrr: flag for Negative M VRR support by sink */
+	bool cnmvrr;
+
+	/** @mcinema_vrr: flag for Cinema VRR support by sink */
+	bool cinema_vrr;
+
+	/** @mdelta: flag for limited frame-to-frame compensation support */
+	bool mdelta;
+
+	/**
+	 * @vrr_min : minimum supported variable refresh rate in Hz.
+	 * Valid values only inide 1 - 48 range
+	 */
+	u16 vrr_min;
+
+	/**
+	 * @vrr_max : maximum supported variable refresh rate in Hz (optional).
+	 * Valid values are either 0 (max based on video mode) or >= 100
+	 */
+	u16 vrr_max;
+
+	/**
+	 * @supported: flag for vrr support based on checking for VRRmin and
+	 * VRRmax values having correct values.
+	 */
+	bool supported;
+};
+
 /**
  * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
  *
@@ -330,6 +365,18 @@ struct drm_hdmi_info {
 	/** @max_lanes: supported by sink */
 	u8 max_lanes;
 
+	/** @fapa_start_location: flag for the FAPA in blanking support */
+	bool fapa_start_location;
+
+	/** @allm: flag for Auto Low Latency Mode support by sink */
+	bool allm;
+
+	/** @fva: flag for Fast Vactive support by sink */
+	bool fva;
+
+	/** @vrr_cap: VRR capabilities of the sink */
+	struct drm_hdmi_vrr_cap vrr_cap;
+
 	/** @dsc_cap: DSC capabilities of the sink */
 	struct drm_hdmi_dsc_cap dsc_cap;
 };
-- 
2.52.0

