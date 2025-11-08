Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA32C4238F
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFB210E1EA;
	Sat,  8 Nov 2025 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="P0I5AYym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A6D10E1B1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010511euoutp02e81f7b622be9efadd09317e8b39b3461~14ooSF4qb3059730597euoutp02E;
 Sat,  8 Nov 2025 01:05:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251108010511euoutp02e81f7b622be9efadd09317e8b39b3461~14ooSF4qb3059730597euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563911;
 bh=68jomELlgmob5pOmDxEXdM8w6Q2grmQoCc/S9agGyHQ=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=P0I5AYymr/rIlgfgomqJsAW0qsCbCFXq4YdDyQrtBVdnCbOi6uXNy7LLP3RkjZpIM
 GcDFKPU61vkXH8/v8rQYWBlHWFX/ohbOkECJWIZseCjKq/bUvgRUbmFG9ue5PnUaGN
 XPlP5y6N/M6wYHAwHx2udq1JV3/G9T4MolARV23s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251108010511eucas1p19bca04c74545fd6019de671cbf0413f5~14onnw-hm0284402844eucas1p1W;
 Sat,  8 Nov 2025 01:05:11 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010509eusmtip2fe40cdbb26fa70dff36437c66568c1ab~14omMBOQG0912409124eusmtip2b;
 Sat,  8 Nov 2025 01:05:09 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:46 +0100
Subject: [PATCH RFC 12/13] phy: starfive: Add jh7110-inno-hdmi-phy driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-12-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010511eucas1p19bca04c74545fd6019de671cbf0413f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010511eucas1p19bca04c74545fd6019de671cbf0413f5
X-EPHeader: CA
X-CMS-RootMailID: 20251108010511eucas1p19bca04c74545fd6019de671cbf0413f5
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010511eucas1p19bca04c74545fd6019de671cbf0413f5@eucas1p1.samsung.com>
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

[WARNING: This is mostly a duplicate of Rockchip RK3328 PHY driver, I
would like properly refactor common parts, maybe to some inno-phy
library, not 100% sure how this would look like so would happy to take
advice]

Add the HDMI PHY driver for the StarFive JH7110.

This driver binds to the starfive,jh7110-inno-hdmi-phy MFD child and
gets its regmap from the parent. It has no dependencies on voutcrg, only
on its refoclk (xin24m), which breaks the probe-time circular
dependency.

This driver provides two main functions:
 - Clock Provider: It registers clk_ops to provide the variable pixel
   clock (hdmi_pclk). The .set_rate operation configures the Pre-PLL
   registers (0x1a0+) based on the requested rate.

 - PHY Provider: It registers phy_ops for the controller. The .power_on
   op configures and enables the Post-PLL and other analog blocks (BIAS,
   LDO, Serializer, etc.).

The register level logic is based on the Rockchip RK3328 PHY driver, as
they share the same Innosilicon IP, but is adapted for the JH7110's
0x100 register offset.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                 |   1 +
 drivers/phy/starfive/Kconfig                |  19 +
 drivers/phy/starfive/Makefile               |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c | 762 ++++++++++++++++++++++++++++
 4 files changed, 783 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5984b83e55aeadb59c25a6e8f01057fb9d982d81..765b155574b2a0649f2df6b89a17eaf111d912bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24054,6 +24054,7 @@ F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem
 F:	drivers/soc/starfive/jh7110-hdmi-mfd.c
 F:	drivers/soc/starfive/jh7110-vout-subsystem.c
 F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
 
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
diff --git a/drivers/phy/starfive/Kconfig b/drivers/phy/starfive/Kconfig
index d0cdd7cb4a13de22ff643c89a79d99cce57284d7..9f0c330c1dd52f38a51ff9e211340ecdf091fce1 100644
--- a/drivers/phy/starfive/Kconfig
+++ b/drivers/phy/starfive/Kconfig
@@ -25,6 +25,25 @@ config PHY_STARFIVE_JH7110_DPHY_TX
 	  system. If M is selected, the module will be called
 	  phy-jh7110-dphy-tx.ko.
 
+config PHY_STARFIVE_JH7110_INNO_HDMI
+	tristate "Starfive JH7110 INNO HDMI PHY"
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  This option enables the driver for the analog HDMI PHY (Physical
+	  Layer) on the StarFive JH7110 SoC.
+
+	  This driver binds to a child node of the 'starfive,jh7110-hdmi-mfd'
+	  parent driver and gets its register map from that parent.
+
+	  It is responsible for two main functions:
+	  1. PHY Provider: It provides standard PHY operations (.power_on,
+	     .power_off) for the HDMI controller (bridge) driver. This
+	     involves configuring the Post-PLL and analog TMDS blocks.
+	  2. Clock Provider: It registers as a clock provider to supply the
+	     variable pixel clock (hdmi_pclk) to the HDMI controller and
+	     the VOUT subsystem, which it generates using the Pre-PLL.
+
 config PHY_STARFIVE_JH7110_PCIE
 	tristate "Starfive JH7110 PCIE 2.0/USB 3.0 PHY support"
 	depends on HAS_IOMEM
diff --git a/drivers/phy/starfive/Makefile b/drivers/phy/starfive/Makefile
index eedc4a6fec156320c99ac0a0da609083b6a6a695..e7b13f00880b500f933f21b6037384d5c6884e3e 100644
--- a/drivers/phy/starfive/Makefile
+++ b/drivers/phy/starfive/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_STARFIVE_JH7110_DPHY_RX)	+= phy-jh7110-dphy-rx.o
 obj-$(CONFIG_PHY_STARFIVE_JH7110_DPHY_TX)	+= phy-jh7110-dphy-tx.o
+obj-$(CONFIG_PHY_STARFIVE_JH7110_INNO_HDMI)	+= phy-jh7110-inno-hdmi.o
 obj-$(CONFIG_PHY_STARFIVE_JH7110_PCIE)		+= phy-jh7110-pcie.o
 obj-$(CONFIG_PHY_STARFIVE_JH7110_USB)		+= phy-jh7110-usb.o
diff --git a/drivers/phy/starfive/phy-jh7110-inno-hdmi.c b/drivers/phy/starfive/phy-jh7110-inno-hdmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..a74893cbcfad245ec325b1e399bd8ded829376fa
--- /dev/null
+++ b/drivers/phy/starfive/phy-jh7110-inno-hdmi.c
@@ -0,0 +1,762 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * This driver handles the PHY portion of the StarFive Innosilicon HDMI IP,
+ * which is part of a monolithic MFD block. It provides the variable pixel
+ * clock (from the Pre-PLL) and the PHY operations (for the Post-PLL/analog).
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/phy/phy.h>
+#include <linux/slab.h>
+
+#define UPDATE(x, h, l)		(((x) << (l)) & GENMASK((h), (l)))
+
+/*
+ * StarFive (JH7110) Innosilicon HDMI PHY Register Definitions
+ */
+
+/* REG: 0x1a0 */
+#define STF_INNO_PRE_PLL_CONTROL		0x1a0
+#define STF_INNO_PRE_PLL_POWER_DOWN		BIT(0)
+#define STF_INNO_PCLK_VCO_DIV_5_MASK		BIT(1)
+#define STF_INNO_PCLK_VCO_DIV_5(x)		UPDATE(x, 1, 1)
+
+/* REG: 0x1a1 */
+#define STF_INNO_PRE_PLL_DIV_1		0x1a1
+#define STF_INNO_PRE_PLL_PRE_DIV_MASK		GENMASK(5, 0)
+#define STF_INNO_PRE_PLL_PRE_DIV(x)		UPDATE(x, 5, 0)
+
+/* REG: 0x1a2 */
+#define STF_INNO_PRE_PLL_DIV_2		0x1a2
+#define STF_INNO_SPREAD_SPECTRUM_MOD_DOWN	BIT(7)
+#define STF_INNO_SPREAD_SPECTRUM_MOD_DISABLE	BIT(6)
+#define STF_INNO_PRE_PLL_FRAC_DIV_DISABLE	FIELD_PREP(GENMASK(5, 4), 3)
+#define STF_INNO_PRE_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
+#define STF_INNO_PRE_PLL_FB_DIV_11_8(x)	FIELD_PREP(STF_INNO_PRE_PLL_FB_DIV_11_8_MASK, (x) >> 8)
+
+/* REG: 0x1a3 */
+#define STF_INNO_PRE_PLL_DIV_3		0x1a3
+#define STF_INNO_PRE_PLL_FB_DIV_7_0(x)		FIELD_PREP(GENMASK(7, 0), x)
+
+/* REG: 0x1a4 -- TMDSCLK Divs, needed by set_rate */
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV		0x1a4
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_C_MASK	GENMASK(1, 0)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_C(x)	UPDATE(x, 1, 0)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_B_MASK	GENMASK(3, 2)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_B(x)	UPDATE(x, 3, 2)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_A_MASK	GENMASK(5, 4)
+#define STF_INNO_PRE_PLL_TMDSCLK_DIV_A(x)	UPDATE(x, 5, 4)
+
+/* REG: 0x1a5 */
+#define STF_INNO_PCLK_DIV_AB_REG		0x1a5
+#define STF_INNO_PCLK_DIV_B_SHIFT		5
+#define STF_INNO_PCLK_DIV_B_MASK		GENMASK(6, 5)
+#define STF_INNO_PCLK_DIV_B(x)		UPDATE(x, 6, 5)
+#define STF_INNO_PCLK_DIV_A_MASK		GENMASK(4, 0)
+#define STF_INNO_PCLK_DIV_A(x)		UPDATE(x, 4, 0)
+
+/* REG: 0x1a6 */
+#define STF_INNO_PCLK_DIV_CD_REG		0x1a6
+#define STF_INNO_PCLK_DIV_C_SHIFT		5
+#define STF_INNO_PCLK_DIV_C_MASK		GENMASK(6, 5)
+#define STF_INNO_PCLK_DIV_C(x)		UPDATE(x, 6, 5)
+#define STF_INNO_PCLK_DIV_D_MASK		GENMASK(4, 0)
+#define STF_INNO_PCLK_DIV_D(x)		UPDATE(x, 4, 0)
+
+/* REG: 0x1a9 */
+#define STF_INNO_PRE_PLL_LOCK_STATUS		0x1a9
+#define STF_INNO_PRE_PLL_LOCK		BIT(0)
+
+/* REG: 0x1aa */
+#define STF_INNO_POST_PLL_DIV_1		0x1aa
+#define STF_INNO_POST_PLL_POST_DIV_ENABLE	GENMASK(3, 2)
+#define STF_INNO_POST_PLL_REFCLK_SEL_TMDS	BIT(1)
+#define STF_INNO_POST_PLL_POWER_DOWN		BIT(0)
+
+/* REG: 0x1ab */
+#define STF_INNO_POST_PLL_DIV_2		0x1ab
+#define STF_INNO_POST_PLL_PRE_DIV(x)		FIELD_PREP(GENMASK(5, 0), x)
+#define STF_INNO_POST_PLL_FB_DIV_8(x)		UPDATE((x) >> 8, 7, 7)
+
+/* REG: 0x1ac */
+#define STF_INNO_POST_PLL_DIV_3		0x1ac
+#define STF_INNO_POST_PLL_FB_DIV_7_0(x)	UPDATE(x, 7, 0)
+
+/* REG: 0x1ad */
+#define STF_INNO_POST_PLL_DIV_4		0x1ad
+#define STF_INNO_POST_PLL_POST_DIV_MASK	GENMASK(1, 0)
+
+/* REG: 0x1af */
+#define STF_INNO_POST_PLL_LOCK_STATUS		0x1af
+#define STF_INNO_POST_PLL_LOCK		BIT(0)
+
+/* REG: 0x1b0 */
+#define STF_INNO_BIAS_CONTROL			0x1b0
+#define STF_INNO_BIAS_ENABLE			BIT(2)
+
+/* REG: 0x1b2 */
+#define STF_INNO_TMDS_CONTROL			0x1b2
+#define STF_INNO_TMDS_CLK_DRIVER_EN		BIT(3)
+#define STF_INNO_TMDS_D2_DRIVER_EN		BIT(2)
+#define STF_INNO_TMDS_D1_DRIVER_EN		BIT(1)
+#define STF_INNO_TMDS_D0_DRIVER_EN		BIT(0)
+#define STF_INNO_TMDS_DRIVER_ENABLE		(STF_INNO_TMDS_CLK_DRIVER_EN | \
+						 STF_INNO_TMDS_D2_DRIVER_EN | \
+						 STF_INNO_TMDS_D1_DRIVER_EN | \
+						 STF_INNO_TMDS_D0_DRIVER_EN)
+
+/* REG: 0x1b4 */
+#define STF_INNO_LDO_CONTROL			0x1b4
+#define STF_INNO_LDO_ENABLE			(BIT(2) | BIT(1) | BIT(0))
+
+/* REG: 0x1be */
+#define STF_INNO_SERIALIER_CONTROL		0x1be
+#define STF_INNO_SERIALIER_ENABLE		(BIT(6) | BIT(5) | BIT(4) | BIT(0))
+
+/* REG: 0x1cc */
+#define STF_INNO_RX_CONTROL			0x1cc
+#define STF_INNO_RX_ENABLE			(BIT(3) | BIT(2) | BIT(1) | BIT(0))
+
+/* REG: 0x1d1 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_H		0x1d1
+#define STF_INNO_PRE_PLL_FRAC_DIV_23_16(x)	UPDATE((x) >> 16, 7, 0)
+/* REG: 0x1d2 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_M		0x1d2
+#define STF_INNO_PRE_PLL_FRAC_DIV_15_8(x)	UPDATE((x) >> 8, 7, 0)
+/* REG: 0x1d3 */
+#define STF_INNO_PRE_PLL_FRAC_DIV_L		0x1d3
+#define STF_INNO_PRE_PLL_FRAC_DIV_7_0(x)	UPDATE(x, 7, 0)
+
+/*
+ * These tables are copied from the monolithic driver.
+ * They match the Rockchip PHY driver tables.
+ */
+struct pre_pll_config {
+	unsigned long pixclock;
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 tmds_div_a;
+	u8 tmds_div_b;
+	u8 tmds_div_c;
+	u8 pclk_div_a;
+	u8 pclk_div_b;
+	u8 pclk_div_c;
+	u8 pclk_div_d;
+	u8 vco_div_5_en;
+	u32 fracdiv;
+};
+
+struct post_pll_config {
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 postdiv;
+	u8 post_div_en;
+	u8 version;
+};
+
+static const struct pre_pll_config pre_pll_cfg_table[] = {
+	{ 25175000, 25175000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0xF55555 },
+	{ 25200000, 25200000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0 },
+	{ 27000000, 27000000, 1, 90, 3, 2, 2, 10, 3, 3, 4, 0, 0 },
+	{ 27027000, 27027000, 1, 90, 3, 2, 2, 10, 3, 3, 4, 0, 0x170A3D },
+	{ 28320000, 28320000, 1, 28, 2, 1, 1, 3, 0, 3, 4, 0, 0x51EB85 },
+	{ 30240000, 30240000, 1, 30, 2, 1, 1, 3, 0, 3, 4, 0, 0x3D70A3 },
+	{ 31500000, 31500000, 1, 31, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 33750000, 33750000, 1, 33, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 36000000, 36000000, 1, 36, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 40000000, 40000000, 1, 80, 2, 2, 2, 12, 2, 2, 2, 0, 0 },
+	{ 46970000, 46970000, 1, 46, 2, 1, 1, 3, 0, 3, 4, 0, 0xF851EB },
+	{ 49500000, 49500000, 1, 49, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 49000000, 49000000, 1, 49, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 50000000, 50000000, 1, 50, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 54000000, 54000000, 1, 54, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 54054000, 54054000, 1, 54, 2, 1, 1, 3, 0, 3, 4, 0, 0x0DD2F1 },
+	{ 57284000, 57284000, 1, 57, 2, 1, 1, 3, 0, 3, 4, 0, 0x48B439 },
+	{ 58230000, 58230000, 1, 58, 2, 1, 1, 3, 0, 3, 4, 0, 0x3AE147 },
+	{ 59341000, 59341000, 1, 59, 2, 1, 1, 3, 0, 3, 4, 0, 0x574BC6 },
+	{ 59400000, 59400000, 1, 99, 3, 1, 1, 1, 3, 3, 4, 0, 0 },
+	{ 65000000, 65000000, 1, 130, 2, 2, 2, 12, 0, 2, 2, 0, 0 },
+	{ 68250000, 68250000, 1, 68, 2, 1, 1, 3, 0, 3, 4, 0, 0x3FFFFF },
+	{ 71000000, 71000000, 1, 71, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 74176000, 74176000, 1, 98, 1, 2, 2, 1, 2, 3, 4, 0, 0xE6AE6B },
+	{ 74250000, 74250000, 1, 99, 1, 2, 2, 1, 2, 3, 4, 0, 0 },
+	{ 75000000, 75000000, 1, 75, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 78750000, 78750000, 1, 78, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 79500000, 79500000, 1, 79, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 83500000, 83500000, 2, 167, 2, 1, 1, 1, 0, 0, 6, 0, 0 },
+	{ 83500000, 104375000, 1, 104, 2, 1, 1, 1, 1, 0, 5, 0, 0x600000 },
+	{ 85500000, 85500000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 85750000, 85750000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 85800000, 85800000, 1, 85, 2, 1, 1, 3, 0, 3, 4, 0, 0xCCCCCC },
+	{ 88750000, 88750000, 1, 88, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 89910000, 89910000, 1, 89, 2, 1, 1, 3, 0, 3, 4, 0, 0xE8F5C1 },
+	{ 90000000, 90000000, 1, 90, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 101000000, 101000000, 1, 101, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 102250000, 102250000, 1, 102, 2, 1, 1, 3, 0, 3, 4, 0, 0x3FFFFF },
+	{ 106500000, 106500000, 1, 106, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 108000000, 108000000, 1, 90, 3, 0, 0, 5, 0, 2, 2, 0, 0 },
+	{ 119000000, 119000000, 1, 119, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 131481000, 131481000, 1, 131, 2, 1, 1, 3, 0, 3, 4, 0, 0x7B22D1 },
+	{ 135000000, 135000000, 1, 135, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 136750000, 136750000, 1, 136, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 147180000, 147180000, 1, 147, 2, 1, 1, 3, 0, 3, 4, 0, 0x2E147A },
+	{ 148352000, 148352000, 1, 98, 1, 1, 1, 1, 2, 2, 2, 0, 0xE6AE6B },
+	{ 148500000, 148500000, 1, 99, 1, 1, 1, 1, 2, 2, 2, 0, 0 },
+	{ 154000000, 154000000, 1, 154, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 156000000, 156000000, 1, 156, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 157000000, 157000000, 1, 157, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 162000000, 162000000, 1, 162, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 174250000, 174250000, 1, 145, 3, 0, 0, 5, 0, 2, 2, 0, 0x355555 },
+	{ 174500000, 174500000, 1, 174, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 174570000, 174570000, 1, 174, 2, 1, 1, 3, 0, 3, 4, 0, 0x91EB84 },
+	{ 175500000, 175500000, 1, 175, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 185590000, 185590000, 1, 185, 2, 1, 1, 3, 0, 3, 4, 0, 0x970A3C },
+	{ 187000000, 187000000, 1, 187, 2, 1, 1, 3, 0, 3, 4, 0, 0 },
+	{ 241500000, 241500000, 1, 161, 1, 1, 1, 4, 0, 2, 2, 0, 0 },
+	{ 241700000, 241700000, 1, 241, 2, 1, 1, 3, 0, 3, 4, 0, 0xB33332 },
+	{ 262750000, 262750000, 1, 262, 2, 1, 1, 3, 0, 3, 4, 0, 0xCFFFFF },
+	{ 296500000, 296500000, 1, 296, 2, 1, 1, 3, 0, 3, 4, 0, 0x7FFFFF },
+	{ 296703000, 296703000, 1, 98, 0, 1, 1, 1, 0, 2, 2, 0, 0xE6AE6B },
+	{ 297000000, 297000000, 1, 99, 0, 1, 1, 1, 0, 2, 2, 0, 0 },
+	{ 594000000, 594000000, 1, 99, 0, 2, 0, 1, 0, 1, 1, 0, 0 },
+	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
+};
+
+static const struct post_pll_config post_pll_cfg_table[] = {
+	{ 25200000, 1, 80, 13, 3, 1 },
+	{ 27000000, 1, 40, 11, 3, 1 },
+	{ 27027000, 1, 40, 11, 3, 1 },
+	{ 33750000, 1, 40, 11, 3, 1 },
+	{ 49000000, 1, 20, 1, 3, 3 },
+	{ 65000000, 1, 20, 1, 3, 3 },
+	{ 74250000, 1, 20, 1, 3, 3 },
+	{ 88750000, 1, 20, 1, 3, 3 },
+	{ 108000000, 1, 20, 1, 3, 3 },
+	{ 148500000, 1, 20, 1, 3, 3 },
+	{ 162000000, 1, 20, 1, 3, 3 },
+	{ 174250000, 1, 20, 1, 3, 3 },
+	{ 187000000, 1, 20, 1, 3, 3 },
+	{ 241700000, 1, 20, 1, 3, 3 },
+	{ 297000000, 4, 20, 0, 0, 3 },
+	{ 594000000, 4, 20, 0, 0, 0 }, /* postpll_postdiv_en = 0 */
+	{ /* sentinel */ }
+};
+
+struct starfive_hdmi_phy {
+	struct device *dev;
+	struct regmap *regmap;
+	struct phy *phy;
+	struct clk *refoclk;
+
+	struct clk_hw hw;
+	struct clk *phyclk;
+	unsigned long pixclock;
+	unsigned long tmdsclock;
+
+	const struct pre_pll_config *pre_cfg;
+	const struct post_pll_config *post_cfg;
+};
+
+static inline void inno_write(struct starfive_hdmi_phy *inno, u32 reg, u8 val)
+{
+	regmap_write(inno->regmap, reg * 4, val);
+}
+
+static inline u8 inno_read(struct starfive_hdmi_phy *inno, u32 reg)
+{
+	u32 val;
+
+	regmap_read(inno->regmap, reg * 4, &val);
+	return val;
+}
+
+static inline void inno_update_bits(struct starfive_hdmi_phy *inno, u16 reg,
+				    u8 mask, u8 val)
+{
+	regmap_update_bits(inno->regmap, reg * 4, mask, val);
+}
+
+#define inno_poll(inno, reg, val, cond, sleep_us, timeout_us) \
+	regmap_read_poll_timeout((inno)->regmap, (reg) * 4, val, cond, \
+				 sleep_us, timeout_us)
+
+static const
+struct pre_pll_config *inno_hdmi_phy_get_pre_pll_cfg(struct starfive_hdmi_phy *inno,
+						     unsigned long rate)
+{
+	const struct pre_pll_config *cfg = pre_pll_cfg_table;
+
+	/* Round rate to nearest 1000Hz for matching */
+	rate = DIV_ROUND_CLOSEST(rate, 1000) * 1000;
+
+	for (; cfg->pixclock != 0; cfg++)
+		if (cfg->pixclock == rate)
+			break;
+
+	if (cfg->pixclock == 0)
+		return ERR_PTR(-EINVAL);
+
+	return cfg;
+}
+
+static inline struct starfive_hdmi_phy *to_starfive_hdmi_phy(struct clk_hw *hw)
+{
+	return container_of(hw, struct starfive_hdmi_phy, hw);
+}
+
+static int starfive_hdmi_phy_clk_prepare(struct clk_hw *hw)
+{
+	struct starfive_hdmi_phy *inno = to_starfive_hdmi_phy(hw);
+	u32 val;
+	int ret;
+
+	/* Ensure Pre-PLL is powered up */
+	inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+			 STF_INNO_PRE_PLL_POWER_DOWN, 0);
+
+	/* Wait for Pre-PLL lock if not already locked */
+	val = inno_read(inno, STF_INNO_PRE_PLL_LOCK_STATUS);
+	if (val & STF_INNO_PRE_PLL_LOCK_STATUS)
+		return 0; /* Already locked */
+
+	ret = inno_poll(inno, STF_INNO_PRE_PLL_LOCK_STATUS, val,
+			val & STF_INNO_PRE_PLL_LOCK_STATUS, 1000, 100000);
+	if (ret < 0) {
+		dev_err(inno->dev, "Timeout waiting for pre-PLL lock\n");
+		inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+				 STF_INNO_PRE_PLL_POWER_DOWN,
+				 STF_INNO_PRE_PLL_POWER_DOWN);
+		return ret;
+	}
+	return 0;
+}
+
+static void starfive_hdmi_phy_clk_unprepare(struct clk_hw *hw)
+{
+	struct starfive_hdmi_phy *inno = to_starfive_hdmi_phy(hw);
+
+	/* Power down Pre-PLL */
+	inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+			 STF_INNO_PRE_PLL_POWER_DOWN,
+			 STF_INNO_PRE_PLL_POWER_DOWN);
+	inno->pixclock = 0; /* Invalidate cached rate */
+}
+
+static int starfive_hdmi_phy_clk_is_prepared(struct clk_hw *hw)
+{
+	struct starfive_hdmi_phy *inno = to_starfive_hdmi_phy(hw);
+	u8 status;
+
+	status = inno_read(inno, STF_INNO_PRE_PLL_CONTROL);
+	if (status & STF_INNO_PRE_PLL_POWER_DOWN)
+		return 0;
+
+	return !!(inno_read(inno, STF_INNO_PRE_PLL_LOCK_STATUS) &
+		  STF_INNO_PRE_PLL_LOCK_STATUS);
+}
+
+static unsigned long starfive_hdmi_phy_clk_recalc_rate(struct clk_hw *hw,
+						       unsigned long parent_rate)
+{
+	struct starfive_hdmi_phy *inno = to_starfive_hdmi_phy(hw);
+	unsigned long frac;
+	u8 nd, no_a, no_b, no_d;
+	u64 vco;
+	u16 nf;
+
+	if (!starfive_hdmi_phy_clk_is_prepared(hw))
+		return inno->pixclock;
+
+	nd = inno_read(inno, STF_INNO_PRE_PLL_DIV_1) & STF_INNO_PRE_PLL_PRE_DIV_MASK;
+	nf = ((inno_read(inno, STF_INNO_PRE_PLL_DIV_2) & STF_INNO_PRE_PLL_FB_DIV_11_8_MASK) << 8);
+	nf |= inno_read(inno, STF_INNO_PRE_PLL_DIV_3);
+	vco = parent_rate * nf;
+
+	if (!(inno_read(inno, STF_INNO_PRE_PLL_DIV_2) & STF_INNO_PRE_PLL_FRAC_DIV_DISABLE)) {
+		frac = inno_read(inno, STF_INNO_PRE_PLL_FRAC_DIV_L) |
+		       (inno_read(inno, STF_INNO_PRE_PLL_FRAC_DIV_M) << 8) |
+		       (inno_read(inno, STF_INNO_PRE_PLL_FRAC_DIV_H) << 16);
+		vco += DIV_ROUND_CLOSEST(parent_rate * frac, (1 << 24));
+	}
+
+	if (inno_read(inno, STF_INNO_PRE_PLL_CONTROL) & STF_INNO_PCLK_VCO_DIV_5_MASK) {
+		do_div(vco, nd * 5);
+	} else {
+		no_a = inno_read(inno, STF_INNO_PCLK_DIV_AB_REG) & STF_INNO_PCLK_DIV_A_MASK;
+		no_b = inno_read(inno, STF_INNO_PCLK_DIV_AB_REG) & STF_INNO_PCLK_DIV_B_MASK;
+		no_b >>= STF_INNO_PCLK_DIV_B_SHIFT;
+		no_b += 2;
+		no_d = inno_read(inno, STF_INNO_PCLK_DIV_CD_REG) & STF_INNO_PCLK_DIV_D_MASK;
+
+		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
+	}
+
+	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
+
+	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
+		__func__, inno->pixclock, vco);
+
+	return inno->pixclock;
+}
+
+static long starfive_hdmi_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+					     unsigned long *parent_rate)
+{
+	const struct pre_pll_config *cfg = pre_pll_cfg_table;
+
+	rate = (rate / 1000) * 1000;
+
+	for (; cfg->pixclock != 0; cfg++)
+		if (cfg->pixclock == rate)
+			break;
+
+	if (cfg->pixclock == 0)
+		return -EINVAL;
+
+	return cfg->pixclock;
+}
+
+static int starfive_hdmi_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	struct starfive_hdmi_phy *inno = to_starfive_hdmi_phy(hw);
+	const struct pre_pll_config *cfg;
+	unsigned long tmdsclock;
+	u32 val;
+
+	/*
+	 * Find the config entry for the requested pixclock (rate).
+	 * This cfg entry also contains the required tmdsclock.
+	 */
+	cfg = inno_hdmi_phy_get_pre_pll_cfg(inno, rate);
+	if (IS_ERR(cfg))
+		return PTR_ERR(cfg);
+
+	tmdsclock = cfg->tmdsclock;
+
+	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
+		__func__, rate, tmdsclock);
+
+	if (inno->pixclock == rate && inno->tmdsclock == tmdsclock)
+		return 0;
+
+	inno->pre_cfg = cfg;
+
+	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
+			 STF_INNO_BIAS_ENABLE, STF_INNO_BIAS_ENABLE);
+	inno_write(inno, STF_INNO_RX_CONTROL, STF_INNO_RX_ENABLE);
+
+	/* Power down Pre-PLL before re-configuring */
+	inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+			 STF_INNO_PRE_PLL_POWER_DOWN,
+			 STF_INNO_PRE_PLL_POWER_DOWN);
+
+	/* Configure pre-pll */
+	inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+			 STF_INNO_PCLK_VCO_DIV_5_MASK,
+			 STF_INNO_PCLK_VCO_DIV_5(cfg->vco_div_5_en));
+	inno_write(inno, STF_INNO_PRE_PLL_DIV_1,
+		   STF_INNO_PRE_PLL_PRE_DIV(cfg->prediv));
+
+	val = STF_INNO_SPREAD_SPECTRUM_MOD_DISABLE;
+	if (!cfg->fracdiv)
+		val |= STF_INNO_PRE_PLL_FRAC_DIV_DISABLE;
+
+	inno_write(inno, STF_INNO_PRE_PLL_DIV_2,
+		   STF_INNO_PRE_PLL_FB_DIV_11_8(cfg->fbdiv) | val);
+	inno_write(inno, STF_INNO_PRE_PLL_DIV_3,
+		   STF_INNO_PRE_PLL_FB_DIV_7_0(cfg->fbdiv));
+
+	/* Write PCLK dividers */
+	inno_write(inno, STF_INNO_PCLK_DIV_AB_REG,
+		   STF_INNO_PCLK_DIV_A(cfg->pclk_div_a) |
+		   STF_INNO_PCLK_DIV_B(cfg->pclk_div_b));
+	inno_write(inno, STF_INNO_PCLK_DIV_CD_REG,
+		   STF_INNO_PCLK_DIV_C(cfg->pclk_div_c) |
+		   STF_INNO_PCLK_DIV_D(cfg->pclk_div_d));
+
+	/* Write TMDSCLK dividers */
+	inno_write(inno, STF_INNO_PRE_PLL_TMDSCLK_DIV,
+		   STF_INNO_PRE_PLL_TMDSCLK_DIV_C(cfg->tmds_div_c) |
+		   STF_INNO_PRE_PLL_TMDSCLK_DIV_A(cfg->tmds_div_a) |
+		   STF_INNO_PRE_PLL_TMDSCLK_DIV_B(cfg->tmds_div_b));
+
+	/* Write fractional divider registers */
+	inno_write(inno, STF_INNO_PRE_PLL_FRAC_DIV_L,
+		   STF_INNO_PRE_PLL_FRAC_DIV_7_0(cfg->fracdiv));
+	inno_write(inno, STF_INNO_PRE_PLL_FRAC_DIV_M,
+		   STF_INNO_PRE_PLL_FRAC_DIV_15_8(cfg->fracdiv));
+	inno_write(inno, STF_INNO_PRE_PLL_FRAC_DIV_H,
+		   STF_INNO_PRE_PLL_FRAC_DIV_23_16(cfg->fracdiv));
+
+	/* Power up Pre-PLL */
+	inno_update_bits(inno, STF_INNO_PRE_PLL_CONTROL,
+			 STF_INNO_PRE_PLL_POWER_DOWN, 0);
+
+	inno->pixclock = rate;
+	inno->tmdsclock = tmdsclock;
+
+	return 0;
+}
+
+static const struct clk_ops starfive_hdmi_phy_clk_ops = {
+	.prepare = starfive_hdmi_phy_clk_prepare,
+	.unprepare = starfive_hdmi_phy_clk_unprepare,
+	.is_prepared = starfive_hdmi_phy_clk_is_prepared,
+	.recalc_rate = starfive_hdmi_phy_clk_recalc_rate,
+	.round_rate = starfive_hdmi_phy_clk_round_rate,
+	.set_rate = starfive_hdmi_phy_clk_set_rate,
+};
+
+static int starfive_hdmi_phy_power_on(struct phy *phy)
+{
+	struct starfive_hdmi_phy *inno = phy_get_drvdata(phy);
+	const struct post_pll_config *cfg = post_pll_cfg_table;
+	unsigned long tmdsclock = inno->tmdsclock;
+	u8 reg_1ad_value;
+	u8 reg_1aa_value;
+
+	u32 v;
+	int ret;
+
+	if (!tmdsclock) {
+		dev_err(inno->dev, "TMDS clock is zero (pixclock not set?)\n");
+		return -EINVAL;
+	}
+
+	/* Find Post-PLL config */
+	for (; cfg->tmdsclock != 0; cfg++)
+		if (tmdsclock <= cfg->tmdsclock)
+			break;
+
+	if (cfg->tmdsclock == 0) {
+		dev_err(inno->dev, "Failed to find Post-PLL config\n");
+		return -EINVAL;
+	}
+	inno->post_cfg = cfg;
+
+	dev_dbg(inno->dev, "Inno HDMI PHY Power On: pixclk %lu, tmdsclk %lu\n",
+		inno->pixclock, tmdsclock);
+
+	reg_1ad_value = cfg->post_div_en ? cfg->postdiv : 0x00;
+	reg_1aa_value = cfg->post_div_en ? 0x0e : 0x02;
+
+	/*
+	 * Pre-PLL is already prepared and running at inno->pixclock
+	 * via the clk_set_rate and prepare calls from the controller/bridge.
+	 * Now, configure and enable the Post-PLL and TMDS outputs.
+	 */
+
+	inno_write(inno, STF_INNO_POST_PLL_DIV_2,
+		   STF_INNO_POST_PLL_PRE_DIV(cfg->prediv));
+	inno_write(inno, STF_INNO_POST_PLL_DIV_3, cfg->fbdiv & 0xff);
+	inno_write(inno, STF_INNO_POST_PLL_DIV_4, reg_1ad_value);
+
+	/* Power up Post-PLL */
+	inno_write(inno, STF_INNO_POST_PLL_DIV_1, reg_1aa_value);
+
+	/* Wait for post PLL lock */
+	ret = inno_poll(inno, STF_INNO_POST_PLL_LOCK_STATUS, v,
+			v & STF_INNO_POST_PLL_LOCK_STATUS, 1000, 100000);
+	if (ret) {
+		dev_err(inno->dev, "Post-PLL locking failed\n");
+		return ret;
+	}
+
+	inno_write(inno, STF_INNO_LDO_CONTROL, STF_INNO_LDO_ENABLE);
+	inno_write(inno, STF_INNO_SERIALIER_CONTROL,
+		   STF_INNO_SERIALIER_ENABLE);
+	inno_write(inno, STF_INNO_TMDS_CONTROL, 0x8f);
+
+	return 0;
+}
+
+static int starfive_hdmi_phy_power_off(struct phy *phy)
+{
+	struct starfive_hdmi_phy *inno = phy_get_drvdata(phy);
+
+	dev_dbg(inno->dev, "Inno HDMI PHY Power Off\n");
+
+	inno_write(inno, STF_INNO_TMDS_CONTROL, 0x00);
+	inno_write(inno, STF_INNO_SERIALIER_CONTROL, 0x00);
+	inno_write(inno, STF_INNO_LDO_CONTROL, 0x00);
+	inno_update_bits(inno, STF_INNO_BIAS_CONTROL,
+			 STF_INNO_BIAS_ENABLE, 0x00);
+	inno_write(inno, STF_INNO_RX_CONTROL, 0x00);
+
+	/* Power down Post-PLL */
+	inno_update_bits(inno, STF_INNO_POST_PLL_DIV_1,
+			 STF_INNO_POST_PLL_POWER_DOWN,
+			 STF_INNO_POST_PLL_POWER_DOWN);
+
+	/*
+	 * Pre-PLL (our clock) is powered down by the
+	 * clock framework via .unprepare (clk_disable_unprepare)
+	 */
+	clk_disable_unprepare(inno->phyclk);
+
+	inno->tmdsclock = 0;
+	inno->pixclock = 0;
+
+	return 0;
+}
+
+static int starfive_hdmi_phy_init(struct phy *phy)
+{
+	return 0;
+}
+
+static const struct phy_ops starfive_hdmi_phy_ops = {
+	.owner = THIS_MODULE,
+	.init = starfive_hdmi_phy_init,
+	.power_on = starfive_hdmi_phy_power_on,
+	.power_off = starfive_hdmi_phy_power_off,
+};
+
+static int starfive_hdmi_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct starfive_hdmi_phy *inno;
+	struct phy_provider *phy_provider;
+	struct regmap *mfd_regmap;
+	struct clk_init_data init = {};
+	const char *refoclk_name;
+	int ret;
+
+	inno = devm_kzalloc(dev, sizeof(*inno), GFP_KERNEL);
+	if (!inno)
+		return -ENOMEM;
+
+	inno->dev = dev;
+
+	/* Get the regmap from the MFD parent device */
+	mfd_regmap = dev_get_regmap(parent, NULL);
+	if (!mfd_regmap) {
+		dev_err(dev, "Failed to get parent regmap\n");
+		return -ENODEV;
+	}
+	inno->regmap = mfd_regmap;
+
+	/* Get the input reference clock */
+	inno->refoclk = devm_clk_get(inno->dev, "refoclk");
+	if (IS_ERR(inno->refoclk)) {
+		ret = PTR_ERR(inno->refoclk);
+		dev_err(inno->dev, "failed to get oscillator-ref clock: %d\n",
+			ret);
+		return ret;
+	}
+
+	/* We must prepare/enable refoclk here so .set_rate/.recalc_rate work */
+	ret = clk_prepare_enable(inno->refoclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable refoclk: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, inno);
+
+	/* Initialize and register the clock provider */
+	refoclk_name = __clk_get_name(inno->refoclk);
+	init.parent_names = &refoclk_name;
+	init.num_parents = 1;
+	init.flags = 0;
+	init.name = "hdmi_pclk";
+	init.ops = &starfive_hdmi_phy_clk_ops;
+
+	of_property_read_string(dev->of_node, "clock-output-names", &init.name);
+
+	inno->hw.init = &init;
+	inno->phyclk = devm_clk_register(dev, &inno->hw);
+	if (IS_ERR(inno->phyclk)) {
+		ret = PTR_ERR(inno->phyclk);
+		dev_err(dev, "Failed to register clock provider: %d\n", ret);
+		goto err_disable_refoclk;
+	}
+
+	ret = of_clk_add_provider(dev->of_node, of_clk_src_simple_get, inno->phyclk);
+	if (ret) {
+		dev_err(dev, "Failed to add clock provider: %d\n", ret);
+		goto err_disable_refoclk;
+	}
+
+	ret = clk_set_rate(inno->phyclk, 297000000);
+	if (ret) {
+		dev_err(dev, "Failed to set default rate: %d\n", ret);
+		goto err_disable_refoclk;
+	}
+
+	/* Create and register the PHY provider */
+	inno->phy = devm_phy_create(inno->dev, NULL, &starfive_hdmi_phy_ops);
+	if (IS_ERR(inno->phy)) {
+		ret = PTR_ERR(inno->phy);
+		dev_err(inno->dev, "failed to create HDMI PHY: %d\n", ret);
+		goto err_del_clk_provider;
+	}
+
+	phy_set_drvdata(inno->phy, inno);
+
+	/* Run PHY init */
+	ret = starfive_hdmi_phy_init(inno->phy);
+	if (ret)
+		goto err_del_clk_provider;
+
+	phy_provider = devm_of_phy_provider_register(inno->dev,
+						     of_phy_simple_xlate);
+	ret = PTR_ERR_OR_ZERO(phy_provider);
+	if (ret)
+		goto err_del_clk_provider;
+
+	return 0;
+
+err_del_clk_provider:
+	of_clk_del_provider(dev->of_node);
+err_disable_refoclk:
+	clk_disable_unprepare(inno->refoclk);
+	return ret;
+}
+
+static void starfive_hdmi_phy_remove(struct platform_device *pdev)
+{
+	struct starfive_hdmi_phy *inno = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_disable_unprepare(inno->refoclk);
+}
+
+static const struct of_device_id starfive_hdmi_phy_of_match[] = {
+	{ .compatible = "starfive,jh7110-inno-hdmi-phy", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_phy_of_match);
+
+static struct platform_driver starfive_hdmi_phy_driver = {
+	.probe = starfive_hdmi_phy_probe,
+	.remove = starfive_hdmi_phy_remove,
+	.driver = {
+		.name = "starfive-inno-hdmi-phy",
+		.of_match_table = starfive_hdmi_phy_of_match,
+	},
+};
+module_platform_driver(starfive_hdmi_phy_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive JH7110 Innosilicon HDMI PHY Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

