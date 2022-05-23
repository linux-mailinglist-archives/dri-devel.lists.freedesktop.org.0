Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48E530E70
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 12:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8089610EF57;
	Mon, 23 May 2022 10:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A90E10EF57
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:51:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h5so19625422wrb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lq/ySulA0N0z+I2Unxh2VPBjRClaI9XgUkfX+cBIGCE=;
 b=poyZJ9Cz+Nwg86SEjlznk88PKD6+VWs/MbhOIC85j8u4WsViHdKoeS7ihDk9Dw5qcv
 QxMGCaoAv/0m+w7tuOTTMaLlKGZcoXAaKz9dxcY7kd3qpph6NulLKKL/K4q0IlOLQzwb
 8UYblL8FmrUqzTe2BArEu/YX4gW4QoLKeZ1AtjcrALWoLMUN+LNYBhdPT317w6+6K86S
 M64bPNbPHV/cvPRuRp+07kywDXvdV2iNO0vOHbZAQmIf5JT2NZGp+ESDRSP9nluHEOLf
 TRD6SOAFDlLr3xRgvA8i/97LAfHzOzYulu2oVAkB4Vwgf5TJCgGrouHQWlPmeRN4y1jN
 cjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lq/ySulA0N0z+I2Unxh2VPBjRClaI9XgUkfX+cBIGCE=;
 b=qiryz7N5UGLt5J9zJI86gK75oRSfaSLtA2KMOf0HkTDf9eQkpEw2TbiXFdkUT5696v
 0M2HMLYTs0eZnzEB1+kka9I8uQMjnGJgkI8LSUJPkDbmU7qHjRl1OTaCDJmrPzp5Jm1i
 EYL+bey0BsAWeJglz5ju2e26c5sfMXbBDpWEISyiYOznNGkjx3GkbNNHnSw1JDBdlI1G
 6P8/mR+IXCKr0tQgwKYX/eIDdvuwNNjEk7AJKqvwZHl3q1fKatGsYFWKv6CZM1tCLcJu
 WyVIGtPIH3yR9YtEv/rP1DG2o9todMOY2z0f52+uBSMEnNJbzcbds3huSU1DldIWbvTB
 9iIg==
X-Gm-Message-State: AOAM530yYBg+9ULgKS2hP07B+1dWd3dr/InUUNOwVcs88xiHWZhxeAjn
 /rntXFi+/YLclJRwlz7LL/0YRw==
X-Google-Smtp-Source: ABdhPJylUAUmsz7C7wsYRCsWWHWZvJ3mAjB0dZwOa3n3S9Dcc9CWC4lMfDN4mTgXlvPexF+uPnh3dw==
X-Received: by 2002:a05:6000:1e1a:b0:20f:c403:9180 with SMTP id
 bj26-20020a0560001e1a00b0020fc4039180mr10190025wrb.147.1653303115754; 
 Mon, 23 May 2022 03:51:55 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:55 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Subject: [PATCH v10 17/21] phy: phy-mtk-dp: Add driver for DP phy
Date: Mon, 23 May 2022 12:47:50 +0200
Message-Id: <20220523104758.29531-18-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

This is a new driver that supports the integrated DisplayPort phy for
mediatek SoCs, especially the mt8195. The phy is integrated into the
DisplayPort controller and will be created by the mtk-dp driver. This
driver expects a struct regmap to be able to work on the same registers
as the DisplayPort controller. It sets the device data to be the struct
phy so that the DisplayPort controller can easily work with it.

The driver does not have any devicetree bindings because the datasheet
does not list the controller and the phy as distinct units.

The interaction with the controller can be covered by the configure
callback of the phy framework and its displayport parameters.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 MAINTAINERS                       |   1 +
 drivers/phy/mediatek/Kconfig      |   8 ++
 drivers/phy/mediatek/Makefile     |   1 +
 drivers/phy/mediatek/phy-mtk-dp.c | 200 ++++++++++++++++++++++++++++++
 4 files changed, 210 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc47b2dbdc9..bfca96469d80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6604,6 +6604,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
 F:	drivers/gpu/drm/mediatek/
+F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 55f8e6c048ab..f7ec86059049 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
 	select GENERIC_PHY
 	help
 	  Support MIPI DSI for Mediatek SoCs.
+
+config PHY_MTK_DP
+	tristate "MediaTek DP-PHY Driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Support DisplayPort PHY for Mediatek SoCs.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index ace660fbed3a..4ba1e0650434 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the phy drivers.
 #
 
+obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
new file mode 100644
index 000000000000..6f29854f0c2f
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek DisplayPort PHY driver
+ *
+ * Copyright (c) 2021 BayLibre
+ * Author: Markus Schneider-Pargmann <msp@baylibre.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define PHY_OFFSET 0x1000
+
+#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x14)
+#define TPLL_SSC_EN					BIT(3)
+
+#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x3C)
+#define BIT_RATE_RBR				0
+#define BIT_RATE_HBR				1
+#define BIT_RATE_HBR2				2
+#define BIT_RATE_HBR3				3
+
+#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
+#define DP_GLB_SW_RST_PHYD			BIT(0)
+
+#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
+#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
+#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
+#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
+#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	BIT(4)
+#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	((BIT(2) | BIT(4)) << 8)
+#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	GENMASK(20, 19)
+#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	GENMASK(4, 3)
+#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	GENMASK(12, 9)
+#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	((BIT(2) | BIT(5)) << 16)
+#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	GENMASK(29, 29)
+#define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	(BIT(3) | BIT(5))
+#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	GENMASK(13, 12)
+#define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	GENMASK(10, 10)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	GENMASK(19, 19)
+#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	GENMASK(28, 28)
+#define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0
+#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	GENMASK(10, 9)
+#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	GENMASK(19, 18)
+#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	0
+#define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
+
+#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	GENMASK(3, 3)
+#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	0
+#define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
+						 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
+
+struct mtk_dp_phy {
+	struct regmap *regs;
+};
+
+static int mtk_dp_phy_init(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 driving_params[] = {
+		DRIVING_PARAM_3_DEFAULT,
+		DRIVING_PARAM_4_DEFAULT,
+		DRIVING_PARAM_5_DEFAULT,
+		DRIVING_PARAM_6_DEFAULT,
+		DRIVING_PARAM_7_DEFAULT,
+		DRIVING_PARAM_8_DEFAULT
+	};
+
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
+			  driving_params, ARRAY_SIZE(driving_params));
+
+	return 0;
+}
+
+static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+	u32 val;
+
+	if (opts->dp.set_rate) {
+		switch (opts->dp.link_rate) {
+		default:
+			dev_err(&phy->dev,
+				"Implementation error, unknown linkrate %x\n",
+				opts->dp.link_rate);
+			return -EINVAL;
+		case 1620:
+			val = BIT_RATE_RBR;
+			break;
+		case 2700:
+			val = BIT_RATE_HBR;
+			break;
+		case 5400:
+			val = BIT_RATE_HBR2;
+			break;
+		case 8100:
+			val = BIT_RATE_HBR3;
+			break;
+		}
+		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
+	}
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
+			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
+
+	return 0;
+}
+
+static int mtk_dp_phy_reset(struct phy *phy)
+{
+	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
+
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 0);
+	usleep_range(50, 200);
+	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
+			   DP_GLB_SW_RST_PHYD, 1);
+
+	return 0;
+}
+
+static const struct phy_ops mtk_dp_phy_dev_ops = {
+	.init = mtk_dp_phy_init,
+	.configure = mtk_dp_phy_configure,
+	.reset = mtk_dp_phy_reset,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_dp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_dp_phy *dp_phy;
+	struct phy *phy;
+	struct regmap *regs;
+
+	regs = *(struct regmap **)dev->platform_data;
+	if (!regs)
+		return dev_err_probe(dev, EINVAL, "No data passed, requires struct regmap**\n");
+
+	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
+	if (!dp_phy)
+		return -ENOMEM;
+
+	dp_phy->regs = regs;
+	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY\n");
+
+	phy_set_drvdata(phy, dp_phy);
+	if (!dev->of_node)
+		phy_create_lookup(phy, "dp", dev_name(dev));
+
+	return 0;
+}
+
+struct platform_driver mtk_dp_phy_driver = {
+	.probe = mtk_dp_phy_probe,
+	.driver = {
+		.name = "mediatek-dp-phy",
+	},
+};
+module_platform_driver(mtk_dp_phy_driver);
+
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
+MODULE_DESCRIPTION("MediaTek DP PHY Driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

