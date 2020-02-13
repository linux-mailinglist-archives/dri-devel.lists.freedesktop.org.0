Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6C15CB3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 20:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC696F63C;
	Thu, 13 Feb 2020 19:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD886F63C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 19:37:24 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DJbKZw104610;
 Thu, 13 Feb 2020 13:37:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581622640;
 bh=91hHX1/v1vPPVItzUObCMbgYi+e+gCcX3sD27ocl7uU=;
 h=From:To:CC:Subject:Date;
 b=yBxwziw+5YS83+7XKqbTn9baELFoHtOZ7fYywoFX7MZ2noMhtvRO3VMPimBtjq9Q/
 N8tls8mReXbvzbq0ifANDqsrgYnZSYZkbWCB/Rf6/SZrMEo60VKfEOUeu2tByrvM6c
 snH1B+I1CaWpiXony783Fwn3eGl9MdFKWmar0ajg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DJbKjk074468
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Feb 2020 13:37:20 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 13:37:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 13:37:20 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DJbHTr080536;
 Thu, 13 Feb 2020 13:37:18 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4] drm/tidss: dispc: Rewrite naive plane positioning code
Date: Thu, 13 Feb 2020 21:37:17 +0200
Message-ID: <20200213193717.24551-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The old implementation of placing planes on the CRTC while configuring
the planes was naive and relied on the order in which the planes were
configured, enabled, and disabled. The situation where a plane's zpos
was changed on the fly was completely broken. The usual symptoms of
this problem was scrambled display and a flood of sync lost errors,
when a plane was active in two layers at the same time, or a missing
plane, in case when a layer was accidentally disabled.

The rewrite takes a more straight forward approach when HW is
concerned. The plane positioning registers are in the CRTC (or
actually OVR) register space and it is more natural to configure them
in a one go when configuring the CRTC. To do this we need make sure we
have all the planes on the updated CRTCs in the new atomic state. The
untouched planes on CRTCs that need plane position update are added to
the atomic state in tidss_atomic_check().

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 55 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_crtc.h  |  2 ++
 drivers/gpu/drm/tidss/tidss_dispc.c | 55 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  5 +++
 drivers/gpu/drm/tidss/tidss_kms.c   | 49 ++++++++++++++++++++++++-
 5 files changed, 130 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 032c31ee2820..631ec61b086a 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -17,6 +17,7 @@
 #include "tidss_dispc.h"
 #include "tidss_drv.h"
 #include "tidss_irq.h"
+#include "tidss_plane.h"
 
 /* Page flip and frame done IRQs */
 
@@ -111,6 +112,54 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 	return dispc_vp_bus_check(dispc, hw_videoport, state);
 }
 
+/*
+ * This needs all affected planes to be present in the atomic
+ * state. The untouched planes are added to the state in
+ * tidss_atomic_check().
+ */
+static void tidss_crtc_position_planes(struct tidss_device *tidss,
+				       struct drm_crtc *crtc,
+				       struct drm_crtc_state *old_state,
+				       bool newmodeset)
+{
+	struct drm_atomic_state *ostate = old_state->state;
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+	struct drm_crtc_state *cstate = crtc->state;
+	int zpos;
+
+	if (!newmodeset && !cstate->zpos_changed &&
+	    !to_tidss_crtc_state(cstate)->plane_pos_changed)
+		return;
+
+	for (zpos = 0; zpos < tidss->feat->num_planes; zpos++) {
+		struct drm_plane_state *pstate;
+		struct drm_plane *plane;
+		bool zpos_taken = false;
+		int i;
+
+		for_each_new_plane_in_state(ostate, plane, pstate, i) {
+			if (pstate->crtc != crtc || !pstate->visible)
+				continue;
+
+			if (pstate->normalized_zpos == zpos) {
+				zpos_taken = true;
+				break;
+			}
+		}
+
+		if (zpos_taken) {
+			struct tidss_plane *tplane = to_tidss_plane(plane);
+
+			dispc_ovr_set_plane(tidss->dispc, tplane->hw_plane_id,
+					    tcrtc->hw_videoport,
+					    pstate->crtc_x, pstate->crtc_y,
+					    zpos);
+		}
+		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, zpos,
+				       zpos_taken);
+	}
+}
+
 static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_crtc_state)
 {
@@ -146,6 +195,9 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	/* Write vp properties to HW if needed. */
 	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, false);
 
+	/* Update plane positions if needed. */
+	tidss_crtc_position_planes(tidss, crtc, old_crtc_state, false);
+
 	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
 	spin_lock_irqsave(&ddev->event_lock, flags);
@@ -183,6 +235,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 
 	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, true);
+	tidss_crtc_position_planes(tidss, crtc, old_state, true);
 
 	/* Turn vertical blanking interrupt reporting on. */
 	drm_crtc_vblank_on(crtc);
@@ -318,6 +371,8 @@ static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
 
+	state->plane_pos_changed = false;
+
 	state->bus_format = current_state->bus_format;
 	state->bus_flags = current_state->bus_flags;
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.h b/drivers/gpu/drm/tidss/tidss_crtc.h
index df9d90b1ad2d..09e773666228 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.h
+++ b/drivers/gpu/drm/tidss/tidss_crtc.h
@@ -32,6 +32,8 @@ struct tidss_crtc_state {
 	/* Must be first. */
 	struct drm_crtc_state base;
 
+	bool plane_pos_changed;
+
 	u32 bus_format;
 	u32 bus_flags;
 };
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index eeb160dc047b..e79dad246b1e 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -281,11 +281,6 @@ struct dss_vp_data {
 	u32 *gamma_table;
 };
 
-struct dss_plane_data {
-	u32 zorder;
-	u32 hw_videoport;
-};
-
 struct dispc_device {
 	struct tidss_device *tidss;
 	struct device *dev;
@@ -307,8 +302,6 @@ struct dispc_device {
 
 	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
 
-	struct dss_plane_data plane_data[TIDSS_MAX_PLANES];
-
 	u32 *fourccs;
 	u32 num_fourccs;
 
@@ -1247,7 +1240,7 @@ int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 /* OVR */
 static void dispc_k2g_ovr_set_plane(struct dispc_device *dispc,
 				    u32 hw_plane, u32 hw_videoport,
-				    u32 x, u32 y, u32 zpos)
+				    u32 x, u32 y, u32 layer)
 {
 	/* On k2g there is only one plane and no need for ovr */
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_K2G_POSITION,
@@ -1256,44 +1249,43 @@ static void dispc_k2g_ovr_set_plane(struct dispc_device *dispc,
 
 static void dispc_am65x_ovr_set_plane(struct dispc_device *dispc,
 				      u32 hw_plane, u32 hw_videoport,
-				      u32 x, u32 y, u32 zpos)
+				      u32 x, u32 y, u32 layer)
 {
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			hw_plane, 4, 1);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			x, 17, 6);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			y, 30, 19);
 }
 
 static void dispc_j721e_ovr_set_plane(struct dispc_device *dispc,
 				      u32 hw_plane, u32 hw_videoport,
-				      u32 x, u32 y, u32 zpos)
+				      u32 x, u32 y, u32 layer)
 {
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			hw_plane, 4, 1);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer),
 			x, 13, 0);
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(zpos),
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES2(layer),
 			y, 29, 16);
 }
 
-static void dispc_ovr_set_plane(struct dispc_device *dispc,
-				u32 hw_plane, u32 hw_videoport,
-				u32 x, u32 y, u32 zpos)
+void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
+			 u32 hw_videoport, u32 x, u32 y, u32 layer)
 {
 	switch (dispc->feat->subrev) {
 	case DISPC_K2G:
 		dispc_k2g_ovr_set_plane(dispc, hw_plane, hw_videoport,
-					x, y, zpos);
+					x, y, layer);
 		break;
 	case DISPC_AM65X:
 		dispc_am65x_ovr_set_plane(dispc, hw_plane, hw_videoport,
-					  x, y, zpos);
+					  x, y, layer);
 		break;
 	case DISPC_J721E:
 		dispc_j721e_ovr_set_plane(dispc, hw_plane, hw_videoport,
-					  x, y, zpos);
+					  x, y, layer);
 		break;
 	default:
 		WARN_ON(1);
@@ -1301,10 +1293,13 @@ static void dispc_ovr_set_plane(struct dispc_device *dispc,
 	}
 }
 
-static void dispc_ovr_enable_plane(struct dispc_device *dispc,
-				   u32 hw_videoport, u32 zpos, bool enable)
+void dispc_ovr_enable_layer(struct dispc_device *dispc,
+			    u32 hw_videoport, u32 layer, bool enable)
 {
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	if (dispc->feat->subrev == DISPC_K2G)
+		return;
+
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			!!enable, 0, 0);
 }
 
@@ -2070,21 +2065,11 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, 0,
 				28, 28);
 
-	dispc_ovr_set_plane(dispc, hw_plane, hw_videoport,
-			    state->crtc_x, state->crtc_y,
-			    state->normalized_zpos);
-
-	dispc->plane_data[hw_plane].zorder = state->normalized_zpos;
-	dispc->plane_data[hw_plane].hw_videoport = hw_videoport;
-
 	return 0;
 }
 
 int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable)
 {
-	dispc_ovr_enable_plane(dispc, dispc->plane_data[hw_plane].hw_videoport,
-			       dispc->plane_data[hw_plane].zorder, enable);
-
 	VID_REG_FLD_MOD(dispc, hw_plane, DISPC_VID_ATTRIBUTES, !!enable, 0, 0);
 
 	return 0;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index e65e6a2bb821..a4a68249e44b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -94,6 +94,11 @@ extern const struct dispc_features dispc_j721e_feats;
 void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
 dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
 
+void dispc_ovr_set_plane(struct dispc_device *dispc, u32 hw_plane,
+			 u32 hw_videoport, u32 x, u32 y, u32 layer);
+void dispc_ovr_enable_layer(struct dispc_device *dispc,
+			    u32 hw_videoport, u32 layer, bool enable);
+
 void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 		      const struct drm_crtc_state *state);
 void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 5311e0f1c551..24b3f02b90c6 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -47,9 +47,56 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = tidss_atomic_commit_tail,
 };
 
+static int tidss_atomic_check(struct drm_device *ddev,
+			      struct drm_atomic_state *state)
+{
+	struct drm_plane_state *opstate;
+	struct drm_plane_state *npstate;
+	struct drm_plane *plane;
+	struct drm_crtc_state *cstate;
+	struct drm_crtc *crtc;
+	int ret, i;
+
+	ret = drm_atomic_helper_check(ddev, state);
+	if (ret)
+		return ret;
+
+	/*
+	 * If a plane on a CRTC changes add all active planes on that
+	 * CRTC to the atomic state. This is needed for updating the
+	 * plane positions in tidss_crtc_position_planes() which is
+	 * called from crtc_atomic_enable() and crtc_atomic_flush().
+	 * The update is needed for x,y-position changes too, so
+	 * zpos_changed condition is not enough and we need add the
+	 * our own plane_pos_changed flag.
+	 */
+	for_each_oldnew_plane_in_state(state, plane, opstate, npstate, i) {
+		if (npstate->crtc && npstate->visible &&
+		    (!opstate->crtc ||
+		     opstate->crtc_x != npstate->crtc_x ||
+		     opstate->crtc_y != npstate->crtc_y)) {
+			cstate = drm_atomic_get_crtc_state(state,
+							   npstate->crtc);
+			if (IS_ERR(cstate))
+				return PTR_ERR(cstate);
+			to_tidss_crtc_state(cstate)->plane_pos_changed = true;
+		}
+	}
+	for_each_new_crtc_in_state(state, crtc, cstate, i) {
+		if (to_tidss_crtc_state(cstate)->plane_pos_changed ||
+		    cstate->zpos_changed) {
+			ret = drm_atomic_add_affected_planes(state, crtc);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = tidss_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
