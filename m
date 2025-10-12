Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FDBD0B1B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63010E1B8;
	Sun, 12 Oct 2025 19:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHeCLzPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E310E1B3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:57 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo663961766b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297036; x=1760901836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
 b=iHeCLzPa32o5HeIUY4whLanuUfs36Xq02lUR6HIXvViW/tK6DUWPD5j8CUTDIgr4QI
 CemH9YFufNHb2QKOichDy2TDqcntttZONTmLQHkW0jBBL/aWdaLdDDXV7CjJyqEvx4uF
 a5PK4AhDB1VJ32Po0akYXLVTj/Uzjfr9w0hlWRoNjDN5hTWLV8xIAK0L9rXLZrS6zAcj
 F+husIBgkBItDiIQPcgA+wYi6HrgWPVyOfZN211oRE5J/S4jqcjQsKAkICqzswB54bfv
 WgUZVAOGBMfOm7fxgwUpbG2VH3GiWR7gmgt+LG9h0rCLZFjdjKJZo4/+Ub226U0JECKq
 zpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297036; x=1760901836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
 b=dGYw+0xipAH3OPaj9mOPvIJIKSD9YT4GLJ19DKkvZsgmcOi6q2uy9CBmhDwo2d3RPQ
 xueVJNuVh55vAjWmHNYpaGo4jjAIq0X4FwIGvbUxaCIc5afYOyChrovEKbkwWGxVKvjY
 euqjtzcIMJnzDRhi4EkuWOcsVN4QvhztPJA6bPNBmPBITyKcd+VALgwI2FmL1XpZNXUg
 T0VWC5fmkWjeudy7KRCCJhwAbFuxTj/4K2USJZezMidq++upje34GvAhulPKlggtABOq
 MBmKFBdXaMXBbYMQdEugX0uYc5Ts614ou5ez3TgkJd5Yw9DnX+tAQX/DTb65ixx05+cK
 9GNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaCRJ2+Bjx9WXw+hMY0GwrXOD7ibNJGHroq7ucz8NEOP+xicfwgFGVC6d9jWjco6jwhyjb6O5uawk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaNku9AO5o1gGfiqkIdSGJ+NHIbxDWRuVGO+7QTDq8OFaWjIYF
 kQQNh/skFBfLzUZGldybRK232qeFc7zmqHABu5hqOvUc8+XdgfM/t5Tn
X-Gm-Gg: ASbGncv9AaOMCWIK1LdX8hi+3+0AxEFRNc+bMdXFHb+asKdKcFdvWV5HNYsC66pTLuq
 J0ive2XO6b4ZgxNCPaCmR5IJgZ6O5mG5mpGgQA0u8bQ8qA2njl3BVtln6+ts1AAvJR/7OCYQjhK
 9sl0sbiEkq7q8qAVma1W3TJXK51ZeEudDx0vD1OcgGH+i09E+kwWP3He72rbGu9B+dJGQkoxVTj
 ySUs/PshXNvV1JsXFWTeVaFu5qB11nzeQhY/odODEXG+8AEGYLDehzc/+ul/ErnZdPj5JYQccn4
 8sAXnYEUI4eZYXygS4PQbZhvp4IYggGdI7o8PnPi78y0vsybNVSd6+RiHea57xUaADFC7w9lEXQ
 Ln1vB3w9baTCvJ2xa9huKH9r7CBVIWUCuBMTWyfZD1Gwi7Fep7n5fQbIYVkL/u7PJ9hCYN0AMse
 FoPa7GmAAQyzYMsf01Cya3Eej99sxaey8=
X-Google-Smtp-Source: AGHT+IEo0mmA5QLs7FFLs9zM7BuOIhHX0fkAtfXbVZQzrSvZ8WwfBQOC4GT4ec3HCn2JTDhgwgWT7g==
X-Received: by 2002:a17:906:f589:b0:b41:abc9:6154 with SMTP id
 a640c23a62f3a-b50abaa45a1mr2062111266b.30.1760297035817; 
 Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination to
 mixer
Date: Sun, 12 Oct 2025 21:23:13 +0200
Message-ID: <20251012192330.6903-14-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

Plane type determination logic inside layer init functions doesn't allow
index register to be repurposed to plane sequence, which it almost is.

So move out the logic to mixer, which allows furter rework for DE33
support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 +
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 1fca05a760b8..e7a66d9b622a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,6 +315,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	enum drm_plane_type type;
 	int i;
 
 	planes = devm_kcalloc(drm->dev,
@@ -326,7 +327,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->vi_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, i);
+		if (i == 0 && !mixer->cfg->ui_num)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -339,7 +345,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, i);
+		if (i == 0)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9d5d5e0b7e63..8d74eddaa294 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -267,9 +267,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
@@ -284,9 +284,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->channel = channel;
 	layer->overlay = 0;
 
-	if (index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_ui_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 83892f6ff211..7745aec32d76 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -51,5 +51,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cf83f7ce6c78..1192b17726d1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -412,9 +412,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_layer *layer;
@@ -438,9 +438,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
 	}
 
-	if (!mixer->cfg->ui_num && index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 655440cdc78f..fc22b9a6bd8d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -56,5 +56,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.0

