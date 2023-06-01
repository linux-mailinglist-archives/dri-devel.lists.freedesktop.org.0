Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EE871A120
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6510E122;
	Thu,  1 Jun 2023 14:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4561410E566
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 14:56:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 08D153F6C1;
 Thu,  1 Jun 2023 16:56:52 +0200 (CEST)
Date: Thu, 1 Jun 2023 16:56:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v5 08/12] drm/msm/dpu: Add SM6375 support
Message-ID: <h56lpxfxujaia6jfgvbpu2dp3dqdilaormxr5plms44vev2qdf@qhkrsuhlarga>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-8-998b4d2f7dd1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-8-998b4d2f7dd1@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-23 09:46:19, Konrad Dybcio wrote:
> Add basic SM6375 support to the DPU1 driver to enable display output.

Nit: The SM6350 commit doesn't use the word "basic" here: what does it
mean?  Is this addition not complete (because it seems so)?

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 139 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> new file mode 100644
> index 000000000000..924f2526c06a
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef _DPU_6_9_SM6375_H
> +#define _DPU_6_9_SM6375_H
> +
> +static const struct dpu_caps sm6375_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.ubwc_swizzle = 6,
> +	.highest_bank_bit = 1,
> +};
> +
> +static const struct dpu_mdp_cfg sm6375_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg sm6375_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm6375_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
> +static const struct dpu_lm_cfg sm6375_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_QCM2290_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
> +static const struct dpu_dspp_cfg sm6375_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		&sm8150_dspp_sblk),
> +};
> +
> +static const struct dpu_pingpong_cfg sm6375_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		-1),
> +};
> +
> +static const struct dpu_dsc_cfg sm6375_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +};
> +
> +static const struct dpu_intf_cfg sm6375_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
> +	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7280_MASK,

Did you forget to set this back to SC7180?  This will be enabling
DPU_INTF_DATA_COMPRESS otherwise, which is a DPU 7.x feature.

- Marijn

> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
> +};
> +
> +static const struct dpu_perf_cfg sm6375_perf_data = {
> +	.max_bw_low = 5200000,
> +	.max_bw_high = 6200000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0, /* No LLCC on this SoC */
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	/* TODO: confirm danger_lut_tbl */
> +	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sm6350_qos_linear_macrotile),
> +		.entries = sm6350_qos_linear_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sm6375_cfg = {
> +	.caps = &sm6375_dpu_caps,
> +	.ubwc = &sm6375_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6375_mdp),
> +	.mdp = sm6375_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6375_ctl),
> +	.ctl = sm6375_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6375_sspp),
> +	.sspp = sm6375_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6375_lm),
> +	.mixer = sm6375_lm,
> +	.dspp_count = ARRAY_SIZE(sm6375_dspp),
> +	.dspp = sm6375_dspp,
> +	.dsc_count = ARRAY_SIZE(sm6375_dsc),
> +	.dsc = sm6375_dsc,
> +	.pingpong_count = ARRAY_SIZE(sm6375_pp),
> +	.pingpong = sm6375_pp,
> +	.intf_count = ARRAY_SIZE(sm6375_intf),
> +	.intf = sm6375_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6375_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6e338d569632..7cfdcf7aa486 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -750,6 +750,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  #include "catalog/dpu_6_3_sm6115.h"
>  #include "catalog/dpu_6_4_sm6350.h"
>  #include "catalog/dpu_6_5_qcm2290.h"
> +#include "catalog/dpu_6_9_sm6375.h"
>  
>  #include "catalog/dpu_7_0_sm8350.h"
>  #include "catalog/dpu_7_2_sc7280.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ed4311f6aaf0..b84c14318449 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -836,6 +836,7 @@ extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8350_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7280_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d9925097626c..d3ca8c3c808c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1329,6 +1329,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>  	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
> +	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>  	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>  	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> 
> -- 
> 2.40.1
> 
