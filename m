Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4599E4400
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACB410E551;
	Wed,  4 Dec 2024 19:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Qim8GpN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9598210E54E;
 Wed,  4 Dec 2024 19:04:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Ebhvi010267;
 Wed, 4 Dec 2024 19:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rKvaVoAo9QZzYIpLIpPzm19Rx6mJMrYuo4XWJfhmVVI=; b=Qim8GpN2MyDDoYea
 WTXtsbIlCKXlvffsILgxUcJ2aZkxK3XcJnvArzid3vRw1m65JLcIHQ7qAJljJ/bD
 aYLL3GWGupRB3IPqrESmGjOz1kr82W7YgTgl+mHfup4T25uoQY5FWSVvRKGF2nkm
 7NeW//gE5GX+tzZtES2Rl29BiAAAJyYFGUxFWrEH9FpWimsMo4VIK7P1ii5zI0Iu
 V8P3b/JGE4YN0247nJ5FNfV2dqRaofhRNJ99GG6++56GBjoPDGhG7OrxNqBxcPNR
 v0TGDO8pKcBySnGpL9pbUGkqBvNUY8xqI/5SRy/aVEtLzF9lIcH/hHk5fusXiNMw
 bPBnyA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7ywcje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2024 19:04:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4J42lX027274
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 4 Dec 2024 19:04:02 GMT
Received: from [10.216.22.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 11:03:57 -0800
Message-ID: <f603f71c-64f4-4f29-b8b9-430d758a738b@quicinc.com>
Date: Thu, 5 Dec 2024 00:33:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Rob Clark <robdclark@gmail.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
 <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
 <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGvqPEFN+j0Txa5KPmxF8tXCn_uUsM86i4uo+tc2mTWYgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YWQExhXkQneS9244YNdV1kL_d4jQndXa
X-Proofpoint-GUID: YWQExhXkQneS9244YNdV1kL_d4jQndXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040145
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

On 12/1/2024 10:06 PM, Rob Clark wrote:
> On Sat, Nov 30, 2024 at 12:30 PM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>>
>> On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
>>> On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
>>>> There are a few chipsets which don't have system cache a.k.a LLC.
>>>> Currently, the assumption in the driver is that the system cache
>>>> availability correlates with the presence of GMU or RPMH, which
>>>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
>>>> with a full blown GMU, but doesnot have a system cache. So,
>>>> introduce an Adreno Quirk flag to check support for system cache
>>>> instead of using gmu_wrapper flag.
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>>>>  3 files changed, 4 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 0c560e84ad5a..5e389f6b8b8a 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>>              },
>>>>              .gmem = (SZ_128K + SZ_4K),
>>>>              .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>> +            .quirks = ADRENO_QUIRK_NO_SYSCACHE,
>>>>              .init = a6xx_gpu_init,
>>>>              .zapfw = "a610_zap.mdt",
>>>>              .a6xx = &(const struct a6xx_info) {
>>>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>              },
>>>>              .gmem = SZ_128K,
>>>>              .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>> -            .quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>>>> +            .quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>>>>              .init = a6xx_gpu_init,
>>>>              .zapfw = "a702_zap.mbn",
>>>>              .a6xx = &(const struct a6xx_info) {
>>>
>>> +a619_holi
>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 019610341df1..a8b928d0f320 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>>>>
>>>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>>>>  {
>>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>>>> -            return;
>>>> -
>>>>      llcc_slice_putd(a6xx_gpu->llc_slice);
>>>>      llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>>>>  }
>>>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>>>>  {
>>>>      struct device_node *phandle;
>>>>
>>>> -    /* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>>>> -    if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>>>> +    if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>>>>              return;
>>>
>>> I think A612 is the "quirky" one here.. it has some sort of a GMU,
>>> but we're choosing not to implement it. maybe a check for
>>>
>>> if (adreno_has_gmu_wrapper && !adreno_is_a612)
>>>
>>> would be clearer here, with a comment that RGMU support is not
>>> implemented
>>>
>>>
>>>
>>> But going further, I'm a bit concerned about dt-bindings.. If we
>>> implement RGMU on the driver side in the future, that will require
>>> DT changes which will make the currently proposed description invalid.
>>>
>>> I think a better angle would be to add a adreno_has_rgmu() func with
>>> a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.
>>>
>>> This way, we can avoid this syscache quirk as well.
>>>
>>
>> I am aware of at least Adreno 710 which doesn't have syscache, but has
>> proper GMU. And I don't see any reason why there couldn't be another one
>> in future to save silicon area. So, a quirk flag doesn't seem so bad in
>> this case.
>>
>> The correct way to avoid this quirk flag is by making LLCC driver return
>> a proper error to detect the absence of syscache. Currently, it just
>> returns EPROBE_DEFER which put driver in an infinite probe loop.
> 
> Hmm, this seems solvable?  llcc has a node in the dt, so it seems like
> it should be able to tell the difference between not existing and not
> being probed yet.  Something maybe like, initialize drv_data to NULL
> instead of -EPROBE_DEFER, and then in the various entry points, if
> (!drv_data) return not_probed_helper(); which would check if a
> compatible node exists in dt?

Sounds like that would work. Can we explore that separately?

I am a bit worried about adding another subsystem's patch to this
series. That might delay this series by weeks.

-Akhil

> 
> BR,
> -R
> 
>> Agree about the dt binding suggestion. I will define a new compatible
>> string for rgmu.
>>
>> -Akhil.
>>
>>> Konrad
>>

