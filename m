Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A296EB355
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 23:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039E010E33A;
	Fri, 21 Apr 2023 21:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3627E10E33A;
 Fri, 21 Apr 2023 21:07:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LIiWY0016324; Fri, 21 Apr 2023 21:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mr5eyuAXAB/AL229/Lr6+vTR/EYl6kv6k01KTdTnHLQ=;
 b=ieWqwtqYZDXUaMvmnUVaFfqwfV0gDJaBgDkESr32fi/Yz3TXI8xLTD0HXSslGvPQvCET
 y9VP1awHExA6P2/S56/YyDQQrqOkzMJ9veL2SdHEOXDG+aVoBfaSEXq31J36Qpa8Kv1X
 e15lfLqQZwBsqwkUrKhcYhXLEtcCL9HYp3G8AnLim6NQFsOnBOHe5g79CuOfjo6yQjqv
 Hrej/3vSZVWVDbQ2PNTjC9PDP8oFep5RQHc1rk4kSeaQhaW4agUSPwIIbpqzTcBltwgK
 TLYE0xXZYwfqKTn206+PR2GEjNHq35x9XTWHXUMAfQPPtJlaFibsGPR5xb0qIsLndKeA eg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3tmes1xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 21:07:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LL7f3s003124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 21:07:41 GMT
Received: from [10.110.0.180] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 21 Apr
 2023 14:07:39 -0700
Message-ID: <95a37ba2-29b5-47b9-48df-1bd4e4c409c5@quicinc.com>
Date: Fri, 21 Apr 2023 14:07:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 4/5] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-5-git-send-email-quic_khsieh@quicinc.com>
 <c8089d0f-c8cd-6a24-718f-682145d04f02@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <c8089d0f-c8cd-6a24-718f-682145d04f02@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5jV5_iTC2fSZFQC_cjFhtORfzO0sb8ti
X-Proofpoint-ORIG-GUID: 5jV5_iTC2fSZFQC_cjFhtORfzO0sb8ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210183
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2023 5:27 PM, Dmitry Baryshkov wrote:
> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>> During DSC preparation, add run time calculation to figure out what
>> usage modes, split mode and merge mode, is going to be setup.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 
>> ++++++++++++++++-------------
>>   1 file changed, 32 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 2fdacf1..5677728 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
>>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>   {
>>       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -    int i, intf_count = 0, num_dsc = 0;
>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>   -    for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>> -        if (dpu_enc->phys_encs[i])
>> -            intf_count++;
>> -
>> -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>> -    if (dpu_enc->dsc)
>> -        num_dsc = 2;
>> -
>> -    return (num_dsc > 0) && (num_dsc > intf_count);
>> +    return (topology->num_dsc > topology->num_intf);
>>   }
>>     static void dpu_encoder_get_topology(
>> @@ -1861,41 +1853,57 @@ static void dpu_encoder_prep_dsc(struct 
>> dpu_encoder_virt *dpu_enc,
>>       struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>>       struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>       struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>       int this_frame_slices;
>>       int intf_ip_w, enc_ip_w;
>> -    int dsc_common_mode;
>> +    int dsc_common_mode = 0;
>>       int pic_width;
>>       u32 initial_lines;
>> +    int num_dsc, num_intf;
>>       int i;
>>         for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>           hw_pp[i] = dpu_enc->hw_pp[i];
>>           hw_dsc[i] = dpu_enc->hw_dsc[i];
>> -
>> -        if (!hw_pp[i] || !hw_dsc[i]) {
>> -            DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
>> -            return;
>> -        }
>
Why?

MAX_CHANNELS_PER_ENC == 2

This works for dsi since it use 2 dsc encoder.

Since DP only use one dsc encoder, this will cause it return at loop 2 
without execute dpu_encoder_dsc_pipe_cfg().

>
>>       }
>>   -    dsc_common_mode = 0;
>> +    num_dsc = topology->num_dsc;
>> +    num_intf = topology->num_intf;
>> +
>>       pic_width = dsc->pic_width;
>>   -    dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>>       if (enc_master->intf_mode == INTF_MODE_VIDEO)
>>           dsc_common_mode |= DSC_MODE_VIDEO;
>>   +    /*
>> +     * If this encoder is driving more than one DSC encoder, they
>> +     * operate in tandem, same pic dimension needs to be used by
>> +     * each of them.(pp-split is assumed to be not supported)
>> +     *
>> +     */
>> +
>>       this_frame_slices = pic_width / dsc->slice_width;
>>       intf_ip_w = this_frame_slices * dsc->slice_width;
>> +    enc_ip_w = intf_ip_w;
>> +
>> +    intf_ip_w /= num_intf;
>> +
>> +    if (num_dsc > 1)
>> +        dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>> +
>> +    if (dpu_encoder_use_dsc_merge(&dpu_enc->base)) {
>> +        dsc_common_mode |= DSC_MODE_MULTIPLEX;
>> +        /*
>> +         * in dsc merge case: when using 2 encoders for the same
>> +         * stream, no. of slices need to be same on both the
>> +         * encoders.
>> +         */
>> +        enc_ip_w = intf_ip_w / 2;
>
> So do you want to get enc_ip_w / 2 or enc_ip_w / num_intf / 2 here?
enc_ip_w / num_intf / 2
>
>> +    }
>>   -    /*
>> -     * dsc merge case: when using 2 encoders for the same stream,
>> -     * no. of slices need to be same on both the encoders.
>> -     */
>> -    enc_ip_w = intf_ip_w / 2;
>>       initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>>   -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>> +    for (i = 0; i < num_dsc; i++)
>>           dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>>                       dsc_common_mode, initial_lines);
>>   }
>
