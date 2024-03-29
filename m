Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E6891194
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 03:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5310EDA3;
	Fri, 29 Mar 2024 02:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VrQTtiva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FA410E2BA;
 Fri, 29 Mar 2024 02:16:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42T026cu008384; Fri, 29 Mar 2024 02:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ET2FDhQlls+QQvW0Tm6GR0c7dLAUpaKr/E+O+6xcyU8=; b=Vr
 QTtivawhlH+DVoY/bS/ecy29xrPWM7YaGrb1pZM5YtcXj/6fH5MKn2KCp2ZXzBco
 Xw0WHFAvx9QQwc42QYnw6FRPyblDA7BaL4GBJ6TztCkbGuznTUYnI1vSWuDueWZQ
 D32DAE0V7pGdTwke8t7PMayE7qCWu00dOm1G0VzwTCCMF18W1B1VYxq4+4L5o9WY
 NtI3SZ/IGXVsLuQGTUf9wJrSEgzO2t4E1OwMn2sj198Kwkyk9vC+wqkraEF2rjnw
 dgbihsxAkgwjHBMVB7nWed04AKyByLSbxqvK2rzJ2Kbe80k1r6TcdhLaBc9VDKIL
 eSjTvkhmYkUY+Mdl+rsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5dkygv9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 02:16:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T2G7k3004202
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 02:16:07 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 19:15:58 -0700
Message-ID: <efbe5aa8-8bbe-26cd-ca70-1974241a3537@quicinc.com>
Date: Thu, 28 Mar 2024 19:15:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <abel.vesa@linaro.org>,
 <agross@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
 <CAA8EJppEWXnsQzDD1tdNuMb1ijEVtE7LQct9jt1fwVwMd8ch_Q@mail.gmail.com>
 <27cadd17-10a3-3b8c-2b29-6698ccdce531@quicinc.com>
 <CAA8EJpqYVDG9pBj39m40rPwUNgE7x07HfCt6C3yaMN7eOaWk6Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqYVDG9pBj39m40rPwUNgE7x07HfCt6C3yaMN7eOaWk6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _EN-CXVHjO6zKjvtrYlVSsyflCChEGzH
X-Proofpoint-GUID: _EN-CXVHjO6zKjvtrYlVSsyflCChEGzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_01,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=970 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290017
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



On 3/28/2024 5:10 PM, Dmitry Baryshkov wrote:
> On Fri, 29 Mar 2024 at 01:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/28/2024 3:50 PM, Dmitry Baryshkov wrote:
>>> On Thu, 28 Mar 2024 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
>>>>> Quoting Abhinav Kumar (2024-03-28 13:24:34)
>>>>>> + Johan and Bjorn for FYI
>>>>>>
>>>>>> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
>>>>>>> For internal HPD case, hpd_event_thread is created to handle HPD
>>>>>>> interrupts generated by HPD block of DP controller. It converts
>>>>>>> HPD interrupts into events and executed them under hpd_event_thread
>>>>>>> context. For external HPD case, HPD events is delivered by way of
>>>>>>> dp_bridge_hpd_notify() under thread context. Since they are executed
>>>>>>> under thread context already, there is no reason to hand over those
>>>>>>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
>>>>>>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
>>>>>>>
>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
>>>>>>>      1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>
>>>>>> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
>>>>>
>>>>> Is this a bug fix or an optimization? The commit text doesn't tell me.
>>>>>
>>>>
>>>> I would say both.
>>>>
>>>> optimization as it avoids the need to go through the hpd_event thread
>>>> processing.
>>>>
>>>> bug fix because once you go through the hpd event thread processing it
>>>> exposes and often breaks the already fragile hpd handling state machine
>>>> which can be avoided in this case.
>>>
>>> Please add a description for the particular issue that was observed
>>> and how it is fixed by the patch.
>>>
>>> Otherwise consider there to be an implicit NAK for all HPD-related
>>> patches unless it is a series that moves link training to the enable
>>> path and drops the HPD state machine completely.
>>>
>>> I really mean it. We should stop beating a dead horse unless there is
>>> a grave bug that must be fixed.
>>>
>>
>> I think the commit message is explaining the issue well enough.
>>
>> This was not fixing any issue we saw to explain you the exact scenario
>> of things which happened but this is just from code walkthrough.
>>
>> Like kuogee wrote, hpd event thread was there so handle events coming
>> out of the hpd_isr for internal hpd cases. For the hpd_notify coming
>> from pmic_glink or any other extnernal hpd cases, there is no need to
>> put this through the hpd event thread because this will only make things
>> worse of exposing the race conditions of the state machine.
>>
>> Moving link training to enable and removal of hpd event thread will be
>> worked on but delaying obvious things we can fix does not make sense.
> 
>  From the commit message this feels like an optimisation rather than a
> fix. And granted the fragility of the HPD state machine, I'd prefer to
> stay away from optimisations. As far as I understood from the history
> of the last revert, we'd better make sure that HPD handling goes only
> through the HPD event thread.
> 

I think you are mixing the two. We tried to send the events through 
DRM's hpd_notify which ended up in a bad way and btw, thats still not 
resolved even though I have seen reports that things are fine with the 
revert, we are consistently able to see us ending up in a disconnected 
state with all the reverts and fixes in our x1e80100 DP setup.

I plan to investigate that issue properly in the next week and try to 
make some sense of it all.

In fact, this patch is removing one more user of the hpd event thread 
which is the direction in which we all want to head towards.

On whether this is an optimization or a bug fix. I think by avoiding hpd 
event thread (which should have never been used for hpd_notify updates, 
hence a bug) we are avoiding the possibility of more race conditions.

So, this has my R-b and it holds. Upto you.

