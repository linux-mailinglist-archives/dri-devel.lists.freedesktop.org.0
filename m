Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2D889C11
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9835E10E78A;
	Mon, 25 Mar 2024 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TnaPFplT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF1910E790
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:10:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so5226310a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711365000; x=1711969800; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
 b=TnaPFplTa0bbEgrrx+iUa61i1ArqdjENDh+ijfAv8XwolSros3JkZH+j23R0uPA0pD
 eX4CNOrLG8MxUxI9QAm1ilm12cfczMEf+NLF/LDCGVDTII36q9pHpl2F5LfKxhxaE6Eq
 rvW78cZL79YUXPkXbPrq8tcfZakzqBea1JsdE/sZeOKUiAtHFQ8k4etVXqZA9FgjxfKA
 P9sf3v29tv6sCdgebCcKsAgX1s9tX0++bStE15ryYKz+Shqsg87u2vXRm5pJlo0gcLza
 Utxdj7DVVkyVA8a357KnvXW3dFlbspWLYeT35rSmD9OvKLzXlc8fHE7dSA4Xzrb5+eyY
 wSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711365000; x=1711969800;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
 b=AvogsRMjayNxwTNx6SPFedcoc7bszQYB32vqyMvwcbE0OgoZVcrKtrCTPvylEdRxd+
 4s2pfU8hjm4dgZB0MUIp2C0zWa9oeNG8FtsZLTipJC3keVJT5YBuVhYCUDQnAUOKyKPK
 zNdnPPeeBEU39pCp9hbZEcKZKg8Vyr5Nn67xaCJRKvngPeRfYB7xfedaY88HhH4kSa1d
 ulyMk4Lsm21DZINxYANu0h1TphHIgxmvfloeRbyRqep0zDaIc5v4EQkdGCVQCJHtT1wa
 qwYqTb78COoKDo2kdRv/HeTfoVhbZ+3u0hOy+tBOA3c86kvi8G4DwJCPm2/O3k7UTyJU
 g1Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkg9jgiot7yOb6yUvunc/yZyR1Yl5d51bo/7Pz/pj9PtpVg+0TjdUVapWu8YpdbhFGmfCyFk0GXgPCUFpjZnvmRaPH39RxQV1FXxiY9Ekp
X-Gm-Message-State: AOJu0YyTfQAWGGpQSIJTpCCZwaXkoQahlUbSs0Bhb4FMBuLpear+y7g8
 V/PndvzRkVUk7WkEVQlRRHEq3yh2BqB9xAHQw7slgqG1Rgl0cFQKJkyl3BDb6Rk=
X-Google-Smtp-Source: AGHT+IGJCn/q3TzZQ/sfcU2QtBH0NrHSyetkQMtYJg1jSoVYaJ2sk3brXJ7gWcgR4ptjTbLqURKNtA==
X-Received: by 2002:a17:906:f90e:b0:a46:ed93:b37d with SMTP id
 lc14-20020a170906f90e00b00a46ed93b37dmr5205109ejb.9.1711364999833; 
 Mon, 25 Mar 2024 04:09:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:09:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:51 +0100
Subject: [PATCH v11 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-5-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt+AlXm33R5US/QFy5tRjSgAFV3tRQPAr8s2ioG
 3r1mCYKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfgAKCRB33NvayMhJ0fqVEA
 DH4KjqxSXHBDe7fYDf4/7JFLNdGDuPCsrGV30L6WP29u1xPXx8RA16knTkwN4NjPDRJ7/hg9qx3gHj
 rAHFrPJZuJcJZP6ZFbQAVCyzxNDYxuoe9+2mp2kngm0mDdnzQiXGP2ND86E/EZoF48VaCTt1/GwENF
 V2/7WLfRENSQ5o+Fp/q6089QO2AqoS7OGeU8SqcrobaXx9f7uu+VbnI/nIS6NyRm6pCrVxSNUaDPTY
 DJXZyAnlpu3Kb44ko4Fd4ZxsGbBB5T1TlyzPU4hFTQwa9NDLOdHd0aHb278cZwd0m5myV123oslk9C
 0J2psO2GAxjDPRskOMVwc3mipCd6ccF4yPcavOOcnvaaxMl+K6gBEq5eGxhsC0CZYlefg36wCdgV04
 GYwMz94q7tZd+RPZsCQK7fYf301VwJwD5lR9bADXDDPARtsMfpH/BLbzw6Ti0sacRM0wxDCKKD5Yyc
 oAEXYjwKXFngzmbzRuMa5fILyfs8WfInzlIc5M1JqTP0kw+9bswadgDwAhho1aKfiqiyD4i3NoZCe4
 571PHO31eYCO3vnMj0j91ulFccBgMnF7KpoqgWcWv2eXuI/A7k5S8fw8KlLEjdsvRQxmQfEDKRMTc9
 00zlIr0LGVr+p7/lMJdNonubsZKEl3aTO3xCSlN/9AVGB+T4YJfXrWsy04Pg==
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

