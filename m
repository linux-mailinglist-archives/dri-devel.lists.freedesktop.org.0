Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26662312B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E996E3C1;
	Tue, 28 Jul 2020 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B8E6E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595949410; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCAL3uifqrwrrscsGck77s7dOI7H4T7L/Psu4vIjeNo=;
 b=ISeLpAy0gBt9aVtGQ7vMvBc4q0lHCwa/EveW3oxDGe2VLWxcbo1TZtHCNHvgG+m9slP+pt
 QLRE2x9JexqOaaYyVPYr3sCqNRyz5RizX2/BQ+8GsWcYU+HJkZZGt+lmNeSZFP7YWvtTx4
 xOVVM7wsGxQiBskNouFyBFcQMP8iNyU=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/ingenic: Validate mode in a .mode_valid callback
Date: Tue, 28 Jul 2020 17:16:41 +0200
Message-Id: <20200728151641.26124-3-paul@crapouillou.net>
In-Reply-To: <20200728151641.26124-1-paul@crapouillou.net>
References: <20200728151641.26124-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Validate modes in the drm_crtc_helper_funcs.mode_valid() callback, which
is designed for this purpose, instead of doing it in
drm_crtc_helper_funcs.atomic_check().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 34 +++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 64eabab3ef69..5dab9c3d0a52 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -199,21 +199,8 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
-	long rate;
-
-	if (!drm_atomic_crtc_needs_modeset(state))
-		return 0;
-
-	if (state->mode.hdisplay > priv->soc_info->max_width ||
-	    state->mode.vdisplay > priv->soc_info->max_height)
-		return -EINVAL;
 
-	rate = clk_round_rate(priv->pix_clk,
-			      state->adjusted_mode.clock * 1000);
-	if (rate < 0)
-		return rate;
-
-	if (priv->soc_info->has_osd) {
+	if (drm_atomic_crtc_needs_modeset(state) && priv->soc_info->has_osd) {
 		f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
 		if (IS_ERR(f1_state))
 			return PTR_ERR(f1_state);
@@ -242,6 +229,24 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status
+ingenic_drm_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
+{
+	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	long rate;
+
+	if (mode->hdisplay > priv->soc_info->max_width)
+		return MODE_BAD_HVALUE;
+	if (mode->vdisplay > priv->soc_info->max_height)
+		return MODE_BAD_VVALUE;
+
+	rate = clk_round_rate(priv->pix_clk, mode->clock * 1000);
+	if (rate < 0)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 					  struct drm_crtc_state *oldstate)
 {
@@ -655,6 +660,7 @@ static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
 	.atomic_begin		= ingenic_drm_crtc_atomic_begin,
 	.atomic_flush		= ingenic_drm_crtc_atomic_flush,
 	.atomic_check		= ingenic_drm_crtc_atomic_check,
+	.mode_valid		= ingenic_drm_crtc_mode_valid,
 };
 
 static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
