Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614046DF36E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D8A10E24D;
	Wed, 12 Apr 2023 11:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FE810E790
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:13 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 012D366057AD;
 Wed, 12 Apr 2023 12:28:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298892;
 bh=07L8L+COY4Oza9QPgGeEH5iNgesuCz5mZ4a5YXV83pI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JyRlZaGaVSHTM25xucD0PmNI2Qjnihirr9j2cKgOeWZDZ7+AJ7QHQHNuzEXYfkUqa
 l3jxNBbNLid0slAcA6W4C231+dChTOFS/V/JAhMdY9WcPamKrugb9MWm8j5WtKN8hL
 w40z5qiEObvmHSQ4bnVcJtH+Q5his1cAtbOMYX474ZLwIoSEGLQbThOKgIJyVc9utG
 csyuc0DOsnY8otZ2xpPrRZVDlhm/wKaxJNQ2Mk5tgMgzGJbFo9tejrcbkdNx+bCaUq
 Y0RumxZP/vOS4/R/D+qALE+U2eZoltFgmkmiHJMqmmmvWKEhwZ930gpTh1fBOmtFWX
 /VgLgn2DjGhhA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 19/27] arm64: dts: mediatek: mt6795: Add support for display
 blocks and DPI/DSI
Date: Wed, 12 Apr 2023 13:27:31 +0200
Message-Id: <20230412112739.160376-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce all nodes for all of the display blocks in the MediaTek Helio
X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
left disabled as usage is board specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 249 +++++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 9cfa02085f61..cf45cb4ad3d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -19,6 +19,23 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl0 = &ovl0;
+		ovl1 = &ovl1;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		rdma2 = &rdma2;
+		wdma0 = &wdma0;
+		wdma1 = &wdma1;
+		color0 = &color0;
+		color1 = &color1;
+		split0 = &split0;
+		split1 = &split1;
+		dpi0 = &dpi0;
+		dsi0 = &dsi0;
+		dsi1 = &dsi1;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -423,6 +440,26 @@ gce: mailbox@10212000 {
 			#mbox-cells = <2>;
 		};
 
+		mipi_tx0: dsi-phy@10215000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10215000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		mipi_tx1: dsi-phy@10216000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10216000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx1_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -660,6 +697,211 @@ mmsys: syscon@14000000 {
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		ovl0: ovl@1400c000 {
+			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+		};
+
+		ovl1: ovl@1400d000 {
+			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1>;
+			iommus = <&iommu M4U_PORT_DISP_OVL1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+		};
+
+		rdma0: rdma@1400e000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+		};
+
+		rdma1: rdma@1400f000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+		};
+
+		rdma2: rdma@14010000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+		};
+
+		wdma0: wdma@14011000 {
+			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+		};
+
+		wdma1: wdma@14012000 {
+			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+		};
+
+		color0: color@14013000 {
+			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x14013000 0 0x1000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+		};
+
+		color1: color@14014000 {
+			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
+		};
+
+		aal@14015000 {
+			compatible = "mediatek,mt6795-disp-aal", "mediatek,mt8173-disp-aal";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+		};
+
+		gamma@14016000 {
+			compatible = "mediatek,mt6795-disp-gamma", "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+		};
+
+		merge@14017000 {
+			compatible = "mediatek,mt6795-disp-merge", "mediatek,mt8173-disp-merge";
+			reg = <0 0x14017000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_MERGE>;
+		};
+
+		split0: split@14018000 {
+			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
+			reg = <0 0x14018000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+		};
+
+		split1: split@14019000 {
+			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
+			reg = <0 0x14019000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT1>;
+		};
+
+		ufoe@1401a000 {
+			compatible = "mediatek,mt6795-disp-ufoe", "mediatek,mt8173-disp-ufoe";
+			reg = <0 0x1401a000 0 0x1000>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_UFOE>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
+		};
+
+		dsi0: dsi@1401b000 {
+			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
+			reg = <0 0x1401b000 0 0x1000>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI0_ENGINE>,
+				 <&mmsys CLK_MM_DSI0_DIGITAL>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dsi1: dsi@1401c000 {
+			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
+			reg = <0 0x1401c000 0 0x1000>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI1_ENGINE>,
+				 <&mmsys CLK_MM_DSI1_DIGITAL>,
+				 <&mipi_tx1>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx1>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dpi0: dpi@1401d000 {
+			compatible = "mediatek,mt6795-dpi", "mediatek,mt8173-dpi";
+			reg = <0 0x1401d000 0 0x1000>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+				 <&mmsys CLK_MM_DPI_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
+		};
+
+		pwm0: pwm@1401e000 {
+			compatible = "mediatek,mt6595-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1401e000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&mmsys CLK_MM_DISP_PWM026M>, <&mmsys CLK_MM_DISP_PWM0MM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		pwm1: pwm@1401f000 {
+			compatible = "mediatek,mt6595-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1401f000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&mmsys CLK_MM_DISP_PWM126M>, <&mmsys CLK_MM_DISP_PWM1MM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		mutex: mutex@14020000 {
+			compatible = "mediatek,mt8173-disp-mutex";
+			reg = <0 0x14020000 0 0x1000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MUTEX_32K>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
+		};
+
 		larb0: larb@14021000 {
 			compatible = "mediatek,mt6795-smi-larb";
 			reg = <0 0x14021000 0 0x1000>;
@@ -678,6 +920,13 @@ smi_common: smi@14022000 {
 			clock-names = "apb", "smi";
 		};
 
+		od@14023000 {
+			compatible = "mediatek,mt6795-disp-od", "mediatek,mt8173-disp-od";
+			reg = <0 0x14023000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OD>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
+		};
+
 		larb2: larb@15001000 {
 			compatible = "mediatek,mt6795-smi-larb";
 			reg = <0 0x15001000 0 0x1000>;
-- 
2.40.0

