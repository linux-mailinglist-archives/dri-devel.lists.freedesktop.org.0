Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6516DE841
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 01:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EFA10E6CB;
	Tue, 11 Apr 2023 23:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383BC10E6CB;
 Tue, 11 Apr 2023 23:45:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BM2Be4009779; Tue, 11 Apr 2023 23:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=07bFnPs943GQwbh26BGKbdpX5jJUg/2U3OFzzWEtF+4=;
 b=me2cIBbnnhFXiKsap8LLOf32gEWIspeBh4CxAR7hgVHC3HOC5GqkR2mKcYyhXOinVe0T
 AMY8iwxHHmNzOHruso57iBUMMQoAP0DrhjdLZSVC4219V9JFlzx/VNItRoLMYbJT2+7F
 aAVtwYOO9MEBF8w1vQygNe519i09QwSLUJoSLUt5IdRji1w6l/c1QwwQf7OqfHFvWVup
 9ku/LbFu2VM6Vz6EaVoSGzX4hwGLqEMc1jFzIuhHAp4e+BTUu7/z+b9/YaQMLGaBtJks
 h3RFxSvZgocqiadPIe3nO/djC6g54YalqfWl4Ptd748hBhWGMA+iW8lc91hRef3QkifY Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pw3cv9udm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 23:45:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BNjapN029021
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 23:45:36 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 11 Apr
 2023 16:45:35 -0700
Message-ID: <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
Date: Tue, 11 Apr 2023 16:45:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1dW3mIXmy47Q7zTUPNGtvnaKZ0rPTckB
X-Proofpoint-ORIG-GUID: 1dW3mIXmy47Q7zTUPNGtvnaKZ0rPTckB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_16,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110214
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2023 3:14 PM, Marijn Suijten wrote:
> Full-caps DSC in the title, as discussed previously.
> 
> On that note, don't forget to CC those who have reviewed your patches
> previously, as also brought up in earlier review.
> 
> On 2023-04-11 14:04:55, Kuogee Hsieh wrote:
>> In current code, the dsc active bits are set only if the cfg->dsc is set.
> 
> Some typo nits:
> 
> DSC* active bits.
> 
> s/are set/are written/ (the variable is set, registers are written).
> 
> Drop `the` before `cfg->dsc` (and you could replace `s/is set/is
> non-zero/).
> 
>> However, for displays which are hot-pluggable, there can be a use-case
>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>
>> For those cases we need to clear DSC active bits during teardown.
>>
>> Fixes: ede3c6bb00c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> If you have validated that it is fine to write these registers on
> _every_ platform supported by DPU1, and after fixing the above nits and
> the Fixes: commit hash as pointed out by Abhinav:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> And see one question below.
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index bbdc95c..88e4efe 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>   	if (cfg->merge_3d)
>>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>   			      BIT(cfg->merge_3d - MERGE_3D_0));
>> -	if (cfg->dsc) {
>> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>> -	}
>> +
>> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> 
> Does this flush all DSCs programmed in CTL_DSC_FLUSH as set above?  That
> is currently still in `if (cfg->dsc)` and never overwritten if all DSCs
> are disabled, should it be taken out of the `if` to make sure no DSCs
> are inadvertently flushed, or otherwise cache the "previous mask" to
> make sure we flush exactly the right DSC blocks?
> 

Yes, DSC flush is hierarchical. This is the main DSC flush which will 
enforce the flush of the DSC's we are trying to flush in the 
CTL_DSC_FLUSH register.

So if DSC was active, the CTL_FLUSH will only enforce the flush of the 
DSC's programmed in CTL_DSC_FLUSH

If DSC is not active, we still need to flush that as well (that was the 
missing bit).

No need to cache previous mask. That programming should be accurate in 
cfg->dsc already.

> Thanks!
> 
> - Marijn
> 
>> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>   }
>>   
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
