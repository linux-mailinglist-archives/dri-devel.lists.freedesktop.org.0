Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477D855416
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 21:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B991F10E1C8;
	Wed, 14 Feb 2024 20:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mCk/bBot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCF010E128;
 Wed, 14 Feb 2024 20:36:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EJsvv5017502; Wed, 14 Feb 2024 20:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=nsIWBstOsK6ubKtb2lLsZtsb2va6QvCDF7mcm2BfHpo=; b=mC
 k/bBotH/I/pvfLnGUx/4IR0pJ+7JIhgk4RthraEFV4LqSKiomit6sC5v6mMDJawe
 kOwY0cuc1SVFRM+VcFM0attfGoyOPSeQUqu04m5qpqX1wSOdblh/PPujzkMZsTe7
 FNy7joIUI5W8lXwRrQVRXRfuMjLun3wzlRFYviAX7cIV5eUyfsMoQZ0HmxZUHtvi
 XPtYiOil/Zc55rFcEkl8hy1lmsq5OEMk1xi1eqeKOfveoAT6if+M05QF2W0FCB7p
 m0lZuYOKZAT5KAHX7aiOm6zUgi0tblJLHCnvPU3wNElaOjx1tXKZdwertK2hWEVy
 fEFo03Bs3q6qikkEfeDA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9435r2mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 20:36:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EKa0MX015552
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 20:36:00 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 12:35:59 -0800
Message-ID: <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com>
Date: Wed, 14 Feb 2024 12:35:58 -0800
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3b57zRcZ-7YoW2kAKWXOlAFdamm67T9M
X-Proofpoint-ORIG-GUID: 3b57zRcZ-7YoW2kAKWXOlAFdamm67T9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=875
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140159
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



On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
> On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
>>> We have several reports of vblank timeout messages. However after some
>>> debugging it was found that there might be different causes to that.
>>> To allow us to identify the DPU block that gets stuck, include the
>>> actual CTL_FLUSH value into the timeout message and trigger the devcore
>>> snapshot capture.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
>>>     (Abhinav)
>>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index d0f56c5c4cce..a8d6165b3c0a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
>>>                (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
>>>                msecs_to_jiffies(50));
>>>        if (ret <= 0) {
>>> -             DPU_ERROR("vblank timeout\n");
>>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
>>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
>>
>>
>> There is no rate limiting in this piece of code unfortunately. So this
>> will flood the number of snapshots.
> 
> Well... Yes and no. The devcoredump will destroy other snapshots if
> there is a pending one. So only the console will be flooded and only
> in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
> 

Yes, true but at the same time this makes it hard to capture a good dump 
as potentially every vblank you could timeout so this destroy/create 
cycle wont end.

>>
>> Short-term solution is you can go with a vblank_timeout_cnt and reset it
>> in the enable() like other similar error counters.
>>
>> long-term solution is we need to centralize these error locations to one
>> single dpu_encoder_error_handler() with a single counter and the error
>> handler will print out the error code along with the snapshot instead of
>> the snapshot being called from all over the place.
>>
>>
>>
>>>                return -ETIMEDOUT;
>>>        }
>>>
>>>
>>> ---
>>> base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
>>> change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063
>>>
>>> Best regards,
> 
> 
> 
