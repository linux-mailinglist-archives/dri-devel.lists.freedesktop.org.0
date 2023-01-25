Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966C67B17A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B87410E792;
	Wed, 25 Jan 2023 11:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D6210E792
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:35:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZY7b006819;
 Wed, 25 Jan 2023 05:35:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674646534;
 bh=f9wcw001IhEHK2H3HH91V0grvH9sbrdQbxg2owu8m3s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hij5w/8dQJGkWASOpQr91S1Yn5ppY0jWBCGfQWAuu7ZA9XbUPexlfYyHL9eztSLkT
 wXQFL++JROa4WeMbYNZ21OsQHfHya4xoc0bnLMGalcgqDPkvqLpoqy6M/y/uBrK47L
 mEczKAT/fCHN+czB5piJcKJZKCBbkRqj+Eq3je/I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PBZXfO013260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Jan 2023 05:35:33 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 05:35:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 05:35:33 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZWVm114738;
 Wed, 25 Jan 2023 05:35:32 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 1/6] drm/tidss: Remove Video Port to Output Port coupling
Date: Wed, 25 Jan 2023 17:05:24 +0530
Message-ID: <20230125113529.13952-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125113529.13952-1-a-bhatia1@ti.com>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make DSS Video Ports agnostic of output bus types.

DSS controllers have had a 1-to-1 coupling between its VPs and its
output ports. This no longer stands true for the new AM625 DSS. This
coupling, hence, has been removed by renaming the 'vp_bus_type' to
'output_port_bus_type' because the VPs are essentially agnostic of the
bus type and it is the output ports which have a bus type.

The AM625 DSS has 2 VPs but requires 3 output ports to support its
Dual-Link OLDI video output coming from a single VP.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 47 +++++++++++++++++------------
 drivers/gpu/drm/tidss/tidss_dispc.h | 21 +++++++------
 drivers/gpu/drm/tidss/tidss_drv.h   |  5 +--
 drivers/gpu/drm/tidss/tidss_irq.h   |  2 +-
 drivers/gpu/drm/tidss/tidss_kms.c   | 12 ++++----
 5 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 165365b515e1..c1c4faccbddc 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -61,7 +61,7 @@ const struct dispc_features dispc_k2g_feats = {
 	.min_pclk_khz = 4375,
 
 	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 150000,
+		[DISPC_PORT_DPI] = 150000,
 	},
 
 	/*
@@ -96,7 +96,6 @@ const struct dispc_features dispc_k2g_feats = {
 	.vp_name = { "vp1" },
 	.ovr_name = { "ovr1" },
 	.vpclk_name =  { "vp1" },
-	.vp_bus_type = { DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -109,6 +108,9 @@ const struct dispc_features dispc_k2g_feats = {
 	.vid_name = { "vid1" },
 	.vid_lite = { false },
 	.vid_order = { 0 },
+
+	.num_output_ports = 1,
+	.output_port_bus_type = { DISPC_PORT_DPI },
 };
 
 static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
@@ -140,8 +142,8 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 
 const struct dispc_features dispc_am65x_feats = {
 	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI] = 165000,
+		[DISPC_PORT_DPI] = 165000,
+		[DISPC_PORT_OLDI] = 165000,
 	},
 
 	.scaling = {
@@ -171,7 +173,6 @@ const struct dispc_features dispc_am65x_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -185,6 +186,9 @@ const struct dispc_features dispc_am65x_feats = {
 	.vid_name = { "vid", "vidl1" },
 	.vid_lite = { false, true, },
 	.vid_order = { 1, 0 },
+
+	.num_output_ports = 2,
+	.output_port_bus_type = { DISPC_PORT_OLDI, DISPC_PORT_DPI },
 };
 
 static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
@@ -229,8 +233,8 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 
 const struct dispc_features dispc_j721e_feats = {
 	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 170000,
-		[DISPC_VP_INTERNAL] = 600000,
+		[DISPC_PORT_DPI] = 170000,
+		[DISPC_PORT_INTERNAL] = 600000,
 	},
 
 	.scaling = {
@@ -260,9 +264,7 @@ const struct dispc_features dispc_j721e_feats = {
 	.vp_name = { "vp1", "vp2", "vp3", "vp4" },
 	.ovr_name = { "ovr1", "ovr2", "ovr3", "ovr4" },
 	.vpclk_name = { "vp1", "vp2", "vp3", "vp4" },
-	/* Currently hard coded VP routing (see dispc_initial_config()) */
-	.vp_bus_type =	{ DISPC_VP_INTERNAL, DISPC_VP_DPI,
-			  DISPC_VP_INTERNAL, DISPC_VP_DPI, },
+
 	.vp_feat = { .color = {
 			.has_ctm = true,
 			.gamma_size = 1024,
@@ -273,6 +275,11 @@ const struct dispc_features dispc_j721e_feats = {
 	.vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
 	.vid_lite = { 0, 1, 0, 1, },
 	.vid_order = { 1, 3, 0, 2 },
+
+	.num_output_ports = 4,
+	/* Currently hard coded VP routing (see dispc_initial_config()) */
+	.output_port_bus_type =	{ DISPC_PORT_INTERNAL, DISPC_PORT_DPI,
+			  DISPC_PORT_INTERNAL, DISPC_PORT_DPI, },
 };
 
 static const u16 *dispc_common_regmap;
@@ -287,12 +294,12 @@ struct dispc_device {
 
 	void __iomem *base_common;
 	void __iomem *base_vid[TIDSS_MAX_PLANES];
-	void __iomem *base_ovr[TIDSS_MAX_PORTS];
-	void __iomem *base_vp[TIDSS_MAX_PORTS];
+	void __iomem *base_ovr[TIDSS_MAX_VPS];
+	void __iomem *base_vp[TIDSS_MAX_VPS];
 
 	struct regmap *oldi_io_ctrl;
 
-	struct clk *vp_clk[TIDSS_MAX_PORTS];
+	struct clk *vp_clk[TIDSS_MAX_VPS];
 
 	const struct dispc_features *feat;
 
@@ -300,7 +307,7 @@ struct dispc_device {
 
 	bool is_enabled;
 
-	struct dss_vp_data vp_data[TIDSS_MAX_PORTS];
+	struct dss_vp_data vp_data[TIDSS_MAX_VPS];
 
 	u32 *fourccs;
 	u32 num_fourccs;
@@ -851,7 +858,7 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 		return -EINVAL;
 	}
 
-	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI &&
+	if (dispc->feat->output_port_bus_type[hw_videoport] != DISPC_PORT_OLDI &&
 	    fmt->is_oldi_fmt) {
 		dev_dbg(dispc->dev, "%s: %s is not OLDI-port\n",
 			__func__, dispc->feat->vp_name[hw_videoport]);
@@ -955,7 +962,7 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 	if (WARN_ON(!fmt))
 		return;
 
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
+	if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI) {
 		dispc_oldi_tx_power(dispc, true);
 
 		dispc_enable_oldi(dispc, hw_videoport, fmt);
@@ -1014,7 +1021,7 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	align = true;
 
 	/* always use DE_HIGH for OLDI */
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI)
+	if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI)
 		ieo = false;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
@@ -1040,7 +1047,7 @@ void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
 
 void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 {
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
+	if (dispc->feat->output_port_bus_type[hw_videoport] == DISPC_PORT_OLDI) {
 		dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 0);
 
 		dispc_oldi_tx_power(dispc, false);
@@ -1116,10 +1123,10 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
-	enum dispc_vp_bus_type bus_type;
+	enum dispc_port_bus_type bus_type;
 	int max_pclk;
 
-	bus_type = dispc->feat->vp_bus_type[hw_videoport];
+	bus_type = dispc->feat->output_port_bus_type[hw_videoport];
 
 	max_pclk = dispc->feat->max_pclk_khz[bus_type];
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index e49432f0abf5..30fb44158347 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -50,11 +50,11 @@ struct dispc_errata {
 	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
 };
 
-enum dispc_vp_bus_type {
-	DISPC_VP_DPI,		/* DPI output */
-	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
-	DISPC_VP_INTERNAL,	/* SoC internal routing */
-	DISPC_VP_MAX_BUS_TYPE,
+enum dispc_port_bus_type {
+	DISPC_PORT_DPI,			/* DPI output */
+	DISPC_PORT_OLDI,		/* OLDI (LVDS) output */
+	DISPC_PORT_INTERNAL,		/* SoC internal routing */
+	DISPC_PORT_MAX_BUS_TYPE,
 };
 
 enum dispc_dss_subrevision {
@@ -65,7 +65,7 @@ enum dispc_dss_subrevision {
 
 struct dispc_features {
 	int min_pclk_khz;
-	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
+	int max_pclk_khz[DISPC_PORT_MAX_BUS_TYPE];
 
 	struct dispc_features_scaling scaling;
 
@@ -74,15 +74,16 @@ struct dispc_features {
 	const char *common;
 	const u16 *common_regs;
 	u32 num_vps;
-	const char *vp_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
-	const char *ovr_name[TIDSS_MAX_PORTS]; /* Should match dt reg names */
-	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
-	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
+	const char *vp_name[TIDSS_MAX_VPS]; /* Should match dt reg names */
+	const char *ovr_name[TIDSS_MAX_VPS]; /* Should match dt reg names */
+	const char *vpclk_name[TIDSS_MAX_VPS]; /* Should match dt clk names */
 	struct tidss_vp_feat vp_feat;
 	u32 num_planes;
 	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
 	bool vid_lite[TIDSS_MAX_PLANES];
 	u32 vid_order[TIDSS_MAX_PLANES];
+	u32 num_output_ports;
+	const enum dispc_port_bus_type output_port_bus_type[TIDSS_MAX_OUTPUT_PORTS];
 };
 
 extern const struct dispc_features dispc_k2g_feats;
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index d7f27b0b0315..0ce7ee5ccd5b 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -9,8 +9,9 @@
 
 #include <linux/spinlock.h>
 
-#define TIDSS_MAX_PORTS 4
+#define TIDSS_MAX_VPS 4
 #define TIDSS_MAX_PLANES 4
+#define TIDSS_MAX_OUTPUT_PORTS 4
 
 typedef u32 dispc_irq_t;
 
@@ -22,7 +23,7 @@ struct tidss_device {
 	struct dispc_device *dispc;
 
 	unsigned int num_crtcs;
-	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
+	struct drm_crtc *crtcs[TIDSS_MAX_VPS];
 
 	unsigned int num_planes;
 	struct drm_plane *planes[TIDSS_MAX_PLANES];
diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
index b512614d5863..a753f5e3ce15 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.h
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -35,7 +35,7 @@
 
 #define DSS_IRQ_VP_BIT_N(ch, bit)	(4 + 4 * (ch) + (bit))
 #define DSS_IRQ_PLANE_BIT_N(plane, bit) \
-	(DSS_IRQ_VP_BIT_N(TIDSS_MAX_PORTS, 0) + 1 * (plane) + (bit))
+	(DSS_IRQ_VP_BIT_N(TIDSS_MAX_VPS, 0) + 1 * (plane) + (bit))
 
 #define DSS_IRQ_VP_BIT(ch, bit)	BIT(DSS_IRQ_VP_BIT_N((ch), (bit)))
 #define DSS_IRQ_PLANE_BIT(plane, bit) \
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index ad2fa3c3d4a7..d449131935d2 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -118,16 +118,16 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 	};
 
 	const struct dispc_features *feat = tidss->feat;
-	u32 max_vps = feat->num_vps;
+	u32 output_ports = feat->num_output_ports;
 	u32 max_planes = feat->num_planes;
 
-	struct pipe pipes[TIDSS_MAX_PORTS];
+	struct pipe pipes[TIDSS_MAX_VPS];
 	u32 num_pipes = 0;
 	u32 crtc_mask;
 
 	/* first find all the connected panels & bridges */
 
-	for (i = 0; i < max_vps; i++) {
+	for (i = 0; i < output_ports; i++) {
 		struct drm_panel *panel;
 		struct drm_bridge *bridge;
 		u32 enc_type = DRM_MODE_ENCODER_NONE;
@@ -148,12 +148,12 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
-			switch (feat->vp_bus_type[i]) {
-			case DISPC_VP_OLDI:
+			switch (feat->output_port_bus_type[i]) {
+			case DISPC_PORT_OLDI:
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
 				break;
-			case DISPC_VP_DPI:
+			case DISPC_PORT_DPI:
 				enc_type = DRM_MODE_ENCODER_DPI;
 				conn_type = DRM_MODE_CONNECTOR_DPI;
 				break;
-- 
2.39.0

