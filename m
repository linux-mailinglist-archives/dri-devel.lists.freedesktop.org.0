Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3EC32897
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34D10E652;
	Tue,  4 Nov 2025 18:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYzWkV5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D391F10E655
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so789525e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279818; x=1762884618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
 b=EYzWkV5y1PhSs/m3XMOC7PvBPtjDhK4ekBfb5R/rd5w7LcCDxaMf/yDHjUoHIoQhon
 jSNAYXtjLr1TKSJ/vowmnWrBJ4ibYGj9OWHj4uQ7z+MSvy0/uQUwRIPkn9ksLLnP4tf5
 ggKPaD0uNI2B0IyZf3wm9AEGYr7p+JKTbYkatZTDzScJS/7MD7f059swaev6SX5h9TJk
 ETsI/huZWFDcgksnDmfpvsqZ9zN+Q4vRBrEjzIVA8KgrKZKcod/WB+NoR3HG18c2MZco
 Lm+2Ro+okHpbDghluEKoT8tsXa6s9WXO1Hx3AUpmRw1BKBon/uvm9KPjgNs8va3HJNU/
 Kn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279818; x=1762884618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
 b=EkOwH/+CdDWEB3TZP3NiT0hinriz7eutB9SSDxMewJ2P7t2IQc2ESl6Deg/ztcUPPg
 PjQxOrJwMSAr6NnPdlvmkijrRBh6D7hKtxqL8Gqlqmoc1PEZ5USFiVIDkQ86erH+jC0E
 KH49llDQwqE8P71z5ijeHWS5wYJPpaT6ryLueN7C0YEB6qyazrS7lTGuIZZC/WHOmCGK
 bkb1hKEkYumsYSK0ZH7nNg9XOTl68K3DqTOtHr5LhwgX+Olf/qiXVgy168Ia/QOIrP0z
 /7Goh5ogcJTd9is31O1rRoIBZWL8edTfDa6/BWg602JLfOyb2cRKOrizg0WT1l+fGpdF
 tvEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW5Yp9tQiRojDK1GF7hAkBe7aiWUZOU/4yeczby92GrQyzbhPJqT4FzDHA4j3+9h2ZsjA9aMGC//s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFVgGxZtwRuPCqGo7Es6bfTMwegFoGgHPsGWA5BOhw4RdxjFIz
 ughkIcfQTQ5Tktv5k9S7iovBT+htxGDCVbn0+XhPAyzXP7flqvnFqa5z
X-Gm-Gg: ASbGncv230ed1X2E6cSjpABLgR/2YrsHq8r5eOKBQUbPHfdbHNvKXbMTTmIDbPfLoX2
 h+y9HNbDp0PN9sKhNkrtyZhTUrptfzZB4RtozLuAS5LuX9ke+WqloucNNhkgoI7YXa9151uPpnx
 4ycql+OUYZNswSjjA4JxnJYC9PdxEGfDeN+AGXNT9e05OFiDz0yuth64u+Y6f983Dz7K7nHdGcC
 l/pd48tRhjXEuBEUPns9RpYqglmcwecQen5ngIx/IMPNbz6fw4/tzHeo0yEO4Ksvoz7NW7yjwj4
 fB3FEP073oVt97Z603+EdWo7+okpjstycqo+gB1cQcX07V+aSKUOqrh0Ldn4fb3855kClNKm8QB
 JBNeWEP9M1odDrjl0AOj4xN9tSmH6eRvlebThgvjGYHJ4Q8xxChSB4anWXRK1ndJZKtKt1hCdJX
 nBMiOQPKV2+Xsw7KEMgA==
X-Google-Smtp-Source: AGHT+IE6+wQNQgsRWOAqTzJlZBlSMUgDJYtvMonE1RZ+OJOG9YLIca0WKWGS8Pz1WvOiR/sQSuop1A==
X-Received: by 2002:a05:600c:6dd3:b0:475:d278:1ab8 with SMTP id
 5b1f17b1804b1-47754c1c553mr27491185e9.2.1762279818149; 
 Tue, 04 Nov 2025 10:10:18 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:17 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 13/30] drm/sun4i: de2/de3: Move plane type determination to
 mixer
Date: Tue,  4 Nov 2025 19:09:25 +0100
Message-ID: <20251104180942.61538-14-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

So move out the logic to mixer, which allows further rework for DE33
support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

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
2.51.2

