Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F2C328AC
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956110E650;
	Tue,  4 Nov 2025 18:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="azEhmrSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D886810E651
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47755a7652eso8491905e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279821; x=1762884621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
 b=azEhmrSSVF4FbmT52G3HTmXvbNKYBmeCXPgEBWFqgI//RN5W/JS5gySI3KiwUN128B
 i6hhbInk7y1cahbM1bIOaAnN0fXRvufBrdyd5AqMMY7EYYVROeYCXKK8SWhX3zBMkg+I
 YIBYDwkKQBol8Sr5fajXSg0RHZ7rnQFLyCx6kvZ6sS8pUjWcZUy5uMGZ/Vsq/wK5Wmlj
 ClRwTztrO3+fXbQG5LxOj3akMD2e7MU6MZDf2D3CPGuAFbJVzrS67cWh5JOaCY6v+AQp
 olre8gLlfomR5drnCQ0+XpasvmpVYsYwPci5YEwf0ysAZqsYC/ZhSyTakp518uW9dKIM
 k3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279821; x=1762884621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=clITce3FS5MOzvHgr4+g3DvGcjeJNYVgPXmRoIAMUA4=;
 b=G62P4qR3Ktd8BIwGJjSD/nSRQ/VG6MzyLupYX05+ncx6+34BEjEcJ12nI3sus3F6J9
 YxFYc6nqCHwI0scMEF3vLtDnuErtpmdi7gto9vEtIBGDlCGIJhKKi/ry+EFt6iW42YzC
 6fAr1WDHSzMig/7Uvrkuk0IFTX7s2AR5wzwDWrFX0diQLQqbdJakQLNgXxqxr8+V/eg7
 QnMbLi9O3/trzdOSgbRAlyF9A49LNA7+qDVhqz/PTw/DaodHfJEodOGKxVoUGv4Xqfj1
 sCRm/6nWDiB/US7WdZvPaL3KnjigAM7IuQsFUQ3kUQDwHSOAO5v4azW9IpHpfIJiQGpC
 r4+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnvDWnoaNSp1e1YyIZTjnbPHd8G1f5e9C7KAW56DUhrsuAxchElWhjsbZCZwk5KSovxxWFLcDvS2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLS4GOts9cw2fqkTVFKgXzo8A1l+2CytEHq3hmPMLPmKO0YsCT
 Uwrw9TevAEOzkfGGZpdfUPh6DyCecdadErMYS2TO6FJLmiw9yX/2y/1H
X-Gm-Gg: ASbGnctjBoNdfapBP7FPFqrhrCEpeCuWWuB3PHTgq6Q61QrLAj/hbWFKVUi5ndis5IC
 /DOTPbmNU4tFSB0KWnVnNcgRqPfJoX3hEDqstuCq2fbHPcOkVY7gxOsRndkh1sU81GOBiICzdLI
 pL1ODm1As6lTrj8Svwv6VH2isO9JjQvHCOIcHAtM/6XiBu14NMu3+d34azq+rjbDVHFUiJHUPwR
 dpjl8lJrlgnTEFSc6zpxce3dxFDmzgcaaUd8R61jI5pARnaqbshitHwt1bO54FLcsWwCl6t4Eqe
 1WTB/kGWOr+txB+Ey5tcdCk3kE4FaG3gl7J9lKUKLt87kxuPo0gu50GuCVJErsB4GtNjiKPZy3p
 trysBTd9lChCFpq6xBb96D+wglE7Vd4PeNXn8XS4f+IGBxmAgGWT8D2IPV3g48w7TVmWzU1s19a
 JaPtGZfPEfFr722xiSDw==
X-Google-Smtp-Source: AGHT+IEpdaIz/ZPa95URReRW4HZDMqPLVxE4VqmgVrqWeDCwzW1Bh5UB6FP8v4QdEMy5HSG3J/kMpg==
X-Received: by 2002:a05:600c:1994:b0:475:dd59:d8d8 with SMTP id
 5b1f17b1804b1-4775ce9ba5cmr1916885e9.8.1762279821052; 
 Tue, 04 Nov 2025 10:10:21 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 15/30] drm/sun4i: layer: move num of planes calc out of
 layer code
Date: Tue,  4 Nov 2025 19:09:27 +0100
Message-ID: <20251104180942.61538-16-jernej.skrabec@gmail.com>
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

With DE33, number of planes no longer depends on mixer because layers
are shared between all mixers.

Get this value via parameter, so DE specific code can fill in proper
value.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  6 ++----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  7 +++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  3 ++-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 17c0ab5860b5..18dd998364ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,12 +315,11 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
 	int i;
 
-	planes = devm_kcalloc(drm->dev,
-			      mixer->cfg->vi_num + mixer->cfg->ui_num + 1,
-			      sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
@@ -332,7 +331,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -351,7 +350,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index,
+						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4f6c8b0acba6..8f6fcdfcf52a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -268,10 +268,10 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
-	unsigned int plane_cnt;
 	int ret;
 
 	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
@@ -294,8 +294,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	ret = drm_plane_create_alpha_property(&layer->plane);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add alpha property\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 7745aec32d76..0613b34d36e0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -52,5 +52,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1192b17726d1..805db4ea714b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -413,10 +413,11 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
-	unsigned int plane_cnt, format_count;
+	unsigned int format_count;
 	struct sun8i_layer *layer;
 	const u32 *formats;
 	int ret;
@@ -449,8 +450,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index fc22b9a6bd8d..a568e1db1e19 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -57,5 +57,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2

