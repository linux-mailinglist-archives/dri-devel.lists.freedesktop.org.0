Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7C55355C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 17:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09FF10E960;
	Tue, 21 Jun 2022 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D938D10E67E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahW4iZmMaeHR2imkET+ZUEfD0C88QvD2NHELBTx02Vw=; b=hEowqs6xALfi+0Zsjt4YBVMhtV
 H6Yi4Fq9GZKKNQpRwNcQuCjIHx3fNx7cDS8s/IWhz8Q+jnjK/vq/4PnroR9MKgDPHknAYYu3QOOac
 iTH+9iH1agba5HVfmOp+NVlhz763i7h15xdfm1Ta70Xy1zimVo4qS1aVd5sqUHEIPwU3zJX4EKTJN
 ZMVH9KBI/yB9mqSrRXdL4KV+d3m50RJ0ZfZ/x7FPT5Tw/YR8MNuE1OsKpiqcok3JPI1BlWTbCc/wL
 GV1DdYS6rwpQ2QMUJ0tcWfYsZRrJTv1mtV5dpriV/VgZju8SoIFLP3ptBB1eDGai5kRsruZS/XxXY
 iyo/H/ow==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o3fWU-00Ea3F-Au; Tue, 21 Jun 2022 18:10:34 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v6 06/10] arm64: tegra: Add Host1x context stream IDs on
 Tegra186+
Date: Tue, 21 Jun 2022 18:10:18 +0300
Message-Id: <20220621151022.1416300-7-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621151022.1416300-1-cyndis@kapsi.fi>
References: <20220621151022.1416300-1-cyndis@kapsi.fi>
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
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

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
v4:
* Remove memory-contexts subnode.
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 0e9afc3e2f26..5f560f13ed93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1461,6 +1461,17 @@ host1x@13e00000 {
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
 
+		/* Context isolation domains */
+		iommu-map = <
+			0 &smmu TEGRA186_SID_HOST1X_CTX0 1
+			1 &smmu TEGRA186_SID_HOST1X_CTX1 1
+			2 &smmu TEGRA186_SID_HOST1X_CTX2 1
+			3 &smmu TEGRA186_SID_HOST1X_CTX3 1
+			4 &smmu TEGRA186_SID_HOST1X_CTX4 1
+			5 &smmu TEGRA186_SID_HOST1X_CTX5 1
+			6 &smmu TEGRA186_SID_HOST1X_CTX6 1
+			7 &smmu TEGRA186_SID_HOST1X_CTX7 1>;
+
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
 			reg = <0x15040000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index d1f8248c00f4..613fd71dec25 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1769,6 +1769,17 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			/* Context isolation domains */
+			iommu-map = <
+				0 &smmu TEGRA194_SID_HOST1X_CTX0 1
+				1 &smmu TEGRA194_SID_HOST1X_CTX1 1
+				2 &smmu TEGRA194_SID_HOST1X_CTX2 1
+				3 &smmu TEGRA194_SID_HOST1X_CTX3 1
+				4 &smmu TEGRA194_SID_HOST1X_CTX4 1
+				5 &smmu TEGRA194_SID_HOST1X_CTX5 1
+				6 &smmu TEGRA194_SID_HOST1X_CTX6 1
+				7 &smmu TEGRA194_SID_HOST1X_CTX7 1>;
+
 			nvdec@15140000 {
 				compatible = "nvidia,tegra194-nvdec";
 				reg = <0x15140000 0x00040000>;
-- 
2.36.1

