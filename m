Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5805A1875
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 20:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3168A10E281;
	Thu, 25 Aug 2022 18:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA27E10E281;
 Thu, 25 Aug 2022 18:12:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PBLU9g018791;
 Thu, 25 Aug 2022 18:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ugzSH04DZ9cv0TlB7nd7EqmHTKcCZ1NNxyC32ghRkos=;
 b=IncOPtohxrcN+Ds70wVglYeR3vR3fvonQ+5FkaDfMNNjo9YidXhYePMY/kJsfWuHvhWU
 5Mis6oq6QNjlkVvGGo0IKr+2VjxIMm5CuDj8sNGQgVfGtpXvyK3Rmzg3O5ZhuCxjZUE9
 1Rvh4nRcPkJ54JnO5yNXYPsYu1ib1e88ybAxtftpXTilaL8b29w/s/2U5UUogsJnbqap
 k/aSm4qTG6YZTWeKmWaENneg6jT29bn6PJuVff2D6nzraGCH2Fry1gx3MN8BxgPylYPC
 aDjRrrNFhFQC5p8qSIvB2+Ddlk/yr8j5Q3kmaraT3460oCTONpA9RcGIjYoCL7ozgWNh OA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j644ntn7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 18:12:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27PICOxe018786
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 18:12:24 GMT
Received: from [10.216.58.252] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 25 Aug
 2022 11:12:19 -0700
Message-ID: <a5ba1e62-ea0a-22f1-241e-69dcf6f1b227@quicinc.com>
Date: Thu, 25 Aug 2022 23:42:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 5/5] drm/msm: Skip tlbinv on unmap from non-current
 pgtables
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220821181917.1188021-1-robdclark@gmail.com>
 <20220821181917.1188021-6-robdclark@gmail.com>
 <93ff00db-b5d0-350c-b192-e58b781bb1cf@quicinc.com>
 <CAF6AEGtBw5pgdpaF6F5sBJvn6Kief2jHnSbKXFJGZ_GeGVjafQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGtBw5pgdpaF6F5sBJvn6Kief2jHnSbKXFJGZ_GeGVjafQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -ymAZlidGCrv7WW7ijreEo5VKQfy3-c-
X-Proofpoint-GUID: -ymAZlidGCrv7WW7ijreEo5VKQfy3-c-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250069
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/25/2022 12:32 AM, Rob Clark wrote:
> On Wed, Aug 24, 2022 at 10:46 AM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>> On 8/21/2022 11:49 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> We can rely on the tlbinv done by CP_SMMU_TABLE_UPDATE in this case.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 ++++++
>>>    drivers/gpu/drm/msm/msm_iommu.c       | 29 +++++++++++++++++++++++++++
>>>    2 files changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index c8ad8aeca777..1ba0ed629549 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -1180,6 +1180,12 @@ static int hw_init(struct msm_gpu *gpu)
>>>        /* Always come up on rb 0 */
>>>        a6xx_gpu->cur_ring = gpu->rb[0];
>>>
>>> +     /*
>>> +      * Note, we cannot assume anything about the state of the SMMU when
>>> +      * coming back from power collapse, so force a CP_SMMU_TABLE_UPDATE
>>> +      * on the first submit.  Also, msm_iommu_pagetable_unmap() relies on
>>> +      * this behavior.
>>> +      */
>>>        gpu->cur_ctx_seqno = 0;
>>>
>>>        /* Enable the SQE_to start the CP engine */
>>> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
>>> index 94c8c09980d1..218074a58081 100644
>>> --- a/drivers/gpu/drm/msm/msm_iommu.c
>>> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>>> @@ -45,8 +45,37 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
>>>                size -= 4096;
>>>        }
>>>
>>> +     /*
>>> +      * A CP_SMMU_TABLE_UPDATE is always sent for the first
>>> +      * submit after resume, and that does a TLB invalidate.
>>> +      * So we can skip that if the device is not currently
>>> +      * powered.
>>> +      */
>>> +     if (!pm_runtime_get_if_in_use(pagetable->parent->dev))
>>> +             goto out;
>>> +
>>> +     /*
>>> +      * If we are not the current pgtables, we can rely on the
>>> +      * TLB invalidate done by CP_SMMU_TABLE_UPDATE.
>>> +      *
>>> +      * We'll always be racing with the GPU updating ttbr0,
>>> +      * but there are only two cases:
>>> +      *
>>> +      *  + either we are not the the current pgtables and there
>>> +      *    will be a tlbinv done by the GPU before we are again
>>> +      *
>>> +      *  + or we are.. there might have already been a tblinv
>>> +      *    if we raced with the GPU, but we have to assume the
>>> +      *    worse and do the tlbinv
>>> +      */
>>> +     if (adreno_smmu->get_ttbr0(adreno_smmu->cookie) != pagetable->ttbr)
>>> +             goto out_put;
>>> +
>>>        adreno_smmu->tlb_inv_by_id(adreno_smmu->cookie, pagetable->asid);
>>>
>>> +out_put:
>>> +     pm_runtime_put(pagetable->parent->dev);
>>> +out:
>>>        return (unmapped == size) ? 0 : -EINVAL;
>>>    }
>>>
>> Asking because it is a *security issue* if we get this wrong:
>> 1. Is there any measure benefit with this patch? I believe tlb
>> invalidation doesn't contribute much to the unmap latency.
> It turned out to not make a huge difference.. although I expect the
> part about skipping the inv when runtime suspended is still useful
> from a power standpoint (but don't have a great setup to measure that)
Agree. Perhaps use the recently added 'suspended' flag instead of 
pm_runtime_get_if_in_use().

-Akhil.
>
> BR,
> -R
>
>> 2. We at least should insert a full memory barrier before reading the
>> ttbr0 register to ensure that everything we did prior to that is visible
>> to smmu. But then I guess the cost of the full barrier would be similar
>> to the tlb invalidation.
>>
>> Because it could lead to security issues or other very hard to debug
>> issues, I would prefer this optimization only if there is a significant
>> measurable gain.
>>
>> -Akhil.
>>

