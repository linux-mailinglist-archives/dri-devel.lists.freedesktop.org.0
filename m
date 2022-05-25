Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F070533C03
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 13:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BAC10E869;
	Wed, 25 May 2022 11:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400C10E697
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 11:54:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s28so29648839wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zR8R4YRLFllnSnsYpSGtjsk7LsDXUXwYoxdA5BNNOX4=;
 b=ZoTSSZTc3jQqrc1ti5lPTZ82T0Sal1OhtQNnhLa423k1Zx8EyjKEEtYn5Tp4pKovKE
 cq8LplGU//KUnTqq1lzYpDAW7O7sUro+UCd6pIF99PRODZ5y5PIo8uHEjk30P70inYRA
 HITlQ5fYPsDqMvexyDwc2vC3qewoPlqw/pr7w0YdKfAFBWQWg+/w3y21k/bgOf8ehRhe
 i9NRzwRFtx01pqCUsOFX7eS8AXZujFEOAyQCEy1iuT4myrGFJe901LmZXU7V4+qACq9D
 Rliy6m8PuHx0lsF+XMmE0S/7BDGLFUafxnorFEKn6MQBBr1ltcXpwJqsEGl2LKVeotSb
 eFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zR8R4YRLFllnSnsYpSGtjsk7LsDXUXwYoxdA5BNNOX4=;
 b=A6/bbN+KLYSOOnG3LVqIksE+E3Dx6yiaGHs6rR77DoZJ6VFSOMSea1ThjhBCpC3RJJ
 gEURsaH40db9X9zcqqvD/KgG1eeXTNeLaBAG76fVcQlmtDqAFZ06ukXSv5ze5iO4D/4q
 QJtqeCH4nS8lGsx8oG0oCH+LN1amB6HvJvgmvCPjb1Ooq4TbS782SE0c/TaKeK80HTuR
 yqtlJMJgQmQgd0tXVRnr0oKGwqyn1CcdyspSShx0nxoyvQx3dQ2wJqD/0vlTtFvERYry
 S/EJes/LliepTd/Ibr7QMWC8NGSFF2kpXPv3X9vR46NL6UNRhzWNNnxtp56qW7mxm4oK
 7TsQ==
X-Gm-Message-State: AOAM5327l5ox0dTdm/ErgwVRukMOqN557M0eUKN4s3fOeZlSUfcJjFin
 LozCj//0APa4zYZzTS6effk=
X-Google-Smtp-Source: ABdhPJxEV6aiv45YWZ1B2JFK+x7HHsW98HKIE+9FZ7Kdtb0krMKxSf1WHCEGU+UJDTbtn/b612yqFA==
X-Received: by 2002:a5d:6802:0:b0:20d:295:cca2 with SMTP id
 w2-20020a5d6802000000b0020d0295cca2mr26686960wru.394.1653479693002; 
 Wed, 25 May 2022 04:54:53 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a1c7716000000b0039749bab534sm4975858wmi.1.2022.05.25.04.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 04:54:52 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
X-Google-Original-From: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH] drm/sun4i: Fix blend route/enable register corruption for
 DE2.0/DE3.0
Date: Wed, 25 May 2022 11:54:45 +0000
Message-Id: <20220525115445.93500-1-roman.o.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By this commit 2 related issues are solved:

  Issue #1. Corruption in blend route/enable register:

Register corruption happens after using old_state->zpos to disable layer
state. Blend route/enable registers are shared with other layers
and other layers may have already assigned this PIPE to valid value.

Solution: Do not use old_state->zpos to disable the plane pipe in
blend registers.

  Issue #2. Remove disabled layer from blend route/enable registers:

Since sun4i/drm are using normalized_zpos, .atomic_update() will setup
blend route/enable pipes starting from PIPE0 to PIPEX, where X+1 is a
number of layers used by the CRTC in this frame.

Remaining pipes (PIPE[X+1] - PIPE[MAX]) can have old data that MUST be
updated.

new_state->normalized_zpos can't be used, since drm helpers won't update
it for disabled planes.

Solution:

1. Track the number of total used planes for crtc.
2. Use this number instead of zpos to disable unused blend pipes.

Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 60 +++++++++-----------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  2 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 58 +++++++++----------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  2 +
 5 files changed, 47 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 5b3fbee18671..ebfc276b2464 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -177,6 +177,8 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	int                             used_layers;
 };
 
 static inline struct sun8i_mixer *
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7845c2a53a7f..ca79cb4d5c04 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -24,8 +24,7 @@
 #include "sun8i_ui_scaler.h"
 
 static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
-				  int overlay, bool enable, unsigned int zpos,
-				  unsigned int old_zpos)
+				  int overlay, bool enable, unsigned int zpos)
 {
 	u32 val, bld_base, ch_base;
 
@@ -44,32 +43,18 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
 
-	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
-				   0);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
-				   0);
-	}
-
-	if (enable) {
-		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
+	val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   val, val);
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+			   val, enable ? val : 0);
 
-		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
+	val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
-				   val);
-	}
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_ROUTE(bld_base),
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
+			   val);
 }
 
 static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
@@ -291,32 +276,29 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
-			      old_zpos);
+	if (layer->en_state) {
+		layer->en_state = false;
+		mixer->used_layers--;
+		sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false,
+				      mixer->used_layers);
+	}
 }
 
 static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 					 struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
+										plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->visible) {
-		sun8i_ui_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
-		return;
+	if (!layer->en_state) {
+		layer->en_state = true;
+		mixer->used_layers++;
 	}
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
@@ -328,7 +310,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index e3e32ee1178d..43c48cf7bc51 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -53,6 +53,8 @@ struct sun8i_ui_layer {
 	struct sun8i_mixer	*mixer;
 	int			channel;
 	int			overlay;
+
+	bool			en_state;
 };
 
 static inline struct sun8i_ui_layer *
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bb7c43036dfa..662ba1018cc4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,8 +18,7 @@
 #include "sun8i_vi_scaler.h"
 
 static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
-				  int overlay, bool enable, unsigned int zpos,
-				  unsigned int old_zpos)
+				  int overlay, bool enable, unsigned int zpos)
 {
 	u32 val, bld_base, ch_base;
 
@@ -38,32 +37,18 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
 
-	if (!enable || zpos != old_zpos) {
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
-				   0);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
-				   0);
-	}
+	val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-	if (enable) {
-		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   val, val);
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+			   val, enable ? val : 0);
 
-		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
+	val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
-				   val);
-	}
+	regmap_update_bits(mixer->engine.regs,
+			   SUN8I_MIXER_BLEND_ROUTE(bld_base),
+			   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
+			   val);
 }
 
 static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
@@ -395,32 +380,29 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
-			      old_zpos);
+	if (layer->en_state) {
+		layer->en_state = false;
+		mixer->used_layers--;
+		sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false,
+				      mixer->used_layers);
+	}
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 					 struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	if (!new_state->visible) {
-		sun8i_vi_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
-		return;
+	if (!layer->en_state) {
+		layer->en_state = true;
+		mixer->used_layers++;
 	}
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
@@ -432,7 +414,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 48c399e1c86d..9939a4cc7a52 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -58,6 +58,8 @@ struct sun8i_vi_layer {
 	struct sun8i_mixer	*mixer;
 	int			channel;
 	int			overlay;
+
+	bool			en_state;
 };
 
 static inline struct sun8i_vi_layer *
-- 
2.30.2

