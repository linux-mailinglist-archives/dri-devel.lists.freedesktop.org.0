Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F368FB1B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 00:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D49410E07F;
	Wed,  8 Feb 2023 23:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C92C10E07F;
 Wed,  8 Feb 2023 23:24:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318Lm2Rl013016; Wed, 8 Feb 2023 23:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pf/LsDz8BXqn+GomjcrfK3rhN/0BpL/8g9RKK3dGq6g=;
 b=FDOmspoTRIh5L905f+iJZKZGES83HpsU/9KWA+NSQWNNZKadEivcdpoCrA26UBDPGS5g
 +EL1oEVsUKUiom6T8B5cN6sGbDa1fW+ra2yurECSdGzD2PY3mHwSTr87G3Etoi2pTzc1
 SLm68U/ezv4ZZKXaCCpbsA17etVkRSwqAJDIRgry9gQCLTRbHA3ctzXlF9CauBPfPIOI
 jMNGyFY+h+f0HepfsEceYNOulvECxKhnascJjT918rpicUXJ4+DqNmlITgqtofhxIkg+
 b4D1cAXjMy7F38aZsYP+ry0kmc1TbdLtOBDiBpVn6Ag2st1caEll70F0mejW04Hj38Kk Sg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm86mt2vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 23:24:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318NOMbc002443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Feb 2023 23:24:22 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 8 Feb 2023
 15:24:21 -0800
Message-ID: <2693b8be-f565-e6c8-f503-4ea1cbb573b4@quicinc.com>
Date: Wed, 8 Feb 2023 15:24:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230208213713.1330-1-quic_jesszhan@quicinc.com>
 <884097ab-41c7-2889-5b11-91451e2f994a@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <884097ab-41c7-2889-5b11-91451e2f994a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Pr7AXfWcjSiGMrl0FqJ-8jH3C1XFgN1J
X-Proofpoint-ORIG-GUID: Pr7AXfWcjSiGMrl0FqJ-8jH3C1XFgN1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080199
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/8/2023 2:18 PM, Dmitry Baryshkov wrote:
> On 08/02/2023 23:37, Jessica Zhang wrote:
>> Currently, DPU will enable TE during prepare_commit(). However, this
>> will cause issues when trying to read/write to register in
>> get_autorefresh_config(), because the core clock rates aren't set at
>> that time.
>>
>> This used to work because phys_enc->hw_pp is only initialized in mode
>> set [1], so the first prepare_commit() will return before any register
>> read/write as hw_pp would be NULL.
>>
>> However, when we try to implement support for INTF TE, we will run into
>> the clock issue described above as hw_intf will *not* be NULL on the
>> first prepare_commit(). This is because the initialization of
>> dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].
>>
>> To avoid this issue, let's enable TE during prepare_for_kickoff()
>> instead as the core clock rates are guaranteed to be set then.
>>
>> Depends on: "Implement tearcheck support on INTF block" [3]
>>
>> [1] 
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
>> [2] 
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
>> [3] https://patchwork.freedesktop.org/series/112332/
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
>>   1 file changed, 43 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 279a0b7015ce..746250bce3d1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -587,39 +587,6 @@ static void dpu_encoder_phys_cmd_destroy(struct 
>> dpu_encoder_phys *phys_enc)
>>       kfree(cmd_enc);
>>   }
>> -static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>> -        struct dpu_encoder_phys *phys_enc)
>> -{
>> -    struct dpu_encoder_phys_cmd *cmd_enc =
>> -            to_dpu_encoder_phys_cmd(phys_enc);
>> -    int ret;
>> -
>> -    if (!phys_enc->hw_pp) {
>> -        DPU_ERROR("invalid encoder\n");
>> -        return;
>> -    }
>> -    DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", 
>> DRMID(phys_enc->parent),
>> -              phys_enc->hw_pp->idx - PINGPONG_0,
>> -              atomic_read(&phys_enc->pending_kickoff_cnt));
>> -
>> -    /*
>> -     * Mark kickoff request as outstanding. If there are more than one,
>> -     * outstanding, then we have to wait for the previous one to 
>> complete
>> -     */
>> -    ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
>> -    if (ret) {
>> -        /* force pending_kickoff_cnt 0 to discard failed kickoff */
>> -        atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> -        DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
>> -              DRMID(phys_enc->parent), ret,
>> -              phys_enc->hw_pp->idx - PINGPONG_0);
>> -    }
>> -
>> -    DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
>> -            phys_enc->hw_pp->idx - PINGPONG_0,
>> -            atomic_read(&phys_enc->pending_kickoff_cnt));
>> -}
>> -
>>   static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>>           struct dpu_encoder_phys *phys_enc)
>>   {
>> @@ -645,8 +612,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>>       return false;
>>   }
>> -static void dpu_encoder_phys_cmd_prepare_commit(
>> -        struct dpu_encoder_phys *phys_enc)
>> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys 
>> *phys_enc)
>>   {
>>       struct dpu_encoder_phys_cmd *cmd_enc =
>>           to_dpu_encoder_phys_cmd(phys_enc);
>> @@ -704,6 +670,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>>                "disabled autorefresh\n");
>>   }
>> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>> +        struct dpu_encoder_phys *phys_enc)
> 
> Could you please move the function back to the place, so that we can see 
> the actual difference?

Hi Dmitry,

This function was moved because prepare_commit() and is_ongoing_pptx() 
(which is called in prepare_commit()) were originally defined later in 
the file.

> 
>> +{
>> +    struct dpu_encoder_phys_cmd *cmd_enc =
>> +            to_dpu_encoder_phys_cmd(phys_enc);
>> +    int ret;
>> +
>> +    if (!phys_enc->hw_pp) {
>> +        DPU_ERROR("invalid encoder\n");
>> +        return;
>> +    }
>> +
>> +
>> +    DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", 
>> DRMID(phys_enc->parent),
>> +              phys_enc->hw_pp->idx - PINGPONG_0,
>> +              atomic_read(&phys_enc->pending_kickoff_cnt));
>> +
>> +    /*
>> +     * Mark kickoff request as outstanding. If there are more than one,
>> +     * outstanding, then we have to wait for the previous one to 
>> complete
>> +     */
>> +    ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
>> +    if (ret) {
>> +        /* force pending_kickoff_cnt 0 to discard failed kickoff */
>> +        atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> +        DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
>> +              DRMID(phys_enc->parent), ret,
>> +              phys_enc->hw_pp->idx - PINGPONG_0);
>> +    }
>> +
>> +    dpu_encoder_phys_cmd_enable_te(phys_enc);
>> +
>> +    DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
>> +            phys_enc->hw_pp->idx - PINGPONG_0,
>> +            atomic_read(&phys_enc->pending_kickoff_cnt));
>> +}
>> +
>> +static void dpu_encoder_phys_cmd_prepare_commit(
>> +        struct dpu_encoder_phys *phys_enc)
>> +{
>> +}
> 
> There is no need to have the empty callback, you can skip it completely. 
> Actually, if it is not needed anymore for the cmd encoders, you can drop 
> the .prepare_commit from struct dpu_encoder_phys_ops. And then, by 
> extension, dpu_encoder_prepare_commit(), dpu_kms_prepare_commit(). This 
> sounds like a nice second patch for this rfc.

Got it.

FWIW I kept this as an empty method to match mdp4_prepare_commit() [1], 
but I can just add a NULL check in msm_atomic_commit_tail() and remove 
both instances of empty callbacks if that's preferable.

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c#L87

Thanks,

Jessica Zhang

> 
>> +
>>   static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
>>           struct dpu_encoder_phys *phys_enc)
>>   {
> 
> -- 
> With best wishes
> Dmitry
> 
