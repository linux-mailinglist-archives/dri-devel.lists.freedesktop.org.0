Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FC6597B2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330E810E1E0;
	Fri, 30 Dec 2022 11:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141310E1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672399946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4EOTaScDiWLOjXXokoUDPMj1ubuks55AAvOUz+Vx7M=;
 b=MQ/AWFJulqeiMCXqt8Rntl9/bVSZ/uDuWmjE7SDIghg25FfkEeAk411OINlHnXtaXL1npv
 24sX+xJJD/PZjz0Ymadzf4UjO9JNpz8k0u6f6hAa//Q4kvBChCP0aUaonZvMQg/oFsz/AT
 yAzpnNNyI430CoGfUMB/CqE+fyzu+pk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-f-2ijIEmOr2Vhei9tuB3RA-1; Fri, 30 Dec 2022 06:32:24 -0500
X-MC-Unique: f-2ijIEmOr2Vhei9tuB3RA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so9137359wms.7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 03:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4EOTaScDiWLOjXXokoUDPMj1ubuks55AAvOUz+Vx7M=;
 b=Jc7mhdjn5FSf0u2XjqoFnvu5H15mmW1c2DldgJwScpGDZitBCYgdCmI8UhW1QYU09m
 7V/VTvcplGnrw0oALIJKVW9HnTzALWxcPHvy2VbPaMfcVXrtJ3iOVpGL+lmTJfiCKx2Y
 8la8CT61EWLVq/m8K55n/1uluepFCHUevAw2mBhp2PwBFPOTHDLT06c42PiMFFvsT2D4
 C/0Bp/Ss+uEKSe5wwca8XjkZ8TzkLzJPpODqtZKGF54pVONPvLnDomxdf3LyERzqqV4v
 6t1jpZPfzeW+ZvrFugr96nMqs1HwOK8/yhAaOQifh2u0tYrjaqa0AyHu/MFlX/jGuk/f
 IIhw==
X-Gm-Message-State: AFqh2komQwIzr3Sa1F+xH7N6mD8nf2XxRyKqLU3jhGruB12AF/iUpOE6
 BG3j+WimniQxqDyHmNYPVTIY+yVcz+5+oYx0Z8uoH3aEvNusjWcrKJNzonf7eefNFfKDU82XJ5W
 vt9pckZAv1IXrPxCVUQB6m/QzANkx
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id
 k13-20020a05600c0b4d00b003d349db0d84mr21984092wmr.20.1672399943521; 
 Fri, 30 Dec 2022 03:32:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszsZjoNFeeeWYKKgDciXJIvKKmm+zGF6f73kyyeBdYo9aUbjRSrQkAKNWWoxHRxaiR62Fjaw==
X-Received: by 2002:a05:600c:b4d:b0:3d3:49db:d84 with SMTP id
 k13-20020a05600c0b4d00b003d349db0d84mr21984072wmr.20.1672399943254; 
 Fri, 30 Dec 2022 03:32:23 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm27638432wma.27.2022.12.30.03.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 03:32:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: rk3399-pinephone-pro: Add internal display
 support
Date: Fri, 30 Dec 2022 12:31:54 +0100
Message-Id: <20221230113155.3430142-5-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113155.3430142-1-javierm@redhat.com>
References: <20221230113155.3430142-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 linux-rockchip@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ondrej Jirman <megi@xff.cz>

The phone's display is using Hannstar LCD panel, and Goodix based
touchscreen. Support it.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
---

Changes in v4:
- Add Tom Fitzhenry's Tested-by tag.
- Keep the DTS nodes sorted alphabetically (Tom Fitzhenry).

Changes in v2:
- Fix regulator node names (Maya Matuszczyk).
- Drop non-existent "poweroff-in-suspend" property (Maya Matuszczyk).
- Remove unnecessary comments in panel node (Maya Matuszczyk).

 .../dts/rockchip/rk3399-pinephone-pro.dts     | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04403a76238b..0d48fbc5dbe4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -25,6 +25,12 @@ aliases {
 		mmc2 = &sdhci;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 1000000 0>;
+		pwm-delay-us = <10000>;
+	};
+
 	chosen {
 		stdout-path = "serial2:115200n8";
 	};
@@ -82,6 +88,32 @@ vcc1v8_codec: vcc1v8-codec-regulator {
 		vin-supply = <&vcc3v3_sys>;
 	};
 
+	/* MIPI DSI panel 1.8v supply */
+	vcc1v8_lcd: vcc1v8-lcd-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		regulator-name = "vcc1v8_lcd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc3v3_sys>;
+		gpio = <&gpio3 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&display_pwren1>;
+	};
+
+	/* MIPI DSI panel 2.8v supply */
+	vcc2v8_lcd: vcc2v8-lcd-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		regulator-name = "vcc2v8_lcd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc3v3_sys>;
+		gpio = <&gpio3 RK_PA1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&display_pwren>;
+	};
+
 	wifi_pwrseq: sdio-wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&rk818 1>;
@@ -132,6 +164,11 @@ &emmc_phy {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-rising-time-ns = <168>;
@@ -214,6 +251,9 @@ vcc3v0_touch: LDO_REG2 {
 				regulator-name = "vcc3v0_touch";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			vcca1v8_codec: LDO_REG3 {
@@ -347,6 +387,25 @@ opp07 {
 	};
 };
 
+&i2c3 {
+	i2c-scl-rising-time-ns = <450>;
+	i2c-scl-falling-time-ns = <15>;
+	status = "okay";
+
+	touchscreen@14 {
+		compatible = "goodix,gt917s";
+		reg = <0x14>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PB5 IRQ_TYPE_EDGE_RISING>;
+		irq-gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&vcc3v0_touch>;
+		VDDIO-supply = <&vcc3v0_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1440>;
+	};
+};
+
 &io_domains {
 	bt656-supply = <&vcc1v8_dvp>;
 	audio-supply = <&vcca1v8_codec>;
@@ -355,6 +414,40 @@ &io_domains {
 	status = "okay";
 };
 
+&mipi_dsi {
+	status = "okay";
+	clock-master;
+
+	ports {
+		mipi_out: port@1 {
+			#address-cells = <0>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+
+	panel@0 {
+		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
+		reg = <0>;
+		backlight = <&backlight>;
+		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc2v8_lcd>;
+		iovcc-supply = <&vcc1v8_lcd>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&display_rst_l>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
 &pmu_io_domains {
 	pmu1830-supply = <&vcc_1v8>;
 	status = "okay";
@@ -367,6 +460,20 @@ pwrbtn_pin: pwrbtn-pin {
 		};
 	};
 
+	dsi {
+		display_rst_l: display-rst-l {
+			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		display_pwren: display-pwren {
+			rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		display_pwren1: display-pwren1 {
+			rockchip,pins = <3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -408,6 +515,10 @@ bt_reset_pin: bt-reset-pin {
 	};
 };
 
+&pwm0 {
+	status = "okay";
+};
+
 &sdio0 {
 	bus-width = <4>;
 	cap-sd-highspeed;
@@ -472,3 +583,15 @@ bluetooth {
 &uart2 {
 	status = "okay";
 };
+
+&vopb {
+	status = "okay";
+	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,
+			  <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
+	assigned-clock-rates = <0>, <0>, <400000000>, <100000000>;
+	assigned-clock-parents = <&cru PLL_CPLL>, <&cru DCLK_VOP0_FRAC>;
+};
+
+&vopb_mmu {
+	status = "okay";
+};
-- 
2.38.1

