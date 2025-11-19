Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21BC6C60E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 03:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B08310E553;
	Wed, 19 Nov 2025 02:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1262110E553
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 02:28:23 +0000 (UTC)
X-CSE-ConnectionGUID: o2CN+d/kR0StlIA3dH2OoA==
X-CSE-MsgGUID: 1kfjl6oiRbCPNxaK1nM7Sg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2025 11:28:23 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id E47E340CCF88;
 Wed, 19 Nov 2025 11:28:19 +0900 (JST)
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
Subject: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
Date: Tue, 18 Nov 2025 21:27:43 -0500
Message-ID: <20251119022744.1599235-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251119022744.1599235-1-chris.brandt@renesas.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

---
v1->v2:
- Remove unnecessary parentheses
- Add target argument to new API
- DPI mode has more restrictions on DIV_A and DIV_B

v2->v3:
- Removed Empty lines (Hugo)
- Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
- Renamed label found_dsi_div to calc_pll_clk (Hugo)
- Renamed label found_clk to clk_valid (Hugo)
- Removed 'found' var because not needed
- Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
- Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
- Convert #define macros PLL5_TARGET_* to enum (Geert)
- static {unsigned} int dsi_div_ab; (Geert)
- {unsigned} int a, b;  (Geert)
- Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
- Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
- Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
- Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
- void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
- Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
- Added Reviewed-by and Tested-by (Biju)

v3->v4:
- Changed <,> to <=,>=  (Hugo)
- Removed duplicate code bock (copy/paste mistake) (Hugo)
- Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=n (Geert)
- Removed comment "Below conditions must be set.." (Hugo)
- Removed +1,-1 from pl5_intin comparison math because it was not correct
- Removed default register settings (PLL5_xxx_DEF) because makes no sense
- If any calcualtion error, print a message and return a rate of 0
- Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
- Check the range of hsclk
- The correct clock parent is determined by if the divider is even/odd
- Add in all the restrictions from DIV A,B from the hardware manual
- No more need to be a recursive function
- DPI settings must have DSI_DIV_B be '0' (divide 1/1)

v4->v5:
- Change dsi_div_ab_desired to u8 (Hugo)
- Create the helper function rzg2l_cpg_div_ab (Hugo)
- Remove odd/even comments because implied (Hugo)
- Change continue to break for the for loop (Hugo)
- Change if{} if{} to if{} else if{} (Hugo)
- Remove function rzg2l_cpg_get_vclk_rate (Chris)
- Set default clksrc,div_a,b using set_divider function (Biju)
- Return -EINVAL if rzg2l_cpg_dsi_div_determine_rate fails (Hugo)
---
 drivers/clk/renesas/rzg2l-cpg.c | 162 ++++++++++++++++++++++++++------
 include/linux/clk/renesas.h     |  12 +++
 2 files changed, 146 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 6743e50d44d0..69a96fa5a272 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -74,6 +74,17 @@
 #define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
 #define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
 
+#define PLL5_FOUTVCO_MIN	800000000
+#define PLL5_FOUTVCO_MAX	3000000000
+#define PLL5_POSTDIV_MIN	1
+#define PLL5_POSTDIV_MAX	7
+#define PLL5_REFDIV_MIN		1
+#define PLL5_REFDIV_MAX		2
+#define PLL5_INTIN_MIN		20
+#define PLL5_INTIN_MAX		320
+#define PLL5_HSCLK_MIN		10000000
+#define PLL5_HSCLK_MAX		187500000
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -129,6 +140,12 @@ struct rzg2l_pll5_param {
 	u8 pl5_spread;
 };
 
+/* PLL5 output will be used for DPI or MIPI-DSI */
+static int dsi_div_target = PLL5_TARGET_DPI;
+
+/* Required division ratio for MIPI D-PHY clock depending on number of lanes and bpp. */
+static u8 dsi_div_ab_desired;
+
 struct rzg2l_pll5_mux_dsi_div_param {
 	u8 clksrc;
 	u8 dsi_div_a;
@@ -170,6 +187,11 @@ struct rzg2l_cpg_priv {
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
 };
 
+static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
+{
+	return (b + 1) << a;
+}
+
 static void rzg2l_cpg_del_clk_provider(void *data)
 {
 	of_clk_del_provider(data);
@@ -557,16 +579,108 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 }
 
 static unsigned long
-rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
+rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
+			       struct rzg2l_pll5_param *params,
 			       unsigned long rate)
 {
 	unsigned long foutpostdiv_rate, foutvco_rate;
+	unsigned long hsclk;
+	unsigned int a, b, odd;
+	unsigned int dsi_div_ab_calc;
+
+	if (dsi_div_target == PLL5_TARGET_DSI) {
+		/*
+		 * VCO-->[POSTDIV1,2]--FOUTPOSTDIV-->|   |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
+		 *            |                      |-->|
+		 *            |-->[1/2]---FOUT1PH0-->|   |-->[1/16]---------------> hsclk (MIPI-PHY)
+		 */
+
+		/* Check hsclk */
+		hsclk = rate * dsi_div_ab_desired / 16;
+		if (hsclk < PLL5_HSCLK_MIN || hsclk > PLL5_HSCLK_MAX) {
+			dev_err(priv->dev, "hsclk out of range\n");
+			return 0;
+		}
+
+		/* Determine the correct clock source based on even/odd of the divider */
+		odd = dsi_div_ab_desired & 1;
+		if (odd) {
+			priv->mux_dsi_div_params.clksrc = 0;	/* FOUTPOSTDIV */
+			dsi_div_ab_calc = dsi_div_ab_desired;
+		} else {
+			priv->mux_dsi_div_params.clksrc = 1;	/*  FOUT1PH0 */
+			dsi_div_ab_calc = dsi_div_ab_desired / 2;
+		}
+
+		/* Calculate the DIV_DSI_A and DIV_DSI_B based on the desired divider */
+		for (a = 0; a < 4; a++) {
+			/* FOUT1PH0: Max output of DIV_DSI_A is 750MHz so at least 1/2 to be safe */
+			if (!odd && a == 0)
+				continue;
+
+			/* FOUTPOSTDIV: DIV_DSI_A must always be 1/1 */
+			if (odd && a != 0)
+				break;
+
+			for (b = 0; b < 16; b++) {
+				/* FOUTPOSTDIV: DIV_DSI_B must always be odd divider 1/(b+1) */
+				if (odd && b & 1)
+					continue;
+
+				if (rzg2l_cpg_div_ab(a, b) == dsi_div_ab_calc) {
+					priv->mux_dsi_div_params.dsi_div_a = a;
+					priv->mux_dsi_div_params.dsi_div_b = b;
+					goto calc_pll_clk;
+				}
+			}
+		}
+
+		dev_err(priv->dev, "Failed to calculate DIV_DSI_A,B\n");
+
+		return 0;
+	} else if (dsi_div_target == PLL5_TARGET_DPI) {
+		/* Fixed settings for DPI */
+		priv->mux_dsi_div_params.clksrc = 0;
+		priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
+		priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
+		dsi_div_ab_desired = 8;			/* (1 << a) * (b + 1) */
+	}
+
+calc_pll_clk:
+	/* PLL5 (MIPI_DSI_PLLCLK) = VCO / POSTDIV1 / POSTDIV2 */
+	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
+	     params->pl5_postdiv1 <= PLL5_POSTDIV_MAX;
+	     params->pl5_postdiv1++) {
+		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
+		     params->pl5_postdiv2 <= PLL5_POSTDIV_MAX;
+		     params->pl5_postdiv2++) {
+			foutvco_rate = rate * params->pl5_postdiv1 * params->pl5_postdiv2 *
+				       dsi_div_ab_desired;
+			if (foutvco_rate <= PLL5_FOUTVCO_MIN || foutvco_rate >= PLL5_FOUTVCO_MAX)
+				continue;
+
+			for (params->pl5_refdiv = PLL5_REFDIV_MIN;
+			     params->pl5_refdiv <= PLL5_REFDIV_MAX;
+			     params->pl5_refdiv++) {
+				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
+						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				if (params->pl5_intin < PLL5_INTIN_MIN ||
+				    params->pl5_intin > PLL5_INTIN_MAX)
+					continue;
+
+				params->pl5_fracin = div_u64(((u64)
+						     (foutvco_rate * params->pl5_refdiv) %
+						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
+						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+				goto clk_valid;
+			}
+		}
+	}
 
-	params->pl5_intin = rate / MEGA;
-	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
-	params->pl5_refdiv = 2;
-	params->pl5_postdiv1 = 1;
-	params->pl5_postdiv2 = 1;
+	dev_err(priv->dev, "Failed to calculate PLL5 settings\n");
+	return 0;
+
+clk_valid:
 	params->pl5_spread = 0x16;
 
 	foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
@@ -607,7 +721,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
 	struct rzg2l_pll5_param params;
 	unsigned long parent_rate;
 
-	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
+	parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
 
 	if (priv->mux_dsi_div_params.clksrc)
 		parent_rate /= 2;
@@ -623,9 +737,19 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
 
 	req->best_parent_rate = rzg2l_cpg_get_vclk_parent_rate(hw, req->rate);
 
+	if (!req->best_parent_rate)
+		return -EINVAL;
+
 	return 0;
 }
 
+void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target)
+{
+	dsi_div_ab_desired = divider;
+	dsi_div_target = target;
+}
+EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
+
 static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
 				      unsigned long rate,
 				      unsigned long parent_rate)
@@ -796,22 +920,6 @@ struct sipll5 {
 
 #define to_sipll5(_hw)	container_of(_hw, struct sipll5, hw)
 
-static unsigned long rzg2l_cpg_get_vclk_rate(struct clk_hw *hw,
-					     unsigned long rate)
-{
-	struct sipll5 *sipll5 = to_sipll5(hw);
-	struct rzg2l_cpg_priv *priv = sipll5->priv;
-	unsigned long vclk;
-
-	vclk = rate / ((1 << priv->mux_dsi_div_params.dsi_div_a) *
-		       (priv->mux_dsi_div_params.dsi_div_b + 1));
-
-	if (priv->mux_dsi_div_params.clksrc)
-		vclk /= 2;
-
-	return vclk;
-}
-
 static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
@@ -856,9 +964,9 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 	if (!rate)
 		return -EINVAL;
 
-	vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
+	vclk_rate = rate / dsi_div_ab_desired;
 	sipll5->foutpostdiv_rate =
-		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
+		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
 
 	/* Put PLL5 into standby mode */
 	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
@@ -945,9 +1053,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
-	priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
-	priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
+	rzg2l_cpg_dsi_div_set_divider(8, PLL5_TARGET_DPI);
 
 	return clk_hw->clk;
 }
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0ebbe2f0b45e..96c5e8f3b5d7 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -16,6 +16,11 @@ struct device;
 struct device_node;
 struct generic_pm_domain;
 
+enum {
+	PLL5_TARGET_DPI,
+	PLL5_TARGET_DSI
+};
+
 void cpg_mstp_add_clk_domain(struct device_node *np);
 #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
@@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 #define cpg_mssr_attach_dev	NULL
 #define cpg_mssr_detach_dev	NULL
 #endif
+
+#ifdef CONFIG_CLK_RZG2L
+void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
+#else
+static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
+#endif
+
 #endif
-- 
2.50.1

