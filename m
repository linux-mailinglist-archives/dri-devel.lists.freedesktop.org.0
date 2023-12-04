Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F08032C3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952710E1C1;
	Mon,  4 Dec 2023 12:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2710E1C3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:33:21 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id AB67124E24C;
 Mon,  4 Dec 2023 20:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: [v3 2/6] riscv: dts: starfive: jh7110: display subsystem
Date: Mon, 4 Dec 2023 20:33:11 +0800
Message-ID: <20231204123315.28456-3-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de,
 paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com,
 jack.zhu@starfivetech.com, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dc controller and hdmi node for the Starfive JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 134 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  49 +++++++
 2 files changed, 183 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index b89e9791efa7..6e387e0138c0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -35,6 +35,25 @@ memory@40000000 {
 		reg =3D <0x0 0x40000000 0x1 0x0>;
 	};
=20
+	reserved-memory {
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		/* vout applies for space from this CMA
+		 * Without this CMA reservation,
+		 * vout may not work properly.
+		 */
+		linux,cma {
+			compatible =3D "shared-dma-pool";
+			reusable;
+			size =3D <0x0 0x20000000>;
+			alignment =3D <0x0 0x1000>;
+			alloc-ranges =3D <0x0 0x70000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible =3D "gpio-restart";
 		gpios =3D <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -69,6 +88,68 @@ codec {
 	};
 };
=20
+&dc8200 {
+	status =3D "okay";
+
+	crtc_out: ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		dc_out0: port@0 {
+			reg =3D <0>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			dc_out_dpi0: endpoint@0 {
+				reg =3D <0>;
+				remote-endpoint =3D <&hdmi_enc>;
+			};
+
+		};
+
+		dc_out1: port@1 {
+			reg =3D <1>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			dc_out_dpi1: endpoint@1 {
+				reg =3D <1>;
+				remote-endpoint =3D <&dsi_enc>;
+			};
+
+		};
+	};
+};
+
+&display {
+	status =3D "okay";
+	ports =3D <&crtc_out>;
+};
+
+&dsi_encoder {
+	status =3D "okay";
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		/* input */
+		enc_in: port@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+			dsi_enc:endpoint@0 {
+				reg =3D <0>;
+				remote-endpoint =3D <&dc_out_dpi1>;
+			};
+		};
+		/* output */
+		enc_out: port@1 {
+			reg =3D <1>;
+			/*need add a remote-endpoint to dsi bridge*/
+		};
+	};
+};
+
 &dvp_clk {
 	clock-frequency =3D <74250000>;
 };
@@ -89,6 +170,21 @@ &gmac1_rmii_refin {
 	clock-frequency =3D <50000000>;
 };
=20
+&hdmi {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&hdmi_pins>;
+
+	hdmi_in: port {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		hdmi_enc: endpoint@0 {
+			reg =3D <0>;
+			remote-endpoint =3D <&dc_out_dpi0>;
+		};
+	};
+};
+
 &hdmitx0_pixelclk {
 	clock-frequency =3D <297000000>;
 };
@@ -336,6 +432,40 @@ spi_dev0: spi@0 {
 };
=20
 &sysgpio {
+	hdmi_pins: hdmi-0 {
+		hdmi-cec-pins {
+			pinmux =3D <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
+					     GPOEN_SYS_HDMI_CEC_SDA,
+					     GPI_SYS_HDMI_CEC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-hpd-pins {
+			pinmux =3D <GPIOMUX(15, GPOUT_HIGH,
+					     GPOEN_ENABLE,
+					     GPI_SYS_HDMI_HPD)>;
+			input-enable;
+			bias-disable; /* external pull-up */
+		};
+
+		hdmi-scl-pins {
+			pinmux =3D <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
+					     GPOEN_SYS_HDMI_DDC_SCL,
+					     GPI_SYS_HDMI_DDC_SCL)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-sda-pins {
+			pinmux =3D <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
+					     GPOEN_SYS_HDMI_DDC_SDA,
+					     GPI_SYS_HDMI_DDC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux =3D <GPIOMUX(57, GPOUT_LOW,
@@ -642,3 +772,7 @@ &U74_3 {
 &U74_4 {
 	cpu-supply =3D <&vdd_cpu>;
 };
+
+&voutcrg {
+	status =3D "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index 45213cdf50dc..df51b9407328 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -344,6 +344,24 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells =3D <0>;
 	};
=20
+	display: display-subsystem {
+		compatible =3D "starfive,display-subsystem";
+
+		clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+			<&voutcrg JH7110_VOUTCLK_DC8200_AHB>;
+		clock-names =3D "noc_bus", "dc_core", "axi_core", "ahb";
+		resets =3D <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+			 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
+			 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
+		reset-names =3D "axi","ahb", "core";
+	};
+
+	dsi_encoder: dsi_encoder {
+		compatible =3D "starfive,dsi-encoder";
+		starfive,syscon =3D <&vout_syscon 0x8 0x08>;
+	};
 	soc {
 		compatible =3D "simple-bus";
 		interrupt-parent =3D <&plic>;
@@ -1121,6 +1139,37 @@ ispcrg: clock-controller@19810000 {
 			power-domains =3D <&pwrc JH7110_PD_ISP>;
 		};
=20
+		dc8200: lcd-controller@29400000 {
+			compatible =3D "starfive,jh7110-dc8200";
+			reg =3D <0x0 0x29400000 0x0 0x100>,
+			      <0x0 0x29400800 0x0 0x2000>;
+			interrupts =3D <95>;
+			clocks =3D <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
+				<&hdmitx0_pixelclk>,
+				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
+			clock-names =3D "channel0", "channel1",
+				      "hdmi_tx", "dc_parent";
+		};
+
+		hdmi: hdmi@29590000 {
+			compatible =3D "starfive,jh7110-inno-hdmi";
+			reg =3D <0x0 0x29590000 0x0 0x4000>;
+			interrupts =3D <99>;
+
+			clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>;
+			clock-names =3D "sysclk", "mclk", "bclk";
+			resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+			#sound-dai-cells =3D <0>;
+		};
+
+		vout_syscon: syscon@295b0000 {
+			compatible =3D "starfive,jh7110-vout-syscon", "syscon";
+			reg =3D <0 0x295b0000 0 0x90>;
+		};
+
 		voutcrg: clock-controller@295c0000 {
 			compatible =3D "starfive,jh7110-voutcrg";
 			reg =3D <0x0 0x295c0000 0x0 0x10000>;
--=20
2.34.1

