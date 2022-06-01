Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9A53AEA8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 00:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B321910FBF7;
	Wed,  1 Jun 2022 22:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C410F4C5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 22:08:08 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BC0E8206BB;
 Thu,  2 Jun 2022 00:08:06 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 08/11] drm/msm/dsi_phy_28nm: Replace parent names with
 clk_hw pointers
Date: Thu,  2 Jun 2022 00:07:44 +0200
Message-Id: <20220601220747.1145095-9-marijn.suijten@somainline.org>
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
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 50 ++++++++++------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 7d3cabeca743..04411fefb808 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -519,17 +519,17 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 
 static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent1[32], parent2[32], vco_name[32];
+	char clk_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref", .name = "xo",
 		},
 		.num_parents = 1,
-		.name = vco_name,
+		.name = clk_name,
 		.flags = CLK_IGNORE_UNUSED,
 	};
 	struct device *dev = &pll_28nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *analog_postdiv, *indirect_path_div2, *byte_mux;
 	int ret;
 
 	DBG("%d", pll_28nm->phy->id);
@@ -539,32 +539,30 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	else
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
 
-	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_28nm->phy->id);
 	pll_28nm->clk_hw.init = &vco_init;
 	ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
 	if (ret)
 		return ret;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent1,
-			CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
+	analog_postdiv = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_28nm->clk_hw, CLK_SET_RATE_PARENT,
+			pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
 			0, 4, 0, NULL);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	if (IS_ERR(analog_postdiv))
+		return PTR_ERR(analog_postdiv);
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
-	snprintf(parent1, sizeof(parent1), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
-			CLK_SET_RATE_PARENT, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	indirect_path_div2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, analog_postdiv, CLK_SET_RATE_PARENT, 1, 2);
+	if (IS_ERR(indirect_path_div2))
+		return PTR_ERR(indirect_path_div2);
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_28nm->phy->id);
-	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_divider(dev, clk_name, parent1, 0,
-			pll_28nm->phy->pll_base +
+	hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
+			&pll_28nm->clk_hw, 0, pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
 			0, 8, 0, NULL);
 	if (IS_ERR(hw))
@@ -572,20 +570,18 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dbyte_mux", pll_28nm->phy->id);
-	snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(parent2, sizeof(parent2), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_mux(dev, clk_name,
-			((const char *[]){
-				parent1, parent2,
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
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_28nm->phy->id);
-	snprintf(parent1, sizeof(parent1), "dsi%dbyte_mux", pll_28nm->phy->id);
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
-			CLK_SET_RATE_PARENT, 1, 4);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			byte_mux, CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
-- 
2.36.1

