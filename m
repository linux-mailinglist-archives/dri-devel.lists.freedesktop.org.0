Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE274560C9B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 00:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132F10F0EF;
	Wed, 29 Jun 2022 22:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474210F0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 22:53:56 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E6DC73F809;
 Thu, 30 Jun 2022 00:53:54 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 11/11] drm/msm/dsi_phy_7nm: Replace parent names with
 clk_hw pointers
Date: Thu, 30 Jun 2022 00:53:31 +0200
Message-Id: <20220629225331.357308-12-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629225331.357308-1-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
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
 Jami Kettunen <jami.kettunen@somainline.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

parent_hw pointers are easier to manage and cheaper to use than
repeatedly formatting the parent name and subsequently leaving the clk
framework to perform lookups based on that name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 70 +++++++++++------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6a58dd62bac5..c1710a8824e7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -588,24 +588,24 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
  */
 static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32];
+	char clk_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
 		},
 		.num_parents = 1,
-		.name = vco_name,
+		.name = clk_name,
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_7nm_vco,
 	};
 	struct device *dev = &pll_7nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *pll_out_div, *pll_bit, *pll_by_2_bit;
+	struct clk_hw *pll_post_out_div, *phy_pll_out_dsi_parent;
 	int ret;
 
 	DBG("DSI%d", pll_7nm->phy->id);
 
-	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_7nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_7nm->phy->id);
 	pll_7nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_7nm->clk_hw);
@@ -613,36 +613,34 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		return ret;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_7nm->phy->id);
 
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT, pll_7nm->phy->pll_base +
+	pll_out_div = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_7nm->clk_hw, CLK_SET_RATE_PARENT,
+			pll_7nm->phy->pll_base +
 				REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE,
 			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_out_div)) {
+		ret = PTR_ERR(pll_out_div);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT,
+	pll_bit = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			pll_out_div, CLK_SET_RATE_PARENT,
 			pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 			0, 4, CLK_DIVIDER_ONE_BASED, &pll_7nm->postdiv_lock);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_bit)) {
+		ret = PTR_ERR(pll_bit);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_byteclk", pll_7nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT, 1,
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			pll_bit, CLK_SET_RATE_PARENT, 1,
 			pll_7nm->phy->cphy_mode ? 7 : 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
@@ -652,24 +650,24 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       0, 1, 2);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_by_2_bit = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_bit, 0, 1, 2);
+	if (IS_ERR(pll_by_2_bit)) {
+		ret = PTR_ERR(pll_by_2_bit);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	if (pll_7nm->phy->cphy_mode)
-		hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 2, 7);
+		pll_post_out_div = devm_clk_hw_register_fixed_factor_parent_hw(
+				dev, clk_name, pll_out_div, 0, 2, 7);
 	else
-		hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 4);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+		pll_post_out_div = devm_clk_hw_register_fixed_factor_parent_hw(
+				dev, clk_name, pll_out_div, 0, 1, 4);
+	if (IS_ERR(pll_post_out_div)) {
+		ret = PTR_ERR(pll_post_out_div);
 		goto fail;
 	}
 
@@ -682,15 +680,14 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		data = dsi_phy_read(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 		dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data | 3);
 
-		snprintf(parent, sizeof(parent), "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
+		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
 		snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_7nm->phy->id);
-		snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_7nm->phy->id);
-		snprintf(parent2, sizeof(parent2), "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
 
-		hw = devm_clk_hw_register_mux(dev, clk_name,
-				((const char *[]){
-					parent, parent2,
+		hw = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
+				((const struct clk_hw *[]){
+					pll_bit,
+					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
 				0, 1, 0, NULL);
@@ -699,13 +696,14 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 			goto fail;
 		}
 
-		snprintf(parent, sizeof(parent), "dsi%d_pclk_mux", pll_7nm->phy->id);
+		phy_pll_out_dsi_parent = hw;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			phy_pll_out_dsi_parent, 0,
 			pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0,
 			4, 4, CLK_DIVIDER_ONE_BASED, &pll_7nm->postdiv_lock);
 	if (IS_ERR(hw)) {
-- 
2.37.0

