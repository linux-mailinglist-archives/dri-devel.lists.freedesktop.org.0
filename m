Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D76507ADB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 22:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCDC10E30F;
	Tue, 19 Apr 2022 20:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006510E2B8;
 Tue, 19 Apr 2022 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650399604; x=1681935604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FLeitn0G0UpTEttM2IXae9+H/nmgXgKaKcztYe43lUE=;
 b=FtOqjgtUFTnuSF8N/zkkA8Tg9V1Mspf+8GtchqaI/cDwPLy1MTn11lLJ
 iM3pdIX0nd3uxRvQ7JnZMCpZuY0PqEYJlyCn2tt8rpk298Ijbt/T5yJiZ
 bQXtuWoBvUmlFnXidkqF5peXyEH3d3QNgfehAVyzdhzdN+GPCMASz+fJC k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 19 Apr 2022 13:20:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 13:20:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 13:20:02 -0700
Received: from [10.111.175.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 19 Apr
 2022 13:19:59 -0700
Message-ID: <a30f687d-371d-7ff8-beb8-429019da6bc2@quicinc.com>
Date: Tue, 19 Apr 2022 13:19:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 08/12] drm/msm/dpu: introduce the
 dpu_encoder_phys_* for writeback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-9-git-send-email-quic_abhinavk@quicinc.com>
 <47abeaa9-5bae-edfd-458b-bcb838f42858@linaro.org>
 <caa6b430-fa78-56da-b71c-42ae649e8f47@quicinc.com>
 <5c2d4537-9fd1-eba4-dbc5-eb5a1f6d5818@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5c2d4537-9fd1-eba4-dbc5-eb5a1f6d5818@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/2022 5:24 PM, Dmitry Baryshkov wrote:
> On 15/04/2022 01:16, Abhinav Kumar wrote:
>>
>>
>> On 2/4/2022 3:19 PM, Dmitry Baryshkov wrote:
>>> On 05/02/2022 00:17, Abhinav Kumar wrote:
>>>> Introduce the dpu_encoder_phys_* for the writeback interface
>>>> to handle writeback specific hardware programming.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Mostly looks ok, see minor comments bellow.
>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  36 +-
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 813 
>>>> +++++++++++++++++++++
>>>>   3 files changed, 849 insertions(+), 1 deletion(-)
>>>>   create mode 100644 
>>>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile 
>>>> b/drivers/gpu/drm/msm/Makefile
>>>> index c43ef35..3abaf84 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -53,6 +53,7 @@ msm-y := \
>>>>       disp/dpu1/dpu_encoder.o \
>>>>       disp/dpu1/dpu_encoder_phys_cmd.o \
>>>>       disp/dpu1/dpu_encoder_phys_vid.o \
>>>> +    disp/dpu1/dpu_encoder_phys_wb.o \
>>>>       disp/dpu1/dpu_formats.o \
>>>>       disp/dpu1/dpu_hw_catalog.o \
>>>>       disp/dpu1/dpu_hw_ctl.o \
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index 7b3354d..80da0a9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -159,6 +159,7 @@ struct dpu_encoder_phys_ops {
>>>>    * @INTR_IDX_PINGPONG: Pingpong done unterrupt for cmd mode panel
>>>>    * @INTR_IDX_UNDERRUN: Underrun unterrupt for video and cmd mode 
>>>> panel
>>>>    * @INTR_IDX_RDPTR:    Readpointer done unterrupt for cmd mode panel
>>>> + * @INTR_IDX_WB_DONE:  Writeback fone interrupt for virtual connector
>>>>    */
>>>>   enum dpu_intr_idx {
>>>>       INTR_IDX_VSYNC,
>>>> @@ -166,6 +167,7 @@ enum dpu_intr_idx {
>>>>       INTR_IDX_UNDERRUN,
>>>>       INTR_IDX_CTL_START,
>>>>       INTR_IDX_RDPTR,
>>>> +    INTR_IDX_WB_DONE,
>>>>       INTR_IDX_MAX,
>>>>   };
>>>> @@ -196,7 +198,7 @@ struct dpu_encoder_irq {
>>>>    * @hw_ctl:        Hardware interface to the ctl registers
>>>>    * @hw_pp:        Hardware interface to the ping pong registers
>>>>    * @hw_intf:        Hardware interface to the intf registers
>>>> - * @hw_wb:             Hardware interface to the wb registers
>>>> + * @hw_wb:        Hardware interface to the wb registers
>>>>    * @dpu_kms:        Pointer to the dpu_kms top level
>>>>    * @cached_mode:    DRM mode cached at mode_set time, acted on in 
>>>> enable
>>>>    * @enabled:        Whether the encoder has enabled and running a 
>>>> mode
>>>> @@ -250,6 +252,31 @@ static inline int 
>>>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>>>   }
>>>>   /**
>>>> + * struct dpu_encoder_phys_wb - sub-class of dpu_encoder_phys to 
>>>> handle command
>>>> + *    mode specific operations
>>>> + * @base:    Baseclass physical encoder structure
>>>> + * @wbirq_refcount:     Reference count of writeback interrupt
>>>> + * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>>> + * @wb_cfg:  writeback block config to store fb related details
>>>> + * @cdp_cfg: chroma down prefetch block config for wb
>>>> + * @aspace: address space to be used for wb framebuffer
>>>> + * @wb_conn: backpointer to writeback connector
>>>> + * @wb_job: backpointer to current writeback job
>>>> + * @dest:   dpu buffer layout for current writeback output buffer
>>>> + */
>>>> +struct dpu_encoder_phys_wb {
>>>> +    struct dpu_encoder_phys base;
>>>> +    atomic_t wbirq_refcount;
>>>> +    int wb_done_timeout_cnt;
>>>> +    struct dpu_hw_wb_cfg wb_cfg;
>>>> +    struct dpu_hw_wb_cdp_cfg cdp_cfg;
>>>
>>> What about moving them to the stack rather storing them in the 
>>> structure?
>>
>> Yes cdp_cfg can be moved to the stack. Will do it in the next version.
>>
>> wb_cfg cannot because for drm_wb, prepare_wb_job has the job's fb 
>> attributes which are used to setup the wb.
>>
>> But we commit it only in the encoder_kickoff in 
>> dpu_encoder_phys_wb_setup_fb().
>>
>> So its shared across two methods.
>>
>>>
>>>> +    struct msm_gem_address_space *aspace;
>>>> +    struct drm_writeback_connector *wb_conn;
>>>> +    struct drm_writeback_job *wb_job;
>>>> +    struct dpu_hw_fmt_layout dest;
>>>> +};
>>>> +
>>>> +/**
>>>>    * struct dpu_encoder_phys_cmd - sub-class of dpu_encoder_phys to 
>>>> handle command
>>>>    *    mode specific operations
>>>>    * @base:    Baseclass physical encoder structure
>>>> @@ -317,6 +344,13 @@ struct dpu_encoder_phys 
>>>> *dpu_encoder_phys_cmd_init(
>>>>           struct dpu_enc_phys_init_params *p);
>>>>   /**
>>>> + * dpu_encoder_phys_wb_init - initialize writeback encoder
>>>> + * @init:    Pointer to init info structure with initialization params
>>>> + */
>>>> +struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>>>> +        struct dpu_enc_phys_init_params *p);
>>>> +
>>>> +/**
>>>>    * dpu_encoder_helper_trigger_start - control start helper function
>>>>    *    This helper function may be optionally specified by physical
>>>>    *    encoders if they require ctl_start triggering.
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> new file mode 100644
>>>> index 0000000..783f83e
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> @@ -0,0 +1,813 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> + */
>>>> +
>>>> +#define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>>> +
>>>> +#include <linux/debugfs.h>
>>>
>>> the header is unused
>> ack
>>>
>>>> +
>>>> +#include "dpu_encoder_phys.h"
>>>> +#include "dpu_formats.h"
>>>> +#include "dpu_hw_top.h"
>>>> +#include "dpu_hw_wb.h"
>>>> +#include "dpu_hw_lm.h"
>>>> +#include "dpu_hw_blk.h"
>>>> +#include "dpu_hw_merge3d.h"
>>>> +#include "dpu_hw_interrupts.h"
>>>> +#include "dpu_core_irq.h"
>>>> +#include "dpu_vbif.h"
>>>> +#include "dpu_crtc.h"
>>>> +#include "disp/msm_disp_snapshot.h"
>>>> +
>>>> +#define DEFAULT_MAX_WRITEBACK_WIDTH 2048
>>>> +
>>>> +#define to_dpu_encoder_phys_wb(x) \
>>>> +    container_of(x, struct dpu_encoder_phys_wb, base)
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_is_master - report wb always as master encoder
>>>> + */
>>>> +static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    return true;
>>>> +}
>>>
>>> A comment that there is only one physical enc for WB would be helpful 
>>> here. But maybe we should just pull a generic is_master into 
>>> dpu_encoder_phys.h (it would work here too).
>>
>> I am just following what we have today for phys_vid and phys_cmd.
>> But yes, I can leave a comment for sure.
>>
>>>
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_set_ot_limit - set OT limit for writeback 
>>>> interface
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_set_ot_limit(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>> +    struct dpu_vbif_set_ot_params ot_params;
>>>> +
>>>> +    memset(&ot_params, 0, sizeof(ot_params));
>>>> +    ot_params.xin_id = hw_wb->caps->xin_id;
>>>> +    ot_params.num = hw_wb->idx - WB_0;
>>>> +    ot_params.width = phys_enc->cached_mode.hdisplay;
>>>> +    ot_params.height = phys_enc->cached_mode.vdisplay;
>>>> +    ot_params.is_wfd = true;
>>>> +    ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
>>>> +    ot_params.vbif_idx = hw_wb->caps->vbif_idx;
>>>> +    ot_params.clk_ctrl = hw_wb->caps->clk_ctrl;
>>>> +    ot_params.rd = false;
>>>> +
>>>> +    dpu_vbif_set_ot_limit(phys_enc->dpu_kms, &ot_params);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_set_qos_remap - set QoS remapper for writeback
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_set_qos_remap(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb;
>>>> +    struct dpu_vbif_set_qos_params qos_params;
>>>> +
>>>> +    if (!phys_enc || !phys_enc->parent || !phys_enc->parent->crtc) {
>>>> +        DPU_ERROR("invalid arguments\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (!phys_enc->hw_wb || !phys_enc->hw_wb->caps) {
>>>> +        DPU_ERROR("invalid writeback hardware\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    hw_wb = phys_enc->hw_wb;
>>>> +
>>>> +    memset(&qos_params, 0, sizeof(qos_params));
>>>> +    qos_params.vbif_idx = hw_wb->caps->vbif_idx;
>>>> +    qos_params.xin_id = hw_wb->caps->xin_id;
>>>> +    qos_params.clk_ctrl = hw_wb->caps->clk_ctrl;
>>>> +    qos_params.num = hw_wb->idx - WB_0;
>>>> +    qos_params.is_rt = false;
>>>> +
>>>> +    DPU_DEBUG("[qos_remap] wb:%d vbif:%d xin:%d is_rt:%d\n",
>>>> +            qos_params.num,
>>>> +            qos_params.vbif_idx,
>>>> +            qos_params.xin_id, qos_params.is_rt);
>>>> +
>>>> +    dpu_vbif_set_qos_remap(phys_enc->dpu_kms, &qos_params);
>>>> +}
>>>> +
>>>> +//this can be moved to some common file?
>>>
>>> C99 comment and missing "FIXME: " :-D
>> Yes I will remove this since i am addressing this now.
>>>
>>> Yes, let's pull it into dpu_hw_util.c
>>>
>>> And if you (by chance) would see a value in unifying other 
>>> QoS/CDP-related functions let's move them to the dpu_hw_util.c too.
>>
>> Yes I think I can move some utility functions like below to the util 
>> file. Will take care of it in next version.
>>
>>>
>>>> +static u64 _dpu_encoder_phys_wb_get_qos_lut(struct dpu_qos_lut_tbl 
>>>> *tbl,
>>>> +        u32 total_fl)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    if (!tbl || !tbl->nentry || !tbl->entries)
>>>> +        return 0;
>>>> +
>>>> +    for (i = 0; i < tbl->nentry; i++)
>>>> +        if (total_fl <= tbl->entries[i].fl)
>>>> +            return tbl->entries[i].lut;
>>>> +
>>>> +    /* if last fl is zero, use as default */
>>>> +    if (!tbl->entries[i-1].fl)
>>>> +        return tbl->entries[i-1].lut;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_set_qos - set QoS/danger/safe LUTs for 
>>>> writeback
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb;
>>>> +    struct dpu_hw_wb_qos_cfg qos_cfg;
>>>> +    struct dpu_mdss_cfg *catalog;
>>>> +    struct dpu_qos_lut_tbl *qos_lut_tb;
>>>> +
>>>> +    if (!phys_enc || !phys_enc->dpu_kms || 
>>>> !phys_enc->dpu_kms->catalog) {
>>>> +        DPU_ERROR("invalid parameter(s)\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    catalog = phys_enc->dpu_kms->catalog;
>>>> +
>>>> +    hw_wb = phys_enc->hw_wb;
>>>> +
>>>> +    memset(&qos_cfg, 0, sizeof(struct dpu_hw_wb_qos_cfg));
>>>> +    qos_cfg.danger_safe_en = true;
>>>> +    qos_cfg.danger_lut =
>>>> +        catalog->perf.danger_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>>>> +
>>>> +    qos_cfg.safe_lut = 
>>>> catalog->perf.safe_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>>>> +
>>>> +    qos_lut_tb = &catalog->perf.qos_lut_tbl[DPU_QOS_LUT_USAGE_NRT];
>>>> +    qos_cfg.creq_lut = _dpu_encoder_phys_wb_get_qos_lut(qos_lut_tb, 
>>>> 0);
>>>> +
>>>> +    if (hw_wb->ops.setup_qos_lut)
>>>> +        hw_wb->ops.setup_qos_lut(hw_wb, &qos_cfg);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_setup_fb - setup output framebuffer
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + * @fb:        Pointer to output framebuffer
>>>> + * @wb_roi:    Pointer to output region of interest
>>>> + */
>>>> +static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys 
>>>> *phys_enc,
>>>> +        struct drm_framebuffer *fb)
>>>> +{
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +    struct dpu_hw_wb *hw_wb;
>>>> +    struct dpu_hw_wb_cfg *wb_cfg;
>>>> +    struct dpu_hw_wb_cdp_cfg *cdp_cfg;
>>>> +
>>>> +    if (!phys_enc || !phys_enc->dpu_kms || 
>>>> !phys_enc->dpu_kms->catalog ||
>>>> +            !phys_enc->connector) {
>>>> +        DPU_ERROR("invalid encoder\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    hw_wb = phys_enc->hw_wb;
>>>> +    wb_cfg = &wb_enc->wb_cfg;
>>>> +    cdp_cfg = &wb_enc->cdp_cfg;
>>>> +
>>>> +    wb_cfg->intf_mode = phys_enc->intf_mode;
>>>> +    wb_cfg->roi.x1 = 0;
>>>> +    wb_cfg->roi.x2 = phys_enc->cached_mode.hdisplay;
>>>> +    wb_cfg->roi.y1 = 0;
>>>> +    wb_cfg->roi.y2 = phys_enc->cached_mode.vdisplay;
>>>> +
>>>> +    if (hw_wb->ops.setup_roi)
>>>> +        hw_wb->ops.setup_roi(hw_wb, wb_cfg);
>>>> +
>>>> +    if (hw_wb->ops.setup_outformat)
>>>> +        hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
>>>> +
>>>> +    if (hw_wb->ops.setup_cdp) {
>>>> +        memset(cdp_cfg, 0, sizeof(struct dpu_hw_wb_cdp_cfg));
>>>> +
>>>> +        cdp_cfg->enable = phys_enc->dpu_kms->catalog->perf.cdp_cfg
>>>> +                [DPU_PERF_CDP_USAGE_NRT].wr_enable;
>>>> +        cdp_cfg->ubwc_meta_enable =
>>>> +                DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
>>>> +        cdp_cfg->tile_amortize_enable =
>>>> +                DPU_FORMAT_IS_UBWC(wb_cfg->dest.format) ||
>>>> +                DPU_FORMAT_IS_TILE(wb_cfg->dest.format);
>>>> +        cdp_cfg->preload_ahead = DPU_WB_CDP_PRELOAD_AHEAD_64;
>>>> +
>>>> +        hw_wb->ops.setup_cdp(hw_wb, cdp_cfg);
>>>> +    }
>>>> +
>>>> +    if (hw_wb->ops.setup_outaddress)
>>>> +        hw_wb->ops.setup_outaddress(hw_wb, wb_cfg);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_setup_cdp - setup chroma down prefetch block
>>>> + * @phys_enc:Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb;
>>>> +    struct dpu_hw_ctl *ctl;
>>>> +
>>>> +    if (!phys_enc) {
>>>> +        DPU_ERROR("invalid encoder\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    hw_wb = phys_enc->hw_wb;
>>>> +    ctl = phys_enc->hw_ctl;
>>>> +
>>>> +    if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
>>>> +        (phys_enc->hw_ctl &&
>>>> +         phys_enc->hw_ctl->ops.setup_intf_cfg)) {
>>>> +        struct dpu_hw_intf_cfg intf_cfg = {0};
>>>> +        struct dpu_hw_pingpong *hw_pp = phys_enc->hw_pp;
>>>> +        enum dpu_3d_blend_mode mode_3d;
>>>> +
>>>> +        mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +
>>>> +        intf_cfg.intf = DPU_NONE;
>>>> +        intf_cfg.wb = hw_wb->idx;
>>>> +
>>>> +        if (mode_3d && hw_pp && hw_pp->merge_3d)
>>>> +            intf_cfg.merge_3d = hw_pp->merge_3d->idx;
>>>> +
>>>> +        if (phys_enc->hw_pp->merge_3d && 
>>>> phys_enc->hw_pp->merge_3d->ops.setup_3d_mode)
>>>> + 
>>>> phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
>>>> +                    mode_3d);
>>>> +
>>>> +        /* setup which pp blk will connect to this wb */
>>>> +        if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
>>>> +            phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, 
>>>> true,
>>>> +                    phys_enc->hw_pp->idx);
>>>> +
>>>> +        phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl,
>>>> +                &intf_cfg, true);
>>>> +    } else if (phys_enc->hw_ctl && 
>>>> phys_enc->hw_ctl->ops.setup_intf_cfg) {
>>>> +        struct dpu_hw_intf_cfg intf_cfg = {0};
>>>> +
>>>> +        intf_cfg.intf = DPU_NONE;
>>>> +        intf_cfg.wb = hw_wb->idx;
>>>> +        intf_cfg.mode_3d =
>>>> +            dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +        phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, 
>>>> &intf_cfg, true);
>>>> +    }
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic 
>>>> states
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + * @crtc_state:    Pointer to CRTC atomic state
>>>> + * @conn_state:    Pointer to connector atomic state
>>>> + */
>>>> +static int dpu_encoder_phys_wb_atomic_check(
>>>> +        struct dpu_encoder_phys *phys_enc,
>>>> +        struct drm_crtc_state *crtc_state,
>>>> +        struct drm_connector_state *conn_state)
>>>> +{
>>>> +    struct drm_framebuffer *fb;
>>>> +    const struct drm_display_mode *mode;
>>>> +
>>>> +    DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>>>> +            phys_enc->intf_idx, mode->name, mode->hdisplay, 
>>>> mode->vdisplay);
>>>> +
>>>> +    if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
>>>> +        return 0;
>>>> +
>>>> +    fb = conn_state->writeback_job->fb;
>>>> +    mode = &crtc_state->mode;
>>>> +
>>>> +    if (!conn_state || !conn_state->connector) {
>>>> +        DPU_ERROR("invalid connector state\n");
>>>> +        return -EINVAL;
>>>> +    } else if (conn_state->connector->status !=
>>>> +            connector_status_connected) {
>>>> +        DPU_ERROR("connector not connected %d\n",
>>>> +                conn_state->connector->status);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
>>>> +            fb->width, fb->height);
>>>> +
>>>> +    if (fb->width != mode->hdisplay) {
>>>> +        DPU_ERROR("invalid fb w=%d, mode w=%d\n", fb->width,
>>>> +                mode->hdisplay);
>>>> +        return -EINVAL;
>>>> +    } else if (fb->height != mode->vdisplay) {
>>>> +        DPU_ERROR("invalid fb h=%d, mode h=%d\n", fb->height,
>>>> +                  mode->vdisplay);
>>>> +        return -EINVAL;
>>>> +    } else if (fb->width > DEFAULT_MAX_WRITEBACK_WIDTH) {
>>>> +        DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
>>>> +                  fb->width, DEFAULT_MAX_WRITEBACK_WIDTH);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>> +/**
>>>> + * _dpu_encoder_phys_wb_update_flush - flush hardware update
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void _dpu_encoder_phys_wb_update_flush(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb;
>>>> +    struct dpu_hw_ctl *hw_ctl;
>>>> +    struct dpu_hw_pingpong *hw_pp;
>>>> +    u32 pending_flush = 0;
>>>> +
>>>> +    if (!phys_enc)
>>>> +        return;
>>>> +
>>>> +    hw_wb = phys_enc->hw_wb;
>>>> +    hw_pp = phys_enc->hw_pp;
>>>> +    hw_ctl = phys_enc->hw_ctl;
>>>> +
>>>> +    DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>>>> +
>>>> +    if (!hw_ctl) {
>>>> +        DPU_DEBUG("[wb:%d] no ctl assigned\n", hw_wb->idx - WB_0);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (hw_ctl->ops.update_pending_flush_wb)
>>>> +        hw_ctl->ops.update_pending_flush_wb(hw_ctl, hw_wb->idx);
>>>> +
>>>> +    if (hw_ctl->ops.update_pending_flush_merge_3d && hw_pp && 
>>>> hw_pp->merge_3d)
>>>> +        hw_ctl->ops.update_pending_flush_merge_3d(hw_ctl,
>>>> +                hw_pp->merge_3d->idx);
>>>> +
>>>> +    if (hw_ctl->ops.get_pending_flush)
>>>> +        pending_flush = hw_ctl->ops.get_pending_flush(hw_ctl);
>>>> +
>>>> +    DPU_DEBUG("Pending flush mask for CTL_%d is 0x%x, WB %d\n",
>>>> +            hw_ctl->idx - CTL_0, pending_flush,
>>>> +            hw_wb->idx - WB_0);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_setup - setup writeback encoder
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_setup(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>> +    struct drm_display_mode mode = phys_enc->cached_mode;
>>>> +    struct drm_framebuffer *fb = NULL;
>>>> +
>>>> +    DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>>>> +            hw_wb->idx - WB_0, mode.name,
>>>> +            mode.hdisplay, mode.vdisplay);
>>>> +
>>>> +    dpu_encoder_phys_wb_set_ot_limit(phys_enc);
>>>> +
>>>> +    dpu_encoder_phys_wb_set_qos_remap(phys_enc);
>>>> +
>>>> +    dpu_encoder_phys_wb_set_qos(phys_enc);
>>>> +
>>>> +    dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>>>> +
>>>> +    dpu_encoder_phys_wb_setup_cdp(phys_enc);
>>>> +
>>>> +}
>>>> +
>>>> +static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
>>>> +{
>>>> +    struct dpu_encoder_phys *phys_enc = arg;
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +
>>>> +    struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>> +    unsigned long lock_flags;
>>>> +    u32 event = DPU_ENCODER_FRAME_EVENT_DONE;
>>>> +
>>>> +    DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>>>> +
>>>> +    if (phys_enc->parent_ops->handle_frame_done)
>>>> +        phys_enc->parent_ops->handle_frame_done(phys_enc->parent,
>>>> +                phys_enc, event);
>>>> +
>>>> +    if (phys_enc->parent_ops->handle_vblank_virt)
>>>> +        phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
>>>> +                phys_enc);
>>>> +
>>>> +    spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>>>> +    atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
>>>> +    spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>>>> +
>>>> +    if (wb_enc->wb_conn)
>>>> +        drm_writeback_signal_completion(wb_enc->wb_conn, 0);
>>>> +
>>>> +    /* Signal any waiting atomic commit thread */
>>>> +    wake_up_all(&phys_enc->pending_kickoff_wq);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_done_irq - writeback interrupt handler
>>>> + * @arg:    Pointer to writeback encoder
>>>> + * @irq_idx:    interrupt index
>>>> + */
>>>> +static void dpu_encoder_phys_wb_done_irq(void *arg, int irq_idx)
>>>> +{
>>>> +    _dpu_encoder_phys_wb_frame_done_helper(arg);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
>>>> + * @phys:    Pointer to physical encoder
>>>> + * @enable:    indicates enable or disable interrupts
>>>> + */
>>>> +static void dpu_encoder_phys_wb_irq_ctrl(
>>>> +        struct dpu_encoder_phys *phys, bool enable)
>>>> +{
>>>> +
>>>> +    struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
>>>> +    int ret = 0;
>>>> +    int refcount;
>>>> +
>>>> +    refcount = atomic_read(&wb_enc->wbirq_refcount);
>>>> +
>>>> +    if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1) {
>>>> +        dpu_encoder_helper_register_irq(phys, INTR_IDX_WB_DONE);
>>>> +        if (ret)
>>>> +            atomic_dec_return(&wb_enc->wbirq_refcount);
>>>> +    } else if (!enable &&
>>>> +            atomic_dec_return(&wb_enc->wbirq_refcount) == 0) {
>>>> +        dpu_encoder_helper_unregister_irq(phys, INTR_IDX_WB_DONE);
>>>> +        if (ret)
>>>> +            atomic_inc_return(&wb_enc->wbirq_refcount);
>>>> +    }
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_mode_set - set display mode
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + * @mode:    Pointer to requested display mode
>>>> + * @adj_mode:    Pointer to adjusted display mode
>>>> + */
>>>> +static void dpu_encoder_phys_wb_mode_set(
>>>> +        struct dpu_encoder_phys *phys_enc,
>>>> +        struct drm_display_mode *mode,
>>>> +        struct drm_display_mode *adj_mode)
>>>> +{
>>>> +    struct dpu_encoder_irq *irq;
>>>> +
>>>> +    if (adj_mode) {
>>>> +        phys_enc->cached_mode = *adj_mode;
>>>> +        drm_mode_debug_printmodeline(adj_mode);
>>>> +        DPU_DEBUG("caching mode:\n");
>>>> +    }
>>>> +
>>>> +    irq = &phys_enc->irq[INTR_IDX_WB_DONE];
>>>> +    irq->irq_idx = phys_enc->hw_wb->caps->intr_wb_done;
>>>> +}
>>>> +
>>>> +static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +    u32 frame_event = DPU_ENCODER_FRAME_EVENT_ERROR;
>>>> +
>>>> +    wb_enc->wb_done_timeout_cnt++;
>>>> +
>>>> +    if (wb_enc->wb_done_timeout_cnt == 1)
>>>> +        msm_disp_snapshot_state(phys_enc->parent->dev);
>>>> +
>>>> +    atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
>>>> +
>>>> +    /* request a ctl reset before the next kickoff */
>>>> +    phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
>>>> +
>>>> +    if (wb_enc->wb_conn)
>>>> +        drm_writeback_signal_completion(wb_enc->wb_conn, 0);
>>>> +
>>>> +    if (phys_enc->parent_ops->handle_frame_done)
>>>> +        phys_enc->parent_ops->handle_frame_done(
>>>> +                phys_enc->parent, phys_enc, frame_event);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_wait_for_commit_done - wait until request is 
>>>> committed
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static int dpu_encoder_phys_wb_wait_for_commit_done(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    unsigned long ret;
>>>> +    struct dpu_encoder_wait_info wait_info;
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +
>>>> +    wait_info.wq = &phys_enc->pending_kickoff_wq;
>>>> +    wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
>>>> +    wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
>>>> +
>>>> +    ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_WB_DONE,
>>>> +            &wait_info);
>>>> +    if (ret == -ETIMEDOUT)
>>>> +        _dpu_encoder_phys_wb_handle_wbdone_timeout(phys_enc);
>>>> +    else if (!ret)
>>>> +        wb_enc->wb_done_timeout_cnt = 0;
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_prepare_for_kickoff - pre-kickoff processing
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + * Returns:    Zero on success
>>>> + */
>>>> +static void dpu_encoder_phys_wb_prepare_for_kickoff(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +    struct drm_connector *drm_conn;
>>>> +    struct drm_connector_state *state;
>>>> +
>>>> +    DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
>>>> +
>>>> +    if (!wb_enc->wb_conn || !wb_enc->wb_job) {
>>>> +        DPU_ERROR("invalid wb_conn or wb_job\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    drm_conn = wb_enc->wb_conn->base;
>>>> +    state = drm_conn->state;
>>>> +
>>>> +    if (wb_enc->wb_conn && wb_enc->wb_job)
>>>> +        drm_writeback_queue_job(wb_enc->wb_conn, state);
>>>> +
>>>> +    dpu_encoder_phys_wb_setup(phys_enc);
>>>> +
>>>> +    _dpu_encoder_phys_wb_update_flush(phys_enc);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_needs_single_flush - trigger flush processing
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static bool dpu_encoder_phys_wb_needs_single_flush(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
>>>> +    return false;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_handle_post_kickoff - post-kickoff processing
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_handle_post_kickoff(
>>>> +        struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
>>>> +
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_enable - enable writeback encoder
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_enable(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    DPU_DEBUG("[wb:%d]\n", phys_enc->hw_wb->idx - WB_0);
>>>> +    phys_enc->enable_state = DPU_ENC_ENABLED;
>>>> +}
>>>> +/**
>>>> + * dpu_encoder_phys_wb_disable - disable writeback encoder
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>> +
>>>> +    DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>>>> +
>>>> +    if (phys_enc->enable_state == DPU_ENC_DISABLED) {
>>>> +        DPU_ERROR("encoder is already disabled\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /* reset h/w before final flush */
>>>> +    if (phys_enc->hw_ctl->ops.clear_pending_flush)
>>>> +        phys_enc->hw_ctl->ops.clear_pending_flush(phys_enc->hw_ctl);
>>>> +
>>>> +    /*
>>>> +     * New CTL reset sequence from 5.0 MDP onwards.
>>>> +     * If has_3d_merge_reset is not set, legacy reset
>>>> +     * sequence is executed.
>>>> +     *
>>>> +     * Legacy reset sequence has not been implemented yet.
>>>> +     * Any target earlier than SM8150 will need it and when
>>>> +     * WB support is added to those targets will need to add
>>>> +     * the legacy teardown sequence as well.
>>>> +     */
>>>> +    if (phys_enc->hw_pp->merge_3d)
>>>
>>> This is a bit.. counterintuitive. I'd prefer hw_ctl->caps->features & 
>>> BIT(DPU_ACTIVE_CTL).
>> Your suggestion should work.
>>
>> But consider it this way.
>>
>> Checking caps is telling us if the chipset supports merge3d which is 
>> sufficient in this case but phys_enc->hw_pp->merge_3d is telling us 
>> whether merge_3d is also being used in this RM session.
>>
>> So i just thought its a better check to cover both.
> 
> hw_pp->merge_3d is set when PP has a MERGE_3D attached in hardware, no 
> matter if it is used in the current pipeline or not.
> 
> As I wrote, the code is counterintuitive. The comment talks about MDP 
> 5.0, but the condition checks hw_pp->merge_3d, which might not be 
> present for tons of other reasons (starting from somebody forgetting to 
> list it in the hw_catalog).
Alright, I will uset the hw_ctl->caps->features & BIT(DPU_ACTIVE_CTL)
> 
> And in fact there is a followup question. Can we push this check (and a 
> legacy reset sequence) into the dpu_encoder_helper_phys_cleanup() 
> itself? Thus the dpu_encoder_phys will just call _helper_phys_cleanup() 
> and let the helper care about hardware details.

So like I mentioned, at the moment, I am not fully confident of the 
testing of the sequence for all use-cases to use if for all interfaces 
(although downstream is already doing it ).

I will certainly, keep testing this and if it looks fine, I can easily 
move this one level up in a follow-up change and move this out of 
phys_wb. Right now, its part of phys_wb because only wb uses it.

> 
> 
>>>> +        dpu_encoder_helper_phys_cleanup(phys_enc);
>>>> +
>>>> +    phys_enc->enable_state = DPU_ENC_DISABLED;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_get_hw_resources - get hardware resources
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + * @hw_res:    Pointer to encoder resources
>>>> + */
>>>> +static void dpu_encoder_phys_wb_get_hw_resources(
>>>> +        struct dpu_encoder_phys *phys_enc,
>>>> +        struct dpu_encoder_hw_resources *hw_res)
>>>> +{
>>>> +    if (!phys_enc) {
>>>> +        DPU_ERROR("invalid encoder\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    hw_res->wbs[phys_enc->intf_idx - WB_0] = INTF_MODE_WB_LINE;
>>>> +    DPU_DEBUG("[wb:%d] intf_mode=%d\n", phys_enc->intf_idx - WB_0,
>>>> +            hw_res->wbs[phys_enc->intf_idx - WB_0]);
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_destroy - destroy writeback encoder
>>>> + * @phys_enc:    Pointer to physical encoder
>>>> + */
>>>> +static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys 
>>>> *phys_enc)
>>>> +{
>>>> +    DPU_DEBUG("[wb:%d]\n", phys_enc->intf_idx - INTF_0);
>>>> +
>>>> +    if (!phys_enc)
>>>> +        return;
>>>> +
>>>> +    kfree(phys_enc);
>>>> +}
>>>> +
>>>> +static void dpu_encoder_phys_wb_prepare_wb_job(struct 
>>>> dpu_encoder_phys *phys_enc,
>>>> +        struct drm_writeback_job *job)
>>>> +{
>>>> +    const struct msm_format *format;
>>>> +    struct dpu_hw_wb_cfg *wb_cfg;
>>>> +    int ret;
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +
>>>> +    if (!job->fb)
>>>> +        return;
>>>> +
>>>> +    wb_enc->wb_job = job;
>>>> +    wb_enc->wb_conn = job->connector;
>>>> +    wb_enc->aspace = phys_enc->dpu_kms->base.aspace;
>>>
>>> Any particular reason to cache it in wb_enc?
>>
>> We can technically get this from phys_enc->dpu_kms->base.aspace so I 
>> can drop this.
>>
>>>
>>>> +
>>>> +    wb_cfg = &wb_enc->wb_cfg;
>>>> +
>>>> +    memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
>>>> +
>>>> +    ret = msm_framebuffer_prepare(job->fb, wb_enc->aspace);
>>>> +    if (ret) {
>>>> +        DPU_ERROR("prep fb failed, %d\n", ret);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    format = msm_framebuffer_format(job->fb);
>>>> +
>>>> +    wb_cfg->dest.format = dpu_get_dpu_format_ext(
>>>> +            format->pixel_format, job->fb->modifier);
>>>> +    if (!wb_cfg->dest.format) {
>>>> +        /* this error should be detected during atomic_check */
>>>> +        DPU_ERROR("failed to get format %x\n", format->pixel_format);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    ret = dpu_format_populate_layout(wb_enc->aspace, job->fb, 
>>>> &wb_cfg->dest);
>>>> +    if (ret) {
>>>> +        DPU_DEBUG("failed to populate layout %d\n", ret);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    wb_cfg->dest.width = job->fb->width;
>>>> +    wb_cfg->dest.height = job->fb->height;
>>>> +    wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
>>>> +
>>>> +    if ((wb_cfg->dest.format->fetch_planes == DPU_PLANE_PLANAR) &&
>>>> +            (wb_cfg->dest.format->element[0] == C1_B_Cb))
>>>> +        swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
>>>> +
>>>> +    DPU_DEBUG("[fb_offset:%8.8x,%8.8x,%8.8x,%8.8x]\n",
>>>> +            wb_cfg->dest.plane_addr[0], wb_cfg->dest.plane_addr[1],
>>>> +            wb_cfg->dest.plane_addr[2], wb_cfg->dest.plane_addr[3]);
>>>> +
>>>> +    DPU_DEBUG("[fb_stride:%8.8x,%8.8x,%8.8x,%8.8x]\n",
>>>> +            wb_cfg->dest.plane_pitch[0], wb_cfg->dest.plane_pitch[1],
>>>> +            wb_cfg->dest.plane_pitch[2], wb_cfg->dest.plane_pitch[3]);
>>>> +}
>>>> +
>>>> +static void dpu_encoder_phys_wb_cleanup_wb_job(struct 
>>>> dpu_encoder_phys *phys_enc,
>>>> +        struct drm_writeback_job *job)
>>>> +{
>>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>>> to_dpu_encoder_phys_wb(phys_enc);
>>>> +
>>>> +    if (!job->fb)
>>>> +        return;
>>>> +
>>>> +    msm_framebuffer_cleanup(job->fb, wb_enc->aspace);
>>>> +    // revisit this after everything else works
>>>
>>> Everything works now, doesn't it?
>>
>> Yeah, everything works.
>> i forgot to get rid of this comment :)
>> Had it in a bunch of other places too and missed one while cleaning up.
>>
>>>
>>>> +    wb_enc->wb_job = NULL;
>>>> +    wb_enc->wb_conn = NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>>>> + * @ops:    Pointer to encoder operation table
>>>> + */
>>>> +static void dpu_encoder_phys_wb_init_ops(struct 
>>>> dpu_encoder_phys_ops *ops)
>>>> +{
>>>> +    ops->is_master = dpu_encoder_phys_wb_is_master;
>>>> +    ops->mode_set = dpu_encoder_phys_wb_mode_set;
>>>> +    ops->enable = dpu_encoder_phys_wb_enable;
>>>> +    ops->disable = dpu_encoder_phys_wb_disable;
>>>> +    ops->destroy = dpu_encoder_phys_wb_destroy;
>>>> +    ops->atomic_check = dpu_encoder_phys_wb_atomic_check;
>>>> +    ops->get_hw_resources = dpu_encoder_phys_wb_get_hw_resources;
>>>> +    ops->wait_for_commit_done = 
>>>> dpu_encoder_phys_wb_wait_for_commit_done;
>>>> +    ops->prepare_for_kickoff = 
>>>> dpu_encoder_phys_wb_prepare_for_kickoff;
>>>> +    ops->handle_post_kickoff = 
>>>> dpu_encoder_phys_wb_handle_post_kickoff;
>>>> +    ops->needs_single_flush = dpu_encoder_phys_wb_needs_single_flush;
>>>> +    ops->trigger_start = dpu_encoder_helper_trigger_start;
>>>> +    ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>>>> +    ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>>>> +    ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
>>>> +}
>>>> +
>>>> +/**
>>>> + * dpu_encoder_phys_wb_init - initialize writeback encoder
>>>> + * @init:    Pointer to init info structure with initialization params
>>>> + */
>>>> +struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>>>> +        struct dpu_enc_phys_init_params *p)
>>>> +{
>>>> +    struct dpu_encoder_phys *phys_enc = NULL;
>>>> +    struct dpu_encoder_phys_wb *wb_enc = NULL;
>>>> +
>>>> +    struct dpu_encoder_irq *irq;
>>>> +    int ret = 0;
>>>> +    int i;
>>>> +
>>>> +    DPU_DEBUG("\n");
>>>> +
>>>> +    if (!p || !p->parent) {
>>>> +        DPU_ERROR("invalid params\n");
>>>> +        ret = -EINVAL;
>>>> +        goto fail_alloc;
>>>> +    }
>>>> +
>>>> +    wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
>>>> +    if (!wb_enc) {
>>>> +        DPU_ERROR("failed to allocate wb phys_enc enc\n");
>>>> +        ret = -ENOMEM;
>>>> +        goto fail_alloc;
>>>> +    }
>>>> +
>>>> +    phys_enc = &wb_enc->base;
>>>> +    phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
>>>> +    phys_enc->intf_idx = p->intf_idx;
>>>> +
>>>> +    dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>>>> +    phys_enc->parent = p->parent;
>>>> +    phys_enc->parent_ops = p->parent_ops;
>>>> +    phys_enc->dpu_kms = p->dpu_kms;
>>>> +    phys_enc->split_role = p->split_role;
>>>> +    phys_enc->intf_mode = INTF_MODE_WB_LINE;
>>>> +    phys_enc->intf_idx = p->intf_idx;
>>>> +    phys_enc->enc_spinlock = p->enc_spinlock;
>>>> +
>>>> +    atomic_set(&wb_enc->wbirq_refcount, 0);
>>>> +
>>>> +    for (i = 0; i < INTR_IDX_MAX; i++) {
>>>> +        irq = &phys_enc->irq[i];
>>>> +        INIT_LIST_HEAD(&irq->cb.list);
>>>> +        irq->irq_idx = -EINVAL;
>>>> +        irq->cb.arg = phys_enc;
>>>> +    }
>>>> +
>>>> +    irq = &phys_enc->irq[INTR_IDX_WB_DONE];
>>>> +    irq->name = "wb_done";
>>>> +    irq->intr_idx = INTR_IDX_WB_DONE;
>>>> +    irq->cb.func = dpu_encoder_phys_wb_done_irq;
>>>> +
>>>> +    atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>>>> +    atomic_set(&phys_enc->vblank_refcount, 0);
>>>> +    wb_enc->wb_done_timeout_cnt = 0;
>>>> +
>>>> +    init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>>>> +    phys_enc->enable_state = DPU_ENC_DISABLED;
>>>> +
>>>> +    DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
>>>> +            phys_enc->intf_idx);
>>>> +
>>>> +    return phys_enc;
>>>> +
>>>> +fail_alloc:
>>>> +    return ERR_PTR(ret);
>>>> +}
>>>
>>>
> 
> 
