Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDA58F578
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 03:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2CF98C0B;
	Thu, 11 Aug 2022 01:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DC892D8E;
 Thu, 11 Aug 2022 01:00:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B0utgB027306;
 Thu, 11 Aug 2022 01:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=me/5r5qWiQcpA8mAhRZ3L9pdIUQMlr6KAhNDwGgZ1xY=;
 b=EPObgrd2Lv9hy3KFh+TxikxgKMuEX902Pmej9L9CzH299++FcIaJ+kHshvdsDoZPtigK
 RBmqpchlBZmTmbpwZXgvEMNIvd/13s0qADnaXZ4e7BReW6P1KJvvd5c6zpEgtJjebRA6
 uTi1QC2GlglM885RnnNyCF2AjvvTGVeDiw7l2C65saH6rtZMDUq4FZra6ucfehZ3t3Aa
 Xt3rt5af4HPFt92laYyxgwW6YbnkEVMJtSr/3qt35t7OTo+SAmjDwQnDAFMMkQGZCly3
 fKx+uqC6HzvmjD2Rdb0IJ7LUEwwlTcnKbPBIU3AKtJAJmYRC4V9vgCFcG3QZIvQp/Sjg ig== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr9meb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 01:00:29 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27B10R77025793
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 01:00:27 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 18:00:27 -0700
Received: from [10.111.167.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 10 Aug
 2022 18:00:23 -0700
Message-ID: <0641a116-5b58-4305-bf2d-f53dcb747276@quicinc.com>
Date: Wed, 10 Aug 2022 18:00:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern
 at dp_bridge_disable()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n533SUb3Bg=pR8Fhwo-M5qLWiti4nzLR-rSGVAsrXgEYNQ@mail.gmail.com>
 <dbda8bce-2890-e5e3-4052-073a52eb06a6@quicinc.com>
 <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51NyrP8CikcK_3wj4EEsurmmSZ4RY3pLhJJmkY2_8wNZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: F3p-M1QjwzsQ-wfincQmIzloy34SdwXZ
X-Proofpoint-GUID: F3p-M1QjwzsQ-wfincQmIzloy34SdwXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_16,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110001
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 8/10/2022 5:09 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-08-10 16:57:51)
>>
>> On 8/10/2022 3:22 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-08-10 12:25:51)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index b36f8b6..678289a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
>>>>           struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
>>>>           struct msm_dp *dp = dp_bridge->dp_display;
>>>>           struct dp_display_private *dp_display;
>>>> +       u32 state;
>>>>
>>>>           dp_display = container_of(dp, struct dp_display_private, dp_display);
>>>>
>>>> +       mutex_lock(&dp_display->event_mutex);
>>>> +
>>>> +       state = dp_display->hpd_state;
>>>> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
>>> It's concerning that we have to check this at all. Are we still
>>> interjecting into the disable path when the cable is disconnected?
>>
>> yes,
>>
>> The problem is not from cable disconnected.
>>
>> There is a corner case that this function is called at drm shutdown
>> (drm_release).
>>
>> At that time, mainlink is not enabled, hence dp_ctrl_push_idle() will
>> cause system crash.
> 
> The mainlink is only disabled when the cable is disconnected though?
> 
> Let me put it this way, if we have to check that the state is
> "connected" or "disconnected pending" in the disable path then there's
> an issue where this driver is being called in unexpected ways. This
> driver is fighting the drm core each time there's a state check. We
> really need to get rid of the state tracking entirely, and make sure
> that the drm core is calling into the driver at the right time, i.e.
> bridge disable is only called when the mainlink is enabled, etc.

So if link training failed, we do not send a uevent to usermode and will 
bail out here:

         rc = dp_ctrl_on_link(dp->ctrl);
         if (rc) {
                 DRM_ERROR("failed to complete DP link training\n");
                 goto end;
         }

So this commit is not coming from usermode but from the drm_release() path.

Even then, you do have a valid point. DRM framework should not have 
caused the disable path to happen without an enable.

I went through the stack mentioned in the issue.

Lets see this part of the stack:

dp_ctrl_push_idle+0x40/0x88
  dp_bridge_disable+0x24/0x30
  drm_atomic_bridge_chain_disable+0x90/0xbc
  drm_atomic_helper_commit_modeset_disables+0x198/0x444
  msm_atomic_commit_tail+0x1d0/0x374

In drm_atomic_helper_commit_modeset_disables(), we call disable_outputs().

AFAICT, this is the only place which has a protection to not call the 
disable() flow if it was not enabled here:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_helper.c#L1063

But that function is only checking crtc_state->active. Thats set by the 
usermode:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic_uapi.c#L407

Now, if usermode sets that to true and then crashed it can bypass this 
check and we will crash in the location kuogee is trying to fix.

 From the issue mentioned in 
https://gitlab.freedesktop.org/drm/msm/-/issues/17, the reporter did 
mention the usermode crashed.

So this is my tentative analysis of whats happening here.

Ideally yes, we should have been protected by the location mentioned 
above in disable_outputs() but looks to me due to the above hypothesis 
its getting bypassed.

Thanks

Abhinav



