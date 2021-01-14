Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49102F65B4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7600689F73;
	Thu, 14 Jan 2021 16:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980E6E456
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:15 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AD6415B2;
 Thu, 14 Jan 2021 17:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641450;
 bh=YafMEWvUWe+1bz6CMDHya1fBEF13W2Wqpkc3dqBWr3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bX5Hj149EvskT5TmxWNS9reQc1YzcWPgcc5kEYg9J6XgLXBBbKTF77DAR5Da0YfVg
 fgDTc898ismwSQe+K9XGtDVse37H5GnzbJJqRP3er7A/djzytsJdc5Ag8W8AVHJHkA
 6gmLhlB/e+yzPvcOtD3At6dfsgXBSdKKfXEW0KaU=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 10/10] drm: rcar-du: Centralise routing configuration in
 commit tail handler
Date: Thu, 14 Jan 2021 16:22:55 +0000
Message-Id: <20210114162255.705868-11-kieran.bingham+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Routing configuration for the DU is complex. Depending on the SoC
generation various routing options are available:

- The VSP to DU routing is not available on Gen1, is configurable on
  Gen2 and is fixed on Gen3. When configurable, the routing affects both
  CRTC groups but is set in a register of the first CRTC group.
- The DU channel to DPAD output routing is explicitly configurable on
  some SoCs of the Gen2 and Gen3 family. When configurable, the DPAD
  outputs never offer routing options to CRTCs belonging to different
  groups.
- On all SoCs the routing of DU channels to DU pin controllers (internal
  output of the DU channels) can be swapped within a group. This feature
  is only used on Gen1 to control routing of the DPAD1 output.

Routing is thus handled at the group level, but for Gen2 hardware
requires configuration of the DPAD0 and VSPD1 routing in the first group
even when only the second group is enabled.

Routing at the group level is currently configured when applying CRTC
configuration. Global routing is configured at the same time, and is
additionally configured by the plane setup code to set VSPD1 routing.
This results in code paths that are difficult to follow.

Simplify the routing configuration by performing it all directly, based
on CRTC and CRTC group state. Group-level routing is moved to group
setup as it only depends on the group state and the state of the CRTCs
it contains. Global routing is moved to the commit tail handler, and
based on global DU state.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v3:
- s/DPAD1/DPAD0/
- s/VSP1D/VSPD1/

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 156 ++++++++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_group.h |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  16 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c |  10 +-
 6 files changed, 116 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 020eb75732a7..b5f07fd9c4be 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -747,9 +747,8 @@ int rcar_du_crtc_atomic_modeset(struct drm_device *dev,
 		    !crtc_state->active)
 			continue;
 
-		/* Configure display timings and output routing. */
+		/* Configure display timings. */
 		rcar_du_crtc_set_display_timing(rcrtc);
-		rcar_du_group_set_routing(rcrtc->group);
 
 		if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 			rcar_du_vsp_modeset(rcrtc);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index e792ba7f5145..ed0b57722f37 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -95,7 +95,6 @@ struct rcar_du_device {
 	} props;
 
 	unsigned int dpad0_source;
-	unsigned int dpad1_source;
 	unsigned int vspd1_sink;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index fdd4a60f5f5e..368676507097 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -46,6 +46,10 @@ void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data)
 	rcar_du_write(rgrp->dev, rgrp->mmio_offset + reg, data);
 }
 
+/* -----------------------------------------------------------------------------
+ * Static Group Setup
+ */
+
 static void rcar_du_group_setup_pins(struct rcar_du_group *rgrp)
 {
 	u32 defr6 = DEFR6_CODE;
@@ -59,37 +63,6 @@ static void rcar_du_group_setup_pins(struct rcar_du_group *rgrp)
 	rcar_du_group_write(rgrp, DEFR6, defr6);
 }
 
-static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
-{
-	struct rcar_du_device *rcdu = rgrp->dev;
-	u32 defr8 = DEFR8_CODE;
-
-	if (rcdu->info->gen < 3) {
-		defr8 |= DEFR8_DEFE8;
-
-		/*
-		 * On Gen2 the DEFR8 register for the first group also controls
-		 * RGB output routing to DPAD0 and VSPD1 routing to DU0/1/2 for
-		 * DU instances that support it.
-		 */
-		if (rgrp->index == 0) {
-			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
-			if (rgrp->dev->vspd1_sink == 2)
-				defr8 |= DEFR8_VSCS;
-		}
-	} else {
-		/*
-		 * On Gen3 VSPD routing can't be configured, and DPAD routing
-		 * is set in the group corresponding to the DPAD output (no Gen3
-		 * SoC has multiple DPAD sources belonging to separate groups).
-		 */
-		if (rgrp->index == rcdu->dpad0_source / 2)
-			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
-	}
-
-	rcar_du_group_write(rgrp, DEFR8, defr8);
-}
-
 static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -163,10 +136,8 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
 	rcar_du_group_write(rgrp, DEFR7, defr7);
 
-	if (rcdu->info->gen >= 2) {
-		rcar_du_group_setup_defr8(rgrp);
+	if (rcdu->info->gen >= 2)
 		rcar_du_group_setup_didsr(rgrp);
-	}
 
 	if (rcdu->info->gen >= 3)
 		rcar_du_group_write(rgrp, DEFR10, DEFR10_CODE | DEFR10_DEFE10);
@@ -184,6 +155,10 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	mutex_unlock(&rgrp->lock);
 }
 
+/* -----------------------------------------------------------------------------
+ * Start & Stop
+ */
+
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -239,26 +214,63 @@ void rcar_du_group_restart(struct rcar_du_group *rgrp)
 	__rcar_du_group_start_stop(rgrp, true);
 }
 
+/* -----------------------------------------------------------------------------
+ * Input and Output Routing
+ */
+
+static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
+{
+	struct rcar_du_device *rcdu = rgrp->dev;
+	u32 defr8 = DEFR8_CODE;
+
+	if (rcdu->info->gen < 3) {
+		defr8 |= DEFR8_DEFE8;
+
+		/*
+		 * On Gen2 the DEFR8 register for the first group also controls
+		 * RGB output routing to DPAD0 and VSPD1 routing to DU0/1/2 for
+		 * DU instances that support it.
+		 */
+		if (rgrp->index == 0) {
+			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
+			if (rgrp->dev->vspd1_sink == 2)
+				defr8 |= DEFR8_VSCS;
+		}
+	} else {
+		/*
+		 * On Gen3 VSPD routing can't be configured, and DPAD routing
+		 * is set in the group corresponding to the DPAD output (no Gen3
+		 * SoC has multiple DPAD sources belonging to separate groups).
+		 */
+		if (rgrp->index == rcdu->dpad0_source / 2)
+			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
+	}
+
+	rcar_du_group_write(rgrp, DEFR8, defr8);
+}
+
 int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
 {
 	struct rcar_du_group *rgrp;
 	struct rcar_du_crtc *crtc;
-	unsigned int index;
 	int ret;
 
-	if (rcdu->info->gen < 2)
+	/*
+	 * Only Gen2 hardware has global routing not handled in the group that
+	 * holds the corresponding CRTCs.
+	 */
+	if (rcdu->info->gen != 2)
 		return 0;
 
 	/*
-	 * RGB output routing to DPAD0 and VSP1D routing to DU0/1/2 are
-	 * configured in the DEFR8 register of the first group on Gen2 and the
-	 * last group on Gen3. As this function can be called with the DU
-	 * channels of the corresponding CRTCs disabled, we need to enable the
-	 * group clock before accessing the register.
+	 * RGB output routing to DPAD0 and VSPD1 routing to DU0/1/2 are
+	 * configured in the DEFR8 register of the first group on Gen2. As this
+	 * function can be called with the DU channels of the corresponding
+	 * CRTCs disabled, we need to enable the group clock before accessing
+	 * the register.
 	 */
-	index = rcdu->info->gen < 3 ? 0 : DIV_ROUND_UP(rcdu->num_crtcs, 2) - 1;
-	rgrp = &rcdu->groups[index];
-	crtc = &rcdu->crtcs[index * 2];
+	rgrp = &rcdu->groups[0];
+	crtc = &rcdu->crtcs[0];
 
 	ret = clk_prepare_enable(crtc->clock);
 	if (ret < 0)
@@ -312,19 +324,33 @@ static void rcar_du_group_set_dpad_levels(struct rcar_du_group *rgrp)
 	rcar_du_group_write(rgrp, DOFLR, doflr);
 }
 
-int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
+static void rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
 	u32 dorcr = rcar_du_group_read(rgrp, DORCR);
+	bool sp1_to_pin2 = false;
 
 	dorcr &= ~(DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_MASK);
 
 	/*
-	 * Set the DPAD1 pins sources. Select CRTC 0 if explicitly requested and
-	 * CRTC 1 in all other cases to avoid cloning CRTC 0 to DPAD0 and DPAD1
-	 * by default.
+	 * Configure the superposition processor to pin controller routing.
+	 * Hardcode the assignment, except on Gen1 where we use it to route the
+	 * DU channels to DPAD1. There we route CRTC 0 to DPAD1 if explicitly
+	 * requested, and CRTC 1 in all other cases to avoid cloning CRTC 0 to
+	 * DPAD0 and DPAD1 by default.
 	 */
-	if (rcdu->dpad1_source == rgrp->index * 2)
+	if (rcdu->info->gen == 1 && rgrp->index == 0) {
+		struct rcar_du_crtc_state *rstate;
+		struct rcar_du_crtc *rcrtc;
+
+		rcrtc = &rcdu->crtcs[0];
+		rstate = to_rcar_crtc_state(rcrtc->crtc.state);
+
+		if (rstate->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
+			sp1_to_pin2 = true;
+	}
+
+	if (sp1_to_pin2)
 		dorcr |= DORCR_PG2D_DS1;
 	else
 		dorcr |= DORCR_PG2T | DORCR_DK2S | DORCR_PG2D_DS2;
@@ -333,7 +359,7 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 
 	rcar_du_group_set_dpad_levels(rgrp);
 
-	return rcar_du_set_dpad0_vsp1_routing(rgrp->dev);
+	rcar_du_group_setup_defr8(rgrp);
 }
 
 /* -----------------------------------------------------------------------------
@@ -451,20 +477,36 @@ rcar_du_get_new_group_state(struct drm_atomic_state *state,
 int rcar_du_group_atomic_check(struct drm_device *dev,
 			       struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *crtc_state;
+	static const u32 dpad_mask = BIT(RCAR_DU_OUTPUT_DPAD1)
+				   | BIT(RCAR_DU_OUTPUT_DPAD0);
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+		struct rcar_du_crtc_state *old_rcrtc_state;
+		struct rcar_du_crtc_state *new_rcrtc_state;
 		struct rcar_du_group_state *gstate;
 
 		gstate = rcar_du_get_group_state(state, rcrtc->group);
 		if (IS_ERR(gstate))
 			return PTR_ERR(gstate);
 
-		if (crtc_state->active)
+		if (new_crtc_state->active)
 			gstate->enabled = true;
+
+		if (!new_crtc_state->active_changed &&
+		    !new_crtc_state->connectors_changed)
+			continue;
+
+		old_rcrtc_state = to_rcar_crtc_state(old_crtc_state);
+		new_rcrtc_state = to_rcar_crtc_state(new_crtc_state);
+
+		if ((old_rcrtc_state->outputs & dpad_mask) !=
+		    (new_rcrtc_state->outputs & dpad_mask))
+			gstate->dpad_routing_changed = true;
 	}
 
 	return 0;
@@ -484,8 +526,14 @@ void rcar_du_group_atomic_setup(struct drm_device *dev,
 		old_state = to_rcar_group_state(old_pstate);
 		new_state = to_rcar_group_state(new_pstate);
 
-		if (!old_state->enabled && new_state->enabled)
+		if (!new_state->enabled)
+			continue;
+
+		if (!old_state->enabled)
 			rcar_du_group_setup(rgrp);
+
+		if (!old_state->enabled || new_state->dpad_routing_changed)
+			rcar_du_group_set_routing(rgrp);
 	}
 }
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index c6e0ae79ede9..1364e2413095 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -60,11 +60,13 @@ struct rcar_du_group {
  * struct rcar_du_group_state - Driver-specific group state
  * @state: base DRM private state
  * @enabled: true if at least one CRTC in the group is enabled
+ * @dpad_routing_changed: set if CRTC to DPAD output routing has changed
  */
 struct rcar_du_group_state {
 	struct drm_private_state state;
 
 	bool enabled;
+	bool dpad_routing_changed;
 };
 
 #define to_rcar_group_state(s) \
@@ -75,7 +77,6 @@ void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
 
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
 void rcar_du_group_restart(struct rcar_du_group *rgrp);
-int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
 
 int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 8a0c26939de2..bef07bed0fb4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -446,14 +446,14 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
+	unsigned int vspd1_sink = rcdu->vspd1_sink;
+	unsigned int dpad0_source = rcdu->dpad0_source;
 	unsigned int i;
 
 	/*
-	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
-	 * when starting the CRTCs.
+	 * Store RGB routing to DPAD0, the hardware will be configured when
+	 * setting up the groups.
 	 */
-	rcdu->dpad1_source = -1;
-
 	for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
 		struct rcar_du_crtc_state *rcrtc_state =
 			to_rcar_crtc_state(crtc_state);
@@ -461,9 +461,6 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
 			rcdu->dpad0_source = rcrtc->index;
-
-		if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
-			rcdu->dpad1_source = rcrtc->index;
 	}
 
 	/* Apply the atomic update. */
@@ -474,6 +471,11 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	rcar_du_crtc_atomic_modeset(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	if (rcdu->vspd1_sink != vspd1_sink ||
+	    rcdu->dpad0_source != dpad0_source)
+		rcar_du_set_dpad0_vsp1_routing(rcdu);
+
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
 	rcar_du_crtc_atomic_enter_standby(dev, old_state);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 02e5f11f38eb..b6fc4e62fa91 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -552,14 +552,8 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 	if (rcdu->info->gen < 3)
 		rcar_du_plane_setup_scanout(rgrp, state);
 
-	if (state->source == RCAR_DU_PLANE_VSPD1) {
-		unsigned int vspd1_sink = rgrp->index ? 2 : 0;
-
-		if (rcdu->vspd1_sink != vspd1_sink) {
-			rcdu->vspd1_sink = vspd1_sink;
-			rcar_du_set_dpad0_vsp1_routing(rcdu);
-		}
-	}
+	if (state->source == RCAR_DU_PLANE_VSPD1)
+		rcdu->vspd1_sink = rgrp->index ? 2 : 0;
 }
 
 int __rcar_du_plane_atomic_check(struct drm_plane *plane,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
