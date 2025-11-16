Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFAC616AD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 15:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCDA10E176;
	Sun, 16 Nov 2025 14:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="Xgw8aqaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CE710E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8V4nIdRTsVNfqeRyMcs/OXoQRXmzx7mrofUYormx1Zs=; b=Xgw8aqaZqqgN9PY9j6BC1iYFpp
 TBtq0vO9kIDFWaSx9G6cogCY7h1MHaSbsMyIs08GJsCPaQve4pSEkAaa1/jqGWzMuzMkia4BQ1GPs
 UWdIxZvp2l/WXeW/rwNB/v79q6KJYXFqf3+6nz9c63h2qwbzIalynifp9zu6bACFzP8h+vuobj5sl
 rlWHri4K48za7X2Ge4NKkVa9rDQ/3bpyKRhEpofr54z6t6seYLWZiF0s+9mMN5v5/uyZbt9s6wC0F
 RVjsHGHYHFURdrKlC5si58dMJeCyzUGOOY8UlzMuirK4KVmMP9N8DLvBDraRPshXEFMHfRit+AKLM
 I77jXjsw==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <kuba@szczodrzynski.pl>)
 id 1vKcgO-0000000FW4E-1MP7; Sun, 16 Nov 2025 14:20:44 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: [PATCH v2 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in
 combo D-PHY
Date: Sun, 16 Nov 2025 14:18:48 +0100
Message-Id: <20251116131853.440863-2-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116131853.440863-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116131853.440863-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
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

Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
MIPI DSI D-PHY" which is required when using single-link LVDS0.

In this mode, the DSI peripheral is not used and the PHY is not
configured for DSI. Instead, the COMBO_PHY_REGx registers are set to
enable LVDS operation.

Enable the PHY driver to work in LVDS mode on chips with a combo D-PHY.

Also change the SUN50I_COMBO_PHY_REG1 macro names to reflect the correct
register name.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 70 ++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab9527..57035b3a4 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -166,8 +166,8 @@
 #define SUN50I_COMBO_PHY_REG0_EN_CP		BIT(0)
 
 #define SUN50I_COMBO_PHY_REG1		0x114
-#define SUN50I_COMBO_PHY_REG2_REG_VREF1P6(n)	(((n) & 0x7) << 4)
-#define SUN50I_COMBO_PHY_REG2_REG_VREF0P8(n)	((n) & 0x7)
+#define SUN50I_COMBO_PHY_REG1_REG_VREF1P6(n)	(((n) & 0x7) << 4)
+#define SUN50I_COMBO_PHY_REG1_REG_VREF0P8(n)	((n) & 0x7)
 
 #define SUN50I_COMBO_PHY_REG2		0x118
 #define SUN50I_COMBO_PHY_REG2_HS_STOP_DLY(n)	((n) & 0xff)
@@ -181,7 +181,9 @@ struct sun6i_dphy;
 
 struct sun6i_dphy_variant {
 	void	(*tx_power_on)(struct sun6i_dphy *dphy);
+	void	(*lvds_power_on)(struct sun6i_dphy *dphy);
 	bool	rx_supported;
+	bool	is_combo_dphy;
 };
 
 struct sun6i_dphy {
@@ -222,6 +224,18 @@ static int sun6i_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	return 0;
 }
 
+static int sun6i_dphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
+
+	if (mode == PHY_MODE_LVDS && !dphy->variant->is_combo_dphy) {
+		/* Not a combo D-PHY: LVDS is not supported. */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void sun6i_a31_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 {
 	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
@@ -329,6 +343,43 @@ static void sun50i_a100_mipi_dphy_tx_power_on(struct sun6i_dphy *dphy)
 	udelay(1);
 }
 
+static void sun50i_a100_mipi_dphy_lvds_power_on(struct sun6i_dphy *dphy)
+{
+	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1,
+		     SUN50I_COMBO_PHY_REG1_REG_VREF1P6(4) |
+		     SUN50I_COMBO_PHY_REG1_REG_VREF0P8(3));
+
+	regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0,
+		     SUN50I_COMBO_PHY_REG0_EN_CP);
+	udelay(5);
+
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS,
+			   SUN50I_COMBO_PHY_REG0_EN_LVDS);
+	udelay(5);
+
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO,
+			   SUN50I_COMBO_PHY_REG0_EN_COMBOLDO);
+	udelay(5);
+
+	regmap_update_bits(dphy->regs, SUN50I_COMBO_PHY_REG0,
+			   SUN50I_COMBO_PHY_REG0_EN_MIPI,
+			   SUN50I_COMBO_PHY_REG0_EN_MIPI);
+
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
+		     SUN6I_DPHY_ANA4_REG_EN_MIPI |
+		     SUN6I_DPHY_ANA4_REG_IB(2));
+
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
+		     SUN6I_DPHY_ANA3_EN_LDOR |
+		     SUN6I_DPHY_ANA3_EN_LDOD);
+
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG, 0);
+
+	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG, 0);
+}
+
 static int sun6i_dphy_tx_power_on(struct sun6i_dphy *dphy)
 {
 	u8 lanes_mask = GENMASK(dphy->config.lanes - 1, 0);
@@ -492,6 +543,13 @@ static int sun6i_dphy_power_on(struct phy *phy)
 {
 	struct sun6i_dphy *dphy = phy_get_drvdata(phy);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {
+		if (!dphy->variant->lvds_power_on)
+			return -EINVAL;
+		dphy->variant->lvds_power_on(dphy);
+		return 0;
+	}
+
 	switch (dphy->direction) {
 	case SUN6I_DPHY_DIRECTION_TX:
 		return sun6i_dphy_tx_power_on(dphy);
@@ -514,6 +572,11 @@ static int sun6i_dphy_power_off(struct phy *phy)
 	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG, 0);
 	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG, 0);
 
+	if (phy->attrs.mode == PHY_MODE_LVDS && dphy->variant->is_combo_dphy) {
+		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG1, 0);
+		regmap_write(dphy->regs, SUN50I_COMBO_PHY_REG0, 0);
+	}
+
 	return 0;
 }
 
@@ -533,6 +596,7 @@ static const struct phy_ops sun6i_dphy_ops = {
 	.configure	= sun6i_dphy_configure,
 	.power_on	= sun6i_dphy_power_on,
 	.power_off	= sun6i_dphy_power_off,
+	.set_mode	= sun6i_dphy_set_mode,
 	.init		= sun6i_dphy_init,
 	.exit		= sun6i_dphy_exit,
 };
@@ -619,6 +683,8 @@ static const struct sun6i_dphy_variant sun6i_a31_mipi_dphy_variant = {
 
 static const struct sun6i_dphy_variant sun50i_a100_mipi_dphy_variant = {
 	.tx_power_on	= sun50i_a100_mipi_dphy_tx_power_on,
+	.lvds_power_on	= sun50i_a100_mipi_dphy_lvds_power_on,
+	.is_combo_dphy	= true,
 };
 
 static const struct of_device_id sun6i_dphy_of_table[] = {
-- 
2.25.1

