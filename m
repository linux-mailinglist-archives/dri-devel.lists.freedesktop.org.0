Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BB5AEA68
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2373D10E680;
	Tue,  6 Sep 2022 13:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAD110E675
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1mp9KTiW7Fzm6dAODf6CTuUENPLklhUU20Em/a8MWa8=; b=UmE6gyQES905trmympqKfslofV
 AWhI6bq/kVlu409+xO4AMmkaOJztXphGxfP7VOLBOf3JKsOaEpv4yJGOXWrb8yZTTx9EdLRDMNOt/
 VVoIo9W9DraT8LP9JQNw8fqgirFa9dAyK8nnEfWJ9w/QgKQ8JNZADyNSbPykWKk/kio5gNawgpISO
 9xRr0an8tVGtATp2SbQfRNsDb6ldcb9yHvJBZy3vqXd96VKd/vkmwRMtGx934QabFtpYyCNd2e46h
 Aju6cC5Uwo1rlbAVPV8GbCqzdglk+jWLjhscu7EZ91DQFPmrxb4G4FeizI7WNHA7Sxd4Da0amw9qt
 yB9CeCXA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVYdX-008sZV-Qt; Tue, 06 Sep 2022 16:29:07 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/8] arm64: tegra: Add NVDEC on Tegra234
Date: Tue,  6 Sep 2022 16:28:19 +0300
Message-Id: <20220906132823.2390953-5-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a device tree node for NVDEC on Tegra234.

Booting the firmware requires some information regarding offsets
within the firmware binary. These are passed through the device
tree, but since the values vary depending on the firmware version,
and the firmware itself is not available to the OS, the flasher is
expected to provide a device tree overlay with values corresponding
to the firmware it is flashing. The overlay then replaces the
placeholder values here.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 81a0f599685f..65d49b27bc5f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -586,6 +586,33 @@ vic@15340000 {
 				iommus = <&smmu_niso1 TEGRA234_SID_VIC>;
 				dma-coherent;
 			};
+
+			nvdec@15480000 {
+				compatible = "nvidia,tegra234-nvdec";
+				reg = <0x15480000 0x00040000>;
+				clocks = <&bpmp TEGRA234_CLK_NVDEC>,
+				         <&bpmp TEGRA234_CLK_FUSE>,
+				         <&bpmp TEGRA234_CLK_TSEC_PKA>;
+				clock-names = "nvdec", "fuse", "tsec_pka";
+				resets = <&bpmp TEGRA234_RESET_NVDEC>;
+				reset-names = "nvdec";
+				power-domains = <&bpmp TEGRA234_POWER_DOMAIN_NVDEC>;
+				interconnects = <&mc TEGRA234_MEMORY_CLIENT_NVDECSRD &emc>,
+				                <&mc TEGRA234_MEMORY_CLIENT_NVDECSWR &emc>;
+				interconnect-names = "dma-mem", "write";
+				iommus = <&smmu_niso1 TEGRA234_SID_NVDEC>;
+				dma-coherent;
+
+				nvidia,memory-controller = <&mc>;
+
+				/* Placeholder values, to be replaced with values from overlay */
+				nvidia,bl-manifest-offset = <0>;
+				nvidia,bl-data-offset = <0>;
+				nvidia,bl-code-offset = <0>;
+				nvidia,os-manifest-offset = <0>;
+				nvidia,os-data-offset = <0>;
+				nvidia,os-code-offset = <0>;
+			};
 		};
 
 		gpio: gpio@2200000 {
-- 
2.37.0

