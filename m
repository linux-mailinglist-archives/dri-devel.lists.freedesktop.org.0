Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0ABD0B0C
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A3510E19E;
	Sun, 12 Oct 2025 19:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsTpXb5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C5C10E1AC
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b3d50882cc2so653818666b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297032; x=1760901832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
 b=IsTpXb5OtPLayvc2qhfZdT85Yc5bqz20SbBacCYKdHGfTiJsUbIkIr2E7UOtRDXSoq
 LfbRSS1U6IX8gxWZnA0tPxJyWcg6Bp4yFrqKOiGhZ6XTcH2irak4S4M7pFl2g/kUxOM6
 jEwswq4w3nlAUEbBsK/7GrA3tK7ODS1x9gdeYcXF1gDNDxM8Uq9OiG2hkGFTVWykzYAg
 l03mDv3bk89LbDdA/mBfco1RTolSYpPKByLvaz0DXa26yOCuLaTA2OIlKP6Sfr9in+ta
 NH46y8WPIsNNL+ZQUvbQ4Pelcz5iFB5ZiWhnQHLCgLLPONbQAyUew/7dUDaHcc+u5OZr
 6Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297032; x=1760901832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9r6Ut7kV6R9HZszR3tkt2ETSQ6gt6SVQ7s+jJ4oPNx0=;
 b=P+yYiHpukNPz0aRmeaQwD/zSS+Jc0IliKoQcH1wPaWIsJ2oMJp9tZqMJhy+ozfrWRy
 E/YahfKjEJ3N7O4Al1TN5ixoenwodVBCFpdlQ5/6T9RisXDNNJs4Jma0h0RfIsbPZ1Hz
 5j+hApX/ZECZDje5cmu9a9B7Ml3aafxDpKLbEwJRGU0A/lC7p4NgrIdr0elrqilydnH+
 8/QBTKLORn0JKINpmqxM5yacRfsjbzBI/8HfTcxe3kkvJdUeQTSKweJrgfK1LxYI8EAF
 Kv2S8p4kJePVu91aaxCowNyS8qQyxGKY9r3kEnGfv8C/JCyC73UuTBW1rH934EKkZa7D
 JhEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzfs838a1mWN1H7JEz8NI9kG2EU1eLeSljNErcUbmTYyR4nevnHXeG/QZ8p2HAyE9vNYlkARradTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoDlG/PjhAXdSIsDFVQncfozlMnJf2bL1dmfcQTud/8pfuW/hZ
 0R+dLzkdWV9mMfMF0IqpTiVfgZBps1YDgs7w9HUoNvP1NvOV3/uq3eps
X-Gm-Gg: ASbGncssE1/XQcNP3RwJdlxtEoeW/iykMY1wGTAs9HFVrx54Gg6zM6NgFzDDVMRipS0
 GWI0JoJRLDsnGPzcJb3YHRuSYkp4DLBdTfbM8frdDiVC97b4Yb2TOaUC4OquIOWuqacS8r7kr2f
 535zoYyokGOXWBuDObC4mzTff8Pi+3ydj6gfdqz99wEg0ctJSjtlpp9kJoNSu+vHvcpOi1xxxuX
 ONdnCNKqUkookmIG7r6eHsH2Pt9cnGLBtM6vYB2Heg3xif+tJXkG53maTINWW0W+vDhPC+PBD+d
 lx8LZR5tSlkc2inv5hWWjsVw5DmFXSUxB29ieyjRSGthViq0jNSQYNyW2YdT9HieX45D6iZ4qra
 5mGz5U7H0PVVl6WkjLiTz3CwYuxN9Am9LZBNt1QLYw0mgij19rJh0LqGgqUYv9jjNFYglB5Q+4h
 pDv13hJALgKC/YbqLJVmZx
X-Google-Smtp-Source: AGHT+IGoU1lxXeWRIACneUv9HL1g56vOt419IJ1ZpZA1Fk2BOr5WzpZW402UoRq7f5Pp8L61Pkb+Rg==
X-Received: by 2002:a17:906:ef05:b0:b50:a389:7ab0 with SMTP id
 a640c23a62f3a-b50aa48d2d7mr2059077466b.4.1760297032494; 
 Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:23:52 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/30] drm/sun4i: mixer: Remove setting layer enable bit
Date: Sun, 12 Oct 2025 21:23:10 +0200
Message-ID: <20251012192330.6903-11-jernej.skrabec@gmail.com>
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

This task is now done by plane atomic update callback. There is no fear
that bit would be set incorrectly, as all register reads are eliminated.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 24 ------------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 ++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 13 ++++++++++++-
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a3194b71dc6d..1fca05a760b8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -250,24 +250,6 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
-static void sun8i_layer_enable(struct sun8i_layer *layer, bool enable)
-{
-	u32 ch_base = sun8i_channel_base(layer->mixer, layer->channel);
-	u32 val, reg, mask;
-
-	if (layer->type == SUN8I_LAYER_TYPE_UI) {
-		val = enable ? SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay);
-	} else {
-		val = enable ? SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN : 0;
-		mask = SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-		reg = SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay);
-	}
-
-	regmap_update_bits(layer->mixer->engine.regs, reg, mask, val);
-}
-
 static void sun8i_mixer_commit(struct sunxi_engine *engine,
 			       struct drm_crtc *crtc,
 			       struct drm_atomic_state *state)
@@ -304,12 +286,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 				 plane->base.id, layer->channel, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
-		/*
-		 * We always update the layer enable bit, because it can clear
-		 * spontaneously for unknown reasons.
-		 */
-		sun8i_layer_enable(layer, enable);
-
 		if (!enable)
 			continue;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8634d2ee613a..9d5d5e0b7e63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,6 +25,15 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -201,8 +210,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_ui_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dcc4429368d6..727117658c6c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,6 +18,15 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
+static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
+				   int channel, int overlay)
+{
+	u32 ch_base = sun8i_channel_base(mixer, channel);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+}
+
 static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 					     int channel, int overlay,
 					     struct drm_plane *plane)
@@ -320,8 +329,10 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->crtc || !new_state->visible)
+	if (!new_state->crtc || !new_state->visible) {
+		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
 		return;
+	}
 
 	sun8i_vi_layer_update_attributes(mixer, layer->channel,
 					 layer->overlay, plane);
-- 
2.51.0

