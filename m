Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46B7FFFBB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 00:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614B910E783;
	Thu, 30 Nov 2023 23:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC410E58D;
 Thu, 30 Nov 2023 23:54:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUM9KYu014159; Thu, 30 Nov 2023 23:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ijrWI9sSXA3+HkIBXwk9RWdiSbgE8OJPfC0OAA7VAlg=;
 b=Vz2eBa1hW2Q2mvYex6Zgdf+S6VX2sEcrWNPZI1jhNRFDu34qjcxYpSIXeQqfxO1VzqLa
 l43BFhIgJR0k/vvmSN0dWdpiMtOv3Jb2rwh/8LtTWMBDHG265ebc+LP6OuOPt5kY27Du
 XlNrseY9iEwAjXMlAxxjtwY/2hOloOxEnr73BuugQRh1GTg5zwwlQGjN4tLo1dHT+Qdw
 K1Dd46cmIdoXsLgSKYutUILAsM2IkcqNxhDumiTn7m9VgtlWyrA5FdGo3QusYsHjCadt
 MmmtAEvk5nBte8a7T5BHCbUP3bJBoDtm9HDqjvuXpCa5xtd1F5SAuQX2s67Gnrdu+yWW vA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upgfd36db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 23:54:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUNsbZm020777
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 23:54:37 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 15:54:29 -0800
Message-ID: <53987859-bf78-9323-4b83-fe25cfef4ed8@quicinc.com>
Date: Thu, 30 Nov 2023 15:54:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl
 layer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-10-quic_abhinavk@quicinc.com>
 <CAA8EJpqEDmXRLHK73pHrCHOXRZPUKeA6OqEwvhoqPBrN+rbAaQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqEDmXRLHK73pHrCHOXRZPUKeA6OqEwvhoqPBrN+rbAaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LwCOEmm5Io1YF_31VS17UfHxaENWXInX
X-Proofpoint-GUID: LwCOEmm5Io1YF_31VS17UfHxaENWXInX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=795 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311300177
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/30/2023 5:12 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> CDM block will need its own logic to program the flush and active
>> bits in the dpu_hw_ctl layer.
>>
>> Make necessary changes in dpu_hw_ctl to support CDM programming.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 34 ++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 11 +++++++
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index c278fb9d2b5b..beced9f19740 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -29,11 +29,13 @@
>>   #define   CTL_DSC_ACTIVE                0x0E8
>>   #define   CTL_WB_ACTIVE                 0x0EC
>>   #define   CTL_INTF_ACTIVE               0x0F4
>> +#define   CTL_CDM_ACTIVE                0x0F8
>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>>   #define   CTL_MERGE_3D_FLUSH            0x100
>>   #define   CTL_DSC_FLUSH                0x104
>>   #define   CTL_WB_FLUSH                  0x108
>>   #define   CTL_INTF_FLUSH                0x110
>> +#define   CTL_CDM_FLUSH                0x114
>>   #define   CTL_INTF_MASTER               0x134
>>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>>
>> @@ -43,6 +45,7 @@
>>   #define DPU_REG_RESET_TIMEOUT_US        2000
>>   #define  MERGE_3D_IDX   23
>>   #define  DSC_IDX        22
>> +#define CDM_IDX         26
>>   #define  INTF_IDX       31
>>   #define WB_IDX          16
>>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
>> @@ -104,6 +107,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>>          ctx->pending_wb_flush_mask = 0;
>>          ctx->pending_merge_3d_flush_mask = 0;
>>          ctx->pending_dsc_flush_mask = 0;
>> +       ctx->pending_cdm_flush_mask = 0;
>>
>>          memset(ctx->pending_dspp_flush_mask, 0,
>>                  sizeof(ctx->pending_dspp_flush_mask));
>> @@ -148,6 +152,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>                  DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>>                                ctx->pending_dsc_flush_mask);
>>
>> +       if (ctx->pending_flush_mask & BIT(CDM_IDX))
>> +               DPU_REG_WRITE(&ctx->hw, CTL_CDM_FLUSH,
>> +                             ctx->pending_cdm_flush_mask);
>> +
>>          DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>   }
>>
>> @@ -273,6 +281,12 @@ static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
>>          }
>>   }
>>
>> +static void dpu_hw_ctl_update_pending_flush_cdm(struct dpu_hw_ctl *ctx)
>> +{
>> +       ctx->pending_flush_mask |= BIT(CDM_IDX);
>> +
> 
> unused empty line.
>

Yes indeed.

>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
>>                  enum dpu_wb wb)
>>   {
>> @@ -301,6 +315,12 @@ static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
>>          ctx->pending_flush_mask |= BIT(DSC_IDX);
>>   }
>>
>> +static void dpu_hw_ctl_update_pending_flush_cdm_v1(struct dpu_hw_ctl *ctx)
>> +{
>> +       ctx->pending_cdm_flush_mask |= BIT(0);
> 
> I'd assume this is because there is just CDM_0? Then it still might be
> better to write BIT(cdm->idx - CDM_0).
> 

Ack.

>> +       ctx->pending_flush_mask |= BIT(CDM_IDX);
>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>>          enum dpu_dspp dspp, u32 dspp_sub_blk)
>>   {
>> @@ -504,6 +524,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>          u32 intf_active = 0;
>>          u32 wb_active = 0;
>>          u32 mode_sel = 0;
>> +       u32 cdm_active = 0;
>>
>>          /* CTL_TOP[31:28] carries group_id to collate CTL paths
>>           * per VM. Explicitly disable it until VM support is
>> @@ -517,6 +538,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>
>>          intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>>          wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>> +       cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
>>
>>          if (cfg->intf)
>>                  intf_active |= BIT(cfg->intf - INTF_0);
>> @@ -534,6 +556,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>
>>          if (cfg->dsc)
>>                  DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> +
>> +       if (cfg->cdm)
>> +               DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
>>   }
>>
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> @@ -577,6 +602,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>          u32 wb_active = 0;
>>          u32 merge3d_active = 0;
>>          u32 dsc_active;
>> +       u32 cdm_active;
>>
>>          /*
>>           * This API resets each portion of the CTL path namely,
>> @@ -612,6 +638,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>                  dsc_active &= ~cfg->dsc;
>>                  DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
>>          }
>> +
>> +       if (cfg->cdm) {
>> +               cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
>> +               cdm_active &= ~cfg->cdm;
>> +               DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cdm_active);
>> +       }
>>   }
>>
>>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>> @@ -645,12 +677,14 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>                  ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
>>                  ops->update_pending_flush_dsc =
>>                          dpu_hw_ctl_update_pending_flush_dsc_v1;
>> +               ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
>>          } else {
>>                  ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>                  ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>>                  ops->update_pending_flush_intf =
>>                          dpu_hw_ctl_update_pending_flush_intf;
>>                  ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
>> +               ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
>>          }
>>          ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
>>          ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 1c242298ff2e..6dd44dfdfb61 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>>    * @mode_3d:               3d mux configuration
>>    * @merge_3d:              3d merge block used
>>    * @intf_mode_sel:         Interface mode, cmd / vid
>> + * @cdm:                   CDM block used
>>    * @stream_sel:            Stream selection for multi-stream interfaces
>>    * @dsc:                   DSC BIT masks used
>>    */
>> @@ -48,6 +49,7 @@ struct dpu_hw_intf_cfg {
>>          enum dpu_3d_blend_mode mode_3d;
>>          enum dpu_merge_3d merge_3d;
>>          enum dpu_ctl_mode_sel intf_mode_sel;
>> +       enum dpu_cdm cdm;
>>          int stream_sel;
>>          unsigned int dsc;
>>   };
>> @@ -166,6 +168,13 @@ struct dpu_hw_ctl_ops {
>>          void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
>>                                           enum dpu_dsc blk);
>>
>> +       /**
>> +        * OR in the given flushbits to the cached pending_(cdm_)flush_mask
>> +        * No effect on hardware
>> +        * @ctx: ctl path ctx pointer
>> +        */
>> +       void (*update_pending_flush_cdm)(struct dpu_hw_ctl *ctx);
>> +
>>          /**
>>           * Write the value of the pending_flush_mask to hardware
>>           * @ctx       : ctl path ctx pointer
>> @@ -239,6 +248,7 @@ struct dpu_hw_ctl_ops {
>>    * @pending_intf_flush_mask: pending INTF flush
>>    * @pending_wb_flush_mask: pending WB flush
>>    * @pending_dsc_flush_mask: pending DSC flush
>> + * @pending_cdm_flush_mask: pending CDM flush
>>    * @ops: operation list
>>    */
>>   struct dpu_hw_ctl {
>> @@ -256,6 +266,7 @@ struct dpu_hw_ctl {
>>          u32 pending_merge_3d_flush_mask;
>>          u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>>          u32 pending_dsc_flush_mask;
>> +       u32 pending_cdm_flush_mask;
>>
>>          /* ops */
>>          struct dpu_hw_ctl_ops ops;
>> --
>> 2.40.1
>>
> 
> 
