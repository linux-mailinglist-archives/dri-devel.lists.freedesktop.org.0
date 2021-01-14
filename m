Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B02F65B7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7236E34B;
	Thu, 14 Jan 2021 16:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19C389F0A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:12 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5894B1315;
 Thu, 14 Jan 2021 17:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641448;
 bh=tcyZF+mYHk4MywjEWgsguvffQXsV5rmY3yRdhDYW2fs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RjnVk3BzbtipB2MKiR3QdfMGYxwvHWB2vfmQyCtxWosVMvMQLDPjUfUHc1U3BCfsr
 521IUehVOlqBW1d8jIykAEfNQK6F0aIIf3OeeSuUuDGV19+HSd8ch1GQ6BATnNY5u6
 DZaObWRtw2Nh0dj0QUObiZxxCuIQmBBRTVJ677S0=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 06/10] drm: rcar-du: Handle CRTC configuration from commit
 tail handler
Date: Thu, 14 Jan 2021 16:22:51 +0000
Message-Id: <20210114162255.705868-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CRTC mode setting and routing configuration are performed at the
earliest of atomic enable and atomic begin, to ensure that a valid
configuration is applied to the hardware before the CRTC gets enabled
and before planes are setup (the latter being required in particular by
the VSP). This requires the rcar_du_crtc structure to track the CRTC
enabled state.

Simplify the code and remove the manual state tracking by moving CRTC
setup to a new rcar_du_crtc_atomic_modeset() function, called directly
from the commit tail handler. The function iterates over all CRTCs in
the state transaction and performs CRTC mode setting, routing
configuration and VSP configuration.

drm_crtc_vblank_on() has to be called from the atomic begin handler, to
ensure that vertical blanking reporting is enabled before the call to
drm_crtc_vblank_get() in the atomic flush handler. As the
drm_crtc_vblank_on() and drm_crtc_vblank_off() calls don't need to be
balanced this is not an issue. A balanced alternative would have been to
call drm_crtc_vblank_on() and drm_crtc_vblank_off() from the CRTC exit
and enter standby handlers respectively, but
drm_atomic_helper_commit_modeset_disables() complains if
drm_crtc_vblank_off() hasn't been called by the atomic disable handler.

As a result, the vsp1_du_atomic_flush() operation can be called with the
DRM pipeline disabled. Correct operation has been ensured by "media:
vsp1: drm: Don't configure hardware when the pipeline is disabled".

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Deconstruct rcar_du_crtc_setup() completely

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 89 +++++++++++---------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  1 +
 3 files changed, 42 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 55c0e0259153..7ca721e6b9d7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -519,22 +519,6 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
  * Start/Stop and Suspend/Resume
  */
 
-static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
-{
-	/* Configure display timings and output routing */
-	rcar_du_crtc_set_display_timing(rcrtc);
-	rcar_du_group_set_routing(rcrtc->group);
-
-	/* Enable the VSP compositor. */
-	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-		rcar_du_vsp_modeset(rcrtc);
-		rcar_du_vsp_enable(rcrtc);
-	}
-
-	/* Turn vertical blanking interrupt reporting on. */
-	drm_crtc_vblank_on(&rcrtc->crtc);
-}
-
 static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 {
 	int ret;
@@ -575,24 +559,6 @@ static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 	clk_disable_unprepare(rcrtc->clock);
 }
 
-static void rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
-{
-	/*
-	 * Guard against double-get, as the function is called from both the
-	 * .atomic_enable() and .atomic_begin() handlers.
-	 */
-	if (rcrtc->initialized)
-		return;
-
-	rcar_du_crtc_setup(rcrtc);
-	rcrtc->initialized = true;
-}
-
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
-{
-	rcrtc->initialized = false;
-}
-
 static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 {
 	bool interlaced;
@@ -768,6 +734,40 @@ int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
 	return 0;
 }
 
+/*
+ * Configure the mode for all CRTCs that require it. For now we only handle mode
+ * set on the VSP, CRTC configuration will be handled later.
+ */
+int rcar_du_crtc_atomic_modeset(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		/*
+		 * Skip commits that don't change the mode. We manually skip
+		 * inactive CRTCs as disabling a CRTC is considered as a mode
+		 * set by drm_atomic_crtc_needs_modeset().
+		 */
+		if (!drm_atomic_crtc_needs_modeset(crtc_state) ||
+		    !crtc_state->active)
+			continue;
+
+		/* Configure display timings and output routing. */
+		rcar_du_crtc_set_display_timing(rcrtc);
+		rcar_du_group_set_routing(rcrtc->group);
+
+		if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+			rcar_du_vsp_modeset(rcrtc);
+	}
+
+	return 0;
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_atomic_state *state)
 {
@@ -777,8 +777,6 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (rcrtc->cmm)
 		rcar_cmm_enable(rcrtc->cmm);
-	rcar_du_crtc_get(rcrtc);
-
 	/*
 	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
 	 * the DU channel. We need to enable its clock output explicitly if
@@ -793,6 +791,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
 	}
 
+	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+		rcar_du_vsp_enable(rcrtc);
+
 	rcar_du_crtc_start(rcrtc);
 
 	/*
@@ -813,7 +814,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
 	rcar_du_crtc_stop(rcrtc);
-	rcar_du_crtc_put(rcrtc);
 
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
@@ -841,19 +841,8 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	WARN_ON(!crtc->state->enable);
 
-	/*
-	 * If a mode set is in progress we can be called with the CRTC disabled.
-	 * We thus need to first get and setup the CRTC in order to configure
-	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
-	 * kept awake until the .atomic_enable() call that will follow. The get
-	 * operation in .atomic_enable() will in that case be a no-op, and the
-	 * CRTC will be put later in .atomic_disable().
-	 *
-	 * If a mode set is not in progress the CRTC is enabled, and the
-	 * following get call will be a no-op. There is thus no need to balance
-	 * it in .atomic_flush() either.
-	 */
-	rcar_du_crtc_get(rcrtc);
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(&rcrtc->crtc);
 
 	/* If the active state changed, we let .atomic_enable handle CMM. */
 	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 7ff0618b9998..2b58316cca2b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -30,7 +30,6 @@ struct rcar_du_vsp;
  * @extclock: external pixel dot clock (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC hardware index
- * @initialized: whether the CRTC has been initialized and clocks enabled
  * @dsysr: cached value of the DSYSR register
  * @vblank_enable: whether vblank events are enabled on this CRTC
  * @event: event to post when the pending page flip completes
@@ -52,7 +51,6 @@ struct rcar_du_crtc {
 	struct clk *extclock;
 	unsigned int mmio_offset;
 	unsigned int index;
-	bool initialized;
 
 	u32 dsysr;
 
@@ -113,6 +111,8 @@ int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
 				     struct drm_atomic_state *state);
 int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
 				      struct drm_atomic_state *state);
+int rcar_du_crtc_atomic_modeset(struct drm_device *dev,
+				struct drm_atomic_state *state);
 
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index ff50316b87b5..3c10c329c81c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -465,6 +465,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	rcar_du_crtc_atomic_exit_standby(dev, old_state);
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	rcar_du_crtc_atomic_modeset(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
