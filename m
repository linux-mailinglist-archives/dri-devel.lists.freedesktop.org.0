Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A542249C4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526446E279;
	Wed, 19 Aug 2020 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882116E233
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A69DE2312C;
 Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837584;
 bh=5GS0RTIKrmx37wIM0DKdGb8tbjBjS+1xmPyQ42ARTpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oUmVK4NgKxFDLZLTXbMVUbYYyYMhmmd9fKYXotoAni1IqcKrso/lnz0pBxXbU+Blz
 AWJXPfHQ8vmdXpyERgkVutmJoVABOKG05MseM89HcULnMVuBf+G7kmNQZ7lQkS23Nc
 n8juiXA5jxEZSHcqcpd9I63xm/IkTZCjjNwXMnyg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXt-00Euc8-K1; Wed, 19 Aug 2020 13:46:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 45/49] dts: hikey970-pinctrl.dtsi: add missing pinctrl settings
Date: Wed, 19 Aug 2020 13:46:13 +0200
Message-Id: <7e0450b87df8862852669d179eb9579b64fcf815.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 mauro.chehab@huawei.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several pinctrl settings that are missing at this
DT file.

Also, the entries are out of order.

Add the missing bits, as they'll be required by the DRM driver - and
probably by other drivers not upstreamed yet.

Reorder the entres, adding the missing bits.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../boot/dts/hisilicon/hikey970-pinctrl.dtsi  | 548 +++++++++++++++++-
 1 file changed, 537 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
index d456b0aa6f58..75723a1ad5ab 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
@@ -61,6 +61,153 @@ uart6_pmx_func: uart6_pmx_func {
 					0x060 MUX_M1 /* UART6_TXD */
 				>;
 			};
+
+			i2c3_pmx_func: i2c3_pmx_func {
+				pinctrl-single,pins = <
+					0x010 MUX_M1 /* I2C3_SCL */
+					0x014 MUX_M1 /* I2C3_SDA */
+				>;
+			};
+
+			i2c4_pmx_func: i2c4_pmx_func {
+				pinctrl-single,pins = <
+					0x03c MUX_M1 /* I2C4_SCL */
+					0x040 MUX_M1 /* I2C4_SDA */
+				>;
+			};
+
+			cam0_rst_pmx_func: cam0_rst_pmx_func {
+				pinctrl-single,pins = <
+					0x714 MUX_M0 /* CAM0_RST */
+				>;
+			};
+
+			cam1_rst_pmx_func: cam1_rst_pmx_func {
+				pinctrl-single,pins = <
+					0x048 MUX_M0 /* CAM1_RST */
+				>;
+			};
+
+			cam0_pwd_n_pmx_func: cam0_pwd_n_pmx_func {
+				pinctrl-single,pins = <
+					0x098 MUX_M0 /* CAM0_PWD_N */
+				>;
+			};
+
+			cam1_pwd_n_pmx_func: cam1_pwd_n_pmx_func {
+				pinctrl-single,pins = <
+					0x044 MUX_M0 /* CAM1_PWD_N */
+				>;
+			};
+
+			isp0_pmx_func: isp0_pmx_func {
+				pinctrl-single,pins = <
+					0x018 MUX_M1 /* ISP_CLK0 */
+					0x024 MUX_M1 /* ISP_SCL0 */
+					0x028 MUX_M1 /* ISP_SDA0 */
+				>;
+			};
+
+			isp1_pmx_func: isp1_pmx_func {
+				pinctrl-single,pins = <
+					0x01c MUX_M1 /* ISP_CLK1 */
+					0x02c MUX_M1 /* ISP_SCL1 */
+					0x030 MUX_M1 /* ISP_SDA1 */
+				>;
+			};
+		};
+
+		pmx1: pinmux@fff11000 {
+			compatible = "pinctrl-single";
+			reg = <0x0 0xfff11000 0x0 0x73c>;
+			#gpio-range-cells = <0x3>;
+			#pinctrl-cells = <1>;
+			pinctrl-single,register-width = <0x20>;
+			pinctrl-single,function-mask = <0x7>;
+			/* pin base, nr pins & gpio function */
+			pinctrl-single,gpio-range = <&range 0 46 0>;
+
+			pwr_key_pmx_func: pwr_key_pmx_func {
+				pinctrl-single,pins = <
+					0x064 MUX_M0 /* GPIO_203 */
+				>;
+			};
+
+			pd_pmx_func: pd_pmx_func{
+				pinctrl-single,pins = <
+					0x080 MUX_M0 /* GPIO_221 */
+				>;
+			};
+
+			i2s2_pmx_func: i2s2_pmx_func {
+			    pinctrl-single,pins = <
+					0x050 MUX_M1 /* I2S2_DI */
+					0x054 MUX_M1 /* I2S2_DO */
+					0x058 MUX_M1 /* I2S2_XCLK */
+					0x05c MUX_M1 /* I2S2_XFS */
+			    >;
+			};
+
+			spi0_pmx_func: spi0_pmx_func {
+				pinctrl-single,pins = <
+					0x094 MUX_M1 /* SPI0_CLK */
+					0x098 MUX_M1 /* SPI0_DI */
+					0x09c MUX_M1 /* SPI0_DO */
+					0x0a0 MUX_M1 /* SPI0_CS0_N */
+				>;
+			};
+
+			spi2_pmx_func: spi2_pmx_func {
+				pinctrl-single,pins = <
+					0x710 MUX_M1 /* SPI2_CLK */
+					0x714 MUX_M1 /* SPI2_DI */
+					0x718 MUX_M1 /* SPI2_DO */
+					0x71c MUX_M1 /* SPI2_CS0_N */
+				>;
+			};
+
+			spi3_pmx_func: spi3_pmx_func {
+				pinctrl-single,pins = <
+					0x72c MUX_M1 /* SPI3_CLK */
+					0x730 MUX_M1 /* SPI3_DI */
+					0x734 MUX_M1 /* SPI3_DO */
+					0x738 MUX_M1 /* SPI3_CS0_N */
+				>;
+			};
+
+			i2c0_pmx_func: i2c0_pmx_func {
+				pinctrl-single,pins = <
+					0x020 MUX_M1 /* I2C0_SCL */
+					0x024 MUX_M1 /* I2C0_SDA */
+				>;
+			};
+
+			i2c1_pmx_func: i2c1_pmx_func {
+				pinctrl-single,pins = <
+					0x028 MUX_M1 /* I2C1_SCL */
+					0x02c MUX_M1 /* I2C1_SDA */
+				>;
+			};
+			i2c2_pmx_func: i2c2_pmx_func {
+				pinctrl-single,pins = <
+					0x030 MUX_M1 /* I2C2_SCL */
+					0x034 MUX_M1 /* I2C2_SDA */
+				>;
+			};
+
+			pcie_clkreq_pmx_func: pcie_clkreq_pmx_func {
+				pinctrl-single,pins = <
+					0x084 MUX_M1 /* PCIE0_CLKREQ_N */
+				>;
+			};
+
+			gpio185_pmx_func: gpio185_pmx_func {
+				pinctrl-single,pins = <0x01C    0x1>;
+			};
+
+			gpio185_pmx_idle: gpio185_pmx_idle {
+				pinctrl-single,pins = <0x01C    0x0>;
+			};
 		};
 
 		pmx2: pinmux@e896c800 {
@@ -184,6 +331,108 @@ PULL_UP
 					DRIVE7_02MA DRIVE6_MASK
 				>;
 			};
+
+			i2c3_cfg_func: i2c3_cfg_func {
+				pinctrl-single,pins = <
+					0x014 0x0 /* I2C3_SCL */
+					0x018 0x0 /* I2C3_SDA */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_04MA DRIVE6_MASK
+				>;
+			};
+
+			i2c4_cfg_func: i2c4_cfg_func {
+				pinctrl-single,pins = <
+					0x040 0x0 /* I2C4_SCL */
+					0x044 0x0 /* I2C4_SDA */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_04MA DRIVE6_MASK
+				>;
+			};
+
+			cam0_rst_cfg_func: cam0_rst_cfg_func {
+				pinctrl-single,pins = <
+					0x714 0x0 /* CAM0_RST */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
+
+			cam1_rst_cfg_func: cam1_rst_cfg_func {
+				pinctrl-single,pins = <
+					0x04C 0x0 /* CAM1_RST */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
+
+			cam0_pwd_n_cfg_func: cam0_pwd_n_cfg_func {
+				pinctrl-single,pins = <
+					0x09C 0x0 /* CAM0_PWD_N */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
+
+			cam1_pwd_n_cfg_func: cam1_pwd_n_cfg_func {
+				pinctrl-single,pins = <
+					0x048 0x0 /* CAM1_PWD_N */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
+
+			isp0_cfg_func: isp0_cfg_func {
+				pinctrl-single,pins = <
+					0x01C 0x0 /* ISP_CLK0 */
+					0x028 0x0 /* ISP_SCL0 */
+					0x02C 0x0 /* ISP_SDA0 */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
+
+			isp1_cfg_func: isp1_cfg_func {
+				pinctrl-single,pins = <
+					0x020 0x0 /* ISP_CLK1 */
+					0x030 0x0 /* ISP_SCL1 */
+					0x034 0x0 /* ISP_SDA1 */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_DIS  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_04MA DRIVE6_MASK>;
+			};
 		};
 
 		pmx5: pinmux@fc182000 {
@@ -338,22 +587,299 @@ DRIVE6_MASK
 			};
 		};
 
-		pmx1: pinmux@fff11000 {
-			compatible = "pinctrl-single";
-			reg = <0x0 0xfff11000 0x0 0x73c>;
-			#gpio-range-cells = <0x3>;
-			#pinctrl-cells = <1>;
-			pinctrl-single,register-width = <0x20>;
-			pinctrl-single,function-mask = <0x7>;
-			/* pin base, nr pins & gpio function */
-			pinctrl-single,gpio-range = <&range 0 46 0>;
-		};
-
 		pmx16: pinmux@fff11800 {
 			compatible = "pinconf-single";
 			reg = <0x0 0xfff11800 0x0 0x73c>;
 			#pinctrl-cells = <1>;
 			pinctrl-single,register-width = <0x20>;
+
+			pwr_key_cfg_func: pwr_key_cfg_func {
+				pinctrl-single,pins = <
+					0x090 0x0 /* GPIO_203 */
+				>;
+				pinctrl-single,bias-pulldown  = <PULL_DIS PULL_DOWN PULL_DIS  PULL_DOWN>;
+				pinctrl-single,bias-pullup    = <PULL_UP  PULL_UP   PULL_DIS  PULL_UP>;
+				pinctrl-single,drive-strength = <DRIVE7_02MA DRIVE6_MASK>;
+			};
+
+			usb_cfg_func: usb_cfg_func {
+				pinctrl-single,pins = <
+					0x0AC 0x0 /* GPIO_221 */
+				>;
+				pinctrl-single,bias-pulldown  = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup    = <
+					PULL_UP
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_02MA DRIVE6_MASK
+				>;
+			};
+
+			spi0_cfg_func: spi0_cfg_func {
+				pinctrl-single,pins = <
+					0x0c8 0x0 /* SPI0_DI */
+					0x0cc 0x0 /* SPI0_DO */
+					0x0d0 0x0 /* SPI0_CS0_N */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_06MA DRIVE6_MASK
+				>;
+			};
+
+			spi2_cfg_func: spi2_cfg_func {
+				pinctrl-single,pins = <
+					0x714 0x0 /* SPI2_DI */
+					0x718 0x0 /* SPI2_DO */
+					0x71c 0x0 /* SPI2_CS0_N */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_06MA DRIVE6_MASK
+				>;
+			};
+
+			spi3_cfg_func: spi3_cfg_func {
+				pinctrl-single,pins = <
+					0x730 0x0 /* SPI3_DI */
+					0x734 0x0 /* SPI3_DO */
+					0x738 0x0 /* SPI3_CS0_N */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_06MA DRIVE6_MASK
+				>;
+			};
+
+			spi0_clk_cfg_func: spi0_clk_cfg_func {
+				pinctrl-single,pins = <
+					0x0c4 0x0 /* SPI0_CLK */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_10MA DRIVE6_MASK
+				>;
+			};
+
+			spi2_clk_cfg_func: spi2_clk_cfg_func {
+				pinctrl-single,pins = <
+					0x710 0x0 /* SPI2_CLK */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_10MA DRIVE6_MASK
+				>;
+			};
+
+			spi3_clk_cfg_func: spi3_clk_cfg_func {
+				pinctrl-single,pins = <
+					0x72c 0x0 /* SPI3_CLK */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_10MA DRIVE6_MASK
+				>;
+			};
+
+			i2c0_cfg_func: i2c0_cfg_func {
+				pinctrl-single,pins = <
+					0x04c 0x0 /* I2C0_SCL */
+					0x050 0x0 /* I2C0_SDA */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_04MA DRIVE6_MASK
+				>;
+			};
+
+			i2c1_cfg_func: i2c1_cfg_func {
+				pinctrl-single,pins = <
+					0x054 0x0 /* I2C1_SCL */
+					0x058 0x0 /* I2C1_SDA */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_04MA DRIVE6_MASK
+				>;
+			};
+
+			i2c2_cfg_func: i2c2_cfg_func {
+				pinctrl-single,pins = <
+					0x05c 0x0 /* I2C2_SCL */
+					0x060 0x0 /* I2C2_SDA */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_04MA DRIVE6_MASK
+				>;
+			};
+
+			pcie_clkreq_cfg_func: pcie_clkreq_cfg_func {
+				pinctrl-single,pins = <
+					0x0b0 0x0
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_06MA DRIVE6_MASK
+				>;
+			};
+			i2s2_cfg_func: i2s2_cfg_func {
+				pinctrl-single,pins = <
+					0x07c 0x0 /* I2S2_DI */
+					0x080 0x0 /* I2S2_DO */
+					0x084 0x0 /* I2S2_XCLK */
+					0x088 0x0 /* I2S2_XFS */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_UP
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE7_02MA DRIVE6_MASK
+				>;
+			};
+
+			gpio185_cfg_func: gpio185_cfg_func {
+				pinctrl-single,pins = <0x048  0>;
+				pinctrl-single,bias-pulldown = <0 2 0 2>;
+				pinctrl-single,bias-pullup = <0 1 0 1>;
+				pinctrl-single,drive-strength = <0x00 0x70>;
+				pinctrl-single,slew-rate = <0x0 0x80>;
+			};
+
+			gpio185_cfg_idle: gpio185_cfg_idle {
+				pinctrl-single,pins = <0x048  0>;
+				pinctrl-single,bias-pulldown = <2 2 0 2>;
+				pinctrl-single,bias-pullup = <0 1 0 1>;
+				pinctrl-single,drive-strength = <0x00 0x70>;
+				pinctrl-single,slew-rate = <0x0 0x80>;
+			};
 		};
 	};
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
