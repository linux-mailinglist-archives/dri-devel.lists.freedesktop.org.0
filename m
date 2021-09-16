Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3063B40DD5B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 16:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01556EE1C;
	Thu, 16 Sep 2021 14:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6746EE19
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Z8UdsvzeKoZJTZfQ5GStAx1Bjf3CHBgzJFfPbYyGko=; b=H03/qP4d6xZq4Tfh17PVu54tHP
 UkLRGURzcuTdbE9NkgWDHYEShK4sr6+FBPqeQmmMKkkGH7bl8bDMeCpZkP4GLw0TOaDSl4wW5t5vg
 7XgM/Mpb0rnunTofBAeJW8XrnwKbysE58SlbQ/Z4F168G6eCbugYclQ1D7gHQsee3aJFyGnba3QuN
 NERiOm987vbFd6+21MXRFqANEIChSkLpXj9ReFwY5PXwfnsL6c3EZgGmvHJpd6dccJSFL5M6u1aZI
 7t632wfd5hGLjIqJ61wanysZEL11OdDESZz1S8niDm6XXJ1Exd/VJmOoLFdlKwjo1gMS9bZEzCbgK
 n7edVzxg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1mQsnM-0002zq-8w; Thu, 16 Sep 2021 17:55:24 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device trees
Date: Thu, 16 Sep 2021 17:55:16 +0300
Message-Id: <20210916145517.2047351-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916145517.2047351-1-mperttunen@nvidia.com>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a device tree node for NVDEC on Tegra186, and
device tree nodes for NVDEC and NVDEC1 on Tegra194.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Change from nvidia,instance to nvidia,host1x-class
v4:
* Add dma-coherent markers
v3:
* Change read2 to read-1
v2:
* Add NVDECSRD1 memory client
* Add also to T194 (both NVDEC0/1)
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 38 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index d02f6bf3e2ca..4f2f21242b2c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1342,6 +1342,22 @@ dsib: dsi@15400000 {
 			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
 		};
 
+		nvdec@15480000 {
+			compatible = "nvidia,tegra186-nvdec";
+			reg = <0x15480000 0x40000>;
+			clocks = <&bpmp TEGRA186_CLK_NVDEC>;
+			clock-names = "nvdec";
+			resets = <&bpmp TEGRA186_RESET_NVDEC>;
+			reset-names = "nvdec";
+
+			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
+			interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVDECSRD1 &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+			interconnect-names = "dma-mem", "read-1", "write";
+			iommus = <&smmu TEGRA186_SID_NVDEC>;
+		};
+
 		sor0: sor@15540000 {
 			compatible = "nvidia,tegra186-sor";
 			reg = <0x15540000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5ba7a4519b95..04e883aa7aa2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1412,6 +1412,25 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			nvdec@15140000 {
+				compatible = "nvidia,tegra194-nvdec";
+				reg = <0x15140000 0x00040000>;
+				clocks = <&bpmp TEGRA194_CLK_NVDEC1>;
+				clock-names = "nvdec";
+				resets = <&bpmp TEGRA194_RESET_NVDEC1>;
+				reset-names = "nvdec";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECB>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVDEC1>;
+				dma-coherent;
+
+				nvidia,host1x-class = <0xf5>;
+			};
+
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display";
 				reg = <0x15200000 0x00040000>;
@@ -1525,6 +1544,25 @@ vic@15340000 {
 				iommus = <&smmu TEGRA194_SID_VIC>;
 			};
 
+			nvdec@15480000 {
+				compatible = "nvidia,tegra194-nvdec";
+				reg = <0x15480000 0x00040000>;
+				clocks = <&bpmp TEGRA194_CLK_NVDEC>;
+				clock-names = "nvdec";
+				resets = <&bpmp TEGRA194_RESET_NVDEC>;
+				reset-names = "nvdec";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVDEC>;
+				dma-coherent;
+
+				nvidia,host1x-class = <0xf0>;
+			};
+
 			dpaux0: dpaux@155c0000 {
 				compatible = "nvidia,tegra194-dpaux";
 				reg = <0x155c0000 0x10000>;
-- 
2.32.0

