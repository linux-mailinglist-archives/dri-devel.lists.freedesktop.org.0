Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6583A9245C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388BD10E394;
	Thu, 17 Apr 2025 17:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="R/bv6tIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2F10E338;
 Thu, 17 Apr 2025 17:50:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClUpC013325;
 Thu, 17 Apr 2025 17:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rtVvrMeTc6F3JJHkRyxqWivaPaY3sC3Dhgxn6S1HvY8=; b=R/bv6tIGWCs2g9v+
 4jUStXZY1cTFa5c2PqqHnq2RYMMjuCF9TzcHP4/Xa64d7tK/OZDK8RW+L5aqgtAO
 R9AbTO1HVcJRBkILrkdKUAAz9XOFdLbr1UUID6fG5XMS4e1fkGi3rLDbIsJjNcsr
 2o/fFf6tuKgPt7NeGAEJfT+wR/EOui8BzIG3ocXamdkRX9nEifufVSFTz0dZJBfN
 MGmZxoG1PJR5HSrzCshz+SyNgDc+G3cJ5xkYr6lgSmUMdHVY3GH+hOUVO1Ycd7KT
 4zSvO+4lMUvarq6Zb7hzJQdKXlUhbL7tpiiIeolLZACWbTtUsO5aalmbswHPrOXB
 PQ7MAQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvd2e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Apr 2025 17:50:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HHoYCb020419
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Apr 2025 17:50:34 GMT
Received: from [10.216.6.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 10:50:28 -0700
Message-ID: <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
Date: Thu, 17 Apr 2025 23:20:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>
CC: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cMn6x-EFO9oBXysgklTroujnCc8dLfN4
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68013f6b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=XE3sDmP-oFqBkbK9aEsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cMn6x-EFO9oBXysgklTroujnCc8dLfN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170131
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/17/2025 9:02 PM, Connor Abbott wrote:
> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The Highest Bank address Bit value can change based on memory type used.
>>>
>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>> default (the one used prior to this change) on error.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -13,6 +13,7 @@
>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>  #include <linux/pm_domain.h>
>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>> +#include <linux/soc/qcom/smem.h>
>>>
>>>  #define GPU_PAS_ID 13
>>>
>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>
>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>  {
>>> +     int hbb;
>>> +
>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>       gpu->ubwc_config.min_acc_len = 0;
>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>           adreno_is_a690(gpu) ||
>>>           adreno_is_a730(gpu) ||
>>>           adreno_is_a740_family(gpu)) {
>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>               gpu->ubwc_config.amsbc = 1;
>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>               gpu->ubwc_config.min_acc_len = 1;
>>>       }
>>> +
>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>> +     hbb = qcom_smem_dram_get_hbb();
>>> +     if (hbb < 0)
>>> +             return;
>>> +
>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>
>> I am worried about blindly relying on SMEM data directly for HBB for
>> legacy chipsets. There is no guarantee it is accurate on every chipset
>> and every version of firmware. Also, until recently, this value was
>> hardcoded in Mesa which matched the value in KMD.
> 
> To be clear about this, from the moment we introduced host image
> copies in Mesa we added support for querying the HBB from the kernel,
> explicitly so that we could do what this series does without Mesa ever
> breaking. Mesa will never assume the HBB unless the kernel is too old
> to support querying it. So don't let Mesa be the thing that stops us
> here.

Thanks for clarifying about Mesa. I still don't trust a data source that
is unused in production.

I have a related question about HBB. Blob driver doesn't support
host_image_copy, but it still use HBB configuration. I was under the
impression this was required for UMD for compression related
configurations. Is that not true for turnip/freedreno?

-Akhil.

> 
> Connor
> 
>> So it is better to
>> make this opt in, for newer chipsets or those which somebody can verify.
>> We can invert this logic to something like this:
>>
>> if (!gpu->ubwc_config.highest_bank_bit)
>>     gpu->ubwc_config.highest_bank_bit = qcom_smem_dram_get_hbb();
>>
>>>  }
>>>
>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>       bool is_a7xx;
>>>       int ret;
>>>
>>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config() */
>>> +     if (!qcom_smem_is_available())
>>> +             return ERR_PTR(-EPROBE_DEFER);
>>> +
>>
>> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device present
>> in all Qcom SoC devicetrees? I wonder if there is a scenario where there
>> might be an infinite EPROBE_DEFER here.
>>
>> -Akhil.
>>
>>>       a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
>>>       if (!a6xx_gpu)
>>>               return ERR_PTR(-ENOMEM);
>>>
>>

