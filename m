Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D12F53AEAA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 00:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6D410FCDD;
	Wed,  1 Jun 2022 22:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564E910FC2E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 22:08:10 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5BD06206BE;
 Thu,  2 Jun 2022 00:08:08 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 09/11] drm/msm/dsi_phy_14nm: Replace parent names with
 clk_hw pointers
Date: Thu,  2 Jun 2022 00:07:45 +0200
Message-Id: <20220601220747.1145095-10-marijn.suijten@somainline.org>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 40 ++++++++++------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index e10ba1b09b2f..1a855351654c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -764,14 +764,14 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 
 static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 						const char *name,
-						const char *parent_name,
+						const struct clk_hw *parent_hw,
 						unsigned long flags,
 						u8 shift)
 {
 	struct dsi_pll_14nm_postdiv *pll_postdiv;
 	struct device *dev = &pll_14nm->phy->pdev->dev;
 	struct clk_init_data postdiv_init = {
-		.parent_names = (const char *[]) { parent_name },
+		.parent_hws = (const struct clk_hw *[]) { parent_hw },
 		.num_parents = 1,
 		.name = name,
 		.flags = flags,
@@ -800,23 +800,23 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 
 static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **provided_clocks)
 {
-	char clk_name[32], parent[32], vco_name[32];
+	char clk_name[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
 		},
 		.num_parents = 1,
-		.name = vco_name,
+		.name = clk_name,
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_14nm_vco,
 	};
 	struct device *dev = &pll_14nm->phy->pdev->dev;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *n1_postdiv, *n1_postdivby2;
 	int ret;
 
 	DBG("DSI%d", pll_14nm->phy->id);
 
-	snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_14nm->phy->id);
+	snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_14nm->phy->id);
 	pll_14nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_14nm->clk_hw);
@@ -824,48 +824,46 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 		return ret;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dvco_clk", pll_14nm->phy->id);
 
 	/* N1 postdiv, bits 0-3 in REG_DSI_14nm_PHY_CMN_CLK_CFG0 */
-	hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent,
-				       CLK_SET_RATE_PARENT, 0);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	n1_postdiv = pll_14nm_postdiv_register(pll_14nm, clk_name,
+			&pll_14nm->clk_hw, CLK_SET_RATE_PARENT, 0);
+	if (IS_ERR(n1_postdiv))
+		return PTR_ERR(n1_postdiv);
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_14nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / N1 / 8 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
-					       CLK_SET_RATE_PARENT, 1, 8);
+	hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
+			n1_postdiv, CLK_SET_RATE_PARENT, 1, 8);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/*
 	 * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
 	 * on the way. Don't let it set parent.
 	 */
-	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 2);
-	if (IS_ERR(hw))
-		return PTR_ERR(hw);
+	n1_postdivby2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+			clk_name, n1_postdiv, 0, 1, 2);
+	if (IS_ERR(n1_postdivby2))
+		return PTR_ERR(n1_postdivby2);
 
 	snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_14nm->phy->id);
-	snprintf(parent, sizeof(parent), "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
 
 	/* DSI pixel clock = VCO_CLK / N1 / 2 / N2
 	 * This is the output of N2 post-divider, bits 4-7 in
 	 * REG_DSI_14nm_PHY_CMN_CLK_CFG0. Don't let it set parent.
 	 */
-	hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent, 0, 4);
+	hw = pll_14nm_postdiv_register(pll_14nm, clk_name, n1_postdivby2,
+			0, 4);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	provided_clocks[DSI_PIXEL_PLL_CLK]	= hw;
+	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
 	return 0;
 }
-- 
2.36.1

