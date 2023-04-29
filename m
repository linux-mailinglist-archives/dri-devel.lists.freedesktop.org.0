Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0306F21FB
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5CD10EE46;
	Sat, 29 Apr 2023 01:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB1610EE31;
 Sat, 29 Apr 2023 01:22:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33T1JXkO030742; Sat, 29 Apr 2023 01:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2fLV1SJmDRKN50BXvUbOpJgCto68OhVVZLyJI2qaMXE=;
 b=UfvPnJjHHI56UU7l1kkYBgClEzyE6cbJ/ge6TCBa7JgPoTFfq/okDJci0K83w0rywMGK
 9QN2ml+PdO2yzfF0bzks3f0t4ZT/FMuo0tq5MiGRowyiMTivzANqR1x/FCptqBzcavb8
 kM90eYMOYPznhs4eKMSwblYtR8LOBYRQ3X1oXbAPv+L9U2PVelX0yAzdALRpH2HGzwni
 xl126/dIX6oRKXmyU+Vppqb9k7/80+d44Q7aUxKJgsD5vkD1uq7ajykJYBE5McEnG79Z
 QGstwXtxpIujoniUm1I7eQTzt+2mgqqrRUZ//VBuMN0CSV1iG6rMuubzGggk1OIwO/gQ Dw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q882gaybg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:22:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33T1MRaE021035
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Apr 2023 01:22:27 GMT
Received: from [10.110.119.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 28 Apr
 2023 18:22:26 -0700
Message-ID: <def3011f-d8e7-3090-47f2-ec13a650337e@quicinc.com>
Date: Fri, 28 Apr 2023 18:22:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 7/7] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-8-git-send-email-quic_khsieh@quicinc.com>
 <51edf131-8fe0-2187-a4ba-744cc0c81a99@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <51edf131-8fe0-2187-a4ba-744cc0c81a99@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IX-jlxv3gWk6ICJlhrbrYIWule2GRqik
X-Proofpoint-ORIG-GUID: IX-jlxv3gWk6ICJlhrbrYIWule2GRqik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_08,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304290011
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2023 5:52 PM, Dmitry Baryshkov wrote:
> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>> During DSC preparation, add run time calculation to figure out what
>> usage modes, split mode and merge mode, is going to be setup.
> 
> This patch doesn't determine the mode. It changes programming of DSC 
> bits according to the mode being selected.
> 

The term mode is a bit confusing here but he is referring to 
dsc_common_mode.

>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 
>> ++++++++++++++++-------------
>>   1 file changed, 31 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 2fdacf1..3d18642 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
>>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>   {
>>       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -    int i, intf_count = 0, num_dsc = 0;
>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>> -    for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
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
>>   static void dpu_encoder_get_topology(
>> @@ -1861,41 +1853,55 @@ static void dpu_encoder_prep_dsc(struct 
>> dpu_encoder_virt *dpu_enc,
>>       struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>>       struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>       struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>> -    int this_frame_slices;
>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>       int intf_ip_w, enc_ip_w;
>> -    int dsc_common_mode;
>> -    int pic_width;
>> +    int dsc_common_mode = 0;
> 
> Please don't top-init variables unless required (or unless they are 
> constant).
> 
>>       u32 initial_lines;
>> +    int num_dsc = topology->num_dsc;
>> +    int num_intf = topology->num_intf;
>>       int i;
>> -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>> +    for (i = 0; i < num_dsc; i++) {
>>           hw_pp[i] = dpu_enc->hw_pp[i];
>>           hw_dsc[i] = dpu_enc->hw_dsc[i];
>>           if (!hw_pp[i] || !hw_dsc[i]) {
>>               DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
>>               return;
>> -        }
>> +        }
> 
> What is the difference here?
> 
>>       }
>> -    dsc_common_mode = 0;
>> -    pic_width = dsc->pic_width;
>> +    intf_ip_w = dsc->pic_width;
>> -    dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>>       if (enc_master->intf_mode == INTF_MODE_VIDEO)
>>           dsc_common_mode |= DSC_MODE_VIDEO;
>> -    this_frame_slices = pic_width / dsc->slice_width;
>> -    intf_ip_w = this_frame_slices * dsc->slice_width;
>> -
>>       /*
>> -     * dsc merge case: when using 2 encoders for the same stream,
>> -     * no. of slices need to be same on both the encoders.
>> +     * If this encoder is driving more than one DSC encoder, they
>> +     * operate in tandem, same pic dimension needs to be used by
>> +     * each of them.(pp-split is assumed to be not supported)
>> +     *
> 
> Extra empty line. Also the comment doesn't make sense here anymore. We 
> already have comment for the division by two below.
> 
>>        */
>> -    enc_ip_w = intf_ip_w / 2;
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
>> +    }
>> +
>>       initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>> -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>> +    for (i = 0; i < num_dsc; i++)
>>           dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>>                       dsc_common_mode, initial_lines);
>>   }
> 
