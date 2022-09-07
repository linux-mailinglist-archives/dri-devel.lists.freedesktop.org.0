Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262885AFF4E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFB110E449;
	Wed,  7 Sep 2022 08:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEDA10E439
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jT5frHWY7B4ZP0qjbeH6vHceIPefnvxkWx2UzO9y614=; b=wKlwfxI+L4wmXntS/OJCKmxYwk
 rj86Wn031mmAAmDRNTFMnTjsbhXIJRY6sw0z9/ZOVPk1eOy+4PlsOG2ZiIEo9dp3ibYU0CxYVb679
 Ph5hfDKNVxrBPc17oxaPTq18VjMj6Wi5lOHa0XfNOWh8YBNvyLWKsZGKTjvDC7ov2yD0QFSl/fF6w
 gZKzw0gJDGO59I6K81Jb3KBkLNZ/O2giCuSGjdxs91CjnKiEhADuYXViz/SXBIfHl8zDZp4gxf3oZ
 rV9R0usxqfZ8mygKbiMf6AczkYFTEHryIQS3Zuw/Ut/LxSf29FvXLQlrNRbym/yz00/yw65B/2GAG
 9muJYNwQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVqaF-00DbXj-55; Wed, 07 Sep 2022 11:38:55 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Add context isolation domains on Tegra234
Date: Wed,  7 Sep 2022 11:38:44 +0300
Message-Id: <20220907083844.2486805-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220907083844.2486805-1-cyndis@kapsi.fi>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add Host1x context isolation domains on Tegra234. On Tegra234 we have
two IOMMUs that are connected to Host1x-channel programmed engines,
so we have to include domains for each of them.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 65d49b27bc5f..d764bd98433a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -570,6 +570,25 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
 
+			/* Context isolation domains */
+			iommu-map = <
+				0 &smmu_niso0 TEGRA234_SID_HOST1X_CTX0 1
+				1 &smmu_niso0 TEGRA234_SID_HOST1X_CTX1 1
+				2 &smmu_niso0 TEGRA234_SID_HOST1X_CTX2 1
+				3 &smmu_niso0 TEGRA234_SID_HOST1X_CTX3 1
+				4 &smmu_niso0 TEGRA234_SID_HOST1X_CTX4 1
+				5 &smmu_niso0 TEGRA234_SID_HOST1X_CTX5 1
+				6 &smmu_niso0 TEGRA234_SID_HOST1X_CTX6 1
+				7 &smmu_niso0 TEGRA234_SID_HOST1X_CTX7 1
+				8 &smmu_niso1 TEGRA234_SID_HOST1X_CTX0 1
+				9 &smmu_niso1 TEGRA234_SID_HOST1X_CTX1 1
+				10 &smmu_niso1 TEGRA234_SID_HOST1X_CTX2 1
+				11 &smmu_niso1 TEGRA234_SID_HOST1X_CTX3 1
+				12 &smmu_niso1 TEGRA234_SID_HOST1X_CTX4 1
+				13 &smmu_niso1 TEGRA234_SID_HOST1X_CTX5 1
+				14 &smmu_niso1 TEGRA234_SID_HOST1X_CTX6 1
+				15 &smmu_niso1 TEGRA234_SID_HOST1X_CTX7 1>;
+
 			vic@15340000 {
 				compatible = "nvidia,tegra234-vic";
 				reg = <0x15340000 0x00040000>;
-- 
2.37.0

