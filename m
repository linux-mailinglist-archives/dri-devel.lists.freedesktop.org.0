Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3B9D006F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 19:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CC610E1F6;
	Sat, 16 Nov 2024 18:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ByWQALqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C3610E0AD
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731781364;
 bh=+vXjisEVYCifCf+z33u/bFOO0lR3e3Qmb5SviT++k/Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ByWQALqQCMLAm1yBItp4upQlzSjAKi4CZzqz2Ue03i9ukCvvLb5RVYpc6ZQDptXSc
 vvE79bAhaAXBIItCitFReUAJknB1yj7shRJwYHZMYgPK0TZtQp8tH2iVhlCZdO7KvG
 nwwVj5kknnCy/iI1i0fqT4csjY+dWiem4GGG9LbI5Sl34H3DV3jo/3dh5hWOOcgT3/
 WXhu9ONcBfoS2adgs74KeFxDqb5ywAu3/gKBn8Po0zDSn5WKrOtgNCrtGhWy7EUlg4
 j8nQgX98WXQLQSO+d99FlFn2lMhFBXwgJxUpMd3TTPslQSqv7ZASelzAS+K1Sff/ZE
 plWKY5j5bTfQQ==
Received: from localhost (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ACA7917E377D;
 Sat, 16 Nov 2024 19:22:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 16 Nov 2024 20:22:35 +0200
Subject: [PATCH 4/5] arm64: dts: rockchip: Enable HDMI0 PHY clk provider on
 RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-vop2-hdmi0-disp-modes-v1-4-2bca51db4898@collabora.com>
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

Since commit c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock
provider support"), the HDMI PHY PLL can be used as an alternative and
more accurate pixel clock source for VOP2 to improve display modes
handling on RK3588 SoC.

Add the missing #clock-cells property to allow using the clock provider
functionality of HDMI0 PHY.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index a337f3fb8377e4a3a200d4d3a3773a237de2bd6e..22462e86f48027ab7c5e270f2fa04df7afcc1d24 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2811,6 +2811,7 @@ hdptxphy_hdmi0: phy@fed60000 {
 		reg = <0x0 0xfed60000 0x0 0x2000>;
 		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX0>;
 		clock-names = "ref", "apb";
+		#clock-cells = <0>;
 		#phy-cells = <0>;
 		resets = <&cru SRST_HDPTX0>, <&cru SRST_P_HDPTX0>,
 			 <&cru SRST_HDPTX0_INIT>, <&cru SRST_HDPTX0_CMN>,

-- 
2.47.0

