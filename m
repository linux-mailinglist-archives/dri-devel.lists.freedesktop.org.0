Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC96FBACC
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 00:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C086B10E30F;
	Mon,  8 May 2023 22:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545DE10E311
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 22:05:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3C3393F33C;
 Tue,  9 May 2023 00:05:01 +0200 (CEST)
Date: Tue, 9 May 2023 00:04:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Message-ID: <b5vjrv7vlsdz2yxvv24abqht3q75vyctrjt36yd5s6gguuv5db@tpiulp2uplvt>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
 <91a390b2-db3d-90f4-a2e2-6ccb75303d04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91a390b2-db3d-90f4-a2e2-6ccb75303d04@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-05 15:11:44, Dmitry Baryshkov wrote:
> On 27/04/2023 18:37, Marijn Suijten wrote:
> > On 2023-04-21 00:31:16, Konrad Dybcio wrote:
> >> Add SM6350 support to the DPU1 driver to enable display output.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > After addressing the comments from Dmitry (CURSOR0->DMA1 and
> > CURSOR1->DMA2), this is:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > See below for some nits.
> 
> [...]
> 
> >> +static const struct dpu_mdp_cfg sm6350_mdp[] = {
> >> +	{
> >> +	.name = "top_0", .id = MDP_TOP,
> >> +	.base = 0x0, .len = 0x494,
> >> +	.features = 0,
> >> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> >> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> >> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> >> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> >> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> >> +	},
> >> +};
> >> +
> >> +static const struct dpu_ctl_cfg sm6350_ctl[] = {
> >> +	{
> >> +	.name = "ctl_0", .id = CTL_0,
> >> +	.base = 0x1000, .len = 0x1dc,
> >> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> >> +	},
> >> +	{
> >> +	.name = "ctl_1", .id = CTL_1,
> >> +	.base = 0x1200, .len = 0x1dc,
> >> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> >> +	},
> >> +	{
> >> +	.name = "ctl_2", .id = CTL_2,
> >> +	.base = 0x1400, .len = 0x1dc,
> >> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> >> +	},
> >> +	{
> >> +	.name = "ctl_3", .id = CTL_3,
> >> +	.base = 0x1600, .len = 0x1dc,
> >> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> >> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> >> +	},
> >> +};
> >> +
> >> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
> >> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> >> +		 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> >> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> >> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> >> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> >> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> >> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> >> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> >> +};
> >> +
> >> +static const struct dpu_lm_cfg sm6350_lm[] = {
> >> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> >> +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> >> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> >> +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> > 
> > These two entries are indented with two tabs and have one character too
> > many to align with the opening parenthesis on the previous line.  Can we
> > please settle on a single style, as this commit mostly uses tabs+spaces
> > to align with the opening parenthesis?
> > 
> > Dmitry vouched for `cino=(0` (when in unclosed parenthesis, align next
> > line with zero extra characters to the opening parenthesis), but I find
> > double tabs more convenient as it doesn't require reindenting when
> > changing the name of the macro (which happened too often in my INTF TE
> > series).
> 
> I mainly vote for 'cino=(0' for indenting conditions (where double tab 
> is confusing) and for function calls. I do not have a strong opinion 
> about macros expansions. We have been using double-tab there, which is 
> fine with me.

Agreed on both.  `cino=(0` looks nice but double-tab in the catalog has
been easier to work with.

> Another option (which I personally find more appealing, but it doesn't 
> play well with the current guidelines) is to have all macro arguments in 
> a single line. It makes it easier to compare things.

Single line would be superb especially for current array tables.
> 
> And another option would be to expand these macros up to some point. 
> Previous experience with clock and interconnect drivers showed that 
> expanding such multi-arg acros makes it _easier_ to handle the data. 
> Counterintuitive, but true.

Fully agree, as well as inlining some flag constants.

<snip>

- Marijn
