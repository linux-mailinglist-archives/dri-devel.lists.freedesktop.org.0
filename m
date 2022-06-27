Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6355BA65
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2BF112343;
	Mon, 27 Jun 2022 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4CE10F0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VhFQH5Q1ygwgbFioaFYlr73TBFA4fN7hoa82H2H+kA=; b=nsk+RZKrpiEz9FX8RllottRtZs
 hvwHn1LgFpJH6Rre57p3Jl7C5GTNgUdnLFtlCEUrr++ky6TEQgtlA2y6m/NWIqGjoms8ks3IL+fYq
 OSM1JHpLadmVnzQ8cAK7V5rBSVBxgta1EQbIGWE/t4utAaB13ZCfdyX4tzPvIErS92XPHju03s+Wp
 eMGKXlSEpAwgYulIX3MD6k9oC1ZaSNWVBNLYod7fDhIGN5ZaDPljk2WitYDCz20TVXGKhw/ubQHYx
 4Sgb+BVLzGWLTULncSw0UThpYa6LxCySJVaeI1tDj2t8FvOSXmmos033kAmmwg6H/1oF8TJ5reAtn
 AAWk8cZA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbN-003N2J-9Y; Mon, 27 Jun 2022 17:20:32 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 12/22] arm64: tegra: Add Host1x and VIC on Tegra234
Date: Mon, 27 Jun 2022 17:19:58 +0300
Message-Id: <20220627142008.2072474-13-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add device tree nodes for Host1x and VIC on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index cb3af539e477..cae68e59580c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -454,6 +454,52 @@ misc@100000 {
 			status = "okay";
 		};
 
+		host1x@13e00000 {
+			compatible = "nvidia,tegra234-host1x";
+			reg = <0x13e00000 0x10000>,
+			      <0x13e10000 0x10000>,
+			      <0x13e40000 0x10000>;
+			reg-names = "common", "hypervisor", "vm";
+			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+			             <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "syncpt0", "syncpt1", "syncpt2", "syncpt3", "syncpt4",
+			                  "syncpt5", "syncpt6", "syncpt7", "host1x";
+			clocks = <&bpmp TEGRA234_CLK_HOST1X>;
+			clock-names = "host1x";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x15000000 0x15000000 0x01000000>;
+			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HOST1XDMAR &emc>;
+			interconnect-names = "dma-mem";
+			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
+
+			vic@15340000 {
+				compatible = "nvidia,tegra234-vic";
+				reg = <0x15340000 0x00040000>;
+				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&bpmp TEGRA234_CLK_VIC>;
+				clock-names = "vic";
+				resets = <&bpmp TEGRA234_RESET_VIC>;
+				reset-names = "vic";
+
+				power-domains = <&bpmp TEGRA234_POWER_DOMAIN_VIC>;
+				interconnects = <&mc TEGRA234_MEMORY_CLIENT_VICSRD &emc>,
+						<&mc TEGRA234_MEMORY_CLIENT_VICSWR &emc>;
+				interconnect-names = "dma-mem", "write";
+				iommus = <&smmu_niso1 TEGRA234_SID_VIC>;
+				dma-coherent;
+			};
+		};
+
 		gpio: gpio@2200000 {
 			compatible = "nvidia,tegra234-gpio";
 			reg-names = "security", "gpio";
-- 
2.36.1

