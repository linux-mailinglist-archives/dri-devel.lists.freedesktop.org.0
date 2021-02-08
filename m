Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11D3139C9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D75A6E954;
	Mon,  8 Feb 2021 16:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886E36E953
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aorvd7/8Q0iagez40K36p+HgsrbrS8WV5PQF4a7s2FM=; b=ySwDzcwlbm4PDJsfWZJRJYlsEh
 1gQ/3jlSsnD9yMsUDmfEuW5mpJHoJ+PYH1FfHQt8axPr3HRWYG9diWakeC6Lbs+GHjLVm6atP7Dva
 YY/gYggyUlZOqYLUwbpy2KFfaT324NgYjyBbzmLENXNx5QzUsieszbNFbHEctR3I/6heHoR8VFqks
 P+V/sFpl6e6P/kiECFRLELyWB53nljM2ixs5tpfb+zx3QRLQijQicqP7YrYIPYXrt7vliGfvgfwLm
 qUZYvOUAX58EkV+1WYOi+w1E8q6MHpDEt1uKvJ2JGP/Qu9HufT89UO+Ani8m6DFDBaaU/qJrbpKTK
 JifS9MIw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99at-0000Cr-2v; Mon, 08 Feb 2021 18:40:59 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 6/8] arm64: tegra: Add Host1x context stream IDs on
 Tegra186+
Date: Mon,  8 Feb 2021 18:38:46 +0200
Message-Id: <20210208163848.2504291-7-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Host1x context stream IDs on systems that support Host1x context
isolation. Host1x and attached engines can use these stream IDs to
allow isolation between memory used by different processes.

The specified stream IDs must match those configured by the hypervisor,
if one is present.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index c567aa65418b..25a8cb1a97a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1176,6 +1176,15 @@ host1x@13e00000 {
 		interconnect-names = "dma-mem";
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
+		nvidia,context-iommus = <
+			&smmu TEGRA186_SID_HOST1X_CTX0
+			&smmu TEGRA186_SID_HOST1X_CTX1
+			&smmu TEGRA186_SID_HOST1X_CTX2
+			&smmu TEGRA186_SID_HOST1X_CTX3
+			&smmu TEGRA186_SID_HOST1X_CTX4
+			&smmu TEGRA186_SID_HOST1X_CTX5
+			&smmu TEGRA186_SID_HOST1X_CTX6
+			&smmu TEGRA186_SID_HOST1X_CTX7>;
 
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
