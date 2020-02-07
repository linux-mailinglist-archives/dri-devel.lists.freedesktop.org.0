Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCB155DC9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 19:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0A6E0ED;
	Fri,  7 Feb 2020 18:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396A26E0ED
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 18:18:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017IIRjR059437;
 Fri, 7 Feb 2020 12:18:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581099507;
 bh=261ENHz1zbsDOw/czWJgOnQ9iTTk1Vg1J8DPQk0yV6o=;
 h=From:To:CC:Subject:Date;
 b=AB9rIvf0J5DU1FYEqTO+8qEVZvy6hHMiAbffu0yUCBMxK3S8v4RAJ6y59U1KwwCNI
 9BDRZLn5PkY2sc5wE7yatFRj3NlbHFc9kPjQmPwWEraVOuhzl65Ifao1okfmYVMM7b
 rFbPLJQwyUmK3pCBOsRKVPlb+6/SHf7I/qErp/ZU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017IIRPc004996
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Feb 2020 12:18:27 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 7 Feb
 2020 12:18:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 7 Feb 2020 12:18:27 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017IIOp3079316;
 Fri, 7 Feb 2020 12:18:25 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Date: Fri, 7 Feb 2020 20:18:24 +0200
Message-ID: <20200207181824.7233-1-jsarha@ti.com>
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
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
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

The rewrite takes a more straight forward approach when when HW is
concerned. The plane positioning registers are in the CRTC (or
actually OVR) register space and it is more natural to configure them
in a one go when configuring the CRTC. This is easy since we have
access to the whole atomic state when updating the CRTC configuration.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c | 66 ++++++++++++++++++++---------
 2 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 032c31ee2820..367efdebe2f8 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -143,7 +143,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (WARN_ON(!crtc->state->event))
 		return;
 
-	/* Write vp properties to HW if needed. */
+	/* Write vp properties and plane positions to HW if needed. */
 	dispc_vp_setup(tidss->dispc, tcrtc->hw_videoport, crtc->state, false);
 
 	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index eeb160dc047b..cfc230d2a88a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -281,11 +282,6 @@ struct dss_vp_data {
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
@@ -307,8 +303,6 @@ struct dispc_device {
 
 	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
 
-	struct dss_plane_data plane_data[TIDSS_MAX_PLANES];
-
 	u32 *fourccs;
 	u32 num_fourccs;
 
@@ -1301,13 +1295,54 @@ static void dispc_ovr_set_plane(struct dispc_device *dispc,
 	}
 }
 
-static void dispc_ovr_enable_plane(struct dispc_device *dispc,
-				   u32 hw_videoport, u32 zpos, bool enable)
+static void dispc_ovr_enable_layer(struct dispc_device *dispc,
+				   u32 hw_videoport, u32 layer, bool enable)
 {
-	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(zpos),
+	if (dispc->feat->subrev == DISPC_K2G)
+		return;
+
+	OVR_REG_FLD_MOD(dispc, hw_videoport, DISPC_OVR_ATTRIBUTES(layer),
 			!!enable, 0, 0);
 }
 
+static void dispc_vp_position_planes(struct dispc_device *dispc,
+				     u32 hw_videoport,
+				     const struct drm_crtc_state *cstate,
+				     bool newmodeset)
+{
+	struct drm_device *ddev = &dispc->tidss->ddev;
+	int zpos;
+
+	if (!cstate->zpos_changed && !cstate->planes_changed && !newmodeset)
+		return;
+
+	for (zpos = 0; zpos < dispc->feat->num_planes; zpos++) {
+		struct drm_plane *plane;
+		bool zpos_taken = false;
+
+		drm_for_each_plane_mask(plane, ddev, cstate->plane_mask) {
+			if (WARN_ON(!plane->state))
+				continue;
+
+			if (plane->state->normalized_zpos == zpos) {
+				zpos_taken = true;
+				break;
+			}
+		}
+
+		if (zpos_taken) {
+			struct tidss_plane *tplane = to_tidss_plane(plane);
+			const struct drm_plane_state *pstate = plane->state;
+
+			dispc_ovr_set_plane(dispc, tplane->hw_plane_id,
+					    hw_videoport,
+					    pstate->crtc_x, pstate->crtc_y,
+					    zpos);
+		}
+		dispc_ovr_enable_layer(dispc, hw_videoport, zpos, zpos_taken);
+	}
+}
+
 /* CSC */
 enum csc_ctm {
 	CSC_RR, CSC_RG, CSC_RB,
@@ -2070,21 +2105,11 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
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
@@ -2566,6 +2591,7 @@ void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
 {
 	dispc_vp_set_default_color(dispc, hw_videoport, 0);
 	dispc_vp_set_color_mgmt(dispc, hw_videoport, state, newmodeset);
+	dispc_vp_position_planes(dispc, hw_videoport, state, newmodeset);
 }
 
 int dispc_runtime_suspend(struct dispc_device *dispc)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
