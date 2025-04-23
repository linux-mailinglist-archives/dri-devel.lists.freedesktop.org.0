Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC0A97FE0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 08:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99D10E400;
	Wed, 23 Apr 2025 06:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lJdLuOkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83DD10E3FF;
 Wed, 23 Apr 2025 06:56:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0imR8024486;
 Wed, 23 Apr 2025 06:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JNK7csbWWJGOBAas9TNoxtKn6v3A37YJlU2owPvz6As=; b=lJdLuOkq+MbHdKqP
 z8NnZEUKPIhCq6xJxTd82za4RIknfuKjwOqKKIkbtRC9xSmzONt7kqg9m48M64jb
 88UuMvPeKJzsodTpd8rS1nl4SN0sQNWqIaLnkG/KfUus/xZY5UnrrZBH6y2NOIU3
 EDSj5v62nF2POvqbsSvwMlZUPQnlCcJVTVyKrOI64kUlZGShNBt3kdEykcAIvqKv
 qOYnHTQLDLiqHtqcjb9LLX/GMEsy9wqanlIHtgEyKJ61WUhUUa9LWw5tU8kgisQG
 XnVmJJxvxEZIjq0C9p+GO+tVDakkdWbVUhzVxWKhgRloee8EU1USbw3iALUGIfiu
 x9P5Uw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh395cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 06:55:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6teTU023927
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 06:55:40 GMT
Received: from [10.216.1.162] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 23:55:23 -0700
Message-ID: <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
Date: Wed, 23 Apr 2025 12:25:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>
CC: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DCJhFJ_Gse0nR6-0i__p9vnIB0-LNb6Q
X-Proofpoint-GUID: DCJhFJ_Gse0nR6-0i__p9vnIB0-LNb6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0NiBTYWx0ZWRfXz8Kag/OH6Cal
 r7KNWLltqrX/X7mjyOb9yk7doxf9dMeHmhsy/yjUAv9zXfKu3tDv8UfwS01/rMfQ1O1SWmFCuQy
 ZtGQ3I/ZNMwvM4PL+Tor1vH4Nk1UQxAAoiqBc8elIya0JS99uQoIhCvGa9jKaDUhEdLXGhCcJCB
 pVi1rH2emJY3Kim1ZvDbLVGL9efSWDpx1UKy7s6hH54KpxmRCwKO0BO/xDsl5woAnLiWq6eZj6r
 9XLaAuu+eLBPUtLNrAqv/UT/j6m4EYFEZIKwPrEDdz277HCtvYlhIOk9o/oyaUfuZ+DdxGLXsPn
 8zZzjkc2Ui46l6lTRaS2xjLD/GUwzjLFovlemvMSffib9S3dQY+YCvSmODoVeXMpa+5XQwHfAB1
 ZcO463UBR9M3NpXznRwpAEqXmVtYC5htmrNVjzbVo72cILAsONssDFmNapA0/1/DtbsFIejL
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68088ef5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BtPMHYKAB6ts6yx63a4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230046
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

On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
> On 4/21/25 10:13 PM, Rob Clark wrote:
>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>
>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>
>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>
>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>
>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>
>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>
>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>  {
>>>>>>>> +     int hbb;
>>>>>>>> +
>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>       }
>>>>>>>> +
>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>> +     if (hbb < 0)
>>>>>>>> +             return;
>>>>>>>> +
>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>
>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>
>>>>>> To be clear about this, from the moment we introduced host image
>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>> here.
>>>>>
>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>> is unused in production.
>>>>
>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>> clear up any confusion about Mesa.
>>>>
>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>> memory type... do you know what source that used?
>>>
>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>> to detect ddrtype and calculates the HBB value based on that.
>>
>> Would it be reasonable to use the smem value, but if we find the
>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>
>> That would at least give some confidence, or justified un-confidence
>> about the smem values
> 
> The aforementioned value is populated based on the data that this
> driver reads out, and only on the same range of platforms that this
> driver happens to cater to

Like I suggested privately, can we centralize all ubwc configuration so
that it is consistent across all drivers. With that, we will need to
maintain a table of ubwc config for each chipset and HBB can be
calculated based on the DDR configuration identified from SMEM. Once we
migrate the downstream drivers to the new API, we can hopefully move to
the HBB value from SMEM. This will ensure that the SMEM data for HBB is
accurate in all future chipsets.

-Akhil.



> 
> Konrad

