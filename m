Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1750EC18
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 00:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F9510EEA3;
	Mon, 25 Apr 2022 22:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1310EEA3;
 Mon, 25 Apr 2022 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650925781; x=1682461781;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5Xh4n6qYzYGCgES5QzsoDE6tDwiLaiGMdlmL/LBrteY=;
 b=uIw/yiLU0irgRBFt2jpaDY1yDhFSI/DbKSGCj2QG6BZuexvQ83h70q3l
 0WPswGsaobE8vJ68/uAWysFuPxZbEu7y3sYdKSZsZTkrir/vDqSbWIr/s
 iWFtweNMnss6kIgaU+Ey8iWA/WZ0LxhHmm0S0reE006y2/xk7er+DNz6p I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Apr 2022 15:29:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:29:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Apr 2022 15:29:40 -0700
Received: from [10.110.33.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 25 Apr
 2022 15:29:39 -0700
Message-ID: <07f1e701-f921-b06a-7492-63810a937322@quicinc.com>
Date: Mon, 25 Apr 2022 15:29:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dp: tear down main link at unplug handle
 immediately
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1649970223-9522-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51rp73v6tod98TX3Y_q8TuOppJVdm9Te_9kSNyqyFuoog@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51rp73v6tod98TX3Y_q8TuOppJVdm9Te_9kSNyqyFuoog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2022 3:38 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-14 14:03:43)
>> Two stages are required to setup up main link to be ready to transmit
>> video stream.
>> Stage 1: dp_hpd_plug_handle() perform link training to set up main link
>> stage 2: user space framework (msm_dp_display_enable()) to enable pixel
>> clock and transfer main link to video ready state.
>>
>> At current implementation, when dongle unplugged dp_hdp_unplug_handle()
>> has to wait until stage 2 completed before it can send link down uevent
>> to user space framework to disable pixel clock followed by tearing down
>> main link.  This introduce unnecessary latency if dongle unplugged happen
>> after stage 1 and before stage 2. It also has possibility leave main link
>> stay at ready state after dongle unplugged if framework does not response
>> to link down uevent notification. This will prevent next dongle plug in
>> from working. This scenario could possibly happen when dongle unplug while
>> system in the middle of suspending.
>>
>> This patch allow unplug handle to tear down main link and notify
>> framework link down immediately if dongle unplugged happen after
>> stage 1 and before stage 2. With this approach, dp driver is much
>> more resilient to any different scenarios. Also redundant both
>> dp_connect_pending_timeout() and dp_disconnect_pending_timeout()
>> are removed to reduce logic complexity.
>>
>> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Some questions below but doesn't seem like it will hold up this patch.
>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 01453db..f5bd8f5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -615,24 +598,21 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>                  if (dp->link->sink_count == 0) {
>>                          dp_display_host_phy_exit(dp);
>>                  }
>> +               dp_display_notify_disconnect(&dp->pdev->dev);
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>> -       }
>> -
>> -       if (state == ST_DISCONNECT_PENDING) {
>> +       } else if (state == ST_DISCONNECT_PENDING) {
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>> -       }
>> -
>> -       if (state == ST_CONNECT_PENDING) {
>> -               /* wait until CONNECTED */
>> -               dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 1); /* delay = 1 */
>> +       } else if (state == ST_CONNECT_PENDING) {
> I take it that ST_CONNECT_PENDING is sort of like "userspace hasn't
> handled the uevent yet and modeset hasn't been called but the link is
> setup and now we want to tear it down". The state name may want to be
> changed to something else.
yes, how about change to  ST_MAINLINK_READY?
>
>> +               dp_ctrl_off_link(dp->ctrl);
>> +               dp_display_host_phy_exit(dp);
>> +               dp->hpd_state = ST_DISCONNECTED;
>> +               dp_display_notify_disconnect(&dp->pdev->dev);
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>>          }
>>
>> -       dp->hpd_state = ST_DISCONNECT_PENDING;
>> -
>>          /* disable HPD plug interrupts */
>>          dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>>
>> @@ -640,10 +620,13 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>           * We don't need separate work for disconnect as
>>           * connect/attention interrupts are disabled
>>           */
>> -       dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
>> +       dp_display_notify_disconnect(&dp->pdev->dev);
>>
>> -       /* start sentinel checking in case of missing uevent */
>> -       dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>> +       if (state == ST_DISPLAY_OFF) {
>> +               dp->hpd_state = ST_DISCONNECTED;
>> +       } else {
>> +               dp->hpd_state = ST_DISCONNECT_PENDING;
>> +       }
> Nitpick: No braces needed for single line if clauses.
>
>>          DRM_DEBUG_DP("hpd_state=%d\n", state);
>>          /* signal the disconnect event early to ensure proper teardown */
>> @@ -1529,8 +1480,11 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>
>>          mutex_lock(&dp_display->event_mutex);
>>
>> -       /* stop sentinel checking */
>> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>> +       state = dp_display->hpd_state;
>> +       if (state != ST_DISPLAY_OFF && state != ST_CONNECT_PENDING) {
> Is this to guard against userspace doing an atomic commit when the
> display isn't connected? Is that even possible?

No, it used to guard follow scenario in timing order,

1) plugin had been handled and mainlink is ready,

2)  userspace hasn't handled the uevent yet and modeset hasn't been called

3) unplugged happen, mainlink be teared down

4) user space start to response to uevent  and try to enable display. 
(it too late since mainlink had been teared down)


>> +               mutex_unlock(&dp_display->event_mutex);
>> +               return rc;
>> +       }
>>
>>          rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>>          if (rc) {
