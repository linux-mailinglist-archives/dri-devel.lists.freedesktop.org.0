Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7847A1BF89
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 01:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED74810EA4B;
	Sat, 25 Jan 2025 00:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QeSmzKQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403F10EA4B;
 Sat, 25 Jan 2025 00:08:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OJxR50011528;
 Sat, 25 Jan 2025 00:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6DpsbXJGC1N5RDNkyXzlI65enH6ITLizPoXlgW7WZxE=; b=QeSmzKQkWvNUFDF9
 N0WooCQP5F+tdrpe+BZ+v2ju4LvYCxO4QdWGH8LSY/vLX2MOESOmJZOx+j+ZZ94e
 tAsKWzPp4BEYFNzKbz2r1XrkvhjADHPLWXbaPNHCJwJoVZwNMiGneHcRbe1rXK0H
 pJOzZCaO/t4FByNJn4k2OVfvwQ0nMglGcadVuvWj9VJ9CfkdE08p8CO02cfB2p1s
 d4ikh7G+a6Xc+zK6+bLEUbbXdsAOV0ys9nfVeylF832QvjN9umtXPPH4w1SBTX/U
 38pqFQZmNAKBpqt10GqTiWQLlOtvL/T7IS8S8w0D7G2jmybmm3qbS8Baygu1i7TJ
 M8EzhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44chfugbtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Jan 2025 00:08:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50P08QZm023548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Jan 2025 00:08:26 GMT
Received: from [10.110.51.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 16:08:25 -0800
Message-ID: <7dc1f356-b1e0-4bca-bfb9-8de3717407bc@quicinc.com>
Date: Fri, 24 Jan 2025 16:08:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
 <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
 <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <esyb2hdp3rutcoiblqnxshta3x47ymdyotphasliprmkp643ic@eyopzwlihcpk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QKrklvJJ5IATHtNGW3Tks3-SnwXkcxpr
X-Proofpoint-GUID: QKrklvJJ5IATHtNGW3Tks3-SnwXkcxpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_10,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240164
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



On 1/23/2025 9:19 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 01:41:14PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
>>>> Continue migration to the MDSS-revision based checks and replace
>>>> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10
>>>> ++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
>>>>    7 files changed, 5 insertions(+), 20 deletions(-)
>>>>
>>>
>>> <snip>
>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0
>>>> 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong
>>>> *dpu_hw_pingpong_init(struct drm_device *dev,
>>>>            c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>>>>        }
>>>> -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
>>>> +    if (mdss_rev->core_major_ver < 7) {
>>>>            c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>>>            c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>>>            c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>>>
>>>
>>> So far in this series, we replaced the feature bits with >= checks of
>>> core_revisions. That kind of works as usually feature bits get added
>>> after a specific version.
>>>
>>> With this patch and later, whenever we use < checks it gets a bit tricky
>>> as we might also need an upper bound. Feature bits gave individual
>>> control of chipsets but generalizing that all chipsets < 7 have PP DSC
>>> is also not correct. I have to really cross-check but there could be
>>> some old chipsets which do not have DSC at all.
>>
>> This raises another question as well.
>>
>> what if some register was introduced >= X version but was then dropped in a
>> newer chipset.
>>
>> Is it not difficult for the user to go back to the files of each of the
>> sub-blocks and alter these checks rather than just fixing up the catalog.
> 
> Well, the obvious example we are going to have is the CTL_LAYER_EXT4,
> but if I understand correctly the whole block is going to be dropped, so
> maybe it's not that relevant.
> 
> Another example might be CWB, where we are going to have 5.x-7.x and
> 8.x+ DPU ranges.
> 
> Basically, yes, when adding support for a new platform we have to audit
> HW blocks. But this applied even beforehand, where new platforms could
> be drooping existing regs (8.x+ dropping a part of the TOP region).
> 

Right, I am wondering what is the trade-off here.

1) Feature bits allow selective control for every chipset. IOW, the 
specific version is already checked for. I do admit that I have seen 
errors about using the correct feature mask sometimes but even with this 
change, evey developer will need to go and check every sub-block file 
which they might not even know about.

2) core_revision certainly can generalize but we might still need 
absolute versions for some of the bits anyway. So the checks may not 
always be >= or < but it could also end up with something like

if (major_rev == xxx && minor_rev == yyy)
	ops = ops_a;
else if (major_rev == aaa &&& minor_rev == bbb)
	ops = ops_b

So the revision check will most likely end up being more complicated 
than simple range checks. With each catalog feature bit atleast we are 
guaranteed that its applied only to that revision.

I do see in the cover letter, about incorrect feature bits sometimes 
used but I am trying to assess the trade-offs even with this approach.
