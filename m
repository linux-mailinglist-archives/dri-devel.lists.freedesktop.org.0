Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFAB55155
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1852510EC75;
	Fri, 12 Sep 2025 14:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58EB010EC75
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:27:04 +0000 (UTC)
X-CSE-ConnectionGUID: 1gmEnLCtRIGsmMcoTxwvew==
X-CSE-MsgGUID: W/FYsS4AQ4yyWl/U2FVuWw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2025 23:22:01 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 22E41400D4EF;
 Fri, 12 Sep 2025 23:21:56 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
Date: Fri, 12 Sep 2025 10:20:55 -0400
Message-ID: <20250912142056.2123725-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912142056.2123725-1-chris.brandt@renesas.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the limited MIPI clock calculations to a full range of settings
based on math including H/W limitation validation.
Since the required DSI division setting must be specified from external
sources before calculations, expose a new API to set it.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

---
v1->v2:
- Remove unnecessary parentheses
- Add target argument to new API
- DPI mode has more restrictions on DIV_A and DIV_B
---
 drivers/clk/renesas/rzg2l-cpg.c | 129 +++++++++++++++++++++++++++++---
 include/linux/clk/renesas.h     |   4 +
 2 files changed, 123 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 187233302818..33d799a2e8ac 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -74,6 +74,22 @@
 #define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
 #define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
 
+#define PLL5_FOUTVCO_MIN	800000000
+#define PLL5_FOUTVCO_MAX	3000000000
+#define PLL5_POSTDIV_MIN	1
+#define PLL5_POSTDIV_MAX	7
+#define PLL5_POSTDIV_DEF	1
+#define PLL5_REFDIV_MIN		1
+#define PLL5_REFDIV_MAX		2
+#define PLL5_REFDIV_DEF		1
+#define PLL5_INTIN_MIN		20
+#define PLL5_INTIN_MAX		320
+#define PLL5_INTIN_DEF		125
+#define PLL5_FRACIN_DEF		0
+
+#define PLL5_TARGET_DPI		0
+#define PLL5_TARGET_DSI		1
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
 	u8 pl5_spread;
 };
 
+/* PLL5 output will be used for DPI or MIPI-DSI */
+static int dsi_div_target = PLL5_TARGET_DPI;
+
+/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
+static int dsi_div_ab;
+
 struct rzg2l_pll5_mux_dsi_div_param {
 	u8 clksrc;
 	u8 dsi_div_a;
@@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 }
 
 static unsigned long
-rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
+rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
+			       struct rzg2l_pll5_param *params,
 			       unsigned long rate)
 {
 	unsigned long foutpostdiv_rate, foutvco_rate;
+	u8 div = 1;
+	bool found = 0;
+	int a, b;
+
+	if (priv->mux_dsi_div_params.clksrc)
+		div = 2;
+
+	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
+	for (a = 0; a < 4; a++) {
+
+		if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
+			continue;	/* 1/1 div not supported for DIV_DSI_A for DPI */
+
+		for (b = 0; b < 16; b++) {
+
+			if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
+				continue;	/* Only 1/1 div supported for DIV_DSI_B in DPI */
+
+			if (((1 << a) * (b + 1)) == dsi_div_ab) {
+				priv->mux_dsi_div_params.dsi_div_a = a;
+				priv->mux_dsi_div_params.dsi_div_b = b;
+
+				goto found_dsi_div;
+			}
+		}
+	}
+
+found_dsi_div:
+	/*
+	 * Below conditions must be set for PLL5 parameters:
+	 * - REFDIV must be between 1 and 2.
+	 * - POSTDIV1/2 must be between 1 and 7.
+	 * - INTIN must be between 20 and 320.
+	 * - FOUTVCO must be between 800MHz and 3000MHz.
+	 */
+	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
+	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
+	     params->pl5_postdiv1++) {
+		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
+		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
+		     params->pl5_postdiv2++) {
+			foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *
+					       (priv->mux_dsi_div_params.dsi_div_b + 1)) *
+					      div * params->pl5_postdiv1 * params->pl5_postdiv2;
+			if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
+			    foutvco_rate > PLL5_FOUTVCO_MAX - 1)
+				continue;
+
+			for (params->pl5_refdiv = PLL5_REFDIV_MIN;
+			     params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
+			     params->pl5_refdiv++) {
+				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
+						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
+				    params->pl5_intin > PLL5_INTIN_MAX - 1)
+					continue;
+				params->pl5_fracin = div_u64(((u64)
+						     (foutvco_rate * params->pl5_refdiv) %
+						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
+						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				found = 1;
+				goto found_clk;
+			}
+		}
+	}
+
+found_clk:
+	if (!found) {
+		params->pl5_intin = PLL5_INTIN_DEF;
+		params->pl5_fracin = PLL5_FRACIN_DEF;
+		params->pl5_refdiv = PLL5_REFDIV_DEF;
+		params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
+		params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
+	}
 
-	params->pl5_intin = rate / MEGA;
-	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
-	params->pl5_refdiv = 2;
-	params->pl5_postdiv1 = 1;
-	params->pl5_postdiv2 = 1;
 	params->pl5_spread = 0x16;
 
 	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
-					   (params->pl5_intin << 24) + params->pl5_fracin),
-			       params->pl5_refdiv) >> 24;
+		       (params->pl5_intin << 24) + params->pl5_fracin),
+		       params->pl5_refdiv) >> 24;
 	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
 						 params->pl5_postdiv1 * params->pl5_postdiv2);
 
+	/* If foutvco is above 1.5GHz, change parent and recalculate */
+	if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
+		priv->mux_dsi_div_params.clksrc = 0;
+		dsi_div_ab *= 2;
+		dsi_div_target = PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
+		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
+	}
+
 	return foutpostdiv_rate;
 }
 
@@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
 	struct rzg2l_pll5_param params;
 	unsigned long parent_rate;
 
-	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
+	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
 
 	if (priv->mux_dsi_div_params.clksrc)
 		parent_rate /= 2;
@@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+void rzg2l_cpg_dsi_div_set_divider(int divider, int target)
+{
+	dsi_div_ab = divider;
+	dsi_div_target = target;
+}
+EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
+
 static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
 				      unsigned long rate,
 				      unsigned long parent_rate)
@@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
 	sipll5->foutpostdiv_rate =
-		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
+		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
 
 	/* Put PLL5 into standby mode */
 	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
@@ -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
 	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
 	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
+	dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
+		     (priv->mux_dsi_div_params.dsi_div_b + 1);
 
 	return clk_hw->clk;
 }
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0ebbe2f0b45e..0cdbd3922cf4 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 #define cpg_mssr_detach_dev	NULL
 #endif
 #endif
+
+#ifdef CONFIG_CLK_RZG2L
+void rzg2l_cpg_dsi_div_set_divider(int divider, int target);
+#endif
-- 
2.50.1

