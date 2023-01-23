Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828A67874B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22A610E218;
	Mon, 23 Jan 2023 20:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5E810E218
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:11:37 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1E62E207FE;
 Mon, 23 Jan 2023 21:11:35 +0100 (CET)
Date: Mon, 23 Jan 2023 21:11:33 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v1 10/14] drm/msm/disp/dpu: add supports of DSC encoder
 v1.2 engine
Message-ID: <20230123201133.zzt2zbyaw3pfkzi6@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674498274-6010-11-git-send-email-quic_khsieh@quicinc.com>
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

add support for*

drm/msm/dpu*

On 2023-01-23 10:24:30, Kuogee Hsieh wrote:
> DSC V1.2 encoder engine is newly added hardware module. This patch
> add support functions to configure and enable DSC V1.2 encoder engine.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  60 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     |  23 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  23 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 371 +++++++++++++++++++++++++
>  6 files changed, 463 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 28cf52b..271c29a15 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_ctl.o \
>  	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_hw_dsc_1_2.o \
>  	disp/dpu1/dpu_dsc_helper.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
>  	disp/dpu1/dpu_hw_intf.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7f4a439..901e317 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1821,7 +1821,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  				     u32 initial_lines)
>  {
>  	if (hw_dsc->ops.dsc_config)
> -		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines);
> +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines, false);

As usual, an enum is better: readers have no idea what a free-floating
bool means.

>  
>  	if (hw_dsc->ops.dsc_config_thresh)
>  		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 978e3bd..7b0b092 100644
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
> @@ -11,6 +11,7 @@
>  #include <linux/bug.h>
>  #include <linux/bitmap.h>
>  #include <linux/err.h>
> +#include "dpu_hw_mdss.h"

Unused if you remove the unused DECLARE_BITMAP(dsc_pair_mask, DSC_MAX).

>  
>  /**
>   * Max hardware block count: For ex: max 12 SSPP pipes or
> @@ -182,6 +183,7 @@ enum {
>   * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>   * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>   * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> + * @DPU_PINGPONG_DSC,       Display stream compression blocks
>   * @DPU_PINGPONG_DITHER,    Dither blocks
>   * @DPU_PINGPONG_MAX
>   */
> @@ -190,10 +192,32 @@ enum {
>  	DPU_PINGPONG_TE2,
>  	DPU_PINGPONG_SPLIT,
>  	DPU_PINGPONG_SLAVE,
> +	DPU_PINGPONG_DSC,

This is not used.

>  	DPU_PINGPONG_DITHER,
>  	DPU_PINGPONG_MAX
>  };
>  
> +
> +/** DSC sub-blocks/features

Newline between /** and the text.

> + * @DPU_DSC_OUTPUT_CTRL         Supports the control of the pp id which gets
> + *                              the pixel output from this DSC.

The original comment is much more concise, can we keep it?

> + * @DPU_DSC_HW_REV_1_1          dsc block supports dsc 1.1 only
> + * @DPU_DSC_HW_REV_1_2          dsc block supports dsc 1.1 and 1.2

Capitalize DSC just like elsewhere.

> + * @DPU_DSC_NATIVE_422_EN,      Supports native422 and native420 encoding
> + * @DPU_DSC_ENC,                DSC encoder sub block
> + * @DPU_DSC_CTL,                DSC ctl sub block

No need for trailing commas in doc comments; if anything replace them
with colons?

> + * @DPU_DSC_MAX
> + */
> +enum {
> +	DPU_DSC_OUTPUT_CTRL = 0x1,
> +	DPU_DSC_HW_REV_1_1,
> +	DPU_DSC_HW_REV_1_2,
> +	DPU_DSC_NATIVE_422_EN,
> +	DPU_DSC_ENC,
> +	DPU_DSC_CTL,

These two enum values only have a meaning within the dpu_hw_dsc_1_2.c
file, and have nothing to do with the other feature flags/block
description.  Please move them there (and give _dsc_subblk_offset a
proper enum type).

> +	DPU_DSC_MAX
> +};
> +
>  /**
>   * CTL sub-blocks
>   * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> @@ -276,15 +300,6 @@ enum {
>  };
>  
>  /**
> - * DSC features
> - * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
> - *                            the pixel output from this DSC.
> - */
> -enum {
> -	DPU_DSC_OUTPUT_CTRL = 0x1,

Did this have to move?

> -};
> -
> -/**
>   * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
>   * @name:              string name for debug purposes
>   * @id:                enum identifying this block
> @@ -346,6 +361,14 @@ struct dpu_pp_blk {
>  };
>  
>  /**
> + * struct dpu_dsc_blk : DSC Encoder sub-blk information

Use a hyphen here and everywhere else:
https://docs.kernel.org/doc-guide/kernel-doc.html

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
> @@ -403,6 +426,7 @@ struct dpu_rotation_cfg {
>   * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>   * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>   * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
> + * @max_dsc_width      max dsc line width support.

DSC*

>   */
>  struct dpu_caps {
>  	u32 max_mixer_width;
> @@ -419,6 +443,7 @@ struct dpu_caps {
>  	u32 pixel_ram_size;
>  	u32 max_hdeci_exp;
>  	u32 max_vdeci_exp;
> +	u32 max_dsc_width;

This is never read.

>  };
>  
>  /**
> @@ -494,9 +519,20 @@ struct dpu_dspp_sub_blks {
>  struct dpu_pingpong_sub_blks {
>  	struct dpu_pp_blk te;
>  	struct dpu_pp_blk te2;
> +	struct dpu_pp_blk dsc;

Unused.

>  	struct dpu_pp_blk dither;
>  };
>  
> +
> +/**
> + * struct dpu_dsc_sub_blks : DSC sub-blks
> + *

A sub-block of sub-blocks?  Use the documentation to explain what this
is for, describe @enc and @ctl.

> + */
> +struct dpu_dsc_sub_blks {
> +	struct dpu_dsc_blk enc;
> +	struct dpu_dsc_blk ctl;
> +};
> +
>  /**
>   * dpu_clk_ctrl_type - Defines top level clock control signals
>   */
> @@ -641,10 +677,14 @@ struct dpu_merge_3d_cfg  {
>   * struct dpu_dsc_cfg - information of DSC blocks
>   * @id                 enum identifying this block
>   * @base               register offset of this block
> + * @len:               length of hardware block
>   * @features           bit mask identifying sub-blocks/features
> + * @dsc_pair_mask:     Bitmask of DSCs that can be controlled by same CTL
>   */
>  struct dpu_dsc_cfg {
>  	DPU_HW_BLK_INFO;
> +	DECLARE_BITMAP(dsc_pair_mask, DSC_MAX);

This bitmask is unused.

> +	const struct dpu_dsc_sub_blks *sblk;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926d..51e8890 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2020-2022, Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
>   */
>  
>  #include "dpu_kms.h"
> @@ -41,10 +42,11 @@ static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
>  static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  			      struct drm_dsc_config *dsc,
>  			      u32 mode,
> -			      u32 initial_lines)
> +			      u32 initial_lines,
> +			      bool ich_reset_override)
>  {
>  	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> -	u32 data;
> +	u32 data, lsb, bpp;
>  	u32 slice_last_group_size;
>  	u32 det_thresh_flatness;
>  	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
> @@ -58,7 +60,14 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	data = (initial_lines << 20);
>  	data |= ((slice_last_group_size - 1) << 18);
>  	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> -	data |= (dsc->bits_per_pixel << 8);
> +	data |= dsc->bits_per_pixel << 12;
> +	lsb = dsc->bits_per_pixel % 4;
> +	bpp = dsc->bits_per_pixel / 4;
> +	bpp *= 4;
> +	bpp <<= 4;
> +	bpp |= lsb;
> +
> +	data |= bpp << 8;

Why are you re-adding this nonsense?  It was removed in [1] _and_ does
not account for bits_per_pixel _already being in x.4 format_. This will
regress existing hardware.

[1]: https://lore.kernel.org/linux-arm-msm/20221026182824.876933-10-marijn.suijten@somainline.org/

>  	data |= (dsc->block_pred_enable << 7);
>  	data |= (dsc->line_buf_depth << 3);
>  	data |= (dsc->simple_422 << 2);
> @@ -221,7 +230,13 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>  
>  	c->idx = idx;
>  	c->caps = cfg;
> -	_setup_dsc_ops(&c->ops, c->caps->features);
> +
> +	if (test_bit(DPU_DSC_HW_REV_1_1, &c->caps->features))
> +		_setup_dsc_ops(&c->ops, c->caps->features);
> +	else if (test_bit(DPU_DSC_HW_REV_1_2, &c->caps->features))
> +		dpu_dsc_1_2_setup_ops(&c->ops, c->caps->features);
> +	else
> +		_setup_dsc_ops(&c->ops, c->caps->features);
>  
>  	return c;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index ae9b5db..a48f572 100644
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
> @@ -33,7 +36,8 @@ struct dpu_hw_dsc_ops {
>  	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
>  			   struct drm_dsc_config *dsc,
>  			   u32 mode,
> -			   u32 initial_lines);
> +			   u32 initial_lines,
> +			   bool ich_reset_override);
>  
>  	/**
>  	 * dsc_config_thresh - programs panel thresholds
> @@ -43,6 +47,12 @@ struct dpu_hw_dsc_ops {
>  	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
>  				  struct drm_dsc_config *dsc);
>  
> +	/**
> +	 * bind_pingpong_blk - enable/disable the connection with pp

Inherit docs from the enum.

> +	 * @hw_dsc: Pointer to dsc context

DSC*

> +	 * @enable: enable/disable connection
> +	 * @pp: pingpong blk id

It's documentation, write out block fully.

> +	 */
>  	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
>  				  bool enable,
>  				  enum dpu_pingpong pp);
> @@ -51,6 +61,7 @@ struct dpu_hw_dsc_ops {
>  struct dpu_hw_dsc {
>  	struct dpu_hw_blk base;
>  	struct dpu_hw_blk_reg_map hw;
> +	struct dpu_hw_ctl *hw_ctl;

Unused.

>  
>  	/* dsc */
>  	enum dpu_dsc idx;
> @@ -76,9 +87,17 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>   */
>  void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
>  
> +/**
> + * dpu_hw_dsc - convert base object dpu_hw_base to container
> + * @hw: Pointer to base hardware block
> + * return: Pointer to hardware block container
> + */
>  static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
>  {
>  	return container_of(hw, struct dpu_hw_dsc, base);
>  }
>  
> +void dpu_dsc_1_2_setup_ops(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features);
> +
>  #endif /* _DPU_HW_DSC_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> new file mode 100644
> index 00000000..2be74ae
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
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
> +#define DSC_RC_MAX_QP_2             0x8C
> +#define DSC_RC_RANGE_BPG_OFFSETS_0  0x90
> +#define DSC_RC_RANGE_BPG_OFFSETS_1  0x94
> +#define DSC_RC_RANGE_BPG_OFFSETS_2  0x98

Reindent to line this back up.

> +
> +/* DPU_DSC_CTL register offsets */
> +#define DSC_CTL                    0x00
> +#define DSC_CFG                    0x04
> +#define DSC_DATA_IN_SWAP           0x08
> +#define DSC_CLK_CTRL               0x0C
> +
> +
> +static int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)
> +{
> +	enum dpu_dsc idx;
> +
> +	idx = hw_dsc->idx;
> +
> +	if (!(hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))) {

Why not swap the bodies instead of inverting this.

> +		if (num_ss == 1)
> +			return 2399;
> +		else if (num_ss == 2)
> +			return 1199;
> +	} else {
> +		if (num_ss == 1)
> +			return 1199;
> +		else if (num_ss == 2)
> +			return 599;
> +	}
> +	return 0;
> +}
> +
> +static inline int _dsc_subblk_offset(struct dpu_hw_dsc *hw_dsc, int s_id,
> +		u32 *idx)
> +{
> +	const struct dpu_dsc_sub_blks *sblk;
> +
> +	if (!hw_dsc)
> +		return -EINVAL;
> +
> +	*idx = 0;
> +
> +	sblk = hw_dsc->caps->sblk;
> +
> +	switch (s_id) {
> +
> +	case DPU_DSC_ENC:
> +		*idx = sblk->enc.base;
> +		break;
> +	case DPU_DSC_CTL:
> +		*idx = sblk->ctl.base;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 idx;

Can we rename these to offset or subblk_offset or something more clear?

> +
> +	if (!hw_dsc)
> +		return;
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;

These error checks are excessive: you pass in a non-null hw_dsc and
known enum constant - _dsc_subblk_offset should perhaps not return
errors at all.

> +
> +	hw = &hw_dsc->hw;
> +	DPU_REG_WRITE(hw, DSC_CFG + idx, 0);

Swap the arguments to + so that it's clear that DSC_CFG is a register on
the subblock offset denoted by "idx", not the other way around.

> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	DPU_REG_WRITE(hw, ENC_DF_CTRL + idx, 0);
> +	DPU_REG_WRITE(hw, DSC_MAIN_CONF + idx, 0);
> +}
> +
> +static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
> +		struct drm_dsc_config *dsc, u32 mode,
> +		u32 initial_lines, bool ich_reset_override)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	struct msm_display_dsc_info *dsc_info;
> +	u32 idx;
> +	u32 data = 0;
> +	u32 bpp;
> +	void __iomem *off;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	dsc_info = to_msm_dsc_info(dsc);
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	if (mode & DSC_MODE_SPLIT_PANEL)
> +		data |= BIT(0);
> +
> +	if (mode & DSC_MODE_MULTIPLEX)
> +		data |= BIT(1);

These are well known bitwise definitions for a reason, data |= mode will
do (or out DSC_MODE_VIDEO since you have to shift that one at BIT(9).

> +
> +	data |= (dsc_info->num_active_ss_per_enc & 0x3) << 7;
> +
> +	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
> +
> +	data = (dsc_info->initial_lines & 0xff);

You already get initial_lines passed as function argument, but ignore
it?

> +	data |= ((mode & DSC_MODE_VIDEO) ? 1 : 0) << 9;

Yuck. if (mode & DSC_MODE_VIDEO) data |= BIT(9);.

> +	if (ich_reset_override)
> +		data |= 0xC00; // set bit 10 and 11

Instead of a comment, make this self-describing BIT(10) | BIT(11) code.

> +	data |= (_dsc_calc_ob_max_addr(hw_dsc, dsc_info->num_active_ss_per_enc) << 18);
> +
> +	DPU_REG_WRITE(hw, ENC_DF_CTRL + idx, data);
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

As above, don't forget to read the documentation on this field:

    Target bits per pixel with 4 fractional bits, bits_per_pixel << 4

> +	/* as per hw requirement bpp should be programmed
> +	 * twice the actual value in case of 420 or 422 encoding
> +	 */
> +	if (dsc->native_422 || dsc->native_420)
> +		bpp = 2 * bpp;
> +	data |= (dsc->block_pred_enable ? 1 : 0) << 20;
> +	data |= (bpp << 10);

Either wrap everything or nothing in ().

> +	data |= (dsc->line_buf_depth & 0xf) << 6;
> +	data |= dsc->convert_rgb << 4;
> +	data |= dsc->bits_per_component & 0xf;
> +
> +	DPU_REG_WRITE(hw, DSC_MAIN_CONF + idx, data);
> +
> +	data = (dsc->pic_width & 0xffff) |
> +		((dsc->pic_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_PICTURE_SIZE + idx, data);
> +
> +	data = (dsc->slice_width & 0xffff) |
> +		((dsc->slice_height & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_SLICE_SIZE + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_MISC_SIZE + idx,
> +			(dsc->slice_chunk_size) & 0xffff);
> +
> +	data = (dsc->initial_xmit_delay & 0xffff) |
> +		((dsc->initial_dec_delay & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_HRD_DELAYS + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_SCALE + idx,
> +			dsc->initial_scale_value & 0x3f);
> +
> +	data = (dsc->scale_increment_interval & 0xffff) |
> +		((dsc->scale_decrement_interval & 0x7ff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_SCALE_INC_DEC + idx, data);
> +
> +	data = (dsc->first_line_bpg_offset & 0x1f) |
> +		((dsc->second_line_bpg_offset & 0x1f) << 5);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_1 + idx, data);
> +
> +	data = (dsc->nfl_bpg_offset & 0xffff) |
> +		((dsc->slice_bpg_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_2 + idx, data);
> +
> +	data = (dsc->initial_offset & 0xffff) |
> +		((dsc->final_offset & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_3 + idx, data);
> +
> +	data = (dsc->nsl_bpg_offset & 0xffff) |
> +		((dsc->second_line_offset_adj & 0xffff) << 16);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_OFFSETS_4 + idx, data);
> +
> +	data = (dsc->flatness_min_qp & 0x1f);
> +	data |= (dsc->flatness_max_qp & 0x1f) << 5;
> +	data |= (dsc_info->det_thresh_flatness & 0xff) << 10;

dpu_hw_dsc.c computes this on the fly.  After removing that, and
using initial_lines from the function parameters, only
dsc_info->num_active_ss_per_enc remains.  Do you really need that
msm_display_dsc_info struct here, do you need it at all?

> +
> +	DPU_REG_WRITE(hw, DSC_FLATNESS_QP + idx, data);
> +
> +	DPU_REG_WRITE(hw, DSC_RC_MODEL_SIZE + idx,
> +			(dsc->rc_model_size) & 0xffff);
> +
> +	data = dsc->rc_edge_factor & 0xf;
> +	data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
> +	data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
> +	data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
> +	data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
> +
> +	DPU_REG_WRITE(hw, DSC_RC_CONFIG + idx, data);
> +
> +	/* program the dsc wrapper */
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;
> +
> +	off = hw->blk_addr + idx;
> +
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
> +	if (dsc_info->dsc_4hsmerge_en) {
> +		data |= dsc_info->dsc_4hsmerge_padding << 18;
> +		data |= dsc_info->dsc_4hsmerge_alignment << 22;
> +		data |= BIT(16);
> +	}
> +
> +	DPU_REG_WRITE(hw, DSC_CFG + idx, data);
> +
> +//	DPU_REG_WRITE(hw, DSC_DATA_IN_SWAP + idx, 0x14e5);

No commented-out code please, especially not with //

> +}
> +
> +static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
> +		struct drm_dsc_config *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	struct msm_display_dsc_info *dsc_info;
> +	u32 idx, off;
> +	int i, j = 0;
> +	struct drm_dsc_rc_range_parameters *rc;
> +	u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &idx))
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +
> +	dsc_info = to_msm_dsc_info(dsc);
> +
> +	rc = dsc->rc_range_params;
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> +		data |= dsc->rc_buf_thresh[i] << (8*j);

Lack of spaces does not make this multiplication any prettier to read.

* has precedence over << but it's better to replicate the () below as
well.

> +		j++;
> +		if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
> +			DPU_REG_WRITE(hw, DSC_RC_BUF_THRESH_0 + idx + off,
> +					data);
> +			off += 4;
> +			j = 0;
> +			data = 0;
> +		}
> +	}
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		min_qp |= (rc[i].range_min_qp & 0x1f) << 5*j;
> +		max_qp |= (rc[i].range_max_qp & 0x1f) << 5*j;
> +		bpg_off |= (rc[i].range_bpg_offset & 0x3f) << 6*j;

These values _must_ already be masked to be useful in
drm_dsc_compute_rc_parameters(), no need to mask them again just like
the v1.1 block implementation.

> +		j++;
> +		if (j == 5) {
> +			DPU_REG_WRITE(hw, DSC_RC_MIN_QP_0 + idx + off,
> +					min_qp);
> +			DPU_REG_WRITE(hw, DSC_RC_MAX_QP_0 + idx + off,
> +					max_qp);
> +			DPU_REG_WRITE(hw,
> +					DSC_RC_RANGE_BPG_OFFSETS_0 + idx + off,
> +					bpg_off);
> +			off += 4;
> +			j = 0;
> +			min_qp = 0;
> +			max_qp = 0;
> +			bpg_off = 0;
> +		}
> +	}
> +}
> +
> +static void dpu_hw_dsc_bind_pingpong_blk_1_2(
> +		struct dpu_hw_dsc *hw_dsc,
> +		bool enable,
> +		const enum dpu_pingpong pp)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	int idx;
> +	int mux_cfg = 0xF; /* Disabled */

Lowercase hex (and anywhere else if I skipped any).

> +
> +	if (!hw_dsc)
> +		return;

As with the v1.1 implementation, we don't check this, and your function
below also checks it (but it does not need to).

> +	if (_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &idx))
> +		return;
> +
> +	hw = &hw_dsc->hw;
> +	if (enable)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DPU_REG_WRITE(hw, DSC_CTL + idx, mux_cfg);
> +}
> +
> +void dpu_dsc_1_2_setup_ops(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
> +	ops->dsc_config = dpu_hw_dsc_config_1_2;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
> +	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
> +}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

All in all you really need to revise and clean your patches before
sending them to the lists; these are already far too many comments and
nits, and massively take away from reviewing code behaviour which I have
not even started with after looking at 1 out of 14 patches :(

- Marijn
