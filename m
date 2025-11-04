Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5CC328C6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5510E659;
	Tue,  4 Nov 2025 18:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WIsxzpBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B09810E659
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso2777981f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279830; x=1762884630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
 b=WIsxzpBI+dotH3dRUxejYmVLxTmQ4WQPLXhMISxJ5xplXT2dksrxfBXrinPHHuZ6h/
 dJy5mBPUUZUiaahHUGC8RCShAuYGnm37dQPY9xdlXT120bxDH5W1uN4daxainVEzjSfW
 0+bb/pdduC6SrOEeevGneA3LkGXlznfYIy4WpUFd7RTr2SD4gkOpjXF7UJEjPMN/Yw2V
 lfrqlQOjAHaddsIxZg7qZ53H8N3KGIV77LCliAXcIrgoCVKd7BzhcUk2pwsjtvRr2OMy
 44q/bdHSkV8/xGeyym0+M1Hps/AdzLd5ljtZtzR2pFyW/Cpa4DLfLqXRrkXOg+PSxS3b
 pRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279830; x=1762884630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
 b=f5Sl3F0Lpm02TwA6OA4rsAuODQgvZG++I1bt8Uk8vdXgUppaeb2Mr+uvmMEwMMk1ln
 n7TiWk2vHwSSWn6cSvIzWEh4OQJE2jdQzukB6yiu9Fn/nUSIPbh1lT8gQYp+lAA2YwFU
 oeDDj7R+kH2E+p1GTrCD5X7Lpegt1DbXnkGvSLkQyMx6TZ+HPB8+Xf+fjWbzo9tNyop0
 LZrW3zdNLUHYSFKVfMRrc7hY4IwyS4fMXo4MGhZfYlcET/jZ4an/fi6cyNHBAokQIq1k
 85iRa9PjqjK9JGUo695LdK9KeMOKl1RBy57NRsbfy3JcIEtRjpk2DniJ+5WigLov575l
 dUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyopTA1EqJ8Zht8zQCrxqcx3yP4aHP+9a7QH1bnIAcFc6KdtRv+E/MkorHtFcSuLd5eB/1eQH8+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyVMO2utsXtb3oiLBz9PUdRh1hUYAv9c8Fm2ilndKTUVQOc9Xm
 94wqwumyO8kiaIdM6lrfL6BuLuhpJjgzYP1VTdAS6JDJR9ZarS/iiao9
X-Gm-Gg: ASbGncv9h99AFL+vbyoYautnkQdxx7GYtLgFbWnmdL3pgL7bd2SMh3reb620z95k4Lx
 gp8AH3PehFtW+qiiYrlUi5LDuFPYnoqAEvRkbPEM54DsLvHymdJb6jmmW62JHw1YNCvz5Ysfxha
 qTn4jh98++MnxeUcKLqPYEseju/WpUGDorKcgyYTo4tMoATKt7gdGtM9ouHy5NJXD+rCGO9y95r
 0Sk7Cd2E4DX0fZrJZBijsn3T4ikv18xyVaSntLRTFo0tGmhdLrZsF0Qwn//f9jfEultCEMf0OiT
 BIoi2WYxswMR/QZpQPXnFyBCgodJh9lRAxSuVrS4+odfTLpYUtR41b25i4zRiQSl+QGjMAX/nYk
 e64/BnEUqgZVbxIzl+i++l1oo8laBDvn+0kuH0Cypep9o0sg09276UUcUUmNu3WNNA/8VD83nxU
 RGTGgWbd3uX6GOAFLsGA==
X-Google-Smtp-Source: AGHT+IE8pg2fqunzszYJMCpOfAsCZLtKqT6X6xX+b+FBqXNTS7M6/iDgmxVd2/hVTJsg7USbpjI7+w==
X-Received: by 2002:a05:600c:5403:b0:477:54cd:201c with SMTP id
 5b1f17b1804b1-4775cd9c25amr2654245e9.6.1762279829609; 
 Tue, 04 Nov 2025 10:10:29 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 22/30] drm/sun4i: layers: add physical index arg
Date: Tue,  4 Nov 2025 19:09:34 +0100
Message-ID: <20251104180942.61538-23-jernej.skrabec@gmail.com>
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

This avoids plane mapping in layers code, which allows future
refactoring, when layer code will move away from accessing mixer
structure.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 +++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  2 +-
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index d2b7fc552a76..267a6f75feb2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,14 +283,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		h = drm_rect_height(&plane_state->dst);
 
 		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
-				 plane->base.id, layer->channel, layer->overlay,
+				 plane->base.id, layer->index, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
 		if (!enable)
 			continue;
 
 		/* Route layer to pipe based on zpos */
-		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
+		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
 		regmap_write(bld_regs,
@@ -317,6 +317,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
+	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
@@ -331,9 +332,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = i;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[i];
+
 		layer = sun8i_vi_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, i,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -352,9 +357,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = index;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[index];
+
 		layer = sun8i_ui_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, index,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 2e3689008b50..d14188cdfab3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -212,6 +212,7 @@ struct sun8i_layer {
 	struct drm_plane	plane;
 	struct sun8i_mixer	*mixer;
 	int			type;
+	int			index;
 	int			channel;
 	int			overlay;
 	struct regmap		*regs;
@@ -246,7 +247,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
+		return DE33_CH_BASE + channel * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dd6cb09c2c01..e65dc313c87d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -265,7 +265,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
@@ -277,7 +277,8 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index e0b2cfa02749..9383c3364df3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -53,6 +53,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4f0c929faf36..44e699910b70 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -411,7 +411,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
@@ -426,7 +426,8 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 70766d752fa6..89d0c32e63cf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -58,6 +58,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2

