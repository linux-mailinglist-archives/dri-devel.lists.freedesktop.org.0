Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E2BEFEB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE3610E31E;
	Mon, 20 Oct 2025 08:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="0xEykeNU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520610E313
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=z62Mgu+xiqkq1oFmKOzlCDXsOLsmTSYpn7SJ2PjkVXI=; b=0xEykeNUAlhlZYnBbS5HBkSZ+q
 sKcc2FKNH8uK+tKOugvviiwfaU+ObaveVGqRMZkXj0pZ/KLLPIzLoZxoGunkuZ2pXIi/rPLfXq4Tx
 NLAiBIzG3ktQli4doLSz/UuVT6djPwnq7xngDu0ncMW/ax4Un1BEp/pJPK+j0GQZWmf6AqnOZW+mq
 YuHJ/JgrM0soN4dPeNd4n0FqGn3U3V8Qw8Ach7N7YlgjyA8xyqeBtQb2sMQCBQsPiCKBphS+/Dbrs
 T2XcF7DKw8nS2XARH9A2x8b7NN2nndvYo7oLM4BAUfZoP5/5aII/+N00pIhHYb4fnnhX1aIN3y0d5
 JGVkq9dQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAlD0-00078O-GG; Mon, 20 Oct 2025 10:25:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 7/9] arm64: dts: rockchip: Add HDMI node to RK3368
Date: Mon, 20 Oct 2025 10:25:06 +0200
Message-ID: <20251020082508.3636511-8-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Add the hdmi controller node to the main soc devicetree and hook
it into the vop.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index ce4b112b082b..892d35242259 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -875,6 +875,11 @@ vop_out_dsi: endpoint@0 {
 				reg = <0>;
 				remote-endpoint = <&dsi_in_vop>;
 			};
+
+			vop_out_hdmi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&hdmi_in_vop>;
+			};
 		};
 	};
 
@@ -933,6 +938,37 @@ dphy: phy@ff968000 {
 		status = "disabled";
 	};
 
+	hdmi: hdmi@ff980000 {
+		compatible = "rockchip,rk3368-dw-hdmi";
+		reg = <0x0 0xff980000 0x0 0x20000>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>, <&cru SCLK_HDMI_CEC>;
+		clock-names = "iahb", "isfr", "cec";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_i2c_xfer>;
+		power-domains = <&power RK3368_PD_VIO>;
+		reg-io-width = <4>;
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+
+				hdmi_in_vop: endpoint {
+					remote-endpoint = <&vop_out_hdmi>;
+				};
+			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
@@ -1196,6 +1232,13 @@ rmii_pins: rmii-pins {
 			};
 		};
 
+		hdmi {
+			hdmi_i2c_xfer: hdmi-i2c-xfer {
+				rockchip,pins = <3 RK_PD2 1 &pcfg_pull_none>,
+						<3 RK_PD3 1 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins = <0 RK_PA6 1 &pcfg_pull_none>,
-- 
2.47.2

