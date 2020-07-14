Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674C921FF39
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688B26E9CD;
	Tue, 14 Jul 2020 20:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C1E6E990;
 Tue, 14 Jul 2020 20:58:26 +0000 (UTC)
IronPort-SDR: 00vsJKy856z7wpzISvJHf6ixmJKEyEf1WT+DfCuh2H0VwGYLMugcMf0TNheuRoGoJDq09O9k0V
 HOUfmiMxCK/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444560"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:26 -0700
IronPort-SDR: 3m3NiL7DO2AQYcB9AHXavoXEDLZfjTGz/WNGSF1KDLMg2fEJhYGbZF9uxWAGdY3sNlx3xIJBB/
 XT/+FDdTbwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504114"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:26 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 16/59] drm/kmb: Part6 of Mipi Tx Initialization
Date: Tue, 14 Jul 2020 13:57:02 -0700
Message-Id: <1594760265-11618-17-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is part2 of DPHY initialization- sets up DPHY PLLs.

v2: simplified mipi_tx_get_vco_params() based on review
v3: added WARN_ON for invalid freq
v4: fixed bug in mipi_tx_get_vco_params

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c  | 194 +++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/kmb/kmb_regs.h |   2 +
 2 files changed, 189 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index d15cf6f..02555c6 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -28,11 +28,33 @@
 #define MIPI_TX_CFG_CLK_KHZ         24000
 
 /*DPHY Tx test codes*/
-#define TEST_CODE_HS_FREQ_RANGE_CFG		0x44
-#define TEST_CODE_PLL_ANALOG_PROG		0x1F
-#define TEST_CODE_SLEW_RATE_OVERRIDE_CTRL	0xA0
-#define TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL	0xA3
-#define TEST_CODE_SLEW_RATE_DDL_CYCLES		0xA4
+#define TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL	0x0E
+#define TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL		0x0F
+#define TEST_CODE_PLL_VCO_CTRL				0x12
+#define TEST_CODE_PLL_GMP_CTRL				0x13
+#define TEST_CODE_PLL_PHASE_ERR_CTRL			0x14
+#define TEST_CODE_PLL_LOCK_FILTER			0x15
+#define TEST_CODE_PLL_UNLOCK_FILTER			0x16
+#define TEST_CODE_PLL_INPUT_DIVIDER			0x17
+#define TEST_CODE_PLL_FEEDBACK_DIVIDER			0x18
+#define   PLL_FEEDBACK_DIVIDER_HIGH			(1 << 7)
+#define TEST_CODE_PLL_OUTPUT_CLK_SEL			0x19
+#define   PLL_N_OVR_EN					(1 << 4)
+#define   PLL_M_OVR_EN					(1 << 5)
+#define TEST_CODE_PLL_CHARGE_PUMP_BIAS			0x1C
+#define TEST_CODE_PLL_LOCK_DETECTOR			0x1D
+#define TEST_CODE_HS_FREQ_RANGE_CFG			0x44
+#define TEST_CODE_PLL_ANALOG_PROG			0x1F
+#define TEST_CODE_SLEW_RATE_OVERRIDE_CTRL		0xA0
+#define TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL		0xA3
+#define TEST_CODE_SLEW_RATE_DDL_CYCLES			0xA4
+
+/* D-Phy params  */
+#define PLL_N_MIN	0
+#define PLL_N_MAX	15
+#define PLL_M_MIN	62
+#define PLL_M_MAX	623
+#define PLL_FVCO_MAX	1250
 
 /*
  * These are added here only temporarily for testing,
@@ -780,8 +802,158 @@ static inline void set_test_mode_src_osc_freq_target_hi_bits(u32 dphy_no,
 	test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
 }
 
+struct vco_params {
+	u32 freq;
+	u32 range;
+	u32 divider;
+};
+
+static struct vco_params vco_table[] = {
+	{52, 0x3f, 8},
+	{80, 0x39, 8},
+	{105, 0x2f, 4},
+	{160, 0x29, 4},
+	{210, 0x1f, 2},
+	{320, 0x19, 2},
+	{420, 0x0f, 1},
+	{630, 0x09, 1},
+	{1100, 0x03, 1},
+	{0xffff, 0x01, 1},
+};
+
+static void mipi_tx_get_vco_params(struct vco_params *vco)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vco_table); i++) {
+		if (vco->freq < vco_table[i].freq) {
+			*vco = vco_table[i];
+			return;
+		}
+	}
+	WARN_ONCE(1, "Invalid vco freq = %u for PLL setup\n", vco->freq);
+}
+
+static void mipi_tx_pll_setup(u32 dphy_no, u32 ref_clk_mhz, u32 target_freq_mhz)
+{
+	/* pll_ref_clk: - valid range: 2~64 MHz; Typically 24 MHz
+	 * Fvco: - valid range: 320~1250 MHz (Gen3 D-PHY)
+	 * Fout: - valid range: 40~1250 MHz (Gen3 D-PHY)
+	 * n: - valid range [0 15]
+	 * N: - N = n + 1
+	 *	-valid range: [1 16]
+	 *	-conditions: - (pll_ref_clk / N) >= 2 MHz
+	 *		-(pll_ref_clk / N) <= 8 MHz
+	 * m: valid range [62 623]
+	 * M: - M = m + 2
+	 *	-valid range [64 625]
+	 *	-Fvco = (M/N) * pll_ref_clk
+	 */
+	struct vco_params vco_p = {
+		.range = 0,
+		.divider = 1,
+	};
+	u32 best_n = 0, best_m = 0;
+	u32 n = 0, m = 0, div = 0, delta, freq = 0, t_freq;
+	u32 best_freq_delta = 3000;
+
+	vco_p.freq = target_freq_mhz;
+	mipi_tx_get_vco_params(&vco_p);
+	/*search pll n parameter */
+	for (n = PLL_N_MIN; n <= PLL_N_MAX; n++) {
+		/*calculate the pll input frequency division ratio
+		 * multiply by 1000 for precision -
+		 * no floating point, add n for rounding
+		 */
+		div = ((ref_clk_mhz * 1000) + n)/(n+1);
+		/*found a valid n parameter */
+		if ((div < 2000 || div > 8000))
+			continue;
+		/*search pll m parameter */
+		for (m = PLL_M_MIN; m <= PLL_M_MAX; m++) {
+			/*calculate the Fvco(DPHY PLL output frequency)
+			 * using the current n,m params
+			 */
+			freq = div * (m + 2);
+			freq /= 1000;
+			/* trim the potential pll freq to max supported*/
+			if (freq > PLL_FVCO_MAX)
+				continue;
+
+			delta = abs(freq - target_freq_mhz);
+			/*select the best (closest to target pll freq)
+			 * n,m parameters so far
+			 */
+			if (delta < best_freq_delta) {
+				best_n = n;
+				best_m = m;
+				best_freq_delta = delta;
+			}
+		}
+	}
+
+	/*Program vco_cntrl parameter
+	 *PLL_VCO_Control[5:0] = pll_vco_cntrl_ovr,
+	 * PLL_VCO_Control[6]   = pll_vco_cntrl_ovr_en
+	 */
+	test_mode_send(dphy_no, TEST_CODE_PLL_VCO_CTRL, (vco_p.range
+			| (1 << 6)));
+
+	/*Program m, n pll parameters */
+
+	/*PLL_Input_Divider_Ratio[3:0] = pll_n_ovr */
+	test_mode_send(dphy_no, TEST_CODE_PLL_INPUT_DIVIDER, (best_n & 0x0f));
+
+	/* m - low nibble PLL_Loop_Divider_Ratio[4:0] = pll_m_ovr[4:0] */
+	test_mode_send(dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
+			(best_m & 0x1f));
+
+	/*m -high nibble PLL_Loop_Divider_Ratio[4:0] = pll_m_ovr[9:5] */
+	test_mode_send(dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
+			((best_m >> 5) & 0x1f) | PLL_FEEDBACK_DIVIDER_HIGH);
+
+	/*enable overwrite of n,m parameters :pll_n_ovr_en, pll_m_ovr_en*/
+	test_mode_send(dphy_no, TEST_CODE_PLL_OUTPUT_CLK_SEL,
+			(PLL_N_OVR_EN | PLL_M_OVR_EN));
+
+	/*Program Charge-Pump parameters */
+
+	/*pll_prop_cntrl-fixed values for prop_cntrl from DPHY doc */
+	t_freq = target_freq_mhz * vco_p.divider;
+	test_mode_send(dphy_no, TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
+			((t_freq > 1150) ? 0x0C : 0x0B));
+
+	/*pll_int_cntrl-fixed value for int_cntrl from DPHY doc */
+	test_mode_send(dphy_no, TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,
+			0x00);
+
+	/*pll_gmp_cntrl-fixed value for gmp_cntrl from DPHY doci */
+	test_mode_send(dphy_no, TEST_CODE_PLL_GMP_CTRL, 0x10);
+
+	/*pll_cpbias_cntrl-fixed value for cpbias_cntrl from DPHY doc */
+	test_mode_send(dphy_no, TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
+
+	/*PLL Lock Configuration */
+
+	/*pll_th1 -Lock Detector Phase error threshold,
+	 * document gives fixed value
+	 */
+	test_mode_send(dphy_no, TEST_CODE_PLL_PHASE_ERR_CTRL, 0x02);
+
+	/*pll_th2 - Lock Filter length, document gives fixed value */
+	test_mode_send(dphy_no, TEST_CODE_PLL_LOCK_FILTER, 0x60);
+
+	/*pll_th3- PLL Unlocking filter, document gives fixed value */
+	test_mode_send(dphy_no, TEST_CODE_PLL_UNLOCK_FILTER, 0x03);
+
+	/*pll_lock_sel-PLL Lock Detector Selection, document gives
+	 * fixed value
+	 */
+	test_mode_send(dphy_no, TEST_CODE_PLL_LOCK_DETECTOR, 0x02);
+}
+
 static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
-			       enum dphy_mode mode)
+		enum dphy_mode mode)
 {
 	u32 test_code = 0;
 	u32 test_data = 0, val;
@@ -884,7 +1056,15 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 		/*Set PLL regulator in bypass */
 		test_mode_send(dphy_no, TEST_CODE_PLL_ANALOG_PROG, 0x01);
 
-		/*TODO - PLL Parameters Setup */
+		/* PLL Parameters Setup */
+		mipi_tx_pll_setup(dphy_no, cfg->ref_clk_khz/1000,
+				cfg->lane_rate_mbps/2);
+
+		/*Set clksel */
+		kmb_write_bits_mipi(DPHY_INIT_CTRL1, 18, 2, 0x01);
+
+		/*Set pll_shadow_control */
+		kmb_write_bits_mipi(DPHY_INIT_CTRL1, 16, 1, 0x01);
 	}
 
 	/*Send NORMAL OPERATION test code */
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 899a5d3..9ed91ea 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -504,6 +504,7 @@
 /* D-PHY regs */
 #define DPHY_ENABLE				(0x100)
 #define DPHY_INIT_CTRL0				(0x104)
+#define DPHY_INIT_CTRL1				(0x108)
 #define   SHUTDOWNZ				0
 #define   RESETZ				12
 #define DPHY_INIT_CTRL2				(0x10c)
@@ -513,6 +514,7 @@
 #define   CLR_DPHY_INIT_CTRL0(dphy, offset)	\
 					kmb_clr_bit_mipi(DPHY_INIT_CTRL0, \
 					(dphy+offset))
+#define DPHY_INIT_CTRL2				(0x10c)
 #define DPHY_FREQ_CTRL0_3			(0x11c)
 #define   SET_DPHY_FREQ_CTRL0_3(dphy, val)	\
 					kmb_write_bits_mipi(DPHY_FREQ_CTRL0_3 \
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
