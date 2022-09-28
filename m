Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC225EE3D7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0626110E53F;
	Wed, 28 Sep 2022 18:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BAA10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 18:05:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqVQW068362;
 Wed, 28 Sep 2022 12:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664387551;
 bh=Q+Z1syeJyeSYHxtQG88vcPW1c2Xx4TdJMkzA4AKdxyM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eUyRx27g/sCVCsoGrptW6SpiYoS+GYQvyC0M2NCYw02oT/OEybv33CQfRQwS0iXJK
 /5l4VYc2joJyj8kFmTNdS2TaXN3iXpWo3kYIA31wRvuxE9ngtJYhUAtXQC3aveEAp/
 mP10d+sRFIXkkN9algGpXSBJQqCercoZBTlk4BPo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SHqVlq071847
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Sep 2022 12:52:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 12:52:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 12:52:30 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqTuc001260;
 Wed, 28 Sep 2022 12:52:30 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v5 4/6] drm/tidss: Add support to configure OLDI mode for
 am625-dss.
Date: Wed, 28 Sep 2022 23:22:21 +0530
Message-ID: <20220928175223.15225-5-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220928175223.15225-1-a-bhatia1@ti.com>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The newer version of DSS (AM625-DSS) has 2 OLDI TXes at its disposal.
These can be configured to support the following modes:

1. OLDI_SINGLE_LINK_SINGLE_MODE
Single Output over OLDI 0.
+------+        +---------+      +-------+
|      |        |         |      |       |
| CRTC +------->+ ENCODER +----->| PANEL |
|      |        |         |      |       |
+------+        +---------+      +-------+

2. OLDI_SINGLE_LINK_CLONE_MODE
Duplicate Output over OLDI 0 and 1.
+------+        +---------+      +-------+
|      |        |         |      |       |
| CRTC +---+--->| ENCODER +----->| PANEL |
|      |   |    |         |      |       |
+------+   |    +---------+      +-------+
	   |
           |    +---------+      +-------+
           |    |         |      |       |
           +--->| ENCODER +----->| PANEL |
                |         |      |       |
                +---------+      +-------+

3. OLDI_DUAL_LINK_MODE
Combined Output over OLDI 0 and 1.
+------+        +---------+      +-------+
|      |        |         +----->|       |
| CRTC +------->+ ENCODER |      | PANEL |
|      |        |         +----->|       |
+------+        +---------+      +-------+

Following the above pathways for different modes, 2 encoder/panel-bridge
pipes get created for clone mode, and 1 pipe in cases of single link and
dual link mode.

Add support for confgure the OLDI modes using of and lvds DRM helper
functions.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c |  11 +++
 drivers/gpu/drm/tidss/tidss_dispc.h |   8 ++
 drivers/gpu/drm/tidss/tidss_drv.h   |   3 +
 drivers/gpu/drm/tidss/tidss_kms.c   | 146 +++++++++++++++++++++++-----
 4 files changed, 145 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 34f0da4bb3e3..88008ad39b55 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -354,6 +354,8 @@ struct dispc_device {
 
 	bool is_enabled;
 
+	enum dispc_oldi_modes oldi_mode;
+
 	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
 
 	u32 *fourccs;
@@ -1958,6 +1960,15 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len)
 	return dispc->fourccs;
 }
 
+int dispc_configure_oldi_mode(struct dispc_device *dispc,
+			      enum dispc_oldi_modes oldi_mode)
+{
+	WARN_ON(!dispc);
+
+	dispc->oldi_mode = oldi_mode;
+	return 0;
+}
+
 static s32 pixinc(int pixels, u8 ps)
 {
 	if (pixels == 1)
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index b66418e583ee..45cce1054832 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -64,6 +64,13 @@ enum dispc_dss_subrevision {
 	DISPC_AM625,
 };
 
+enum dispc_oldi_modes {
+	OLDI_MODE_OFF,				/* OLDI turned off / tied off in IP. */
+	OLDI_SINGLE_LINK_SINGLE_MODE,		/* Single Output over OLDI 0. */
+	OLDI_SINGLE_LINK_CLONE_MODE,		/* Duplicate Output over OLDI 0 and 1. */
+	OLDI_DUAL_LINK_MODE,			/* Combined Output over OLDI 0 and 1. */
+};
+
 struct dispc_features {
 	int min_pclk_khz;
 	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
@@ -131,6 +138,7 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		      u32 hw_videoport);
 int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
+int dispc_configure_oldi_mode(struct dispc_device *dispc, enum dispc_oldi_modes oldi_mode);
 
 int dispc_init(struct tidss_device *tidss);
 void dispc_remove(struct tidss_device *tidss);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index d7f27b0b0315..2252ba0222ca 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -12,6 +12,9 @@
 #define TIDSS_MAX_PORTS 4
 #define TIDSS_MAX_PLANES 4
 
+/* For AM625-DSS with 2 OLDI TXes */
+#define TIDSS_MAX_BRIDGE_PER_PIPE	2
+
 typedef u32 dispc_irq_t;
 
 struct tidss_device {
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 666e527a0acf..73afe390f36d 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -107,32 +107,84 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static int tidss_get_oldi_mode(struct tidss_device *tidss)
+{
+	int pixel_order;
+	struct device_node *dss_ports, *oldi0_port, *oldi1_port;
+
+	dss_ports = of_get_next_child(tidss->dev->of_node, NULL);
+	oldi0_port = of_graph_get_port_by_id(dss_ports, 0);
+	oldi1_port = of_graph_get_port_by_id(dss_ports, 2);
+
+	if (!(oldi0_port && oldi1_port))
+		return OLDI_SINGLE_LINK_SINGLE_MODE;
+
+	/*
+	 * OLDI Ports found for both the OLDI TXes. The DSS is to be configured
+	 * in either Dual Link or Clone Mode.
+	 */
+	pixel_order = drm_of_lvds_get_dual_link_pixel_order(oldi0_port,
+							    oldi1_port);
+	switch (pixel_order) {
+	case -EINVAL:
+		/*
+		 * The dual link properties were not found in at least one of
+		 * the sink nodes. Since 2 OLDI ports are present in the DT, it
+		 * can be safely assumed that the required configuration is
+		 * Clone Mode.
+		 */
+		return OLDI_SINGLE_LINK_CLONE_MODE;
+
+	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
+		/*
+		 * Note that the OLDI TX 0 transmits the odd set of pixels while
+		 * the OLDI TX 1 transmits the even set. This is a fixed
+		 * configuration in the IP and an cannot be change vis SW. These
+		 * properties have been used to merely identify if a Dual Link
+		 * configuration is required. Swapping this property in the panel
+		 * port DT nodes will not make any difference.
+		 */
+		return OLDI_DUAL_LINK_MODE;
+
+	default:
+		return OLDI_MODE_OFF;
+	}
+}
+
 static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
 	unsigned int fourccs_len;
 	const u32 *fourccs = dispc_plane_formats(tidss->dispc, &fourccs_len);
-	unsigned int i;
+	unsigned int i, j;
 
 	struct pipe {
 		u32 hw_videoport;
-		struct drm_bridge *bridge;
+		struct drm_bridge *bridge[TIDSS_MAX_BRIDGE_PER_PIPE];
 		u32 enc_type;
+		u32 num_bridges;
 	};
 
 	const struct dispc_features *feat = tidss->feat;
-	u32 max_vps = feat->num_vps;
+	u32 max_ports = feat->num_max_ports;
 	u32 max_planes = feat->num_planes;
 
 	struct pipe pipes[TIDSS_MAX_PORTS];
 	u32 num_pipes = 0;
+	u32 pipe_number = 0;
 	u32 crtc_mask;
+	u32 num_oldi = 0;
+	u32 oldi0_port = 0;
+	u32 hw_vp = 0;
+	enum dispc_oldi_modes oldi_mode;
 
 	/* first find all the connected panels & bridges */
 
-	for (i = 0; i < max_vps; i++) {
+	for (i = 0; i < max_ports; i++) {
 		struct drm_panel *panel;
 		struct drm_bridge *bridge;
+		bool bridge_req = true;
 		u32 enc_type = DRM_MODE_ENCODER_NONE;
 		int ret;
 
@@ -146,6 +198,11 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			return ret;
 		}
 
+		/* default number of bridges required for a panel/bridge*/
+		pipe_number = num_pipes;
+		pipes[pipe_number].num_bridges = 1;
+		hw_vp = i;
+
 		if (panel) {
 			u32 conn_type;
 
@@ -155,7 +212,43 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			case DISPC_VP_OLDI:
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
+
+				/*
+				 * A single DSS controller cannot support 2
+				 * independent displays. If 2nd node is detected,
+				 * it is for Dual Link Mode or Clone Mode.
+				 *
+				 * A new pipe instance is not required.
+				 */
+				if (++num_oldi == 2) {
+					pipe_number = oldi0_port;
+					hw_vp = i;
+
+					/* 2nd OLDI DT node detected. Get its mode */
+					oldi_mode = tidss_get_oldi_mode(tidss);
+					bridge_req = false;
+
+					/*
+					 * A separate panel bridge will only be
+					 * required if 2 panels are connected for
+					 * the OLDI Clone Mode.
+					 */
+					if (oldi_mode == OLDI_SINGLE_LINK_CLONE_MODE) {
+						bridge_req = true;
+						(pipes[pipe_number].num_bridges)++;
+					}
+				} else {
+					/*
+					 * First OLDI DT node detected. Save it
+					 * in case there is another node for Dual
+					 * Link Mode or Clone Mode.
+					 */
+					oldi0_port = i;
+					oldi_mode = OLDI_SINGLE_LINK_SINGLE_MODE;
+				}
+				dispc_configure_oldi_mode(tidss->dispc, oldi_mode);
 				break;
+
 			case DISPC_VP_DPI:
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
@@ -173,19 +266,23 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				return -EINVAL;
 			}
 
-			bridge = devm_drm_panel_bridge_add(dev, panel);
-			if (IS_ERR(bridge)) {
-				dev_err(dev,
-					"failed to set up panel bridge for port %d\n",
-					i);
-				return PTR_ERR(bridge);
+			if (bridge_req) {
+				bridge = devm_drm_panel_bridge_add(dev, panel);
+				if (IS_ERR(bridge)) {
+					dev_err(dev,
+						"failed to set up panel bridge for port %d\n",
+						i);
+					return PTR_ERR(bridge);
+				}
 			}
 		}
 
-		pipes[num_pipes].hw_videoport = i;
-		pipes[num_pipes].bridge = bridge;
-		pipes[num_pipes].enc_type = enc_type;
-		num_pipes++;
+		if (bridge_req) {
+			pipes[pipe_number].hw_videoport = hw_vp;
+			pipes[pipe_number].bridge[pipes[pipe_number].num_bridges - 1] = bridge;
+			pipes[pipe_number].enc_type = enc_type;
+			num_pipes++;
+		}
 	}
 
 	/* all planes can be on any crtc */
@@ -200,6 +297,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 		int ret;
 
+		/* Creating planes and CRTCs only for real pipes */
 		tplane = tidss_plane_create(tidss, hw_plane_id,
 					    DRM_PLANE_TYPE_PRIMARY, crtc_mask,
 					    fourccs, fourccs_len);
@@ -219,16 +317,18 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
 
-		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
-					   1 << tcrtc->crtc.index);
-		if (IS_ERR(enc)) {
-			dev_err(tidss->dev, "encoder create failed\n");
-			return PTR_ERR(enc);
-		}
+		for (j = 0; j < pipes[i].num_bridges; j++) {
+			enc = tidss_encoder_create(tidss, pipes[i].enc_type,
+						   1 << tcrtc->crtc.index);
+			if (IS_ERR(enc)) {
+				dev_err(tidss->dev, "encoder create failed\n");
+				return PTR_ERR(enc);
+			}
 
-		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
-		if (ret)
-			return ret;
+			ret = drm_bridge_attach(enc, pipes[i].bridge[j], NULL, 0);
+			if (ret)
+				return ret;
+		}
 	}
 
 	/* create overlay planes of the leftover planes */
-- 
2.37.0

