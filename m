Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F11F42E3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 19:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C576E301;
	Tue,  9 Jun 2020 17:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7889D40
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:48:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DD1782A3B70
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 01/11] drm: bridge: dw_mipi_dsi: add initial regmap
 infrastructure
Date: Tue,  9 Jun 2020 20:49:49 +0300
Message-Id: <20200609174959.955926-2-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609174959.955926-1-adrian.ratiu@collabora.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Philippe CORNU <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yannick FERTRE <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support multiple versions of the Synopsis MIPI DSI host
controller, which have different register layouts but almost identical
HW protocols, we add a regmap infrastructure which can abstract away
register accesses for platform drivers using the bridge.

The controller HW revision is detected during bridge probe which will
be used in future commits to load the relevant register layout which
the bridge will use transparently to the platform drivers.

Suggested-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
Changes since v8:
  - Minor typo fix
  - Added Reviewed-by Enric tag

Changes since v7:
  - Minor checkpatch line fix

Changes since v6:
  - Select REGMAP_MMIO in Kconfig (Enric)
  - Drop unnecessary stack variable inits (Enric)
  - Make bridge error ASAP after a bad revision read (Enric)
  - Drop redundant read of hw_version in dphy_timing_config (Enric)

New in v5.
---
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 210 ++++++++++--------
 2 files changed, 121 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 21a1be3ced0f3..080146093b68e 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -39,3 +39,4 @@ config DRM_DW_MIPI_DSI
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5ef0f154aa7bd..34b8668ae24ea 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include <video/mipi_display.h>
@@ -227,6 +228,7 @@ struct dw_mipi_dsi {
 	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	void __iomem *base;
+	struct regmap *regs;
 
 	struct clk *pclk;
 
@@ -235,6 +237,7 @@ struct dw_mipi_dsi {
 	u32 lanes;
 	u32 format;
 	unsigned long mode_flags;
+	u32 hw_version;
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
@@ -249,6 +252,13 @@ struct dw_mipi_dsi {
 	const struct dw_mipi_dsi_plat_data *plat_data;
 };
 
+static const struct regmap_config dw_mipi_dsi_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.name = "dw-mipi-dsi",
+};
+
 /*
  * Check if either a link to a master or slave is present
  */
@@ -280,16 +290,6 @@ static inline struct dw_mipi_dsi *bridge_to_dsi(struct drm_bridge *bridge)
 	return container_of(bridge, struct dw_mipi_dsi, bridge);
 }
 
-static inline void dsi_write(struct dw_mipi_dsi *dsi, u32 reg, u32 val)
-{
-	writel(val, dsi->base + reg);
-}
-
-static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
-{
-	return readl(dsi->base + reg);
-}
-
 static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 				   struct mipi_dsi_device *device)
 {
@@ -366,8 +366,8 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 	if (lpm)
 		val |= CMD_MODE_ALL_LP;
 
-	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
-	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
+	regmap_write(dsi->regs, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
+	regmap_write(dsi->regs, DSI_CMD_MODE_CFG, val);
 }
 
 static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
@@ -375,20 +375,20 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
 	int ret;
 	u32 val, mask;
 
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, !(val & GEN_CMD_FULL), 1000,
-				 CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+				       val, !(val & GEN_CMD_FULL), 1000,
+				       CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "failed to get available command FIFO\n");
 		return ret;
 	}
 
-	dsi_write(dsi, DSI_GEN_HDR, hdr_val);
+	regmap_write(dsi->regs, DSI_GEN_HDR, hdr_val);
 
 	mask = GEN_CMD_EMPTY | GEN_PLD_W_EMPTY;
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, (val & mask) == mask,
-				 1000, CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+				       val, (val & mask) == mask,
+				       1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "failed to write command FIFO\n");
 		return ret;
@@ -409,18 +409,20 @@ static int dw_mipi_dsi_write(struct dw_mipi_dsi *dsi,
 		if (len < pld_data_bytes) {
 			word = 0;
 			memcpy(&word, tx_buf, len);
-			dsi_write(dsi, DSI_GEN_PLD_DATA, le32_to_cpu(word));
+			regmap_write(dsi->regs, DSI_GEN_PLD_DATA,
+				     le32_to_cpu(word));
 			len = 0;
 		} else {
 			memcpy(&word, tx_buf, pld_data_bytes);
-			dsi_write(dsi, DSI_GEN_PLD_DATA, le32_to_cpu(word));
+			regmap_write(dsi->regs, DSI_GEN_PLD_DATA,
+				     le32_to_cpu(word));
 			tx_buf += pld_data_bytes;
 			len -= pld_data_bytes;
 		}
 
-		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-					 val, !(val & GEN_PLD_W_FULL), 1000,
-					 CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+					       val, !(val & GEN_PLD_W_FULL),
+					       1000, CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev,
 				"failed to get available write payload FIFO\n");
@@ -441,9 +443,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 	u32 val;
 
 	/* Wait end of the read operation */
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, !(val & GEN_RD_CMD_BUSY),
-				 1000, CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+				       val, !(val & GEN_RD_CMD_BUSY),
+				       1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "Timeout during read operation\n");
 		return ret;
@@ -451,15 +453,15 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 
 	for (i = 0; i < len; i += 4) {
 		/* Read fifo must not be empty before all bytes are read */
-		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-					 val, !(val & GEN_PLD_R_EMPTY),
-					 1000, CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+					       val, !(val & GEN_PLD_R_EMPTY),
+					       1000, CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev, "Read payload FIFO is empty\n");
 			return ret;
 		}
 
-		val = dsi_read(dsi, DSI_GEN_PLD_DATA);
+		regmap_read(dsi->regs, DSI_GEN_PLD_DATA, &val);
 		for (j = 0; j < 4 && j + i < len; j++)
 			buf[i + j] = val >> (8 * j);
 	}
@@ -536,29 +538,29 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 	}
 #endif /* CONFIG_DEBUG_FS */
 
-	dsi_write(dsi, DSI_VID_MODE_CFG, val);
+	regmap_write(dsi->regs, DSI_VID_MODE_CFG, val);
 }
 
 static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
 				 unsigned long mode_flags)
 {
-	dsi_write(dsi, DSI_PWR_UP, RESET);
+	regmap_write(dsi->regs, DSI_PWR_UP, RESET);
 
 	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
-		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
+		regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
 		dw_mipi_dsi_video_mode_config(dsi);
-		dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
+		regmap_write(dsi->regs, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
 	} else {
-		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
+		regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE);
 	}
 
-	dsi_write(dsi, DSI_PWR_UP, POWERUP);
+	regmap_write(dsi->regs, DSI_PWR_UP, POWERUP);
 }
 
 static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
 {
-	dsi_write(dsi, DSI_PWR_UP, RESET);
-	dsi_write(dsi, DSI_PHY_RSTZ, PHY_RSTZ);
+	regmap_write(dsi->regs, DSI_PWR_UP, RESET);
+	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_RSTZ);
 }
 
 static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
@@ -573,14 +575,14 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 	 */
 	u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;
 
-	dsi_write(dsi, DSI_PWR_UP, RESET);
+	regmap_write(dsi->regs, DSI_PWR_UP, RESET);
 
 	/*
 	 * TODO dw drv improvements
 	 * timeout clock division should be computed with the
 	 * high speed transmission counter timeout and byte lane...
 	 */
-	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
+	regmap_write(dsi->regs, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
 		  TX_ESC_CLK_DIVISION(esc_clk_division));
 }
 
@@ -609,22 +611,22 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		val |= HSYNC_ACTIVE_LOW;
 
-	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel));
-	dsi_write(dsi, DSI_DPI_COLOR_CODING, color);
-	dsi_write(dsi, DSI_DPI_CFG_POL, val);
+	regmap_write(dsi->regs, DSI_DPI_VCID, DPI_VCID(dsi->channel));
+	regmap_write(dsi->regs, DSI_DPI_COLOR_CODING, color);
+	regmap_write(dsi->regs, DSI_DPI_CFG_POL, val);
 	/*
 	 * TODO dw drv improvements
 	 * largest packet sizes during hfp or during vsa/vpb/vfp
 	 * should be computed according to byte lane, lane number and only
 	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
 	 */
-	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
+	regmap_write(dsi->regs, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
 		  | INVACT_LPCMD_TIME(4));
 }
 
 static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
 {
-	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
+	regmap_write(dsi->regs, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
 }
 
 static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
@@ -638,7 +640,7 @@ static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
 	 * non-burst video modes, see dw_mipi_dsi_video_mode_config()...
 	 */
 
-	dsi_write(dsi, DSI_VID_PKT_SIZE,
+	regmap_write(dsi->regs, DSI_VID_PKT_SIZE,
 		       dw_mipi_is_dual_mode(dsi) ?
 				VID_PKT_SIZE(mode->hdisplay / 2) :
 				VID_PKT_SIZE(mode->hdisplay));
@@ -651,14 +653,15 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	regmap_write(dsi->regs, DSI_TO_CNT_CFG,
+		     HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
 	 * according to byte lane...
 	 */
-	dsi_write(dsi, DSI_BTA_TO_CNT, 0xd00);
-	dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
+	regmap_write(dsi->regs, DSI_BTA_TO_CNT, 0xd00);
+	regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE);
 }
 
 /* Get lane byte clock cycles. */
@@ -692,13 +695,13 @@ static void dw_mipi_dsi_line_timer_config(struct dw_mipi_dsi *dsi,
 	 * computations below may be improved...
 	 */
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, htotal);
-	dsi_write(dsi, DSI_VID_HLINE_TIME, lbcc);
+	regmap_write(dsi->regs, DSI_VID_HLINE_TIME, lbcc);
 
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hsa);
-	dsi_write(dsi, DSI_VID_HSA_TIME, lbcc);
+	regmap_write(dsi->regs, DSI_VID_HSA_TIME, lbcc);
 
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hbp);
-	dsi_write(dsi, DSI_VID_HBP_TIME, lbcc);
+	regmap_write(dsi->regs, DSI_VID_HBP_TIME, lbcc);
 }
 
 static void dw_mipi_dsi_vertical_timing_config(struct dw_mipi_dsi *dsi,
@@ -711,17 +714,16 @@ static void dw_mipi_dsi_vertical_timing_config(struct dw_mipi_dsi *dsi,
 	vfp = mode->vsync_start - mode->vdisplay;
 	vbp = mode->vtotal - mode->vsync_end;
 
-	dsi_write(dsi, DSI_VID_VACTIVE_LINES, vactive);
-	dsi_write(dsi, DSI_VID_VSA_LINES, vsa);
-	dsi_write(dsi, DSI_VID_VFP_LINES, vfp);
-	dsi_write(dsi, DSI_VID_VBP_LINES, vbp);
+	regmap_write(dsi->regs, DSI_VID_VACTIVE_LINES, vactive);
+	regmap_write(dsi->regs, DSI_VID_VSA_LINES, vsa);
+	regmap_write(dsi->regs, DSI_VID_VFP_LINES, vfp);
+	regmap_write(dsi->regs, DSI_VID_VBP_LINES, vbp);
 }
 
 static void dw_mipi_dsi_dphy_timing_config(struct dw_mipi_dsi *dsi)
 {
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
 	struct dw_mipi_dsi_dphy_timing timing;
-	u32 hw_version;
 	int ret;
 
 	ret = phy_ops->get_timing(dsi->plat_data->priv_data,
@@ -737,23 +739,22 @@ static void dw_mipi_dsi_dphy_timing_config(struct dw_mipi_dsi *dsi)
 	 * DSI_CMD_MODE_CFG.MAX_RD_PKT_SIZE_LP (see CMD_MODE_ALL_LP)
 	 */
 
-	hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
-
-	if (hw_version >= HWVER_131) {
-		dsi_write(dsi, DSI_PHY_TMR_CFG,
-			  PHY_HS2LP_TIME_V131(timing.data_hs2lp) |
-			  PHY_LP2HS_TIME_V131(timing.data_lp2hs));
-		dsi_write(dsi, DSI_PHY_TMR_RD_CFG, MAX_RD_TIME_V131(10000));
+	if (dsi->hw_version >= HWVER_131) {
+		regmap_write(dsi->regs, DSI_PHY_TMR_CFG,
+			     PHY_HS2LP_TIME_V131(timing.data_hs2lp) |
+			     PHY_LP2HS_TIME_V131(timing.data_lp2hs));
+		regmap_write(dsi->regs, DSI_PHY_TMR_RD_CFG,
+			     MAX_RD_TIME_V131(10000));
 	} else {
-		dsi_write(dsi, DSI_PHY_TMR_CFG,
-			  PHY_HS2LP_TIME(timing.data_hs2lp) |
-			  PHY_LP2HS_TIME(timing.data_lp2hs) |
-			  MAX_RD_TIME(10000));
+		regmap_write(dsi->regs, DSI_PHY_TMR_CFG,
+			     PHY_HS2LP_TIME(timing.data_hs2lp) |
+			     PHY_LP2HS_TIME(timing.data_lp2hs) |
+			     MAX_RD_TIME(10000));
 	}
 
-	dsi_write(dsi, DSI_PHY_TMR_LPCLK_CFG,
-		  PHY_CLKHS2LP_TIME(timing.clk_hs2lp) |
-		  PHY_CLKLP2HS_TIME(timing.clk_lp2hs));
+	regmap_write(dsi->regs, DSI_PHY_TMR_LPCLK_CFG,
+		     PHY_CLKHS2LP_TIME(timing.clk_hs2lp) |
+		     PHY_CLKLP2HS_TIME(timing.clk_lp2hs));
 }
 
 static void dw_mipi_dsi_dphy_interface_config(struct dw_mipi_dsi *dsi)
@@ -763,18 +764,18 @@ static void dw_mipi_dsi_dphy_interface_config(struct dw_mipi_dsi *dsi)
 	 * stop wait time should be the maximum between host dsi
 	 * and panel stop wait times
 	 */
-	dsi_write(dsi, DSI_PHY_IF_CFG, PHY_STOP_WAIT_TIME(0x20) |
-		  N_LANES(dsi->lanes));
+	regmap_write(dsi->regs, DSI_PHY_IF_CFG,
+		     PHY_STOP_WAIT_TIME(0x20) | N_LANES(dsi->lanes));
 }
 
 static void dw_mipi_dsi_dphy_init(struct dw_mipi_dsi *dsi)
 {
 	/* Clear PHY state */
-	dsi_write(dsi, DSI_PHY_RSTZ, PHY_DISFORCEPLL | PHY_DISABLECLK
-		  | PHY_RSTZ | PHY_SHUTDOWNZ);
-	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
-	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLR);
-	dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
+	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_DISFORCEPLL | PHY_DISABLECLK
+		     | PHY_RSTZ | PHY_SHUTDOWNZ);
+	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
+	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_TESTCLR);
+	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
 }
 
 static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
@@ -782,27 +783,30 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
 	u32 val;
 	int ret;
 
-	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
-		  PHY_UNRSTZ | PHY_UNSHUTDOWNZ);
+	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
+		     PHY_UNRSTZ | PHY_UNSHUTDOWNZ);
 
-	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, val,
-				 val & PHY_LOCK, 1000, PHY_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS,
+				       val, val & PHY_LOCK,
+				       1000, PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy lock state\n");
 
-	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS,
-				 val, val & PHY_STOP_STATE_CLK_LANE, 1000,
-				 PHY_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS,
+				       val, val & PHY_STOP_STATE_CLK_LANE, 1000,
+				       PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy clk lane stop state\n");
 }
 
 static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
 {
-	dsi_read(dsi, DSI_INT_ST0);
-	dsi_read(dsi, DSI_INT_ST1);
-	dsi_write(dsi, DSI_INT_MSK0, 0);
-	dsi_write(dsi, DSI_INT_MSK1, 0);
+	u32 val;
+
+	regmap_read(dsi->regs, DSI_INT_ST0, &val);
+	regmap_read(dsi->regs, DSI_INT_ST1, &val);
+	regmap_write(dsi->regs, DSI_INT_MSK0, 0);
+	regmap_write(dsi->regs, DSI_INT_MSK1, 0);
 }
 
 static void dw_mipi_dsi_bridge_post_disable(struct drm_bridge *bridge)
@@ -989,6 +993,18 @@ static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi) { }
 
 #endif /* CONFIG_DEBUG_FS */
 
+static int dw_mipi_dsi_get_hw_version(struct dw_mipi_dsi *dsi)
+{
+	regmap_read(dsi->regs, DSI_VERSION, &dsi->hw_version);
+	dsi->hw_version &= VERSION;
+	if (!dsi->hw_version) {
+		dev_err(dsi->dev,
+			"Failed to read DSI version. Is pclk enabled?\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
 static struct dw_mipi_dsi *
 __dw_mipi_dsi_probe(struct platform_device *pdev,
 		    const struct dw_mipi_dsi_plat_data *plat_data)
@@ -1020,6 +1036,14 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		dsi->base = plat_data->base;
 	}
 
+	dsi->regs = devm_regmap_init_mmio(dev, dsi->base,
+					  &dw_mipi_dsi_regmap_cfg);
+	if (IS_ERR(dsi->regs)) {
+		ret = PTR_ERR(dsi->regs);
+		DRM_ERROR("Failed to create DW MIPI DSI regmap: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
 	dsi->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dsi->pclk)) {
 		ret = PTR_ERR(dsi->pclk);
@@ -1055,6 +1079,12 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		clk_disable_unprepare(dsi->pclk);
 	}
 
+	ret = dw_mipi_dsi_get_hw_version(dsi);
+	if (ret) {
+		dev_err(dev, "Could not read HW version\n");
+		return ERR_PTR(ret);
+	}
+
 	dw_mipi_dsi_debugfs_init(dsi);
 	pm_runtime_enable(dev);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
