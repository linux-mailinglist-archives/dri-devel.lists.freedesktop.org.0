Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CBAF046B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 22:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DB010E60B;
	Tue,  1 Jul 2025 20:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DF110E607
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:14:59 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id ADE421F00036
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:14:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 2352EAC9694; Tue,  1 Jul 2025 20:14:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
 autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id 2C8D0AC9682;
 Tue,  1 Jul 2025 20:11:33 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/5] clk: sunxi-ng: v3s: Fix CSI SCLK clock name
Date: Tue,  1 Jul 2025 22:11:21 +0200
Message-ID: <20250701201124.812882-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
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

The CSI SCLK clock is incorrectly called CSI1 SCLK while it is used for
both the CSI0 and CSI1 interfaces and is called CSI SCLK all around the
documentation.

Fix the name in the driver, header and device-tree.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../bindings/media/allwinner,sun6i-a31-csi.yaml        |  2 +-
 .../bindings/media/allwinner,sun6i-a31-isp.yaml        |  2 +-
 .../bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml  |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                   | 10 +++++-----
 include/dt-bindings/clock/sun8i-v3s-ccu.h              |  2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index b3d6db922693..1aa5775ba2bc 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -110,7 +110,7 @@ examples:
         reg = <0x01cb4000 0x1000>;
         interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-                 <&ccu CLK_CSI1_SCLK>,
+                 <&ccu CLK_CSI_SCLK>,
                  <&ccu CLK_DRAM_CSI>;
         clock-names = "bus",
                       "mod",
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
index a61a76bb611c..3ea4a4290f23 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
@@ -79,7 +79,7 @@ examples:
         reg = <0x01cb8000 0x1000>;
         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-             <&ccu CLK_CSI1_SCLK>,
+             <&ccu CLK_CSI_SCLK>,
              <&ccu CLK_DRAM_CSI>;
         clock-names = "bus", "mod", "ram";
         resets = <&ccu RST_BUS_CSI>;
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
index 54e15ab8a7f5..627b28e94354 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
@@ -103,7 +103,7 @@ examples:
         reg = <0x01cb1000 0x1000>;
         interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&ccu CLK_BUS_CSI>,
-                 <&ccu CLK_CSI1_SCLK>;
+                 <&ccu CLK_CSI_SCLK>;
         clock-names = "bus", "mod";
         resets = <&ccu RST_BUS_CSI>;
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index f909b1d4dbca..e82cf312da25 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -652,7 +652,7 @@ csi1: camera@1cb4000 {
 			reg = <0x01cb4000 0x3000>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CSI>,
-				 <&ccu CLK_CSI1_SCLK>,
+				 <&ccu CLK_CSI_SCLK>,
 				 <&ccu CLK_DRAM_CSI>;
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 579a81bb46df..d12791b31a9d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -362,8 +362,8 @@ static const char * const csi_mclk_parents[] = { "osc24M", "pll-video",
 static SUNXI_CCU_M_WITH_MUX_GATE(csi0_mclk_clk, "csi0-mclk", csi_mclk_parents,
 				 0x130, 0, 5, 8, 3, BIT(15), 0);
 
-static const char * const csi1_sclk_parents[] = { "pll-video", "pll-isp" };
-static SUNXI_CCU_M_WITH_MUX_GATE(csi1_sclk_clk, "csi-sclk", csi1_sclk_parents,
+static const char * const csi_sclk_parents[] = { "pll-video", "pll-isp" };
+static SUNXI_CCU_M_WITH_MUX_GATE(csi_sclk_clk, "csi-sclk", csi_sclk_parents,
 				 0x134, 16, 4, 24, 3, BIT(31), 0);
 
 static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi-mclk", csi_mclk_parents,
@@ -452,7 +452,7 @@ static struct ccu_common *sun8i_v3s_ccu_clks[] = {
 	&tcon_clk.common,
 	&csi_misc_clk.common,
 	&csi0_mclk_clk.common,
-	&csi1_sclk_clk.common,
+	&csi_sclk_clk.common,
 	&csi1_mclk_clk.common,
 	&ve_clk.common,
 	&ac_dig_clk.common,
@@ -551,7 +551,7 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
 		[CLK_TCON0]		= &tcon_clk.common.hw,
 		[CLK_CSI_MISC]		= &csi_misc_clk.common.hw,
 		[CLK_CSI0_MCLK]		= &csi0_mclk_clk.common.hw,
-		[CLK_CSI1_SCLK]		= &csi1_sclk_clk.common.hw,
+		[CLK_CSI_SCLK]		= &csi_sclk_clk.common.hw,
 		[CLK_CSI1_MCLK]		= &csi1_mclk_clk.common.hw,
 		[CLK_VE]		= &ve_clk.common.hw,
 		[CLK_AC_DIG]		= &ac_dig_clk.common.hw,
@@ -633,7 +633,7 @@ static struct clk_hw_onecell_data sun8i_v3_hw_clks = {
 		[CLK_TCON0]		= &tcon_clk.common.hw,
 		[CLK_CSI_MISC]		= &csi_misc_clk.common.hw,
 		[CLK_CSI0_MCLK]		= &csi0_mclk_clk.common.hw,
-		[CLK_CSI1_SCLK]		= &csi1_sclk_clk.common.hw,
+		[CLK_CSI_SCLK]		= &csi_sclk_clk.common.hw,
 		[CLK_CSI1_MCLK]		= &csi1_mclk_clk.common.hw,
 		[CLK_VE]		= &ve_clk.common.hw,
 		[CLK_AC_DIG]		= &ac_dig_clk.common.hw,
diff --git a/include/dt-bindings/clock/sun8i-v3s-ccu.h b/include/dt-bindings/clock/sun8i-v3s-ccu.h
index 014ac6123d17..c4055629c9f9 100644
--- a/include/dt-bindings/clock/sun8i-v3s-ccu.h
+++ b/include/dt-bindings/clock/sun8i-v3s-ccu.h
@@ -96,7 +96,7 @@
 #define CLK_TCON0		64
 #define CLK_CSI_MISC		65
 #define CLK_CSI0_MCLK		66
-#define CLK_CSI1_SCLK		67
+#define CLK_CSI_SCLK		67
 #define CLK_CSI1_MCLK		68
 #define CLK_VE			69
 #define CLK_AC_DIG		70
-- 
2.49.0

