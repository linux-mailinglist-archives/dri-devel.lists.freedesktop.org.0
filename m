Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA93AD61D4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 23:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99310E745;
	Wed, 11 Jun 2025 21:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EidgVnMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4E10E745
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749678526;
 bh=p125Qdh7AXpcJlrV+7yqlZZwam5I0mnuIIk+bsJi8UU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EidgVnMiQFzztrReyrHUBVJ/dgBh0iS528uSU6ZSU0dw/oVXjLTONw6yvYb3IBPqR
 fKgkeucn1eAdTsG9IGr5r2aUrGrxN6zYq7QdHqiCmC4B2zFZDg7TQ2Scgu1sd8Vkma
 /SDNw9lX2QVSf79dLPn5C6nN0SqBisjOIt9F2xoXzfsDGUwlygMqnwXUlB33nyq/cD
 J+eh0MSZQk8Vd1Il9blFhNbKZsEAk+7KZhyEnvNY1mRQzI+tfGnnc6nJ1MWCJYMAHN
 elozjHQDkEKzQZ3L1vxI/6Li0jeFjXFFpvi0NF2PChhCmw9F5Y1S3CwcqhF6ed1T5e
 1bPu91kPSGFTQ==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id EFA8C17E0342;
 Wed, 11 Jun 2025 23:48:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Jun 2025 00:47:49 +0300
Subject: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source to
 VOP2 on rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
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

Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
char rate via phy_configure_opts_hdmi"), the workaround of passing the
rate from DW HDMI QP bridge driver via phy_set_bus_width() became
partially broken, as it cannot reliably handle mode switches anymore.

Attempting to fix this up at PHY level would not only introduce
additional hacks, but it would also fail to adequately resolve the
display issues that are a consequence of the system CRU limitations.

Instead, proceed with the solution already implemented for RK3588: make
use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
will not only address the aforementioned problem, but it should also
facilitate the proper operation of display modes up to 4K@60Hz.

It's worth noting that anything above 4K@30Hz still requires high TMDS
clock ratio and scrambling support, which hasn't been mainlined yet.

Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
Cc: stable@vger.kernel.org
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef167d94904 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
 				 <&cru HCLK_VOP>,
 				 <&cru DCLK_VP0>,
 				 <&cru DCLK_VP1>,
-				 <&cru DCLK_VP2>;
+				 <&cru DCLK_VP2>,
+				 <&hdptxphy>;
 			clock-names = "aclk",
 				      "hclk",
 				      "dclk_vp0",
 				      "dclk_vp1",
-				      "dclk_vp2";
+				      "dclk_vp2",
+				      "pll_hdmiphy0";
 			iommus = <&vop_mmu>;
 			power-domains = <&power RK3576_PD_VOP>;
 			rockchip,grf = <&sys_grf>;

-- 
2.49.0

