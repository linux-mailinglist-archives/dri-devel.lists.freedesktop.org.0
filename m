Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9873D3A7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 22:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17BD10E197;
	Sun, 25 Jun 2023 20:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693310E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 20:23:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B4D371F8D6;
 Sun, 25 Jun 2023 22:23:11 +0200 (CEST)
Date: Sun, 25 Jun 2023 22:23:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 11/15] drm/msm/dsi: Add 14nm phy configuration for SM6125
Message-ID: <sdz26twflxyew2ejqkpqpe4eaz57hcsphi2so2wjndqxsh3q5c@diksxdwico33>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-11-1d5a638cebf2@somainline.org>
 <18d969bb-69b5-0d42-1518-e8a3b92859b7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18d969bb-69b5-0d42-1518-e8a3b92859b7@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-24 03:49:25, Konrad Dybcio wrote:
> On 24.06.2023 02:41, Marijn Suijten wrote:
> > SM6125 features only a single PHY (despite a secondary PHY PLL source
> > being available to the disp_cc_mdss_pclk0_clk_src clock), and downstream
> > sources for this "trinket" SoC do not define the typical "vcca"
> > regulator to be available nor used.
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> The introduced ops are identical to 2290, modulo regulator..

Sure, I can create a "drop unused regulators from 14nm qcm2290 config"
and a second "reuse qcm2290 14nm dsi phy for sm6125" patch, instead of
this one.

> But the regulator is absent on both (VDD_MX powers it instead), so

In the DT patch you requested me to use CX instead of MX... Which one is
it?

Also note that I moved it from DSI PHY to DSI0 because that's where the
rpmpd opps reside.

- Marijn

> feel free to clean that up and reuse it ;)

> 
> Konrad
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 15 +++++++++++++++
> >  3 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 9d5795c58a98..8688ed502dcf 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -559,6 +559,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  	  .data = &dsi_phy_14nm_2290_cfgs },
> >  	{ .compatible = "qcom,dsi-phy-14nm-660",
> >  	  .data = &dsi_phy_14nm_660_cfgs },
> > +	{ .compatible = "qcom,dsi-phy-14nm-6125",
> > +	  .data = &dsi_phy_14nm_6125_cfgs },
> >  	{ .compatible = "qcom,dsi-phy-14nm-8953",
> >  	  .data = &dsi_phy_14nm_8953_cfgs },
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 8b640d174785..ebf915f5e6c6 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -52,6 +52,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > index 3ce45b023e63..5d43c9ec69ae 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > @@ -1068,6 +1068,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> >  	.num_dsi_phy = 2,
> >  };
> >  
> > +const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs = {
> > +	.has_phy_lane = true,
> > +	.ops = {
> > +		.enable = dsi_14nm_phy_enable,
> > +		.disable = dsi_14nm_phy_disable,
> > +		.pll_init = dsi_pll_14nm_init,
> > +		.save_pll_state = dsi_14nm_pll_save_state,
> > +		.restore_pll_state = dsi_14nm_pll_restore_state,
> > +	},
> > +	.min_pll_rate = VCO_MIN_RATE,
> > +	.max_pll_rate = VCO_MAX_RATE,
> > +	.io_start = { 0x5e94400 },
> > +	.num_dsi_phy = 1,
> > +};
> > +
> >  const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
> >  	.has_phy_lane = true,
> >  	.regulator_data = dsi_phy_14nm_17mA_regulators,
> > 
