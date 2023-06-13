Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4472E7C3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 18:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3510E3C2;
	Tue, 13 Jun 2023 16:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8271110E025;
 Tue, 13 Jun 2023 16:03:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CAF663811;
 Tue, 13 Jun 2023 16:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6505EC4AF5C;
 Tue, 13 Jun 2023 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686672237;
 bh=hRs/09I3nVePGyq7+ZAJUlWdpGWIbMI1XEr6/Yow+u8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tVbpwH2fLHIWbej7jYshdnJlpjWYAHpIevTgNAUXsmMojFrbopyryR+rfDUL8xCv1
 /X96DIpLwGVYwA9TQPDXiz5IWgsOEPpoHu9Qb7yYylwZyRSU2GXXbqK4P6BSZ4uwv1
 qVGi9XqLxwx35wynCx2Qvsnm3jgctojsLBxG/O+7c8FnkGePCFlMH27pUGGAHjo9y9
 zR+HJHoMVB1dd4NOoHwvZ5E0EAvHUR9Fwf76b/ER8ZhpuSz8miIPlaMasDVR5sTZPI
 cWGnxa0BQnrC1BULZIN4vUjbBFGUN9oKFlTk6O0llidTzw5w5qgMWGpQuAAMI9UqxY
 62P++rDdTFT+A==
Date: Tue, 13 Jun 2023 09:07:20 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Configure DP INTF/PHY selector
Message-ID: <20230613160720.2a6ouut5qn3cewqd@ripper>
References: <20230612221047.1886709-1-quic_bjorande@quicinc.com>
 <435dd068-fbf2-10cf-4f78-377e689abb2c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <435dd068-fbf2-10cf-4f78-377e689abb2c@linaro.org>
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
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 01:31:40AM +0300, Dmitry Baryshkov wrote:
> On 13/06/2023 01:10, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Some platforms provides a mechanism for configuring the mapping between
> > (one or two) DisplayPort intfs and their PHYs.
> > 
> > In particular SC8180X provides this functionality, without a default
> > configuration, resulting in no connection between its two external
> > DisplayPort controllers and any PHYs.
> > 
> > The change implements the logic for optionally configuring which phy
> > each of the intfs should be connected to, provides a new entry in the
> > DPU catalog for specifying how many intfs to configure and marks the
> > SC8180X DPU to program 2 entries.
> > 
> > For now the request is simply to program the mapping 1:1, any support
> > for alternative mappings is left until the use case arrise.
> > 
> > Note that e.g. msm-4.14 unconditionally maps intf 0 to phy 0 on all
> > rlatforms, so perhaps this is needed in order to get DisplayPort working
> > on some other platforms as well.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
> >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 23 +++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 10 ++++++++
> >   6 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index 8ed2b263c5ea..9da952692a69 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -19,6 +19,7 @@ static const struct dpu_caps sc8180x_dpu_caps = {
> >   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> >   	.max_vdeci_exp = MAX_VERT_DECIMATION,
> > +	.num_dp_intf_sel = 2,
> >   };
> >   static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index ac4a9e73705c..4cb8d096d8ec 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -357,6 +357,7 @@ struct dpu_rotation_cfg {
> >    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
> >    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> >    * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
> > + * @num_dp_intf_sel    number of DP intfs to configure PHY selection for
> >    */
> >   struct dpu_caps {
> >   	u32 max_mixer_width;
> > @@ -371,6 +372,7 @@ struct dpu_caps {
> >   	u32 pixel_ram_size;
> >   	u32 max_hdeci_exp;
> >   	u32 max_vdeci_exp;
> > +	u32 num_dp_intf_sel;
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > index 963bdb5e0252..5afa99cb148c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > @@ -250,6 +250,27 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
> >   	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
> >   }
> > +static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp, unsigned int *phys,
> > +				   unsigned int num_intfs)
> > +{
> > +	struct dpu_hw_blk_reg_map *c = &mdp->hw;
> > +	unsigned int intf;
> > +	u32 sel = 0;
> > +
> > +	if (!num_intfs)
> > +		return;
> > +
> > +	for (intf = 0; intf < num_intfs; intf++) {
> > +		/* Specify the PHY (1-indexed) for @intf */
> > +		sel |= (phys[intf] + 1) << (intf * 3);
> > +
> > +		/* Specify the @intf (1-indexed) of targeted PHY */
> > +		sel |= (intf + 1) << (6 + phys[intf] * 3);
> 
> From what I can see, phys[intf] is const. What about defining indexed masks
> instead?
> 

intf is the loop variable. What am I missing?

> > +	}
> > +
> > +	DPU_REG_WRITE(c, DP_PHY_INTF_SEL, sel);
> > +}
> > +
> >   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >   		unsigned long cap)
> >   {
> > @@ -264,6 +285,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >   	ops->get_safe_status = dpu_hw_get_safe_status;
> > +	ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
> 
> Should this be gated for DPU < 4.0? Or 5.0?
> 
> > +
> >   	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> >   		ops->intf_audio_select = dpu_hw_intf_audio_select;
> >   }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > index a1a9e44bed36..8446d74d59b0 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > @@ -125,6 +125,14 @@ struct dpu_hw_mdp_ops {
> >   	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
> >   			struct dpu_danger_safe_status *status);
> > +	/**
> > +	 * dp_phy_intf_sel - configure intf to phy mapping
> > +	 * @mdp: mdp top context driver
> > +	 * @phys: list of phys the @num_intfs intfs should be connected to
> > +	 * @num_intfs: number of intfs to configure
> > +	 */
> > +	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, unsigned int *phys,
> > +			        unsigned int num_intfs);
> >   	/**
> >   	 * intf_audio_select - select the external interface for audio
> >   	 * @mdp: mdp top context driver
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > index 5acd5683d25a..6d31bdc7269c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > @@ -59,6 +59,7 @@
> >   #define MDP_WD_TIMER_4_CTL2             0x444
> >   #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
> >   #define DCE_SEL                         0x450
> > +#define DP_PHY_INTF_SEL                 0x460
> 
> MDP_DP_PHY_INTF_SEL, if you don't mind.
> 

I don't mind.

> >   #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
> >   #define MDP_PERIPH_TOP0_END		CLK_CTRL3
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index aa8499de1b9f..5dbe5d164c01 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1011,6 +1011,14 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
> >   	return clk_get_rate(clk);
> >   }
> > +static void dpu_kms_dp_phy_intf_sel(struct dpu_kms *dpu_kms)
> > +{
> > +	const unsigned int num_intfs = dpu_kms->catalog->caps->num_dp_intf_sel;
> > +	static unsigned int phy_map[] = {0, 1, 2};
> 
> Please move this to dp_phy_intf_sel() and make it const.
> 

There's a possible use case for passing a phy_map of {0, 2} or {2, 1} on
SC8180X. While this is left to someone in the future to have that use
case, as split dp_phy_intf_sel() would handle such variations.

That said, per the layout of the DP_PHY_INTF_SEL, num_intfs can not be
more than 2, so this list shouldn't have 3 elements.

Regards,
Bjorn

> > +
> > +	dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, phy_map, num_intfs);
> > +}
> > +
> >   static int dpu_kms_hw_init(struct msm_kms *kms)
> >   {
> >   	struct dpu_kms *dpu_kms;
> > @@ -1122,6 +1130,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >   		goto perf_err;
> >   	}
> > +	dpu_kms_dp_phy_intf_sel(dpu_kms);
> > +
> >   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> >   	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
> >   		rc = PTR_ERR(dpu_kms->hw_intr);
> 
> -- 
> With best wishes
> Dmitry
> 
