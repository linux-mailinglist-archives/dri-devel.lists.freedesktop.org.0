Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90330A40DB4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 10:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87410E290;
	Sun, 23 Feb 2025 09:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UDWClHbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D76A10E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740303157;
 bh=SE9Nutny/gzjaQ3Hy7tTClTNDcn3VFJaaCAjW0BhTsc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UDWClHbfy2lN7RQStexxDn+njHyDLp5ChxksGKP7Uo4hoN1O9ET9J2nJGyn2kBzOH
 5ZvtdzIxClimUtlIFtc7X36VbXAc99XC+beTZ3eGOc9GGRl9h3nF6HS7ZiS/S+kHJq
 RnsmpncGqbWnrtld2L6pHI46l+tEuEiF0EWVrQeoTWVMJuRh6DGIQDyJ5EH1BkE7g6
 EtIKWEoTkXUZQcqY1Y7kHXN+gaXmkoXg3UguWTu49nFGJqManXvTVCIHK8QMrfFzJT
 MO4MrEsneQyJIbrEJQ9S3KlMxr/nZqbASNHxs1s1RLKH13F6g6RYKmvauWJ0WT2Dkz
 Jmd3sdOV8ns6g==
Received: from localhost (unknown [188.27.58.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2EC4717E0CFA;
 Sun, 23 Feb 2025 10:32:37 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 23 Feb 2025 11:31:40 +0200
Subject: [PATCH v2 4/5] arm64: dts: rockchip: Add HDMI1 PHY PLL clock
 source to VOP2 on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-vop2-hdmi1-disp-modes-v2-4-f4cec5e06fbe@collabora.com>
References: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
In-Reply-To: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

VOP2 on RK3588 is able to use the HDMI PHY PLL as an alternative and
more accurate pixel clock source to improve handling of display modes up
to 4K@60Hz on video ports 0, 1 and 2.

The HDMI1 PHY PLL clock source cannot be added directly to vop node in
rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
optional feature and its PHY node belongs to a separate (extra) DT file.

Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
clocks & clock-names properties in the extra DT file.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 97e55990e0524ed447d182cef416190822bf67be..1df8845bdc264b07601add3747b273f92091e7fa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -542,3 +542,24 @@ pcie30phy: phy@fee80000 {
 		status = "disabled";
 	};
 };
+
+&vop {
+	clocks = <&cru ACLK_VOP>,
+		 <&cru HCLK_VOP>,
+		 <&cru DCLK_VOP0>,
+		 <&cru DCLK_VOP1>,
+		 <&cru DCLK_VOP2>,
+		 <&cru DCLK_VOP3>,
+		 <&cru PCLK_VOP_ROOT>,
+		 <&hdptxphy0>,
+		 <&hdptxphy1>;
+	clock-names = "aclk",
+		      "hclk",
+		      "dclk_vp0",
+		      "dclk_vp1",
+		      "dclk_vp2",
+		      "dclk_vp3",
+		      "pclk_vop",
+		      "pll_hdmiphy0",
+		      "pll_hdmiphy1";
+};

-- 
2.48.1

