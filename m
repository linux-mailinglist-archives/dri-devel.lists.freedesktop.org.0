Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A444E97DF6B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 00:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C610E33E;
	Sat, 21 Sep 2024 22:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="F+9VTGrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3173710E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1726957889; bh=q4HGnQgfycy2AHtw5GfrgdiaBd9jGsGqRiZpjBBUbHw=;
 b=F+9VTGrIgKsymdLVX+8Ejwdryt9k2nHNK5BmzS90VdTPRn/whv2/KaV0sK6TUDNM925Jm1rUy
 DHhW74I1yXE20JLEZ8ub6G7TXNFcQwVENtoTXfD8vficZxNHMaIN3eQys9SKDPqUJSIRsrHCkq7
 hpHn+II5o3TdQJBSts+Y0KJcpMj2poRaFRxyJCfSzWMdiHhp7jsNpbeSb2UOF9T/A3Dfkcmib6z
 14aNNfMajbcKO5LTe/ToSthx53LPaS1anUdlkXKGPzzHSGSeZIAoPe+p08uKQ0B7JJcbraIfnac
 kUrfq3GmATjV1mFW6GVPQ2yuRRBZ5rdMmanl9XSRafCw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] ARM: dts: rockchip: Split rk3288-vop into big and lit
Date: Sat, 21 Sep 2024 22:20:02 +0000
Message-ID: <20240921222007.2301868-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921222007.2301868-1-jonas@kwiboo.se>
References: <20240921222007.2301868-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ef46bd18c10b4d4a165d17
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

The Rockchip RK3288 SoC contain two different Visual Output Processor
(VOP) blocks, VOP_BIG and VOP_LIT. The VOP blocks support different max
output resolution, 3840x2160 and 2560x1600.

Change compatible to differentiate between VOP_BIG and VOP_LIT, the old
compatible is kept for backward compatibility.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 3f1d640afafa..db4a258551f4 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -1026,7 +1026,7 @@ rga: rga@ff920000 {
 	};
 
 	vopb: vop@ff930000 {
-		compatible = "rockchip,rk3288-vop";
+		compatible = "rockchip,rk3288-vop-big", "rockchip,rk3288-vop";
 		reg = <0x0 0xff930000 0x0 0x19c>, <0x0 0xff931000 0x0 0x1000>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
@@ -1075,7 +1075,7 @@ vopb_mmu: iommu@ff930300 {
 	};
 
 	vopl: vop@ff940000 {
-		compatible = "rockchip,rk3288-vop";
+		compatible = "rockchip,rk3288-vop-lit", "rockchip,rk3288-vop";
 		reg = <0x0 0xff940000 0x0 0x19c>, <0x0 0xff941000 0x0 0x1000>;
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>;
-- 
2.46.1

