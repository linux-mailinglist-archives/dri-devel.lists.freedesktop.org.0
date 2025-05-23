Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D26AC1AEA
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 06:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81A410E1CE;
	Fri, 23 May 2025 04:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fdeJuhA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09F910E1C9;
 Fri, 23 May 2025 04:21:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGFAde016644;
 Fri, 23 May 2025 04:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IauCdNUbFTJc8v7kRKz4VkznfBabcu8n5DA9zQwh5jc=; b=fdeJuhA9R6/GwzDB
 difn2tOyhDe+6g/VvPgMKnzIwSOPZZ8nA1ShvDf1Z6uJGV5yeq1WqeTRc2Q27nCH
 gAqr2XHoGEnW23AeV6WFxH4EwuiZRLjHXUFzjIrA9zyQSSJjHuuUD4zIxZgmZ1Is
 hgB71XIhK4hycQ1oJOaLyZ2Yb09OKfGXa+h/KngOBJBhTt2Ewj0qC9nuJT+OvofL
 UoYZ8v4uD9YN0vTpYLn7v08c6wHBBCEfH4CICenh3RFj69L5RgQuSadMu5ilZyPd
 +FzRzdUVqqLfFVoyf8qj7ZEyCbbFN62UEDvUC+mIoY+ERUW6sm01rvzHFG11cjIJ
 Uvta4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa0hxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 04:21:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N4L1NM008181
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 04:21:01 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 21:21:00 -0700
Message-ID: <293d4298-7eb7-4e49-9334-f6024199ca7b@quicinc.com>
Date: Thu, 22 May 2025 21:21:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in
 msm_dp_bridge_atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, "Stephen Boyd" <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, "Johan Hovold" <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
 <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
 <ldcydwcuwkwwng4d3b47pjz3ndhuhwerz6t3drwmifdzh7g3nl@3y6es72w74d7>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ldcydwcuwkwwng4d3b47pjz3ndhuhwerz6t3drwmifdzh7g3nl@3y6es72w74d7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682ff7ae cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=11gi3WOw1yIBWezIQNUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8RclrfvDXoSJL3krLhWXTLVLNiAmgw0v
X-Proofpoint-GUID: 8RclrfvDXoSJL3krLhWXTLVLNiAmgw0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDAzNiBTYWx0ZWRfXyWYVY9zyLrcZ
 F91BO2s8TUrh+s1HWTHsVTsjYF8Adnn2GaMaCK0MppcE5AsR+CopggM2Eom4OrGoX1tiMLC3xuu
 DeIYJj/1VlblOIpCLmfiU40K2voQEOrhLdQ43tdhPZawoQSI31K9xPE2L+eGLBbpvsYAnYXj08a
 p51mghdtfvMR7K61uWcNspEgbyD4b8tIBbWIUYo7XlJJEBepwt1lpWi1gp2MTGLbXebrIgQBBbf
 6jaZQI90BC9w5O6aOXLTEcqowXjcXgINqJYx5upgRrjExsOoCU/S0+QQ05niDwkJFtvwKWYxk9g
 pXIYgb5lUksFcynnQkFCvHZz++3jRvyJagykFC3r43vFWyA9S3UqGKzhgmcgomtohzx33e3n6ff
 b89Kc1ef98wZiICRw0vawYMvqNr+KXWCOw2NptmMCUcMO+Y12zSfhop1uRG8E0Q/JKTATGUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230036
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



On 12/23/2024 10:32 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 12:32:55PM +0200, Dmitry Baryshkov wrote:
>> On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
>>>
>>>
>>> On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
>>>>> The checks in msm_dp_display_prepare() for making sure that we are in
>>>>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>>>>>
>>>>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
>>>>> msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
>>>>
>>>> Can the state change between atomic_check() and atomic_commit()?
>>>>
>>>
>>> Good question.
>>>
>>> I cannot deny that such a possibility does exist.
>>>
>>>  From what I can see in the state machine today, the only possibility I can
>>> think of here is if a user very quickly removes the cable as soon as they
>>> connect the cable like so fast that the connect was not yet processed before
>>> disconnect.
>>
>> If the cable has electrical issues, it is possible even w/o user
>> intervention.
> 
> And the possible desynchronisation between DRM atomic states and HPD
> state machine brings back the topic: can we get rid of the state
> machine instead of trying to fix it? I'd rather see a patchset that
> removes it completely. The link training should go to the atomic_enable,
> etc, etc. Please? Pretty please? I'd rather see imperfect solution which
> has possible issues with some of the dongles (as they can be fixed later
> on) than having the imperfect HPD state machine which is known to break
> DRM framework expectations.
> 

Sorry for the delayed response.

The activity to move the link training to atomic_enable and to get rid 
of the state machine has started.

But, it is being done on top of this change only because this series 
actually gets rid of some states.

I will address the remaining comment on this and repost the next 
revision. I would suggest that if the state machine removal happens 
smooth, we can squash this series that with that one and post it 
together again and merge them together.

But if it takes longer than expected,  I think we should be open to 
merging this one and MST (with the comments addressed ofcourse) and the 
state machine removal goes on top.

Either way, this series is only helping the cause of getting rid of some 
of the states.

Thanks

Abhinav
>>
>>>
>>> Similarly, if an irq_hpd fires after atomic_check but before
>>> atomic_enable(), and moreover if we hit the sink_count == 0 case in
>>> msm_dp_display_handle_port_status_changed() during this irq_hpd,
>>>
>>> In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
>>>
>>> Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
>>> case.
>>>
>>> But other than this, I cannot atleast think of a case where a different
>>> state transition can happen between atomic_check() and atomic_commit()
>>> because for other transitions, I think we should be still okay.
>>>
>>> But this is purely based on theoretical observation and hypothesis.
>>>
>>> Is it better to add a check to bail out in the DISCONNECT_PENDING case?
>>
>> I think so, please.
>>
>>>
>>> OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
>>> even if I add this check, I dont know if can make sure this can be validated
>>> as the check could never hit.
>>>
>>>
>>>>>
>>>>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
>>>>> there is an atomic_enable() without a prior atomic_disable() which once again
>>>>> should not really happen.
>>>>>
>>>>> To simplify the code, get rid of these checks.
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>>>>>    1 file changed, 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> index 992184cc17e4..614fff09e5f2 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>> @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>>>>    		return;
>>>>>    	}
>>>>> -	state = msm_dp_display->hpd_state;
>>>>> -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>>>>> -		mutex_unlock(&msm_dp_display->event_mutex);
>>>>> -		return;
>>>>> -	}
>>>>> -
>>>>>    	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>>>>>    	if (rc) {
>>>>>    		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>>>>
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>
>> -- 
>> With best wishes
>> Dmitry
> 

