Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AD582A5D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D644A375B;
	Wed, 27 Jul 2022 16:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFC91965D1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:08:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; d="scan'208";a="129334782"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4554340183E9;
 Thu, 28 Jul 2022 01:08:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 08/10] drm: rcar-du: Add rcar_du_lib_vsps_init()
Date: Wed, 27 Jul 2022 17:07:51 +0100
Message-Id: <20220727160753.1774761-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add rcar_du_lib_vsps_init() to RCar DU kms lib to handle both
rcar_du_vsp_init() and rzg2l_du_vsp_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 88 +---------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 89 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  5 ++
 3 files changed, 95 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index b3ebe694be6e..73269b7e067e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -74,92 +74,6 @@ static const struct drm_mode_config_funcs rcar_du_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
-{
-	const struct device_node *np = rcdu->dev->of_node;
-	const char *vsps_prop_name = "renesas,vsps";
-	struct of_phandle_args args;
-	struct {
-		struct device_node *np;
-		unsigned int crtcs_mask;
-	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
-	unsigned int vsps_count = 0;
-	unsigned int cells;
-	unsigned int i;
-	int ret;
-
-	/*
-	 * First parse the DT vsps property to populate the list of VSPs. Each
-	 * entry contains a pointer to the VSP DT node and a bitmask of the
-	 * connected DU CRTCs.
-	 */
-	ret = of_property_count_u32_elems(np, vsps_prop_name);
-	if (ret < 0) {
-		/* Backward compatibility with old DTBs. */
-		vsps_prop_name = "vsps";
-		ret = of_property_count_u32_elems(np, vsps_prop_name);
-	}
-	cells = ret / rcdu->num_crtcs - 1;
-	if (cells > 1)
-		return -EINVAL;
-
-	for (i = 0; i < rcdu->num_crtcs; ++i) {
-		unsigned int j;
-
-		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
-						       cells, i, &args);
-		if (ret < 0)
-			goto error;
-
-		/*
-		 * Add the VSP to the list or update the corresponding existing
-		 * entry if the VSP has already been added.
-		 */
-		for (j = 0; j < vsps_count; ++j) {
-			if (vsps[j].np == args.np)
-				break;
-		}
-
-		if (j < vsps_count)
-			of_node_put(args.np);
-		else
-			vsps[vsps_count++].np = args.np;
-
-		vsps[j].crtcs_mask |= BIT(i);
-
-		/*
-		 * Store the VSP pointer and pipe index in the CRTC. If the
-		 * second cell of the 'renesas,vsps' specifier isn't present,
-		 * default to 0 to remain compatible with older DT bindings.
-		 */
-		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
-		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
-	}
-
-	/*
-	 * Then initialize all the VSPs from the node pointers and CRTCs bitmask
-	 * computed previously.
-	 */
-	for (i = 0; i < vsps_count; ++i) {
-		struct rcar_du_vsp *vsp = &rcdu->vsps[i];
-
-		vsp->index = i;
-		vsp->dev = rcdu;
-
-		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
-		if (ret < 0)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
-		of_node_put(vsps[i].np);
-
-	return ret;
-}
-
 static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
@@ -331,7 +245,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Initialize the compositors. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-		ret = rcar_du_vsps_init(rcdu);
+		ret = rcar_du_lib_vsps_init(rcdu, rcar_du_vsp_init);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
index a56f3d6db321..c9fa4d1c78fd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -633,3 +633,92 @@ int rcar_du_properties_init(struct rcar_du_device *rcdu)
 
 	return 0;
 }
+
+int rcar_du_lib_vsps_init(struct rcar_du_device *rcdu,
+			  int (*rcar_du_vsp_init_fn)(struct rcar_du_vsp *vsp,
+						     struct device_node *np,
+						     unsigned int crtcs))
+{
+	const struct device_node *np = rcdu->dev->of_node;
+	const char *vsps_prop_name = "renesas,vsps";
+	struct of_phandle_args args;
+	struct {
+		struct device_node *np;
+		unsigned int crtcs_mask;
+	} vsps[RCAR_DU_MAX_VSPS] = { { NULL, }, };
+	unsigned int vsps_count = 0;
+	unsigned int cells;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * First parse the DT vsps property to populate the list of VSPs. Each
+	 * entry contains a pointer to the VSP DT node and a bitmask of the
+	 * connected DU CRTCs.
+	 */
+	ret = of_property_count_u32_elems(np, vsps_prop_name);
+	if (ret < 0) {
+		/* Backward compatibility with old DTBs. */
+		vsps_prop_name = "vsps";
+		ret = of_property_count_u32_elems(np, vsps_prop_name);
+	}
+	cells = ret / rcdu->num_crtcs - 1;
+	if (cells > 1)
+		return -EINVAL;
+
+	for (i = 0; i < rcdu->num_crtcs; ++i) {
+		unsigned int j;
+
+		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
+						       cells, i, &args);
+		if (ret < 0)
+			goto error;
+
+		/*
+		 * Add the VSP to the list or update the corresponding existing
+		 * entry if the VSP has already been added.
+		 */
+		for (j = 0; j < vsps_count; ++j) {
+			if (vsps[j].np == args.np)
+				break;
+		}
+
+		if (j < vsps_count)
+			of_node_put(args.np);
+		else
+			vsps[vsps_count++].np = args.np;
+
+		vsps[j].crtcs_mask |= BIT(i);
+
+		/*
+		 * Store the VSP pointer and pipe index in the CRTC. If the
+		 * second cell of the 'renesas,vsps' specifier isn't present,
+		 * default to 0 to remain compatible with older DT bindings.
+		 */
+		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
+		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
+	}
+
+	/*
+	 * Then initialize all the VSPs from the node pointers and CRTCs bitmask
+	 * computed previously.
+	 */
+	for (i = 0; i < vsps_count; ++i) {
+		struct rcar_du_vsp *vsp = &rcdu->vsps[i];
+
+		vsp->index = i;
+		vsp->dev = rcdu;
+
+		ret = rcar_du_vsp_init_fn(vsp, vsps[i].np, vsps[i].crtcs_mask);
+		if (ret < 0)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
+		of_node_put(vsps[i].np);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
index b04c42bbae5c..fc3aa1a3be89 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -54,4 +54,9 @@ int rcar_du_encoders_init(struct rcar_du_device *rcdu,
 
 int rcar_du_properties_init(struct rcar_du_device *rcdu);
 
+int rcar_du_lib_vsps_init(struct rcar_du_device *rcdu,
+			  int (*rcar_du_vsp_init_fn)(struct rcar_du_vsp *vsp,
+						     struct device_node *np,
+						     unsigned int crtcs));
+
 #endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

