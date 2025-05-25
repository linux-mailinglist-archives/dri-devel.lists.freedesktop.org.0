Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9123AC3562
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 17:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FEC10E15E;
	Sun, 25 May 2025 15:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="fDoqJ4oX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A18210E15E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 15:18:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748186294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ev2O2KA+7yPWx1iJIRuDCertIEx3fXp7LU4VFzl8dOc=;
 b=fDoqJ4oX6sAhNIjEyh89mKo3XsNkVc4oMXXVbT05IBDGP0D3X4QvgXGPrd6W2yKxiJ9C7j
 zOAu1AFbeoyeZ71tKg77FzTOPAZvcfaq49c3rQKEabFCstJJYxUjKGKaVyfc1zum/KSfs2
 DPzb2QGWa9eZKW8zzuQv3pbROokYr28=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Michael Walle <mwalle@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v8 3/4] drm/tidss: Mark AM65x OLDI code separately
Date: Sun, 25 May 2025 20:47:20 +0530
Message-Id: <20250525151721.567042-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dss dt schema and the tidss driver have kept the single-link OLDI in
AM65x integrated with the parent video-port (VP) from DSS (as the OLDI
configuration happens from the source VP only).
To help configure the dual-lvds modes that the OLDI has to offer in
devices AM62x and later, a new OLDI bridge driver will be introduced.

Mark the existing OLDI code separately by renaming all the current OLDI
identifiers with the 'AM65X_' prefix in tidss driver, to help
distinguish from the upcoming OLDI bridge driver.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/tidss/tidss_dispc.c      | 68 ++++++++++++------------
 drivers/gpu/drm/tidss/tidss_dispc.h      |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h | 15 +++---
 drivers/gpu/drm/tidss/tidss_kms.c        |  2 +-
 4 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 21363ccbd763..befa5ae1c246 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -146,7 +146,7 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 const struct dispc_features dispc_am65x_feats = {
 	.max_pclk_khz = {
 		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI] = 165000,
+		[DISPC_VP_OLDI_AM65X] = 165000,
 	},
 
 	.scaling = {
@@ -176,7 +176,7 @@ const struct dispc_features dispc_am65x_feats = {
 	.vp_name = { "vp1", "vp2" },
 	.ovr_name = { "ovr1", "ovr2" },
 	.vpclk_name =  { "vp1", "vp2" },
-	.vp_bus_type = { DISPC_VP_OLDI, DISPC_VP_DPI },
+	.vp_bus_type = { DISPC_VP_OLDI_AM65X, DISPC_VP_DPI },
 
 	.vp_feat = { .color = {
 			.has_ctm = true,
@@ -491,7 +491,7 @@ struct dispc_device {
 	void __iomem *base_ovr[TIDSS_MAX_PORTS];
 	void __iomem *base_vp[TIDSS_MAX_PORTS];
 
-	struct regmap *oldi_io_ctrl;
+	struct regmap *am65x_oldi_io_ctrl;
 
 	struct clk *vp_clk[TIDSS_MAX_PORTS];
 
@@ -1016,13 +1016,11 @@ void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 	}
 }
 
-enum dispc_oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 2 };
-
 struct dispc_bus_format {
 	u32 bus_fmt;
 	u32 data_width;
 	bool is_oldi_fmt;
-	enum dispc_oldi_mode_reg_val oldi_mode_reg_val;
+	enum oldi_mode_reg_val am65x_oldi_mode_reg_val;
 };
 
 static const struct dispc_bus_format dispc_bus_formats[] = {
@@ -1066,7 +1064,7 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 		return -EINVAL;
 	}
 
-	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI &&
+	if (dispc->feat->vp_bus_type[hw_videoport] != DISPC_VP_OLDI_AM65X &&
 	    fmt->is_oldi_fmt) {
 		dev_dbg(dispc->dev, "%s: %s is not OLDI-port\n",
 			__func__, dispc->feat->vp_name[hw_videoport]);
@@ -1076,23 +1074,23 @@ int dispc_vp_bus_check(struct dispc_device *dispc, u32 hw_videoport,
 	return 0;
 }
 
-static void dispc_oldi_tx_power(struct dispc_device *dispc, bool power)
+static void dispc_am65x_oldi_tx_power(struct dispc_device *dispc, bool power)
 {
-	u32 val = power ? 0 : OLDI_PWRDN_TX;
+	u32 val = power ? 0 : AM65X_OLDI_PWRDN_TX;
 
-	if (WARN_ON(!dispc->oldi_io_ctrl))
+	if (WARN_ON(!dispc->am65x_oldi_io_ctrl))
 		return;
 
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT0_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT1_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT2_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_DAT3_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
-	regmap_update_bits(dispc->oldi_io_ctrl, OLDI_CLK_IO_CTRL,
-			   OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->am65x_oldi_io_ctrl, AM65X_OLDI_DAT0_IO_CTRL,
+			   AM65X_OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->am65x_oldi_io_ctrl, AM65X_OLDI_DAT1_IO_CTRL,
+			   AM65X_OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->am65x_oldi_io_ctrl, AM65X_OLDI_DAT2_IO_CTRL,
+			   AM65X_OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->am65x_oldi_io_ctrl, AM65X_OLDI_DAT3_IO_CTRL,
+			   AM65X_OLDI_PWRDN_TX, val);
+	regmap_update_bits(dispc->am65x_oldi_io_ctrl, AM65X_OLDI_CLK_IO_CTRL,
+			   AM65X_OLDI_PWRDN_TX, val);
 }
 
 static void dispc_set_num_datalines(struct dispc_device *dispc,
@@ -1121,8 +1119,8 @@ static void dispc_set_num_datalines(struct dispc_device *dispc,
 	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, v, 10, 8);
 }
 
-static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
-			      const struct dispc_bus_format *fmt)
+static void dispc_enable_am65x_oldi(struct dispc_device *dispc, u32 hw_videoport,
+				    const struct dispc_bus_format *fmt)
 {
 	u32 oldi_cfg = 0;
 	u32 oldi_reset_bit = BIT(5 + hw_videoport);
@@ -1141,7 +1139,7 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 
 	oldi_cfg |= BIT(7); /* DEPOL */
 
-	oldi_cfg = FLD_MOD(oldi_cfg, fmt->oldi_mode_reg_val, 3, 1);
+	oldi_cfg = FLD_MOD(oldi_cfg, fmt->am65x_oldi_mode_reg_val, 3, 1);
 
 	oldi_cfg |= BIT(12); /* SOFTRST */
 
@@ -1170,10 +1168,10 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
 	if (WARN_ON(!fmt))
 		return;
 
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
-		dispc_oldi_tx_power(dispc, true);
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
+		dispc_am65x_oldi_tx_power(dispc, true);
 
-		dispc_enable_oldi(dispc, hw_videoport, fmt);
+		dispc_enable_am65x_oldi(dispc, hw_videoport, fmt);
 	}
 }
 
@@ -1229,7 +1227,7 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
 	align = true;
 
 	/* always use DE_HIGH for OLDI */
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI)
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X)
 		ieo = false;
 
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_POL_FREQ,
@@ -1255,10 +1253,10 @@ void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport)
 
 void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport)
 {
-	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI) {
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI_AM65X) {
 		dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 0);
 
-		dispc_oldi_tx_power(dispc, false);
+		dispc_am65x_oldi_tx_power(dispc, false);
 	}
 }
 
@@ -2852,15 +2850,15 @@ static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
 static int dispc_init_am65x_oldi_io_ctrl(struct device *dev,
 					 struct dispc_device *dispc)
 {
-	dispc->oldi_io_ctrl =
+	dispc->am65x_oldi_io_ctrl =
 		syscon_regmap_lookup_by_phandle(dev->of_node,
 						"ti,am65x-oldi-io-ctrl");
-	if (PTR_ERR(dispc->oldi_io_ctrl) == -ENODEV) {
-		dispc->oldi_io_ctrl = NULL;
-	} else if (IS_ERR(dispc->oldi_io_ctrl)) {
+	if (PTR_ERR(dispc->am65x_oldi_io_ctrl) == -ENODEV) {
+		dispc->am65x_oldi_io_ctrl = NULL;
+	} else if (IS_ERR(dispc->am65x_oldi_io_ctrl)) {
 		dev_err(dev, "%s: syscon_regmap_lookup_by_phandle failed %ld\n",
-			__func__, PTR_ERR(dispc->oldi_io_ctrl));
-		return PTR_ERR(dispc->oldi_io_ctrl);
+			__func__, PTR_ERR(dispc->am65x_oldi_io_ctrl));
+		return PTR_ERR(dispc->am65x_oldi_io_ctrl);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 28958514b8f5..8f1cd0b75629 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -58,7 +58,7 @@ struct dispc_errata {
 
 enum dispc_vp_bus_type {
 	DISPC_VP_DPI,		/* DPI output */
-	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
+	DISPC_VP_OLDI_AM65X,	/* OLDI (LVDS) output for AM65x DSS */
 	DISPC_VP_INTERNAL,	/* SoC internal routing */
 	DISPC_VP_TIED_OFF,	/* Tied off / Unavailable */
 	DISPC_VP_MAX_BUS_TYPE,
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index e88148e44937..30ce5ee40e1e 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -226,18 +226,21 @@ enum dispc_common_regs {
 #define DISPC_VP_DSS_DMA_THREADSIZE		0x170 /* J721E */
 #define DISPC_VP_DSS_DMA_THREADSIZE_STATUS	0x174 /* J721E */
 
+/* LVDS Format values for OLDI_MAP field in DISPC_VP_OLDI_CFG register */
+enum oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 2 };
+
 /*
  * OLDI IO_CTRL register offsets. On AM654 the registers are found
  * from CTRL_MMR0, there the syscon regmap should map 0x14 bytes from
  * CTRLMMR0P1_OLDI_DAT0_IO_CTRL to CTRLMMR0P1_OLDI_CLK_IO_CTRL
  * register range.
  */
-#define OLDI_DAT0_IO_CTRL			0x00
-#define OLDI_DAT1_IO_CTRL			0x04
-#define OLDI_DAT2_IO_CTRL			0x08
-#define OLDI_DAT3_IO_CTRL			0x0C
-#define OLDI_CLK_IO_CTRL			0x10
+#define AM65X_OLDI_DAT0_IO_CTRL		0x00
+#define AM65X_OLDI_DAT1_IO_CTRL		0x04
+#define AM65X_OLDI_DAT2_IO_CTRL		0x08
+#define AM65X_OLDI_DAT3_IO_CTRL		0x0C
+#define AM65X_OLDI_CLK_IO_CTRL		0x10
 
-#define OLDI_PWRDN_TX				BIT(8)
+#define AM65X_OLDI_PWRDN_TX		BIT(8)
 
 #endif /* __TIDSS_DISPC_REGS_H */
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 19432c08ec6b..c34eb90cddbe 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -144,7 +144,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
 			switch (feat->vp_bus_type[i]) {
-			case DISPC_VP_OLDI:
+			case DISPC_VP_OLDI_AM65X:
 				enc_type = DRM_MODE_ENCODER_LVDS;
 				conn_type = DRM_MODE_CONNECTOR_LVDS;
 				break;
-- 
2.34.1

