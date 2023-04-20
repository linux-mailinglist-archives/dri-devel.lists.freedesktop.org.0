Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33076E99B1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F710E085;
	Thu, 20 Apr 2023 16:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05AD10E085;
 Thu, 20 Apr 2023 16:40:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KAorKu021662; Thu, 20 Apr 2023 16:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=x+gGbv4XV+UinHVEkKDe3ZvwO/XqDZK/7M0uSOoHZzU=;
 b=Rus60apTeyv95JQuoNuQzkQtKbbopykx9l78VDSZXUSsECuUxqpDEyo+4YrWFfdHdA5p
 R0zh36fd/1xFflfAXsg6/FkQLBzXyK1tZbgfNPdol9s5kO+zvu3IniVaRMfixFBRy9IO
 +I4136ut7qL39bzCnmK58sGxf4ohx/54EbalD6nhcQ+EAY00e+QsYCzM/Ce52Ubd8L8a
 ZCqFDnvHizS/iqZ1K/u/k0NNSc2T3QBKBcRTwpfvDeK+ANTGsrlGPR1T4QhIasbuRJQN
 NJa7Dyjru+rjF5dz/aedpH3Sgcp7/F63ZdH+gCmkESZ6wW+ITE7nFWFTXinrF8xDKlTZ DQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2uh3j1uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 16:40:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KGePGj023041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 16:40:25 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 20 Apr
 2023 09:40:24 -0700
Message-ID: <29df3564-ade2-fda2-1843-8438e7d01669@quicinc.com>
Date: Thu, 20 Apr 2023 09:40:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: always program DSC active bits
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
 <zs762prrzv2geulwa7ztlolmxgldiyynk22m5ak4ejbyzbctrp@jprtanslko7c>
 <c2c0567a-8205-510d-bc0d-35b28dd64f70@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c2c0567a-8205-510d-bc0d-35b28dd64f70@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qeYWn78qhPKcX2kFIdwv5rc1FtgnuiVK
X-Proofpoint-GUID: qeYWn78qhPKcX2kFIdwv5rc1FtgnuiVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_12,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=864
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200138
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry / Marijn

On 4/20/2023 7:03 AM, Dmitry Baryshkov wrote:
> On 15/04/2023 02:02, Marijn Suijten wrote:
>> On 2023-04-14 09:46:17, Kuogee Hsieh wrote:
>>> In current code, the dsc active bits are set only if the cfg->dsc is 
>>> set.
>>
>> This is the old sentence from v1 again, did you accidentally send the
>> wrong patch as the improvements from v2 are missing?
>>
>>> However, for displays which are hot-pluggable, there can be a use-case
>>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>>
>>> For those cases we need to clear DSC active bits during teardown.
>>
>> At least teardown is one word again, v2 had "tear down" which is wrong.
>>
>>> As discuss at [1], clear DSC active bit will handled at reset_intf_cfg()
>>
>> discussed* as pointed out by Dmitry, and make it clear that this is
>> about clearing CTL_DSC_ACTIVE (and CTL_DSC_FLUSH?) specifically.  Once
>> that is moved to reset_intf_cfg(), this patch should be reverted as
>> there is no need to write the registers once again when cfg->dsc equals
>> 0.
> 
> Kuogee, can we please get a proper v4? With all the relevant changes 
> from v2, with the changelog, etc.
> 
> Otherwise the present Reviewed-by tags are just incorrect.
> 

After looking into the DPU DSC changes internally which will be posted 
today/tomm, that piece of code is again touching this block, so I am now 
also not convinced this change should be made right now because it was 
again touching flush programming, so that again leaves only the active 
bits which as Marijn mentioned will be applicable for a use-case only 
with hot-pluggable display which we dont have till we land DP DSC.

I think this is what we will do:

-> post DPU DSC changes
-> post the patch to improve reset_intf_cfg() to handle DSC
-> post rest of DP DSC changes
-> post rest of DSI DSC changes

I think that way, we all are aligned.

Apologies for posting this patch a bit ahead of time but if i had 
foreseen that DPU DSC changes will again touch the flush code, i would 
have held this patch back too.

>>
>> - Marijn
>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>> [1] 
>>> https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/ 
>>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index bbdc95c..88e4efe 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>       if (cfg->merge_3d)
>>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>> -    if (cfg->dsc) {
>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>> -        DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>> -    }
>>> +
>>> +    DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>> +    DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>>   }
>>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>>> -- 
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>>>
> 
