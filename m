Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC3531E06
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 23:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457A810FEB9;
	Mon, 23 May 2022 21:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9710F86D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 21:39:00 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 869DC1FCB4;
 Mon, 23 May 2022 23:38:58 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 8/9] drm/msm/dsi_phy_10nm: Replace parent names with clk_hw
 pointers
Date: Mon, 23 May 2022 23:38:36 +0200
Message-Id: <20220523213837.1016542-9-marijn.suijten@somainline.org>
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
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 92 ++++++++++------------
 1 file changed, 40 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 08b015ea1b1e..178c3f70a7b2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -571,8 +571,7 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
  */
 static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32], parent3[32], parent4[32];
+	char clk_name[32], vco_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
@@ -583,7 +582,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
 	struct device *dev = &pll_10nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *pll_out_div, *pll_bit, *pll_by_2_bit;
+	struct clk_hw *pll_post_out_div, *pclk_mux;
 	int ret;

 	DBG("DSI%d", pll_10nm->phy->id);
@@ -596,39 +596,34 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		return ret;

 	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->phy->id);

-	hw = devm_clk_hw_register_divider(dev, clk_name,
-				     parent, CLK_SET_RATE_PARENT,
-				     pll_10nm->phy->pll_base +
-				     REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
-				     0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_out_div = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_10nm->clk_hw, CLK_SET_RATE_PARENT,
+			pll_10nm->phy->pll_base +
+			REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE,
+			0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
+	if (IS_ERR(pll_out_div)) {
+		ret = PTR_ERR(pll_out_div);
 		goto fail;
 	}

 	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);

 	/* BIT CLK: DIV_CTRL_3_0 */
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     CLK_SET_RATE_PARENT,
-				     pll_10nm->phy->base +
-				     REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-				     0, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_10nm->postdiv_lock);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_bit = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			pll_out_div, CLK_SET_RATE_PARENT,
+			pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+			0, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
+	if (IS_ERR(pll_bit)) {
+		ret = PTR_ERR(pll_bit);
 		goto fail;
 	}

 	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);

 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  CLK_SET_RATE_PARENT, 1, 8);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			pll_bit, CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
@@ -637,51 +632,44 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;

 	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);

-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  0, 1, 2);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_by_2_bit = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_bit, 0, 1, 2);
+	if (IS_ERR(pll_by_2_bit)) {
+		ret = PTR_ERR(pll_by_2_bit);
 		goto fail;
 	}

 	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);

-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					  0, 1, 4);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+	pll_post_out_div = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, pll_out_div, 0, 1, 4);
+	if (IS_ERR(pll_post_out_div)) {
+		ret = PTR_ERR(pll_post_out_div);
 		goto fail;
 	}

 	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
-	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
-	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
-	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
-
-	hw = devm_clk_hw_register_mux(dev, clk_name,
-				 ((const char *[]){
-				 parent, parent2, parent3, parent4
-				 }), 4, 0, pll_10nm->phy->base +
-				 REG_DSI_10nm_PHY_CMN_CLK_CFG1,
-				 0, 2, 0, NULL);
-	if (IS_ERR(hw)) {
-		ret = PTR_ERR(hw);
+
+	pclk_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
+			((const struct clk_hw *[]){
+				pll_bit,
+				pll_by_2_bit,
+				pll_out_div,
+				pll_post_out_div,
+			}), 4, 0, pll_10nm->phy->base +
+			REG_DSI_10nm_PHY_CMN_CLK_CFG1, 0, 2, 0, NULL);
+	if (IS_ERR(pclk_mux)) {
+		ret = PTR_ERR(pclk_mux);
 		goto fail;
 	}

 	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);

 	/* PIX CLK DIV : DIV_CTRL_7_4*/
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
-				     0, pll_10nm->phy->base +
-					REG_DSI_10nm_PHY_CMN_CLK_CFG0,
-				     4, 4, CLK_DIVIDER_ONE_BASED,
-				     &pll_10nm->postdiv_lock);
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name, pclk_mux,
+			0, pll_10nm->phy->base + REG_DSI_10nm_PHY_CMN_CLK_CFG0,
+			4, 4, CLK_DIVIDER_ONE_BASED, &pll_10nm->postdiv_lock);
 	if (IS_ERR(hw)) {
 		ret = PTR_ERR(hw);
 		goto fail;
--
2.36.1

