Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6685630FD3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDAB10E273;
	Sat, 19 Nov 2022 17:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D64E10E265
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUQFi061510;
 Sat, 19 Nov 2022 11:30:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668879026;
 bh=MmQDSndL+oPTUzZotxLcg5udeYBFarHX7zG4rAsSAEU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=AOQy6Yo2TTwHxhBF7VBg8+J8Nxq+/RkD81WF9VyKShGjZnl7cueCjL1Ulms6JFxWi
 l7EJIQWB3/QUWeEowafV51aF/SJx5e/mNbD2uuqVrJrzx/xxbg2UWSUiTD6h3jkf3V
 5tWLWCupk648LT8qzDLLlxRZ53tGammE089UKqL4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJHUQ7u014117
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 19 Nov 2022 11:30:26 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 19
 Nov 2022 11:30:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 19 Nov 2022 11:30:25 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUPIZ055680;
 Sat, 19 Nov 2022 11:30:25 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 3/5] drm/tidss: Add support to configure OLDI mode for
 am625-dss.
Date: Sat, 19 Nov 2022 23:00:17 +0530
Message-ID: <20221119173019.15643-4-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119173019.15643-1-a-bhatia1@ti.com>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
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

Add support for confguring the OLDI modes using OF and LVDS DRM helper
functions.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c   |  12 ++
 drivers/gpu/drm/tidss/tidss_dispc.h   |   9 ++
 drivers/gpu/drm/tidss/tidss_drv.h     |   3 +
 drivers/gpu/drm/tidss/tidss_encoder.c |   4 +-
 drivers/gpu/drm/tidss/tidss_encoder.h |   3 +-
 drivers/gpu/drm/tidss/tidss_kms.c     | 188 +++++++++++++++++++++++---
 6 files changed, 198 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index dbc6a5b617ca..472226a83251 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -365,6 +365,8 @@ struct dispc_device {
 
 	struct dss_vp_data vp_data[TIDSS_MAX_VPS];
 
+	enum dispc_oldi_modes oldi_mode;
+
 	u32 *fourccs;
 	u32 num_fourccs;
 
@@ -1967,6 +1969,16 @@ const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len)
 	return dispc->fourccs;
 }
 
+int dispc_set_oldi_mode(struct dispc_device *dispc,
+			enum dispc_oldi_modes oldi_mode)
+{
+	WARN_ON(!dispc);
+
+	dispc->oldi_mode = oldi_mode;
+
+	return 0;
+}
+
 static s32 pixinc(int pixels, u8 ps)
 {
 	if (pixels == 1)
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 51db500590ee..e76a7599b544 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -64,6 +64,14 @@ enum dispc_dss_subrevision {
 	DISPC_AM625,
 };
 
+enum dispc_oldi_modes {
+	OLDI_MODE_OFF,			/* OLDI turned off / tied off in IP. */
+	OLDI_SINGLE_LINK_SINGLE_MODE,	/* Single Output over OLDI 0. */
+	OLDI_SINGLE_LINK_CLONE_MODE,	/* Duplicate Output over OLDI 0 and 1. */
+	OLDI_DUAL_LINK_MODE,		/* Combined Output over OLDI 0 and 1. */
+	OLDI_MODE_UNSUPPORTED,		/* Unsupported OLDI Mode */
+};
+
 struct dispc_features {
 	int min_pclk_khz;
 	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
@@ -133,6 +141,7 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		      u32 hw_videoport);
 int dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
+int dispc_set_oldi_mode(struct dispc_device *dispc, enum dispc_oldi_modes oldi_mode);
 
 int dispc_init(struct tidss_device *tidss);
 void dispc_remove(struct tidss_device *tidss);
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 0ce7ee5ccd5b..58892f065c16 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -13,6 +13,9 @@
 #define TIDSS_MAX_PLANES 4
 #define TIDSS_MAX_OUTPUT_PORTS 4
 
+/* For AM625-DSS with 2 OLDI TXes */
+#define TIDSS_MAX_BRIDGES_PER_PIPE	2
+
 typedef u32 dispc_irq_t;
 
 struct tidss_device {
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index e278a9c89476..141383ec4045 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -70,7 +70,8 @@ static const struct drm_encoder_funcs encoder_funcs = {
 };
 
 struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
-					 u32 encoder_type, u32 possible_crtcs)
+					 u32 encoder_type, u32 possible_crtcs,
+					 u32 possible_clones)
 {
 	struct drm_encoder *enc;
 	int ret;
@@ -80,6 +81,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 		return ERR_PTR(-ENOMEM);
 
 	enc->possible_crtcs = possible_crtcs;
+	enc->possible_clones = possible_clones;
 
 	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
 			       encoder_type, NULL);
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
index ace877c0e0fd..01c62ba3ef16 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.h
+++ b/drivers/gpu/drm/tidss/tidss_encoder.h
@@ -12,6 +12,7 @@
 struct tidss_device;
 
 struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
-					 u32 encoder_type, u32 possible_crtcs);
+					 u32 encoder_type, u32 possible_crtcs,
+					 u32 possible_clones);
 
 #endif
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index fc9c4eefd31d..8ae321f02197 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -106,30 +106,115 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static enum dispc_oldi_modes tidss_get_oldi_mode(struct device_node *oldi0_port,
+						 struct device_node *oldi1_port)
+{
+	int pixel_order;
+
+	if (!(oldi0_port || oldi1_port)) {
+		/* Keep OLDI TXes off if neither OLDI port is present. */
+		return OLDI_MODE_OFF;
+	} else if (oldi0_port && !oldi1_port) {
+		/*
+		 * OLDI0 port found, but not OLDI1 port. Setting single
+		 * link, single mode output.
+		 */
+		return OLDI_SINGLE_LINK_SINGLE_MODE;
+	} else if (!oldi0_port && oldi1_port) {
+		/*
+		 * The 2nd OLDI TX cannot be operated alone. This use case is
+		 * not supported in the HW. Since the pins for OLDIs 0 and 1 are
+		 * separate, one could theoretically set a clone mode over OLDIs
+		 * 0 and 1 and just simply not use the OLDI 0. This is a hacky
+		 * way to enable only OLDI TX 1 and hence is not officially
+		 * supported.
+		 */
+		return OLDI_MODE_UNSUPPORTED;
+	}
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
+		/*
+		 * Note that the OLDI TX 0 transmits the odd set of pixels while
+		 * the OLDI TX 1 transmits the even set. This is a fixed
+		 * configuration in the IP and an cannot be change vis SW. These
+		 * properties have been used to merely identify if a Dual Link
+		 * configuration is required. Swapping this property in the panel
+		 * port DT nodes will not make any difference.
+		 */
+		pr_warn("EVEN-ODD config for dual-link sinks is not supported in HW. Switching to ODD-EVEN.\n");
+		fallthrough;
+
+	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
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
+		struct drm_bridge *bridge[TIDSS_MAX_BRIDGES_PER_PIPE];
 		u32 enc_type;
+		u32 num_bridges;
 	};
 
 	const struct dispc_features *feat = tidss->feat;
-	u32 max_vps = feat->num_vps;
+	u32 output_ports = feat->num_output_ports;
 	u32 max_planes = feat->num_planes;
 
-	struct pipe pipes[TIDSS_MAX_VPS];
+	struct pipe pipes[TIDSS_MAX_VPS] = {0};
+
 	u32 num_pipes = 0;
 	u32 crtc_mask;
+	u32 portnum_oldi0 = 0, portnum_oldi1 = 2;
+	enum dispc_oldi_modes oldi_mode = OLDI_MODE_OFF;
+	u32 num_oldi = 0;
+	u32 oldi_pipe_index = 0;
+	u32 num_encoders = 0;
+
+	if (feat->oldi_supported) {
+		struct device_node *oldi0_port, *oldi1_port;
+
+		oldi0_port = of_graph_get_port_by_id(dev->of_node,
+						     portnum_oldi0);
+		oldi1_port = of_graph_get_port_by_id(dev->of_node,
+						     portnum_oldi1);
+
+		oldi_mode = tidss_get_oldi_mode(oldi0_port, oldi1_port);
+
+		of_node_put(oldi0_port);
+		of_node_put(oldi1_port);
+
+		dispc_set_oldi_mode(tidss->dispc, oldi_mode);
+	}
 
 	/* first find all the connected panels & bridges */
 
-	for (i = 0; i < max_vps; i++) {
+	for (i = 0; i < output_ports; i++) {
 		struct drm_panel *panel;
 		struct drm_bridge *bridge;
 		u32 enc_type = DRM_MODE_ENCODER_NONE;
@@ -145,16 +230,24 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			return ret;
 		}
 
+		if (feat->output_port_bus_type[i] == DISPC_VP_OLDI &&
+		    oldi_mode == OLDI_MODE_UNSUPPORTED) {
+			dev_err(dev,
+				"Single Mode over OLDI 1 is not supported in HW. Keeping OLDI off.\n");
+			continue;
+		}
+
 		if (panel) {
 			u32 conn_type;
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
-			switch (feat->vp_bus_type[i]) {
+			switch (feat->output_port_bus_type[i]) {
 			case DISPC_VP_OLDI:
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
 				break;
+
 			case DISPC_VP_DPI:
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
@@ -172,6 +265,17 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				return -EINVAL;
 			}
 
+			/*
+			 * If the 2nd OLDI port is discovered connected to a panel
+			 * which is not to be connected in the Clone Mode then a
+			 * bridge is not required because the detected port is the
+			 * 2nd port for the previously connected panel.
+			 */
+			if (feat->output_port_bus_type[i] == DISPC_VP_OLDI &&
+			    oldi_mode != OLDI_SINGLE_LINK_CLONE_MODE &&
+			    num_oldi)
+				break;
+
 			bridge = devm_drm_panel_bridge_add(dev, panel);
 			if (IS_ERR(bridge)) {
 				dev_err(dev,
@@ -181,10 +285,47 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			}
 		}
 
-		pipes[num_pipes].hw_videoport = i;
-		pipes[num_pipes].bridge = bridge;
-		pipes[num_pipes].enc_type = enc_type;
-		num_pipes++;
+		if (feat->output_port_bus_type[i] == DISPC_VP_OLDI) {
+			if (++num_oldi == 1) {
+				/* Setting up pipe parameters when 1st OLDI port is detected */
+
+				pipes[num_pipes].hw_videoport = i;
+				pipes[num_pipes].enc_type = enc_type;
+
+				/*
+				 * Saving the pipe index in case its required for
+				 * 2nd OLDI Port.
+				 */
+				oldi_pipe_index = num_pipes;
+
+				/*
+				 * No additional pipe is required for the 2nd OLDI
+				 * port, because the 2nd Encoder -> Bridge connection
+				 * is the part of the first OLDI Port pipe.
+				 *
+				 * num_pipes will only be incremented when the first
+				 * OLDI port is discovered.
+				 */
+				num_pipes++;
+			}
+
+			/*
+			 * Bridge is required to be added only if the detected
+			 * port is the first OLDI port or a subsequent port in
+			 * Clone Mode.
+			 */
+			if (oldi_mode == OLDI_SINGLE_LINK_CLONE_MODE ||
+			    num_oldi == 1) {
+				pipes[oldi_pipe_index].bridge[num_oldi - 1] = bridge;
+				pipes[oldi_pipe_index].num_bridges++;
+			}
+		} else {
+			pipes[num_pipes].hw_videoport = i;
+			pipes[num_pipes].bridge[0] = bridge;
+			pipes[num_pipes].num_bridges++;
+			pipes[num_pipes].enc_type = enc_type;
+			num_pipes++;
+		}
 	}
 
 	/* all planes can be on any crtc */
@@ -196,6 +337,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 		struct tidss_plane *tplane;
 		struct tidss_crtc *tcrtc;
 		struct drm_encoder *enc;
+		u32 possible_clones = 0;
 		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
 		int ret;
 
@@ -218,16 +360,24 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 		tidss->crtcs[tidss->num_crtcs++] = &tcrtc->crtc;
 
-		enc = tidss_encoder_create(tidss, pipes[i].enc_type,
-					   1 << tcrtc->crtc.index);
-		if (IS_ERR(enc)) {
-			dev_err(tidss->dev, "encoder create failed\n");
-			return PTR_ERR(enc);
-		}
+		for (j = 0; j < pipes[i].num_bridges; j++) {
+			if (pipes[i].num_bridges > 1)
+				possible_clones = (((1 << pipes[i].num_bridges) - 1)
+						  << num_encoders);
+
+			enc = tidss_encoder_create(tidss, pipes[i].enc_type,
+						   1 << tcrtc->crtc.index,
+						   possible_clones);
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
+		num_encoders += pipes[i].num_bridges;
 	}
 
 	/* create overlay planes of the leftover planes */
-- 
2.38.1

