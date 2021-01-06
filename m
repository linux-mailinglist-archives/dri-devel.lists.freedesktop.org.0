Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD312ECBF8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC1F6E44A;
	Thu,  7 Jan 2021 08:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 453 seconds by postgrey-1.36 at gabe;
 Wed, 06 Jan 2021 20:47:52 UTC
Received: from mail.siol.net (mailoutvs49.siol.net [185.57.226.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DC489D9A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 55370522E20;
 Wed,  6 Jan 2021 21:40:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id gR7vxRChIE9O; Wed,  6 Jan 2021 21:40:16 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id B8CD4522E39;
 Wed,  6 Jan 2021 21:40:16 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id D70F3522E20;
 Wed,  6 Jan 2021 21:40:15 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH v3] drm/sun4i: de2: Reimplement plane z position setting logic
Date: Wed,  6 Jan 2021 21:46:30 +0100
Message-Id: <20210106204630.1800284-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: jernej.skrabec@siol.net,
 Roman Stratiienko <roman.stratiienko@globallogic.com>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.kocialkowski@bootlin.com, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

To set blending channel order register software needs to know state and
position of each channel, which impossible at plane commit stage.

Move this procedure to atomic_flush stage, where all necessary information
is available.

Fixes: f88c5ee77496 ("drm/sun4i: Implement zpos for DE2")
Fixes: d8b3f454dab4 ("drm/sun4i: sun8i: Avoid clearing blending order at each atomic commit")
Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
[rebased, addressed comments]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 57 +++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  5 +++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 42 +++----------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 42 +++----------------
 4 files changed, 64 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 5b42cf25cc86..d2153b10b08d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -250,6 +250,50 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	int channel_by_zpos[SUN8I_MIXER_MAX_CHANNELS];
+	u32 base = sun8i_blender_base(mixer);
+	u32 route = 0, pipe_ctl = 0;
+	unsigned int channel_count;
+	int i, j;
+
+	channel_count = mixer->cfg->vi_num + mixer->cfg->ui_num;
+
+	DRM_DEBUG_DRIVER("Update blender routing\n");
+
+	for (i = 0; i < SUN8I_MIXER_MAX_CHANNELS; i++)
+		channel_by_zpos[i] = -1;
+
+	for (i = 0; i < channel_count; i++)	{
+		int zpos = mixer->channel_zpos[i];
+
+		if (zpos >= 0 && zpos < channel_count)
+			channel_by_zpos[zpos] = i;
+	}
+
+	j = 0;
+	for (i = 0; i < channel_count; i++) {
+		int ch = channel_by_zpos[i];
+
+		if (ch >= 0) {
+			pipe_ctl |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(j);
+			route |= ch << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
+			j++;
+		}
+	}
+
+	/*
+	 * Set fill color of bottom plane to black. Generally not needed
+	 * except when VI plane is at bottom (zpos = 0) and enabled.
+	 */
+	pipe_ctl |= SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_PIPE_CTL(base), pipe_ctl);
+
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_BLEND_ROUTE(base), route);
+
 	DRM_DEBUG_DRIVER("Committing changes\n");
 
 	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
@@ -479,23 +523,16 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
-	/*
-	 * Set fill color of bottom plane to black. Generally not needed
-	 * except when VI plane is at bottom (zpos = 0) and enabled.
-	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
-	for (i = 0; i < plane_cnt; i++)
+	for (i = 0; i < plane_cnt; i++) {
+		mixer->channel_zpos[i] = -1;
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
-
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
-			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
+	}
 
 	return 0;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7576b523fdbb..7b378d6e4dd9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -12,6 +12,8 @@
 
 #include "sunxi_engine.h"
 
+#define SUN8I_MIXER_MAX_CHANNELS		5
+
 #define SUN8I_MIXER_SIZE(w, h)			(((h) - 1) << 16 | ((w) - 1))
 #define SUN8I_MIXER_COORD(x, y)			((y) << 16 | (x))
 
@@ -179,6 +181,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	/* -1 means that layer is disabled */
+	int channel_zpos[SUN8I_MIXER_MAX_CHANNELS];
 };
 
 static inline struct sun8i_mixer *
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 816ad4ce8996..9f82e7c33e90 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -24,12 +24,10 @@
 #include "sun8i_ui_scaler.h"
 
 static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
-				  int overlay, bool enable, unsigned int zpos,
-				  unsigned int old_zpos)
+				  int overlay, bool enable, unsigned int zpos)
 {
-	u32 val, bld_base, ch_base;
+	u32 val, ch_base;
 
-	bld_base = sun8i_blender_base(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
@@ -44,32 +42,7 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
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
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   val, val);
-
-		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
-				   val);
-	}
+	mixer->channel_zpos[channel] = enable ? zpos : -1;
 }
 
 static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -267,11 +240,9 @@ static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
 					  struct drm_plane_state *old_state)
 {
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
-			      old_zpos);
+	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
 }
 
 static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
@@ -279,12 +250,11 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 {
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
 	unsigned int zpos = plane->state->normalized_zpos;
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!plane->state->visible) {
 		sun8i_ui_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
+				      layer->overlay, false, 0);
 		return;
 	}
 
@@ -295,7 +265,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 76393fc976fe..c8c418fb906b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,12 +18,10 @@
 #include "sun8i_vi_scaler.h"
 
 static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
-				  int overlay, bool enable, unsigned int zpos,
-				  unsigned int old_zpos)
+				  int overlay, bool enable, unsigned int zpos)
 {
-	u32 val, bld_base, ch_base;
+	u32 val, ch_base;
 
-	bld_base = sun8i_blender_base(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	DRM_DEBUG_DRIVER("%sabling VI channel %d overlay %d\n",
@@ -38,32 +36,7 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
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
-	if (enable) {
-		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
-				   val, val);
-
-		val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
-
-		regmap_update_bits(mixer->engine.regs,
-				   SUN8I_MIXER_BLEND_ROUTE(bld_base),
-				   SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
-				   val);
-	}
+	mixer->channel_zpos[channel] = enable ? zpos : -1;
 }
 
 static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -370,11 +343,9 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
 					  struct drm_plane_state *old_state)
 {
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
-	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
-			      old_zpos);
+	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
 }
 
 static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
@@ -382,12 +353,11 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 {
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
 	unsigned int zpos = plane->state->normalized_zpos;
-	unsigned int old_zpos = old_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!plane->state->visible) {
 		sun8i_vi_layer_enable(mixer, layer->channel,
-				      layer->overlay, false, 0, old_zpos);
+				      layer->overlay, false, 0);
 		return;
 	}
 
@@ -398,7 +368,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
-			      true, zpos, old_zpos);
+			      true, zpos);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
