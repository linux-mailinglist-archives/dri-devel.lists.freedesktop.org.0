Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96ADA082AA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 23:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234B910E383;
	Thu,  9 Jan 2025 22:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRWNyC5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC7C10E013
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 22:18:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso1454706e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 14:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736461104; x=1737065904; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9tZmQoIa6rU5/S8jlTnbUyiGk3qvWvuV4PPRrGPcMac=;
 b=vRWNyC5X+OEkbaW33o3nKJFtxALCyl1P/BcvAA6gAkk3i2pNv11AF+3oZafgJmADwn
 IvQ4MnjNUtJWrWF7kbv64KXCc3QxSqonlehCLCEx5FR9lF7FBZmtr/VbNCyJbrBCYhWY
 Pii8GimhtoRGoHhCtXoeBgoCDlwygH78+YhQZfqHbAnryQa0fDdmzq8Bf37uR1JOUa97
 wgt5oBBIMunQ58MrPUSGwJxLA8tElvnGkSIrYydlIgbnYcNNk0VSAW/ns/mx83wJl14F
 Zpg6PAWQkvMRUoqo5RuCvYdnaODtWH/UFg5s9PkrzVZrNgavt5YXxeu4Zmrj9pXTpDsH
 xLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736461104; x=1737065904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tZmQoIa6rU5/S8jlTnbUyiGk3qvWvuV4PPRrGPcMac=;
 b=Z4luC1RdjgLT7ILahK8+tHURxGsGjyo64nvjVImEbuGpNp0XoR+nJLpWP9Ag9T6Dzq
 pnwszWzqI0/NLge6r3v1FWjE3khfa6E09XOkxwrEq9051ot7VziWF/Rju6FF7e4ikj0M
 jlJ71RbVjeYZAG6eNtkzzosmarH6v6j6l+yJtL+3NpXbAepJ+E3jrpB8KxuvOnRkNuM6
 YgrI4ygXKYRmT+Qgq0S0etKOIIfyIXAeODIn2QXbPiZRW4PUnrRtiISB/xdplZsjhKU1
 qZlnlTrK+nEPMAxbqjtrrHSngw5d0GSWwB0/DhUhxXdvvwYYbJ4IdOGPEkRoiil1eFtc
 zpuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX8mXxCVt87xMdZSC2wYJuy6dfXIHLafFAI+SHJRBW5+QrD3luCGCPHWFynaA/fbYDFDptp0IrTYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymUjSrXAca4sJx5ExsH9+tsMi9wJ8lQlykK8VHjQzOWbddRULF
 EHgVAkl2QGI4SjDoIvpJIAbZOGENE99rE1XTMV+MAkl40J1Wd7fTINKzzTQ2ds0=
X-Gm-Gg: ASbGncu5UrO994b+bxY8O30IUMC0q2qK3xWa47eB8ox3DyPaRnVJ1bwxBbISCfIS03E
 npo7KrcBTUzdhbuxWgvfCzPYB2l0GH3mbfDYFdrdbbB80ZMX7THIjNNY0BIc80pCcGxm5b+8L64
 V9o+JKIWV8lSn6oGcxmEpZNqgkLtK5Mvd/+posTFH6Q1JUfra6bqlYu56QaXSo66MwKFHxp6DPi
 DWc350D/UnISAXuGOGFBewW6RF82w77RpJlloCv2KgNP2T5/3CrokiXNLT8I2AmXheWZ3Bgq8jB
 3UKICxr5Vt6TxKvGjWCAj4rA2UIiPvuCc70I
X-Google-Smtp-Source: AGHT+IFAl6Yg16g5zGSZXTc/38Dt24d75nOmjzw25aPT/mfEVeVDBU7Q9QUgcd37eMyZrYCVLyXJVQ==
X-Received: by 2002:a05:6512:3b90:b0:542:214c:533 with SMTP id
 2adb3069b0e04-54284559eefmr2809176e87.30.1736461104043; 
 Thu, 09 Jan 2025 14:18:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be540fasm322368e87.81.2025.01.09.14.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 14:18:23 -0800 (PST)
Date: Fri, 10 Jan 2025 00:18:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 09/11] drm/msm/dpu: Add support for SM8750
Message-ID: <5cp5wrumhrlrvm4snfekwdj55ftm5qsuexkdnz5qinlakblcub@a7o2hn26dhb7>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-9-b3f15faf4c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-9-b3f15faf4c97@linaro.org>
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

On Thu, Jan 09, 2025 at 02:08:36PM +0100, Krzysztof Kozlowski wrote:
> Add DPU version v12.0 support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 522 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  6 files changed, 564 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b093f6e529f6d5f4a4b600d766cefb509619a3c1
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
> @@ -0,0 +1,522 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Linaro Limited
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_12_0_SM8750_H
> +#define _DPU_12_0_SM8750_H
> +
> +static const struct dpu_caps sm8750_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 8192,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_mdp_cfg sm8750_mdp = {
> +	.name = "top_0",
> +	.base = 0, .len = 0x494,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> +	.clk_ctrls = {
> +		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
> +static const struct dpu_ctl_cfg sm8750_ctl[] = {
> +	{
> +		.name = "ctl_0", .id = CTL_0,
> +		.base = 0x15000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	}, {
> +		.name = "ctl_1", .id = CTL_1,
> +		.base = 0x16000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	}, {
> +		.name = "ctl_2", .id = CTL_2,
> +		.base = 0x17000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	}, {
> +		.name = "ctl_3", .id = CTL_3,
> +		.base = 0x18000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	}, {
> +		.name = "ctl_4", .id = CTL_4,
> +		.base = 0x19000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	}, {
> +		.name = "ctl_5", .id = CTL_5,
> +		.base = 0x1a000, .len = 0x1000,
> +		.features = CTL_SM8550_MASK,
> +		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg sm8750_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_1", .id = SSPP_VIG1,
> +		.base = 0x6000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
> +		.xin_id = 4,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_2", .id = SSPP_VIG2,
> +		.base = 0x8000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
> +		.xin_id = 8,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		.name = "sspp_3", .id = SSPP_VIG3,
> +		.base = 0xa000, .len = 0x344,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_3_4,
> +		.xin_id = 12,
> +		.type = SSPP_TYPE_VIG,
> +	}, {
> +		/* TODO: Indices/code for SSPP_VIG4 overlaps with SSPP_RGB0 */

Hmm, how can it overlap? SSPP_foo are just internal indices, they should
not be programmed into the hardware.

> +		.name = "sspp_8", .id = SSPP_DMA0,
> +		.base = 0x24000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 1,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_9", .id = SSPP_DMA1,
> +		.base = 0x26000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 5,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_10", .id = SSPP_DMA2,
> +		.base = 0x28000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 9,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_11", .id = SSPP_DMA3,
> +		.base = 0x2a000, .len = 0x344,
> +		.features = DMA_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 13,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_12", .id = SSPP_DMA4,
> +		.base = 0x2c000, .len = 0x344,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 14,
> +		.type = SSPP_TYPE_DMA,
> +	}, {
> +		.name = "sspp_13", .id = SSPP_DMA5,
> +		.base = 0x2e000, .len = 0x344,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> +		.sblk = &dpu_dma_sblk,
> +		.xin_id = 15,
> +		.type = SSPP_TYPE_DMA,
> +	},
> +};
> +
> +static const struct dpu_lm_cfg sm8750_lm[] = {
> +	{
> +		.name = "lm_0", .id = LM_0,
> +		.base = 0x44000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_1,
> +		.pingpong = PINGPONG_0,
> +		.dspp = DSPP_0,
> +	}, {
> +		.name = "lm_1", .id = LM_1,
> +		.base = 0x45000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_0,
> +		.pingpong = PINGPONG_1,
> +		.dspp = DSPP_1,
> +	}, {
> +		.name = "lm_2", .id = LM_2,
> +		.base = 0x46000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_3,
> +		.pingpong = PINGPONG_2,
> +		.dspp = DSPP_2,
> +	}, {
> +		.name = "lm_3", .id = LM_3,
> +		.base = 0x47000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_2,
> +		.pingpong = PINGPONG_3,
> +		.dspp = DSPP_3,
> +	}, {
> +		.name = "lm_4", .id = LM_4,
> +		.base = 0x48000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_5,
> +		.pingpong = PINGPONG_4,
> +	}, {
> +		.name = "lm_5", .id = LM_5,
> +		.base = 0x49000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_4,
> +		.pingpong = PINGPONG_5,
> +	}, {
> +		.name = "lm_6", .id = LM_6,
> +		.base = 0x4a000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_7,
> +		.pingpong = PINGPONG_6,
> +	}, {
> +		.name = "lm_7", .id = LM_7,
> +		.base = 0x4b000, .len = 0x400,
> +		.features = MIXER_SDM845_MASK,
> +		.sblk = &sm8750_lm_sblk,
> +		.lm_pair = LM_6,
> +		.pingpong = PINGPONG_7,
> +	},
> +};
> +
> +static const struct dpu_dspp_cfg sm8750_dspp[] = {
> +	{
> +		.name = "dspp_0", .id = DSPP_0,
> +		.base = 0x54000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8750_dspp_sblk,
> +	}, {
> +		.name = "dspp_1", .id = DSPP_1,
> +		.base = 0x56000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8750_dspp_sblk,
> +	}, {
> +		.name = "dspp_2", .id = DSPP_2,
> +		.base = 0x58000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8750_dspp_sblk,
> +	}, {
> +		.name = "dspp_3", .id = DSPP_3,
> +		.base = 0x5a000, .len = 0x1800,
> +		.features = DSPP_SC7180_MASK,
> +		.sblk = &sm8750_dspp_sblk,
> +	},
> +};
> +
> +static const struct dpu_pingpong_cfg sm8750_pp[] = {
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +	}, {
> +		.name = "pingpong_6", .id = PINGPONG_6,
> +		.base = 0x6f000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 20),
> +	}, {
> +		.name = "pingpong_7", .id = PINGPONG_7,
> +		.base = 0x70000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 21),
> +	}, {
> +		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
> +		.base = 0x66000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_4,
> +	}, {
> +		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
> +		.base = 0x66400, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_4,
> +	}, {
> +		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
> +		.base = 0x7e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_5,
> +	}, {
> +		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
> +		.base = 0x7e400, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_5,
> +	},
> +};
> +
> +static const struct dpu_merge_3d_cfg sm8750_merge_3d[] = {
> +	{
> +		.name = "merge_3d_0", .id = MERGE_3D_0,
> +		.base = 0x4e000, .len = 0x1c,
> +	}, {
> +		.name = "merge_3d_1", .id = MERGE_3D_1,
> +		.base = 0x4f000, .len = 0x1c,
> +	}, {
> +		.name = "merge_3d_2", .id = MERGE_3D_2,
> +		.base = 0x50000, .len = 0x1c,
> +	}, {
> +		.name = "merge_3d_3", .id = MERGE_3D_3,
> +		.base = 0x51000, .len = 0x1c,
> +	}, {
> +		.name = "merge_3d_4", .id = MERGE_3D_4,
> +		.base = 0x66700, .len = 0x1c,
> +	}, {
> +		.name = "merge_3d_5", .id = MERGE_3D_5,
> +		.base = 0x7e700, .len = 0x1c,
> +	},
> +};
> +
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8750_dsc[] = {
> +	{
> +		.name = "dce_0_0", .id = DSC_0,
> +		.base = 0x80000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_0,
> +	}, {
> +		.name = "dce_0_1", .id = DSC_1,
> +		.base = 0x80000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_1,
> +	}, {
> +		.name = "dce_1_0", .id = DSC_2,
> +		.base = 0x81000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_0,
> +	}, {
> +		.name = "dce_1_1", .id = DSC_3,
> +		.base = 0x81000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_1,
> +	}, {
> +		.name = "dce_2_0", .id = DSC_4,
> +		.base = 0x82000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_0,
> +	}, {
> +		.name = "dce_2_1", .id = DSC_5,
> +		.base = 0x82000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_1,
> +	}, {
> +		.name = "dce_3_0", .id = DSC_6,
> +		.base = 0x83000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_0,
> +	}, {
> +		.name = "dce_3_1", .id = DSC_7,
> +		.base = 0x83000, .len = 0x8,
> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.sblk = &sm8750_dsc_sblk_1,
> +	},
> +};
> +
> +static const struct dpu_wb_cfg sm8750_wb[] = {
> +	{
> +		.name = "wb_2", .id = WB_2,
> +		.base = 0x65000, .len = 0x2c8,
> +		.features = WB_SM8250_MASK,
> +		.format_list = wb2_formats_rgb,
> +		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
> +		.xin_id = 6,
> +		.vbif_idx = VBIF_RT,
> +		.maxlinewidth = 4096,
> +		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +	},
> +};
> +
> +static const struct dpu_cwb_cfg sm8750_cwb[] = {
> +	{
> +		.name = "cwb_0", .id = CWB_0,
> +		.base = 0x66200, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_1", .id = CWB_1,
> +		.base = 0x66600, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_2", .id = CWB_2,
> +		.base = 0x7e200, .len = 0x20,
> +	},
> +	{
> +		.name = "cwb_3", .id = CWB_3,
> +		.base = 0x7e600, .len = 0x20,
> +	},
> +};
> +
> +static const struct dpu_intf_cfg sm8750_intf[] = {
> +	{
> +		.name = "intf_0", .id = INTF_0,
> +		.base = 0x34000, .len = 0x4bc,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> +	}, {
> +		.name = "intf_1", .id = INTF_1,
> +		.base = 0x35000, .len = 0x4bc,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_0,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_2", .id = INTF_2,
> +		.base = 0x36000, .len = 0x4bc,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DSI,
> +		.controller_id = MSM_DSI_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.features = INTF_SC7280_MASK,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,
> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	},
> +};
> +
> +static const struct dpu_perf_cfg sm8750_perf_data = {
> +	.max_bw_low = 18900000,
> +	.max_bw_high = 28500000,
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 35,
> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> +		.entries = sc7180_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +static const struct dpu_mdss_version sm8750_mdss_ver = {
> +	.core_major_ver = 12,
> +	.core_minor_ver = 0,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sm8750_cfg = {
> +	.mdss_ver = &sm8750_mdss_ver,
> +	.caps = &sm8750_dpu_caps,
> +	.mdp = &sm8750_mdp,

no CDM block?

> +	.ctl_count = ARRAY_SIZE(sm8750_ctl),
> +	.ctl = sm8750_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8750_sspp),
> +	.sspp = sm8750_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8750_lm),
> +	.mixer = sm8750_lm,
> +	.dspp_count = ARRAY_SIZE(sm8750_dspp),
> +	.dspp = sm8750_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8750_pp),
> +	.pingpong = sm8750_pp,
> +	.dsc_count = ARRAY_SIZE(sm8750_dsc),
> +	.dsc = sm8750_dsc,
> +	.merge_3d_count = ARRAY_SIZE(sm8750_merge_3d),
> +	.merge_3d = sm8750_merge_3d,
> +	.wb_count = ARRAY_SIZE(sm8750_wb),
> +	.wb = sm8750_wb,
> +	.cwb_count = ARRAY_SIZE(sm8750_cwb),
> +	.cwb = sm8650_cwb,
> +	.intf_count = ARRAY_SIZE(sm8750_intf),
> +	.intf = sm8750_intf,
> +	.vbif_count = ARRAY_SIZE(sm8650_vbif),
> +	.vbif = sm8650_vbif,
> +	.perf = &sm8750_perf_data,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0b342c043875f3329a9f71c5e751b2244f9f5ef7..40966ab6283e666d1f113a62ada50298de68833b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -399,6 +399,9 @@ static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_2 =
>  static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_3 =
>  				_VIG_SBLK(SSPP_SCALER_VER(3, 3));
>  
> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3_3_4 =
> +				_VIG_SBLK(SSPP_SCALER_VER(3, 4));
> +
>  static const struct dpu_sspp_sub_blks dpu_rgb_sblk = _RGB_SBLK();
>  
>  static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
> @@ -407,8 +410,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>   * MIXER sub blocks config
>   *************************************************************/
>  
> -/* MSM8998 */
> -

This and the following changes: okay, but irrelevant, please split to a
separate commit.

>  static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -418,8 +419,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>  	},
>  };
>  
> -/* SDM845 */
> -
>  static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 11, /* excluding base layer */
> @@ -429,8 +428,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>  	},
>  };
>  
> -/* SC7180 */
> -
>  static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.maxblendstages = 7, /* excluding base layer */
> @@ -439,7 +436,15 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>  	},
>  };
>  
> -/* QCM2290 */
> +static const struct dpu_lm_sub_blks sm8750_lm_sblk = {
> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxblendstages = 11, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		/* 0x40 + n*0x30 */
> +		0x40, 0x70, 0xa0, 0xd0, 0x100, 0x130, 0x160, 0x190, 0x1c0,
> +		0x1f0, 0x220
> +	},
> +};
>  
>  static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
> @@ -462,6 +467,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
>  		.len = 0x90, .version = 0x40000},
>  };
>  
> +static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
> +	.pcc = {.name = "pcc", .base = 0x1700,
> +		.len = 0x90, .version = 0x60000},
> +};
> +
>  /*************************************************************
>   * PINGPONG sub blocks config
>   *************************************************************/
> @@ -504,6 +514,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>  	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>  };
>  
> +static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_0 = {
> +	.enc = {.name = "enc", .base = 0x100, .len = 0x100},
> +	.ctl = {.name = "ctl", .base = 0xF00, .len = 0x24},
> +};
> +
> +static const struct dpu_dsc_sub_blks sm8750_dsc_sblk_1 = {
> +	.enc = {.name = "enc", .base = 0x200, .len = 0x100},
> +	.ctl = {.name = "ctl", .base = 0xF80, .len = 0x24},
> +};
> +
>  /*************************************************************
>   * CDM block config
>   *************************************************************/
> @@ -787,3 +807,4 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  #include "catalog/dpu_9_2_x1e80100.h"
>  
>  #include "catalog/dpu_10_0_sm8650.h"
> +#include "catalog/dpu_12_0_sm8750.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..1bd313f2c6f199d5eefcdaa5f7c18ea512d48684 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -863,6 +863,7 @@ extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
>  extern const struct dpu_mdss_cfg dpu_sa8775p_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm8750_cfg;
>  extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
>  
>  #endif /* _DPU_HW_CATALOG_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 4893f10d6a5832521808c0f4d8b231c356dbdc41..06b01cd36ce2442ee6e1b85be227851a234cc96b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -254,6 +254,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
>  	case LM_5:
>  		ctx->pending_flush_mask |= BIT(20);
>  		break;
> +	case LM_6:
> +		ctx->pending_flush_mask |= BIT(21);
> +		break;
> +	case LM_7:
> +		ctx->pending_flush_mask |= BIT(27);
> +		break;
>  	default:
>  		break;
>  	}

Please make functional changes first (new LMs, etc), keep catalog
limited to just catalog changes.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index ba7bb05efe9b8cac01a908e53121117e130f91ec..440a327c64eb83a944289c6ce9ef9a5bfacc25f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -123,6 +123,7 @@ enum dpu_lm {
>  	LM_4,
>  	LM_5,
>  	LM_6,
> +	LM_7,
>  	LM_MAX
>  };
>  
> @@ -167,6 +168,8 @@ enum dpu_dsc {
>  	DSC_3,
>  	DSC_4,
>  	DSC_5,
> +	DSC_6,
> +	DSC_7,
>  	DSC_MAX
>  };
>  
> @@ -183,6 +186,8 @@ enum dpu_pingpong {
>  	PINGPONG_3,
>  	PINGPONG_4,
>  	PINGPONG_5,
> +	PINGPONG_6,
> +	PINGPONG_7,
>  	PINGPONG_CWB_0,
>  	PINGPONG_CWB_1,
>  	PINGPONG_CWB_2,
> @@ -197,6 +202,7 @@ enum dpu_merge_3d {
>  	MERGE_3D_2,
>  	MERGE_3D_3,
>  	MERGE_3D_4,
> +	MERGE_3D_5,
>  	MERGE_3D_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 97e9cb8c2b099f4757169cadf7e941148d2bfb16..ac131a01dc2bd99a2a54986ae1e3f7c324c9da50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1515,6 +1515,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
>  	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
>  	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
> +	{ .compatible = "qcom,sm8750-dpu", .data = &dpu_sm8750_cfg, },
>  	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
>  	{}
>  };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
