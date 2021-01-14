Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F012F65B0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15896E08C;
	Thu, 14 Jan 2021 16:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423DB89F41
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:11 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE638FDB;
 Thu, 14 Jan 2021 17:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641448;
 bh=fP5KKc5tyrHk0EOKBNwhOcakxu2ma05NgfV8e3gGWI0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u10z3IZ63Gk1Q4nfEfG4NI5iFBsev/Ki4RX3Dmq/cX1Hp1X7DXzhiQj7MbXfqWiTw
 QzfOTO+cwx9X50VQbP/VGrJ5AJw/AmbA/HRmous4xcMjJkTXJwapqYCI8iZRJaZ/Sf
 hqJlM1eVB1BJBK2UpyfOkRBGDIM/QoEnP7Ci6fJg=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 05/10] drm: rcar-du: Handle CRTC standby from commit tail
 handler
Date: Thu, 14 Jan 2021 16:22:50 +0000
Message-Id: <20210114162255.705868-6-kieran.bingham+renesas@ideasonboard.com>
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

Manage the power state, and initial configuration of the CRTC from the
commit tail handler. CRTCs which need to be activated are taken out of
standby, and any deactivated CRTCs are put into standby.

This aims at removing CRTC state tracking from the rcar_du_crtc
structure. The initial configuration of the CRTC background colours and
disabling of all planes is taken out of rcar_du_crtc_setup() and moved
inline into rcar_du_crtc_enable(). rcar_du_crtc_get() and
rcar_du_crtc_put() are kept as they are needed to configure the VSP at
the correct time, this will be addressed in a separate change.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Add more documentation
- Keep rcar_du_crtc_get() and rcar_du_crtc_put()
- Renamed rcar_du_crtc_enable() to rcar_du_crtc_exit_standby() and
  rcar_du_crtc_disable() to rcar_du_crtc_enter_standby()
- Reword commit message

Changes since v1:

- Registers sequence confirmed unchanged
- Re-ordered in the series to handle before groups
- Do not merge rcar_du_crtc_setup() (now handled by _crtc_pre_commit)

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 90 ++++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  5 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  4 ++
 3 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 53838dde2f29..55c0e0259153 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -521,17 +521,10 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
 
 static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 {
-	/* Set display off and background to black */
-	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
-	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
-
 	/* Configure display timings and output routing */
 	rcar_du_crtc_set_display_timing(rcrtc);
 	rcar_du_group_set_routing(rcrtc->group);
 
-	/* Start with all planes disabled. */
-	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
-
 	/* Enable the VSP compositor. */
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
 		rcar_du_vsp_modeset(rcrtc);
@@ -542,17 +535,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 	drm_crtc_vblank_on(&rcrtc->crtc);
 }
 
-static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
+static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 {
 	int ret;
 
-	/*
-	 * Guard against double-get, as the function is called from both the
-	 * .atomic_enable() and .atomic_begin() handlers.
-	 */
-	if (rcrtc->initialized)
-		return 0;
-
 	ret = clk_prepare_enable(rcrtc->clock);
 	if (ret < 0)
 		return ret;
@@ -565,8 +551,12 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	if (ret < 0)
 		goto error_group;
 
-	rcar_du_crtc_setup(rcrtc);
-	rcrtc->initialized = true;
+	/* Set display off and background to black. */
+	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
+	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
+
+	/* Start with all planes disabled. */
+	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
 	return 0;
 
@@ -577,13 +567,29 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	return ret;
 }
 
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 {
 	rcar_du_group_put(rcrtc->group);
 
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
+}
+
+static void rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
+{
+	/*
+	 * Guard against double-get, as the function is called from both the
+	 * .atomic_enable() and .atomic_begin() handlers.
+	 */
+	if (rcrtc->initialized)
+		return;
+
+	rcar_du_crtc_setup(rcrtc);
+	rcrtc->initialized = true;
+}
 
+static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+{
 	rcrtc->initialized = false;
 }
 
@@ -714,6 +720,54 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+/*
+ * Take all CRTCs that are made active in this commit out of standby.
+ * CRTCs that are deactivated by the commit are untouched and will be
+ * put in standby by rcar_du_crtc_atomic_enter_standby().
+ */
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+	int ret;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && crtc_state->active) {
+			ret = rcar_du_crtc_exit_standby(rcrtc);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Put all CRTCs that have been deactivated by this commit in standby.
+ * This shall be called at the end of the commit tail handler as the
+ * last operation that touches the CRTC hardware.
+ */
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && !crtc_state->active)
+			rcar_du_crtc_enter_standby(rcrtc);
+	}
+
+	return 0;
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..7ff0618b9998 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -109,6 +109,11 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state);
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state);
+
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
 #endif /* __RCAR_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fdb8a0d127ad..ff50316b87b5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -462,11 +462,15 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	}
 
 	/* Apply the atomic update. */
+	rcar_du_crtc_atomic_exit_standby(dev, old_state);
+
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	rcar_du_crtc_atomic_enter_standby(dev, old_state);
+
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
