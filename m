Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFE83E8AC
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 01:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24564112094;
	Sat, 27 Jan 2024 00:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0A4112094;
 Sat, 27 Jan 2024 00:44:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QMlOMm010839; Sat, 27 Jan 2024 00:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=35ppbZXqPoOhE3xjLc9IoYXeCeGkJ+ZcyhblQ8bkpUE=; b=ej
 w0zPAWOZwy1rT7tIjTpP6sLqVKkFdif61L0xO+6z78ivKb8Betv7VQ0WiNYengyV
 ltnaSsMS1RRpiLj63X/i/qG0Q7RX8jERrUPG6zVrx5/V7EhU0dA58iRNIR9yN06F
 7Qc5Uq0u598MKwkoxWwAxpc/e+vdk/XuFIqvqITxrdMxxQKSINsO1PDcteWBNK/h
 vZWxj4jPK4zQGIv+ZlFzhvlm/Ou6+M+7zAWp4Bzw9MN1QyxGBN8apB0Ixe2R/GYh
 zArIDPr5DVzLggj60nGp6bf7oWjhrA72SYor73zyIeEPubrbBz+mBBX21PGOcSyT
 v1ZfCO62A94yPhbUEeoA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv8e89xcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 00:44:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0hx33032654
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jan 2024 00:43:59 GMT
Received: from [10.110.17.189] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:43:57 -0800
Message-ID: <674c5e5c-29e9-ef4a-5c5d-a24bdab27059@quicinc.com>
Date: Fri, 26 Jan 2024 16:43:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-3-quic_parellan@quicinc.com>
 <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mGdozsuRMkley_yl8n5ei6eDJdWtl0ig
X-Proofpoint-ORIG-GUID: mGdozsuRMkley_yl8n5ei6eDJdWtl0ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270004
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/2024 1:16 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
>> implementing CDM compatibility for DP.
>
> Nit: s/CDM compatibility/YUV support/. It might make sense to spell it 
> out that YUV over DP requires CDM.
Ack
>
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
>>   3 files changed, 87 insertions(+), 84 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 83380bc92a00a..6cef98f046ea6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct 
>> dpu_encoder_phys *phys_enc)
>>       ctl->ops.clear_pending_flush(ctl);
>>   }
>>   +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys 
>> *phys_enc,
>> +                       const struct dpu_format *dpu_fmt,
>> +                       u32 output_type)
>
> My email client suggests that the parameters are not idented properly 
> anymore.
On my editor it appears to be aligned correctly. Running checkpatch.pl 
doesn't give any warnings either. So perhaps it's the email client.
>
>> +{
>> +    struct dpu_hw_cdm *hw_cdm;
>> +    struct dpu_hw_cdm_cfg *cdm_cfg;
>> +    struct dpu_hw_pingpong *hw_pp;
>> +    int ret;
>> +
>> +    if (!phys_enc)
>> +        return;
>> +
>> +    cdm_cfg = &phys_enc->cdm_cfg;
>> +    hw_pp = phys_enc->hw_pp;
>> +    hw_cdm = phys_enc->hw_cdm;
>> +
>> +    if (!hw_cdm)
>> +        return;
>> +
>> +    if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
>> +        DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", 
>> DRMID(phys_enc->parent),
>> +              dpu_fmt->base.pixel_format);
>> +        if (hw_cdm->ops.bind_pingpong_blk)
>> +            hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
>> +
>> +        return;
>> +    }
>> +
>> +    memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>> +
>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>> +    cdm_cfg->output_fmt = dpu_fmt;
>> +    cdm_cfg->output_type = output_type;
>> +    cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>> +            CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>> +    cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
>> +
>> +    /* enable 10 bit logic */
>> +    switch (cdm_cfg->output_fmt->chroma_sample) {
>> +    case DPU_CHROMA_RGB:
>> +        cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>> +        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> +        break;
>> +    case DPU_CHROMA_H2V1:
>> +        cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>> +        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> +        break;
>> +    case DPU_CHROMA_420:
>> +        cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>> +        cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
>> +        break;
>> +    case DPU_CHROMA_H1V2:
>> +    default:
>> +        DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
>> +              DRMID(phys_enc->parent));
>> +        cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>> +        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> +        break;
>> +    }
>> +
>> +    DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
>> +          DRMID(phys_enc->parent), cdm_cfg->output_width,
>> +          cdm_cfg->output_height, 
>> cdm_cfg->output_fmt->base.pixel_format,
>> +          cdm_cfg->output_type, cdm_cfg->output_bit_depth,
>> +          cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
>> +
>> +    if (hw_cdm->ops.enable) {
>> +        cdm_cfg->pp_id = hw_pp->idx;
>> +        ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
>> +        if (ret < 0) {
>> +            DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
>> +                  DRMID(phys_enc->parent), ret);
>> +            return;
>> +        }
>> +    }
>> +}
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>>   {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 37ac385727c3b..310944303a056 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -381,6 +381,15 @@ int dpu_encoder_helper_wait_for_irq(struct 
>> dpu_encoder_phys *phys_enc,
>>    */
>>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys 
>> *phys_enc);
>>   +/**
>> + * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>> + * @phys_enc: Pointer to physical encoder
>> + * @output_type: HDMI/WB
>> + */
>> +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys 
>> *phys_enc,
>> +                       const struct dpu_format *dpu_fmt,
>> +                       u32 output_type);
>
> Again, indentation.
See comment above
>
>> +
>>   /**
>>    * dpu_encoder_vblank_callback - Notify virtual encoder of vblank 
>> IRQ reception
>>    * @drm_enc:    Pointer to drm encoder structure
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 072fc6950e496..400580847bde7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -264,89 +264,6 @@ static void dpu_encoder_phys_wb_setup_ctl(struct 
>> dpu_encoder_phys *phys_enc)
>>       }
>>   }
>>   -/**
>> - * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>> - *                                     This API does not handle 
>> DPU_CHROMA_H1V2.
>> - * @phys_enc:Pointer to physical encoder
>> - */
>> -static void dpu_encoder_helper_phys_setup_cdm(struct 
>> dpu_encoder_phys *phys_enc,
>> -                          const struct dpu_format *dpu_fmt,
>> -                          u32 output_type)
>> -{
>> -    struct dpu_hw_cdm *hw_cdm;
>> -    struct dpu_hw_cdm_cfg *cdm_cfg;
>> -    struct dpu_hw_pingpong *hw_pp;
>> -    int ret;
>> -
>> -    if (!phys_enc)
>> -        return;
>> -
>> -    cdm_cfg = &phys_enc->cdm_cfg;
>> -    hw_pp = phys_enc->hw_pp;
>> -    hw_cdm = phys_enc->hw_cdm;
>> -
>> -    if (!hw_cdm)
>> -        return;
>> -
>> -    if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
>> -        DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", 
>> DRMID(phys_enc->parent),
>> -              dpu_fmt->base.pixel_format);
>> -        if (hw_cdm->ops.bind_pingpong_blk)
>> -            hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
>> -
>> -        return;
>> -    }
>> -
>> -    memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>> -
>> -    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>> -    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>> -    cdm_cfg->output_fmt = dpu_fmt;
>> -    cdm_cfg->output_type = output_type;
>> -    cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>> -            CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>> -    cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
>> -
>> -    /* enable 10 bit logic */
>> -    switch (cdm_cfg->output_fmt->chroma_sample) {
>> -    case DPU_CHROMA_RGB:
>> -        cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>> -        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> -        break;
>> -    case DPU_CHROMA_H2V1:
>> -        cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>> -        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> -        break;
>> -    case DPU_CHROMA_420:
>> -        cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
>> -        cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
>> -        break;
>> -    case DPU_CHROMA_H1V2:
>> -    default:
>> -        DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
>> -              DRMID(phys_enc->parent));
>> -        cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
>> -        cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
>> -        break;
>> -    }
>> -
>> -    DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
>> -          DRMID(phys_enc->parent), cdm_cfg->output_width,
>> -          cdm_cfg->output_height, 
>> cdm_cfg->output_fmt->base.pixel_format,
>> -          cdm_cfg->output_type, cdm_cfg->output_bit_depth,
>> -          cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
>> -
>> -    if (hw_cdm->ops.enable) {
>> -        cdm_cfg->pp_id = hw_pp->idx;
>> -        ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
>> -        if (ret < 0) {
>> -            DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
>> -                  DRMID(phys_enc->parent), ret);
>> -            return;
>> -        }
>> -    }
>> -}
>> -
>>   /**
>>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic 
>> states
>>    * @phys_enc:    Pointer to physical encoder
>> @@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
>>       return 
>> drm_atomic_helper_check_wb_connector_state(conn_state->connector, 
>> conn_state->state);
>>   }
>>   -
>
> irrelevant, please drop.
Ack
>
>>   /**
>>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
>>    * @phys_enc:    Pointer to physical encoder
>
