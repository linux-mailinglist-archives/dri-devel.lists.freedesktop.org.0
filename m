Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CC4702067
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 00:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972AE10E10E;
	Sun, 14 May 2023 22:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51CA10E0F8;
 Sun, 14 May 2023 22:18:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E5AB7201D3;
 Mon, 15 May 2023 00:18:05 +0200 (CEST)
Date: Mon, 15 May 2023 00:18:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Message-ID: <mxdr37vle6x4wvidyh2tc5w77oqve556ogk4nu47efdjbstz6i@vz5hkydgie5g>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
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
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-12 11:00:20, Kuogee Hsieh wrote:
> 
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
> 
> Changes in v3:
> -- fixed kernel test rebot report that "__iomem *off" is declared but not
>    used at dpu_hw_dsc_config_1_2()
> -- unrolling thresh loops
> 
> Changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- delete off and used real register name directly
> 
> Changes in v7:
> -- replace offset with sblk->enc.base
> -- replace ss with slice
> 
> Changes in v8:
> -- fixed checkpatch warning
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  32 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 382 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>  5 files changed, 432 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b814fc8..b9af5e4 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_ctl.o \
>  	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_hw_dsc_1_2.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
>  	disp/dpu1/dpu_hw_intf.o \
>  	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index dc0a4da..4eda2cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>   */
>  
> @@ -244,12 +244,18 @@ enum {
>  };
>  
>  /**
> - * DSC features
> + * DSC sub-blocks/features
>   * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
>   *                            the pixel output from this DSC.
> + * @DPU_DSC_HW_REV_1_2        DSC block supports dsc 1.1 and 1.2

Nit: dsc -> DSC

> + * @DPU_DSC_NATIVE_422_EN     Supports native422 and native420 encoding

NATIVE_42x_EN?

> + * @DPU_DSC_MAX
>   */
>  enum {
>  	DPU_DSC_OUTPUT_CTRL = 0x1,
> +	DPU_DSC_HW_REV_1_2,
> +	DPU_DSC_NATIVE_422_EN,
> +	DPU_DSC_MAX
>  };
>  
>  /**
> @@ -306,6 +312,14 @@ struct dpu_pp_blk {
>  };
>  
>  /**
> + * struct dpu_dsc_blk - DSC Encoder sub-blk information
> + * @info:   HW register and features supported by this sub-blk
> + */
> +struct dpu_dsc_blk {
> +	DPU_HW_SUBBLK_INFO;
> +};
> +
> +/**
>   * enum dpu_qos_lut_usage - define QoS LUT use cases
>   */
>  enum dpu_qos_lut_usage {
> @@ -452,6 +466,17 @@ struct dpu_pingpong_sub_blks {
>  };
>  
>  /**
> + * struct dpu_dsc_sub_blks - DSC sub-blks
> + * @enc: DSC encoder sub block
> + * @ctl: DSC controller sub block

Nit: sub-block, for both.

> + *

No need for this empty line.

> + */
> +struct dpu_dsc_sub_blks {
> +	struct dpu_dsc_blk enc;
> +	struct dpu_dsc_blk ctl;
> +};
> +
> +/**
>   * dpu_clk_ctrl_type - Defines top level clock control signals
>   */
>  enum dpu_clk_ctrl_type {
> @@ -605,10 +630,13 @@ struct dpu_merge_3d_cfg  {
>   * struct dpu_dsc_cfg - information of DSC blocks
>   * @id                 enum identifying this block
>   * @base               register offset of this block
> + * @len:               length of hardware block
>   * @features           bit mask identifying sub-blocks/features
> + * @sblk               sub-blocks information

Add trailing colon like you did for @len (we will add it to every other
field doc in a future fixing pass).

>   */
>  struct dpu_dsc_cfg {
>  	DPU_HW_BLK_INFO;
> +	const struct dpu_dsc_sub_blks *sblk;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 138080a..44fd624 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -1,5 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2020-2022, Linaro Limited */
> +/*
> + * Copyright (c) 2020-2022, Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
>  
>  #ifndef _DPU_HW_DSC_H
>  #define _DPU_HW_DSC_H
> @@ -69,6 +72,15 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
>  		void __iomem *addr);
>  
>  /**
> + * dpu_hw_dsc_init_1_2 - initializes the v1.2 DSC hw driver block

Add ()

We recently normalized this to "DSC hw driver object."

> + * @cfg:  DSC catalog entry for which driver object is required
> + * @addr: Mapped register io address of MDP
> + * Returns: Error code or allocated dpu_hw_dsc context
> + */
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
> +				       void __iomem *addr);
> +
> +/**
>   * dpu_hw_dsc_destroy - destroys dsc driver context
>   * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>   */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> new file mode 100644
> index 00000000..5bd84bd
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
> +#define DSC_CMN_MAIN_CNF           0x00
> +
> +/* DPU_DSC_ENC register offsets */
> +#define ENC_DF_CTRL                0x00
> +#define ENC_GENERAL_STATUS         0x04
> +#define ENC_HSLICE_STATUS          0x08
> +#define ENC_OUT_STATUS             0x0C
> +#define ENC_INT_STAT               0x10
> +#define ENC_INT_CLR                0x14
> +#define ENC_INT_MASK               0x18
> +#define DSC_MAIN_CONF              0x30
> +#define DSC_PICTURE_SIZE           0x34
> +#define DSC_SLICE_SIZE             0x38
> +#define DSC_MISC_SIZE              0x3C
> +#define DSC_HRD_DELAYS             0x40
> +#define DSC_RC_SCALE               0x44
> +#define DSC_RC_SCALE_INC_DEC       0x48
> +#define DSC_RC_OFFSETS_1           0x4C
> +#define DSC_RC_OFFSETS_2           0x50
> +#define DSC_RC_OFFSETS_3           0x54
> +#define DSC_RC_OFFSETS_4           0x58
> +#define DSC_FLATNESS_QP            0x5C
> +#define DSC_RC_MODEL_SIZE          0x60
> +#define DSC_RC_CONFIG              0x64
> +#define DSC_RC_BUF_THRESH_0        0x68
> +#define DSC_RC_BUF_THRESH_1        0x6C
> +#define DSC_RC_BUF_THRESH_2        0x70
> +#define DSC_RC_BUF_THRESH_3        0x74
> +#define DSC_RC_MIN_QP_0            0x78
> +#define DSC_RC_MIN_QP_1            0x7C
> +#define DSC_RC_MIN_QP_2            0x80
> +#define DSC_RC_MAX_QP_0            0x84
> +#define DSC_RC_MAX_QP_1            0x88
> +#define DSC_RC_MAX_QP_2            0x8C
> +#define DSC_RC_RANGE_BPG_OFFSETS_0 0x90
> +#define DSC_RC_RANGE_BPG_OFFSETS_1 0x94
> +#define DSC_RC_RANGE_BPG_OFFSETS_2 0x98
> +
> +/* DPU_DSC_CTL register offsets */
> +#define DSC_CTL                    0x00
> +#define DSC_CFG                    0x04
> +#define DSC_DATA_IN_SWAP           0x08
> +#define DSC_CLK_CTRL               0x0C
> +
> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)

Can you write out "ob" fully?

These don't need to be marked "inline", same below.

> +{
> +	int max_addr = 2400 / num_ss;

ss -> slice (or subslice), right?

> +
> +	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))
> +		max_addr /= 2;
> +
> +	return max_addr - 1;
> +};
> +
> +static inline void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	const struct dpu_dsc_sub_blks *sblk;
> +
> +	if (!hw_dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +	sblk = hw_dsc->caps->sblk;
> +	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, 0);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + ENC_DF_CTRL, 0);
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_MAIN_CONF, 0);
> +}
> +
> +static inline void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
> +					 struct drm_dsc_config *dsc,
> +					 u32 mode,
> +					 u32 initial_lines)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	const struct dpu_dsc_sub_blks *sblk;
> +	u32 data = 0;
> +	u32 det_thresh_flatness;
> +	u32 num_active_slice_per_enc;
> +	u32 bpp;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(0);
> +
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(1);
> +
> +	num_active_slice_per_enc = dsc->slice_count;
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		num_active_slice_per_enc = dsc->slice_count >> 1;

A /2 would be clearer to read, IMO.

> +
> +	data |= (num_active_slice_per_enc & 0x3) << 7;
> +
> +	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
> +
> +	data = (initial_lines & 0xff);
> +
> +	if (mode & DSC_MODE_VIDEO)
> +		data |= BIT(9);
> +
> +	data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_slice_per_enc) << 18);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + ENC_DF_CTRL, data);
> +
> +	data = (dsc->dsc_version_minor & 0xf) << 28;
> +	if (dsc->dsc_version_minor == 0x2) {
> +		if (dsc->native_422)
> +			data |= BIT(22);
> +		if (dsc->native_420)
> +			data |= BIT(21);
> +	}
> +
> +	bpp = dsc->bits_per_pixel;
> +	/* as per hw requirement bpp should be programmed
> +	 * twice the actual value in case of 420 or 422 encoding
> +	 */
> +	if (dsc->native_422 || dsc->native_420)
> +		bpp = 2 * bpp;
> +	data |= (dsc->block_pred_enable ? 1 : 0) << 20;

Below (e.g. convert_rgb) you just shift the bool without ternary if to 0
or 1: why here?

Or rewrite this one and convert_rgb to match the above and below:

    if (dsc->block_pred_enable)
        data |= BIT(20);
    if (dsc->convert_rgb)
        data |= BIT(4);

No need to invent multiple different styles within the same file.

> +	data |= bpp << 10;

Why not move this right below the calculation of bpp?  Seems odd to
intersperse block_pred_enable.

> +	data |= (dsc->line_buf_depth & 0xf) << 6;
> +	data |= dsc->convert_rgb << 4;
> +	data |= dsc->bits_per_component & 0xf;
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_MAIN_CONF, data);
> +
> +	data = (dsc->pic_width & 0xffff) |
> +		((dsc->pic_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_PICTURE_SIZE, data);
> +
> +	data = (dsc->slice_width & 0xffff) |
> +		((dsc->slice_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_SLICE_SIZE, data);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_MISC_SIZE,
> +		      (dsc->slice_chunk_size) & 0xffff);
> +
> +	data = (dsc->initial_xmit_delay & 0xffff) |
> +		((dsc->initial_dec_delay & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_HRD_DELAYS, data);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_SCALE,
> +		      dsc->initial_scale_value & 0x3f);
> +
> +	data = (dsc->scale_increment_interval & 0xffff) |
> +		((dsc->scale_decrement_interval & 0x7ff) << 16);

Is it correct that increment and decrement have a different amount of
bits?

> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_SCALE_INC_DEC, data);
> +
> +	data = (dsc->first_line_bpg_offset & 0x1f) |
> +		((dsc->second_line_bpg_offset & 0x1f) << 5);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_1, data);
> +
> +	data = (dsc->nfl_bpg_offset & 0xffff) |
> +		((dsc->slice_bpg_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_2, data);
> +
> +	data = (dsc->initial_offset & 0xffff) |
> +		((dsc->final_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_3, data);
> +
> +	data = (dsc->nsl_bpg_offset & 0xffff) |
> +		((dsc->second_line_offset_adj & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_4, data);
> +
> +	data = (dsc->flatness_min_qp & 0x1f);
> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;

Wrap these as a single data= expression to match the above.

> +
> +	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
> +	data |= (det_thresh_flatness & 0xff) << 10;

And fold this line into it, too.

> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_FLATNESS_QP, data);
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MODEL_SIZE,
> +		      (dsc->rc_model_size) & 0xffff);
> +
> +	data = dsc->rc_edge_factor & 0xf;
> +	data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
> +	data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
> +	data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
> +	data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_CONFIG, data);
> +
> +	/* program the dsc wrapper */
> +	data = BIT(0); /* encoder enable */
> +	if (dsc->native_422)
> +		data |= BIT(8);
> +	else if (dsc->native_420)
> +		data |= BIT(9);
> +	if (!dsc->convert_rgb)
> +		data |= BIT(10);
> +	if (dsc->bits_per_component == 8)
> +		data |= BIT(11);
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(12);
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(13);
> +	if (!(mode & DSC_MODE_VIDEO))
> +		data |= BIT(17);
> +
> +	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, data);
> +}
> +
> +static inline void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
> +						struct drm_dsc_config *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	const struct dpu_dsc_sub_blks *sblk;
> +	struct drm_dsc_rc_range_parameters *rc;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	rc = dsc->rc_range_params;
> +
> +	/*
> +	 * With BUF_THRESH -- 14 in total
> +	 * each register contains 4 thresh values with the last register
> +	 * containing only 2 thresh values
> +	 */
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_0,
> +		      (dsc->rc_buf_thresh[0] << 0) |
> +		      (dsc->rc_buf_thresh[1] << 8) |
> +		      (dsc->rc_buf_thresh[2] << 16) |
> +		      (dsc->rc_buf_thresh[3] << 24));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_1,
> +		      (dsc->rc_buf_thresh[4] << 0) |
> +		      (dsc->rc_buf_thresh[5] << 8) |
> +		      (dsc->rc_buf_thresh[6] << 16) |
> +		      (dsc->rc_buf_thresh[7] << 24));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_2,
> +		      (dsc->rc_buf_thresh[8] << 0) |
> +		      (dsc->rc_buf_thresh[9] << 8) |
> +		      (dsc->rc_buf_thresh[10] << 16) |
> +		      (dsc->rc_buf_thresh[11] << 24));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_3,
> +		      (dsc->rc_buf_thresh[12] << 0) |
> +		      (dsc->rc_buf_thresh[13] << 8));

I'm still thrown-off by the fact that rc_buf_thresh is u16, but assumed
everywhere to only contain 8 valid bits.

Rest of the patch appears okay, but I'll try to test it on actual
hardware too.

- Marijn

> +
> +	/*
> +	 * with min/max_QP -- 5 bits
> +	 * each register contains 5 min_qp or max_qp for total of 15
> +	 *
> +	 * With BPG_OFFSET -- 6 bits
> +	 * each register contains 5 BPG_offset for total of 15
> +	 */
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_0,
> +		      (rc[0].range_min_qp << 0) |
> +		      (rc[1].range_min_qp << 5) |
> +		      (rc[2].range_min_qp << 10) |
> +		      (rc[3].range_min_qp << 15) |
> +		      (rc[4].range_min_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_0,
> +		      (rc[0].range_max_qp << 0) |
> +		      (rc[1].range_max_qp << 5) |
> +		      (rc[2].range_max_qp << 10) |
> +		      (rc[3].range_max_qp << 15) |
> +		      (rc[4].range_max_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_0,
> +		      (rc[0].range_bpg_offset << 0) |
> +		      (rc[1].range_bpg_offset << 6) |
> +		      (rc[2].range_bpg_offset << 12) |
> +		      (rc[3].range_bpg_offset << 18) |
> +		      (rc[4].range_bpg_offset << 24));
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_1,
> +		      (rc[5].range_min_qp << 0) |
> +		      (rc[6].range_min_qp << 5) |
> +		      (rc[7].range_min_qp << 10) |
> +		      (rc[8].range_min_qp << 15) |
> +		      (rc[9].range_min_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_1,
> +		      (rc[5].range_max_qp << 0) |
> +		      (rc[6].range_max_qp << 5) |
> +		      (rc[7].range_max_qp << 10) |
> +		      (rc[8].range_max_qp << 15) |
> +		      (rc[9].range_max_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_1,
> +		      (rc[5].range_bpg_offset << 0) |
> +		      (rc[6].range_bpg_offset << 6) |
> +		      (rc[7].range_bpg_offset << 12) |
> +		      (rc[8].range_bpg_offset << 18) |
> +		      (rc[9].range_bpg_offset << 24));
> +
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_2,
> +		      (rc[10].range_min_qp << 0) |
> +		      (rc[11].range_min_qp << 5) |
> +		      (rc[12].range_min_qp << 10) |
> +		      (rc[13].range_min_qp << 15) |
> +		      (rc[14].range_min_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_2,
> +		      (rc[10].range_max_qp << 0) |
> +		      (rc[11].range_max_qp << 5) |
> +		      (rc[12].range_max_qp << 10) |
> +		      (rc[13].range_max_qp << 15) |
> +		      (rc[14].range_max_qp << 20));
> +	DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_2,
> +		      (rc[10].range_bpg_offset << 0) |
> +		      (rc[11].range_bpg_offset << 6) |
> +		      (rc[12].range_bpg_offset << 12) |
> +		      (rc[13].range_bpg_offset << 18) |
> +		      (rc[14].range_bpg_offset << 24));
> +}
> +
> +static inline void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
> +						    const enum dpu_pingpong pp)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	const struct dpu_dsc_sub_blks *sblk;
> +	int mux_cfg = 0xf; /* Disabled */
> +
> +	hw = &hw_dsc->hw;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	if (pp)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
> +}
> +
> +static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
> +			       const unsigned long features)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
> +	ops->dsc_config = dpu_hw_dsc_config_1_2;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
> +	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
> +}
> +
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
> +				       void __iomem *addr)
> +{
> +	struct dpu_hw_dsc *c;
> +
> +	c = kzalloc(sizeof(*c), GFP_KERNEL);
> +	if (!c)
> +		return ERR_PTR(-ENOMEM);
> +
> +	c->hw.blk_addr = addr + cfg->base;
> +	c->hw.log_mask = DPU_DBG_MASK_DSC;
> +
> +	c->idx = cfg->id;
> +	c->caps = cfg;
> +	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
> +
> +	return c;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f0fc704..502dd60 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> @@ -246,7 +247,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_dsc *hw;
>  		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>  
> -		hw = dpu_hw_dsc_init(dsc, mmio);
> +		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
> +			hw = dpu_hw_dsc_init_1_2(dsc, mmio);
> +		else
> +			hw = dpu_hw_dsc_init(dsc, mmio);
> +
>  		if (IS_ERR_OR_NULL(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed dsc object creation: err %d\n", rc);
> -- 
> 2.7.4
> 
