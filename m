Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21E508DE5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B0210E120;
	Wed, 20 Apr 2022 17:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031FB10E0B0;
 Wed, 20 Apr 2022 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650474119; x=1682010119;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8fJ4zzgCRot6zO5LBmCQ+wuktpjzbU4EqCV/EOdKWNI=;
 b=K0snVVbxqcUpA2TTezo9rkkWgVw4Xh9WR9l0dkXXEnBB/pYbTROvtQLr
 bm9CwR/wy85X+dnOgWyMZ4r7vP0sRhp1eXqfeZoU48H2B3UZ+RFtu88tF
 FvfvTF+zmD+MHuLEolGL8I6CPmAzWD4v7tQbboAtnX6O0qzsgi9sIopCe c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Apr 2022 10:01:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:01:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 10:01:57 -0700
Received: from [10.111.175.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Apr
 2022 10:01:54 -0700
Message-ID: <32e84508-a2d5-afac-fa9a-53ad6b4f0492@quicinc.com>
Date: Wed, 20 Apr 2022 10:01:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 06/17] drm/msm/dpu: add dpu_hw_wb abstraction for
 writeback blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-7-git-send-email-quic_abhinavk@quicinc.com>
 <78612521-190c-0706-7654-2f6221485f2b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <78612521-190c-0706-7654-2f6221485f2b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2022 12:20 AM, Dmitry Baryshkov wrote:
> On 20/04/2022 04:45, Abhinav Kumar wrote:
>> Add the dpu_hw_wb abstraction to program registers related to the
>> writeback block. These will be invoked once all the configuration
>> is set and ready to be programmed to the registers.
>>
>> changes in v2:
>>     - remove multiple empty lines at the end of the file
>>     - change dpu_hw_wb_bind_pingpong_blk to preserve upper bits
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> It's still Reviewed-by, few nits below.
> 
>> ---
>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 273 
>> ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h | 131 ++++++++++++++
>>   3 files changed, 405 insertions(+)
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index d5ca2e6..ca779c1 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -74,6 +74,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>       disp/dpu1/dpu_hw_top.o \
>>       disp/dpu1/dpu_hw_util.o \
>>       disp/dpu1/dpu_hw_vbif.o \
>> +    disp/dpu1/dpu_hw_wb.o \
>>       disp/dpu1/dpu_kms.o \
>>       disp/dpu1/dpu_plane.o \
>>       disp/dpu1/dpu_rm.o \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> new file mode 100644
>> index 0000000..afa8aab
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>> @@ -0,0 +1,273 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> + /*
>> +  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> +  */
>> +
>> +#include "dpu_hw_mdss.h"
>> +#include "dpu_hwio.h"
>> +#include "dpu_hw_catalog.h"
>> +#include "dpu_hw_wb.h"
>> +#include "dpu_formats.h"
>> +#include "dpu_kms.h"
>> +
>> +#define WB_DST_FORMAT                         0x000
>> +#define WB_DST_OP_MODE                        0x004
>> +#define WB_DST_PACK_PATTERN                   0x008
>> +#define WB_DST0_ADDR                          0x00C
>> +#define WB_DST1_ADDR                          0x010
>> +#define WB_DST2_ADDR                          0x014
>> +#define WB_DST3_ADDR                          0x018
>> +#define WB_DST_YSTRIDE0                       0x01C
>> +#define WB_DST_YSTRIDE1                       0x020
>> +#define WB_DST_YSTRIDE1                       0x020
>> +#define WB_DST_DITHER_BITDEPTH                0x024
>> +#define WB_DST_MATRIX_ROW0                    0x030
>> +#define WB_DST_MATRIX_ROW1                    0x034
>> +#define WB_DST_MATRIX_ROW2                    0x038
>> +#define WB_DST_MATRIX_ROW3                    0x03C
>> +#define WB_DST_WRITE_CONFIG                   0x048
>> +#define WB_ROTATION_DNSCALER                  0x050
>> +#define WB_ROTATOR_PIPE_DOWNSCALER            0x054
>> +#define WB_N16_INIT_PHASE_X_C03               0x060
>> +#define WB_N16_INIT_PHASE_X_C12               0x064
>> +#define WB_N16_INIT_PHASE_Y_C03               0x068
>> +#define WB_N16_INIT_PHASE_Y_C12               0x06C
>> +#define WB_OUT_SIZE                           0x074
>> +#define WB_ALPHA_X_VALUE                      0x078
>> +#define WB_DANGER_LUT                         0x084
>> +#define WB_SAFE_LUT                           0x088
>> +#define WB_QOS_CTRL                           0x090
>> +#define WB_CREQ_LUT_0                         0x098
>> +#define WB_CREQ_LUT_1                         0x09C
>> +#define WB_UBWC_STATIC_CTRL                   0x144
>> +#define WB_MUX                                0x150
>> +#define WB_CROP_CTRL                          0x154
>> +#define WB_CROP_OFFSET                        0x158
>> +#define WB_CSC_BASE                           0x260
>> +#define WB_DST_ADDR_SW_STATUS                 0x2B0
>> +#define WB_CDP_CNTL                           0x2B4
>> +#define WB_OUT_IMAGE_SIZE                     0x2C0
>> +#define WB_OUT_XY                             0x2C4
>> +
>> +/* WB_QOS_CTRL */
>> +#define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
>> +
>> +static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
>> +        const struct dpu_mdss_cfg *m, void __iomem *addr,
>> +        struct dpu_hw_blk_reg_map *b)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < m->wb_count; i++) {
>> +        if (wb == m->wb[i].id) {
>> +            b->base_off = addr;
>> +            b->blk_off = m->wb[i].base;
>> +            b->length = m->wb[i].len;
>> +            b->hwversion = m->hwversion;
>> +            return &m->wb[i];
>> +        }
>> +    }
>> +    return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
>> +        struct dpu_hw_wb_cfg *data)
>> +{
>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +
>> +    DPU_REG_WRITE(c, WB_DST0_ADDR, data->dest.plane_addr[0]);
>> +    DPU_REG_WRITE(c, WB_DST1_ADDR, data->dest.plane_addr[1]);
>> +    DPU_REG_WRITE(c, WB_DST2_ADDR, data->dest.plane_addr[2]);
>> +    DPU_REG_WRITE(c, WB_DST3_ADDR, data->dest.plane_addr[3]);
>> +}
>> +
>> +static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>> +        struct dpu_hw_wb_cfg *data)
>> +{
> 
> This function shares significant logic with dpu_hw_sspp_setup_format().
> 
> We should consider splitting the common code to the helper at some point 
> (later).

Agreed, I do see some similarities. Will take this up in another change.

> 
>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +    const struct dpu_format *fmt = data->dest.format;
>> +    u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
>> +    u32 write_config = 0;
>> +    u32 opmode = 0;
>> +    u32 dst_addr_sw = 0;
>> +
>> +    chroma_samp = fmt->chroma_sample;
>> +
>> +    dst_format = (chroma_samp << 23) |
>> +        (fmt->fetch_planes << 19) |
>> +        (fmt->bits[C3_ALPHA] << 6) |
>> +        (fmt->bits[C2_R_Cr] << 4) |
>> +        (fmt->bits[C1_B_Cb] << 2) |
>> +        (fmt->bits[C0_G_Y] << 0);
>> +
>> +    if (fmt->bits[C3_ALPHA] || fmt->alpha_enable) {
>> +        dst_format |= BIT(8); /* DSTC3_EN */
>> +        if (!fmt->alpha_enable ||
>> +            !(ctx->caps->features & BIT(DPU_WB_PIPE_ALPHA)))
>> +            dst_format |= BIT(14); /* DST_ALPHA_X */
>> +    }
>> +
>> +    pattern = (fmt->element[3] << 24) |
>> +        (fmt->element[2] << 16) |
>> +        (fmt->element[1] << 8)  |
>> +        (fmt->element[0] << 0);
>> +
>> +    dst_format |= (fmt->unpack_align_msb << 18) |
>> +        (fmt->unpack_tight << 17) |
>> +        ((fmt->unpack_count - 1) << 12) |
>> +        ((fmt->bpp - 1) << 9);
>> +
>> +    ystride0 = data->dest.plane_pitch[0] |
>> +        (data->dest.plane_pitch[1] << 16);
>> +    ystride1 = data->dest.plane_pitch[2] |
>> +    (data->dest.plane_pitch[3] << 16);
>> +
>> +    if (drm_rect_height(&data->roi) && drm_rect_width(&data->roi))
>> +        outsize = (drm_rect_height(&data->roi) << 16) | 
>> drm_rect_width(&data->roi);
>> +    else
>> +        outsize = (data->dest.height << 16) | data->dest.width;
>> +
>> +    DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xFF);
>> +    DPU_REG_WRITE(c, WB_DST_FORMAT, dst_format);
>> +    DPU_REG_WRITE(c, WB_DST_OP_MODE, opmode);
>> +    DPU_REG_WRITE(c, WB_DST_PACK_PATTERN, pattern);
>> +    DPU_REG_WRITE(c, WB_DST_YSTRIDE0, ystride0);
>> +    DPU_REG_WRITE(c, WB_DST_YSTRIDE1, ystride1);
>> +    DPU_REG_WRITE(c, WB_OUT_SIZE, outsize);
>> +    DPU_REG_WRITE(c, WB_DST_WRITE_CONFIG, write_config);
>> +    DPU_REG_WRITE(c, WB_DST_ADDR_SW_STATUS, dst_addr_sw);
>> +}
>> +
>> +static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg 
>> *wb)
>> +{
>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +    u32 image_size, out_size, out_xy;
>> +
>> +    image_size = (wb->dest.height << 16) | wb->dest.width;
>> +    out_xy = 0;
>> +    out_size = (drm_rect_height(&wb->roi) << 16) | 
>> drm_rect_width(&wb->roi);
>> +
>> +    DPU_REG_WRITE(c, WB_OUT_IMAGE_SIZE, image_size);
>> +    DPU_REG_WRITE(c, WB_OUT_XY, out_xy);
>> +    DPU_REG_WRITE(c, WB_OUT_SIZE, out_size);
>> +}
>> +
>> +static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>> +        struct dpu_hw_wb_qos_cfg *cfg)
> I like the single call approach. Maybe we should adopt it for the SSPP 
> QoS LUT too.

Perhaps yes.

I had an overall question on this. all the dpu_hw_*** APIs accept their 
own unique ctx (which is the *** hardware they are programming). What is 
the approach you are suggesting to unify these?

For helper calls I understood and already have addressed it in this series.

But looking ahead for dpu_hw_*** calls, I am still unclear on the 
unification plan.

Again, this is for a follow-up change but I am just trying to understand it.

> 
>> +{
>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +    u32 qos_ctrl = 0;
>> +
>> +    if (!ctx || !cfg)
>> +        return;
>> +
>> +    DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>> +    DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
>> +
>> +    if (ctx->caps && test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features)) {
>> +        DPU_REG_WRITE(c, WB_CREQ_LUT_0, cfg->creq_lut);
>> +        DPU_REG_WRITE(c, WB_CREQ_LUT_1, cfg->creq_lut >> 32);
>> +    }
> 
> Is there a plain WB_CREQ_LUT for the non-8LVL case?
> 
>> +
>> +    if (cfg->danger_safe_en)
>> +        qos_ctrl |= WB_QOS_CTRL_DANGER_SAFE_EN;
>> +
>> +    DPU_REG_WRITE(c, WB_QOS_CTRL, qos_ctrl);
>> +}
>> +
>> +static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>> +        struct dpu_hw_wb_cdp_cfg *cfg)
> 
> Can we use dpu_hw_pipe_cdp_cfg here? Maybe after renaming it to more 
> generic dpu_hw_cdp_cfg.


ack, I can absorb this in this series itself and re-spin this.
It will save us one more new structure.

> 
>> +{
>> +    struct dpu_hw_blk_reg_map *c;
>> +    u32 cdp_cntl = 0;
>> +
>> +    if (!ctx || !cfg)
>> +        return;
>> +
>> +    c = &ctx->hw;
>> +
>> +    if (cfg->enable)
>> +        cdp_cntl |= BIT(0);
>> +    if (cfg->ubwc_meta_enable)
>> +        cdp_cntl |= BIT(1);
>> +    if (cfg->preload_ahead == DPU_WB_CDP_PRELOAD_AHEAD_64)
>> +        cdp_cntl |= BIT(3);
>> +
>> +    DPU_REG_WRITE(c, WB_CDP_CNTL, cdp_cntl);
>> +}
>> +
>> +static void dpu_hw_wb_bind_pingpong_blk(
>> +        struct dpu_hw_wb *ctx,
>> +        bool enable, const enum dpu_pingpong pp)
>> +{
>> +    struct dpu_hw_blk_reg_map *c;
>> +    int mux_cfg;
>> +
>> +    if (!ctx)
>> +        return;
>> +
>> +    c = &ctx->hw;
>> +
>> +    mux_cfg = DPU_REG_READ(c, WB_MUX);
>> +    mux_cfg &= ~0xf;
>> +
>> +    if (enable)
>> +        mux_cfg |= (pp - PINGPONG_0) & 0x7;
>> +    else
>> +        mux_cfg |= 0xf;
>> +
>> +    DPU_REG_WRITE(c, WB_MUX, mux_cfg);
>> +}
>> +
>> +static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>> +        unsigned long features)
>> +{
>> +    ops->setup_outaddress = dpu_hw_wb_setup_outaddress;
>> +    ops->setup_outformat = dpu_hw_wb_setup_format;
>> +
>> +    if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
>> +        ops->setup_roi = dpu_hw_wb_roi;
>> +
>> +    if (test_bit(DPU_WB_QOS, &features))
>> +        ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
>> +
>> +    if (test_bit(DPU_WB_CDP, &features))
>> +        ops->setup_cdp = dpu_hw_wb_setup_cdp;
>> +
>> +    if (test_bit(DPU_WB_INPUT_CTRL, &features))
>> +        ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
>> +}
>> +
>> +struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
>> +        void __iomem *addr, const struct dpu_mdss_cfg *m)
>> +{
>> +    struct dpu_hw_wb *c;
>> +    const struct dpu_wb_cfg *cfg;
>> +
>> +    if (!addr || !m)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    c = kzalloc(sizeof(*c), GFP_KERNEL);
>> +    if (!c)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    cfg = _wb_offset(idx, m, addr, &c->hw);
>> +    if (IS_ERR(cfg)) {
>> +        WARN(1, "Unable to find wb idx=%d\n", idx);
>> +        kfree(c);
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    /* Assign ops */
>> +    c->mdp = &m->mdp[0];
>> +    c->idx = idx;
>> +    c->caps = cfg;
>> +    _setup_wb_ops(&c->ops, c->caps->features);
>> +
>> +    return c;
>> +}
>> +
>> +void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb)
>> +{
>> +    kfree(hw_wb);
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> new file mode 100644
>> index 0000000..80def96
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>> @@ -0,0 +1,131 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved
>> + */
>> +
>> +#ifndef _DPU_HW_WB_H
>> +#define _DPU_HW_WB_H
>> +
>> +#include "dpu_hw_catalog.h"
>> +#include "dpu_hw_mdss.h"
>> +#include "dpu_hw_top.h"
>> +#include "dpu_hw_util.h"
>> +#include "dpu_hw_pingpong.h"
>> +
>> +struct dpu_hw_wb;
>> +
>> +struct dpu_hw_wb_cfg {
>> +    struct dpu_hw_fmt_layout dest;
>> +    enum dpu_intf_mode intf_mode;
>> +    struct drm_rect roi;
>> +    struct drm_rect crop;
>> +};
>> +
>> +/**
>> + * enum CDP preload ahead address size
>> + */
>> +enum {
>> +    DPU_WB_CDP_PRELOAD_AHEAD_32,
>> +    DPU_WB_CDP_PRELOAD_AHEAD_64
>> +};
>> +
>> +/**
>> + * struct dpu_hw_wb_cdp_cfg : CDP configuration
>> + * @enable: true to enable CDP
>> + * @ubwc_meta_enable: true to enable ubwc metadata preload
>> + * @tile_amortize_enable: true to enable amortization control for 
>> tile format
>> + * @preload_ahead: number of request to preload ahead
>> + * SDE_WB_CDP_PRELOAD_AHEAD_32,
>> + * SDE_WB_CDP_PRELOAD_AHEAD_64
>> + */
>> +struct dpu_hw_wb_cdp_cfg {
>> +    bool enable;
>> +    bool ubwc_meta_enable;
>> +    bool tile_amortize_enable;
>> +    u32 preload_ahead;
>> +};
>> +
>> +/**
>> + * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
>> + * @danger_lut: LUT for generate danger level based on fill level
>> + * @safe_lut: LUT for generate safe level based on fill level
>> + * @creq_lut: LUT for generate creq level based on fill level
>> + * @danger_safe_en: enable danger safe generation
>> + */
>> +struct dpu_hw_wb_qos_cfg {
>> +    u32 danger_lut;
>> +    u32 safe_lut;
>> +    u64 creq_lut;
>> +    bool danger_safe_en;
>> +};
>> +
>> +/**
>> + *
>> + * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
>> + *  Assumption is these functions will be called after clocks are 
>> enabled
>> + *  @setup_outaddress: setup output address from the writeback job
>> + *  @setup_outformat: setup output format of writeback block from 
>> writeback job
>> + *  @setup_qos_lut:   setup qos LUT for writeback block based on input
>> + *  @setup_cdp:       setup chroma down prefetch block for writeback 
>> block
>> + *  @bind_pingpong_blk: enable/disable the connection with ping-pong 
>> block
>> + */
>> +struct dpu_hw_wb_ops {
>> +    void (*setup_outaddress)(struct dpu_hw_wb *ctx,
>> +            struct dpu_hw_wb_cfg *wb);
>> +
>> +    void (*setup_outformat)(struct dpu_hw_wb *ctx,
>> +            struct dpu_hw_wb_cfg *wb);
>> +
>> +    void (*setup_roi)(struct dpu_hw_wb *ctx,
>> +            struct dpu_hw_wb_cfg *wb);
>> +
>> +    void (*setup_qos_lut)(struct dpu_hw_wb *ctx,
>> +            struct dpu_hw_wb_qos_cfg *cfg);
>> +
>> +    void (*setup_cdp)(struct dpu_hw_wb *ctx,
>> +            struct dpu_hw_wb_cdp_cfg *cfg);
>> +
>> +    void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>> +            bool enable, const enum dpu_pingpong pp);
>> +};
>> +
>> +/**
>> + * struct dpu_hw_wb : WB driver object
>> + * @hw: block hardware details
>> + * @mdp: pointer to associated mdp portion of the catalog
>> + * @idx: hardware index number within type
>> + * @wb_hw_caps: hardware capabilities
>> + * @ops: function pointers
>> + * @hw_mdp: MDP top level hardware block
>> + */
>> +struct dpu_hw_wb {
>> +    struct dpu_hw_blk_reg_map hw;
>> +    const struct dpu_mdp_cfg *mdp;
>> +
>> +    /* wb path */
>> +    int idx;
>> +    const struct dpu_wb_cfg *caps;
>> +
>> +    /* ops */
>> +    struct dpu_hw_wb_ops ops;
>> +
>> +    struct dpu_hw_mdp *hw_mdp;
>> +};
>> +
>> +/**
>> + * dpu_hw_wb_init(): Initializes and return writeback hw driver object.
>> + * @idx:  wb_path index for which driver object is required
>> + * @addr: mapped register io address of MDP
>> + * @m :   pointer to mdss catalog data
>> + */
>> +struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
>> +        void __iomem *addr,
>> +        const struct dpu_mdss_cfg *m);
>> +
>> +/**
>> + * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
>> + * @hw_wb:  Pointer to writeback hw driver object
>> + */
>> +void dpu_hw_wb_destroy(struct dpu_hw_wb *hw_wb);
>> +
>> +#endif /*_DPU_HW_WB_H */
> 
> 
