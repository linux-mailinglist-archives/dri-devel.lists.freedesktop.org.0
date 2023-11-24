Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1019D7F6E9E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28F10E7B0;
	Fri, 24 Nov 2023 08:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3A10E7B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so12035675e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815297; x=1701420097; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=kIkRqttYo3yqmtaeU8lHgf3I6H998oMtnPzYtJlhfmX5sYsSozckmOB8MT2QVYoSuq
 zptQ6+41sxtF0vV4AtI0Xr9l2NzxP/R8j3hXICaI5SLDPDOD/g9G9f/Kc1R8a4VJ+IRY
 d5/adcjk3MzzUtaLrCJ1WgVgoXBJwRIo3Z4lzQar/SQwlJ1eBEDRSO10QWkcGyQ+815R
 0ibgbG+bk9s6z3A/0PvJS5o8mUR7UT7bGgd3FpeNN/EXkboVK9aLtNkAblAZpgAwN03A
 o+EqfdjVrinDLNKAzYiWDFcClIbbqlMCtG1RGsrR/vnLP/Z6Mi7r3g+eEWiV1qi+nUnB
 8Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815297; x=1701420097;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=FoYWXxGTRiuSF8MTE658Adw5f/jP4LNXS7pVdhIIYlVM8ghaeaA8StyeWU81S6IzWw
 5Cvl0x3Y2jCCnIImqjnlS8btkRZwvQYZLA66Ue+vi2dxo6SwYx/6FFH6zrIfffDNhLZY
 MCIoYm3In02w9jtKjMAsdMfqkOasY6mvFpciTLS8sFstE5B4kCgkuweQ32msDLbie8bA
 ZFWnAilk2PgS0FM4OGWGQy3eObSzX/wia/EeRYbaAWT9bILDABrQ1YfrJxCamMeC/KyO
 N8QLQM0jzdlwLOvhSIeFXHE/eGxxviGsvLAX6X2/vJ1FCl6gv5q7tqu9yzzU10G1HRS5
 L9Pg==
X-Gm-Message-State: AOJu0Ywtz6NjEkDFd2xjzGa+9LWI31W0y0aTSCRQIZy6ig9M+LxAgmgV
 oBBaKewLUQq8tpJB/K/HXPTeQg==
X-Google-Smtp-Source: AGHT+IE2UZwrK/cWwh2rBEoUeFF98uKEtaA7VGpaEvV3hUAbSjxLyp4wCEN5Kmi6LYzxAyXCY0lmQg==
X-Received: by 2002:adf:fa85:0:b0:332:e650:dad8 with SMTP id
 h5-20020adffa85000000b00332e650dad8mr1476988wrr.17.1700815297315; 
 Fri, 24 Nov 2023 00:41:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:21 +0100
Subject: [PATCH v9 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-10-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGxXEnizWSf7+B7ZodjJhE2lCrlnGpyxQU6g8T2
 sVrEwh2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsQAKCRB33NvayMhJ0bhED/
 95+sFAipBUxjMeFLlGpWzaX+aaME314YyQy85iWqpiZSfTzIyk921PAf5/nQNjVMjWaMT9bcFyVmnC
 FYUT74aRBf8tx27OxN3+m40y2pVnIpPWDTcF0ekBk2Ii6SREBBVj0MXbgnlstPlamiGjK3CIUu0OU1
 FbuFRZazTjVe5x5FSc4h7zk6FwjemlqYl65SqHSCtdbCfOS1+vPHsb1pcSsKrWU59gbAw/5LivKxJ+
 NBv2BGqC3Em8uWoN6/XTIh+z3ToLktXvqE++ydJMjDTrdkxu1arhSfw32ZjafCMpCtCSwIl7WihPcX
 UxZj3JVxYfyrkgbVsYqnABrWZ/ixlYXKD6hCdBKZJFBs+GhGRnFZ/x3hMih6VUoovnrJTXZDzgCA+n
 /ru3vSAjKq2HXFlNWPAKZzGzBtkNUX5zwnBrO61/4s8Sy4lKNSX9rueZnAvNPRjL8BwhBtnvcG6Tvf
 2z2zzTC1oAFh1O4ZCe1Eut/J+I8JWsKg7UWdpavDsIz1tM4sTf76AQ/WLFze1cXHTr0lqhm8loXERC
 tdYnAsXCiHj5km2w7X+fj7Gg70xdzOe6zjiwdeBaSXvycF22X3dZvbD2l0HU+8fj3tTpORggJCNps4
 S4ASkJk+fCkHLMPIvP+zfyVCVk4d+lIdiJq21ZrA4X7InDu6EXUEvM+am9zQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..7300408262d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1663,9 +1663,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2152,6 +2171,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2189,6 +2217,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit", "px";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1

