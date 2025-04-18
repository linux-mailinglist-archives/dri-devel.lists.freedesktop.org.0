Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9EEA93A3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879D10E205;
	Fri, 18 Apr 2025 16:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MYpZQYTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C2F10E073;
 Fri, 18 Apr 2025 16:00:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I29ajq015622;
 Fri, 18 Apr 2025 16:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t4P8qTI9W92yKZd3YS7eACSbQ9BmpgerT/KFIqAOVOs=; b=MYpZQYTZgiHi+kMx
 u0X1apBqOiCG8nO71CWW1d/Y2Plz2tZy2nJ7i5f8zyEwWSsZD2AyD68cBZ7r1ThF
 FQSbs94hNrbiLDShPxZMR7cZzO/j+HoR4jBJ6hAtNd+Sb6Q+z+sTH4rCQqz1ATWS
 WTNrDntvvujVKvqIw/LfiSqpRIKjavNH4sL5SW6edrcG/KYkLrcfNlpRkUc5V+nd
 5fZwASEEjhYW/JFpfSIPKjlLqRA5pjzkJfEb296mqbFkyDvHp2WPsfmhjntIvhu4
 3BoxbNK57Vu8r3WuLUhQHuDaAQwPtNZtQXP+PdES+uo/ZkMg4H1KGEcYJCBFyRSe
 iQ4Z1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqjjnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 16:00:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IG0eYo012830
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 16:00:40 GMT
Received: from [10.216.6.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 09:00:34 -0700
Message-ID: <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
Date: Fri, 18 Apr 2025 21:30:31 +0530
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
 linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _qd9NIJaLQ9PKC5G9nd_VG7w_yJINPQS
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6802772b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=0G8C8MxnwnXpGjqQjtcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _qd9NIJaLQ9PKC5G9nd_VG7w_yJINPQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180119
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

On 4/18/2025 6:40 AM, Connor Abbott wrote:
> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>
>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>> default (the one used prior to this change) on error.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>> @@ -13,6 +13,7 @@
>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>  #include <linux/pm_domain.h>
>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>
>>>>>  #define GPU_PAS_ID 13
>>>>>
>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>
>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>  {
>>>>> +     int hbb;
>>>>> +
>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>           adreno_is_a690(gpu) ||
>>>>>           adreno_is_a730(gpu) ||
>>>>>           adreno_is_a740_family(gpu)) {
>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>       }
>>>>> +
>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>> +     if (hbb < 0)
>>>>> +             return;
>>>>> +
>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>
>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>> and every version of firmware. Also, until recently, this value was
>>>> hardcoded in Mesa which matched the value in KMD.
>>>
>>> To be clear about this, from the moment we introduced host image
>>> copies in Mesa we added support for querying the HBB from the kernel,
>>> explicitly so that we could do what this series does without Mesa ever
>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>> to support querying it. So don't let Mesa be the thing that stops us
>>> here.
>>
>> Thanks for clarifying about Mesa. I still don't trust a data source that
>> is unused in production.
> 
> Fair enough, I'm not going to argue with that part. Just wanted to
> clear up any confusion about Mesa.
> 
> Although, IIRC kgsl did set different values for a650 depending on
> memory type... do you know what source that used?

KGSL relies on an undocumented devicetree node populated by bootloader
to detect ddrtype and calculates the HBB value based on that.

-Akhil.

> 
>>
>> I have a related question about HBB. Blob driver doesn't support
>> host_image_copy, but it still use HBB configuration. I was under the
>> impression this was required for UMD for compression related
>> configurations. Is that not true for turnip/freedreno?
>>
>> -Akhil.
> 
> AFAIK the HBB (as well as other UBWC config parameters) doesn't have
> any impact on layout configuration, so the UMD can ignore it except
> when it's doing CPU texture uploads/downloads. We certainly do in
> freedreno/turnip. You'd have to ask that team what they use HBB for,
> but my best guess is that the GLES driver uses it for CPU texture
> uploads sometimes. That is, the GLES driver might be using
> functionality similar to host_image_copy "under the hood". It's
> something we'd probably want for freedreno too.
> 
> Connor
> 
>>
>>>
>>> Connor
>>>
>>>> So it is better to
>>>> make this opt in, for newer chipsets or those which somebody can verify.
>>>> We can invert this logic to something like this:
>>>>
>>>> if (!gpu->ubwc_config.highest_bank_bit)
>>>>     gpu->ubwc_config.highest_bank_bit = qcom_smem_dram_get_hbb();
>>>>
>>>>>  }
>>>>>
>>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>> @@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>>       bool is_a7xx;
>>>>>       int ret;
>>>>>
>>>>> +     /* We need data from SMEM to retrieve HBB in calc_ubwc_config() */
>>>>> +     if (!qcom_smem_is_available())
>>>>> +             return ERR_PTR(-EPROBE_DEFER);
>>>>> +
>>>>
>>>> We should add "depends on QCOM_SMEM" to Kconfig. Is SMEM device present
>>>> in all Qcom SoC devicetrees? I wonder if there is a scenario where there
>>>> might be an infinite EPROBE_DEFER here.
>>>>
>>>> -Akhil.
>>>>
>>>>>       a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
>>>>>       if (!a6xx_gpu)
>>>>>               return ERR_PTR(-ENOMEM);
>>>>>
>>>>
>>

