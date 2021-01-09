Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6E2F00AE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 16:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446306E8BA;
	Sat,  9 Jan 2021 15:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D559C6E895
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 13:51:16 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D76EE1F569;
 Sat,  9 Jan 2021 14:51:14 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation and
 prescaler
Date: Sat,  9 Jan 2021 14:51:10 +0100
Message-Id: <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 15:13:22 +0000
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VCO rate was being miscalculated due to a big overlook during
the process of porting this driver from downstream to upstream:
here we are really recalculating the rate of the VCO by reading
the appropriate registers and returning a real frequency, while
downstream the driver was doing something entirely different.

In our case here, the recalculated rate was wrong, as it was then
given back to the set_rate function, which was erroneously doing
a division on the fractional value, based on the prescaler being
either enabled or disabled: this was actually producing a bug for
which the final VCO rate was being doubled, causing very obvious
issues when trying to drive a DSI panel because the actual divider
value was multiplied by two!

To make things work properly, remove the multiplication of the
reference clock by two from function dsi_pll_calc_dec_frac and
account for the prescaler enablement in the vco_recalc_rate (if
the prescaler is enabled, then the hardware will divide the rate
by two).

This will make the vco_recalc_rate function to pass the right
frequency to the (clock framework) set_rate function when called,
which will - in turn - program the right values in both the
DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
registers, finally making the PLL to output the right clock.

Also, while at it, remove the prescaler TODO by also adding the
possibility of disabling the prescaler on the PLL (it is in the
PLL_ANALOG_CONTROLS_ONE register).
Of course, both prescaler-ON and OFF cases were tested.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 8b66e852eb36..5be562dfbf06 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
 
 	pll_freq = pll->vco_current_rate;
 
-	if (config->disable_prescaler)
-		divider = fref;
-	else
-		divider = fref * 2;
-
+	divider = fref;
 	multiplier = 1 << config->frac_bits;
 	dec_multiple = div_u64(pll_freq * multiplier, divider);
 	dec = div_u64_rem(dec_multiple, multiplier, &frac);
@@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
 
 static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
 {
+	struct dsi_pll_config *config = &pll->pll_configuration;
 	void __iomem *base = pll->mmio;
+	u32 val = config->disable_prescaler ? 0x0 : 0x80;
 
-	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
+	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
@@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
 		  0x3) << 16);
 
-	/*
-	 * TODO:
-	 *	1. Assumes prescaler is disabled
-	 */
 	multiplier = 1 << config->frac_bits;
-	pll_freq = dec * (ref_clk * 2);
-	tmp64 = (ref_clk * 2 * frac);
+	pll_freq = dec * ref_clk;
+	tmp64 = ref_clk * frac;
 	pll_freq += div_u64(tmp64, multiplier);
-
 	vco_rate = pll_freq;
 
+	if (config->disable_prescaler)
+		vco_rate = div_u64(vco_rate, 2);
+
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_10nm->id, (unsigned long)vco_rate, dec, frac);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
