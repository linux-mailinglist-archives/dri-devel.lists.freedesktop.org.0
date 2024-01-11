Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD28082ABC8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09010E8C0;
	Thu, 11 Jan 2024 10:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1610E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:19:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33765009941so4058478f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704968348; x=1705573148;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O3H15bNzWjBYtbZo8brHKov3HRI00CYBots8A8Xapcc=;
 b=wxDZgzPBC9C++w9xvivrki+mehcKmIpD7P8TgzmJMXJ06EDXK19B3CgpoHfiyd1mby
 pcJ6uD6vLnowQrxkWWjocCV9O8wrjvgJoGCD7DSMW+RFXYTVqpl9MQZY82KYHnzR6zeN
 cwJSXTQXSS1mn35kQls/GOI6rUmSayeBKOheiGYv3ZD1i/AtWo14WBdOfQnKaVFUJtxl
 FuV17LN01VPKKwnBPE/7Y0fJi6WBXnUES0w5I24Q3Hd4tykdQA5B9KQQfAPr+JjpH6Fs
 cykthmW1IaFTMzavZKeDmRqUPz5aqN2bplJIhVejF/45wfyL5QoGx3QA+XaJE9X+b8wG
 tZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968348; x=1705573148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O3H15bNzWjBYtbZo8brHKov3HRI00CYBots8A8Xapcc=;
 b=tkcHz8l1HugzHYf2pNbiB2ZKjaaYXdvrglFpRtm1icfREbsKvKExzizpTnD7B5nIDz
 JmAfkLUAFK3r48uFCYwbh42AW5KxgdfsHJLOal0G3cCYTJrH0WZvskTw4upl5z24XIXH
 JHkv9AlFJvWn7SYWjMU/xca/Tyhn7tY5gZdTBO3JTFAGNcXcTQ+De6DnMtOdwp70CyTm
 syVzj75e4cL+qL2SuMcRpbOtrPAVnh5Uh3gX8fhqtKSlcn90lRWrFdS5q491FxjedzCi
 qVq1QQS1kcCVDF1vXdLt4myAAGwSINdE1UfZFVbph+4HGt4J/Do0+yDmg91bI57I8NOQ
 Po0g==
X-Gm-Message-State: AOJu0YzkB8k3bTPOYRTJPiNtMAFRJgIuzM+T32YdAzvYIceIpnSzvZaE
 LGTkknMgMiVlWBjySlQr8uPRUY1a4DiwUQ==
X-Google-Smtp-Source: AGHT+IHlFTpLbefHS9fMtVWRYWv54hrihypwIhJ5x0XXQYE1Ub3Ok/0RwL3bGuAydjeguJwbYzAIJg==
X-Received: by 2002:a05:6000:10:b0:337:4cae:367c with SMTP id
 h16-20020a056000001000b003374cae367cmr554890wrx.7.1704968348439; 
 Thu, 11 Jan 2024 02:19:08 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 u1-20020adfa181000000b003368d2e729bsm829757wru.43.2024.01.11.02.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:19:08 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v5 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Date: Thu, 11 Jan 2024 11:17:30 +0100
Message-ID: <20240111101738.468916-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This is a new driver that supports the MIPI CSI CD-PHY version 0.5

The number of PHYs depend on the SoC.
Each PHY can support D-PHY only or CD-PHY configuration.
The driver supports only D-PHY mode, so CD-PHY
compatible PHY are configured in D-PHY mode.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
[Julien Stephan: refactor code]
[Julien Stephan: simplify driver model: one instance per phy vs
one instance for all phys]
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 MAINTAINERS                                   |   1 +
 drivers/phy/mediatek/Kconfig                  |  12 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  62 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 294 ++++++++++++++++++
 5 files changed, 371 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 37dfa99b0eb0..ca413ff49d78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13574,6 +13574,7 @@ M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
+F:	drivers/phy/mediatek/phy-mtk-mipi-csi-0-5*
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 3125ecb5d119..3849b7c87d28 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -58,6 +58,18 @@ config PHY_MTK_HDMI
 	help
 	  Support HDMI PHY for Mediatek SoCs.
 
+config PHY_MTK_MIPI_CSI_0_5
+	tristate "MediaTek MIPI CSI CD-PHY v0.5 Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the MIPI CSI CD-PHY receiver version 0.5.
+	  The driver supports multiple CSI cdphy ports simultaneously.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called phy-mtk-mipi-csi-0-5.
+
 config PHY_MTK_MIPI_DSI
 	tristate "MediaTek MIPI-DSI Driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index c9a50395533e..f6e24a47e081 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -15,6 +15,8 @@ phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
 obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
 
+obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
+
 phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
new file mode 100644
index 000000000000..97b4c27a1699
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, MediaTek Inc.
+ * Copyright (c) 2023, BayLibre Inc.
+ */
+
+#ifndef __PHY_MTK_MIPI_CSI_V_0_5_RX_REG_H__
+#define __PHY_MTK_MIPI_CSI_V_0_5_RX_REG_H__
+
+/*
+ * CSI1 and CSI2 are identical, and similar to CSI0. All CSIX macros are
+ * applicable to the three PHYs. Where differences exist, they are denoted by
+ * macro names using CSI0 and CSI1, the latter being applicable to CSI1 and
+ * CSI2 alike.
+ */
+
+#define MIPI_RX_ANA00_CSIXA			0x0000
+#define RG_CSI0A_CPHY_EN			BIT(0)
+#define RG_CSIXA_EQ_PROTECT_EN			BIT(1)
+#define RG_CSIXA_BG_LPF_EN			BIT(2)
+#define RG_CSIXA_BG_CORE_EN			BIT(3)
+#define RG_CSIXA_DPHY_L0_CKMODE_EN		BIT(5)
+#define RG_CSIXA_DPHY_L0_CKSEL			BIT(6)
+#define RG_CSIXA_DPHY_L1_CKMODE_EN		BIT(8)
+#define RG_CSIXA_DPHY_L1_CKSEL			BIT(9)
+#define RG_CSIXA_DPHY_L2_CKMODE_EN		BIT(11)
+#define RG_CSIXA_DPHY_L2_CKSEL			BIT(12)
+
+#define MIPI_RX_ANA18_CSIXA			0x0018
+#define RG_CSI0A_L0_T0AB_EQ_IS			GENMASK(5, 4)
+#define RG_CSI0A_L0_T0AB_EQ_BW			GENMASK(7, 6)
+#define RG_CSI0A_L1_T1AB_EQ_IS			GENMASK(21, 20)
+#define RG_CSI0A_L1_T1AB_EQ_BW			GENMASK(23, 22)
+#define RG_CSI0A_L2_T1BC_EQ_IS			GENMASK(21, 20)
+#define RG_CSI0A_L2_T1BC_EQ_BW			GENMASK(23, 22)
+#define RG_CSI1A_L0_EQ_IS			GENMASK(5, 4)
+#define RG_CSI1A_L0_EQ_BW			GENMASK(7, 6)
+#define RG_CSI1A_L1_EQ_IS			GENMASK(21, 20)
+#define RG_CSI1A_L1_EQ_BW			GENMASK(23, 22)
+#define RG_CSI1A_L2_EQ_IS			GENMASK(5, 4)
+#define RG_CSI1A_L2_EQ_BW			GENMASK(7, 6)
+
+#define MIPI_RX_ANA1C_CSIXA			0x001c
+#define MIPI_RX_ANA20_CSI0A			0x0020
+
+#define MIPI_RX_ANA24_CSIXA			0x0024
+#define RG_CSIXA_RESERVE			GENMASK(31, 24)
+
+#define MIPI_RX_ANA40_CSIXA			0x0040
+#define RG_CSIXA_CPHY_FMCK_SEL			GENMASK(1, 0)
+#define RG_CSIXA_ASYNC_OPTION			GENMASK(7, 4)
+#define RG_CSIXA_CPHY_SPARE			GENMASK(31, 16)
+
+#define MIPI_RX_WRAPPER80_CSIXA			0x0080
+#define CSR_CSI_RST_MODE			GENMASK(17, 16)
+
+#define MIPI_RX_ANAA8_CSIXA			0x00a8
+#define RG_CSIXA_CDPHY_L0_T0_BYTECK_INVERT	BIT(0)
+#define RG_CSIXA_DPHY_L1_BYTECK_INVERT		BIT(1)
+#define RG_CSIXA_CDPHY_L2_T1_BYTECK_INVERT	BIT(2)
+
+#endif
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
new file mode 100644
index 000000000000..972c129185f7
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek MIPI CSI v0.5 driver
+ *
+ * Copyright (c) 2023, MediaTek Inc.
+ * Copyright (c) 2023, BayLibre Inc.
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "phy-mtk-io.h"
+#include "phy-mtk-mipi-csi-0-5-rx-reg.h"
+
+#define CSIXB_OFFSET		0x1000
+
+struct mtk_mipi_cdphy_port {
+	struct device *dev;
+	void __iomem *base;
+	struct phy *phy;
+	u32 type;
+	u32 mode;
+	u32 num_lanes;
+};
+
+enum PHY_TYPE {
+	DPHY = 0,
+	CPHY,
+	CDPHY,
+};
+
+static void mtk_phy_csi_cdphy_ana_eq_tune(void __iomem *base)
+{
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI0A_L0_T0AB_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI0A_L0_T0AB_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA, RG_CSI0A_L1_T1AB_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA, RG_CSI0A_L1_T1AB_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A, RG_CSI0A_L2_T1BC_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A, RG_CSI0A_L2_T1BC_EQ_BW, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI0A_L0_T0AB_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI0A_L0_T0AB_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA, RG_CSI0A_L1_T1AB_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA, RG_CSI0A_L1_T1AB_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA20_CSI0A, RG_CSI0A_L2_T1BC_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA20_CSI0A, RG_CSI0A_L2_T1BC_EQ_BW, 1);
+}
+
+static void mtk_phy_csi_dphy_ana_eq_tune(void __iomem *base)
+{
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L0_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L0_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L1_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L1_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA, RG_CSI1A_L2_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA, RG_CSI1A_L2_EQ_BW, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L0_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L0_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L1_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA, RG_CSI1A_L1_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA, RG_CSI1A_L2_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA, RG_CSI1A_L2_EQ_BW, 1);
+}
+
+static int mtk_mipi_phy_power_on(struct phy *phy)
+{
+	struct mtk_mipi_cdphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/*
+	 * The driver currently supports DPHY and CD-PHY phys,
+	 * but the only mode supported is DPHY,
+	 * so CD-PHY capable phys must be configured in DPHY mode
+	 */
+	if (port->type == CDPHY) {
+		mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSI0A_CPHY_EN, 0);
+		mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+				     RG_CSI0A_CPHY_EN, 0);
+	}
+
+	/*
+	 * Lane configuration:
+	 *
+	 * Only 4 data + 1 clock is supported for now with the following mapping:
+	 *
+	 * CSIXA_LNR0 --> D2
+	 * CSIXA_LNR1 --> D0
+	 * CSIXA_LNR2 --> C
+	 * CSIXB_LNR0 --> D1
+	 * CSIXB_LNR1 --> D3
+	 */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L2_CKMODE_EN, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L2_CKSEL, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L2_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_DPHY_L2_CKSEL, 1);
+
+	/* Byte clock invert */
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA, RG_CSIXA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA, RG_CSIXA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA, RG_CSIXA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	/* Start ANA EQ tuning */
+	if (port->type == CDPHY)
+		mtk_phy_csi_cdphy_ana_eq_tune(base);
+	else
+		mtk_phy_csi_dphy_ana_eq_tune(base);
+
+	/* End ANA EQ tuning */
+	mtk_phy_set_bits(base + MIPI_RX_ANA40_CSIXA, 0x90);
+
+	mtk_phy_update_field(base + MIPI_RX_ANA24_CSIXA, RG_CSIXA_RESERVE, 0x40);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA24_CSIXA, RG_CSIXA_RESERVE, 0x40);
+	mtk_phy_update_field(base + MIPI_RX_WRAPPER80_CSIXA, CSR_CSI_RST_MODE, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_WRAPPER80_CSIXA, CSR_CSI_RST_MODE, 0);
+	/* ANA power on */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_CORE_EN, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_CORE_EN, 1);
+	usleep_range(20, 40);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_LPF_EN, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_LPF_EN, 1);
+
+	return 0;
+}
+
+static int mtk_mipi_phy_power_off(struct phy *phy)
+{
+	struct mtk_mipi_cdphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/* Disable MIPI BG. */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_LPF_EN, 0);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA, RG_CSIXA_BG_LPF_EN, 0);
+
+	return 0;
+}
+
+static struct phy *mtk_mipi_cdphy_xlate(struct device *dev,
+					struct of_phandle_args *args)
+{
+	struct mtk_mipi_cdphy_port *priv = dev_get_drvdata(dev);
+
+	/*
+	 * If PHY is CD-PHY then we need to get the operating mode
+	 * For now only D-PHY mode is supported
+	 */
+	if (priv->type == CDPHY) {
+		if (args->args_count != 1) {
+			dev_err(dev, "invalid number of arguments\n");
+			return ERR_PTR(-EINVAL);
+		}
+		switch (args->args[0]) {
+		case PHY_TYPE_DPHY:
+			priv->mode = DPHY;
+			if (priv->num_lanes != 4) {
+				dev_err(dev, "Only 4D1C mode is supported for now!\n");
+				return ERR_PTR(-EINVAL);
+			}
+			break;
+		default:
+			dev_err(dev, "Unsupported PHY type: %i\n", args->args[0]);
+			return ERR_PTR(-EINVAL);
+		}
+	} else {
+		if (args->args_count) {
+			dev_err(dev, "invalid number of arguments\n");
+			return ERR_PTR(-EINVAL);
+		}
+		priv->mode = DPHY;
+	}
+
+	return priv->phy;
+}
+
+static const struct phy_ops mtk_cdphy_ops = {
+	.power_on	= mtk_mipi_phy_power_on,
+	.power_off	= mtk_mipi_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int mtk_mipi_cdphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct mtk_mipi_cdphy_port *port;
+	struct phy *phy;
+	int ret;
+	u32 phy_type;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, port);
+
+	port->dev = dev;
+
+	port->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(port->base))
+		return PTR_ERR(port->base);
+
+	ret = of_property_read_u32(dev->of_node, "num-lanes", &port->num_lanes);
+	if (ret) {
+		dev_err(dev, "Failed to read num-lanes property: %i\n", ret);
+		return ret;
+	}
+
+	/*
+	 * phy-type is optional, if not present, PHY is considered to be CD-PHY
+	 */
+	if (device_property_present(dev, "phy-type")) {
+		ret = of_property_read_u32(dev->of_node, "phy-type", &phy_type);
+		if (ret) {
+			dev_err(dev, "Failed to read phy-type property: %i\n", ret);
+			return ret;
+		}
+		switch (phy_type) {
+		case PHY_TYPE_DPHY:
+			port->type = DPHY;
+			break;
+		default:
+			dev_err(dev, "Unsupported PHY type: %i\n", phy_type);
+			return -EINVAL;
+		}
+	} else {
+		port->type = CDPHY;
+	}
+
+	phy = devm_phy_create(dev, NULL, &mtk_cdphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
+		return PTR_ERR(phy);
+	}
+
+	port->phy = phy;
+	phy_set_drvdata(phy, port);
+
+	phy_provider = devm_of_phy_provider_register(dev, mtk_mipi_cdphy_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "Failed to register PHY provider: %ld\n",
+			PTR_ERR(phy_provider));
+		return PTR_ERR(phy_provider);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mtk_mipi_cdphy_of_match[] = {
+	{ .compatible = "mediatek,mt8365-csi-rx" },
+	{ /* sentinel */},
+};
+MODULE_DEVICE_TABLE(of, mtk_mipi_cdphy_of_match);
+
+static struct platform_driver mipi_cdphy_pdrv = {
+	.probe = mtk_mipi_cdphy_probe,
+	.driver	= {
+		.name	= "mtk-mipi-csi-0-5",
+		.of_match_table = mtk_mipi_cdphy_of_match,
+	},
+};
+module_platform_driver(mipi_cdphy_pdrv);
+
+MODULE_DESCRIPTION("MediaTek MIPI CSI CD-PHY v0.5 Driver");
+MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

