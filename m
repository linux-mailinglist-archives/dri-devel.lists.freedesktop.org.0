Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2D896704
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6C1126FC;
	Wed,  3 Apr 2024 07:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="av6m4S5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FCD1126FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:46:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4156c4fe401so15448365e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712130407; x=1712735207; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
 b=av6m4S5dCum6TC4r+PRW76YMxH437eZf2E6ZOqp6pJR07NlKtOhCvMi+wD7Rl/cX5P
 +EzDUkCdxC0F6NWemx3H3t6eYvn7NK7R5vaU2cDYb2z/9lsUep6an923xy3aHgavpJzj
 tjkNntvUD+3L2QzqL2U5rbH2fyS2oS9fQKbOmXkGqJ1E97QC8bOjJpHw+y4uqcPipvc+
 UXNfYuqR+1jLpD2ldrS/bAzDGT63SnXoUONv3u+DIJV4re7GBzVVbJfpxe4lttlS1U39
 b869O20iVmCFDYPao5odSENJMbUiClnDdEwKPgswyWjs2KD+fb+7tn6q2Yj5NPGEUwyU
 6ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712130407; x=1712735207;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
 b=dX9X/rc0WeLmZK4gG1Bg6Dho0b2w/HGG3/mBHSTRwSrNGTi8YlU1TAfxNySfNDpt4b
 sbLtyPyHg+edDX7X/cZLHokP1cvw21zbynv7rrD1xlwnVs3waOI46yWDdvhG7gtENv1a
 mEko7O0JO3HNqmw0MCc/H6jUi+POJhYqAZ5t+pP6WdoyXgiNPHajikyi/PqIUqhdNCiv
 Hdq9GMhCdhZ+1yocX9vmOuXYdrgjnjC+vPa7zksCFH2hxydDp2ChRy4rsbiy4v3+Kya6
 cnJz2+tFfbXDv6BSvteWP9PqAsGFViKoPUTPXZkhV1ivNiHv7FDw/iz4iB+nl36TystO
 ElIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6DQvR7s3W6W4+sPukyzO8xVzBRFQi1GrDZzUMOSsmw6Od1Q4pojpEd1PLjEtyFIi58aVTXwwsgG74xrYRZm1WmhVLDEHxyTErgIIldLZ0
X-Gm-Message-State: AOJu0Yz2XEixSwymCqjAR7LFmDzN8ez7SK6IK7H0DNe1frsvMqBi2zF+
 RnCVmLi1M4PLX4edbzf/L6BlyyzKZeEBOG7JXsUu7SbYDu48Vxy6tN3GGE6QmoI=
X-Google-Smtp-Source: AGHT+IGjU+lZi926IGYs70wrtPeJ0AhqDJygL7VcXx4pKvMiavGn02G8DNEATWdaZ39B2zUBl42zVw==
X-Received: by 2002:a5d:4ac6:0:b0:343:9884:2fe1 with SMTP id
 y6-20020a5d4ac6000000b0034398842fe1mr531968wrs.68.1712130407112; 
 Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 00:46:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:36 +0200
Subject: [PATCH v12 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-5-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQleCJepZTdvsH5P04FFdj5scoQuo3RrkBu/7LtR
 ovFVFJKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXgAKCRB33NvayMhJ0awCD/
 4lGsqK7ZBrrsYwndwe68AzeslZJrfHIBwgArd/EZLEm4uE0Mimp8KnfGmCjHpv2dh53lDPDO4OyUXW
 TyjZKDngAKfl3cik04pPAisgFPXN1rt4snRJjOwmP6Qdrw00FM3DMJF56wcmsSarNKGCJuP5zEaxrx
 WTxsLsw39sem9jlgmn9lQP3NBr894+saWYaNnihjRjbD28uTZV63ixGtqRZAX0Uv+dr0G60tvufHXx
 aM+lm6S6v/T89y5euV7BUzGniPrwT3gbjnKvtTIZqJDC/V/wdJ2mb+SfXY0M4w5qgjduBycvJGoGVH
 DVEhJrncCQ1+d8MWAg41VRTzaLGhgfAu1bzWlrOTnP6LWtGAOUVGAWv/da/PYg1HvgvFWQBUPfCHsz
 5aGscOZ8fAPd9DbkEdpW/Hzh2o1TZ3lBJtD/8q0I1TWwEar+co7t25cHPCrcwK1+UoKTaKGwXzbZ7L
 a87Eosy6L3qVChDGjEc5phAj+kTuVae4lVMjJIQiqAZvZsu+6uTZWY49N6g+jYg5n/Z/OsYnNHH5Qy
 oIM/jTwrHykmI9Ay1BR4RRMyk8yciDWmwpwiQxhuaEyRgBXlLkB3C218gFvjV+38kwRb0e81xonfox
 Vl/6+llHRMSy5eR48w4NWI9EDM96hxPfPJyDqbo17HxPpInbEPQUiLqFfLXQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9d5eab6595d0..b058ed78faf0 100644
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

