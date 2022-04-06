Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B424F6C73
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF410E036;
	Wed,  6 Apr 2022 21:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B17710E036;
 Wed,  6 Apr 2022 21:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649279971; x=1680815971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O4axOIQp0ZaB/KJu1/zFF3/16KbTtDOrEVUBXwk9oaY=;
 b=T0AuC1F4ZTZiiS+f6i3br0KlHLtDOkB3aGrcfn4BGliubo86p/yyNsQq
 2o4K4/3dVwt+5+HPjaHvwAnbNB0YmjB0l6vX8JicNFYTWxenzjRZQAuxm
 CSx2LdnoPESrrWZQyp9uQ9hQfLafHBSlMTrbGT+nEYY/C8EdTEoDcGE8G o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2022 14:19:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 14:19:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 14:19:31 -0700
Received: from [10.110.122.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 14:19:29 -0700
Message-ID: <d7219276-186c-1c00-a41f-0b87d6318dd6@quicinc.com>
Date: Wed, 6 Apr 2022 14:19:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1649182627-8068-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50OYgSfhMcw2N_dd8LzxBXxoGhb0ToASsHGY=VPDa0zVg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50OYgSfhMcw2N_dd8LzxBXxoGhb0ToASsHGY=VPDa0zVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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


On 4/5/2022 12:48 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-05 11:17:07)
>> HPD plugin handle is responsible for setting up main link and depend on
> Is "HPD plugin handle" a function? Can you use the function name?
>
>> user space frame work to start video stream. Similarly, HPD unplugged
>> handle is responsible for tearing down main link and depend on user space
>> frame work to stop video stream. Connect_pending_timeout and disconnect_
> Is 'Connect_pending_timeout' actually 'dp_connect_pending_timeout()'? If
> so, it would be clearer if the function name is used.
>
>> pending_timeout are fired after 5 seconds timer expired to tear down main
>> link and video stream and restore DP driver state into known default
>> DISCONNECTED state in the case of frame work does not response uevent
> s/frame work/framework/
> s/response/respond to/
>
>> original from DP driver so that DP driver can recover gracefully.
> This part of the sentence doesn't make sense to me.
>
>> The original connect_pending_timeout and disconnect_pending_timeout were
>> not implemented correctly. This patch enhance both timeout functions to
> s/enhance/fixes/
>
>> tear down main link and video stream correctly once timer is fired.
>>
>> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>>
> Nitpick: Drop newline.
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 ++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
>>   3 files changed, 68 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index dcd0126..3f4cf6d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1910,7 +1910,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>          return ret;
>>   }
>>
>> -int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>> +int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl)
>>   {
>>          struct dp_ctrl_private *ctrl;
>>          struct dp_io *dp_io;
>> @@ -1926,7 +1926,37 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>
>>          dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>>
>> -       dp_catalog_ctrl_reset(ctrl->catalog);
>> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
>> +       if (ret) {
>> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>> +       }
>> +
>> +       DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> Please don't recast pointer prints with %x. Use %p to print pointers.
>
>> +
>> +       phy_power_off(phy);
>> +
>> +       DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +               (u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> It doesn't look good to be peeking inside struct phy. I wonder why that
> isn't an opaque struct. Either way, please don't print the struct
> members.

both init_count and power_count are very important to debug "clock stuck 
at off" issues.

Can we keep them here?

>> +
>> +       return ret;
>> +}
>> +
>> +int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>> +{
>> +       struct dp_ctrl_private *ctrl;
>> +       struct dp_io *dp_io;
>> +       struct phy *phy;
>> +       int ret = 0;
> Drop useless assignment please
>
>> +
>> +       if (!dp_ctrl)
> How is this possible? Please remove useless checks.
>
>> +               return -EINVAL;
>> +
>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +       dp_io = &ctrl->parser->io;
>> +       phy = dp_io->phy;
>> +
>> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>>
>>          ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
>>          if (ret)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 178b774..56bf7c5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -593,10 +593,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>>
>>          mutex_lock(&dp->event_mutex);
>>
>> +       /*
>> +        * main link had been setup but video is not ready yet
>> +        * only tear down main link
>> +        */
>>          state = dp->hpd_state;
>>          if (state == ST_CONNECT_PENDING) {
>> -               dp->hpd_state = ST_CONNECTED;
>>                  DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
>> +               dp_ctrl_off_link(dp->ctrl);
>> +               dp_display_host_phy_exit(dp);
>> +               dp->hpd_state = ST_DISCONNECTED;
>>          }
>>
>>          mutex_unlock(&dp->event_mutex);
>> @@ -645,6 +651,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>                  if (dp->link->sink_count == 0) {
>>                          dp_display_host_phy_exit(dp);
>>                  }
>> +               dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
> The name of this function is very confusing. It would be nice to rename
> it to something like dp_display_notify_disconnect() and skip
>
>>                  mutex_unlock(&dp->event_mutex);
>>                  return 0;
>>          }
>> @@ -661,19 +668,19 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>                  return 0;
>>          }
>>
>> -       dp->hpd_state = ST_DISCONNECT_PENDING;
>> -
>>          /* disable HPD plug interrupts */
>>          dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
>>
>> -       /*
>> -        * We don't need separate work for disconnect as
>> -        * connect/attention interrupts are disabled
>> -        */
> Why is this comment removed? Because a work is actually used? Why can't
> we call dp_display_send_hpd_notification() directly?
There may have circular locking issue since we have hold event_mutex 
already.
>
>>          dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
>>
>> -       /* start sentinel checking in case of missing uevent */
>> -       dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>> +       if (state == ST_DISPLAY_OFF) {
>> +               dp->hpd_state = ST_DISCONNECTED;
>> +
> Drop extra newline please
>
>> +       } else {
>> +               /* start sentinel checking in case of missing uevent */
>> +               dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
>> +               dp->hpd_state = ST_DISCONNECT_PENDING;
> It looks like dp_add_event() should check the event and change
> dp->hpd_state sometimes. Then this code would be simply adding an event
> and dp_add_event() would be changing the hpd_state while scheduling the
> work.

this will increase dp_add_event() burdens a lots since it has to looking 
into each event.

Also not every hpd_state change go through dp_add_event.

>
>> +       }
>>
>>          /* signal the disconnect event early to ensure proper teardown */
>>          dp_display_handle_plugged_change(&dp->dp_display, false);
>> @@ -695,10 +702,16 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>>
>>          mutex_lock(&dp->event_mutex);
>>
>> +       /*
>> +        * main link had been set up and video is ready
>> +        * tear down main link, video stream and phy
> because disconnect event never came and we need to get back to a default
> sane state?
yes, the default state is DISCONNECTED, therefore we better stop video 
and  tear down main link.
>
>> +        */
>>          state =  dp->hpd_state;
>>          if (state == ST_DISCONNECT_PENDING) {
>> -               dp->hpd_state = ST_DISCONNECTED;
>>                  DRM_DEBUG_DP("type=%d\n", dp->dp_display.connector_type);
>> +               dp_ctrl_off(dp->ctrl);
>> +               dp_display_host_phy_exit(dp);
>> +               dp->hpd_state = ST_DISCONNECTED;
>>          }
>>
>>          mutex_unlock(&dp->event_mutex);
>> @@ -1571,6 +1584,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>
>>          mutex_lock(&dp_display->event_mutex);
>>
>> +       state =  dp_display->hpd_state;
> s/=  /= /
>
> Drop extra space after '=' please.
>
>> +       if (state == ST_DISCONNECTED) {
>> +               mutex_unlock(&dp_display->event_mutex);
>> +               return rc;
>> +       }
>> +
>>          /* stop sentinel checking */
>>          dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>>
>> @@ -1588,8 +1607,6 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>                  return rc;
>>          }
>>
>> -       state =  dp_display->hpd_state;
>> -
>>          if (state == ST_DISPLAY_OFF)
>>                  dp_display_host_phy_init(dp_display);
>>
>> @@ -1638,13 +1655,18 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>>          /* stop sentinel checking */
>>          dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>>
>> +       state =  dp_display->hpd_state;
> s/=  /= /
>
> Drop extra space after '=' please.
>
>> +       if (state == ST_DISCONNECTED || state == ST_DISPLAY_OFF) {
>> +               mutex_unlock(&dp_display->event_mutex);
>> +               return rc;
>> +       }
>> +
>>          dp_display_disable(dp_display, 0);
>>
>>          rc = dp_display_unprepare(dp);
>>          if (rc)
>>                  DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>>
>> -       state =  dp_display->hpd_state;
>>          if (state == ST_DISCONNECT_PENDING) {
>>                  /* completed disconnection */
>>                  dp_display->hpd_state = ST_DISCONNECTED;
