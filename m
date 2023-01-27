Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FF067F16A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE23610E1CA;
	Fri, 27 Jan 2023 22:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8C610E1CA;
 Fri, 27 Jan 2023 22:52:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RMN3GK011656; Fri, 27 Jan 2023 22:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DivZZRpJunTMmulEfjiquRfkZvbdxXEDfzzZMsYGUPI=;
 b=ed2zVvE97vTibuORzrk/P1aBNaljp/7udVAu2W1FGOqmMgyD87Pt5OvXHZM2damoPPI6
 aAHHRHQ/yYdtPvifITu50OdUSu44PpR+fEbx+Y626jgxIX7sCvHgRXWSCCMFsKxPXJwa
 mXGiwirFRT7s0lGoK8t2HBGj902L7xihFhzY+jey/oa6HGNj2fTNVAQYRnD5nGoV/iNi
 k6ralBEdvC4f1K1v4KPMz0jOGelT6KshJbTfRoqemuoYu8SEgUo+SKp0hRrcFatXs3jv
 kPOy3VIb7bBZGluVSTaaWXb8W5GlD2/klwHkc5in63TVgNMnn4bsgwp5cVRyhiWL7F89 rg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncacmhftf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 22:51:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30RMpmYJ004884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 22:51:48 GMT
Received: from [10.110.19.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 14:51:47 -0800
Message-ID: <1af170ec-9fa4-d0c6-5736-6a9336ceab17@quicinc.com>
Date: Fri, 27 Jan 2023 14:51:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFT PATCH 2/2] drm/msm/dsi: Stop unconditionally
 powering up DSI hosts at modeset
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230113155547.RFT.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
 <31a0b303-64a4-8ac4-383d-6656f05a541b@quicinc.com>
 <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=XCq8urY2vEjLwJ_nYkntaz=dZhxLTnZGvY+xcQrJo9OQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PLhVNU-Jky1oyLLY7RHGKgyTJY-_Px_W
X-Proofpoint-ORIG-GUID: PLhVNU-Jky1oyLLY7RHGKgyTJY-_Px_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_14,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301270210
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/27/2023 2:33 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 27, 2023 at 10:54 AM Abhinav Kumar
> <quic_abhinavk@quicinc.com> wrote:
>>
>> On 1/13/2023 3:56 PM, Douglas Anderson wrote:
>>> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>>> time"), we moved powering up DSI hosts to modeset time. This wasn't
>>> because it was an elegant design, but there were no better options.
>>>
>>> That commit actually ended up breaking ps8640, and thus was born
>>> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
>>> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
>>> the old way of doing things. It turns out that ps8640 _really_ doesn't
>>> like its pre_enable() function to be called after
>>> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
>>> because I have any inside knowledge), it looks like the assertion of
>>> "RST#" in the ps8640 runtime resume handler seems like it's not
>>> allowed to happen after dsi_mgr_bridge_power_on()
>>>
>>> Recently, Dave Stevenson's series landed allowing bridges some control
>>> over pre_enable ordering. The meaty commit for our purposes is commit
>>> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
>>> bridge init order"). As documented by that series, if a bridge doesn't
>>> set "pre_enable_prev_first" then we should use the old ordering.
>>>
>>> Now that we have the commit ("drm/bridge: tc358762: Set
>>> pre_enable_prev_first") we can go back to the old ordering, which also
>>> allows us to remove the ps8640 special case.
>>>
>>> One last note is that even without reverting commit 7d8e9a90509f
>>> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
>>> revert the ps8640 special case and try it out then it doesn't seem to
>>> fail anymore. I spent time bisecting / debugging this and it turns out
>>> to be mostly luck, so we still want this patch to make sure it's
>>> solid. Specifically the reason it sorta works these days is because
>>> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
>>> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
>>> implemented means that we actually power the bridge chip up just a wee
>>> bit earlier and then the bridge happens to stay on because of
>>> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
>>>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>
>> Why is the patch title showing 2/2? I am not seeing any 1/2 here.
> 
> Is it a problem with your mail filters? You can see it at:
> 
> https://lore.kernel.org/r/20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid/
> 
> You are listed on the "To:" line. ;-)

Ah, I see what happened. The first patch did not have freedreno CCed but 
the second one did.

So freedreno PW got confused thinking , hey where is the first patch? :)

https://patchwork.freedesktop.org/series/112824/

And so did I :)

Perhaps freedreno should be CCed on both patches because its a series.

> 
> 
>>> @@ -349,7 +297,16 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>    host1_en_fail:
>>>        msm_dsi_host_disable(host);
>>>    host_en_fail:
>>> -
>>> +     msm_dsi_host_disable_irq(host);
>>> +     if (is_bonded_dsi && msm_dsi1) {
>>> +             msm_dsi_host_disable_irq(msm_dsi1->host);
>>> +             msm_dsi_host_power_off(msm_dsi1->host);
>>> +     }
>>
>> In addition to Dmitry's comment of keeping the bridge_power_on() name,
>>
>> this part of the change seems independent of the patch. This was missing
>> cleanup for DSI1 (esp the disable_irq part).
>>
>> So can we break it up into two parts.
>>
>> 1) Add missing cleanup for DSI1
>> 2) Just get rid of dsi_mgr_power_on_early() and keep the call
>> dsi_mgr_bridge_power_on() in dsi_mgr_bridge_pre_enable() unconditionally.
> 
> I didn't intentionally fix any bug in my patch--I just reverted it all
> back to how it was before. ;-)
> 
No sure what I am missing here but I certainly dont see 
msm_dsi_host_disable_irq() being part of any error handling labels which 
made me think you fixed that.

> So looking more closely, it looks like overall the current code (AKA
> what's landed today and without ${SUBJECT} patch) doesn't really
> handle errors with dsi_mgr_bridge_power_on() very well. The normal
> case of calling dsi_mgr_bridge_power_on() from modeset is totally
> ignored because modeset returns no error. Then the special workaround
> for ps8640 just followed the same pattern and assumed that
> dsi_mgr_bridge_power_on() succeeded. It also assumed that if the rest
> of dsi_mgr_bridge_pre_enable() failed that it didn't need to undo
> dsi_mgr_bridge_power_on() because it wouldn't have undone it in the
> modeset case.
> 

Yes thats right.

> While the current code isn't the best, it's not like the pre_enable()
> call could have returned errors anyway. It probably wasn't truly the
> end of the world to behave the way it did.
> 
> With all that, I guess my plan would be to do as Dmitry says and just
> always call dsi_mgr_bridge_power_on() from
> dsi_mgr_bridge_pre_enable(). In the first patch I'll just do that and
> remove the ps8640 workaround. Then I can add a 2nd patch that improves
> the error handling by having dsi_mgr_bridge_power_on() return an error
> code and then adding a matching dsi_mgr_bridge_power_off() that will
> undo it and include the extra cleanup.
> 

Sounds good to me.

> -Doug
