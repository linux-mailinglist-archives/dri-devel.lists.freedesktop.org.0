Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D17503B1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD2010E4AA;
	Wed, 12 Jul 2023 09:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08A10E41E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRI-0001eq-7g; Wed, 12 Jul 2023 11:47:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr6T-LQ; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-004GUl-Mn; Wed, 12 Jul 2023 11:47:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 46/52] drm/vc4: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:56 +0200
Message-Id: <20230712094702.1770121-47-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11223;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=q+O68wO3RFO0edq8rIonIrpBrGR15OMMFJRe1SYI920=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaLZupw/WZVJ/S6s3Y4QJflOzGxdgNQF4ezv
 kOTV8SFBq2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52iwAKCRCPgPtYfRL+
 TlbDB/9LrBpe1k5NmlJioM1OFXq7eL5GPhwaEoozVYHzTWkzpL+OqGtog87MEgRe9lBXVuL4MHy
 R+YCCWUDGNzinr7hvIxy4UKGUUYlEZggXvtBlGEQmHDhkjIJtInkwXbExGu7HcBQ+v+aXFcCaWl
 K6Kdt5ZFps2ABMz0Zz1buWWgqMEQ2yxLBPdOJjirQN3dM0V6CQ05k+rPeGEdhNd21vwqG4aVRfT
 rexYogxZ17tz/0+L6S7D//S5tL9p9YWbeaFCLVAOpalkQzqxxzmvjlXqpjk9AIZNzRI8FrawYch
 +pPBfEsZUvqT/3CoT/lq8/AbouBFAU9m+mSJuBAaU7NUoiPP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 38 +++++++++++++++++-----------------
 drivers/gpu/drm/vc4/vc4_hdmi.c |  2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 12 +++++------
 drivers/gpu/drm/vc4/vc4_txp.c  |  2 +-
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bef9d45ef1df..09e65d322f1d 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -99,7 +99,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 					  ktime_t *stime, ktime_t *etime,
 					  const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -220,7 +220,7 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
-	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.drm_dev);
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
 	/*
@@ -296,7 +296,7 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 
 	WARN_ON(hweight32(state->encoder_mask) > 1);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev, state->encoder_mask)
 		return encoder;
 
 	return NULL;
@@ -305,7 +305,7 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -321,7 +321,7 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -468,7 +468,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 {
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int idx, ret;
 
@@ -514,7 +514,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	enum vc4_encoder_type encoder_type;
@@ -571,7 +571,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 
 void vc4_crtc_send_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	if (!crtc->state || !crtc->state->event)
@@ -590,7 +590,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 									 crtc);
 	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
@@ -614,7 +614,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
 									 crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
@@ -747,7 +747,7 @@ int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 static int vc4_enable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -763,7 +763,7 @@ static int vc4_enable_vblank(struct drm_crtc *crtc)
 static void vc4_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -777,7 +777,7 @@ static void vc4_disable_vblank(struct drm_crtc *crtc)
 static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 {
 	struct drm_crtc *crtc = &vc4_crtc->base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	u32 chan = vc4_crtc->current_hvs_channel;
@@ -845,7 +845,7 @@ static void
 vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 {
 	struct drm_crtc *crtc = flip_state->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_plane *plane = crtc->primary;
 
 	vc4_plane_async_set_fb(plane, flip_state->fb);
@@ -943,7 +943,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
 			   struct drm_pending_vblank_event *event,
 			   uint32_t flags)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_plane *plane = crtc->primary;
 	struct vc4_async_flip_state *flip_state;
 
@@ -993,7 +993,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *event,
 			       uint32_t flags)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_gem_dma_object *dma_bo = drm_fb_dma_get_gem_obj(fb, 0);
 	struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
@@ -1039,7 +1039,7 @@ int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
 	if (flags & DRM_MODE_PAGE_FLIP_ASYNC) {
-		struct drm_device *dev = crtc->dev;
+		struct drm_device *dev = crtc->drm_dev;
 		struct vc4_dev *vc4 = to_vc4_dev(dev);
 
 		if (vc4->is_vc5)
@@ -1070,7 +1070,7 @@ struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
 void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(crtc->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(crtc->drm_dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
 
 	if (drm_mm_node_allocated(&vc4_state->mm)) {
@@ -1104,7 +1104,7 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 int vc4_crtc_late_register(struct drm_crtc *crtc)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm_dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5261526d286f..ed9a5273674e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -304,7 +304,7 @@ static int reset_pipe(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm_dev);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4da66ef96783..b76c4994fea8 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -442,7 +442,7 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane;
 	unsigned long flags;
@@ -473,7 +473,7 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
@@ -490,7 +490,7 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	unsigned long flags;
@@ -530,7 +530,7 @@ void vc4_hvs_atomic_begin(struct drm_crtc *crtc,
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 			   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -544,7 +544,7 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
 			    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
@@ -558,7 +558,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c5abdec03103..8bb743ab5499 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -433,7 +433,7 @@ static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
 static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
-- 
2.39.2

