Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95132726F8E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E2E10E54A;
	Wed,  7 Jun 2023 21:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBB610E0FB;
 Wed,  7 Jun 2023 21:00:05 +0000 (UTC)
Received: from g550jk.localnet (unknown [185.176.222.176])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1A9B8CFCA8;
 Wed,  7 Jun 2023 21:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1686171602; bh=5CIPX0QVCk1ehZxhs60pbSqWoXfhuCQAdNwLZHmhw+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TQAvuRLdr+dyGp2ZaARbfsnN2mrEnHq/dSPwtvRkDPgTarwO1HOUpLHg+4ehsOX6u
 7VOqq3pm2ALs+mEf6GqKiJUQ5Ifi9gFkScloQl3Fk0r2aGYFO6QLIbEXmvX6iwbr5D
 mAa42iXiHcAUVt8uCZnEJyW8/0wc40uIZA87W21M=
From: Luca Weiss <luca@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: Re: [Freedreno] [PATCH v3 6/7] drm/msm/dsi: Add phy configuration for
 MSM8226
Date: Wed, 07 Jun 2023 23:00:00 +0200
Message-ID: <12219954.O9o76ZdvQC@z3ntu.xyz>
In-Reply-To: <51712e34-c964-a5b3-3df8-1af10c7751f6@quicinc.com>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
 <51712e34-c964-a5b3-3df8-1af10c7751f6@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mittwoch, 7. Juni 2023 21:46:31 CEST Jeykumar Sankaran wrote:
> On 6/1/2023 10:00 AM, Luca Weiss wrote:
> > MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
> > based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.
> > 
> > Worth noting that the msm-3.10 downstream kernel also will try other
> > sequences in case this one doesn't work, but during testing it has shown
> > 
> > that the _m sequence succeeds first time also:
> >    .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
> >    .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
> >    .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
> >    .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
> >    .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
> >    .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
> >    .pll_enable_seqs[6] = dsi_pll_enable_seq_e,
> > 
> > We may need to expand this in the future.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97
> >   ++++++++++++++++++++++++++++++ 3 files changed, 101 insertions(+), 1
> >   deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c index bb09cbe8ff86..9d5795c58a98
> > 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -541,6 +541,8 @@ static const struct of_device_id dsi_phy_dt_match[] =
> > {
> > 
> >   	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
> >   	
> >   	{ .compatible = "qcom,dsi-phy-28nm-lp",
> >   	
> >   	  .data = &dsi_phy_28nm_lp_cfgs },
> > 
> > +	{ .compatible = "qcom,dsi-phy-28nm-8226",
> > +	  .data = &dsi_phy_28nm_8226_cfgs },
> > 
> >   #endif
> >   #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
> >   
> >   	{ .compatible = "qcom,dsi-phy-20nm",
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h index 7137a17ae523..8b640d174785
> > 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -46,8 +46,9 @@ struct msm_dsi_phy_cfg {
> > 
> >   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
> > 
> > -extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
> > 
> >   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> > 
> > +extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> > 
> >   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c index
> > 4c1bf55c5f38..ceec7bb87bf1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > @@ -37,6 +37,7 @@
> > 
> >   /* v2.0.0 28nm LP implementation */
> >   #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
> > 
> > +#define DSI_PHY_28NM_QUIRK_PHY_8226	BIT(1)
> > 
> >   #define LPFR_LUT_SIZE			10
> >   struct lpfr_cfg {
> > 
> > @@ -377,6 +378,74 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw
> > *hw)> 
> >   	return ret;
> >   
> >   }
> > 
> > +static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
> > +{
> > +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> > +	struct device *dev = &pll_28nm->phy->pdev->dev;
> > +	void __iomem *base = pll_28nm->phy->pll_base;
> > +	u32 max_reads = 5, timeout_us = 100;
> > +	bool locked;
> > +	u32 val;
> > +	int i;
> > +
> > +	DBG("id=%d", pll_28nm->phy->id);
> > +
> > +	pll_28nm_software_reset(pll_28nm);
> > +
> > +	/*
> > +	 * PLL power up sequence.
> > +	 * Add necessary delays recommended by hardware.
> > +	 */
> > +	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34);
> > +
> > +	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
> > +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
> > +
> > +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
> > +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
> > +
> > +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
> > +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
> > +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
> > +
> > +	for (i = 0; i < 7; i++) {
> > +		/* DSI Uniphy lock detect setting */
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
> > +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
> > +				0x0c, 100);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
> > +
> > +		/* poll for PLL ready status */
> > +		locked = pll_28nm_poll_for_ready(pll_28nm,
> > +						max_reads, timeout_us);
> > +		if (locked)
> > +			break;
> > +
> > +		pll_28nm_software_reset(pll_28nm);
> > +
> > +		/*
> > +		 * PLL power up sequence.
> > +		 * Add necessary delays recommended by hardware.
> > +		 */
> > +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00, 50);
> > +
> > +		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
> > +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
> > +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 100);
> > +
> > +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
> > +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
> > +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
> > +	}
> > +
> > +	if (unlikely(!locked))
> > +		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
> > +	else
> > +		DBG("DSI PLL Lock success");
> > +
> > +	return locked ? 0 : -EINVAL;
> > +}
> > +
> 
> Could you please share the downstream reference you used to come up with
> this sequence?

Hi, it should be this if I don't misremember.

https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-lenok-3.10-marshmallow-mr1-wear-release/arch/arm/mach-msm/clock-mdss-8974.c#1088

Regards
Luca

> 
> Thanks and Regards,
> Jeykumar S.
> 
> >   static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
> >   {
> >   
> >   	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> > 
> > @@ -471,6 +540,15 @@ static const struct clk_ops
> > clk_ops_dsi_pll_28nm_vco_lp = {> 
> >   	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> >   
> >   };
> > 
> > +static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
> > +	.round_rate = dsi_pll_28nm_clk_round_rate,
> > +	.set_rate = dsi_pll_28nm_clk_set_rate,
> > +	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> > +	.prepare = dsi_pll_28nm_vco_prepare_8226,
> > +	.unprepare = dsi_pll_28nm_vco_unprepare,
> > +	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> > +};
> > +
> > 
> >   /*
> >   
> >    * PLL Callbacks
> >    */
> > 
> > @@ -536,6 +614,8 @@ static int pll_28nm_register(struct dsi_pll_28nm
> > *pll_28nm, struct clk_hw **prov> 
> >   	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> >   	
> >   		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
> > 
> > +	else if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_8226)
> > +		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_8226;
> > 
> >   	else
> >   	
> >   		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
> > 
> > @@ -820,3 +900,20 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
> > 
> >   	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
> >   
> >   };
> > 
> > +const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
> > +	.has_phy_regulator = true,
> > +	.regulator_data = dsi_phy_28nm_regulators,
> > +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
> > +	.ops = {
> > +		.enable = dsi_28nm_phy_enable,
> > +		.disable = dsi_28nm_phy_disable,
> > +		.pll_init = dsi_pll_28nm_init,
> > +		.save_pll_state = dsi_28nm_pll_save_state,
> > +		.restore_pll_state = dsi_28nm_pll_restore_state,
> > +	},
> > +	.min_pll_rate = VCO_MIN_RATE,
> > +	.max_pll_rate = VCO_MAX_RATE,
> > +	.io_start = { 0xfd922b00 },
> > +	.num_dsi_phy = 1,
> > +	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
> > +};




