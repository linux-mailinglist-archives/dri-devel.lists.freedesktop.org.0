Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4530C2A0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 15:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AC4890D5;
	Tue,  2 Feb 2021 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC8A89C46
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 14:56:52 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l6x6o-00020V-MV; Tue, 02 Feb 2021 15:56:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] arm64: dts: rockchip: add isp1 node on rk3399
Date: Tue,  2 Feb 2021 15:56:32 +0100
Message-Id: <20210202145632.1263136-7-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202145632.1263136-1-heiko@sntech.de>
References: <20210202145632.1263136-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, sebastian.fricke@posteo.net,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

ISP1 is supplied by the tx1rx1 dphy, that is controlled from
inside the dsi1 controller, so include the necessary phy-link
for it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 7c661d84df25..98cec9387300 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1756,6 +1756,32 @@ isp0_mmu: iommu@ff914000 {
 		rockchip,disable-mmu-reset;
 	};
 
+	isp1: isp1@ff920000 {
+		compatible = "rockchip,rk3399-cif-isp";
+		reg = <0x0 0xff920000 0x0 0x4000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru SCLK_ISP1>,
+			 <&cru ACLK_ISP1_WRAPPER>,
+			 <&cru HCLK_ISP1_WRAPPER>;
+		clock-names = "isp", "aclk", "hclk";
+		iommus = <&isp1_mmu>;
+		phys = <&mipi_dsi1>;
+		phy-names = "dphy";
+		power-domains = <&power RK3399_PD_ISP1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
 	isp1_mmu: iommu@ff924000 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff924000 0x0 0x100>, <0x0 0xff925000 0x0 0x100>;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
