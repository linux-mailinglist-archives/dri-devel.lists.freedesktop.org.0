Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BB1F42E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 19:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40836E312;
	Tue,  9 Jun 2020 17:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE989D43
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id E28232A3B92
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 02/11] drm: bridge: dw_mipi_dsi: abstract register access
 using reg_fields
Date: Tue,  9 Jun 2020 20:49:50 +0300
Message-Id: <20200609174959.955926-3-adrian.ratiu@collabora.com>
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
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-imx@nxp.com,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register existence, address/offsets, field layouts, reserved bits and
so on differ between MIPI-DSI versions and between SoC vendor boards.
Despite these differences the hw IP and protocols are mostly the same
so the generic bridge can be made to compensate these differences.

The current Rockchip and STM drivers hardcoded a lot of their common
definitions in the bridge code because they're based on DSI v1.30 and
1.31 which are relatively close, but in order to support older/future
versions with more diverging layouts like the v1.01 present on imx6,
we abstract some of the register accesses via the regmap field APIs.

The bridge detects the DSI core version and initializes the required
regmap register layout. Other DSI versions / register layouts can
easily be added in the future by only changing the bridge code.

The platform drivers don't require any changes, DSI register layout
versioning will be handled transparently by the bridge, but if in
the future the regmap or layouts needs to be exposed to the drivres,
it could easily be done via plat_data or a new API in dw_mipi_dsi.h.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
Changes since v5:
  - Fix CONFIG_DEBUG_FS build (Adrian)
  - Fix DRM_MODE_FLAG_* test negation (Adrian)
  - Fixed cfg_phy_status range from [0,0] to [0,2]
  - Replace do {} while(0) with GCC extension ({}) (Andrzej)
  - Fixed payload no-op writes on STM devices (Adrian & Arnaud)

Changes since v4:
  - Move regmap infrastructure logic to a separate commit (Ezequiel)
  - Consolidate field infrastructure in this commit (Ezequiel)
  - Move the dsi v1.01 layout logic to a separate commit (Ezequiel)

Changes since v2:
  - Added const declarations to dw_mipi_dsi structs (Emil)
  - Fixed commit tags (Emil)

Changes since v1:
  - Moved register definitions & regmap initialization into bridge
  module. Platform drivers get the regmap via plat_data after calling
  the bridge probe (Emil).
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 499 ++++++++++++------
 1 file changed, 347 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 34b8668ae24ea..f453df4eb5072 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -31,6 +31,7 @@
 #include <drm/drm_probe_helper.h>
 
 #define HWVER_131			0x31333100	/* IP version 1.31 */
+#define HWVER_130			0x31333000	/* IP version 1.30 */
 
 #define DSI_VERSION			0x00
 #define VERSION				GENMASK(31, 8)
@@ -47,7 +48,6 @@
 #define DPI_VCID(vcid)			((vcid) & 0x3)
 
 #define DSI_DPI_COLOR_CODING		0x10
-#define LOOSELY18_EN			BIT(8)
 #define DPI_COLOR_CODING_16BIT_1	0x0
 #define DPI_COLOR_CODING_16BIT_2	0x1
 #define DPI_COLOR_CODING_16BIT_3	0x2
@@ -56,11 +56,6 @@
 #define DPI_COLOR_CODING_24BIT		0x5
 
 #define DSI_DPI_CFG_POL			0x14
-#define COLORM_ACTIVE_LOW		BIT(4)
-#define SHUTD_ACTIVE_LOW		BIT(3)
-#define HSYNC_ACTIVE_LOW		BIT(2)
-#define VSYNC_ACTIVE_LOW		BIT(1)
-#define DATAEN_ACTIVE_LOW		BIT(0)
 
 #define DSI_DPI_LP_CMD_TIM		0x18
 #define OUTVACT_LPCMD_TIME(p)		(((p) & 0xff) << 16)
@@ -81,27 +76,19 @@
 #define DSI_GEN_VCID			0x30
 
 #define DSI_MODE_CFG			0x34
-#define ENABLE_VIDEO_MODE		0
-#define ENABLE_CMD_MODE			BIT(0)
 
 #define DSI_VID_MODE_CFG		0x38
-#define ENABLE_LOW_POWER		(0x3f << 8)
-#define ENABLE_LOW_POWER_MASK		(0x3f << 8)
+#define ENABLE_LOW_POWER		0x3f
+
 #define VID_MODE_TYPE_NON_BURST_SYNC_PULSES	0x0
 #define VID_MODE_TYPE_NON_BURST_SYNC_EVENTS	0x1
 #define VID_MODE_TYPE_BURST			0x2
-#define VID_MODE_TYPE_MASK			0x3
-#define VID_MODE_VPG_ENABLE		BIT(16)
-#define VID_MODE_VPG_HORIZONTAL		BIT(24)
 
 #define DSI_VID_PKT_SIZE		0x3c
-#define VID_PKT_SIZE(p)			((p) & 0x3fff)
 
 #define DSI_VID_NUM_CHUNKS		0x40
-#define VID_NUM_CHUNKS(c)		((c) & 0x1fff)
 
 #define DSI_VID_NULL_SIZE		0x44
-#define VID_NULL_SIZE(b)		((b) & 0x1fff)
 
 #define DSI_VID_HSA_TIME		0x48
 #define DSI_VID_HBP_TIME		0x4c
@@ -125,7 +112,6 @@
 #define GEN_SW_2P_TX_LP			BIT(10)
 #define GEN_SW_1P_TX_LP			BIT(9)
 #define GEN_SW_0P_TX_LP			BIT(8)
-#define ACK_RQST_EN			BIT(1)
 #define TEAR_FX_EN			BIT(0)
 
 #define CMD_MODE_ALL_LP			(MAX_RD_PKT_SIZE_LP | \
@@ -154,8 +140,6 @@
 #define GEN_CMD_EMPTY			BIT(0)
 
 #define DSI_TO_CNT_CFG			0x78
-#define HSTX_TO_CNT(p)			(((p) & 0xffff) << 16)
-#define LPRX_TO_CNT(p)			((p) & 0xffff)
 
 #define DSI_HS_RD_TO_CNT		0x7c
 #define DSI_LP_RD_TO_CNT		0x80
@@ -164,52 +148,17 @@
 #define DSI_BTA_TO_CNT			0x8c
 
 #define DSI_LPCLK_CTRL			0x94
-#define AUTO_CLKLANE_CTRL		BIT(1)
-#define PHY_TXREQUESTCLKHS		BIT(0)
-
 #define DSI_PHY_TMR_LPCLK_CFG		0x98
-#define PHY_CLKHS2LP_TIME(lbcc)		(((lbcc) & 0x3ff) << 16)
-#define PHY_CLKLP2HS_TIME(lbcc)		((lbcc) & 0x3ff)
-
 #define DSI_PHY_TMR_CFG			0x9c
-#define PHY_HS2LP_TIME(lbcc)		(((lbcc) & 0xff) << 24)
-#define PHY_LP2HS_TIME(lbcc)		(((lbcc) & 0xff) << 16)
-#define MAX_RD_TIME(lbcc)		((lbcc) & 0x7fff)
-#define PHY_HS2LP_TIME_V131(lbcc)	(((lbcc) & 0x3ff) << 16)
-#define PHY_LP2HS_TIME_V131(lbcc)	((lbcc) & 0x3ff)
-
 #define DSI_PHY_RSTZ			0xa0
-#define PHY_DISFORCEPLL			0
-#define PHY_ENFORCEPLL			BIT(3)
-#define PHY_DISABLECLK			0
-#define PHY_ENABLECLK			BIT(2)
-#define PHY_RSTZ			0
-#define PHY_UNRSTZ			BIT(1)
-#define PHY_SHUTDOWNZ			0
-#define PHY_UNSHUTDOWNZ			BIT(0)
-
 #define DSI_PHY_IF_CFG			0xa4
-#define PHY_STOP_WAIT_TIME(cycle)	(((cycle) & 0xff) << 8)
-#define N_LANES(n)			(((n) - 1) & 0x3)
-
-#define DSI_PHY_ULPS_CTRL		0xa8
-#define DSI_PHY_TX_TRIGGERS		0xac
 
 #define DSI_PHY_STATUS			0xb0
 #define PHY_STOP_STATE_CLK_LANE		BIT(2)
 #define PHY_LOCK			BIT(0)
 
 #define DSI_PHY_TST_CTRL0		0xb4
-#define PHY_TESTCLK			BIT(1)
-#define PHY_UNTESTCLK			0
-#define PHY_TESTCLR			BIT(0)
-#define PHY_UNTESTCLR			0
-
 #define DSI_PHY_TST_CTRL1		0xb8
-#define PHY_TESTEN			BIT(16)
-#define PHY_UNTESTEN			0
-#define PHY_TESTDOUT(n)			(((n) & 0xff) << 8)
-#define PHY_TESTDIN(n)			((n) & 0xff)
 
 #define DSI_INT_ST0			0xbc
 #define DSI_INT_ST1			0xc0
@@ -217,7 +166,6 @@
 #define DSI_INT_MSK1			0xc8
 
 #define DSI_PHY_TMR_RD_CFG		0xf4
-#define MAX_RD_TIME_V131(lbcc)		((lbcc) & 0x7fff)
 
 #define PHY_STATUS_TIMEOUT_US		10000
 #define CMD_PKT_STATUS_TIMEOUT_US	20000
@@ -250,6 +198,53 @@ struct dw_mipi_dsi {
 	struct dw_mipi_dsi *slave; /* dual-dsi slave ptr */
 
 	const struct dw_mipi_dsi_plat_data *plat_data;
+
+	struct regmap_field	*field_dpi_18loosely_en;
+	struct regmap_field	*field_dpi_color_coding;
+	struct regmap_field	*field_dpi_vid;
+	struct regmap_field	*field_dpi_vsync_active_low;
+	struct regmap_field	*field_dpi_hsync_active_low;
+	struct regmap_field	*field_cmd_mode_ack_rqst_en;
+	struct regmap_field	*field_cmd_mode_all_lp_en;
+	struct regmap_field	*field_cmd_mode_en;
+	struct regmap_field	*field_cmd_pkt_status;
+	struct regmap_field	*field_vid_mode_en;
+	struct regmap_field	*field_vid_mode_type;
+	struct regmap_field	*field_vid_mode_low_power;
+	struct regmap_field	*field_vid_mode_vpg_en;
+	struct regmap_field	*field_vid_mode_vpg_horiz;
+	struct regmap_field	*field_vid_pkt_size;
+	struct regmap_field	*field_vid_hsa_time;
+	struct regmap_field	*field_vid_hbp_time;
+	struct regmap_field	*field_vid_hline_time;
+	struct regmap_field	*field_vid_vsa_time;
+	struct regmap_field	*field_vid_vbp_time;
+	struct regmap_field	*field_vid_vfp_time;
+	struct regmap_field	*field_vid_vactive_time;
+	struct regmap_field	*field_phy_txrequestclkhs;
+	struct regmap_field	*field_phy_bta_time;
+	struct regmap_field	*field_phy_max_rd_time;
+	struct regmap_field	*field_phy_lp2hs_time;
+	struct regmap_field	*field_phy_hs2lp_time;
+	struct regmap_field	*field_phy_clklp2hs_time;
+	struct regmap_field	*field_phy_clkhs2lp_time;
+	struct regmap_field	*field_phy_testclr;
+	struct regmap_field	*field_phy_unshutdownz;
+	struct regmap_field	*field_phy_unrstz;
+	struct regmap_field	*field_phy_enableclk;
+	struct regmap_field	*field_phy_forcepll;
+	struct regmap_field	*field_phy_nlanes;
+	struct regmap_field	*field_phy_stop_wait_time;
+	struct regmap_field	*field_phy_status;
+	struct regmap_field	*field_pckhdl_cfg;
+	struct regmap_field	*field_hstx_timeout_counter;
+	struct regmap_field	*field_lprx_timeout_counter;
+	struct regmap_field	*field_int_stat0;
+	struct regmap_field	*field_int_stat1;
+	struct regmap_field	*field_int_mask0;
+	struct regmap_field	*field_int_mask1;
+	struct regmap_field	*field_gen_hdr;
+	struct regmap_field	*field_gen_payload;
 };
 
 static const struct regmap_config dw_mipi_dsi_regmap_cfg = {
@@ -259,6 +254,111 @@ static const struct regmap_config dw_mipi_dsi_regmap_cfg = {
 	.name = "dw-mipi-dsi",
 };
 
+struct dw_mipi_dsi_variant {
+	/* Regmap field configs for DSI adapter */
+	struct reg_field	cfg_dpi_18loosely_en;
+	struct reg_field	cfg_dpi_color_coding;
+	struct reg_field	cfg_dpi_vid;
+	struct reg_field	cfg_dpi_vsync_active_low;
+	struct reg_field	cfg_dpi_hsync_active_low;
+	struct reg_field	cfg_cmd_mode_en;
+	struct reg_field	cfg_cmd_mode_ack_rqst_en;
+	struct reg_field	cfg_cmd_mode_all_lp_en;
+	struct reg_field	cfg_cmd_pkt_status;
+	struct reg_field	cfg_vid_mode_en;
+	struct reg_field	cfg_vid_mode_type;
+	struct reg_field	cfg_vid_mode_low_power;
+	struct reg_field	cfg_vid_mode_vpg_en;
+	struct reg_field	cfg_vid_mode_vpg_horiz;
+	struct reg_field	cfg_vid_pkt_size;
+	struct reg_field	cfg_vid_hsa_time;
+	struct reg_field	cfg_vid_hbp_time;
+	struct reg_field	cfg_vid_hline_time;
+	struct reg_field	cfg_vid_vsa_time;
+	struct reg_field	cfg_vid_vbp_time;
+	struct reg_field	cfg_vid_vfp_time;
+	struct reg_field	cfg_vid_vactive_time;
+	struct reg_field	cfg_phy_txrequestclkhs;
+	struct reg_field	cfg_phy_bta_time;
+	struct reg_field	cfg_phy_max_rd_time;
+	struct reg_field	cfg_phy_lp2hs_time;
+	struct reg_field	cfg_phy_hs2lp_time;
+	struct reg_field	cfg_phy_max_rd_time_v131;
+	struct reg_field	cfg_phy_lp2hs_time_v131;
+	struct reg_field	cfg_phy_hs2lp_time_v131;
+	struct reg_field	cfg_phy_clklp2hs_time;
+	struct reg_field	cfg_phy_clkhs2lp_time;
+	struct reg_field	cfg_phy_testclr;
+	struct reg_field	cfg_phy_unshutdownz;
+	struct reg_field	cfg_phy_unrstz;
+	struct reg_field	cfg_phy_enableclk;
+	struct reg_field	cfg_phy_forcepll;
+	struct reg_field	cfg_phy_nlanes;
+	struct reg_field	cfg_phy_stop_wait_time;
+	struct reg_field	cfg_phy_status;
+	struct reg_field	cfg_pckhdl_cfg;
+	struct reg_field	cfg_hstx_timeout_counter;
+	struct reg_field	cfg_lprx_timeout_counter;
+	struct reg_field	cfg_int_stat0;
+	struct reg_field	cfg_int_stat1;
+	struct reg_field	cfg_int_mask0;
+	struct reg_field	cfg_int_mask1;
+	struct reg_field	cfg_gen_hdr;
+	struct reg_field	cfg_gen_payload;
+};
+
+static const struct dw_mipi_dsi_variant dw_mipi_dsi_v130_v131_layout = {
+	.cfg_dpi_color_coding =		REG_FIELD(DSI_DPI_COLOR_CODING, 0, 3),
+	.cfg_dpi_18loosely_en =		REG_FIELD(DSI_DPI_COLOR_CODING, 8, 8),
+	.cfg_dpi_vid =			REG_FIELD(DSI_DPI_VCID, 0, 2),
+	.cfg_dpi_vsync_active_low =	REG_FIELD(DSI_DPI_CFG_POL, 1, 1),
+	.cfg_dpi_hsync_active_low =	REG_FIELD(DSI_DPI_CFG_POL, 2, 2),
+	.cfg_cmd_mode_ack_rqst_en =	REG_FIELD(DSI_CMD_MODE_CFG, 1, 1),
+	.cfg_cmd_mode_all_lp_en =	REG_FIELD(DSI_CMD_MODE_CFG, 8, 24),
+	.cfg_cmd_mode_en =		REG_FIELD(DSI_MODE_CFG, 0, 31),
+	.cfg_cmd_pkt_status =		REG_FIELD(DSI_CMD_PKT_STATUS, 0, 31),
+	.cfg_vid_mode_en =		REG_FIELD(DSI_MODE_CFG, 0, 31),
+	.cfg_vid_mode_type =		REG_FIELD(DSI_VID_MODE_CFG, 0, 1),
+	.cfg_vid_mode_low_power =	REG_FIELD(DSI_VID_MODE_CFG, 8, 13),
+	.cfg_vid_mode_vpg_en =		REG_FIELD(DSI_VID_MODE_CFG, 16, 16),
+	.cfg_vid_mode_vpg_horiz =	REG_FIELD(DSI_VID_MODE_CFG, 24, 24),
+	.cfg_vid_pkt_size =		REG_FIELD(DSI_VID_PKT_SIZE, 0, 10),
+	.cfg_vid_hsa_time =		REG_FIELD(DSI_VID_HSA_TIME, 0, 31),
+	.cfg_vid_hbp_time =		REG_FIELD(DSI_VID_HBP_TIME, 0, 31),
+	.cfg_vid_hline_time =		REG_FIELD(DSI_VID_HLINE_TIME, 0, 31),
+	.cfg_vid_vsa_time =		REG_FIELD(DSI_VID_VSA_LINES, 0, 31),
+	.cfg_vid_vbp_time =		REG_FIELD(DSI_VID_VBP_LINES, 0, 31),
+	.cfg_vid_vfp_time =		REG_FIELD(DSI_VID_VFP_LINES, 0, 31),
+	.cfg_vid_vactive_time =		REG_FIELD(DSI_VID_VACTIVE_LINES, 0, 31),
+	.cfg_phy_txrequestclkhs =	REG_FIELD(DSI_LPCLK_CTRL, 0, 0),
+	.cfg_phy_bta_time =		REG_FIELD(DSI_BTA_TO_CNT, 0, 31),
+	.cfg_phy_max_rd_time =		REG_FIELD(DSI_PHY_TMR_CFG, 0, 15),
+	.cfg_phy_lp2hs_time =		REG_FIELD(DSI_PHY_TMR_CFG, 16, 23),
+	.cfg_phy_hs2lp_time =		REG_FIELD(DSI_PHY_TMR_CFG, 24, 31),
+	.cfg_phy_max_rd_time_v131 =	REG_FIELD(DSI_PHY_TMR_RD_CFG, 0, 15),
+	.cfg_phy_lp2hs_time_v131 =	REG_FIELD(DSI_PHY_TMR_CFG, 0, 15),
+	.cfg_phy_hs2lp_time_v131 =	REG_FIELD(DSI_PHY_TMR_CFG, 16, 31),
+	.cfg_phy_clklp2hs_time =	REG_FIELD(DSI_PHY_TMR_LPCLK_CFG, 0, 15),
+	.cfg_phy_clkhs2lp_time =	REG_FIELD(DSI_PHY_TMR_LPCLK_CFG, 16, 31),
+	.cfg_phy_testclr =		REG_FIELD(DSI_PHY_TST_CTRL0, 0, 0),
+	.cfg_phy_unshutdownz =		REG_FIELD(DSI_PHY_RSTZ, 0, 0),
+	.cfg_phy_unrstz =		REG_FIELD(DSI_PHY_RSTZ, 1, 1),
+	.cfg_phy_enableclk =		REG_FIELD(DSI_PHY_RSTZ, 2, 2),
+	.cfg_phy_forcepll =		REG_FIELD(DSI_PHY_RSTZ, 3, 3),
+	.cfg_phy_nlanes =		REG_FIELD(DSI_PHY_IF_CFG, 0, 1),
+	.cfg_phy_stop_wait_time =	REG_FIELD(DSI_PHY_IF_CFG, 8, 15),
+	.cfg_phy_status =		REG_FIELD(DSI_PHY_STATUS, 0, 2),
+	.cfg_pckhdl_cfg =		REG_FIELD(DSI_PCKHDL_CFG, 0, 4),
+	.cfg_hstx_timeout_counter =	REG_FIELD(DSI_TO_CNT_CFG, 16, 31),
+	.cfg_lprx_timeout_counter =	REG_FIELD(DSI_TO_CNT_CFG, 0, 15),
+	.cfg_int_stat0 =		REG_FIELD(DSI_INT_ST0, 0, 31),
+	.cfg_int_stat1 =		REG_FIELD(DSI_INT_ST1, 0, 31),
+	.cfg_int_mask0 =		REG_FIELD(DSI_INT_MSK0, 0, 31),
+	.cfg_int_mask1 =		REG_FIELD(DSI_INT_MSK1, 0, 31),
+	.cfg_gen_hdr =			REG_FIELD(DSI_GEN_HDR, 0, 31),
+	.cfg_gen_payload =		REG_FIELD(DSI_GEN_PLD_DATA, 0, 31),
+};
+
 /*
  * Check if either a link to a master or slave is present
  */
@@ -359,15 +459,22 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 				   const struct mipi_dsi_msg *msg)
 {
 	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
-	u32 val = 0;
+	u32 cmd_mode_lp = 0;
+
+	switch (dsi->hw_version) {
+	case HWVER_130:
+	case HWVER_131:
+		cmd_mode_lp = CMD_MODE_ALL_LP;
+		break;
+	}
 
 	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
-		val |= ACK_RQST_EN;
+		regmap_field_write(dsi->field_cmd_mode_ack_rqst_en, 1);
+
 	if (lpm)
-		val |= CMD_MODE_ALL_LP;
+		regmap_field_write(dsi->field_cmd_mode_all_lp_en, cmd_mode_lp);
 
-	regmap_write(dsi->regs, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
-	regmap_write(dsi->regs, DSI_CMD_MODE_CFG, val);
+	regmap_field_write(dsi->field_phy_txrequestclkhs, lpm ? 0 : 1);
 }
 
 static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
@@ -375,18 +482,18 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
 	int ret;
 	u32 val, mask;
 
-	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
-				       val, !(val & GEN_CMD_FULL), 1000,
-				       CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_field_read_poll_timeout(dsi->field_cmd_pkt_status,
+					     val, !(val & GEN_CMD_FULL),
+					     1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "failed to get available command FIFO\n");
 		return ret;
 	}
 
-	regmap_write(dsi->regs, DSI_GEN_HDR, hdr_val);
+	regmap_field_write(dsi->field_gen_hdr, hdr_val);
 
 	mask = GEN_CMD_EMPTY | GEN_PLD_W_EMPTY;
-	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
+	ret = regmap_field_read_poll_timeout(dsi->field_cmd_pkt_status,
 				       val, (val & mask) == mask,
 				       1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
@@ -409,20 +516,22 @@ static int dw_mipi_dsi_write(struct dw_mipi_dsi *dsi,
 		if (len < pld_data_bytes) {
 			word = 0;
 			memcpy(&word, tx_buf, len);
-			regmap_write(dsi->regs, DSI_GEN_PLD_DATA,
-				     le32_to_cpu(word));
+			regmap_field_force_write(dsi->field_gen_payload,
+						 le32_to_cpu(word));
 			len = 0;
 		} else {
 			memcpy(&word, tx_buf, pld_data_bytes);
-			regmap_write(dsi->regs, DSI_GEN_PLD_DATA,
-				     le32_to_cpu(word));
+			regmap_field_force_write(dsi->field_gen_payload,
+						 le32_to_cpu(word));
 			tx_buf += pld_data_bytes;
 			len -= pld_data_bytes;
 		}
 
-		ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
-					       val, !(val & GEN_PLD_W_FULL),
-					       1000, CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_field_read_poll_timeout(dsi->field_cmd_pkt_status,
+						     val,
+						     !(val & GEN_PLD_W_FULL),
+						     1000,
+						     CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev,
 				"failed to get available write payload FIFO\n");
@@ -443,9 +552,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 	u32 val;
 
 	/* Wait end of the read operation */
-	ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
-				       val, !(val & GEN_RD_CMD_BUSY),
-				       1000, CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_field_read_poll_timeout(dsi->field_cmd_pkt_status,
+					     val, !(val & GEN_RD_CMD_BUSY),
+					     1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "Timeout during read operation\n");
 		return ret;
@@ -453,15 +562,17 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 
 	for (i = 0; i < len; i += 4) {
 		/* Read fifo must not be empty before all bytes are read */
-		ret = regmap_read_poll_timeout(dsi->regs, DSI_CMD_PKT_STATUS,
-					       val, !(val & GEN_PLD_R_EMPTY),
-					       1000, CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_field_read_poll_timeout(dsi->field_cmd_pkt_status,
+						     val,
+						     !(val & GEN_PLD_R_EMPTY),
+						     1000,
+						     CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev, "Read payload FIFO is empty\n");
 			return ret;
 		}
 
-		regmap_read(dsi->regs, DSI_GEN_PLD_DATA, &val);
+		regmap_field_read(dsi->field_gen_payload, &val);
 		for (j = 0; j < 4 && j + i < len; j++)
 			buf[i + j] = val >> (8 * j);
 	}
@@ -515,30 +626,30 @@ static const struct mipi_dsi_host_ops dw_mipi_dsi_host_ops = {
 
 static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 {
-	u32 val;
-
 	/*
 	 * TODO dw drv improvements
 	 * enabling low power is panel-dependent, we should use the
 	 * panel configuration here...
 	 */
-	val = ENABLE_LOW_POWER;
+	regmap_field_write(dsi->field_vid_mode_low_power, ENABLE_LOW_POWER);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		val |= VID_MODE_TYPE_BURST;
+		regmap_field_write(dsi->field_vid_mode_type,
+				   VID_MODE_TYPE_BURST);
 	else if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
+		regmap_field_write(dsi->field_vid_mode_type,
+				   VID_MODE_TYPE_NON_BURST_SYNC_PULSES);
 	else
-		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
+		regmap_field_write(dsi->field_vid_mode_type,
+				   VID_MODE_TYPE_NON_BURST_SYNC_EVENTS);
 
 #ifdef CONFIG_DEBUG_FS
 	if (dsi->vpg) {
-		val |= VID_MODE_VPG_ENABLE;
-		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
+		regmap_field_write(dsi->field_vid_mode_vpg_en, 1);
+		regmap_field_write(dsi->field_vid_mode_vpg_horiz,
+				   dsi->vpg_horizontal ? 1 : 0);
 	}
 #endif /* CONFIG_DEBUG_FS */
-
-	regmap_write(dsi->regs, DSI_VID_MODE_CFG, val);
 }
 
 static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
@@ -547,11 +658,13 @@ static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
 	regmap_write(dsi->regs, DSI_PWR_UP, RESET);
 
 	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
-		regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
+		regmap_field_write(dsi->field_cmd_mode_en, 0);
+
 		dw_mipi_dsi_video_mode_config(dsi);
-		regmap_write(dsi->regs, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
+
+		regmap_field_write(dsi->field_phy_txrequestclkhs, 1);
 	} else {
-		regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE);
+		regmap_field_write(dsi->field_cmd_mode_en, 1);
 	}
 
 	regmap_write(dsi->regs, DSI_PWR_UP, POWERUP);
@@ -560,7 +673,7 @@ static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
 static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
 {
 	regmap_write(dsi->regs, DSI_PWR_UP, RESET);
-	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_RSTZ);
+	regmap_field_write(dsi->field_phy_unrstz, 0);
 }
 
 static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
@@ -589,14 +702,15 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 				   const struct drm_display_mode *mode)
 {
-	u32 val = 0, color = 0;
+	u32 color = 0;
 
 	switch (dsi->format) {
 	case MIPI_DSI_FMT_RGB888:
 		color = DPI_COLOR_CODING_24BIT;
 		break;
 	case MIPI_DSI_FMT_RGB666:
-		color = DPI_COLOR_CODING_18BIT_2 | LOOSELY18_EN;
+		color = DPI_COLOR_CODING_18BIT_2;
+		regmap_field_write(dsi->field_dpi_18loosely_en, 1);
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
 		color = DPI_COLOR_CODING_18BIT_1;
@@ -606,14 +720,14 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 		break;
 	}
 
+	regmap_field_write(dsi->field_dpi_vid, DPI_VCID(dsi->channel));
+	regmap_field_write(dsi->field_dpi_color_coding, color);
+
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		val |= VSYNC_ACTIVE_LOW;
+		regmap_field_write(dsi->field_dpi_vsync_active_low, 1);
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		val |= HSYNC_ACTIVE_LOW;
+		regmap_field_write(dsi->field_dpi_hsync_active_low, 1);
 
-	regmap_write(dsi->regs, DSI_DPI_VCID, DPI_VCID(dsi->channel));
-	regmap_write(dsi->regs, DSI_DPI_COLOR_CODING, color);
-	regmap_write(dsi->regs, DSI_DPI_CFG_POL, val);
 	/*
 	 * TODO dw drv improvements
 	 * largest packet sizes during hfp or during vsa/vpb/vfp
@@ -626,7 +740,8 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 
 static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
 {
-	regmap_write(dsi->regs, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
+	regmap_field_write(dsi->field_pckhdl_cfg,
+			   CRC_RX_EN | ECC_RX_EN | BTA_EN);
 }
 
 static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
@@ -639,11 +754,9 @@ static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
 	 * DSI_VNPCR.NPSIZE... especially because this driver supports
 	 * non-burst video modes, see dw_mipi_dsi_video_mode_config()...
 	 */
-
-	regmap_write(dsi->regs, DSI_VID_PKT_SIZE,
-		       dw_mipi_is_dual_mode(dsi) ?
-				VID_PKT_SIZE(mode->hdisplay / 2) :
-				VID_PKT_SIZE(mode->hdisplay));
+	regmap_field_write(dsi->field_vid_pkt_size,
+			   dw_mipi_is_dual_mode(dsi) ?
+				mode->hdisplay / 2 : mode->hdisplay);
 }
 
 static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
@@ -653,15 +766,17 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	regmap_write(dsi->regs, DSI_TO_CNT_CFG,
-		     HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	regmap_field_write(dsi->field_hstx_timeout_counter, 1000);
+	regmap_field_write(dsi->field_lprx_timeout_counter, 1000);
+
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
 	 * according to byte lane...
 	 */
-	regmap_write(dsi->regs, DSI_BTA_TO_CNT, 0xd00);
-	regmap_write(dsi->regs, DSI_MODE_CFG, ENABLE_CMD_MODE);
+	regmap_field_write(dsi->field_phy_bta_time, 0xd00);
+
+	regmap_field_write(dsi->field_cmd_mode_en, 1);
 }
 
 /* Get lane byte clock cycles. */
@@ -695,13 +810,13 @@ static void dw_mipi_dsi_line_timer_config(struct dw_mipi_dsi *dsi,
 	 * computations below may be improved...
 	 */
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, htotal);
-	regmap_write(dsi->regs, DSI_VID_HLINE_TIME, lbcc);
+	regmap_field_write(dsi->field_vid_hline_time, lbcc);
 
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hsa);
-	regmap_write(dsi->regs, DSI_VID_HSA_TIME, lbcc);
+	regmap_field_write(dsi->field_vid_hsa_time, lbcc);
 
 	lbcc = dw_mipi_dsi_get_hcomponent_lbcc(dsi, mode, hbp);
-	regmap_write(dsi->regs, DSI_VID_HBP_TIME, lbcc);
+	regmap_field_write(dsi->field_vid_hbp_time, lbcc);
 }
 
 static void dw_mipi_dsi_vertical_timing_config(struct dw_mipi_dsi *dsi,
@@ -714,10 +829,10 @@ static void dw_mipi_dsi_vertical_timing_config(struct dw_mipi_dsi *dsi,
 	vfp = mode->vsync_start - mode->vdisplay;
 	vbp = mode->vtotal - mode->vsync_end;
 
-	regmap_write(dsi->regs, DSI_VID_VACTIVE_LINES, vactive);
-	regmap_write(dsi->regs, DSI_VID_VSA_LINES, vsa);
-	regmap_write(dsi->regs, DSI_VID_VFP_LINES, vfp);
-	regmap_write(dsi->regs, DSI_VID_VBP_LINES, vbp);
+	regmap_field_write(dsi->field_vid_vactive_time, vactive);
+	regmap_field_write(dsi->field_vid_vsa_time, vsa);
+	regmap_field_write(dsi->field_vid_vfp_time, vfp);
+	regmap_field_write(dsi->field_vid_vbp_time, vbp);
 }
 
 static void dw_mipi_dsi_dphy_timing_config(struct dw_mipi_dsi *dsi)
@@ -738,23 +853,12 @@ static void dw_mipi_dsi_dphy_timing_config(struct dw_mipi_dsi *dsi)
 	 * note: DSI_PHY_TMR_CFG.MAX_RD_TIME should be in line with
 	 * DSI_CMD_MODE_CFG.MAX_RD_PKT_SIZE_LP (see CMD_MODE_ALL_LP)
 	 */
+	regmap_field_write(dsi->field_phy_lp2hs_time, timing.data_lp2hs);
+	regmap_field_write(dsi->field_phy_hs2lp_time, timing.data_hs2lp);
 
-	if (dsi->hw_version >= HWVER_131) {
-		regmap_write(dsi->regs, DSI_PHY_TMR_CFG,
-			     PHY_HS2LP_TIME_V131(timing.data_hs2lp) |
-			     PHY_LP2HS_TIME_V131(timing.data_lp2hs));
-		regmap_write(dsi->regs, DSI_PHY_TMR_RD_CFG,
-			     MAX_RD_TIME_V131(10000));
-	} else {
-		regmap_write(dsi->regs, DSI_PHY_TMR_CFG,
-			     PHY_HS2LP_TIME(timing.data_hs2lp) |
-			     PHY_LP2HS_TIME(timing.data_lp2hs) |
-			     MAX_RD_TIME(10000));
-	}
-
-	regmap_write(dsi->regs, DSI_PHY_TMR_LPCLK_CFG,
-		     PHY_CLKHS2LP_TIME(timing.clk_hs2lp) |
-		     PHY_CLKLP2HS_TIME(timing.clk_lp2hs));
+	regmap_field_write(dsi->field_phy_max_rd_time, 10000);
+	regmap_field_write(dsi->field_phy_clkhs2lp_time, timing.clk_hs2lp);
+	regmap_field_write(dsi->field_phy_clklp2hs_time, timing.clk_lp2hs);
 }
 
 static void dw_mipi_dsi_dphy_interface_config(struct dw_mipi_dsi *dsi)
@@ -764,18 +868,22 @@ static void dw_mipi_dsi_dphy_interface_config(struct dw_mipi_dsi *dsi)
 	 * stop wait time should be the maximum between host dsi
 	 * and panel stop wait times
 	 */
-	regmap_write(dsi->regs, DSI_PHY_IF_CFG,
-		     PHY_STOP_WAIT_TIME(0x20) | N_LANES(dsi->lanes));
+	regmap_field_write(dsi->field_phy_stop_wait_time, 0x20);
+	regmap_field_write(dsi->field_phy_nlanes, dsi->lanes - 1);
 }
 
 static void dw_mipi_dsi_dphy_init(struct dw_mipi_dsi *dsi)
 {
 	/* Clear PHY state */
-	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_DISFORCEPLL | PHY_DISABLECLK
-		     | PHY_RSTZ | PHY_SHUTDOWNZ);
-	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
-	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_TESTCLR);
-	regmap_write(dsi->regs, DSI_PHY_TST_CTRL0, PHY_UNTESTCLR);
+	regmap_field_write(dsi->field_phy_enableclk, 0);
+	regmap_field_write(dsi->field_phy_unrstz, 0);
+	regmap_field_write(dsi->field_phy_unshutdownz, 0);
+
+	regmap_field_write(dsi->field_phy_forcepll, 0);
+
+	regmap_field_write(dsi->field_phy_testclr, 0);
+	regmap_field_write(dsi->field_phy_testclr, 1);
+	regmap_field_write(dsi->field_phy_testclr, 0);
 }
 
 static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
@@ -783,18 +891,21 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
 	u32 val;
 	int ret;
 
-	regmap_write(dsi->regs, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
-		     PHY_UNRSTZ | PHY_UNSHUTDOWNZ);
+	regmap_field_write(dsi->field_phy_enableclk, 1);
+	regmap_field_write(dsi->field_phy_unrstz, 1);
+	regmap_field_write(dsi->field_phy_unshutdownz, 1);
 
-	ret = regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS,
-				       val, val & PHY_LOCK,
-				       1000, PHY_STATUS_TIMEOUT_US);
+	regmap_field_write(dsi->field_phy_forcepll, 1);
+
+	ret = regmap_field_read_poll_timeout(dsi->field_phy_status,
+					     val, val & PHY_LOCK,
+					     1000, PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy lock state\n");
 
-	ret = regmap_read_poll_timeout(dsi->regs, DSI_PHY_STATUS,
-				       val, val & PHY_STOP_STATE_CLK_LANE, 1000,
-				       PHY_STATUS_TIMEOUT_US);
+	ret = regmap_field_read_poll_timeout(dsi->field_phy_status,
+					     val, val & PHY_STOP_STATE_CLK_LANE,
+					     1000, PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy clk lane stop state\n");
 }
@@ -803,10 +914,10 @@ static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
 {
 	u32 val;
 
-	regmap_read(dsi->regs, DSI_INT_ST0, &val);
-	regmap_read(dsi->regs, DSI_INT_ST1, &val);
-	regmap_write(dsi->regs, DSI_INT_MSK0, 0);
-	regmap_write(dsi->regs, DSI_INT_MSK1, 0);
+	regmap_field_read(dsi->field_int_stat0, &val);
+	regmap_field_read(dsi->field_int_stat1, &val);
+	regmap_field_write(dsi->field_int_mask0, 0);
+	regmap_field_write(dsi->field_int_mask1, 0);
 }
 
 static void dw_mipi_dsi_bridge_post_disable(struct drm_bridge *bridge)
@@ -1005,6 +1116,84 @@ static int dw_mipi_dsi_get_hw_version(struct dw_mipi_dsi *dsi)
 	return 0;
 }
 
+#define INIT_FIELD(f) INIT_FIELD_CFG(field_##f, cfg_##f)
+#define INIT_FIELD_CFG(f, conf)	({					\
+		dsi->f = devm_regmap_field_alloc(dsi->dev, dsi->regs,	\
+						 variant->conf);	\
+		if (IS_ERR(dsi->f))					\
+			dev_warn(dsi->dev, "Ignoring regmap field " #f "\n"); })
+
+static int dw_mipi_dsi_regmap_fields_init(struct dw_mipi_dsi *dsi)
+{
+	const struct dw_mipi_dsi_variant *variant;
+
+	switch (dsi->hw_version) {
+	case HWVER_130:
+	case HWVER_131:
+		variant = &dw_mipi_dsi_v130_v131_layout;
+		break;
+	default:
+		DRM_ERROR("Unrecognized DSI host controller HW revision\n");
+		return -ENODEV;
+	}
+
+	INIT_FIELD(dpi_18loosely_en);
+	INIT_FIELD(dpi_vid);
+	INIT_FIELD(dpi_color_coding);
+	INIT_FIELD(dpi_vsync_active_low);
+	INIT_FIELD(dpi_hsync_active_low);
+	INIT_FIELD(cmd_mode_ack_rqst_en);
+	INIT_FIELD(cmd_mode_all_lp_en);
+	INIT_FIELD(cmd_mode_en);
+	INIT_FIELD(cmd_pkt_status);
+	INIT_FIELD(vid_mode_en);
+	INIT_FIELD(vid_mode_type);
+	INIT_FIELD(vid_mode_low_power);
+	INIT_FIELD(vid_pkt_size);
+	INIT_FIELD(vid_hsa_time);
+	INIT_FIELD(vid_hbp_time);
+	INIT_FIELD(vid_hline_time);
+	INIT_FIELD(vid_vsa_time);
+	INIT_FIELD(vid_vbp_time);
+	INIT_FIELD(vid_vfp_time);
+	INIT_FIELD(vid_vactive_time);
+	INIT_FIELD(phy_txrequestclkhs);
+	INIT_FIELD(phy_testclr);
+	INIT_FIELD(phy_unshutdownz);
+	INIT_FIELD(phy_unrstz);
+	INIT_FIELD(phy_enableclk);
+	INIT_FIELD(phy_nlanes);
+	INIT_FIELD(phy_stop_wait_time);
+	INIT_FIELD(phy_status);
+	INIT_FIELD(pckhdl_cfg);
+	INIT_FIELD(hstx_timeout_counter);
+	INIT_FIELD(lprx_timeout_counter);
+	INIT_FIELD(int_stat0);
+	INIT_FIELD(int_stat1);
+	INIT_FIELD(int_mask0);
+	INIT_FIELD(int_mask1);
+	INIT_FIELD(gen_hdr);
+	INIT_FIELD(gen_payload);
+	INIT_FIELD(phy_bta_time);
+	INIT_FIELD(vid_mode_vpg_en);
+	INIT_FIELD(vid_mode_vpg_horiz);
+	INIT_FIELD(phy_clklp2hs_time);
+	INIT_FIELD(phy_clkhs2lp_time);
+	INIT_FIELD(phy_forcepll);
+
+	if (dsi->hw_version == HWVER_131) {
+		INIT_FIELD_CFG(field_phy_max_rd_time, cfg_phy_max_rd_time_v131);
+		INIT_FIELD_CFG(field_phy_lp2hs_time, cfg_phy_lp2hs_time_v131);
+		INIT_FIELD_CFG(field_phy_hs2lp_time, cfg_phy_hs2lp_time_v131);
+	} else {
+		INIT_FIELD(phy_max_rd_time);
+		INIT_FIELD(phy_lp2hs_time);
+		INIT_FIELD(phy_hs2lp_time);
+	}
+
+	return 0;
+}
+
 static struct dw_mipi_dsi *
 __dw_mipi_dsi_probe(struct platform_device *pdev,
 		    const struct dw_mipi_dsi_plat_data *plat_data)
@@ -1085,6 +1274,12 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		return ERR_PTR(ret);
 	}
 
+	ret = dw_mipi_dsi_regmap_fields_init(dsi);
+	if (ret) {
+		dev_err(dev, "Failed to init register layout map: %d\n", ret);
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
