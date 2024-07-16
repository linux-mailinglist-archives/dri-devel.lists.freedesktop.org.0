Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876C933480
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 01:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3BF10E90D;
	Tue, 16 Jul 2024 23:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QKhjHziW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0F10E912;
 Tue, 16 Jul 2024 23:15:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHeuFT025075;
 Tue, 16 Jul 2024 23:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xlAF+UhYom4ntwJpXrickDft1UImThR+NVnHFjaXJ7A=; b=QKhjHziWqi7vZagI
 uFKwb+WlPwVQmgnNXEXiQRyz5QHAlmhOpDC2juuh7QUMMzt6v4tL+Vs85AWGqyJ9
 jnLLLxJ+S938e4PubGDrgzTL7NpBE00JOyH4bVf6wIgJ9/Cq2pkjK0HTvPLXiHlT
 PAMa9UHKLl5aG38k/c/8XlLPskKUjbAQPGU4xcPy5GML2snZAcWp5iA4jqZROovn
 NEdoNoFwLisGc6RQcm1BEW/hy+wsj98Hp4rhalA4ORUDsikAOyK0jh3XYuh9jivG
 a1W+Osydzba6O1FUXJ9epqcVSC1w7D8OqBPSZrSME5BpHw6kf9h3R3NkZ2VNTGLb
 PQipjw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpgk5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 23:14:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46GNEvXO029536
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 23:14:57 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 16:14:56 -0700
Message-ID: <d7905aa1-67fa-4468-b3ce-69c7aa4ec5e5@quicinc.com>
Date: Tue, 16 Jul 2024 16:14:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <freedreno@lists.freedesktop.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
 <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
 <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com>
 <CAA8EJprmi9zxEipq=0LyBi4nJ59BrLgN1sL+3u7-n9kJ3yQcRg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprmi9zxEipq=0LyBi4nJ59BrLgN1sL+3u7-n9kJ3yQcRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K7GQlTGwc-wkU96RMRrBCQbXOjXWCmKp
X-Proofpoint-GUID: K7GQlTGwc-wkU96RMRrBCQbXOjXWCmKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=992 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160171
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



On 7/16/2024 4:10 PM, Dmitry Baryshkov wrote:
> On Wed, 17 Jul 2024 at 01:43, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/16/2024 2:50 PM, Rob Clark wrote:
>>> On Tue, Jul 16, 2024 at 2:45 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 7/15/2024 12:51 PM, Rob Clark wrote:
>>>>> On Mon, Jul 1, 2024 at 12:43 PM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>
>>>>>> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
>>>>>>> There is no recovery mechanism in place yet to recover from mmu
>>>>>>> faults for DPU. We can only prevent the faults by making sure there
>>>>>>> is no misconfiguration.
>>>>>>>
>>>>>>> Rate-limit the snapshot capture for mmu faults to once per
>>>>>>> msm_kms_init_aspace() as that should be sufficient to capture
>>>>>>> the snapshot for debugging otherwise there will be a lot of
>>>>>>> dpu snapshots getting captured for the same fault which is
>>>>>>> redundant and also might affect capturing even one snapshot
>>>>>>> accurately.
>>>>>>
>>>>>> Please squash this into the first patch. There is no need to add code
>>>>>> with a known defficiency.
>>>>>>
>>>>>> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
>>>>>
>>>>> So, in some ways devcoredump is ratelimited by userspace needing to
>>>>> clear an existing devcore..
>>>>>
>>>>
>>>> Yes, a new devcoredump device will not be created until the previous one
>>>> is consumed or times out but here I am trying to limit even the DPU
>>>> snapshot capture because DPU register space is really huge and the rate
>>>> at which smmu faults occur is quite fast that its causing instability
>>>> while snapshots are being captured.
>>>>
>>>>> What I'd suggest would be more useful is to limit the devcores to once
>>>>> per atomic update, ie. if display state hasn't changed, maybe an
>>>>> additional devcore isn't useful
>>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>
>>>> By display state change, do you mean like the checks we have in
>>>> drm_atomic_crtc_needs_modeset()?
>>>>
>>>> OR do you mean we need to cache the previous (currently picked up by hw)
>>>> state and trigger a new devcores if the new state is different by
>>>> comparing more things?
>>>>
>>>> This will help to reduce the snapshots to unique frame updates but I do
>>>> not think it will reduce the rate enough for the case where DPU did not
>>>> recover from the previous fault.
>>>
>>> I was thinking the easy thing, of just resetting the counter in
>>> msm_atomic_commit_tail().. I suppose we could be clever filter out
>>> updates that only change scanout address.  Or hash the atomic state
>>> and only generate devcoredumps for unique states.  But I'm not sure
>>> how over-complicated we should make this.
>>>
>>> BR,
>>> -R
>>
>> Its a good idea actually and I would also like to keep it simple :)
>>
>> One question, is it okay to assume that all compositors will only issue
>> unique commits? Because we are assuming thats the case with resetting
>> the counter in msm_atomic_commit_tail().
> 
> The compositors use drm_mode_atomic_ioctl() which allocates a new
> state each time. It is impossible to re-submit the same
> drm_atomic_state from userspace.
> 

No, what I meant was, is it okay to assume that a commit is issued only 
when display configuration has changed?

Like if we get multiple commits for the same frame for some reason, 
thats also spam and this approach will not avoid that.

> 
