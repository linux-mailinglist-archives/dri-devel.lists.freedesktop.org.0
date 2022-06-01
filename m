Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B79C53AEAB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 00:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4AB10FCD9;
	Wed,  1 Jun 2022 22:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECD610FC9E;
 Wed,  1 Jun 2022 22:08:11 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F2CF920603;
 Thu,  2 Jun 2022 00:08:09 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 10/11] drm/msm/dsi_phy_10nm: Replace parent names with
 clk_hw pointers
Date: Thu,  2 Jun 2022 00:07:46 +0200
Message-Id: <20220601220747.1145095-11-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601220747.1145095-1-marijn.suijten@somainline.org>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

parent_hw pointers are easier to manage and cheaper to use than
repeatedly formatting the parent name and subsequently leaving the clk
framework to perform lookups based on that name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 79 ++++++++++------------
 1 file changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 8bd7b97b1b9b..ae57f95edf63 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -574,24 +574,24 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
  */
 static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32], parent3[32], parent4[32];
+	char clk_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
 		},
 		.num_parents = 1,
-		.name = vco_name,
+		.name = clk_name,
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *pll_out_div, *pll_bit, *pll_by_2_bit;
+	struct clk_hw *pll_post_out_div, *pclk_mux;
 	int ret;
 
 	DBG("DSI%d", pll_10nm->phy->id);
 
-	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_10nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_10nm->phy->id);
 	pll_10nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_10nm->clk_hw);
@@ -599,36 +599,34 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		return ret;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT, pll_10nm->phy->pll_base +
+	pll_out_div = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_10nm->clk_hw, CLK_SET_RATE_PARENT,
+			pll_10nm->phy->pll_base +
 				REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
 			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_out_div)) {
+		ret = PTR_ERR(pll_out_div);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-			CLK_SET_RATE_PARENT,
+	pll_bit = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			pll_out_div, CLK_SET_RATE_PARENT,
 			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 			0, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	if (IS_ERR(pll_bit)) {
+		ret = PTR_ERR(pll_bit);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       CLK_SET_RATE_PARENT, 1, 8);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			pll_bit, CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -637,48 +635,43 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
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
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       0, 1, 4);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_post_out_div = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_out_div, 0, 1, 4);
+	if (IS_ERR(pll_post_out_div)) {
+		ret = PTR_ERR(pll_post_out_div);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_pclk_mux", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent2, sizeof(parent2), "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent3, sizeof(parent3), "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent4, sizeof(parent4), "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-
-	hw = devm_clk_hw_register_mux(dev, clk_name,
-			((const char *[]){
-				parent, parent2, parent3, parent4,
+
+	pclk_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
+			((const struct clk_hw *[]){
+				pll_bit,
+				pll_by_2_bit,
+				pll_out_div,
+				pll_post_out_div,
 			}), 4, 0, pll_10nm->phy->base +
-				REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-			0, 2, 0, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+				REG_DSI_10nm_PHY_CMN_CLK_CFG1, 0, 2, 0, NULL);
+	if (IS_ERR(pclk_mux)) {
+		ret = PTR_ERR(pclk_mux);
 		goto fail;
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent, 0,
-			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name, pclk_mux,
+			0, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
 			4, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
-- 
2.36.1

