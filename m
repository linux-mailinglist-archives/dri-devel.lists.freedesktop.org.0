Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0AAD61D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 23:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668A10E746;
	Wed, 11 Jun 2025 21:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="X1KUaJ2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A7110E746
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749678516;
 bh=LH3RSD841MZ/Wiu+j6uCJ53sshntEVWDrCUzXD6Diq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X1KUaJ2vZwipKPBKokVHgxzdwtYRuJjl1kPJJnlJRoEZsVaLlH7zvZbqAru5khxja
 UdazX8hjDh3qWdJEMpTTnHKE/JHAbKmNX7yijDy+DUt+ZoZKani5n7TidH3PNS0HE/
 zbf7rbjoEjvcYwcmcoSRN2TJgU7Z07KOJWHGwvDorHqzWRZ7bmkpmXUth+Owb1LVrl
 b0L3vcnwziQl3r2jtx6klopCEyKTEcVFMt904uKxIjHJ3hupWP7AAnBXjSL1MRDDr3
 rAFBRexrxeLCGq+3mvUhbpeELFkLTycraMSG1Mhm/7p2lK//T4MHCNCaV20CC9pUCz
 cjjSSx+t5wXUA==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 182F617E1560;
 Wed, 11 Jun 2025 23:48:36 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:48 +0300
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI PHY clk provider on
 rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-2-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
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

As with the RK3588 SoC, the HDMI PHY PLL on RK3576 can be used as a more
accurate pixel clock source for VOP2, which is actually mandatory to
ensure proper support for display modes handling.

Add the missing #clock-cells property to allow using the clock provider
functionality of HDMI PHY.

Fixes: ad0ea230ab2a ("arm64: dts: rockchip: Add hdmi for rk3576")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..6a13fe0c3513fb2ff7cd535aa70e3386c37696e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2391,6 +2391,7 @@ hdptxphy: hdmiphy@2b000000 {
 			reg = <0x0 0x2b000000 0x0 0x2000>;
 			clocks = <&cru CLK_PHY_REF_SRC>, <&cru PCLK_HDPTX_APB>;
 			clock-names = "ref", "apb";
+			#clock-cells = <0>;
 			resets = <&cru SRST_P_HDPTX_APB>, <&cru SRST_HDPTX_INIT>,
 				 <&cru SRST_HDPTX_CMN>, <&cru SRST_HDPTX_LANE>;
 			reset-names = "apb", "init", "cmn", "lane";

-- 
2.49.0

