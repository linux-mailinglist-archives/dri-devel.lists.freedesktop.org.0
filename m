Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6D8CD2B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761EA10E570;
	Thu, 23 May 2024 12:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2FEJCVs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6307110E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-354de97586cso2215815f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468587; x=1717073387;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oycOZ7tNpDXuadcC0Px0ysSti2axPPJ+EdThdDwGHQA=;
 b=2FEJCVs8bUXmv5QdML/zcv8BjrNcYyjnh7BHZF5XpjSS80rFDmPHdRNJ+a3J+UIS7q
 pFxHDhFIBCb2ZFLGJSVfAHq5psQ/KCodAqWfs5cuMEoeWUNBO53PWtwNzfq79YuBoJ5Y
 4/0gtLjB9kW2GPbLF3ir3CsmAw6fUdimZNnPC9G+tpgVWSUGr4o7tJQoA9xKACmoeztH
 loOkq1kya0Qg+qTPWL2Iovk1utn6XpwfNGomT0XLhHqdKR69+RcDB1cOhVmREs3KFz/D
 wpxW9xtgm3C/siq9+NWvZu729qSqqopAdkHuIIz4ifULluyqQ2LAeV+2FXqVg6yPx0V8
 6Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468587; x=1717073387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oycOZ7tNpDXuadcC0Px0ysSti2axPPJ+EdThdDwGHQA=;
 b=o9z50vcG7EIpoziJ39/CZotaCM+y+S+V/36GYjMcQzbsbxfyj2drsriFg7Go4cbpRk
 2yT5DdCyJEUHGz54pNMjYjzknp2riSbKhQtZBI6PhYtJJGx9JpfLBpujpB/hkPG0sXkz
 VHccPHTvzoVCXS/7SFXD74qnld9k01/fz6IkTcY/Avc84/IDna6Wr9Wh2jVD70JPOdyK
 O7/QuNHIwqdfAfk/yk87hDH+FPTtHeKYXKtGwbf2gHTvEMQ6zNfR4bw1B32vkTXr1nxm
 v9kzK2FAFcCC6INvlEnnSb7xzyKm2L7EUpPZNWoJgb9IQLR7ThnLkVznUCvkGP90J+nU
 5QnQ==
X-Gm-Message-State: AOJu0Yzp+8YBOSPYGoO//kJU1HB6UiMqUgErAojpE3plgSebrg0/yc/r
 doR4ZkR5BzUau3wvhgbjEUu+g7XkU6+QHmzy0uKR3TSRqS2itybVMnj4Nfu/eO4=
X-Google-Smtp-Source: AGHT+IEZBKw4aRDaUfqIZ3HhxIEs0XVj22IR3fb3hJtSwVaakG3EHrDMERpceHbfsvVhrvnaHwM2Yw==
X-Received: by 2002:a5d:6e0e:0:b0:34a:e884:977b with SMTP id
 ffacd0b85a97d-354d8cde868mr3706774f8f.32.1716468586704; 
 Thu, 23 May 2024 05:49:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:28 +0200
Subject: [PATCH v4 15/15] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-15-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7338; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=Miid+XRLrzyZJ6tHRL1QimqZm1BYrPtI1n+pX0IpuHI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztT5vXYcQ4OqH46y/UQ4yMaKGBks0Vn1gzo0f3u
 /sBJobuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURfz8EA
 CxQ2SYZy/golUmlaRHjwXobDoreqHuQxY/59fsMFVIAOlaebtWs6zAjZpasYJyvBXdqsk1zztecnPD
 P9813ZmEpeETVyb4TR1JBjpkRbZSDIMJZrps3Fcy6jpFo8Lu7zsUj6OcYB2BmVdCDqYJ6IP4Bx+7tJ
 h2JhhyhIMoSOh+8Sonm6NrQ67pYCXox3ygX5hV1lOUSk7+hlOkQqydg0BWXf8aoVIbiszauu8dUMMc
 uKe/F/TbNeE5QXy8+ZjDO1QZlMXuKFi+b2cnO0Pl60UtxSAiddfCDPcTLWuTB5I6E/vSRF+aCcjlAw
 IGQ0wPZ17t52s1YfUtg+KDFE4yX7CwUCKBtMY9VQn1WcLPBq4L1381kJP1hWx4FG/ozo8XpfaAGb+9
 SvRST6gL9JnVcbqDCltfVsXOyQcPATDLLFAY8z0FNxnyZ8NY5CHwBlPPBait+4UlkKP90skXAkjK28
 DFtDBR/EJNkEvMI8KjxQI2z7xV2WFKSprHVODt8wNKXz2HeGxzG54Po1XMvMP2IZLL1uzGAhtbiLKr
 epOx0DoRGs5+Q8VTk5P124G7PTSogLkHwyWsLMspSkc6lwwXR+6M6ltAvqHV6URtIuukdqQghyQdOw
 aNcKNiib+aSHhqDIGIqJMienVEgncy7DwaSFG2+r8zV+zbbHi4kT9WmV2BhA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 236 ++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..6e972e2c1586 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -26,6 +26,21 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_connector_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -86,6 +101,15 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
 };
 
 &cpu0 {
@@ -108,6 +132,89 @@ &cpu3 {
 	sram-supply = <&mt6357_vsram_proc_reg>;
 };
 
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dpi0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rdma1_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dpi0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&it66121_in>;
+			};
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			panel_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dsi0_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dsi0_out: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";
@@ -138,6 +245,56 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		#sound-dai-cells = <0>;
+		compatible = "ite,it66121";
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reg = <0x4c>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				it66121_in: endpoint@0 {
+					reg = <0>;
+					bus-width = <12>;
+					remote-endpoint = <&dpi0_out>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				hdmi_connector_out: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -180,7 +337,55 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -222,6 +427,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
@@ -377,6 +609,10 @@ &pwm {
 	status = "okay";
 };
 
+&rdma1_out {
+	remote-endpoint = <&dpi0_in>;
+};
+
 &ssusb {
 	dr_mode = "otg";
 	maximum-speed = "high-speed";

-- 
2.25.1

