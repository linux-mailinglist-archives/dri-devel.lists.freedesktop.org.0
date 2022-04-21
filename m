Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B4509F74
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7B10E0D4;
	Thu, 21 Apr 2022 12:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5910E067
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:17:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC87A1480
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:17:01 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83DB93F5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:17:01 -0700 (PDT)
Date: Thu, 21 Apr 2022 13:16:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 04/17] drm/msm/dpu: add writeback blocks to the sm8250
 DPU catalog
Message-ID: <YmFLOjLlkCwV6klC@e110455-lin.cambridge.arm.com>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-5-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1650419169-13760-5-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 06:45:56PM -0700, Abhinav Kumar wrote:
> Add writeback blocks to the sm8250 DPU hardware catalog. Other
> chipsets support writeback too but add it to sm8250 to prototype
> the feature so that it can be easily extended to other chipsets.
> 
> changes in v2:
> 	- none
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 74 +++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 66 ++++++++++++++++++++++-
>  2 files changed, 138 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b0a0ef7..bcb5273 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.

Hi Abhinav,

Nit: Order should be historical (i.e. QIC copyright comes last). Comment applies to
all other copyright years additions.

Best regards,
Liviu

>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -120,6 +121,16 @@
>  			  BIT(MDP_AD4_0_INTR) | \
>  			  BIT(MDP_AD4_1_INTR))
>  
> +#define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
> +			 BIT(DPU_WB_UBWC) | \
> +			 BIT(DPU_WB_YUV_CONFIG) | \
> +			 BIT(DPU_WB_PIPE_ALPHA) | \
> +			 BIT(DPU_WB_XY_ROI_OFFSET) | \
> +			 BIT(DPU_WB_QOS) | \
> +			 BIT(DPU_WB_QOS_8LVL) | \
> +			 BIT(DPU_WB_CDP) | \
> +			 BIT(DPU_WB_INPUT_CTRL))
> +
>  #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>  #define DEFAULT_DPU_LINE_WIDTH		2048
>  #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
> @@ -211,6 +222,40 @@ static const u32 rotation_v2_formats[] = {
>  	/* TODO add formats after validation */
>  };
>  
> +static const uint32_t wb2_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_RGBA5551,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGBX5551,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_RGBA4444,
> +	DRM_FORMAT_RGBX4444,
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_BGRA5551,
> +	DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_BGRX5551,
> +	DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_BGRA4444,
> +	DRM_FORMAT_BGRX4444,
> +	DRM_FORMAT_XBGR4444,
> +};
> +
>  /*************************************************************
>   * DPU sub blocks config
>   *************************************************************/
> @@ -448,6 +493,8 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  			.reg_off = 0x2C4, .bit_off = 8},
>  	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>  			.reg_off = 0x2BC, .bit_off = 20},
> +	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
> +			.reg_off = 0x3B8, .bit_off = 24},
>  	},
>  };
>  
> @@ -1235,6 +1282,29 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>  };
>  
>  /*************************************************************
> + * Writeback blocks config
> + *************************************************************/
> +#define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
> +		__xin_id, vbif_id, _reg, _wb_done_bit) \
> +	{ \
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x2c8, \
> +	.features = _features, \
> +	.format_list = wb2_formats, \
> +	.num_formats = ARRAY_SIZE(wb2_formats), \
> +	.clk_ctrl = _clk_ctrl, \
> +	.xin_id = __xin_id, \
> +	.vbif_idx = vbif_id, \
> +	.maxlinewidth = DEFAULT_DPU_LINE_WIDTH, \
> +	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
> +	}
> +
> +static const struct dpu_wb_cfg sm8250_wb[] = {
> +	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> +			VBIF_RT, MDP_SSPP_TOP0_INTR, 4),
> +};
> +
> +/*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
>  /* VBIF QOS remap */
> @@ -1832,6 +1902,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>  		.intf = sm8150_intf,
>  		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  		.vbif = sdm845_vbif,
> +		.wb_count = ARRAY_SIZE(sm8250_wb),
> +		.wb = sm8250_wb,
>  		.reg_dma_count = 1,
>  		.dma_cfg = sm8250_regdma,
>  		.perf = sm8250_perf_data,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 866fd7a..8cb6d1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,5 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>   */
>  
>  #ifndef _DPU_HW_CATALOG_H
> @@ -214,6 +216,42 @@ enum {
>  };
>  
>  /**
> +  * WB sub-blocks and features
> +  * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
> +  * @DPU_WB_BLOCK_MODE       Writeback module supports block mode read
> +  * @DPU_WB_CHROMA_DOWN,     Writeback chroma down block,
> +  * @DPU_WB_DOWNSCALE,       Writeback integer downscaler,
> +  * @DPU_WB_DITHER,          Dither block
> +  * @DPU_WB_TRAFFIC_SHAPER,  Writeback traffic shaper bloc
> +  * @DPU_WB_UBWC,            Writeback Universal bandwidth compression
> +  * @DPU_WB_YUV_CONFIG       Writeback supports output of YUV colorspace
> +  * @DPU_WB_PIPE_ALPHA       Writeback supports pipe alpha
> +  * @DPU_WB_XY_ROI_OFFSET    Writeback supports x/y-offset of out ROI in
> +  *                          the destination image
> +  * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
> +  * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
> +  * @DPU_WB_CDP              Writeback supports client driven prefetch
> +  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
> +  *                          data arrives.
> +  * @DPU_WB_CROP             CWB supports cropping
> +  * @DPU_WB_MAX              maximum value
> +  */
> +enum {
> +	DPU_WB_LINE_MODE = 0x1,
> +	DPU_WB_BLOCK_MODE,
> +	DPU_WB_UBWC,
> +	DPU_WB_YUV_CONFIG,
> +	DPU_WB_PIPE_ALPHA,
> +	DPU_WB_XY_ROI_OFFSET,
> +	DPU_WB_QOS,
> +	DPU_WB_QOS_8LVL,
> +	DPU_WB_CDP,
> +	DPU_WB_INPUT_CTRL,
> +	DPU_WB_CROP,
> +	DPU_WB_MAX
> +};
> +
> +/**
>   * VBIF sub-blocks and features
>   * @DPU_VBIF_QOS_OTLIM        VBIF supports OT Limit
>   * @DPU_VBIF_QOS_REMAP        VBIF supports QoS priority remap
> @@ -460,6 +498,7 @@ enum dpu_clk_ctrl_type {
>  	DPU_CLK_CTRL_CURSOR1,
>  	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
>  	DPU_CLK_CTRL_REG_DMA,
> +	DPU_CLK_CTRL_WB2,
>  	DPU_CLK_CTRL_MAX,
>  };
>  
> @@ -608,6 +647,28 @@ struct dpu_intf_cfg  {
>  };
>  
>  /**
> + * struct dpu_wb_cfg - information of writeback blocks
> + * @DPU_HW_BLK_INFO:    refer to the description above for DPU_HW_BLK_INFO
> + * @vbif_idx:           vbif client index
> + * @maxlinewidth:       max line width supported by writeback block
> + * @xin_id:             bus client identifier
> + * @intr_wb_done:       interrupt index for WB_DONE
> + * @format_list:	    list of formats supported by this writeback block
> + * @num_formats:	    number of formats supported by this writeback block
> + * @clk_ctrl:	        clock control identifier
> + */
> +struct dpu_wb_cfg {
> +	DPU_HW_BLK_INFO;
> +	u8 vbif_idx;
> +	u32 maxlinewidth;
> +	u32 xin_id;
> +	s32 intr_wb_done;
> +	const u32 *format_list;
> +	u32 num_formats;
> +	enum dpu_clk_ctrl_type clk_ctrl;
> +};
> +
> +/**
>   * struct dpu_vbif_dynamic_ot_cfg - dynamic OT setting
>   * @pps                pixel per seconds
>   * @ot_limit           OT limit to use up to specified pixel per second
> @@ -792,6 +853,9 @@ struct dpu_mdss_cfg {
>  	u32 vbif_count;
>  	const struct dpu_vbif_cfg *vbif;
>  
> +	u32 wb_count;
> +	const struct dpu_wb_cfg *wb;
> +
>  	u32 reg_dma_count;
>  	struct dpu_reg_dma_cfg dma_cfg;
>  
> -- 
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
