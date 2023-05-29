Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD27471474A
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530BD10E26C;
	Mon, 29 May 2023 09:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A071910E264;
 Mon, 29 May 2023 09:45:04 +0000 (UTC)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at
 [217.149.172.244])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4A6A3CFC2A;
 Mon, 29 May 2023 09:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685353503; bh=XT7iHcNZUhdhe+xkApreVmOVd5PsnMSUPY7AfB+cD1I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=FG7SLk3shkRM6P4cY5S7Idb4rXYJsY59uXj+4MzH2InblW1pU3wuOw46Z92n9k70X
 UKShtL7fl4Sgzi/jotJDMCKwYB6DDBoIyb3ptQLHI9ebpHm0VdCvCuMBQuTpbkr97w
 3kuMKl0zpQ0dCFE3sUklGj+iK/RQA8I6fT7pmFPI=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 29 May 2023 11:44:03 +0200
Subject: [PATCH 6/7] drm/msm/dsi: Add phy configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v1-6-679f335d3d5b@z3ntu.xyz>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6937; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=XT7iHcNZUhdhe+xkApreVmOVd5PsnMSUPY7AfB+cD1I=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQXrCiPE8wxDZ71hNplw+HzohE6497xWqZNd
 i5Qn+8+WpKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0FwAKCRBy2EO4nU3X
 VjfcEADA55IUj24To/lUorp0tBn05QbC7G7sip6ErNO/t/S0vArFAahRtjzJmiAlp9OFUvqWdRt
 K5/yvDTzSc4zO/599mGJid+Sb/05lIPYmou0fWmNdbjijYCJ7of+e+1+ijbAeMvNWid/bz3SwJX
 4DAcYotatdXx9CupDfkiPPMAMn6ixu+GQMJybkc8Yhws9yQMLgMOYCzjA3hXoMh4V7FiR1Pd2l3
 GkmNWvmnY8N9BmAMgC5B7jPJswU97l9MrWP952j3sJI+gq9yvDMe7LtC9mCtI9CdnNrlD+GPxFQ
 L+sbGoc6GGvFiwBQUAACJP2tk0QS8oTDG0WqVwcnzsB0yAVKFBAHg47Z7cTeZ6CRl3/ifQj5csu
 31hBCCxcvpta4NxD+X9xPo9ihVlAGWCbJ9mE9EopmBPhAlzQWqNKc+kE0SCNGlsynKAwevH2Rvt
 opHfGaCMz7n+3ygNnmx/kKOiSU1xg53SztQPbUGiWGftNBQVQ5M4g+7zWlBSO13s3P08cNwMqvD
 U7UCv1hfPYy5Mwabb7OmImy21iaUbb+ocwAQ/qQR1T97rgHMHtU4a3wXHW8GQFT+oCoG1dF214K
 VKYyNsaaRepbqxnDj8REiylzPLN1+2GoM0vY82IhwNQaUDUMUVkAHeH0q5Iwq3Uxfz7KCLSEyz1
 jA1DyKN46uTlLhA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.

Worth noting that the msm-3.10 downstream kernel also will try other
sequences in case this one doesn't work, but during testing it has shown
that the _m sequence succeeds first time also:

  .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
  .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
  .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
  .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
  .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
  .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
  .pll_enable_seqs[6] = dsi_pll_enable_seq_e,

We may need to expand this in the future.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97 ++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index bb09cbe8ff86..9d5795c58a98 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -541,6 +541,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-lp",
 	  .data = &dsi_phy_28nm_lp_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-8226",
+	  .data = &dsi_phy_28nm_8226_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
 	{ .compatible = "qcom,dsi-phy-20nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7137a17ae523..8b640d174785 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -46,8 +46,9 @@ struct msm_dsi_phy_cfg {
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
-extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 4c1bf55c5f38..f71308387566 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -37,6 +37,7 @@
 
 /* v2.0.0 28nm LP implementation */
 #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
+#define DSI_PHY_28NM_QUIRK_PHY_8226	BIT(1)
 
 #define LPFR_LUT_SIZE			10
 struct lpfr_cfg {
@@ -377,6 +378,74 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
 	return ret;
 }
 
+static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
+{
+	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
+	struct device *dev = &pll_28nm->phy->pdev->dev;
+	void __iomem *base = pll_28nm->phy->pll_base;
+	u32 max_reads = 5, timeout_us = 100;
+	bool locked;
+	u32 val;
+	int i;
+
+	DBG("id=%d", pll_28nm->phy->id);
+
+	pll_28nm_software_reset(pll_28nm);
+
+	/*
+	 * PLL power up sequence.
+	 * Add necessary delays recommended by hardware.
+	 */
+	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34);
+
+	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B; // 1
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+
+	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B; // 4
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
+
+	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B; // 2
+	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE; // 8
+	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+
+	for (i = 0; i < 7; i++) {
+		/* DSI Uniphy lock detect setting */
+		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
+				0x0c, 100);
+		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
+
+		/* poll for PLL ready status */
+		locked = pll_28nm_poll_for_ready(pll_28nm,
+						max_reads, timeout_us);
+		if (locked)
+			break;
+
+		pll_28nm_software_reset(pll_28nm);
+
+		/*
+		 * PLL power up sequence.
+		 * Add necessary delays recommended by hardware.
+		 */
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00, 50);
+
+		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B; // 1
+		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B; // 4
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 100);
+
+		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B; // 2
+		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE; // 8
+		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
+	}
+
+	if (unlikely(!locked))
+		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
+	else
+		DBG("DSI PLL Lock success");
+
+	return locked ? 0 : -EINVAL;
+}
+
 static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
@@ -471,6 +540,15 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 	.is_enabled = dsi_pll_28nm_clk_is_enabled,
 };
 
+static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
+	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.set_rate = dsi_pll_28nm_clk_set_rate,
+	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
+	.prepare = dsi_pll_28nm_vco_prepare_8226,
+	.unprepare = dsi_pll_28nm_vco_unprepare,
+	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+};
+
 /*
  * PLL Callbacks
  */
@@ -536,6 +614,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 
 	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
+	else if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_8226)
+		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_8226;
 	else
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
 
@@ -820,3 +900,20 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
+	.has_phy_regulator = true,
+	.regulator_data = dsi_phy_28nm_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.pll_init = dsi_pll_28nm_init,
+		.save_pll_state = dsi_28nm_pll_save_state,
+		.restore_pll_state = dsi_28nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0xfd922b00 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
+};

-- 
2.40.1

