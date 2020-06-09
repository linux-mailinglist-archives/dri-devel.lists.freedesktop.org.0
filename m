Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA111F42F4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 19:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BB96E317;
	Tue,  9 Jun 2020 17:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A316E314
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DA6612A3BF5
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 09/11] drm: bridge: dw-mipi-dsi: split low power cfg
 register into fields
Date: Tue,  9 Jun 2020 20:49:57 +0300
Message-Id: <20200609174959.955926-10-adrian.ratiu@collabora.com>
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
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the Host Registers documentation for IMX, STM and RK
the LP cfg register should not be written entirely in one go because
some bits are reserved and should be kept to reset values, for eg.
BIT(15) which is reserved in all versions.

This also cleans up the code by removing the the ugly defines
and making field ranges & values written more explicit.

Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
New in v6.
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 105 ++++++------------
 1 file changed, 33 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 70df0578cbe7b..1e47d40b5becb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -120,60 +120,6 @@
 #define DSI_TO_CNT_CFG_V101		0x40
 #define DSI_PCKHDL_CFG_V101		0x18
 
-#define MAX_RD_PKT_SIZE_LP		BIT(24)
-#define DCS_LW_TX_LP			BIT(19)
-#define DCS_SR_0P_TX_LP			BIT(18)
-#define DCS_SW_1P_TX_LP			BIT(17)
-#define DCS_SW_0P_TX_LP			BIT(16)
-#define GEN_LW_TX_LP			BIT(14)
-#define GEN_SR_2P_TX_LP			BIT(13)
-#define GEN_SR_1P_TX_LP			BIT(12)
-#define GEN_SR_0P_TX_LP			BIT(11)
-#define GEN_SW_2P_TX_LP			BIT(10)
-#define GEN_SW_1P_TX_LP			BIT(9)
-#define GEN_SW_0P_TX_LP			BIT(8)
-#define TEAR_FX_EN			BIT(0)
-
-#define CMD_MODE_ALL_LP			(MAX_RD_PKT_SIZE_LP | \
-					 DCS_LW_TX_LP | \
-					 DCS_SR_0P_TX_LP | \
-					 DCS_SW_1P_TX_LP | \
-					 DCS_SW_0P_TX_LP | \
-					 GEN_LW_TX_LP | \
-					 GEN_SR_2P_TX_LP | \
-					 GEN_SR_1P_TX_LP | \
-					 GEN_SR_0P_TX_LP | \
-					 GEN_SW_2P_TX_LP | \
-					 GEN_SW_1P_TX_LP | \
-					 GEN_SW_0P_TX_LP)
-
-#define EN_TEAR_FX_V101			BIT(14)
-#define DCS_LW_TX_LP_V101		BIT(12)
-#define GEN_LW_TX_LP_V101		BIT(11)
-#define MAX_RD_PKT_SIZE_LP_V101		BIT(10)
-#define DCS_SW_2P_TX_LP_V101		BIT(9)
-#define DCS_SW_1P_TX_LP_V101		BIT(8)
-#define DCS_SW_0P_TX_LP_V101		BIT(7)
-#define GEN_SR_2P_TX_LP_V101		BIT(6)
-#define GEN_SR_1P_TX_LP_V101		BIT(5)
-#define GEN_SR_0P_TX_LP_V101		BIT(4)
-#define GEN_SW_2P_TX_LP_V101		BIT(3)
-#define GEN_SW_1P_TX_LP_V101		BIT(2)
-#define GEN_SW_0P_TX_LP_V101		BIT(1)
-
-#define CMD_MODE_ALL_LP_V101		(DCS_LW_TX_LP_V101 | \
-					 GEN_LW_TX_LP_V101 | \
-					 MAX_RD_PKT_SIZE_LP_V101 | \
-					 DCS_SW_2P_TX_LP_V101 | \
-					 DCS_SW_1P_TX_LP_V101 | \
-					 DCS_SW_0P_TX_LP_V101 | \
-					 GEN_SR_2P_TX_LP_V101 | \
-					 GEN_SR_1P_TX_LP_V101 | \
-					 GEN_SR_0P_TX_LP_V101 | \
-					 GEN_SW_2P_TX_LP_V101 | \
-					 GEN_SW_1P_TX_LP_V101 | \
-					 GEN_SW_0P_TX_LP_V101)
-
 #define DSI_GEN_HDR			0x6c
 #define DSI_GEN_PLD_DATA		0x70
 
@@ -257,7 +203,11 @@ struct dw_mipi_dsi {
 	struct regmap_field	*field_dpi_vsync_active_low;
 	struct regmap_field	*field_dpi_hsync_active_low;
 	struct regmap_field	*field_cmd_mode_ack_rqst_en;
-	struct regmap_field	*field_cmd_mode_all_lp_en;
+	struct regmap_field	*field_cmd_mode_gen_sw_sr_en;
+	struct regmap_field	*field_cmd_mode_dcs_sw_sr_en;
+	struct regmap_field	*field_cmd_mode_gen_lw_en;
+	struct regmap_field	*field_cmd_mode_dcs_lw_en;
+	struct regmap_field	*field_cmd_mode_max_rd_pkt_size;
 	struct regmap_field	*field_cmd_mode_en;
 	struct regmap_field	*field_cmd_pkt_status;
 	struct regmap_field	*field_vid_mode_en;
@@ -315,7 +265,11 @@ struct dw_mipi_dsi_variant {
 	struct reg_field	cfg_dpi_hsync_active_low;
 	struct reg_field	cfg_cmd_mode_en;
 	struct reg_field	cfg_cmd_mode_ack_rqst_en;
-	struct reg_field	cfg_cmd_mode_all_lp_en;
+	struct reg_field	cfg_cmd_mode_gen_sw_sr_en;
+	struct reg_field	cfg_cmd_mode_dcs_sw_sr_en;
+	struct reg_field	cfg_cmd_mode_gen_lw_en;
+	struct reg_field	cfg_cmd_mode_dcs_lw_en;
+	struct reg_field	cfg_cmd_mode_max_rd_pkt_size;
 	struct reg_field	cfg_cmd_pkt_status;
 	struct reg_field	cfg_vid_mode_en;
 	struct reg_field	cfg_vid_mode_type;
@@ -366,7 +320,11 @@ static const struct dw_mipi_dsi_variant dw_mipi_dsi_v130_v131_layout = {
 	.cfg_dpi_vsync_active_low =	REG_FIELD(DSI_DPI_CFG_POL, 1, 1),
 	.cfg_dpi_hsync_active_low =	REG_FIELD(DSI_DPI_CFG_POL, 2, 2),
 	.cfg_cmd_mode_ack_rqst_en =	REG_FIELD(DSI_CMD_MODE_CFG, 1, 1),
-	.cfg_cmd_mode_all_lp_en =	REG_FIELD(DSI_CMD_MODE_CFG, 8, 24),
+	.cfg_cmd_mode_gen_sw_sr_en =	REG_FIELD(DSI_CMD_MODE_CFG, 8, 13),
+	.cfg_cmd_mode_gen_lw_en =	REG_FIELD(DSI_CMD_MODE_CFG, 14, 14),
+	.cfg_cmd_mode_dcs_sw_sr_en =	REG_FIELD(DSI_CMD_MODE_CFG, 16, 18),
+	.cfg_cmd_mode_dcs_lw_en =	REG_FIELD(DSI_CMD_MODE_CFG, 19, 19),
+	.cfg_cmd_mode_max_rd_pkt_size =	REG_FIELD(DSI_CMD_MODE_CFG, 24, 24),
 	.cfg_cmd_mode_en =		REG_FIELD(DSI_MODE_CFG, 0, 31),
 	.cfg_cmd_pkt_status =		REG_FIELD(DSI_CMD_PKT_STATUS, 0, 31),
 	.cfg_vid_mode_en =		REG_FIELD(DSI_MODE_CFG, 0, 31),
@@ -418,7 +376,11 @@ static const struct dw_mipi_dsi_variant dw_mipi_dsi_v101_layout = {
 	.cfg_dpi_vsync_active_low =	REG_FIELD(DSI_DPI_CFG, 6, 6),
 	.cfg_dpi_hsync_active_low =	REG_FIELD(DSI_DPI_CFG, 7, 7),
 	.cfg_cmd_mode_en =		REG_FIELD(DSI_CMD_MODE_CFG_V101, 0, 0),
-	.cfg_cmd_mode_all_lp_en =	REG_FIELD(DSI_CMD_MODE_CFG_V101, 1, 12),
+	.cfg_cmd_mode_gen_sw_sr_en =	REG_FIELD(DSI_CMD_MODE_CFG, 1, 6),
+	.cfg_cmd_mode_dcs_sw_sr_en =	REG_FIELD(DSI_CMD_MODE_CFG, 7, 9),
+	.cfg_cmd_mode_max_rd_pkt_size =	REG_FIELD(DSI_CMD_MODE_CFG, 10, 10),
+	.cfg_cmd_mode_gen_lw_en =	REG_FIELD(DSI_CMD_MODE_CFG, 11, 11),
+	.cfg_cmd_mode_dcs_lw_en =	REG_FIELD(DSI_CMD_MODE_CFG, 12, 12),
 	.cfg_cmd_mode_ack_rqst_en =	REG_FIELD(DSI_CMD_MODE_CFG_V101, 13, 13),
 	.cfg_cmd_pkt_status =		REG_FIELD(DSI_CMD_PKT_STATUS_V101, 0, 14),
 	.cfg_vid_mode_en =		REG_FIELD(DSI_VID_MODE_CFG_V101, 0, 0),
@@ -554,23 +516,18 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 				   const struct mipi_dsi_msg *msg)
 {
 	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
-	u32 cmd_mode_lp = 0;
-
-	switch (dsi->hw_version) {
-	case HWVER_130:
-	case HWVER_131:
-		cmd_mode_lp = CMD_MODE_ALL_LP;
-		break;
-	case HWVER_101:
-		cmd_mode_lp = CMD_MODE_ALL_LP_V101;
-		break;
-	}
 
 	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
 		regmap_field_write(dsi->field_cmd_mode_ack_rqst_en, 1);
 
-	if (lpm)
-		regmap_field_write(dsi->field_cmd_mode_all_lp_en, cmd_mode_lp);
+	if (lpm) {
+		regmap_field_write(dsi->field_cmd_mode_gen_sw_sr_en,
+				   ENABLE_LOW_POWER);
+		regmap_field_write(dsi->field_cmd_mode_dcs_sw_sr_en, 7);
+		regmap_field_write(dsi->field_cmd_mode_gen_lw_en, 1);
+		regmap_field_write(dsi->field_cmd_mode_dcs_lw_en, 1);
+		regmap_field_write(dsi->field_cmd_mode_max_rd_pkt_size, 1);
+	}
 
 	regmap_field_write(dsi->field_phy_txrequestclkhs, lpm ? 0 : 1);
 }
@@ -1256,7 +1213,11 @@ static int dw_mipi_dsi_regmap_fields_init(struct dw_mipi_dsi *dsi)
 	INIT_FIELD(dpi_vsync_active_low);
 	INIT_FIELD(dpi_hsync_active_low);
 	INIT_FIELD(cmd_mode_ack_rqst_en);
-	INIT_FIELD(cmd_mode_all_lp_en);
+	INIT_FIELD(cmd_mode_gen_sw_sr_en);
+	INIT_FIELD(cmd_mode_dcs_sw_sr_en);
+	INIT_FIELD(cmd_mode_gen_lw_en);
+	INIT_FIELD(cmd_mode_dcs_lw_en);
+	INIT_FIELD(cmd_mode_max_rd_pkt_size);
 	INIT_FIELD(cmd_mode_en);
 	INIT_FIELD(cmd_pkt_status);
 	INIT_FIELD(vid_mode_en);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
