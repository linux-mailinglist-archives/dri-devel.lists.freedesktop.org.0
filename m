Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F993344E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 00:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4690510E8EF;
	Tue, 16 Jul 2024 22:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kT9iVsdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3310E8EF;
 Tue, 16 Jul 2024 22:43:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfbkl024353;
 Tue, 16 Jul 2024 22:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X0HNYJ6Zl5BBLcsAlGhkH9DCo0hSKmIGYGJnb5+xX8U=; b=kT9iVsdhrlyfogLb
 GdHoN5QceJQ+C/A6lueNy9FpPM07cWiCpyUuJdS2PBLivd+xV0jVmys9U85n/hxq
 ExFpOjpg8qJn50rFLh7EsMFAti7OmFrxXfTikk2S+8KYkyhDzFPMBKNjhiZwqk+C
 VQ+y04ueSbapMUYctBaxq4fYQsSJQOuMZU6Mb4vsPRFEeplgDKj6d4oJtbLtG7M/
 xdaMxbNq1MSl2X9K78hBWUZ2Q55ULWTPNdlh0q3T8v+r9kVAxl5Q7uucIY7d1CRV
 qLgzQfSDIasZHhxcfmCQKVd9SolmuTTObOxlK7IKE/aV1gRslU3sGcQolAcT2Isp
 VPqirQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfu0hju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 22:43:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46GMh8Lu006720
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 22:43:08 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 15:43:07 -0700
Message-ID: <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com>
Date: Tue, 16 Jul 2024 15:43:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Rob Clark <robdclark@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
 <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LsOaoasqd-g_tbx4W7LBmwroSZzfrS9Q
X-Proofpoint-ORIG-GUID: LsOaoasqd-g_tbx4W7LBmwroSZzfrS9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160167
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



On 7/16/2024 2:50 PM, Rob Clark wrote:
> On Tue, Jul 16, 2024 at 2:45 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/15/2024 12:51 PM, Rob Clark wrote:
>>> On Mon, Jul 1, 2024 at 12:43 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
>>>>> There is no recovery mechanism in place yet to recover from mmu
>>>>> faults for DPU. We can only prevent the faults by making sure there
>>>>> is no misconfiguration.
>>>>>
>>>>> Rate-limit the snapshot capture for mmu faults to once per
>>>>> msm_kms_init_aspace() as that should be sufficient to capture
>>>>> the snapshot for debugging otherwise there will be a lot of
>>>>> dpu snapshots getting captured for the same fault which is
>>>>> redundant and also might affect capturing even one snapshot
>>>>> accurately.
>>>>
>>>> Please squash this into the first patch. There is no need to add code
>>>> with a known defficiency.
>>>>
>>>> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
>>>
>>> So, in some ways devcoredump is ratelimited by userspace needing to
>>> clear an existing devcore..
>>>
>>
>> Yes, a new devcoredump device will not be created until the previous one
>> is consumed or times out but here I am trying to limit even the DPU
>> snapshot capture because DPU register space is really huge and the rate
>> at which smmu faults occur is quite fast that its causing instability
>> while snapshots are being captured.
>>
>>> What I'd suggest would be more useful is to limit the devcores to once
>>> per atomic update, ie. if display state hasn't changed, maybe an
>>> additional devcore isn't useful
>>>
>>> BR,
>>> -R
>>>
>>
>> By display state change, do you mean like the checks we have in
>> drm_atomic_crtc_needs_modeset()?
>>
>> OR do you mean we need to cache the previous (currently picked up by hw)
>> state and trigger a new devcores if the new state is different by
>> comparing more things?
>>
>> This will help to reduce the snapshots to unique frame updates but I do
>> not think it will reduce the rate enough for the case where DPU did not
>> recover from the previous fault.
> 
> I was thinking the easy thing, of just resetting the counter in
> msm_atomic_commit_tail().. I suppose we could be clever filter out
> updates that only change scanout address.  Or hash the atomic state
> and only generate devcoredumps for unique states.  But I'm not sure
> how over-complicated we should make this.
> 
> BR,
> -R

Its a good idea actually and I would also like to keep it simple :)

One question, is it okay to assume that all compositors will only issue 
unique commits? Because we are assuming thats the case with resetting 
the counter in msm_atomic_commit_tail().

> 
>>
>>>>
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
>>>>>    drivers/gpu/drm/msm/msm_kms.h | 3 +++
>>>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>>>>> index d5d3117259cf..90a333920c01 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>>>>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>>>>>    {
>>>>>         struct msm_kms *kms = arg;
>>>>>
>>>>> -     msm_disp_snapshot_state(kms->dev);
>>>>> +     if (!kms->fault_snapshot_capture) {
>>>>> +             msm_disp_snapshot_state(kms->dev);
>>>>> +             kms->fault_snapshot_capture++;
>>>>
>>>> When is it decremented?
>>>>
>>>>> +     }
>>>>>
>>>>>         return -ENOSYS;
>>>>>    }
>>>>> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>>>>>                 mmu->funcs->destroy(mmu);
>>>>>         }
>>>>>
>>>>> +     kms->fault_snapshot_capture = 0;
>>>>>         msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
>>>>>
>>>>>         return aspace;
>>>>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>>>>> index 1e0c54de3716..240b39e60828 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_kms.h
>>>>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>>>>> @@ -134,6 +134,9 @@ struct msm_kms {
>>>>>         int irq;
>>>>>         bool irq_requested;
>>>>>
>>>>> +     /* rate limit the snapshot capture to once per attach */
>>>>> +     int fault_snapshot_capture;
>>>>> +
>>>>>         /* mapper-id used to request GEM buffer mapped for scanout: */
>>>>>         struct msm_gem_address_space *aspace;
>>>>>
>>>>> --
>>>>> 2.44.0
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
