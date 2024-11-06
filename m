Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979E9BE980
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 13:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36D10E6D1;
	Wed,  6 Nov 2024 12:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ldo25XF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70410E6CB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mP5vPSB7lj6KEcYRNlcFbIWqijPXPAhvPLnSS85M1Y=; b=ldo25XF7Vdy7pyXrmDHTTYimAh
 m+APd0ECPyQ/WheI5ggFwil8ZisGnOj7VbEzWpjdalNRqy4PuH1v4k7iqOArfoVhAN36r7u/mUMcH
 lRj2QBVu39gf2YsWdcliX7pB960JkKUWgISwquoPaPj/6YMdm88q019tkfdrGG4tiVf0kjBMMlHwY
 RhqVDscuxzyzDF2ojeXU0J3cP3xMMxBPf6NTegXDEUwrvRW7u8UaYhfVfy2w/Fc05cnrgu6Cz/SRX
 9XeDBE3130nZYT2IAwHo1HIrUqEEVmsPBzp2Pb0uS4Q3K9FJtLGpxiUpuzzCK5kb4vxFEF44uQI2e
 ZX5JMuPg==;
Received: from i53875b28.versanet.de ([83.135.91.40]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t8fEo-00076s-Hs; Wed, 06 Nov 2024 13:34:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
Date: Wed,  6 Nov 2024 13:33:02 +0100
Message-ID: <20241106123304.422854-2-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106123304.422854-1-heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
DSI2 host controller, based on the Rockchip version from the driver
rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.

While the driver is heavily modelled after the previous IP, the register
set of this DSI2 controller is completely different and there are also
additional properties like the variable-width phy interface.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
 .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1034 +++++++++++++++++
 include/drm/bridge/dw_mipi_dsi2.h             |   94 ++
 4 files changed, 1135 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
 create mode 100644 include/drm/bridge/dw_mipi_dsi2.h

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index ca416dab156d..f3ab2f985f8c 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -59,3 +59,9 @@ config DRM_DW_MIPI_DSI
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+
+config DRM_DW_MIPI_DSI2
+	tristate
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
index 9869d9651ed1..9dc376d220ad 100644
--- a/drivers/gpu/drm/bridge/synopsys/Makefile
+++ b/drivers/gpu/drm/bridge/synopsys/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_DW_HDMI_CEC) += dw-hdmi-cec.o
 obj-$(CONFIG_DRM_DW_HDMI_QP) += dw-hdmi-qp.o
 
 obj-$(CONFIG_DRM_DW_MIPI_DSI) += dw-mipi-dsi.o
+obj-$(CONFIG_DRM_DW_MIPI_DSI2) += dw-mipi-dsi2.o
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
new file mode 100644
index 000000000000..43738fe3cb93
--- /dev/null
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -0,0 +1,1034 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2024, Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * Modified by Heiko Stuebner <heiko.stuebner@cherry.de>
+ * This generic Synopsys DesignWare MIPI DSI2 host driver is based on the
+ * Rockchip version from rockchip/dw-mipi-dsi2.c converted to use bridge APIs.
+ */
+
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/bridge/dw_mipi_dsi2.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+#define UPDATE(v, h, l)			(((v) << (l)) & GENMASK((h), (l)))
+
+#define DSI2_PWR_UP			0x000c
+#define RESET				0
+#define POWER_UP			BIT(0)
+#define CMD_TX_MODE(x)			UPDATE(x,  24,  24)
+#define DSI2_SOFT_RESET			0x0010
+#define SYS_RSTN			BIT(2)
+#define PHY_RSTN			BIT(1)
+#define IPI_RSTN			BIT(0)
+#define INT_ST_MAIN			0x0014
+#define DSI2_MODE_CTRL			0x0018
+#define DSI2_MODE_STATUS		0x001c
+#define DSI2_CORE_STATUS		0x0020
+#define PRI_RD_DATA_AVAIL		BIT(26)
+#define PRI_FIFOS_NOT_EMPTY		BIT(25)
+#define PRI_BUSY			BIT(24)
+#define CRI_RD_DATA_AVAIL		BIT(18)
+#define CRT_FIFOS_NOT_EMPTY		BIT(17)
+#define CRI_BUSY			BIT(16)
+#define IPI_FIFOS_NOT_EMPTY		BIT(9)
+#define IPI_BUSY			BIT(8)
+#define CORE_FIFOS_NOT_EMPTY		BIT(1)
+#define CORE_BUSY			BIT(0)
+#define MANUAL_MODE_CFG			0x0024
+#define MANUAL_MODE_EN			BIT(0)
+#define DSI2_TIMEOUT_HSTX_CFG		0x0048
+#define TO_HSTX(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_HSTXRDY_CFG	0x004c
+#define TO_HSTXRDY(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_LPRX_CFG		0x0050
+#define TO_LPRXRDY(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_LPTXRDY_CFG	0x0054
+#define TO_LPTXRDY(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_LPTXTRIG_CFG	0x0058
+#define TO_LPTXTRIG(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_LPTXULPS_CFG	0x005c
+#define TO_LPTXULPS(x)			UPDATE(x, 15, 0)
+#define DSI2_TIMEOUT_BTA_CFG		0x60
+#define TO_BTA(x)			UPDATE(x, 15, 0)
+
+#define DSI2_PHY_MODE_CFG		0x0100
+#define PPI_WIDTH(x)			UPDATE(x, 9, 8)
+#define PHY_LANES(x)			UPDATE((x) - 1, 5, 4)
+#define PHY_TYPE(x)			UPDATE(x, 0, 0)
+#define DSI2_PHY_CLK_CFG		0X0104
+#define PHY_LPTX_CLK_DIV(x)		UPDATE(x, 12, 8)
+#define CLK_TYPE_MASK			BIT(0)
+#define NON_CONTINUOUS_CLK		BIT(0)
+#define CONTINUOUS_CLK			0
+#define DSI2_PHY_LP2HS_MAN_CFG		0x010c
+#define PHY_LP2HS_TIME(x)		UPDATE(x, 28, 0)
+#define DSI2_PHY_HS2LP_MAN_CFG		0x0114
+#define PHY_HS2LP_TIME(x)		UPDATE(x, 28, 0)
+#define DSI2_PHY_MAX_RD_T_MAN_CFG	0x011c
+#define PHY_MAX_RD_TIME(x)		UPDATE(x, 26, 0)
+#define DSI2_PHY_ESC_CMD_T_MAN_CFG	0x0124
+#define PHY_ESC_CMD_TIME(x)		UPDATE(x, 28, 0)
+#define DSI2_PHY_ESC_BYTE_T_MAN_CFG	0x012c
+#define PHY_ESC_BYTE_TIME(x)		UPDATE(x, 28, 0)
+
+#define DSI2_PHY_IPI_RATIO_MAN_CFG	0x0134
+#define PHY_IPI_RATIO(x)		UPDATE(x, 21, 0)
+#define DSI2_PHY_SYS_RATIO_MAN_CFG	0x013C
+#define PHY_SYS_RATIO(x)		UPDATE(x, 16, 0)
+
+#define DSI2_DSI_GENERAL_CFG		0x0200
+#define BTA_EN				BIT(1)
+#define EOTP_TX_EN			BIT(0)
+#define DSI2_DSI_VCID_CFG		0x0204
+#define TX_VCID(x)			UPDATE(x, 1, 0)
+#define DSI2_DSI_SCRAMBLING_CFG		0x0208
+#define SCRAMBLING_SEED(x)		UPDATE(x, 31, 16)
+#define SCRAMBLING_EN			BIT(0)
+#define DSI2_DSI_VID_TX_CFG		0x020c
+#define LPDT_DISPLAY_CMD_EN		BIT(20)
+#define BLK_VFP_HS_EN			BIT(14)
+#define BLK_VBP_HS_EN			BIT(13)
+#define BLK_VSA_HS_EN			BIT(12)
+#define BLK_HFP_HS_EN			BIT(6)
+#define BLK_HBP_HS_EN			BIT(5)
+#define BLK_HSA_HS_EN			BIT(4)
+#define VID_MODE_TYPE(x)		UPDATE(x, 1, 0)
+#define DSI2_CRI_TX_HDR			0x02c0
+#define CMD_TX_MODE(x)			UPDATE(x, 24, 24)
+#define DSI2_CRI_TX_PLD			0x02c4
+#define DSI2_CRI_RX_HDR			0x02c8
+#define DSI2_CRI_RX_PLD			0x02cc
+
+#define DSI2_IPI_COLOR_MAN_CFG		0x0300
+#define IPI_DEPTH(x)			UPDATE(x, 7, 4)
+#define IPI_DEPTH_5_6_5_BITS		0x02
+#define IPI_DEPTH_6_BITS		0x03
+#define IPI_DEPTH_8_BITS		0x05
+#define IPI_DEPTH_10_BITS		0x06
+#define IPI_FORMAT(x)			UPDATE(x, 3, 0)
+#define IPI_FORMAT_RGB			0x0
+#define IPI_FORMAT_DSC			0x0b
+#define DSI2_IPI_VID_HSA_MAN_CFG	0x0304
+#define VID_HSA_TIME(x)			UPDATE(x, 29, 0)
+#define DSI2_IPI_VID_HBP_MAN_CFG	0x030c
+#define VID_HBP_TIME(x)			UPDATE(x, 29, 0)
+#define DSI2_IPI_VID_HACT_MAN_CFG	0x0314
+#define VID_HACT_TIME(x)		UPDATE(x, 29, 0)
+#define DSI2_IPI_VID_HLINE_MAN_CFG	0x031c
+#define VID_HLINE_TIME(x)		UPDATE(x, 29, 0)
+#define DSI2_IPI_VID_VSA_MAN_CFG	0x0324
+#define VID_VSA_LINES(x)		UPDATE(x, 9, 0)
+#define DSI2_IPI_VID_VBP_MAN_CFG	0X032C
+#define VID_VBP_LINES(x)		UPDATE(x, 9, 0)
+#define DSI2_IPI_VID_VACT_MAN_CFG	0X0334
+#define VID_VACT_LINES(x)		UPDATE(x, 13, 0)
+#define DSI2_IPI_VID_VFP_MAN_CFG	0X033C
+#define VID_VFP_LINES(x)		UPDATE(x, 9, 0)
+#define DSI2_IPI_PIX_PKT_CFG		0x0344
+#define MAX_PIX_PKT(x)			UPDATE(x, 15, 0)
+
+#define DSI2_INT_ST_PHY			0x0400
+#define DSI2_INT_MASK_PHY		0x0404
+#define DSI2_INT_ST_TO			0x0410
+#define DSI2_INT_MASK_TO		0x0414
+#define DSI2_INT_ST_ACK			0x0420
+#define DSI2_INT_MASK_ACK		0x0424
+#define DSI2_INT_ST_IPI			0x0430
+#define DSI2_INT_MASK_IPI		0x0434
+#define DSI2_INT_ST_FIFO		0x0440
+#define DSI2_INT_MASK_FIFO		0x0444
+#define DSI2_INT_ST_PRI			0x0450
+#define DSI2_INT_MASK_PRI		0x0454
+#define DSI2_INT_ST_CRI			0x0460
+#define DSI2_INT_MASK_CRI		0x0464
+#define DSI2_INT_FORCE_CRI		0x0468
+#define DSI2_MAX_REGISGER		DSI2_INT_FORCE_CRI
+
+#define MODE_STATUS_TIMEOUT_US		10000
+#define CMD_PKT_STATUS_TIMEOUT_US	20000
+
+enum vid_mode_type {
+	VID_MODE_TYPE_NON_BURST_SYNC_PULSES,
+	VID_MODE_TYPE_NON_BURST_SYNC_EVENTS,
+	VID_MODE_TYPE_BURST,
+};
+
+enum mode_ctrl {
+	IDLE_MODE,
+	AUTOCALC_MODE,
+	COMMAND_MODE,
+	VIDEO_MODE,
+	DATA_STREAM_MODE,
+	VIDE_TEST_MODE,
+	DATA_STREAM_TEST_MODE,
+};
+
+enum ppi_width {
+	PPI_WIDTH_8_BITS,
+	PPI_WIDTH_16_BITS,
+	PPI_WIDTH_32_BITS,
+};
+
+struct cmd_header {
+	u8 cmd_type;
+	u8 delay;
+	u8 payload_length;
+};
+
+struct dw_mipi_dsi2 {
+	struct drm_bridge bridge;
+	struct mipi_dsi_host dsi_host;
+	struct drm_bridge *panel_bridge;
+	struct device *dev;
+	void __iomem *base;
+	struct clk *pclk;
+	struct clk *sys_clk;
+
+	unsigned int lane_mbps; /* per lane */
+	u32 channel;
+	u32 lanes;
+	u32 format;
+	unsigned long mode_flags;
+
+	struct drm_display_mode mode;
+	const struct dw_mipi_dsi2_plat_data *plat_data;
+};
+
+static inline struct dw_mipi_dsi2 *host_to_dsi2(struct mipi_dsi_host *host)
+{
+	return container_of(host, struct dw_mipi_dsi2, dsi_host);
+}
+
+static inline struct dw_mipi_dsi2 *bridge_to_dsi2(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct dw_mipi_dsi2, bridge);
+}
+
+static inline void dsi2_write(struct dw_mipi_dsi2 *dsi2, u32 reg, u32 val)
+{
+	writel(val, dsi2->base + reg);
+}
+
+static inline u32 dsi2_read(struct dw_mipi_dsi2 *dsi2, u32 reg)
+{
+	return readl(dsi2->base + reg);
+}
+
+static int cri_fifos_wait_avail(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 sts, mask;
+	int ret;
+
+	mask = CRI_BUSY | CRT_FIFOS_NOT_EMPTY;
+	ret = readl_poll_timeout(dsi2->base + DSI2_CORE_STATUS,
+				 sts, !(sts & mask), 0,
+				 CMD_PKT_STATUS_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dsi2->dev, "command interface is busy\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void dw_mipi_dsi2_set_vid_mode(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 val = 0, mode;
+	int ret;
+
+	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
+		val |= BLK_HFP_HS_EN;
+
+	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
+		val |= BLK_HBP_HS_EN;
+
+	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
+		val |= BLK_HSA_HS_EN;
+
+	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		val |= VID_MODE_TYPE_BURST;
+	else if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
+	else
+		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
+
+	dsi2_write(dsi2, DSI2_DSI_VID_TX_CFG, val);
+
+	dsi2_write(dsi2, DSI2_MODE_CTRL, VIDEO_MODE);
+	ret = readl_poll_timeout(dsi2->base + DSI2_MODE_STATUS,
+				 mode, mode & VIDEO_MODE, 1000,
+				 MODE_STATUS_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(dsi2->dev, "failed to enter video mode\n");
+}
+
+static void dw_mipi_dsi2_set_data_stream_mode(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 mode;
+	int ret;
+
+	dsi2_write(dsi2, DSI2_MODE_CTRL, DATA_STREAM_MODE);
+	ret = readl_poll_timeout(dsi2->base + DSI2_MODE_STATUS,
+				 mode, mode & DATA_STREAM_MODE, 1000,
+				 MODE_STATUS_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(dsi2->dev, "failed to enter data stream mode\n");
+}
+
+static void dw_mipi_dsi2_set_cmd_mode(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 mode;
+	int ret;
+
+	dsi2_write(dsi2, DSI2_MODE_CTRL, COMMAND_MODE);
+	ret = readl_poll_timeout(dsi2->base + DSI2_MODE_STATUS,
+				 mode, mode & COMMAND_MODE, 1000,
+				 MODE_STATUS_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(dsi2->dev, "failed to enter data stream mode\n");
+}
+
+static void dw_mipi_dsi2_host_softrst(struct dw_mipi_dsi2 *dsi2)
+{
+	dsi2_write(dsi2, DSI2_SOFT_RESET, 0x0);
+	usleep_range(50, 100);
+	dsi2_write(dsi2, DSI2_SOFT_RESET,
+		   SYS_RSTN | PHY_RSTN | IPI_RSTN);
+}
+
+static void dw_mipi_dsi2_phy_clk_mode_cfg(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 sys_clk, esc_clk_div;
+	u32 val = 0;
+
+	/*
+	 * clk_type should be NON_CONTINUOUS_CLK before
+	 * initial deskew calibration be sent.
+	 */
+	val |= NON_CONTINUOUS_CLK;
+
+	/* The maximum value of the escape clock frequency is 20MHz */
+	sys_clk = clk_get_rate(dsi2->sys_clk) / USEC_PER_SEC;
+	esc_clk_div = DIV_ROUND_UP(sys_clk, 20 * 2);
+	val |= PHY_LPTX_CLK_DIV(esc_clk_div);
+
+	dsi2_write(dsi2, DSI2_PHY_CLK_CFG, val);
+}
+
+static void dw_mipi_dsi2_phy_ratio_cfg(struct dw_mipi_dsi2 *dsi2)
+{
+	struct drm_display_mode *mode = &dsi2->mode;
+	u64 sys_clk = clk_get_rate(dsi2->sys_clk);
+	u64 pixel_clk, ipi_clk, phy_hsclk;
+	u64 tmp;
+
+	/*
+	 * in DPHY mode, the phy_hstx_clk is exactly 1/16 the Lane high-speed
+	 * data rate; In CPHY mode, the phy_hstx_clk is exactly 1/7 the trio
+	 * high speed symbol rate.
+	 */
+	phy_hsclk = DIV_ROUND_CLOSEST_ULL(dsi2->lane_mbps * USEC_PER_SEC, 16);
+
+	/* IPI_RATIO_MAN_CFG = PHY_HSTX_CLK / IPI_CLK */
+	pixel_clk = mode->crtc_clock * MSEC_PER_SEC;
+	ipi_clk = pixel_clk / 4;
+
+	tmp = DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, ipi_clk);
+	dsi2_write(dsi2, DSI2_PHY_IPI_RATIO_MAN_CFG,
+		   PHY_IPI_RATIO(tmp));
+
+	/*
+	 * SYS_RATIO_MAN_CFG = MIPI_DCPHY_HSCLK_Freq / MIPI_DCPHY_HSCLK_Freq
+	 */
+	tmp = DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, sys_clk);
+	dsi2_write(dsi2, DSI2_PHY_SYS_RATIO_MAN_CFG,
+		   PHY_SYS_RATIO(tmp));
+}
+
+static void dw_mipi_dsi2_lp2hs_or_hs2lp_cfg(struct dw_mipi_dsi2 *dsi2)
+{
+	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
+	struct dw_mipi_dsi2_phy_timing timing;
+	int ret;
+
+	ret = phy_ops->get_timing(dsi2->plat_data->priv_data,
+				  dsi2->lane_mbps, &timing);
+	if (ret)
+		DRM_DEV_ERROR(dsi2->dev, "Retrieving phy timings failed\n");
+
+	dsi2_write(dsi2, DSI2_PHY_LP2HS_MAN_CFG, PHY_LP2HS_TIME(timing.data_lp2hs));
+	dsi2_write(dsi2, DSI2_PHY_HS2LP_MAN_CFG, PHY_HS2LP_TIME(timing.data_hs2lp));
+}
+
+static void dw_mipi_dsi2_phy_init(struct dw_mipi_dsi2 *dsi2)
+{
+	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
+	struct dw_mipi_dsi2_phy_iface iface;
+	u32 val = 0;
+
+	phy_ops->get_interface(dsi2->plat_data->priv_data, &iface);
+
+	switch (iface.ppi_width) {
+	case 8:
+		val |= PPI_WIDTH(PPI_WIDTH_8_BITS);
+		break;
+	case 16:
+		val |= PPI_WIDTH(PPI_WIDTH_16_BITS);
+		break;
+	case 32:
+		val |= PPI_WIDTH(PPI_WIDTH_32_BITS);
+		break;
+	default:
+		/* Caught in probe */
+		break;
+	}
+
+	val |= PHY_LANES(dsi2->lanes);
+	val |= PHY_TYPE(DW_MIPI_DSI2_DPHY);
+	dsi2_write(dsi2, DSI2_PHY_MODE_CFG, val);
+
+	dw_mipi_dsi2_phy_clk_mode_cfg(dsi2);
+	dw_mipi_dsi2_phy_ratio_cfg(dsi2);
+	dw_mipi_dsi2_lp2hs_or_hs2lp_cfg(dsi2);
+
+	/* phy configuration 8 - 10 */
+}
+
+static void dw_mipi_dsi2_tx_option_set(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 val;
+
+	val = BTA_EN | EOTP_TX_EN;
+
+	if (dsi2->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
+		val &= ~EOTP_TX_EN;
+
+	dsi2_write(dsi2, DSI2_DSI_GENERAL_CFG, val);
+	dsi2_write(dsi2, DSI2_DSI_VCID_CFG, TX_VCID(dsi2->channel));
+}
+
+static void dw_mipi_dsi2_ipi_color_coding_cfg(struct dw_mipi_dsi2 *dsi2)
+{
+	u32 val, color_depth;
+
+	switch (dsi2->format) {
+	case MIPI_DSI_FMT_RGB666:
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		color_depth = IPI_DEPTH_6_BITS;
+		break;
+	case MIPI_DSI_FMT_RGB565:
+		color_depth = IPI_DEPTH_5_6_5_BITS;
+		break;
+	case MIPI_DSI_FMT_RGB888:
+	default:
+		color_depth = IPI_DEPTH_8_BITS;
+		break;
+	}
+
+	val = IPI_DEPTH(color_depth) |
+	      IPI_FORMAT(IPI_FORMAT_RGB);
+	dsi2_write(dsi2, DSI2_IPI_COLOR_MAN_CFG, val);
+}
+
+static void dw_mipi_dsi2_vertical_timing_config(struct dw_mipi_dsi2 *dsi2,
+						const struct drm_display_mode *mode)
+{
+	u32 vactive, vsa, vfp, vbp;
+
+	vactive = mode->vdisplay;
+	vsa = mode->vsync_end - mode->vsync_start;
+	vfp = mode->vsync_start - mode->vdisplay;
+	vbp = mode->vtotal - mode->vsync_end;
+
+	dsi2_write(dsi2, DSI2_IPI_VID_VSA_MAN_CFG, VID_VSA_LINES(vsa));
+	dsi2_write(dsi2, DSI2_IPI_VID_VBP_MAN_CFG, VID_VBP_LINES(vbp));
+	dsi2_write(dsi2, DSI2_IPI_VID_VACT_MAN_CFG, VID_VACT_LINES(vactive));
+	dsi2_write(dsi2, DSI2_IPI_VID_VFP_MAN_CFG, VID_VFP_LINES(vfp));
+}
+
+static void dw_mipi_dsi2_ipi_set(struct dw_mipi_dsi2 *dsi2)
+{
+	struct drm_display_mode *mode = &dsi2->mode;
+	u32 hline, hsa, hbp, hact;
+	u64 hline_time, hsa_time, hbp_time, hact_time, tmp;
+	u64 pixel_clk, phy_hs_clk;
+	u16 val;
+
+	val = mode->hdisplay;
+
+	dsi2_write(dsi2, DSI2_IPI_PIX_PKT_CFG, MAX_PIX_PKT(val));
+
+	dw_mipi_dsi2_ipi_color_coding_cfg(dsi2);
+
+	/*
+	 * if the controller is intended to operate in data stream mode,
+	 * no more steps are required.
+	 */
+	if (!(dsi2->mode_flags & MIPI_DSI_MODE_VIDEO))
+		return;
+
+	hact = mode->hdisplay;
+	hsa = mode->hsync_end - mode->hsync_start;
+	hbp = mode->htotal - mode->hsync_end;
+	hline = mode->htotal;
+
+	pixel_clk = mode->crtc_clock * MSEC_PER_SEC;
+
+	phy_hs_clk = DIV_ROUND_CLOSEST_ULL(dsi2->lane_mbps * USEC_PER_SEC, 16);
+
+	tmp = hsa * phy_hs_clk;
+	hsa_time = DIV_ROUND_CLOSEST_ULL(tmp << 16, pixel_clk);
+	dsi2_write(dsi2, DSI2_IPI_VID_HSA_MAN_CFG, VID_HSA_TIME(hsa_time));
+
+	tmp = hbp * phy_hs_clk;
+	hbp_time = DIV_ROUND_CLOSEST_ULL(tmp << 16, pixel_clk);
+	dsi2_write(dsi2, DSI2_IPI_VID_HBP_MAN_CFG, VID_HBP_TIME(hbp_time));
+
+	tmp = hact * phy_hs_clk;
+	hact_time = DIV_ROUND_CLOSEST_ULL(tmp << 16, pixel_clk);
+	dsi2_write(dsi2, DSI2_IPI_VID_HACT_MAN_CFG, VID_HACT_TIME(hact_time));
+
+	tmp = hline * phy_hs_clk;
+	hline_time = DIV_ROUND_CLOSEST_ULL(tmp << 16, pixel_clk);
+	dsi2_write(dsi2, DSI2_IPI_VID_HLINE_MAN_CFG, VID_HLINE_TIME(hline_time));
+
+	dw_mipi_dsi2_vertical_timing_config(dsi2, mode);
+}
+
+static void
+dw_mipi_dsi2_work_mode(struct dw_mipi_dsi2 *dsi2, u32 mode)
+{
+	/*
+	 * select controller work in Manual mode
+	 * Manual: MANUAL_MODE_EN
+	 * Automatic: 0
+	 */
+	dsi2_write(dsi2, MANUAL_MODE_CFG, mode);
+}
+
+static int dw_mipi_dsi2_host_attach(struct mipi_dsi_host *host,
+				    struct mipi_dsi_device *device)
+{
+	struct dw_mipi_dsi2 *dsi2 = host_to_dsi2(host);
+	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
+	struct drm_bridge *bridge;
+	int ret;
+
+	if (device->lanes > dsi2->plat_data->max_data_lanes) {
+		dev_err(dsi2->dev, "the number of data lanes(%u) is too many\n",
+			device->lanes);
+		return -EINVAL;
+	}
+
+	dsi2->lanes = device->lanes;
+	dsi2->channel = device->channel;
+	dsi2->format = device->format;
+	dsi2->mode_flags = device->mode_flags;
+
+	bridge = devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	bridge->pre_enable_prev_first = true;
+	dsi2->panel_bridge = bridge;
+
+	drm_bridge_add(&dsi2->bridge);
+
+	if (pdata->host_ops && pdata->host_ops->attach) {
+		ret = pdata->host_ops->attach(pdata->priv_data, device);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int dw_mipi_dsi2_host_detach(struct mipi_dsi_host *host,
+				    struct mipi_dsi_device *device)
+{
+	struct dw_mipi_dsi2 *dsi2 = host_to_dsi2(host);
+	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
+	int ret;
+
+	if (pdata->host_ops && pdata->host_ops->detach) {
+		ret = pdata->host_ops->detach(pdata->priv_data, device);
+		if (ret < 0)
+			return ret;
+	}
+
+	drm_bridge_remove(&dsi2->bridge);
+
+	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
+
+	return 0;
+}
+
+static int dw_mipi_dsi2_gen_pkt_hdr_write(struct dw_mipi_dsi2 *dsi2,
+					  u32 hdr_val, bool lpm)
+{
+	int ret;
+
+	dsi2_write(dsi2, DSI2_CRI_TX_HDR, hdr_val | CMD_TX_MODE(lpm));
+
+	ret = cri_fifos_wait_avail(dsi2);
+	if (ret) {
+		dev_err(dsi2->dev, "failed to write command header\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw_mipi_dsi2_write(struct dw_mipi_dsi2 *dsi2,
+			      const struct mipi_dsi_packet *packet, bool lpm)
+{
+	const u8 *tx_buf = packet->payload;
+	int len = packet->payload_length, pld_data_bytes = sizeof(u32);
+	__le32 word;
+
+	/* Send payload */
+	while (len) {
+		if (len < pld_data_bytes) {
+			word = 0;
+			memcpy(&word, tx_buf, len);
+			dsi2_write(dsi2, DSI2_CRI_TX_PLD, le32_to_cpu(word));
+			len = 0;
+		} else {
+			memcpy(&word, tx_buf, pld_data_bytes);
+			dsi2_write(dsi2, DSI2_CRI_TX_PLD, le32_to_cpu(word));
+			tx_buf += pld_data_bytes;
+			len -= pld_data_bytes;
+		}
+	}
+
+	word = 0;
+	memcpy(&word, packet->header, sizeof(packet->header));
+	return dw_mipi_dsi2_gen_pkt_hdr_write(dsi2, le32_to_cpu(word), lpm);
+}
+
+static int dw_mipi_dsi2_read(struct dw_mipi_dsi2 *dsi2,
+			     const struct mipi_dsi_msg *msg)
+{
+	u8 *payload = msg->rx_buf;
+	int i, j, ret, len = msg->rx_len;
+	u8 data_type;
+	u16 wc;
+	u32 val;
+
+	ret = readl_poll_timeout(dsi2->base + DSI2_CORE_STATUS,
+				 val, val & CRI_RD_DATA_AVAIL, 1000,
+				 CMD_PKT_STATUS_TIMEOUT_US);
+	if (ret) {
+		dev_err(dsi2->dev, "CRI has no available read data\n");
+		return ret;
+	}
+
+	val = dsi2_read(dsi2, DSI2_CRI_RX_HDR);
+	data_type = val & 0x3f;
+
+	if (mipi_dsi_packet_format_is_short(data_type)) {
+		for (i = 0; i < len && i < 2; i++)
+			payload[i] = (val >> (8 * (i + 1))) & 0xff;
+
+		return 0;
+	}
+
+	wc = (val >> 8) & 0xffff;
+	/* Receive payload */
+	for (i = 0; i < len && i < wc; i += 4) {
+		val = dsi2_read(dsi2, DSI2_CRI_RX_PLD);
+		for (j = 0; j < 4 && j + i < len && j + i < wc; j++)
+			payload[i + j] = val >> (8 * j);
+	}
+
+	return 0;
+}
+
+static ssize_t dw_mipi_dsi2_host_transfer(struct mipi_dsi_host *host,
+					  const struct mipi_dsi_msg *msg)
+{
+	struct dw_mipi_dsi2 *dsi2 = host_to_dsi2(host);
+	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
+	struct mipi_dsi_packet packet;
+	int ret, nb_bytes;
+	u32 val;
+
+	val = dsi2_read(dsi2, DSI2_DSI_VID_TX_CFG);
+	if (lpm)
+		val |= LPDT_DISPLAY_CMD_EN;
+	else
+		val &= ~LPDT_DISPLAY_CMD_EN;
+	dsi2_write(dsi2, DSI2_DSI_VID_TX_CFG, val);
+
+	/* create a packet to the DSI protocol */
+	ret = mipi_dsi_create_packet(&packet, msg);
+	if (ret) {
+		DRM_DEV_ERROR(dsi2->dev, "failed to create packet: %d\n", ret);
+		return ret;
+	}
+
+	ret = cri_fifos_wait_avail(dsi2);
+	if (ret)
+		return ret;
+
+	ret = dw_mipi_dsi2_write(dsi2, &packet, lpm);
+	if (ret)
+		return ret;
+
+	if (msg->rx_buf && msg->rx_len) {
+		ret = dw_mipi_dsi2_read(dsi2, msg);
+		if (ret < 0)
+			return ret;
+		nb_bytes = msg->rx_len;
+	} else {
+		nb_bytes = packet.size;
+	}
+
+	return nb_bytes;
+}
+
+static const struct mipi_dsi_host_ops dw_mipi_dsi2_host_ops = {
+	.attach = dw_mipi_dsi2_host_attach,
+	.detach = dw_mipi_dsi2_host_detach,
+	.transfer = dw_mipi_dsi2_host_transfer,
+};
+
+static u32 *
+dw_mipi_dsi2_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					      struct drm_bridge_state *bridge_state,
+					      struct drm_crtc_state *crtc_state,
+					      struct drm_connector_state *conn_state,
+					      u32 output_fmt,
+					      unsigned int *num_input_fmts)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
+	u32 *input_fmts;
+
+	if (pdata->get_input_bus_fmts)
+		return pdata->get_input_bus_fmts(pdata->priv_data,
+						 bridge, bridge_state,
+						 crtc_state, conn_state,
+						 output_fmt, num_input_fmts);
+
+	/* Fall back to MEDIA_BUS_FMT_FIXED as the only input format. */
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+	input_fmts[0] = MEDIA_BUS_FMT_FIXED;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static int dw_mipi_dsi2_bridge_atomic_check(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
+	bool ret;
+
+	bridge_state->input_bus_cfg.flags =
+		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
+
+	if (pdata->mode_fixup) {
+		ret = pdata->mode_fixup(pdata->priv_data, &crtc_state->mode,
+					&crtc_state->adjusted_mode);
+		if (!ret) {
+			DRM_DEBUG_DRIVER("failed to fixup mode " DRM_MODE_FMT "\n",
+					 DRM_MODE_ARG(&crtc_state->mode));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void dw_mipi_dsi2_bridge_post_atomic_disable(struct drm_bridge *bridge,
+						    struct drm_bridge_state *old_bridge_state)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
+
+	dsi2_write(dsi2, DSI2_IPI_PIX_PKT_CFG, 0);
+
+	/*
+	 * Switch to command mode before panel-bridge post_disable &
+	 * panel unprepare.
+	 * Note: panel-bridge disable & panel disable has been called
+	 * before by the drm framework.
+	 */
+	dw_mipi_dsi2_set_cmd_mode(dsi2);
+
+	dsi2_write(dsi2, DSI2_PWR_UP, RESET);
+
+	if (phy_ops->power_off)
+		phy_ops->power_off(dsi2->plat_data->priv_data);
+
+	clk_disable_unprepare(dsi2->pclk);
+	pm_runtime_put(dsi2->dev);
+}
+
+static unsigned int dw_mipi_dsi2_get_lanes(struct dw_mipi_dsi2 *dsi2)
+{
+	/* single-dsi, so no other instance to consider */
+	return dsi2->lanes;
+}
+
+static void dw_mipi_dsi2_mode_set(struct dw_mipi_dsi2 *dsi2,
+				  const struct drm_display_mode *adjusted_mode)
+{
+	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
+	void *priv_data = dsi2->plat_data->priv_data;
+	u32 lanes = dw_mipi_dsi2_get_lanes(dsi2);
+	int ret;
+	u32 val;
+
+	clk_prepare_enable(dsi2->pclk);
+
+	ret = phy_ops->get_lane_mbps(priv_data, adjusted_mode, dsi2->mode_flags,
+				     lanes, dsi2->format, &dsi2->lane_mbps);
+	if (ret)
+		DRM_DEBUG_DRIVER("Phy get_lane_mbps() failed\n");
+
+	pm_runtime_get_sync(dsi2->dev);
+
+	dw_mipi_dsi2_host_softrst(dsi2);
+	dsi2_write(dsi2, DSI2_PWR_UP, RESET);
+
+	dw_mipi_dsi2_work_mode(dsi2, MANUAL_MODE_EN);
+	dw_mipi_dsi2_phy_init(dsi2);
+
+	if (phy_ops->power_on)
+		phy_ops->power_on(dsi2->plat_data->priv_data);
+
+	dw_mipi_dsi2_tx_option_set(dsi2);
+
+	/*
+	 * initial deskew calibration is send after phy_power_on,
+	 * then we can configure clk_type.
+	 */
+
+	val = dsi2_read(dsi2, DSI2_PHY_CLK_CFG);
+	val &= ~CLK_TYPE_MASK;
+	val |= (dsi2->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ?
+					NON_CONTINUOUS_CLK : CONTINUOUS_CLK;
+	dsi2_write(dsi2, DSI2_PHY_CLK_CFG, val);
+
+	dsi2_write(dsi2, DSI2_PWR_UP, POWER_UP);
+	dw_mipi_dsi2_set_cmd_mode(dsi2);
+
+	dw_mipi_dsi2_ipi_set(dsi2);
+}
+
+static void dw_mipi_dsi2_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+						  struct drm_bridge_state *old_bridge_state)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+
+	/* Power up the dsi ctl into a command mode */
+	dw_mipi_dsi2_mode_set(dsi2, &dsi2->mode);
+}
+
+static void dw_mipi_dsi2_bridge_mode_set(struct drm_bridge *bridge,
+					 const struct drm_display_mode *mode,
+					 const struct drm_display_mode *adjusted_mode)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+
+	/* Store the display mode for later use in pre_enable callback */
+	drm_mode_copy(&dsi2->mode, adjusted_mode);
+}
+
+static void dw_mipi_dsi2_bridge_atomic_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+
+	/* Switch to video mode for panel-bridge enable & panel enable */
+	if (dsi2->mode_flags & MIPI_DSI_MODE_VIDEO)
+		dw_mipi_dsi2_set_vid_mode(dsi2);
+	else
+		dw_mipi_dsi2_set_data_stream_mode(dsi2);
+}
+
+static enum drm_mode_status
+dw_mipi_dsi2_bridge_mode_valid(struct drm_bridge *bridge,
+			       const struct drm_display_info *info,
+			       const struct drm_display_mode *mode)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+	const struct dw_mipi_dsi2_plat_data *pdata = dsi2->plat_data;
+	enum drm_mode_status mode_status = MODE_OK;
+
+	if (pdata->mode_valid)
+		mode_status = pdata->mode_valid(pdata->priv_data, mode,
+						dsi2->mode_flags,
+						dw_mipi_dsi2_get_lanes(dsi2),
+						dsi2->format);
+
+	return mode_status;
+}
+
+static int dw_mipi_dsi2_bridge_attach(struct drm_bridge *bridge,
+				      enum drm_bridge_attach_flags flags)
+{
+	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
+
+	/* Set the encoder type as caller does not know it */
+	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
+
+	/* Attach the panel-bridge to the dsi bridge */
+	return drm_bridge_attach(bridge->encoder, dsi2->panel_bridge, bridge,
+				 flags);
+}
+
+static const struct drm_bridge_funcs dw_mipi_dsi2_bridge_funcs = {
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts = dw_mipi_dsi2_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= dw_mipi_dsi2_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable	= dw_mipi_dsi2_bridge_atomic_pre_enable,
+	.atomic_enable		= dw_mipi_dsi2_bridge_atomic_enable,
+	.atomic_post_disable	= dw_mipi_dsi2_bridge_post_atomic_disable,
+	.mode_set		= dw_mipi_dsi2_bridge_mode_set,
+	.mode_valid		= dw_mipi_dsi2_bridge_mode_valid,
+	.attach			= dw_mipi_dsi2_bridge_attach,
+};
+
+static struct dw_mipi_dsi2 *
+__dw_mipi_dsi2_probe(struct platform_device *pdev,
+		     const struct dw_mipi_dsi2_plat_data *plat_data)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *apb_rst;
+	struct dw_mipi_dsi2 *dsi2;
+	int ret;
+
+	dsi2 = devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
+	if (!dsi2)
+		return ERR_PTR(-ENOMEM);
+
+	dsi2->dev = dev;
+	dsi2->plat_data = plat_data;
+
+	if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
+	    !plat_data->phy_ops->get_timing)
+		return dev_err_ptr_probe(dev, -ENODEV, "Phy not properly configured\n");
+
+	if (!plat_data->base) {
+		dsi2->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(dsi2->base))
+			return ERR_PTR(-ENODEV);
+	} else {
+		dsi2->base = plat_data->base;
+	}
+
+	dsi2->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(dsi2->pclk))
+		return dev_err_cast_probe(dev, dsi2->pclk, "Unable to get pclk\n");
+
+	dsi2->sys_clk = devm_clk_get(dev, "sys");
+	if (IS_ERR(dsi2->sys_clk))
+		return dev_err_cast_probe(dev, dsi2->sys_clk, "Unable to get sys_clk\n");
+
+	/*
+	 * Note that the reset was not defined in the initial device tree, so
+	 * we have to be prepared for it not being found.
+	 */
+	apb_rst = devm_reset_control_get_optional_exclusive(dev, "apb");
+	if (IS_ERR(apb_rst))
+		return dev_err_cast_probe(dev, apb_rst, "Unable to get reset control\n");
+
+	if (apb_rst) {
+		ret = clk_prepare_enable(dsi2->pclk);
+		if (ret) {
+			dev_err(dev, "%s: Failed to enable pclk\n", __func__);
+			return ERR_PTR(ret);
+		}
+
+		reset_control_assert(apb_rst);
+		usleep_range(10, 20);
+		reset_control_deassert(apb_rst);
+
+		clk_disable_unprepare(dsi2->pclk);
+	}
+
+	pm_runtime_enable(dev);
+
+	dsi2->dsi_host.ops = &dw_mipi_dsi2_host_ops;
+	dsi2->dsi_host.dev = dev;
+	ret = mipi_dsi_host_register(&dsi2->dsi_host);
+	if (ret) {
+		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
+		pm_runtime_disable(dev);
+		return ERR_PTR(ret);
+	}
+
+	dsi2->bridge.driver_private = dsi2;
+	dsi2->bridge.funcs = &dw_mipi_dsi2_bridge_funcs;
+	dsi2->bridge.of_node = pdev->dev.of_node;
+
+	return dsi2;
+}
+
+static void __dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
+{
+	mipi_dsi_host_unregister(&dsi2->dsi_host);
+
+	pm_runtime_disable(dsi2->dev);
+}
+
+/*
+ * Probe/remove API, used from platforms based on the DRM bridge API.
+ */
+struct dw_mipi_dsi2 *
+dw_mipi_dsi2_probe(struct platform_device *pdev,
+		   const struct dw_mipi_dsi2_plat_data *plat_data)
+{
+	return __dw_mipi_dsi2_probe(pdev, plat_data);
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi2_probe);
+
+void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
+{
+	__dw_mipi_dsi2_remove(dsi2);
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi2_remove);
+
+/*
+ * Bind/unbind API, used from platforms based on the component framework.
+ */
+int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder)
+{
+	return drm_bridge_attach(encoder, &dsi2->bridge, NULL, 0);
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi2_bind);
+
+void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2)
+{
+}
+EXPORT_SYMBOL_GPL(dw_mipi_dsi2_unbind);
+
+MODULE_AUTHOR("Guochun Huang <hero.huang@rock-chips.com>");
+MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@cherry.de>");
+MODULE_DESCRIPTION("DW MIPI DSI2 host controller driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:dw-mipi-dsi2");
diff --git a/include/drm/bridge/dw_mipi_dsi2.h b/include/drm/bridge/dw_mipi_dsi2.h
new file mode 100644
index 000000000000..ef5479b35028
--- /dev/null
+++ b/include/drm/bridge/dw_mipi_dsi2.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024, Fuzhou Rockchip Electronics Co., Ltd
+ *
+ * Authors: Guochun Huang <hero.huang@rock-chips.com>
+ *          Heiko Stuebner <heiko.stuebner@cherry.de>
+ */
+
+#ifndef __DW_MIPI_DSI2__
+#define __DW_MIPI_DSI2__
+
+#include <linux/types.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_modes.h>
+
+struct drm_display_mode;
+struct drm_encoder;
+struct dw_mipi_dsi2;
+struct mipi_dsi_device;
+struct platform_device;
+
+enum dw_mipi_dsi2_phy_type {
+	DW_MIPI_DSI2_DPHY,
+	DW_MIPI_DSI2_CPHY,
+};
+
+struct dw_mipi_dsi2_phy_iface {
+	int ppi_width;
+	enum dw_mipi_dsi2_phy_type phy_type;
+};
+
+struct dw_mipi_dsi2_phy_timing {
+	u32 data_hs2lp;
+	u32 data_lp2hs;
+};
+
+struct dw_mipi_dsi2_phy_ops {
+	int (*init)(void *priv_data);
+	void (*power_on)(void *priv_data);
+	void (*power_off)(void *priv_data);
+	void (*get_interface)(void *priv_data, struct dw_mipi_dsi2_phy_iface *iface);
+	int (*get_lane_mbps)(void *priv_data,
+			     const struct drm_display_mode *mode,
+			     unsigned long mode_flags, u32 lanes, u32 format,
+			     unsigned int *lane_mbps);
+	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
+			  struct dw_mipi_dsi2_phy_timing *timing);
+	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
+};
+
+struct dw_mipi_dsi2_host_ops {
+	int (*attach)(void *priv_data,
+		      struct mipi_dsi_device *dsi);
+	int (*detach)(void *priv_data,
+		      struct mipi_dsi_device *dsi);
+};
+
+struct dw_mipi_dsi2_plat_data {
+	void __iomem *base;
+	unsigned int max_data_lanes;
+
+	enum drm_mode_status (*mode_valid)(void *priv_data,
+					   const struct drm_display_mode *mode,
+					   unsigned long mode_flags,
+					   u32 lanes, u32 format);
+
+	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+
+	u32 *(*get_input_bus_fmts)(void *priv_data,
+				   struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts);
+
+	const struct dw_mipi_dsi2_phy_ops *phy_ops;
+	const struct dw_mipi_dsi2_host_ops *host_ops;
+
+	void *priv_data;
+};
+
+struct dw_mipi_dsi2 *dw_mipi_dsi2_probe(struct platform_device *pdev,
+					const struct dw_mipi_dsi2_plat_data *plat_data);
+void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2);
+int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder);
+void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2);
+
+#endif /* __DW_MIPI_DSI2__ */
-- 
2.45.2

