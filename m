Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84E1D3470
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8046E356;
	Thu, 14 May 2020 15:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5166E358
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:07:10 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A58925A;
 Thu, 14 May 2020 17:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589468828;
 bh=83DPXqioN1gtzgfPxCZSiI+wuwVUU2ki93cqE2St27s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLSyG/jj/Rk+dFhGENJ63zVjHFkemzGoU0Jg+xpWVINx0BUvQ/ICjfDnmlHkgGBoS
 4tNLYg06t+TeiQgsC8dwy6FSPv7DO9Tbu0h1cGYl7wjeVc6neuxj2dQfh08w44CdEG
 MtWosP0jR0I8Wyg6hkyrLik7WTivZO0wevdBc3kM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: rcar-du: Configure pixel clock polarity
Date: Thu, 14 May 2020 18:06:57 +0300
Message-Id: <20200514150657.25431-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514150657.25431-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200514150657.25431-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The R-Car DU supports inverting the polarity of the output pixel clock.
At the moment the driver hardcodes the clock polarity to drive signals
on the rising edge of the clock. Configure it instead based on the needs
of the display pipeline.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 31 +++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  2 ++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index fbe927278634..e86b3192a991 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -212,6 +212,8 @@ static const struct soc_device_attribute rcar_du_r8a7795_es1[] = {
 
 static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 {
+	const struct rcar_du_crtc_state *state =
+		to_rcar_crtc_state(rcrtc->crtc.state);
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
 	struct rcar_du_device *rcdu = rcrtc->dev;
 	unsigned long mode_clock = mode->clock * 1000;
@@ -286,6 +288,9 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		escr = params.escr;
 	}
 
+	if (state->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		escr |= ESCR_DCLKOINV;
+
 	dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
 
 	rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
@@ -684,6 +689,8 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 				     struct drm_crtc_state *state)
 {
+	const unsigned int bus_flags_mask = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
+					  | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
 	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
@@ -694,11 +701,15 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	/* Store the routes from the CRTC output to the DU outputs. */
+	/*
+	 * Store the routes from the CRTC output to the DU outputs and validate
+	 * the bus flags.
+	 */
 	rstate->outputs = 0;
 
 	for_each_new_connector_in_state(state->state, connector, conn_state, i) {
 		struct drm_encoder *encoder = conn_state->best_encoder;
+		struct drm_bridge *bridge;
 
 		if (!encoder)
 			continue;
@@ -708,8 +719,22 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 			continue;
 
 		rstate->outputs |= BIT(to_rcar_encoder(encoder)->output);
+
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+		if (bridge && bridge->timings)
+			rstate->bus_flags |= bridge->timings->input_bus_flags;
+		else
+			rstate->bus_flags |= connector->display_info.bus_flags;
 	}
 
+	/*
+	 * If multiple connectors require different clock edges the
+	 * configuration is invalid.
+	 */
+	if (rstate->bus_flags == bus_flags_mask)
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -944,6 +969,8 @@ rcar_du_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &copy->state);
 
+	copy->bus_flags = 0;
+
 	return &copy->state;
 }
 
@@ -979,6 +1006,8 @@ static void rcar_du_crtc_reset(struct drm_crtc *crtc)
 	state->crc.source = VSP1_DU_CRC_NONE;
 	state->crc.index = 0;
 
+	state->bus_flags = 0;
+
 	crtc->state = &state->state;
 	crtc->state->crtc = crtc;
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..652b798154ff 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -83,12 +83,14 @@ struct rcar_du_crtc {
  * @state: base DRM CRTC state
  * @crc: CRC computation configuration
  * @outputs: bitmask of the outputs (enum rcar_du_output) driven by this CRTC
+ * @bus_flags: signal polarities for the CRTC output bus (DRM_BUS_FLAG_*)
  */
 struct rcar_du_crtc_state {
 	struct drm_crtc_state state;
 
 	struct vsp1_du_crc_config crc;
 	unsigned int outputs;
+	unsigned int bus_flags;
 };
 
 #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state, state)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
