Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A462DABF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5F10E127;
	Thu, 17 Nov 2022 12:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6480010E13E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:26:12 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BA59158D;
 Thu, 17 Nov 2022 13:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668687971;
 bh=hJWHZolEgxknSo6UzcwOzzcgIN9JAn9uMotLz483CrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MTDRahSiFaQ9cP16aQ43RcBnRZRq6cU6Y+52gqOdZqy6Xy/+Izq8vypPI6LPaOrBS
 XZgDieNGWco0zhOQ2L58rBbF3gL9O1/IRVGambs3ZgFLScdF+wn/SNbkRT7G8iIrsk
 IFVCAKdJuVjBvrHsDtRxXsXAs6d5jdy4yYOfSxUw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/8] arm64: dts: renesas: r8a779g0: Add display related data
Date: Thu, 17 Nov 2022 14:25:43 +0200
Message-Id: <20221117122547.809644-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add DT nodes for components needed to get the DSI output working:
- FCPv
- VSPd
- DU
- DSI

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 129 ++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 45d8d927ad26..31d4930c5adc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1207,6 +1207,135 @@ prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
 		};
+
+		fcpvd0: fcp@fea10000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea10000 0 0x200>;
+			clocks = <&cpg CPG_MOD 508>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 508>;
+		};
+
+		fcpvd1: fcp@fea11000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea11000 0 0x200>;
+			clocks = <&cpg CPG_MOD 509>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 509>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x5000>;
+			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 830>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 830>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x5000>;
+			interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 831>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 831>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779g0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 411>;
+			reset-names = "du.0";
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi0: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du_out_dsi1: endpoint {
+						remote-endpoint = <&dsi1_in>;
+					};
+				};
+			};
+		};
+
+		dsi0: dsi-encoder@fed80000 {
+			compatible = "renesas,r8a779g0-dsi-csi2-tx";
+			reg = <0 0xfed80000 0 0x10000>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
+				 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
+			clock-names = "fck", "dsi", "pll";
+			resets = <&cpg 415>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		dsi1: dsi-encoder@fed90000 {
+			compatible = "renesas,r8a779g0-dsi-csi2-tx";
+			reg = <0 0xfed90000 0 0x10000>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 416>,
+				 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
+				 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
+			clock-names = "fck", "dsi", "pll";
+			resets = <&cpg 416>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi1_in: endpoint {
+						remote-endpoint = <&du_out_dsi1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 	};
 
 	timer {
-- 
2.34.1

