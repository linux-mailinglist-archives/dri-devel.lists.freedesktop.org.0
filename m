Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11669135E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 23:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FEA10EBC9;
	Thu,  9 Feb 2023 22:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7F10E10C;
 Thu,  9 Feb 2023 22:31:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319FD6kb028861; Thu, 9 Feb 2023 22:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FUQEvzw8sd803dKGA8Pbzbd1FtrU/6fnFxrirVJFZwY=;
 b=bikJlijSVBsb4bDIBWWtQHnlIRc9bezv1dE6ziElcEg0YpSu8vV+UFeRLtBQVk5jx8Ut
 jazRCYUvM3UtcX6NDO9lLEttf/1BXnKpxE66S/BSor7MO0oDL+AzSoG5/GwrrAvJSOkR
 kh+i45F/vQUl489ZCzF8SAg1elR12PEFvIavda3sVJiamAe63r6pnhtsUrOG1KnHQbPG
 71nK8qQKKW48/TkgTZ2cieYMHTNhmUfByofuWjua0aMgMJwY0k6MNowASDauli6nVPES
 Zn/T7siEs8Uo18vLu4WHRQZvpVfufIU0aEYY/m+jpSUzjGaO8VkXfV7701sA7dGZaJx6 rQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm86mvqdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 22:31:52 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319MVptE014900
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Feb 2023 22:31:51 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 14:31:51 -0800
Message-ID: <92e4a669-1312-63ba-21ef-db73d38be3c7@quicinc.com>
Date: Thu, 9 Feb 2023 14:31:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 1/4] drm/msm/dpu: Move TE setup to
 prepare_for_kickoff()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-2-quic_jesszhan@quicinc.com>
 <4d11cb36-96eb-36ac-e86e-7a0947e4bdcf@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4d11cb36-96eb-36ac-e86e-7a0947e4bdcf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HRkm2TuqvxoPYc1R5Bcy1dwSp4MTEvz9
X-Proofpoint-ORIG-GUID: HRkm2TuqvxoPYc1R5Bcy1dwSp4MTEvz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302090204
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



On 2/9/2023 10:51 AM, Dmitry Baryshkov wrote:
> On 09/02/2023 20:44, Jessica Zhang wrote:
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
>> index cb05036f2916..561406d92a1a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -583,39 +583,6 @@ static void dpu_encoder_phys_cmd_destroy(struct 
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
>> @@ -641,8 +608,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
>>       return false;
>>   }
>> -static void dpu_encoder_phys_cmd_prepare_commit(
>> -        struct dpu_encoder_phys *phys_enc)
>> +static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys 
>> *phys_enc)
>>   {
>>       struct dpu_encoder_phys_cmd *cmd_enc =
>>           to_dpu_encoder_phys_cmd(phys_enc);
>> @@ -700,6 +666,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
>>                "disabled autorefresh\n");
>>   }
>> +static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>> +        struct dpu_encoder_phys *phys_enc)
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
> 
> Quoting v1:
> 
> Could you please move the function back to the place, so that we can see 
> the actual difference?

Hi Dmitry,

Sorry if I missed your reply to my reply in V1, but as stated in the V1 
patch: the reason the diff looks like this is because 
prepare_for_kickoff() is defined above where the prepare_commit() and 
is_ongoing_pptx() were originally defined. So I had to move both 
function definitions to above the prepare_for_kickoff() function for the 
patch to compile.

That being said, I'm open to any suggestions for making this patch more 
legible.

> 
>> +
>> +static void dpu_encoder_phys_cmd_prepare_commit(
>> +        struct dpu_encoder_phys *phys_enc)
>> +{
>> +}
> 
> This is not necessary and can be dropped. There is a safety check in 
> dpu_encoder_prepare_commit().

Acked.

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
