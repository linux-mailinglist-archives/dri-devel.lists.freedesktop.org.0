Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2883FC8C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 04:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68146112153;
	Mon, 29 Jan 2024 03:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F9D112153;
 Mon, 29 Jan 2024 03:06:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T2uDEV017144; Mon, 29 Jan 2024 03:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=7ir9t53IWGkLI7UwkjrChpqSCtSVxay+vYOfALL9Fvo=; b=gy
 Y4P6iEhBZv6G7TN8wK2HsaXTWRZ7ntoOASgGXtHQbVwQlJ0LdRh2cB43GYHn7UWy
 3VT7snUJSAFzY0Ip4TT9hxOjBKs1wKteQt9ke6NlGQ3Zl5fbDX+hZHIA8DOcbceY
 v7OFiggP8SQqJczHQXNUhLNnyueNTBMr7FCkteWl63TxLWCXgirYAMtgTMVSZhgf
 i/jLNVDGMsXPMwv631rwpjSprq2WMMxtanwPj6DwdyMM2ypYC2PUZVaPhcLsJ2vQ
 OlmA846NkES8v61sHsAzCM7XirdROKnVf6xIBddXTQSN+zA2t7r9SI6xPLw8bgST
 ZTUZs+VD9QAUot3pKf0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvrubap10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 03:06:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T369Ed001071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 03:06:09 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 19:06:08 -0800
Message-ID: <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
Date: Sun, 28 Jan 2024 19:06:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
Content-Language: en-US
To: Paloma Arellano <quic_parellan@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <freedreno@lists.freedesktop.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
 <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
 <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kreTkowQl82l8wA20C-P7SknpKyxuTYo
X-Proofpoint-GUID: kreTkowQl82l8wA20C-P7SknpKyxuTYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290021
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
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2024 4:39 PM, Paloma Arellano wrote:
> 
> On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>>>
>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>>>   2 files changed, 18 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> index 993f263433314..37ac385727c3b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>>>    * @hw_intf:        Hardware interface to the intf registers
>>>    * @hw_wb:        Hardware interface to the wb registers
>>>    * @hw_cdm:        Hardware interface to the CDM registers
>>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM 
>>> configuration
>>
>> Please realign the description.
> Ack
>>
>>>    * @dpu_kms:        Pointer to the dpu_kms top level
>>>    * @cached_mode:    DRM mode cached at mode_set time, acted on in 
>>> enable
>>>    * @vblank_ctl_lock:    Vblank ctl mutex lock to protect 
>>> vblank_refcount
>>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>>>       struct dpu_hw_intf *hw_intf;
>>>       struct dpu_hw_wb *hw_wb;
>>>       struct dpu_hw_cdm *hw_cdm;
>>> +    struct dpu_hw_cdm_cfg cdm_cfg;
>>
>> It might be slightly better to move it after all the pointers, so 
>> after the dpu_kms.
> Ack
>>
>>>       struct dpu_kms *dpu_kms;
>>>       struct drm_display_mode cached_mode;
>>>       struct mutex vblank_ctl_lock;
>>> @@ -213,7 +215,6 @@ static inline int 
>>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>>    * @wbirq_refcount:     Reference count of writeback interrupt
>>>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>>    * @wb_cfg:  writeback block config to store fb related details
>>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM 
>>> configuration
>>>    * @wb_conn: backpointer to writeback connector
>>>    * @wb_job: backpointer to current writeback job
>>>    * @dest:   dpu buffer layout for current writeback output buffer
>>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>>>       atomic_t wbirq_refcount;
>>>       int wb_done_timeout_cnt;
>>>       struct dpu_hw_wb_cfg wb_cfg;
>>> -    struct dpu_hw_cdm_cfg cdm_cfg;
>>>       struct drm_writeback_connector *wb_conn;
>>>       struct drm_writeback_job *wb_job;
>>>       struct dpu_hw_fmt_layout dest;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> index 4cd2d9e3131a4..072fc6950e496 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> @@ -269,28 +269,21 @@ static void 
>>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>>>    *                                     This API does not handle 
>>> DPU_CHROMA_H1V2.
>>>    * @phys_enc:Pointer to physical encoder
>>>    */
>>> -static void dpu_encoder_helper_phys_setup_cdm(struct 
>>> dpu_encoder_phys *phys_enc)
>>> +static void dpu_encoder_helper_phys_setup_cdm(struct 
>>> dpu_encoder_phys *phys_enc,
>>> +                          const struct dpu_format *dpu_fmt,
>>> +                          u32 output_type)
>>>   {
>>>       struct dpu_hw_cdm *hw_cdm;
>>>       struct dpu_hw_cdm_cfg *cdm_cfg;
>>>       struct dpu_hw_pingpong *hw_pp;
>>> -    struct dpu_encoder_phys_wb *wb_enc;
>>> -    const struct msm_format *format;
>>> -    const struct dpu_format *dpu_fmt;
>>> -    struct drm_writeback_job *wb_job;
>>>       int ret;
>>>         if (!phys_enc)
>>>           return;
>>>   -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>>> -    cdm_cfg = &wb_enc->cdm_cfg;
>>> +    cdm_cfg = &phys_enc->cdm_cfg;
>>>       hw_pp = phys_enc->hw_pp;
>>>       hw_cdm = phys_enc->hw_cdm;
>>> -    wb_job = wb_enc->wb_job;
>>> -
>>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, 
>>> wb_job->fb->modifier);
>>>         if (!hw_cdm)
>>>           return;
>>> @@ -306,10 +299,10 @@ static void 
>>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>>>         memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>>>   -    cdm_cfg->output_width = wb_job->fb->width;
>>> -    cdm_cfg->output_height = wb_job->fb->height;
>>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>>
>> This is a semantic change. Instead of passing the FB size, this passes 
>> the mode dimensions. They are not guaranteed to be the same, 
>> especially for the WB case.
>>

The WB job is storing the output FB of WB. I cannot think of a use-case 
where this cannot match the current mode programmed to the WB encoder.

Yes, if it was the drm_plane's FB, then it cannot be guaranteed as the 
plane can scale the contents but here thats not the case. Here its the 
output FB of WB.

>>>       cdm_cfg->output_fmt = dpu_fmt;
>>> -    cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
>>> +    cdm_cfg->output_type = output_type;
>>>       cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
>>>               CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
>>>       cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
>>> @@ -462,6 +455,14 @@ static void dpu_encoder_phys_wb_setup(
>>>       struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
>>>       struct drm_display_mode mode = phys_enc->cached_mode;
>>>       struct drm_framebuffer *fb = NULL;
>>> +    struct dpu_encoder_phys_wb *wb_enc = 
>>> to_dpu_encoder_phys_wb(phys_enc);
>>> +    struct drm_writeback_job *wb_job;
>>> +    const struct msm_format *format;
>>> +    const struct dpu_format *dpu_fmt;
>>> +
>>> +    wb_job = wb_enc->wb_job;
>>> +    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>> +    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, 
>>> wb_job->fb->modifier);
>>>         DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
>>>               hw_wb->idx - WB_0, mode.name,
>>> @@ -475,7 +476,7 @@ static void dpu_encoder_phys_wb_setup(
>>>         dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
>>>   -    dpu_encoder_helper_phys_setup_cdm(phys_enc);
>>> +    dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, 
>>> CDM_CDWN_OUTPUT_WB);
>>>         dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>   }
>>
