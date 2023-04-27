Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7A6F08AC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752510EBA1;
	Thu, 27 Apr 2023 15:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A96410EB8F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:48:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5BC1C20139;
 Thu, 27 Apr 2023 17:48:15 +0200 (CEST)
Date: Thu, 27 Apr 2023 17:48:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
Message-ID: <b3fajcbkfxqy4bxzjezrugbetpbjxdskarr3fhtn2unhqv2srj@y2o3wfd4v7dz>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
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
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-27 17:37:42, Marijn Suijten wrote:
> On 2023-04-21 00:31:16, Konrad Dybcio wrote:
> > Add SM6350 support to the DPU1 driver to enable display output.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> After addressing the comments from Dmitry (CURSOR0->DMA1 and
> CURSOR1->DMA2), this is:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> See below for some nits.

Actually found one glaring issue that might explain why INTF TE wasn't
working for you the other day!

> > ---
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 191 +++++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >  4 files changed, 196 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > new file mode 100644
> > index 000000000000..687a508cbaa6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > @@ -0,0 +1,191 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2023, Linaro Limited
> > + */
> > +
> > +#ifndef _DPU_6_4_SM6350_H
> > +#define _DPU_6_4_SM6350_H
> > +
> > +static const struct dpu_caps sm6350_dpu_caps = {
> > +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > +	.max_mixer_blendstages = 0x7,
> > +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> 
> I thought it was QSEED3LITE, but doesn't really matter as both are
> handled similarly.  It'll anyway change when I resubmit:
> 
> https://lore.kernel.org/linux-arm-msm/20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org/T/#u
> 
> which should hardcode the register value directly, making this field
> superfluous.
> 
> > +	.has_src_split = true,
> > +	.has_dim_layer = true,
> > +	.has_idle_pc = true,
> > +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> > +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> > +};
> > +
> > +static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
> > +	.ubwc_version = DPU_HW_UBWC_VER_20,
> > +	.ubwc_swizzle = 6,
> > +	.highest_bank_bit = 1,
> > +};
> > +
> > +static const struct dpu_mdp_cfg sm6350_mdp[] = {
> > +	{
> > +	.name = "top_0", .id = MDP_TOP,
> > +	.base = 0x0, .len = 0x494,
> > +	.features = 0,
> > +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> > +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> > +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> > +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2c4, .bit_off = 8 },
> > +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> > +	},
> > +};
> > +
> > +static const struct dpu_ctl_cfg sm6350_ctl[] = {
> > +	{
> > +	.name = "ctl_0", .id = CTL_0,
> > +	.base = 0x1000, .len = 0x1dc,
> > +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> > +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> > +	},
> > +	{
> > +	.name = "ctl_1", .id = CTL_1,
> > +	.base = 0x1200, .len = 0x1dc,
> > +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> > +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> > +	},
> > +	{
> > +	.name = "ctl_2", .id = CTL_2,
> > +	.base = 0x1400, .len = 0x1dc,
> > +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> > +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> > +	},
> > +	{
> > +	.name = "ctl_3", .id = CTL_3,
> > +	.base = 0x1600, .len = 0x1dc,
> > +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> > +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> > +	},
> > +};
> > +
> > +static const struct dpu_sspp_cfg sm6350_sspp[] = {
> > +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> > +		 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> > +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> > +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> > +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> > +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> > +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> > +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> > +};
> > +
> > +static const struct dpu_lm_cfg sm6350_lm[] = {
> > +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> > +		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> > +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> > +		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
> 
> These two entries are indented with two tabs and have one character too
> many to align with the opening parenthesis on the previous line.  Can we
> please settle on a single style, as this commit mostly uses tabs+spaces
> to align with the opening parenthesis?
> 
> Dmitry vouched for `cino=(0` (when in unclosed parenthesis, align next
> line with zero extra characters to the opening parenthesis), but I find
> double tabs more convenient as it doesn't require reindenting when
> changing the name of the macro (which happened too often in my INTF TE
> series).
> 
> > +};
> > +
> > +static const struct dpu_dspp_cfg sm6350_dspp[] = {
> > +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> > +		 &sm8150_dspp_sblk),
> > +};
> > +
> > +static struct dpu_pingpong_cfg sm6350_pp[] = {
> > +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> > +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> > +	       -1),
> > +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> > +	       DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> > +	       -1),
> 
> Glad to see no TE2 here, we just removed it from all of DPU >= 5.0.0
> instead of >= 7.0.0 in [1] as downstream DTS turned out to be wrong.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org/
> 
> - Marijn
> 
> > +};
> > +
> > +static const struct dpu_intf_cfg sm6350_intf[] = {
> > +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK,
> > +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> > +		 DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> > +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK,
> > +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> > +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> > +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> > +};
> > +
> > +static const struct dpu_vbif_cfg sm6350_vbif[] = {
> > +	{
> > +	.name = "vbif_0", .id = VBIF_RT,
> > +	.base = 0, .len = 0x1044,
> > +	.features = BIT(DPU_VBIF_QOS_REMAP),
> > +	.xin_halt_timeout = 0x4000,
> > +	.qos_rt_tbl = {
> > +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> > +		.priority_lvl = sdm845_rt_pri_lvl,
> > +	},
> > +	.qos_nrt_tbl = {
> > +		.npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
> > +		.priority_lvl = sdm845_nrt_pri_lvl,
> > +	},
> > +	.memtype_count = 14,
> > +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> > +	},
> > +};
> > +
> > +static const struct dpu_qos_lut_entry sm6350_qos_linear_macrotile[] = {
> > +	{.fl = 0, .lut = 0x0011223344556677 },
> > +	{.fl = 0, .lut = 0x0011223445566777 },
> > +};
> > +
> > +static const struct dpu_perf_cfg sm6350_perf_data = {
> > +	.max_bw_low = 4200000,
> > +	.max_bw_high = 5100000,
> > +	.min_core_ib = 2500000,
> > +	.min_llcc_ib = 0,
> > +	.min_dram_ib = 1600000,
> > +	.min_prefill_lines = 35,
> > +	/* TODO: confirm danger_lut_tbl */
> > +	.danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
> > +	.qos_lut_tbl = {
> > +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> > +		.entries = sm6350_qos_linear_macrotile
> > +		},
> > +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> > +		.entries = sm6350_qos_linear_macrotile
> > +		},
> > +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> > +		.entries = sc7180_qos_nrt
> > +		},
> > +	},
> > +	.cdp_cfg = {
> > +		{.rd_enable = 1, .wr_enable = 1},
> > +		{.rd_enable = 1, .wr_enable = 0}
> > +	},
> > +	.clk_inefficiency_factor = 105,
> > +	.bw_inefficiency_factor = 120,
> > +};
> > +
> > +const struct dpu_mdss_cfg dpu_sm6350_cfg = {
> > +	.caps = &sm6350_dpu_caps,
> > +	.ubwc = &sm6350_ubwc_cfg,
> > +	.mdp_count = ARRAY_SIZE(sm6350_mdp),
> > +	.mdp = sm6350_mdp,
> > +	.ctl_count = ARRAY_SIZE(sm6350_ctl),
> > +	.ctl = sm6350_ctl,
> > +	.sspp_count = ARRAY_SIZE(sm6350_sspp),
> > +	.sspp = sm6350_sspp,
> > +	.mixer_count = ARRAY_SIZE(sm6350_lm),
> > +	.mixer = sm6350_lm,
> > +	.dspp_count = ARRAY_SIZE(sm6350_dspp),
> > +	.dspp = sm6350_dspp,
> > +	.pingpong_count = ARRAY_SIZE(sm6350_pp),
> > +	.pingpong = sm6350_pp,
> > +	.intf_count = ARRAY_SIZE(sm6350_intf),
> > +	.intf = sm6350_intf,
> > +	.vbif_count = ARRAY_SIZE(sm6350_vbif),
> > +	.vbif = sm6350_vbif,
> > +	.reg_dma_count = 1,
> > +	.dma_cfg = &sm8250_regdma,
> > +	.perf = &sm6350_perf_data,
> > +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> > +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > +		     BIT(MDP_INTF0_INTR) | \
> > +		     BIT(MDP_INTF1_INTR)

For completeness I should've pointed out that you're missing
MDP_INTF1_TEAR_INTR here, likely resulting in INTF TE not working.

- Marijn

<snip>
