Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8548E020
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 23:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397EB10E60E;
	Thu, 13 Jan 2022 22:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3F10E60D;
 Thu, 13 Jan 2022 22:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642112070; x=1673648070;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2ZmCZ7gnTUyyBLTgMGy2tv8wRSeuoCkY3MNqGcsBJAc=;
 b=NJDX4HFCxogJUh5ylciUpEj4pi1+n8OBjBiHyR7G2XPY9PTdKDjMpoWn
 C0MUQ2syjxYUMde1VOgDTvAOFzFfaOEs9LoREp3t6TT/9mszXU+CHUKm9
 q2UPjAhpbDpF+kiNnEutUSLB+7x1lX3l7qLozrLhbiNwqrkL2Bhvquecs 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jan 2022 14:14:30 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 14:14:29 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 14:14:29 -0800
Received: from [10.110.125.36] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 13 Jan
 2022 14:14:28 -0800
Message-ID: <c190bd82-b6d3-b6a9-3e58-32c8d9d417c1@quicinc.com>
Date: Thu, 13 Jan 2022 14:14:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com>
 <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
 <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com>
 <CAE-0n51QbJHnOses5sF6xECR0gRZB1Fbi1KqoLG+61ZWH9BtOA@mail.gmail.com>
 <64ad7053-beac-0c28-7d09-ea32a4f7fbad@quicinc.com>
 <CAE-0n53qxer=shY3LdxzDPFaQb1L65okX9TM0TXYCdD59qau5g@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n53qxer=shY3LdxzDPFaQb1L65okX9TM0TXYCdD59qau5g@mail.gmail.com>
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/2022 1:52 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-01-13 12:44:16)
>> On 1/13/2022 11:47 AM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-01-13 09:51:42)
>>>> On 1/12/2022 8:13 PM, Stephen Boyd wrote:
>>>>>>>> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
>>>>>>>> -               flip = true;
>>>>>>>> +       dp_power_init(dp->power, false);
>>>>>>>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>>>>>> +
>>>>>>>> +       /*
>>>>>>>> +        * eDP is the embedded primary display and has its own phy
>>>>>>>> +        * initialize phy immediately
>>>>>>> Question still stands why we can't wait for hpd high from the eDP panel.
>>>>>>> Also, I think "has its own phy" means that it's not part of a combo
>>>>>>> USB+DP phy? Can you please clarify?
>> Correct, eDP has its dedicated phy which is not part of combo phy.
> Why does that mean we can't wait for hpd high from the eDP panel?

Sorry, missed this one.

Yes, it can wait for hpd high.

Since it always presented, I just think it is better to show display 
sooner not later until hdp high.

you like it to wait until hpd high?

>>>>>>>> +        */
>>>>>>>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
>>>>>>>> +               dp_display_host_phy_init(dp);
>>>>>>>>
>>>>>>>> -       dp_power_init(dp->power, flip);
>>>>>>>> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>>>>>>>>             dp_aux_init(dp->aux);
>>>>>>>>             dp->core_initialized = true;
>>>>>>>>      }
>>>>>>>> @@ -1306,20 +1330,23 @@ static int dp_pm_resume(struct device *dev)
>>>>>>>>             dp->hpd_state = ST_DISCONNECTED;
>>>>>>>>
>>>>>>>>             /* turn on dp ctrl/phy */
>>>>>>>> -       dp_display_host_init(dp, true);
>>>>>>>> +       dp_display_host_init(dp);
>>>>>>>>
>>>>>>>>             dp_catalog_ctrl_hpd_config(dp->catalog);
>>>>>>>>
>>>>>>>> -       /*
>>>>>>>> -        * set sink to normal operation mode -- D0
>>>>>>>> -        * before dpcd read
>>>>>>>> -        */
>>>>>>>> -       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>>>>>>
>>>>>>>>             if (dp_catalog_link_is_connected(dp->catalog)) {
>>>>>>>> +               /*
>>>>>>>> +                * set sink to normal operation mode -- D0
>>>>>>>> +                * before dpcd read
>>>>>>>> +                */
>>>>>>>> +               dp_display_host_phy_init(dp);
>>>>>>>> +               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>>>>>>                     sink_count = drm_dp_read_sink_count(dp->aux);
>>>>>>>>                     if (sink_count < 0)
>>>>>>>>                             sink_count = 0;
>>>>>>>> +
>>>>>>>> +               dp_display_host_phy_exit(dp);
>>>>>>> Why is the phy exited on resume when the link is still connected? Is
>>>>>>> this supposed to be done only when the sink_count is 0? And how does
>>>>>>> this interact with eDP where the phy is initialized by the call to
>>>>>>> dp_display_host_init() earlier in this function.
>> At beginning of dp_pm_resume bot core_initialized and phy_initialized
>> should be off.
>>
>> However at the case of dongle still connected to DUT, we have to read
>> dongle dpcd to decided any hdmi connect to dongle (sink_count != 0). in
>> this case, we have to turn on phy to perform dpcd read and  turn off phy
>> after read so the following plugged-in interrupt can be handled correctly.
>>
> That looks like a lot of wasted work. Why can't we turn on the core,
> turn on the phy, check if it's connected, and then turn off the phy if
> it isn't? At the least, please put a comment above this phy_exit() call
> indicating that we'll turn the phy back on while processing a plugged in
> interrupt.
