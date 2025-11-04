Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B103C328AB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33BF10E64A;
	Tue,  4 Nov 2025 18:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PFoncYzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666710E30E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4775638d819so5231095e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279810; x=1762884610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDqva417xyNryg1IXFcTOy97H9FHEQaAyTZzRiGHEe8=;
 b=PFoncYzTJjxOxStkFbHsqTO15Iy4G7ITHDSHoqhWXuoDrQIAwUPNQs6he+sxb9RduJ
 Qm83cWwwVllZqu1++HGMax/IevmT4xWqy4TgDhDzQ93BJmfzE2vY6m6tPDRqpQOG53gx
 0ifls6Jcn6dto8/RkAYVUkGncFvfhlUKxqSvwl6ZZcSNXEin9XI0hgJ5n79MMc+BbPKz
 M5Xv7agwZvoyqlCAhcOWuXg4bmH3UK3KpVuNMHRgbuNg8yh+AOkqzQCgWGTfVNu8YlDB
 aKMuBSgSiFaxaOAMn2l2CsdeaSiWXILunrBI/kSgUtVJYG38nN5Vyf6rYkHGrRQYT7gO
 Hqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279810; x=1762884610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDqva417xyNryg1IXFcTOy97H9FHEQaAyTZzRiGHEe8=;
 b=XB2l/xgihlzv1iSJfr5uEO47T22M1ACjRJDFJPwVtaFyjb6I9NWg+/I+BwGY96ajBP
 EPnNuefTWYkS47yZo14+1DygRSHaEAvj6GAf/Jz01y4WHxG4lUo32+myA3LBlGTGyJcC
 Fl27kN0xm94Z705HhVPioDMe3b8TZnLk/VBqvAUyPiue9lV5UUE2o6ZhokDhFDY/Guaw
 aOysBZW7lSCD44pjEMdJvLbFTw7kaaFm52RYdWjcNYaHC6nAFUF5lnh3KJZXj39Am/sB
 BIvoulWWHT3Koau9cN0pVjrWF/A6EknQTgp0B2UR9xrzoD3d8ZvTHQoMbGq89s0yoH5F
 MeXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7EnasTFTXBTdjR1Kf4JHVji9CUX7WY4h9TFM4oXrHpNBTNczQ3MeKV7aEIx8RkWPf5e5OOaYRUSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Hz6/zV5i3wSCcYMHDyeUxfk0A/D1WDe7KB3Ul1O6a05fXCqz
 f2iCTHFvjh1rtMgOyRn2KnOdqV1KwjNXcIFbuR1jhv610+4ANc9lxYKm
X-Gm-Gg: ASbGncsCMWw5yKPOfr1Pnz1u6JIugGT8UMngBDxwRK6Hfj2tOs6bqr4xSdd8LSzQ29x
 OWiA6yOr+xq8Bj/I4acucwEKGm3DpprTIyJ6venCsjxNXkrsfYWdOxWSt0mqZ8xbI//5sTym1qW
 I5WXtO+UtbcMNd4Lz7JvYDe29ACaO9WThU3MmXjz/2LX479tMLc3aS+fbDIjuvoysL8E5ltL1Bh
 qMBNmGlXQamqLuhM2vWLHlGd2RHR3dltoD3bxhswuYxbI6V537jEXqwZIdEovr+Mj1Q8Mq+UIqV
 aqA1EyLc5hKk3x/z4IVFhTnn85tSt1GChbkHXq6O6ZZW2Dc9yz3pfRoqTF1z5l34CKGS7uAN6el
 GGfpWx/q64lE4/vuIR3M8ZDUXRsoGJcRYHG9FtRG8SGbFzx9eJpxrPowlo2jnYvb8iXoxPreD+e
 fRLY4oHhCmVhF2lMsa4ncyY8QXVlh1
X-Google-Smtp-Source: AGHT+IHj09IPAOCbCEAg0ncAsr0LC5H9NwCy7b3YSE8GChtZbFobh2jD5PwMN9j5D94aGK3dEVmPNw==
X-Received: by 2002:a05:600c:19cf:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-4775ce19fa1mr2767805e9.31.1762279810441; 
 Tue, 04 Nov 2025 10:10:10 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:10 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Tue,  4 Nov 2025 19:09:19 +0100
Message-ID: <20251104180942.61538-8-jernej.skrabec@gmail.com>
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

With upcoming DE33 support, layer management must be decoupled from
other operations like blender configuration. There are two reasons:
- DE33 will have separate driver for planes and thus it will be harder
  to manage different register spaces
- Architecturaly it's better to split access by modules. Blender is now
  exclusively managed by mixer.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 ++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 22 +++-------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 22 +++-------------------
 3 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f7f210a925f8..a3194b71dc6d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,8 +283,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 	drm_for_each_plane(plane, state->dev) {
 		struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
+		int w, h, x, y, zpos;
 		bool enable;
-		int zpos;
 
 		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
 			continue;
@@ -295,10 +295,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 		enable = plane_state->crtc && plane_state->visible;
 		zpos = plane_state->normalized_zpos;
+		x = plane_state->dst.x1;
+		y = plane_state->dst.y1;
+		w = drm_rect_width(&plane_state->dst);
+		h = drm_rect_height(&plane_state->dst);
 
-		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d\n",
+		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
 				 plane->base.id, layer->channel, layer->overlay,
-				 enable, zpos);
+				 enable, zpos, x, y, w, h);
 
 		/*
 		 * We always update the layer enable bit, because it can clear
@@ -312,6 +316,13 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		/* Route layer to pipe based on zpos */
 		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
+
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
+			     SUN8I_MIXER_COORD(x, y));
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
+			     SUN8I_MIXER_SIZE(w, h));
 	}
 
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8baa1d0b53bd..12c83c54f9bc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -47,21 +47,17 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -113,17 +109,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		else
 			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
@@ -230,14 +215,13 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dae6f83cea6e..1f4fa63ef153 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -49,25 +49,21 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
 	u32 hn = 0, hm = 0;
 	u32 vn = 0, vm = 0;
 	bool subsampled;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -180,17 +176,6 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_VDS_UV(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(vn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -350,14 +335,13 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_vi_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_vi_layer_update_formats(mixer, layer->channel,
-- 
2.51.2

