Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515D6DDA62
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0FE10E509;
	Tue, 11 Apr 2023 12:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8762610E528
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:08:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155600422"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 21:08:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 619A0400C4C3;
 Tue, 11 Apr 2023 21:08:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 7/8] arm64: dts: renesas: rzg2l-smarc: Enable DU and link
 with DSI
Date: Tue, 11 Apr 2023 13:08:09 +0100
Message-Id: <20230411120810.368437-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DU and link with DSI on RZ/{G2L,V2L} SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 2a158a954b2f..cd4f569df5cd 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -49,6 +49,7 @@ ports {
 		port@0 {
 			reg = <0>;
 			dsi0_in: endpoint {
+				remote-endpoint = <&du_out_dsi>;
 			};
 		};
 
@@ -62,6 +63,26 @@ dsi0_out: endpoint {
 	};
 };
 
+&du {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			du_out_dsi: endpoint {
+				remote-endpoint = <&dsi0_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+		};
+	};
+};
+
 &i2c1 {
 	adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
-- 
2.25.1

