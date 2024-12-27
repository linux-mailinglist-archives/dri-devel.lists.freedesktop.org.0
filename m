Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34729FD391
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 12:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B94410E399;
	Fri, 27 Dec 2024 11:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="I9QX2yJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta40.uswest2.a.cloudfilter.net
 (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C4F10E397
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 11:09:46 +0000 (UTC)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTPS
 id QmX6tCKuRvH7lR8DytJAf1; Fri, 27 Dec 2024 11:09:46 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id R8Dvt6kFClDL5R8DxtSam1; Fri, 27 Dec 2024 11:09:46 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676e8afa
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=lEnXP8s9Ohb5C3ohY50A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxN3bXXBaX/Lq3wyIRYqWPp+3YjBN61bepp4p58ij9s=; b=I9QX2yJfq5eeIpkXfuQAj3oTSq
 4eNXGJk/RwanfS3NSMaJYqYbVmYZWd4KIFnYKDVp8hTp5zguJETcLW0mAFTahdjHCol1x8TtGKkFO
 3IIJFQ84ruyIyloaUFt0S/V+fSuWB+aL3yzZtuwBfAcks+nUs4vUeBjdZ5p8vcjjrLfAvGENHJWNz
 OfDShDkmhCjk0csnKe0xAOZpn7f81u2pD9r/j2B19NmEtlz7IVUgvfulCLgzsqtSo4SD+4dYKs46G
 xHRraKUGch7qrzsvC5fijvCZLWkaOQ54uo9M7+/zMO1tMPLeHRcEZj91lh5SWUYFvFNWrX1bjq3r/
 Sac7w7mw==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tR8Du-000bEK-0V;
 Fri, 27 Dec 2024 16:39:42 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:04 +0530
Subject: [PATCH 17/22] phy: allwinner: phy-sun6i-mipi-dphy: add LVDS
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=2408;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=nGhmLXbYqR03qzpnWqYss6Ffpz+ip+uG6qlbqNTI4RI=;
 b=jrn6tfvMK61w3sgTTFVgqbnsDl8voBLuiq+w4I4k4GT50D6DwXem7WWTp7nYJlqsikuDUr5Xn
 u3DGRJaOe5oBtwaDDu6RCOpsp0RqGwuy4qxUO6CGLg7RxoBCgfmikvJ
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8Du-000bEK-0V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 496
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLpOjD09pr3D1I6b9h55aLaS9wLdvY+LwwctZ3sBXCW3jegDsxS7BI5apijU3345BxNTaP+IZDfP1iRPmgq+uSjHpav7+0gzG3OhEX/WQTZa92Ad6oQw
 EWsssmO6wL7A1zGZW+OEGbhrAHhRYHMOv6WRfbmFNT9+g5cB0aJKsmhZ4F/5Mw9bvXgA2x7OkFcF2OlpT+4yjjssmi/bBzg8pzYs9kr1cuhpK1i5p/UkLNPs
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

DPHY in A100/A133 supports both LVDS and DSI. Combo phy register
have BIT(2) for enabling LVDS specifically, but enabling it alone
isn't functional.

Both MIPI and LVDS needs to be enabled in the combo phy to get
the display working under LVDS mode. There is no specific enable
bit for LVDS apart from the one in combo phy. MIPI got enable
control in analog 4 register which must be disabled when using
in LVDS mode.

Introduce set_mode in phy ops to control only for MIPI DSI.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab95271b2..d164b2ea5dfd 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -314,13 +314,11 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 	/* Disable sigma-delta modulation. */
 	regmap_write(dphy->regs, SUN50I_DPHY_PLL_REG2, 0);
 
-	regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
-			   SUN6I_DPHY_ANA4_REG_EN_MIPI,
-			   SUN6I_DPHY_ANA4_REG_EN_MIPI);
-
 	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
 			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
 			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS |
 			   SUN50I_COMBO_PHY_REG0_EN_MIPI |
 			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
 
@@ -528,6 +526,22 @@ static int sun6i_dphy_exit(struct phy *phy)
 	return 0;
 }
 
+static int sun6i_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
+
+	switch (mode) {
+	case PHY_MODE_MIPI_DPHY:
+		regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA4_REG,
+				   SUN6I_DPHY_ANA4_REG_EN_MIPI,
+				   SUN6I_DPHY_ANA4_REG_EN_MIPI);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static const struct phy_ops sun6i_dphy_ops = {
 	.configure	= sun6i_dphy_configure,
@@ -535,6 +549,7 @@ static const struct phy_ops sun6i_dphy_ops = {
 	.power_off	= sun6i_dphy_power_off,
 	.init		= sun6i_dphy_init,
 	.exit		= sun6i_dphy_exit,
+	.set_mode	= sun6i_set_mode,
 };
 
 static const struct regmap_config sun6i_dphy_regmap_config = {

-- 
2.39.5

