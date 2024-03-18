Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CFF87EF68
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 19:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392F310F800;
	Mon, 18 Mar 2024 18:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UAeDBALZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125FD10F664;
 Mon, 18 Mar 2024 18:01:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42IHfZd0026628; Mon, 18 Mar 2024 18:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=qSI1sdsTiph9RZvhdAC7pZQBrBCG43U53azau8lu5Ps=; b=UA
 eDBALZDDXSnCXfylWfq538S09qPcKLf0NsHE2q3v9j/fntIlZt5qhALsmBLQ2iic
 OhrA/LKIXbgZJwvZUYJ81HbjaJgC6F6BPlrGsISzG4ogsKrzWPMswRyuUMKU3inM
 H6kAEiWOU0DuSLJ36NKdP3w7d/xWgYHdMHNCPLal2UDJqLCDPyXCH7T0kG29ijc3
 RRyQ3QGa1tphUlhkMgcEZGGnL5G5PicdYFQn/hRYVDARqXjPOA2svvV2hf/IVZRu
 Fq0qC7sUG+fJBpUB0vgmw9vortSeimuB6PPMIYhI5+T43M4du+dLDU1pU73DYu/m
 4oMw1vSfT81m5RJiEJhg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxq7p0ksf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2024 18:01:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42II1WAe018878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2024 18:01:32 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 11:01:27 -0700
Message-ID: <a1152afe-b652-d83e-05e4-25c07292b568@quicinc.com>
Date: Mon, 18 Mar 2024 11:01:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, "Marijn Suijten" <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>,
 <quic_bjorande@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
 <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
 <ZfCFsmNv62-KMkA6@hovoldconsulting.com>
 <ZfCKDGq9n9WG3Quj@hovoldconsulting.com>
 <8e125a99-543d-8328-a2a9-100e223e4faf@quicinc.com>
 <ZfFhXG5yd6O29spS@hovoldconsulting.com>
 <ec2cba17-5644-6cf6-f6c9-d37d7ca56204@quicinc.com>
 <ZfMaEIzv3Z3ny3y0@hovoldconsulting.com>
 <9313aa00-41f0-15af-a646-3f4e4b3098c7@quicinc.com>
 <ZfRv5le7Bfdiwrk_@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZfRv5le7Bfdiwrk_@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pqxdgPBrULBwzC0zfLcxtmEBjfajNgtU
X-Proofpoint-ORIG-GUID: pqxdgPBrULBwzC0zfLcxtmEBjfajNgtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180136
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



On 3/15/2024 8:57 AM, Johan Hovold wrote:
> On Thu, Mar 14, 2024 at 09:30:57AM -0700, Abhinav Kumar wrote:
>> On 3/14/2024 8:38 AM, Johan Hovold wrote:
>>> On Wed, Mar 13, 2024 at 10:24:08AM -0700, Abhinav Kumar wrote:
> 
>>> Perhaps I'm missing something in the race that you are trying to
>>> describe (and which I've asked you to describe in more detail so that I
>>> don't have to spend more time trying to come up with a reproducer
>>> myself).
> 
>> The race condition is between the time we get disconnect event and set
>> link_ready to false, a commit can come in. Because setting link_ready to
>> false happens in the event thread so it could be slightly delayed.
> 
> I get this part, just not why, or rather when, that becomes a problem.
> 
> Once the disconnect event is processed, dp_hpd_unplug_handle() will
> update the state to ST_DISCONNECT_PENDING, and queue a notification
> event. link_ready is (before this patch) still set to 1.
> 

This is the case I am thinking of:

1) Disconnect event happens which will call dp_hpd_unplug_handle() but 
link_ready is not false yet.

2) There is a commit with a modeset, which shall trigger 
atomic_disable() followed by an atomic_enable()

atomic_disable() will go through disable clocks and set hpd_state to 
ST_DISCONNECTED.

3) atomic_enable() will not go through because we will bail out because 
state was ST_DISCONNECTED.

         if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
                 mutex_unlock(&dp_display->event_mutex);
                 return;
         }

4) Now, if there is another commit with a modeset, it will go and crash 
at atomic_disable()

> Here a commit comes in; what exactly are you suggesting would trigger
> that? And in such a way that it breaks the state machine?
> 

Like we have seen, the commit can either come directly from userspace as 
one last frame (the original bug I had given the link to) or from the 
__drm_fb_helper_restore_fbdev_mode_unlocked() which happened in 
sc8280xp's case. This is totally independent of the hpd_thread() with no 
mutual exclusion.

This commit() can come before the link_ready was set to false. If it had 
come after link_ready was set to false, atomic_check() would have failed 
and no issue would have been seen.

My change is making the link_ready false sooner in the disconnect case.

> One way this could cause trouble is if you end up with a call to
> dp_bridge_atomic_post_disable() which updates the state to
> ST_DISCONNECTED. (1)
> 
> This would then need to be followed by another call to
> dp_bridge_atomic_enable() which bails out early with the link clock
> disabled. (2) (And if link_ready were to be set to 0 sooner, the
> likelihood of this is reduced.)
> 
> This in turn, would trigger a reset when dp_bridge_atomic_disable() is
> later called.
> 

Yes, this is exactly what I have written above.

> This is the kind of description of the race I expect to see in the
> commit message, and I'm still not sure what would trigger the call to
> dp_bridge_atomic_post_disable() and dp_bridge_atomic_enable() (i.e. (1)
> and (2) above) and whether this is a real issue or not.
> 

I have explained what triggers the disable/enable call below.

> Also note that the above scenario is quite different from the one I've
> hit and described earlier.
> 

Why is that so? Eventually it will also translate to the same scenario. 
I would like to understand why this is different. I think in your case, 
probably we do not know what triggers the modeset, but its a minor 
detail like I have written before.

>> It will be hard to reproduce this. Only way I can think of is to delay
>> the EV_NOTIFICATION for sometime and see in dp_bridge_hpd_notify()
>>
>>           else if (dp_display->link_ready && status ==
>> connector_status_disconnected)
>>                   dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>>
>> as dp_add_event() will add the event, then wakeup the event_q.
> 
> Sure that would increase the race window with the current code, but that
> alone isn't enough to trigger the bug AFAICT.
> 
>> Before the event thread wakes up and processes this unplug event, the
>> commit can come in. This is the race condition i was thinking of.
> 
> Yes, but what triggers the commit? And why would it lead to a mode set
> that disables the bridge?
> 

Commit was triggered from the userspace as it did not process the 
disconnect event on time and the userspace was triggering a couple of 
modesets by by changing the mode on the CRTC from 1080P to NONE to 1080P.

[drm:drm_atomic_helper_check_modeset] [CRTC:60:crtc-1] mode changed

> Johan
