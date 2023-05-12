Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D89700F0A
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 20:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032CC10E14C;
	Fri, 12 May 2023 18:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CF810E14C;
 Fri, 12 May 2023 18:47:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CIa9Mw025974; Fri, 12 May 2023 18:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xZX91qTnvMf5xn9R3fE5WAUWFylmFh0BCT/WDvoD2EM=;
 b=eyoyEUTgVHxj2R9q2udE+qj1Zjw0PsCsD46fR4nUacOlXMeW0wplCu0sO5zYArPD/5F9
 3DknKlJaebkdWkFW5GmVRpq/PFIrRfveVGLo86tL+2zRPQ02eK1XevlxeHuVgMzbl0YM
 o9kMXrnfCgBkmY0wx9mb1S5HhTytUufK3x5am5igGNXKggb0zSp3tCCXistGDUlgDeGY
 2IEd6mluSsBAeyJarDou/rlOCgSaTcY5YofWn4Y47dXZgBLCjgOjWYNqjTcFmcLLMK+A
 cNyv8GSHRWi1m4CifGSS2Mv502TFkaBL9n1QKk/+O0YCT8WJxKuQuAspeLbxOaAv27YG 9w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qh8hm2d3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 18:47:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CIlPNi016529
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 18:47:25 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 11:47:24 -0700
Message-ID: <5319b87a-9a4c-1786-9ea9-b9015ee56357@quicinc.com>
Date: Fri, 12 May 2023 11:47:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-7-git-send-email-quic_khsieh@quicinc.com>
 <91f63678-aade-2f42-1311-1bc706ebdc91@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <91f63678-aade-2f42-1311-1bc706ebdc91@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UC13_L96ritK1d27sqdmHohmdxV6LtbF
X-Proofpoint-ORIG-GUID: UC13_L96ritK1d27sqdmHohmdxV6LtbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=829 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120157
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/12/2023 11:21 AM, Dmitry Baryshkov wrote:
> On 12/05/2023 21:00, Kuogee Hsieh wrote:
>> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
>> This patch separates DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
>> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
>> DSC engine and DSC flush bits at same time to make it consistent with
>> the location of flush programming of other dpu sub blocks.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>>   3 files changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index ffa6f04..5cae70e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1834,12 +1834,18 @@ dpu_encoder_dsc_initial_line_calc(struct 
>> drm_dsc_config *dsc,
>>       return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>>   }
>> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
>> +                     struct dpu_hw_dsc *hw_dsc,
>>                        struct dpu_hw_pingpong *hw_pp,
>>                        struct drm_dsc_config *dsc,
>>                        u32 common_mode,
>>                        u32 initial_lines)
>>   {
>> +    struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
>> +    struct dpu_hw_ctl *ctl;
>> +
>> +    ctl = cur_master->hw_ctl;
> 
> Just for my understanding: if we have a bonded DSI @ sdm845, should both 
> flashes go to the master CTL or each flush should go to the 
> corresponding CTL?
> 

Is this question for DSC or just general question about flush?

I dont see an explicit DSC flush needed in sdm845 at the ctl level.

If the question is about general flush involving two control paths, we 
need to combine the flushes and they goto the master only. Please refer 
to below part in sde_encoder.c

4243 	/* for split flush, combine pending flush masks and send to master */
4244 	if (pending_flush.pending_flush_mask && sde_enc->cur_master) {
4245 		ctl = sde_enc->cur_master->hw_ctl;
4246 		if (config_changed && ctl->ops.reg_dma_flush)
4247 			ctl->ops.reg_dma_flush(ctl, is_regdma_blocking);
4248 		_sde_encoder_trigger_flush(&sde_enc->base, sde_enc->cur_master,
4249 						&pending_flush,
4250 						config_changed);
4251 	}


> I'm going to send patches that utilize single CTL for sm8150+ after the 
> DSC lands, so I'd like to understand this part.
> 
>> +
>>       if (hw_dsc->ops.dsc_config)
>>           hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, 
>> initial_lines);
>> @@ -1854,6 +1860,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct 
>> dpu_hw_dsc *hw_dsc,
>>       if (hw_pp->ops.enable_dsc)
>>           hw_pp->ops.enable_dsc(hw_pp);
>> +
>> +    if (ctl->ops.update_pending_flush_dsc)
>> +        ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>>   }
>>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>> @@ -1898,7 +1907,8 @@ static void dpu_encoder_prep_dsc(struct 
>> dpu_encoder_virt *dpu_enc,
>>       initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>>       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>> -        dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, 
>> dsc_common_mode, initial_lines);
>> +        dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>> +                     dsc_common_mode, initial_lines);
>>   }
>>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index 4f7cfa9..f3a50cc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -139,6 +139,11 @@ static inline void 
>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>                   CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>>                   ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>           }
>> +
>> +    if (ctx->pending_flush_mask & BIT(DSC_IDX))
>> +        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>> +                  ctx->pending_dsc_flush_mask);
>> +
>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>   }
>> @@ -285,6 +290,13 @@ static void 
>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>>       ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>>   }
>> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl 
>> *ctx,
>> +                           enum dpu_dsc dsc_num)
>> +{
>> +    ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
>> +    ctx->pending_flush_mask |= BIT(DSC_IDX);
>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl 
>> *ctx,
>>       enum dpu_dspp dspp, u32 dspp_sub_blk)
>>   {
>> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>       if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>>           mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>> -    if (cfg->dsc)
>> -        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
>> -
>>       if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>           mode_sel |= BIT(17);
>> @@ -524,10 +533,8 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>       if (cfg->merge_3d)
>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>> -    if (cfg->dsc) {
>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> +    if (cfg->dsc)
>>           DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> -    }
>>   }
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> @@ -630,6 +637,9 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
>> *ops,
>>           ops->update_pending_flush_merge_3d =
>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>>           ops->update_pending_flush_wb = 
>> dpu_hw_ctl_update_pending_flush_wb_v1;
>> +
>> +        ops->update_pending_flush_dsc =
>> +            dpu_hw_ctl_update_pending_flush_dsc_v1;
>>       } else {
>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 6292002..d4869a0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>>           enum dpu_dspp blk, u32 dspp_sub_blk);
>>       /**
>> +     * OR in the given flushbits to the cached pending_(dsc_)flush_mask
>> +     * No effect on hardware
>> +     * @ctx       : ctl path ctx pointer
>> +     * @blk       : interface block index
>> +     */
>> +    void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
>> +                     enum dpu_dsc blk);
>> +
>> +    /**
>>        * Write the value of the pending_flush_mask to hardware
>>        * @ctx       : ctl path ctx pointer
>>        */
>> @@ -245,6 +254,7 @@ struct dpu_hw_ctl {
>>       u32 pending_wb_flush_mask;
>>       u32 pending_merge_3d_flush_mask;
>>       u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>> +    u32 pending_dsc_flush_mask;
>>       /* ops */
>>       struct dpu_hw_ctl_ops ops;
> 
