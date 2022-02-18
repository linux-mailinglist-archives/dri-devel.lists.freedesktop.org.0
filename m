Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F14BB88A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D189CD4;
	Fri, 18 Feb 2022 11:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB2310ED4E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kI2Y6FC34ujTihl6CDjHGjleimjTYg+32wil4qWAtbY=; b=emjAyPEwTpAqQAVxDRmqRV/8sS
 4VBE36vI/5WUgsMkA9/QqmWfR+sG5GYt67RwJ/7HFQbpux6Nhc/YruZamH7d07p+6JdAYdnr3m4Xx
 6mRnbDAO3CKx2S+iGOer4H+gpgKxeChyxG3Lm7qGZ6xz2fUGxxwEJSPMWQO1Tmh6UY1ID6yHNw1oB
 56moj3NbDdB93/eU7N1F3eDIYzBOSsfztW3u1ASdkZPD+MgeVFiOoEm+IibZHBRwClcufLq/HvRlN
 BGBwVOAaU3NdbrGb44gKFYcYD+jdFezlj4/D7URTtyC/zoUyxTACgdicILBBgqveXcfKHPllJV6sU
 MIXKwV7w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nL1fq-0006eP-9v; Fri, 18 Feb 2022 13:43:42 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Subject: [PATCH v3 6/9] arm64: tegra: Add Host1x context stream IDs on
 Tegra186+
Date: Fri, 18 Feb 2022 13:39:49 +0200
Message-Id: <20220218113952.3077606-7-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218113952.3077606-1-mperttunen@nvidia.com>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Host1x context stream IDs on systems that support Host1x context
isolation. Host1x and attached engines can use these stream IDs to
allow isolation between memory used by different processes.

The specified stream IDs must match those configured by the hypervisor,
if one is present.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Added context devices on T194.
* Use iommu-map instead of custom property.
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index c91afff1b757..7c49a0281986 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1406,6 +1406,18 @@ host1x@13e00000 {
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
 
+		memory-contexts {
+			iommu-map = <
+				0 &smmu TEGRA186_SID_HOST1X_CTX0 1
+				1 &smmu TEGRA186_SID_HOST1X_CTX1 1
+				2 &smmu TEGRA186_SID_HOST1X_CTX2 1
+				3 &smmu TEGRA186_SID_HOST1X_CTX3 1
+				4 &smmu TEGRA186_SID_HOST1X_CTX4 1
+				5 &smmu TEGRA186_SID_HOST1X_CTX5 1
+				6 &smmu TEGRA186_SID_HOST1X_CTX6 1
+				7 &smmu TEGRA186_SID_HOST1X_CTX7 1>;
+		};
+
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
 			reg = <0x15040000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2d48c3715fc6..240202f2669b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1686,6 +1686,18 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			memory-contexts {
+				iommu-map = <
+					0 &smmu TEGRA194_SID_HOST1X_CTX0 1
+					1 &smmu TEGRA194_SID_HOST1X_CTX1 1
+					2 &smmu TEGRA194_SID_HOST1X_CTX2 1
+					3 &smmu TEGRA194_SID_HOST1X_CTX3 1
+					4 &smmu TEGRA194_SID_HOST1X_CTX4 1
+					5 &smmu TEGRA194_SID_HOST1X_CTX5 1
+					6 &smmu TEGRA194_SID_HOST1X_CTX6 1
+					7 &smmu TEGRA194_SID_HOST1X_CTX7 1>;
+			};
+
 			nvdec@15140000 {
 				compatible = "nvidia,tegra194-nvdec";
 				reg = <0x15140000 0x00040000>;
-- 
2.35.0

