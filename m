Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F0415228
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 22:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E16EC79;
	Wed, 22 Sep 2021 20:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A936EC79
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:56:23 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-mips@vger.kernel.org, list@opendingux.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 3/6] drm/ingenic: Move IPU scale settings to private state
Date: Wed, 22 Sep 2021 21:55:52 +0100
Message-Id: <20210922205555.496871-4-paul@crapouillou.net>
In-Reply-To: <20210922205555.496871-1-paul@crapouillou.net>
References: <20210922205555.496871-1-paul@crapouillou.net>
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

The IPU scaling information is computed in the plane's ".atomic_check"
callback, and used in the ".atomic_update" callback. As such, it is
state-specific, and should be moved to a private state structure.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 73 ++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index c819293b8317..2737fc521e15 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -47,6 +47,8 @@ struct soc_info {
 
 struct ingenic_ipu_private_state {
 	struct drm_private_state base;
+
+	unsigned int num_w, num_h, denom_w, denom_h;
 };
 
 struct ingenic_ipu {
@@ -58,8 +60,6 @@ struct ingenic_ipu {
 	const struct soc_info *soc_info;
 	bool clk_enabled;
 
-	unsigned int num_w, num_h, denom_w, denom_h;
-
 	dma_addr_t addr_y, addr_u, addr_v;
 
 	struct drm_property *sharpness_prop;
@@ -85,6 +85,30 @@ to_ingenic_ipu_priv_state(struct drm_private_state *state)
 	return container_of(state, struct ingenic_ipu_private_state, base);
 }
 
+static struct ingenic_ipu_private_state *
+ingenic_ipu_get_priv_state(struct ingenic_ipu *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_ingenic_ipu_priv_state(priv_state);
+}
+
+static struct ingenic_ipu_private_state *
+ingenic_ipu_get_new_priv_state(struct ingenic_ipu *priv, struct drm_atomic_state *state)
+{
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
+	if (!priv_state)
+		return NULL;
+
+	return to_ingenic_ipu_priv_state(priv_state);
+}
+
 /*
  * Apply conventional cubic convolution kernel. Both parameters
  *  and return value are 15.16 signed fixed-point.
@@ -305,11 +329,16 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
+	struct ingenic_ipu_private_state *ipu_state;
 	int err;
 
 	if (!newstate || !newstate->fb)
 		return;
 
+	ipu_state = ingenic_ipu_get_new_priv_state(ipu, state);
+	if (WARN_ON(!ipu_state))
+		return;
+
 	finfo = drm_format_info(newstate->fb->format->format);
 
 	if (!ipu->clk_enabled) {
@@ -482,27 +511,27 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	if (ipu->soc_info->has_bicubic)
 		ctrl |= JZ_IPU_CTRL_ZOOM_SEL;
 
-	upscaling_w = ipu->num_w > ipu->denom_w;
+	upscaling_w = ipu_state->num_w > ipu_state->denom_w;
 	if (upscaling_w)
 		ctrl |= JZ_IPU_CTRL_HSCALE;
 
-	if (ipu->num_w != 1 || ipu->denom_w != 1) {
+	if (ipu_state->num_w != 1 || ipu_state->denom_w != 1) {
 		if (!ipu->soc_info->has_bicubic && !upscaling_w)
-			coef_index |= (ipu->denom_w - 1) << 16;
+			coef_index |= (ipu_state->denom_w - 1) << 16;
 		else
-			coef_index |= (ipu->num_w - 1) << 16;
+			coef_index |= (ipu_state->num_w - 1) << 16;
 		ctrl |= JZ_IPU_CTRL_HRSZ_EN;
 	}
 
-	upscaling_h = ipu->num_h > ipu->denom_h;
+	upscaling_h = ipu_state->num_h > ipu_state->denom_h;
 	if (upscaling_h)
 		ctrl |= JZ_IPU_CTRL_VSCALE;
 
-	if (ipu->num_h != 1 || ipu->denom_h != 1) {
+	if (ipu_state->num_h != 1 || ipu_state->denom_h != 1) {
 		if (!ipu->soc_info->has_bicubic && !upscaling_h)
-			coef_index |= ipu->denom_h - 1;
+			coef_index |= ipu_state->denom_h - 1;
 		else
-			coef_index |= ipu->num_h - 1;
+			coef_index |= ipu_state->num_h - 1;
 		ctrl |= JZ_IPU_CTRL_VRSZ_EN;
 	}
 
@@ -513,13 +542,13 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	/* Set the LUT index register */
 	regmap_write(ipu->map, JZ_REG_IPU_RSZ_COEF_INDEX, coef_index);
 
-	if (ipu->num_w != 1 || ipu->denom_w != 1)
+	if (ipu_state->num_w != 1 || ipu_state->denom_w != 1)
 		ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_HRSZ_COEF_LUT,
-				      ipu->num_w, ipu->denom_w);
+				      ipu_state->num_w, ipu_state->denom_w);
 
-	if (ipu->num_h != 1 || ipu->denom_h != 1)
+	if (ipu_state->num_h != 1 || ipu_state->denom_h != 1)
 		ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_VRSZ_COEF_LUT,
-				      ipu->num_h, ipu->denom_h);
+				      ipu_state->num_h, ipu_state->denom_h);
 
 	/* Clear STATUS register */
 	regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
@@ -531,7 +560,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	dev_dbg(ipu->dev, "Scaling %ux%u to %ux%u (%u:%u horiz, %u:%u vert)\n",
 		newstate->src_w >> 16, newstate->src_h >> 16,
 		newstate->crtc_w, newstate->crtc_h,
-		ipu->num_w, ipu->denom_w, ipu->num_h, ipu->denom_h);
+		ipu_state->num_w, ipu_state->denom_w,
+		ipu_state->num_h, ipu_state->denom_h);
 }
 
 static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
@@ -545,6 +575,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
 	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
+	struct ingenic_ipu_private_state *ipu_state;
 
 	if (!crtc)
 		return 0;
@@ -553,6 +584,10 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
+	ipu_state = ingenic_ipu_get_priv_state(ipu, state);
+	if (IS_ERR(ipu_state))
+		return PTR_ERR(ipu_state);
+
 	/* Request a full modeset if we are enabling or disabling the IPU. */
 	if (!old_plane_state->crtc ^ !new_plane_state->crtc)
 		crtc_state->mode_changed = true;
@@ -605,10 +640,10 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	if (num_h > max_h)
 		return -EINVAL;
 
-	ipu->num_w = num_w;
-	ipu->num_h = num_h;
-	ipu->denom_w = denom_w;
-	ipu->denom_h = denom_h;
+	ipu_state->num_w = num_w;
+	ipu_state->num_h = num_h;
+	ipu_state->denom_w = denom_w;
+	ipu_state->denom_h = denom_h;
 
 out_check_damage:
 	if (ingenic_drm_map_noncoherent(ipu->master))
-- 
2.33.0

