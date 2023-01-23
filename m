Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE9678782
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0479910E555;
	Mon, 23 Jan 2023 20:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EDD10E557
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:19:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A91202144C;
 Mon, 23 Jan 2023 21:19:35 +0100 (CET)
Date: Mon, 23 Jan 2023 21:19:34 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 14/14] drm/msm/disp/dpu1: add sc7280 dsc block and sub
 block
Message-ID: <20230123201934.zgtpmzx225uc3ole@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-15-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674498274-6010-15-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-23 10:24:34, Kuogee Hsieh wrote:
> This patch add DSC block and sub block to support new DSC v1.2 hardware
> encoder. Also sc7280 DSC related hardware information are added to allow
> sc7280 DSC feature be enabled at sc7280 platform.

You're not adding support (that happened in previous patches), you're
only describing SC7280 DSC blocks.  Drop the first sentence.

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7deffc9f9..2c78a46 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -476,6 +476,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>  	.has_idle_pc = true,
>  	.max_linewidth = 2400,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_dsc_width = 2560,
>  };
>  
>  static const struct dpu_mdp_cfg msm8998_mdp[] = {
> @@ -1707,7 +1708,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),

This should go in a separate Fixes: patch.

>  	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> @@ -1814,25 +1815,48 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> -#define DSC_BLK(_name, _id, _base, _features) \
> +#define DSC_BLK_HW_1_1(_name, _id, _base, _features) \

Not sure if HW_ is necessary here, DSC_BLK_1_1 seems cleaner.

>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0x140, \
> -	.features = _features, \
> +	.features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
> +	}
> +
> +#define DSC_BLK_HW_1_2(_name, _id, _base, _features, _sblk) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x140, \
> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> +	.sblk = &_sblk, \
>  	}
>  
>  static struct dpu_dsc_cfg sdm845_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
> +	DSC_BLK_HW_1_1("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK_HW_1_1("dsc_1", DSC_1, 0x80400, 0),
> +	DSC_BLK_HW_1_1("dsc_2", DSC_2, 0x80800, 0),
> +	DSC_BLK_HW_1_1("dsc_3", DSC_3, 0x80c00, 0),
>  };
>  
>  static struct dpu_dsc_cfg sm8150_dsc[] = {
> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK_HW_1_1("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK_HW_1_1("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK_HW_1_1("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK_HW_1_1("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +};
> +
> +static struct dpu_dsc_sub_blks sc7280_dsc_sblk_0 = {
> +	.enc = {.base = 0x100, .len = 0x100},
> +	.ctl = {.base = 0xF00, .len = 0x10},
> +};
> +
> +static struct dpu_dsc_sub_blks sc7280_dsc_sblk_1 = {
> +	.enc = {.base = 0x200, .len = 0x100},
> +	.ctl = {.base = 0xF80, .len = 0x10},
> +};
> +
> +static struct dpu_dsc_cfg sc7280_dsc[] = {
> +	DSC_BLK_HW_1_2("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_NATIVE_422_EN), sc7280_dsc_sblk_0),
> +	DSC_BLK_HW_1_2("dsc_1", DSC_1, 0x80000, BIT(DPU_DSC_NATIVE_422_EN), sc7280_dsc_sblk_1),

Bit scary that the blocks have the same address, because it is purely
driven by the sub-blocks with non-overlapping offsets/ranges.  Should we
clarify that with a comment?

While at it, in v1.1 we use a hacky DSC_CTL() macro to bind a pingpong
block via a register in this magical "CTL" range at (0x1800 - 0x3FC * (m
- DSC_0)), can and/or should we represent that CTL sub-block explicitly
in the catalog for v1.1 hardware as well?

- Marijn

>  };
>  
>  /*************************************************************
> @@ -2809,6 +2833,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>  	.pingpong_count = ARRAY_SIZE(sc7280_pp),
>  	.pingpong = sc7280_pp,
>  	.intf_count = ARRAY_SIZE(sc7280_intf),
> +	.dsc_count = ARRAY_SIZE(sc7280_dsc),
> +	.dsc = sc7280_dsc,
>  	.intf = sc7280_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
