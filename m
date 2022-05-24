Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DA532BB1
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 15:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1697F10F1DC;
	Tue, 24 May 2022 13:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191310F263
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 13:52:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id p10so7188524wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYC1tIsAjiq1cBKpe9O8OQgijyZp38kdmJuYTBXJuLg=;
 b=D0c5KaQWwqZx7KqTeU12Kg8rmuImfcrejKebtAJx08mLaBjPZqMogK/3Z+j4WjBMhe
 Y8OXJLwEyBxcm/bnd+eyk9CuuTwP5gsdlg+7XemeoLCBmQO5+N9Ns+ytfbSWhFUIUSZH
 BID28EumYJ/UOXlxYuKGN6VcyNm5mrtQ5LDFAAccyF/f8yWAtfS5VaP+27umL9+bnFE/
 NQwlS/HYIEzfAPkjFGVs/1h2cAs5EoPDHFaweAogrR4FFavpURDq5iJPiMTdcyBrq8bW
 jcREIayYSMBsapnVrJtEqc42Dvl+FlVHP0JJAnWgVUzKo4i266f8joFFK9/RAztxSZcO
 owTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BYC1tIsAjiq1cBKpe9O8OQgijyZp38kdmJuYTBXJuLg=;
 b=5EOQ7+x1U/ZRUd/z3mYiv1+HJO6ykQlb1JgfXa8FuBNAO2q89UpxVLcLB3tzbdAiLN
 j2WqYQkKcwLotVNH/w8Nbm0cTu2OGSIG7/WoeQ2yta9vZ2C6ZJ828O0QKWAnhzCvSZ0D
 VHf9L1ca5nmnuaR/v8EmI/LENS3+5kFJc7p8VE+EiADQsFDRkj5E4OqFUNXxeV7o+cpC
 GSDG28TTorx0VrzM5RNjjcI6iIZcR35QYCdkU+vtQKz1DeUrqR/ilkzLXZQWCPmt5tbQ
 wSy0OsxG0EmauKhB52Z9qWX8xT0GlqWOauXpCc7yPoXcejKUmzUYm1CzgP77+MmI/Y4T
 tx5Q==
X-Gm-Message-State: AOAM532XMhqVZ0yiCmwfaAaXr4FYqbTNSXg2+DbyyouxrlHGXJXr0cvq
 9fqopVW1P7pX6IwjEWm5jWc=
X-Google-Smtp-Source: ABdhPJx3GOqmRRS4uwNy8z0N/+6oBX6gnvCmSAvLiOsTq+RHHfFHKYw85t+5mILf159laLfP29jJ3Q==
X-Received: by 2002:adf:e849:0:b0:20d:129c:6a2d with SMTP id
 d9-20020adfe849000000b0020d129c6a2dmr22650587wrn.533.1653400375642; 
 Tue, 24 May 2022 06:52:55 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a7bc758000000b0039747cf8354sm2325870wmk.39.2022.05.24.06.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 06:52:55 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
X-Google-Original-From: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH] drm/sun4i: Fix blend registers corruption for DE2.0/DE3.0
Date: Tue, 24 May 2022 13:52:49 +0000
Message-Id: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
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

Corruption happens when plane zpos is updated

Example scenario:

Initial frame blender state:
    PLANE_ZPOS = {0, 1, 2, 3}
    BLD_ROUTE  = {0, 1, 2, 0}
    BLD_EN     = {1, 1, 1, 0}

New frame commit (Only ZPOS has been changed):

    PLANE_ZPOS = {0->2, 1->0, 2->1, 3}

Expected results after plane state update:
                Z0 Z1 Z2 Z3
    BLD_ROUTE = {1, 2, 0, 0}
    BLD_EN    = {1, 1, 1, 0}

What is currently happening:

1. sun8i_vi_layer_enable(enabled=true, zpos=2, old_zpos=0):
    BLD_ROUTE = {1->0, 1, 2->0, 0}
    BLD_EN    = {1->0, 1, 1->1, 0}

2. sun8i_ui_layer_enable(enabled=true, zpos=0, old_zpos=1):
    BLD_ROUTE = {0->1, 1->0, 0, 0}
    BLD_EN    = {0->1, 1->0, 1, 0}

3. sun8i_ui_layer_enable(enabled=true, zpos=1, old_zpos=2):
    BLD_ROUTE = {1, 0->2, 0->0, 0}
    BLD_EN    = {1, 0->2, 1->0, 0}

After updating of all the planes we are ending up with BLD_EN[2]=0,
which makes this channel disabled.

To fix this issue, clear BLEND registers before updating the planes
and do not clear the old state while processing every plane.

Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 ++++----------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 ++++----------------------
 3 files changed, 24 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f5e8aeaa3cdf..004377a000fc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 	return -EINVAL;
 }
 
+static void sun8i_atomic_begin(struct sunxi_engine *engine,
+			       struct drm_crtc_state *old_state)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	u32 bld_base = sun8i_blender_base(mixer);
+
+	regmap_write(engine->regs,
+		     SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+		     0);
+
+	regmap_write(engine->regs,
+		     SUN8I_MIXER_BLEND_ROUTE(bld_base),
+		     0);
+}
+
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
@@ -299,6 +314,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 }
 
 static const struct sunxi_engine_ops sun8i_engine_ops = {
+	.atomic_begin	= sun8i_atomic_begin,
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7845c2a53a7f..b294a882626a 100644
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
 
@@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
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
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
@@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
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
+	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
 }
 
 static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 					 struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int zpos = new_state->normalized_zpos;
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->visible) {
 		sun8i_ui_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
+				      layer->overlay, false, 0);
 		return;
 	}
 
@@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bb7c43036dfa..4653244b2fd8 100644
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
 
@@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
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
-
 	if (enable) {
 		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
@@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
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
+	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
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
 
 	if (!new_state->visible) {
 		sun8i_vi_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
+				      layer->overlay, false, 0);
 		return;
 	}
 
@@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
-- 
2.30.2

