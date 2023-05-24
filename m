Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33E70F0BE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D3510E5A1;
	Wed, 24 May 2023 08:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812D810E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:30:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so2373025e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917054; x=1687509054; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFKWgsaYBd3mHEHb3jiyy/keLBwxuAt5USYK4ncqsCQ=;
 b=DBQN5ootfhAYvFDZ09nuTI5LJ/t2EWz0T5aNKPv3pfy/JuRo1rkp4Zm9nvhI70FIhL
 D1aE3+w6xsuvkyPWOZPlrGSAXSYFMzZIcHcuDEDy4au6CDiskiIBWeCF0K93xZf83TmU
 akrsBzdRDZvWMMJ5a8U2QDeSD58YZd4LkH7YTjcuKLqDOGm72vgDjZkN2UoqkCkvxwcn
 9giKtg1D/21gYtjgopg3IryD53yg/D7jWxGAzMo8cFa69eDS3QUN1nugYeN41WmcMxZg
 kgtJCeYq4QR8fGARaEa7zfB8yz4Y3gGBIFJpZJjBmiP8IsGDVupTCEO4BEsQ7pfb08n2
 2f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684917054; x=1687509054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFKWgsaYBd3mHEHb3jiyy/keLBwxuAt5USYK4ncqsCQ=;
 b=R3XLGleK52AHtj7/FI29Ycfz9b5kdOVWNJt7FfTAS40K8fCtrXb1yuZ2kpdsE1e1bz
 EyVYW09Bs9UejXh26XoujZOMFZYjNPse592bXhG7YYaSyNCJ9xK/k2F8nUPWbz3iGFBd
 5FCcP9hr+kdBocvA7E2oQTXfoKmyIph7J/DNJHbiFQaZJh6cwybS3HGRaiISidP6vuqG
 FE1t4l2akE6potXIwYrM1jVGqC+gS+30k9qqdknsGI8Hgtw426v8W7lWk3UYjEx61exq
 xlSliJbBeD2rDSwhpbjtp6TGGJ5rYX1YGa7FrarLacf85Y0ZhoyzjD3SK1hN0e49u0ek
 Ya6w==
X-Gm-Message-State: AC+VfDzza6ZjEoxOejRpsYMSspcPveLJSuYhsdzVglX4fVgGUuNWG83s
 VLdfj2KX91pfFQ1ueRQYSSGf3Q==
X-Google-Smtp-Source: ACHHUZ5FjEKzA1WCa4O2rOS0K2ewEa6NmutKBKue241klPSkPnFuNqdErru2BzzHUae5pscjmGgs2w==
X-Received: by 2002:a5d:540a:0:b0:2f1:e162:d48 with SMTP id
 g10-20020a5d540a000000b002f1e1620d48mr11646557wrv.47.1684917054463; 
 Wed, 24 May 2023 01:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:30:54 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v3 3/3] phy: mtk-mipi-csi: add driver for CSI phy
Date: Wed, 24 May 2023 10:30:32 +0200
Message-Id: <20230524083033.486490-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083033.486490-1-jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Louis Kuo <louis.kuo@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 khilman@baylibre.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mkorpershoek@baylibre.com, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
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
[Julien Stephan: simplify driver model: one instance per phy vs one instance
for all phys]
Co-developed-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 MAINTAINERS                                   |   1 +
 drivers/phy/mediatek/Kconfig                  |  12 +
 drivers/phy/mediatek/Makefile                 |   2 +
 .../mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h    |  62 ++++
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c   | 278 ++++++++++++++++++
 5 files changed, 355 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5-rx-reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5da594fbb761..e505023ffda1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13189,6 +13189,7 @@ M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
+F:	drivers/phy/mediatek/phy-mtk-mipi-csi-0-5*
 
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 3125ecb5d119..7088382ebc9e 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -74,3 +74,15 @@ config PHY_MTK_DP
 	select GENERIC_PHY
 	help
 	  Support DisplayPort PHY for MediaTek SoCs.
+
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
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index c9a50395533e..63f2fa3ec7e5 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -19,3 +19,5 @@ phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
 phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
 obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
+
+obj-$(CONFIG_PHY_MTK_MIPI_CSI_0_5)	+= phy-mtk-mipi-csi-0-5.o
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
index 000000000000..6eafd7c0514c
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -0,0 +1,278 @@
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
+struct mtk_mipi_dphy;
+
+struct mtk_mipi_dphy_port {
+	struct device *dev;
+	void __iomem *base;
+	struct phy *phy;
+	u32 type;
+};
+
+static void mtk_phy_csi_cdphy_ana_eq_tune(void __iomem *base)
+{
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI0A_L0_T0AB_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI0A_L0_T0AB_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI0A_L1_T1AB_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI0A_L1_T1AB_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
+			     RG_CSI0A_L2_T1BC_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA20_CSI0A,
+			     RG_CSI0A_L2_T1BC_EQ_BW, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI0A_L0_T0AB_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI0A_L0_T0AB_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI0A_L1_T1AB_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI0A_L1_T1AB_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA20_CSI0A,
+			     RG_CSI0A_L2_T1BC_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA20_CSI0A,
+			     RG_CSI0A_L2_T1BC_EQ_BW, 1);
+}
+
+static void mtk_phy_csi_dphy_ana_eq_tune(void __iomem *base)
+{
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L0_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L0_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L1_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L1_EQ_BW, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI1A_L2_EQ_IS, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI1A_L2_EQ_BW, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L0_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L0_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L1_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA18_CSIXA,
+			     RG_CSI1A_L1_EQ_BW, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI1A_L2_EQ_IS, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA1C_CSIXA,
+			     RG_CSI1A_L2_EQ_BW, 1);
+}
+
+static int mtk_mipi_phy_power_on(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/*
+	 * The driver currently supports DPHY and CD-PHY phys,
+	 * but the only mode supported is DPHY,
+	 * so CD-PHY capable phys must be configured in DPHY mode
+	 */
+	if (port->type == PHY_TYPE_CDPHY) {
+		mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+				     RG_CSI0A_CPHY_EN, 0);
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
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L2_CKMODE_EN, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L2_CKSEL, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L0_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L0_CKSEL, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L1_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L1_CKSEL, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L2_CKMODE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_DPHY_L2_CKSEL, 1);
+
+	/* Byte clock invert */
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L0_T0_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_DPHY_L1_BYTECK_INVERT, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANAA8_CSIXA,
+			     RG_CSIXA_CDPHY_L2_T1_BYTECK_INVERT, 1);
+
+	/* Start ANA EQ tuning */
+	if (port->type == PHY_TYPE_CDPHY)
+		mtk_phy_csi_cdphy_ana_eq_tune(base);
+	else
+		mtk_phy_csi_dphy_ana_eq_tune(base);
+
+	/* End ANA EQ tuning */
+	mtk_phy_set_bits(base + MIPI_RX_ANA40_CSIXA, 0x90);
+
+	mtk_phy_update_field(base + MIPI_RX_ANA24_CSIXA,
+			     RG_CSIXA_RESERVE, 0x40);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA24_CSIXA,
+			     RG_CSIXA_RESERVE, 0x40);
+	mtk_phy_update_field(base + MIPI_RX_WRAPPER80_CSIXA,
+			     CSR_CSI_RST_MODE, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_WRAPPER80_CSIXA,
+			     CSR_CSI_RST_MODE, 0);
+	/* ANA power on */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_CORE_EN, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_CORE_EN, 1);
+	usleep_range(20, 40);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_LPF_EN, 1);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_LPF_EN, 1);
+
+	return 0;
+}
+
+static int mtk_mipi_phy_power_off(struct phy *phy)
+{
+	struct mtk_mipi_dphy_port *port = phy_get_drvdata(phy);
+	void __iomem *base = port->base;
+
+	/* Disable MIPI BG. */
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_LPF_EN, 0);
+
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_CORE_EN, 0);
+	mtk_phy_update_field(base + CSIXB_OFFSET + MIPI_RX_ANA00_CSIXA,
+			     RG_CSIXA_BG_LPF_EN, 0);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dphy_ops = {
+	.power_on	= mtk_mipi_phy_power_on,
+	.power_off	= mtk_mipi_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int mtk_mipi_dphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct mtk_mipi_dphy_port *port;
+	struct phy *phy;
+	int ret;
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
+	ret = of_property_read_u32(dev->of_node, "mediatek,phy-type", &port->type);
+	if (ret) {
+		dev_err(dev, "Failed to read mediatek,phy-type\n");
+		return ret;
+	}
+
+	phy = devm_phy_create(dev, NULL, &mtk_dphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "Failed to create PHY: %ld\n", PTR_ERR(phy));
+		return PTR_ERR(phy);
+	}
+
+	port->phy = phy;
+	phy_set_drvdata(phy, port);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		dev_err(dev, "Failed to register PHY provider: %ld\n",
+			PTR_ERR(phy_provider));
+		return PTR_ERR(phy_provider);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mtk_mipi_dphy_of_match[] = {
+	{ .compatible = "mediatek,mt8365-csi-rx" },
+	{ /* sentinel */},
+};
+MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
+
+static struct platform_driver mipi_dphy_pdrv = {
+	.probe = mtk_mipi_dphy_probe,
+	.driver	= {
+		.name	= "mtk-mipi-csi-0-5",
+		.of_match_table = mtk_mipi_dphy_of_match,
+	},
+};
+module_platform_driver(mipi_dphy_pdrv);
+
+MODULE_DESCRIPTION("MediaTek MIPI CSI CD-PHY v0.5 Driver");
+MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.40.1

