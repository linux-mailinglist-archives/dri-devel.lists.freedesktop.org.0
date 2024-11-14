Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38609C914D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 19:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E114D10E837;
	Thu, 14 Nov 2024 18:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ayKDzBeu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9BE10E83B;
 Thu, 14 Nov 2024 18:03:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHvqX013436;
 Thu, 14 Nov 2024 18:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WPAYMJWo3f8zQDT0GQK415PBZz2HjsisECbUAqr83y0=; b=ayKDzBeuCaZWunKC
 7OzC2L4tttc5glZqLuainlHUTF/bQiAuAViuYRFJkF0E/ODH6MULHkBizx3z7/vJ
 DZA9MkulieLHKGW0ZSIKnUxVFCrUwQl+yPrUA1L/R7jymmLno5LUgbORMYK3LS4y
 G69AA9QsYjM+1a93ZILV2jMLIYcMPDVsJ1JOaCbkQ52lwCZr1ORKrxBM5MQo9pce
 6S7SLbGpBW396Xiujukp58P4A7mqTJPefnn3WA3wA4iHiS/jq/3YcPPLwFN/t5KN
 4z3MY42A5jM8ENEtwL/7dzMZBHciR8GJzA733qfkfpwRgjcZvyC4QK5+BgzyYRhb
 pQpdwQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w7ekkhrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2024 18:03:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEI32Kc004137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2024 18:03:02 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 10:02:58 -0800
Message-ID: <750739e8-62ad-4808-9d05-327d64355886@quicinc.com>
Date: Thu, 14 Nov 2024 23:32:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
 <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
 <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
 <9d690e39-2bda-4f5a-b7a5-2c9cf90a8065@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <9d690e39-2bda-4f5a-b7a5-2c9cf90a8065@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TGtOpQLQz2PmenG2JnFc9QPo4X0TKqfp
X-Proofpoint-GUID: TGtOpQLQz2PmenG2JnFc9QPo4X0TKqfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140142
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

On 11/14/2024 8:57 PM, Konrad Dybcio wrote:
> On 12.11.2024 10:15 PM, Akhil P Oommen wrote:
>> On 11/11/2024 8:38 PM, Rob Clark wrote:
>>> On Sun, Nov 10, 2024 at 9:31 AM Bjorn Andersson
>>> <bjorn.andersson@oss.qualcomm.com> wrote:
>>>>
>>>> Support for per-process page tables requires the SMMU aparture to be
>>>> setup such that the GPU can make updates with the SMMU. On some targets
>>>> this is done statically in firmware, on others it's expected to be
>>>> requested in runtime by the driver, through a SCM call.
>>>>
>>>> One place where configuration is expected to be done dynamically is the
>>>> QCS6490 rb3gen2.
>>>>
>>>> The downstream driver does this unconditioanlly on any A6xx and newer,
>>>
>>> nit, s/unconditioanlly/unconditionally/
>>>
>>>> so follow suite and make the call.
>>>>
>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>
>>>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 076be0473eb5..75f5367e73ca 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>>>>
>>>>  int adreno_hw_init(struct msm_gpu *gpu)
>>>>  {
>>
>> SCM calls into TZ can block for a very long time (seconds). It depends
>> on concurrent activities from other drivers like crypto for eg:. So we
>> should not do this in the gpu wake up path.
>>
>> Practically, gpu probe is the better place to do this.
> 
> Do we only have to do this once?
> 
> Do we have to redo it after CXPC?

Only once. Those registers have retention.

-Akhil.

> 
> Konrad

