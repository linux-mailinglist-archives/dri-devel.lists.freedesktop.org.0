Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD992BC01
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8665A10E56E;
	Tue,  9 Jul 2024 13:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3116110E56E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:52:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; d="scan'208";a="214766397"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 793C943DEDAE;
 Tue,  9 Jul 2024 22:52:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 9/9] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Date: Tue,  9 Jul 2024 14:51:47 +0100
Message-ID: <20240709135152.185042-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
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

Enable DU and link with the HDMI add-on board connected with
the parallel connector on RZ/G2UL SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 8e0107df2d46..dda37cf4d3fd 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -35,4 +35,115 @@
 / {
 	model = "Renesas SMARC EVK based on r9a07g043u11";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7513_out>;
+			};
+		};
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			du_out_rgb: endpoint {
+				remote-endpoint = <&adv7513_in>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	adv7513: adv7513@39 {
+		compatible = "adi,adv7513";
+		reg = <0x39>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		dvdd-3v-supply = <&reg_3p3v>;
+		bgvdd-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7513_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7513_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	du_pins: du {
+		data {
+			pinmux = <RZG2L_PORT_PINMUX(11, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 4, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(12, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 3, 6)>;
+			drive-strength = <2>;
+		};
+
+		sync {
+			pinmux = <RZG2L_PORT_PINMUX(11, 0, 6)>, /* HSYNC */
+				 <RZG2L_PORT_PINMUX(12, 0, 6)>; /* VSYNC */
+			drive-strength = <2>;
+		};
+
+		de {
+			pinmux = <RZG2L_PORT_PINMUX(11, 1, 6)>; /* DE */
+			drive-strength = <2>;
+		};
+
+		clk {
+			pinmux = <RZG2L_PORT_PINMUX(11, 3, 6)>; /* CLK */
+		};
+	};
 };
-- 
2.43.0

