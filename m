Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E945185CBB2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 00:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C710E5B1;
	Tue, 20 Feb 2024 23:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="euLsjYWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EAE10E5B0;
 Tue, 20 Feb 2024 23:04:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KMx697021470; Tue, 20 Feb 2024 23:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Bof6XAm4OTdVjtagLXEQ6O2of8fvs43Zc1jCw22Z0B8=; b=eu
 LsjYWwT6oBAZ5bdYr1Eqbi6GNvSJ55Q9d/1kWgYbI77gSfl/KNv3IqmtDoOi83dY
 DMxToNcc7oSRaMSRjSx2I6GQTv2roUJJojY8UQnFVJOhE5scorfelQYMudUiMTbZ
 nHK4JOVTgXXPRMCOwprwBXrTfbb2tVSCJdl+bAOZ2IFCURNC2H47kCHVH08owpM5
 Vsaso1ksoGw7ICPqsjTKRg5Isqk0y98aGqtvcw0BWbYn84B/2W/WGP8RmUhtoSDb
 UGyA6AADpCAX3Yaei+WEl9s2fb/8Og9cXRg6unj+LQYhLGVEG8UjqlQfJnfWab6y
 HWogz1s2UFv4ltRIkjFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s8dnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 23:04:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KN4QnI005322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 23:04:26 GMT
Received: from [10.110.62.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 15:04:25 -0800
Message-ID: <09928fb7-c5c3-7a36-1ce2-9f4012507d06@quicinc.com>
Date: Tue, 20 Feb 2024 15:04:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
 <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
 <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com>
 <CAA8EJpqHmVBry9FyJ6HRB+qdVcVNN3Q7rHZz1daZL1Sz6yeZ=A@mail.gmail.com>
 <69d152d2-6a25-9ff4-ce6b-c4790247a661@quicinc.com>
 <CAA8EJpo3XynBrm0S_BA_SxGOw963WQT9jh=YvLcT1N24FyEUsw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpo3XynBrm0S_BA_SxGOw963WQT9jh=YvLcT1N24FyEUsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3Iz7JJSkCzsOf73_LYLXAxmBxXsRNUIk
X-Proofpoint-GUID: 3Iz7JJSkCzsOf73_LYLXAxmBxXsRNUIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=858 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402200165
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



On 2/20/2024 2:42 PM, Dmitry Baryshkov wrote:
> On Wed, 21 Feb 2024 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/19/2024 3:52 AM, Dmitry Baryshkov wrote:
>>> On Wed, 14 Feb 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
>>>>>>> We have several reports of vblank timeout messages. However after some
>>>>>>> debugging it was found that there might be different causes to that.
>>>>>>> To allow us to identify the DPU block that gets stuck, include the
>>>>>>> actual CTL_FLUSH value into the timeout message and trigger the devcore
>>>>>>> snapshot capture.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
>>>>>>>       (Abhinav)
>>>>>>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
>>>>>>>      1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>> index d0f56c5c4cce..a8d6165b3c0a 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
>>>>>>>                  (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
>>>>>>>                  msecs_to_jiffies(50));
>>>>>>>          if (ret <= 0) {
>>>>>>> -             DPU_ERROR("vblank timeout\n");
>>>>>>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
>>>>>>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
>>>>>>
>>>>>>
>>>>>> There is no rate limiting in this piece of code unfortunately. So this
>>>>>> will flood the number of snapshots.
>>>>>
>>>>> Well... Yes and no. The devcoredump will destroy other snapshots if
>>>>> there is a pending one. So only the console will be flooded and only
>>>>> in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
>>>>>
>>>>
>>>> Yes, true but at the same time this makes it hard to capture a good dump
>>>> as potentially every vblank you could timeout so this destroy/create
>>>> cycle wont end.
>>>
>>> Excuse me, maybe I miss something. On the first timeout the snapshot
>>> is created. It is held by the kernel until it is fully read out from
>>> the userspace. Other snapshots will not interfere with this snapshot.
>>>
>>
>> For every new snapshot a new devcoredump device will be created which
>> should remain till it has been read. But now this will be created every
>> blank. IMO, this is really too much data for no reason.
> 
> No-no-no. If there is a devcoredump for a device, the next one will
> not be created. See dev_coredumpm().
> So all the snapshots will be created and then destroyed immediately.
> 

hmm ... I have certainly seen devcd_count go higher than one (but not 
more than 2). I am wondering whether this was because of some race 
condition of the previous destroy / new create.

But anyway, this part is clear now. thanks.

>>
>> Subsequent vblank timeouts are not going to give any new information
>> compared to the existing snapshot of the first vblank timeout thats why
>> we should just create the snapshot when the first error happens and stop.
>>
>> For other frame done timeouts, infact subsequent timeouts without any
>> sort of recovery in between are quite misleading because hardware was
>> already not able to fetch the previous frame so it will most likely not
>> fetch the next one either till it has recovered. Typically thats why
>> these vblank timeouts happen in a flurry as the hardware never really
>> recovered from the first timeout.
>>
>>> Or are you worried that snapshotting takes time, so taking a snapshot
>>> will also interfere with the vblank timings for the next vblank?
>>>
>>
>> Yes this is another point.
> 

snapshots will still be captured every vblank timeout and reading 
through the entire DPU reg space every vblank timeout is certainly 
something we can avoid.
