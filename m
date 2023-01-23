Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FD678539
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24410E223;
	Mon, 23 Jan 2023 18:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4610E223
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:46:58 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id z20so10377265plc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kLbhwTQMwg9Q/s7+KMD8jqghIEpKJvQwNNB9zhXZbM=;
 b=t2J+tcHZN8L0jZAtbMSQebnCe/qpsds5NDuY7z5bKB5II0VDXNB9EPxV2FK16H/yDS
 knGojVQ1IzxR6sb3mqGmRqxN9Zl67pq/arrR55OioYTv5ndG/Pb3HTfiRmB1Rx1Ri6HK
 f9Q7C5JLYRGWNaXbqsZ+l0pCGQW4A0JYwOaSa7s09sKCTRJo6vxYEZG5YsNnQpqDJmUx
 Cxv5rpRGzlZqKmHTBaIch5+M/cZKjQ4U6UvDW37dKcTaGhHQJrhXG2PZIOxhjRTP7WPI
 HXGXSwAv07jELvKwZN1ucH6B6hJagEe09xddTc/uW2ZpKViZAfF+QAr7oivzUeklIoj4
 tmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kLbhwTQMwg9Q/s7+KMD8jqghIEpKJvQwNNB9zhXZbM=;
 b=o+x+1ltkgQFT2yNyEZ540yrvQNXZJ/1rgse32vmGO5eBRACnNBUz0Xzr/J5BygBZ4B
 4POEfz21n8fUBx6gwf1LValCGqIMpUpSvn34BnPdOf9Hp3cZUuDqa014pYN0V0V734nQ
 mAZ1stxcn7MqIuD5bGEI7WkCERW+OTqfiduKZdRY+Qo+VhG+0XLDXprrhLJ5+i9Hi3hj
 9YsWdFHAof4dOcu+AbmEYSJP8119CY2MHOYdJlcVUA6glPHV5DmAljCyt0HBsmdP3I2a
 eFy6P9maqUWrMzdc4Mn0a88FvZwVbWg6JgjMmvfoX8vjbb3TW2KewgdJOG+A3xIWa0OO
 stNw==
X-Gm-Message-State: AFqh2krurO4dvU+1VM5khMyVmX9uDjXNn4wUA8pDeqWabMeUHdNfClID
 Z0raEd2lajN+tq9uYkaoUJsXOg==
X-Google-Smtp-Source: AMrXdXvGtL5GwRI9/jEZIqSG7Eux3w2Pg52X+qUDo5VgBlHaXzPKoJoAvuToHMaVWEcDwJHXp9uW6g==
X-Received: by 2002:a17:902:ef86:b0:194:59c2:a154 with SMTP id
 iz6-20020a170902ef8600b0019459c2a154mr25357025plb.61.1674499617725; 
 Mon, 23 Jan 2023 10:46:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 jb11-20020a170903258b00b00189a7fbfd44sm17441plb.211.2023.01.23.10.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:46:57 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 2/2] drm: bridge: dw-mipi-dsi: Switch to regmap support
Date: Tue, 24 Jan 2023 00:16:47 +0530
Message-Id: <20230123184647.437965-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123184647.437965-1-jagan@edgeble.ai>
References: <20230123184647.437965-1-jagan@edgeble.ai>
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
Cc: dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make debugging easier, switch the driver to use regmap
from conventional io calls.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 81 ++++++++++++-------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 47bd69d5ac99..62a160af4047 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include <video/mipi_display.h>
@@ -242,7 +243,7 @@ struct dw_mipi_dsi {
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge *panel_bridge;
 	struct device *dev;
-	void __iomem *base;
+	struct regmap *regmap;
 
 	struct clk *pclk;
 
@@ -301,12 +302,16 @@ static inline struct dw_mipi_dsi *bridge_to_dsi(struct drm_bridge *bridge)
 
 static inline void dsi_write(struct dw_mipi_dsi *dsi, u32 reg, u32 val)
 {
-	writel(val, dsi->base + reg);
+	regmap_write(dsi->regmap, reg, val);
 }
 
 static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
 {
-	return readl(dsi->base + reg);
+	u32 val;
+
+	regmap_read(dsi->regmap, reg, &val);
+
+	return val;
 }
 
 static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
@@ -332,6 +337,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
+	dev_info(host->dev, "Attached device %s\n", device->name);
 	dsi->panel_bridge = bridge;
 
 	drm_bridge_add(&dsi->bridge);
@@ -400,9 +406,9 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
 	int ret;
 	u32 val, mask;
 
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, !(val & GEN_CMD_FULL), 1000,
-				 CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
+				       val, !(val & GEN_CMD_FULL), 1000,
+				       CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "failed to get available command FIFO\n");
 		return ret;
@@ -411,9 +417,9 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
 	dsi_write(dsi, DSI_GEN_HDR, hdr_val);
 
 	mask = GEN_CMD_EMPTY | GEN_PLD_W_EMPTY;
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, (val & mask) == mask,
-				 1000, CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
+				       val, (val & mask) == mask,
+				       1000, CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "failed to write command FIFO\n");
 		return ret;
@@ -443,9 +449,9 @@ static int dw_mipi_dsi_write(struct dw_mipi_dsi *dsi,
 			len -= pld_data_bytes;
 		}
 
-		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-					 val, !(val & GEN_PLD_W_FULL), 1000,
-					 CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
+					       val, !(val & GEN_PLD_W_FULL), 1000,
+					       CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev,
 				"failed to get available write payload FIFO\n");
@@ -466,9 +472,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 	u32 val;
 
 	/* Wait end of the read operation */
-	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-				 val, !(val & GEN_RD_CMD_BUSY),
-				 1000, CMD_PKT_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
+				       val, !(val & GEN_RD_CMD_BUSY), 1000,
+				       CMD_PKT_STATUS_TIMEOUT_US);
 	if (ret) {
 		dev_err(dsi->dev, "Timeout during read operation\n");
 		return ret;
@@ -476,9 +482,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
 
 	for (i = 0; i < len; i += 4) {
 		/* Read fifo must not be empty before all bytes are read */
-		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
-					 val, !(val & GEN_PLD_R_EMPTY),
-					 1000, CMD_PKT_STATUS_TIMEOUT_US);
+		ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
+					       val, !(val & GEN_PLD_R_EMPTY), 1000,
+					       CMD_PKT_STATUS_TIMEOUT_US);
 		if (ret) {
 			dev_err(dsi->dev, "Read payload FIFO is empty\n");
 			return ret;
@@ -499,6 +505,9 @@ static ssize_t dw_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
 	struct mipi_dsi_packet packet;
 	int ret, nb_bytes;
 
+	DRM_INFO("%x %x %x\n", msg->type,
+		 ((((u8 *)msg->tx_buf)[0] << 8) >> 8),
+		 ((((u8 *)msg->tx_buf)[1] << 16)) >> 16);
 	ret = mipi_dsi_create_packet(&packet, msg);
 	if (ret) {
 		dev_err(dsi->dev, "failed to create packet: %d\n", ret);
@@ -828,17 +837,18 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
 	u32 val;
 	int ret;
 
-	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
+	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENABLECLK |
 		  PHY_UNRSTZ | PHY_UNSHUTDOWNZ);
 
-	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, val,
-				 val & PHY_LOCK, 1000, PHY_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regmap, DSI_PHY_STATUS,
+				       val, val & PHY_LOCK, 1000,
+				       PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy lock state\n");
 
-	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS,
-				 val, val & PHY_STOP_STATE_CLK_LANE, 1000,
-				 PHY_STATUS_TIMEOUT_US);
+	ret = regmap_read_poll_timeout(dsi->regmap, DSI_PHY_STATUS,
+				       val, val & PHY_STOP_STATE_CLK_LANE, 1000,
+				       PHY_STATUS_TIMEOUT_US);
 	if (ret)
 		DRM_DEBUG_DRIVER("failed to wait phy clk lane stop state\n");
 }
@@ -1103,6 +1113,14 @@ static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi) { }
 
 #endif /* CONFIG_DEBUG_FS */
 
+static const struct regmap_config dw_mipi_dsi_regmap_config = {
+	.name = "dw-mipi-dsi",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = DSI_INT_MSK1,
+};
+
 static struct dw_mipi_dsi *
 __dw_mipi_dsi_probe(struct platform_device *pdev,
 		    const struct dw_mipi_dsi_plat_data *plat_data)
@@ -1110,6 +1128,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct reset_control *apb_rst;
 	struct dw_mipi_dsi *dsi;
+	void __iomem *base;
 	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -1126,12 +1145,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	}
 
 	if (!plat_data->base) {
-		dsi->base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(dsi->base))
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
 			return ERR_PTR(-ENODEV);
 
 	} else {
-		dsi->base = plat_data->base;
+		base = plat_data->base;
+	}
+
+	dsi->regmap = devm_regmap_init_mmio(dev, base,
+					    &dw_mipi_dsi_regmap_config);
+	if (IS_ERR(dsi->regmap)) {
+		ret = PTR_ERR(dsi->regmap);
+		dev_err(dev, "failed to init register map\n");
+		return ERR_PTR(ret);
 	}
 
 	dsi->pclk = devm_clk_get(dev, "pclk");
-- 
2.25.1

