Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754ED848799
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921C010EB94;
	Sat,  3 Feb 2024 16:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ndgSNv0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0F10EA64
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:29 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7bfdbaa135bso133019439f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979268; x=1707584068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xV5GVJAeOV5TOmmqtEiNPh6TTuzFDGGYosrKg+K0ogs=;
 b=ndgSNv0lQyiAoj6qCUlKKiYW6X7E3+MG2BhmXLwWvVkUh1ati75GONDLWSRL4rWX1A
 6PVjKuFipHJU5qFh1O1cLrdu+XkPGeD5ep/mgMDWgb5YgILD8iGWS16b1TCnHvOjABua
 3k1J2PZteGMpTf9grxyM1HDQkyy831Uml826nk9sGglEj1RKjqKItE/8586fxZj3tBg5
 ZeEx+nXcWanesE1PbjppK0Rjsxu+3PqFpwLx47ganVVTchTijjhMTXnjudanVupxuEK3
 G7/2Lc7lpmf3Cm72x8+rWXTTDmMXKwT02WEhtsa2et/2XCTf4Fb/17FaGrLXfWVaAWy9
 lKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979268; x=1707584068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xV5GVJAeOV5TOmmqtEiNPh6TTuzFDGGYosrKg+K0ogs=;
 b=LIwyQKcS2ivVB1JgwP7XjUq1Bf5513SyeXbJGKkLFL6nKzBiH4Frz2LN1r0f7TTUe8
 EyrCdl8uYLSTZuk+1XMdWwiJNRO/dAtO8QvYeY62cR9utIfiF6tLrHiiCl9jOFjDjiMf
 +QQZaIVZx6/PMtnv5/S5G9/IbaO0PqozNerco13LukV46ikSWXexN7g1E8CCrrjVDwkA
 /NnqwQOBzb1vUG6dR5+yu9786lp2bu3g/ALMkYLKK3pzD5iuaqLEkjejR5Pcf87E2uAe
 fUBE2HAUJb2nFJjyGns2t5cglh0EelSsBNI3MPiuSY7nI34YOs+qCjcGRUUkxE11+5WM
 cYRw==
X-Gm-Message-State: AOJu0Yy9nlTSsDO1mJ8AsCDR4tjB2QZsis8XZa9tqUas63mkvZrFVZQg
 v5BcR0VtvXJXE5LLnZRbqfDRqpWtt/Na7L7HPEdzyDJGib1DinUT
X-Google-Smtp-Source: AGHT+IFnDvtXlMmMQMAwllyK2p1O6sOo0/5lgyhi5R6gSBcyqbb6GieWlNuW2+KRpkUDfPvTDFKq0w==
X-Received: by 2002:a6b:6e17:0:b0:7c1:b54c:15db with SMTP id
 d23-20020a6b6e17000000b007c1b54c15dbmr4318249ioh.15.1706979268376; 
 Sat, 03 Feb 2024 08:54:28 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXmqWTm894swln2GDV8F3WEq0djHX3OxF/EqeGpkI7kiPokKS2KcpbgZo/Uut92LTwLhUI6PYbQDh31v+/cFCyk+FJH2smLUK0r/V63WoEXqaD2Cp0aFLb+Hy2N8+QWKvt6x6e6pT0ImqLU9m7LjhQK6aDCCVEbHcYd+SdsbHG1AST5aBMskATXyLHvegi1DtRqOf5M1EjuNqXD1+SyPzdufudg/fCA9qsLiED37rWzRNrj1e2B+xkeiQQOC6iiD6BtQn4BjFCVif3rWMf4ea27VaZ4WGtJw7/2QpKQPpn3scr9XL113hBuZ00WR3QrCR1L9GLav1MBgTDbYEVYTfz0oDB1iGec1YcNnZICfuifQDWEsz+rwno7sL49LLhE6S5YnKbxzPSBW+4yvvRpQrfyjb60E34WzSnUQOcaf6Dv75Z2SduMXvvhVrY5L0NaQ5XEpiF+1ZHVX5cpWqcpK7QdIK3QhV6y2nfJGIznwKDU61GfYW1w6C48a6JGzi/5pxeWexQU/O7lsZ4FPr7CzsUSizXl4QEuQH9hPzT4drBAoA5qm359X+ty9HM68qF10ccyO1npxaJQ1cf5JWCUuZauyXNFz54cAaUsZUjdN3fhgOgErzpiutEPxXwr1GOeeNBmNyDYsPImDEFH46D0NPvt6Jov6X4VLO+Zhmd+N9+XwkSJgPx0eRmT+se+VwAjD0dHBWmQdUlIAZ0fCqF8/mIup/bugxLhtDOm0nCUj5x2nglochi1SjxxVdbIJhjHjc0nVSJNeG2aQ+x23fP7eFf7HcZ3DqBuujqpIYLm1DQwuyIuBfgpAmH9dZlEPegP4DQzDy/HOqkEDdIqO5CSFX8kB5IV/BKnGuhRTIeBo8IHloiulv2DHmwsNH/KTo1zUXvixxQYDmxoqRw+blKfqc5zUCVirPgT/dsqSdbF2f3fN5Dd4MvBmWNqYCboBQj3W0/ris
 emPfAbHNNRrGK4lwUBOjq5ovieCPN1t2tDrNLQzrfSqo6vMcVv5O2MPoOiYjsYb+O1Yw6xBf18ayT5cS03xuZNTZ9njmDDY9M4kenkI/u19v80u6GvW2R4ehld2ewO1GKmkQwVCNxz2+e9mO3RWYe7tVQ2YtKrYS6EJT+49cK5rnNDdDw1h2T7s/gI4BNHB1tlkK8od3YGs7C7rmiIdVQ/oQhiR5vuQA==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:26 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [PATCH V8 11/12] arm64: dts: imx8mp: add HDMI display pipeline
Date: Sat,  3 Feb 2024 10:52:51 -0600
Message-ID: <20240203165307.7806-12-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

This adds the DT nodes for all the peripherals that make up the
HDMI display pipeline.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

---
V2:  I took this from Lucas' original submission with the following:
     Removed extra clock from HDMI-TX since it is now part of the
     power domain
     Added interrupt-parent to PVI
     Changed the name of the HDMI tranmitter to fsl,imx8mp-hdmi-tx
     Added ports to HDMI-tx
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 94 +++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5e51a766f3d9..e84b4f40e570 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1412,6 +1412,100 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 				clock-names = "ipg";
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_IRQSTEER>;
 			};
+
+			hdmi_pvi: display-bridge@32fc4000 {
+				compatible = "fsl,imx8mp-hdmi-pvi";
+				reg = <0x32fc4000 0x40>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						pvi_from_lcdif3: endpoint {
+							remote-endpoint = <&lcdif3_to_pvi>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						pvi_to_hdmi_tx: endpoint {
+							remote-endpoint = <&hdmi_tx_from_pvi>;
+						};
+					};
+				};
+			};
+
+			lcdif3: display-controller@32fc6000 {
+				compatible = "fsl,imx8mp-lcdif";
+				reg = <0x32fc6000 0x238>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				clocks = <&hdmi_tx_phy>,
+					 <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_ROOT>;
+				clock-names = "pix", "axi", "disp_axi";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_LCDIF>;
+
+				port {
+					lcdif3_to_pvi: endpoint {
+						remote-endpoint = <&pvi_from_lcdif3>;
+					};
+				};
+			};
+
+			hdmi_tx: hdmi@32fd8000 {
+				compatible = "fsl,imx8mp-hdmi-tx";
+				reg = <0x32fd8000 0x7eff>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+					 <&clk IMX8MP_CLK_32K>,
+					 <&hdmi_tx_phy>;
+				clock-names = "iahb", "isfr", "cec", "pix";
+				assigned-clocks = <&clk IMX8MP_CLK_HDMI_REF_266M>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
+				reg-io-width = <1>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						hdmi_tx_from_pvi: endpoint {
+							remote-endpoint = <&pvi_to_hdmi_tx>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						/* Point endpoint to the HDMI connector */
+					};
+				};
+			};
+
+			hdmi_tx_phy: phy@32fdff00 {
+				compatible = "fsl,imx8mp-hdmi-phy";
+				reg = <0x32fdff00 0x100>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_24M>;
+				clock-names = "apb", "ref";
+				assigned-clocks = <&clk IMX8MP_CLK_HDMI_24M>;
+				assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		aips5: bus@30c00000 {
-- 
2.43.0

