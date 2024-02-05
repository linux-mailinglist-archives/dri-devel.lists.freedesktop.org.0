Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346784A179
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC2E10FB1B;
	Mon,  5 Feb 2024 17:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W2sehIFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E3C10FAE0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:55:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40fdc500db5so7918785e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707155742; x=1707760542; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=W2sehIFL/CD3DunfixmVJsj2AeUvn0FfQugIsXIm7zUO2+ISzAfH2aAVeBJJEYyn7A
 31Qtqw4/45UMBGTJY0gPKKuOrFSSV/tPr6/GuXJHZr48M/bc8H+m9ESvTDVDmS5cHCaT
 ttotFOoazpG5rK7MBL4Dyteh7r8pfrZv/NhFkvMZ2MtF5kEp/aZEBQkP9pyPu/Zixr6e
 2K2m/iG5jC8sOdPqonLTX8MuRWckXbPn1A3k5rd7b8EG3f9pecn8+YrGKGj+lxqqpxcB
 TKEiU7BPJ72jFOtdvcQreuIqYcXx+zSZPFH+3Ej50qY/tRNqcRoObopaabP33JmNoofb
 tuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155742; x=1707760542;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=ckHOiQF/qOPp4NLR5orkkxZ10NogFeYf4CCcJ8+YefcfbgDzm/4A7/F1RmgEZFePfo
 1TQMeT0fXERI4x8Caa//aOBAHgiGv/ctN+PoLvjW1ALd0UT94RB2O40QrnFfzgSImlcY
 yeVfo0p2bO2w6LIIGC3hjiasjhwKn0gkNykTwkcx53Evh2uQ1pSH9/7skBmngETQs+Qb
 feI3NCpRiLvdF2h6PWIKKYC/dIOx36ZPAIcIH7Vf2m42OBu002FKmpJrkkys7mIuCkyx
 5duooUsIq1pEiFLN4Hr/jJKI4auDO4Z71yE8VOwwlS51E1WqmZFVLxxo3uPavhujPDh5
 yYRQ==
X-Gm-Message-State: AOJu0Yy6xcuEvJB4dXjpFoMIfLgLE3CvMYPgbSXovrH8p64p+dPMY4cD
 CUYSI8FYohK5ByPUHhH4rD0PKw7vHXrV2PUTcKGHO6mWPtfQAZiBv0qyebgWGKiSpU59JxTDmdI
 +lOiyVw==
X-Google-Smtp-Source: AGHT+IFQBoZVwEzaKSHH6GSHnwF+OsB+LadCOAluYT1wt3+X1dAsrpBvWeyGAz3FdiU/rHpHIDmccg==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id
 jr18-20020a05600c561200b0040fd3b3b6d2mr386193wmb.14.1707155742633; 
 Mon, 05 Feb 2024 09:55:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVCoTPb98vKy8EX56dDFMSTkbZ4dn33RHsT29UyQh81X0ZnajudOIax7Wv1spxLx4brCiYzTK1zQRGxJGeQ7GAYyy1SQzMG6KVmHAhAV0EIw58NtxOz48nJ6RiXBIt5pyU4kz8IXas7fu30K5YVJOOehG6CzKmeMRjKSb1KwHOA60P3jogmgB9Q+HVgCBwoeg+4HB1K2OysMOVSJF5uG5UGADD0oQ0RFdUtwVaXpms3wDpNvAHDEop4yrtppGP54r01UmZYo2hZnKBGggUPiwiVUS8EIBUAu3O94O1m/0Yq1xqsTh61ZUbYchP8gyTjwrulBosbqAGlO9jYzAk+2B6huKi46Mdf0NoHutLb29EVzIQBL5BirHlLoo4CJGOmwFZl/C057TzxAm/sjwUMbWEVSq8JDBKVuNewezn64ko/F5dVO/k0vpBN6caqbOwPfn/W9c6/JjVlWv/0ourL69xeKGjRUbvuBfGO+rXSrTdDtGkZdFnFxj7mlT2gFziwHDfyDf3LiIyTEP37En0pJ+glHrXHX1cDhkrAb79UJhPOsRRXl93SCqh0bih2rjRy2c1dfZ46778K5/ca93e4DwHWN+GUXAcXbGvuHFnU7wiIDlVoI/RNVN/Qdx792+lAZ9q4O8BMcLSyGFge8N5lQH9IAO+SmCGW751m3S890UQzSUsMOgChfoX+UP6fKfOhBnA+R5J2gc5w7XE+3H8sVVJiLe3rUhnCLjoCAWZysMwo/oqjSUIKc/PimMY1NQH+hl0=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:55:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:32 +0100
Subject: [PATCH v10 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-5-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
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
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEVWuoZmhF/j2rik1x2MG72GYw9Kha028viMega
 ujV9kvOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFQAKCRB33NvayMhJ0cS6EA
 CqhLE5qwspTDUuycmAMyzXEEr/Go7L95TsFMEWIs0O/+j+GlxMrfBP532OgRvBzsRyPlwyHZ38xYpI
 SpLpmvOyL+VdJfZBlSGESjEDF7VR6QXZaMs0muBRoWAj2/qwv2VxET/TDfLdT/tlDZfwyBFwNpUtep
 o308DxP7aREzgPjCPBkvgi6xuXp32mpY5usnVc/C4SXuO9JSJNX1xPPXUVnDm+J6bDh9lhAY0s0OaK
 SqN3XktjiEcQoNcADYZCMYLB/gX3YrvIK26lK8jGjWJCjrbKHAQYc3NQFcGBpI/jlS1zbfuROjMlWy
 TmJC4AKfRevlCScpEdChqcpe3DN9uNPcGBywX7ht8yABd24M5OSczw65UUVaKddTe/saxppXBsX0Bc
 p0CK7JGX6UtJP6BwxtPpoBoVPWRCd96UaD5BIUSQd3HaCW/vOdJl9e7/9Qf1qF5y5WXOyWN/YnBiCG
 sJv0aUVVu0Lt3ypCPuCXJ/ZUbZFhiu0ty2Y7T9hyJCYlq4NP/ynL9XcrF259EtAA5dZPcw6HMHfhYO
 386WN81iKkYoSOlxoPGzzNsUpV7Lh9FD4zE8ViajjaK5CgCTN/AOdqp55oGC2TpIl6bnpEMO6sSFBK
 aGwmO95ejsdCV1LDyKyP7FHQahCy+B+w9ZiTkKChwEnmhKve8ZbpzV2tDamw==
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

