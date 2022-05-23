Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D5531E09
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 23:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6A10FDC7;
	Mon, 23 May 2022 21:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3A10F610
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 21:38:53 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D742A20531;
 Mon, 23 May 2022 23:38:51 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 4/9] drm/msm/dsi_phy_28nm: Replace parent names with clk_hw
 pointers
Date: Mon, 23 May 2022 23:38:32 +0200
Message-Id: <20220523213837.1016542-5-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523213837.1016542-1-marijn.suijten@somainline.org>
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Arnd Bergmann <arnd@arndb.de>, Jami Kettunen <jami.kettunen@somainline.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

parent_hw pointers are easier to manage and cheaper to use than
repeatedly formatting the parent name and subsequently leaving the clk
framework to perform lookups based on that name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 52 +++++++++-------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 48eab80b548e..6926c8ff6255 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -519,7 +519,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)

 static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent1[32], parent2[32], vco_name[32];
+	char clk_name[32], vco_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref", .name = "xo",
@@ -529,7 +529,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		.flags = CLK_IGNORE_UNUSED,
 	};
 	struct device *dev = &pll_28nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *analog_postdiv, *indirect_path_div2, *byte_mux;
 	int ret;

 	DBG("%d", pll_28nm->phy->id);
@@ -546,48 +546,40 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return ret;

 	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-			parent1, CLK_SET_RATE_PARENT,
+	analog_postdiv = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_28nm->clk_hw, CLK_SET_RATE_PARENT,
 			pll_28nm->phy->pll_base +
-			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
-			0, 4, 0, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+			REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG, 0, 4, 0, NULL);
+	if (IS_ERR(analog_postdiv))
+		return PTR_ERR(analog_postdiv);

 	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
-			parent1, CLK_SET_RATE_PARENT,
-			1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	indirect_path_div2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, analog_postdiv, CLK_SET_RATE_PARENT, 1, 2);
+	if (IS_ERR(indirect_path_div2))
+		return PTR_ERR(indirect_path_div2);

 	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				parent1, 0, pll_28nm->phy->pll_base +
-				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
-				0, 8, 0, NULL);
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_28nm->clk_hw, 0, pll_28nm->phy->pll_base +
+			REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG, 0, 8, 0, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;

 	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_mux(dev, clk_name,
-			((const char *[]){
-				parent1, parent2
+	byte_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
+			((const struct clk_hw *[]){
+				&pll_28nm->clk_hw,
+				indirect_path_div2,
 			}), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
 			REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(byte_mux))
+		return PTR_ERR(byte_mux);

 	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
-	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
-				parent1, CLK_SET_RATE_PARENT, 1, 4);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			byte_mux, CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
--
2.36.1

