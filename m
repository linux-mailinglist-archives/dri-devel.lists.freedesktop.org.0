Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05BAE49E9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42E910E401;
	Mon, 23 Jun 2025 16:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ifhrRglT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129E10E401
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:10:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750695014; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EpBtJRjKcgPsO+xAJObVVmFvnI4hmdsZ6LijaICW3w0zdFpegt0k3I/wGT51x6yq9t7zXoX7sFb3yMWpHNE+rLAu2ZZjCp+N9VFX+Q4/04KiU/EsrfstavBLC9MQzFMo/b3QMwzBRvoc+e13RHmo8OoEeFd00ZASOpK3oSJJglM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750695014;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LrDqBL7o/mg/nAqIiAJ/LSWqzkg2m3/2ojuA+PZ4zkE=; 
 b=Yke2UH0sgLcdjm6t4ucqMhYEpUfHQfgnCY1vqDVFeITgfZA/sUs1RgZRk340I6Jejbq5/pXgjtH289g684o8J2aZHAELCY9xvv5ldmSWpCLm6se5G3BspfIU/bZG+gRqwJ87tvnoqoBCO23T0tPs75Dpj4AZstHKLhiuIw2w0TY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750695014; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=LrDqBL7o/mg/nAqIiAJ/LSWqzkg2m3/2ojuA+PZ4zkE=;
 b=ifhrRglTFZ2RX+hsYHYJv5VSQEYe/R1mGxnsPnU80GFRfFV+SXXAgL+bnaRD8IDJ
 XMwx3CHErJ+Z05XkEGWJF+8nIMYLmSNdyD9nVywEoYVsytQSuhHMaK3gAoItL9dGZk9
 hC/Qo/9ULp3XvQ8MVn1Ko0pBL0TX2Clu2xmUyeEg=
Received: by mx.zohomail.com with SMTPS id 17506950128651017.218237604295;
 Mon, 23 Jun 2025 09:10:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 23 Jun 2025 18:05:48 +0200
Subject: [PATCH v2 20/20] phy: rockchip-pcie: switch to FIELD_PREP_WM16 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-byeword-update-v2-20-cf1fc08a2e1f@collabora.com>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
In-Reply-To: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

The Rockchip PCIe PHY driver, used on the RK3399, has its own definition
of HIWORD_UPDATE.

Remove it, and replace instances of it with hw_bitfield.h's
FIELD_PREP_WM16. To achieve this, some mask defines are reshuffled, as
FIELD_PREP_WM16 uses the mask as both the mask of bits to write and to
derive the shift amount from in order to shift the value.

In order to ensure that the mask is always a constant, the inst->index
shift is performed after the FIELD_PREP_WM16, as this is a runtime
value.

From this, we gain compile-time error checking, and in my humble opinion
nicer code, as well as a single definition of this macro across the
entire codebase to aid in code comprehension.

Tested on a RK3399 ROCKPro64, where PCIe still works as expected when
accessing an NVMe drive.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 72 ++++++++++----------------------
 1 file changed, 21 insertions(+), 51 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index bd44af36c67a5a504801275c1b0384d373fe7ec7..d7f994c3bcdf93faffd5c04ed4d0f9d29eaf43cc 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/hw_bitfield.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -18,23 +19,14 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-/*
- * The higher 16-bit of this register is used for write protection
- * only if BIT(x + 16) set to 1 the BIT(x) can be written.
- */
-#define HIWORD_UPDATE(val, mask, shift) \
-		((val) << (shift) | (mask) << ((shift) + 16))
 
 #define PHY_MAX_LANE_NUM      4
-#define PHY_CFG_DATA_SHIFT    7
-#define PHY_CFG_ADDR_SHIFT    1
-#define PHY_CFG_DATA_MASK     0xf
-#define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
+#define PHY_CFG_DATA_MASK     GENMASK(10, 7)
+#define PHY_CFG_ADDR_MASK     GENMASK(6, 1)
+#define PHY_CFG_RD_MASK       GENMASK(9, 0)
 #define PHY_CFG_WR_ENABLE     1
 #define PHY_CFG_WR_DISABLE    1
-#define PHY_CFG_WR_SHIFT      0
-#define PHY_CFG_WR_MASK       1
+#define PHY_CFG_WR_MASK       BIT(0)
 #define PHY_CFG_PLL_LOCK      0x10
 #define PHY_CFG_CLK_TEST      0x10
 #define PHY_CFG_CLK_SCC       0x12
@@ -49,11 +41,7 @@
 #define PHY_LANE_RX_DET_SHIFT 11
 #define PHY_LANE_RX_DET_TH    0x1
 #define PHY_LANE_IDLE_OFF     0x1
-#define PHY_LANE_IDLE_MASK    0x1
-#define PHY_LANE_IDLE_A_SHIFT 3
-#define PHY_LANE_IDLE_B_SHIFT 4
-#define PHY_LANE_IDLE_C_SHIFT 5
-#define PHY_LANE_IDLE_D_SHIFT 6
+#define PHY_LANE_IDLE_MASK    BIT(3)
 
 struct rockchip_pcie_data {
 	unsigned int pcie_conf;
@@ -100,22 +88,14 @@ static inline void phy_wr_cfg(struct rockchip_pcie_phy *rk_phy,
 			      u32 addr, u32 data)
 {
 	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(data,
-				   PHY_CFG_DATA_MASK,
-				   PHY_CFG_DATA_SHIFT) |
-		     HIWORD_UPDATE(addr,
-				   PHY_CFG_ADDR_MASK,
-				   PHY_CFG_ADDR_SHIFT));
+		     FIELD_PREP_WM16(PHY_CFG_DATA_MASK, data) |
+		     FIELD_PREP_WM16(PHY_CFG_ADDR_MASK, addr));
 	udelay(1);
 	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(PHY_CFG_WR_ENABLE,
-				   PHY_CFG_WR_MASK,
-				   PHY_CFG_WR_SHIFT));
+		     FIELD_PREP_WM16(PHY_CFG_WR_MASK, PHY_CFG_WR_ENABLE));
 	udelay(1);
 	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(PHY_CFG_WR_DISABLE,
-				   PHY_CFG_WR_MASK,
-				   PHY_CFG_WR_SHIFT));
+		     FIELD_PREP_WM16(PHY_CFG_WR_MASK, PHY_CFG_WR_DISABLE));
 }
 
 static int rockchip_pcie_phy_power_off(struct phy *phy)
@@ -126,11 +106,9 @@ static int rockchip_pcie_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&rk_phy->pcie_mutex);
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_laneoff,
+		     FIELD_PREP_WM16(PHY_LANE_IDLE_MASK,
+				     PHY_LANE_IDLE_OFF) << inst->index);
 
 	if (--rk_phy->pwr_cnt) {
 		return 0;
@@ -140,11 +118,9 @@ static int rockchip_pcie_phy_power_off(struct phy *phy)
 	if (err) {
 		dev_err(&phy->dev, "assert phy_rst err %d\n", err);
 		rk_phy->pwr_cnt++;
-		regmap_write(rk_phy->reg_base,
-			     rk_phy->phy_data->pcie_laneoff,
-			     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-					   PHY_LANE_IDLE_MASK,
-					   PHY_LANE_IDLE_A_SHIFT + inst->index));
+		regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_laneoff,
+			     FIELD_PREP_WM16(PHY_LANE_IDLE_MASK,
+					     !PHY_LANE_IDLE_OFF) << inst->index);
 		return err;
 	}
 
@@ -172,15 +148,11 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 	}
 
 	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(PHY_CFG_PLL_LOCK,
-				   PHY_CFG_ADDR_MASK,
-				   PHY_CFG_ADDR_SHIFT));
+		     FIELD_PREP_WM16(PHY_CFG_ADDR_MASK, PHY_CFG_PLL_LOCK));
 
-	regmap_write(rk_phy->reg_base,
-		     rk_phy->phy_data->pcie_laneoff,
-		     HIWORD_UPDATE(!PHY_LANE_IDLE_OFF,
-				   PHY_LANE_IDLE_MASK,
-				   PHY_LANE_IDLE_A_SHIFT + inst->index));
+	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_laneoff,
+		     FIELD_PREP_WM16(PHY_LANE_IDLE_MASK,
+				     !PHY_LANE_IDLE_OFF) << inst->index);
 
 	/*
 	 * No documented timeout value for phy operation below,
@@ -211,9 +183,7 @@ static int rockchip_pcie_phy_power_on(struct phy *phy)
 	}
 
 	regmap_write(rk_phy->reg_base, rk_phy->phy_data->pcie_conf,
-		     HIWORD_UPDATE(PHY_CFG_PLL_LOCK,
-				   PHY_CFG_ADDR_MASK,
-				   PHY_CFG_ADDR_SHIFT));
+		     FIELD_PREP_WM16(PHY_CFG_ADDR_MASK, PHY_CFG_PLL_LOCK));
 
 	err = regmap_read_poll_timeout(rk_phy->reg_base,
 				       rk_phy->phy_data->pcie_status,

-- 
2.50.0

