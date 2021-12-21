Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7354747C620
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073EE10F7AA;
	Tue, 21 Dec 2021 18:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8203910F13B;
 Tue, 21 Dec 2021 18:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640110575; x=1671646575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=87wmM1aAjQ9JXZUAKdF+CTr0EM6APa+CfM0DbP+Bdgc=;
 b=QfufDVry2hfK0wnCoQ0sBb/nyKTaYRAHFAtsYIOzaPhCcPUgrb8msH3r
 IgoJKJAlwdreKzxrjcVpQX+01n9gbyqrNFBOwv6MAc/G8H4+cZ5+ePKtB
 ZO20SFjC8VnCvEax6B5CmbD9Ruv/f+ATcfB/ZvLQ2TRcCw1BiC6BAND9R Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 21 Dec 2021 10:16:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 10:16:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 21 Dec 2021 10:16:12 -0800
Received: from [10.110.121.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 21 Dec
 2021 10:16:11 -0800
Message-ID: <cb935a39-3b15-19fe-983c-dce326b2bf06@quicinc.com>
Date: Tue, 21 Dec 2021 10:16:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 2/2] drm/msm/dp: do not initialize phy until plugin
 interrupt received
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1639085707-27845-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51pbf3GqwA-wtTe5+rRvA_KMmb8kd6fqqDtZRX+X_3qiA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51pbf3GqwA-wtTe5+rRvA_KMmb8kd6fqqDtZRX+X_3qiA@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2021 5:50 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-12-09 13:35:07)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 0766752..cfbc5e4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -83,6 +83,7 @@ struct dp_display_private {
>>
>>          /* state variables */
>>          bool core_initialized;
>> +       bool phy_initialized;
>>          bool hpd_irq_on;
>>          bool audio_supported;
>>
>> @@ -371,21 +372,46 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>>          return rc;
>>   }
>>
>> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
>> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>>   {
>> -       bool flip = false;
>> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +                       dp->core_initialized, dp->phy_initialized);
>>
>> +       if (!dp->phy_initialized) {
> Is this check only here because we don't know when this function is
> getting called? I see in the DP case we get here from
> dp_display_usbpd_configure_cb() but in the eDP case we get here from
> dp_display_host_init() and presumably again from
> dp_display_usbpd_configure_cb() called by dp_hpd_plug_handle().
>
> If at all possible, I'd prefer to not have another tracking variable and
> call dp_display_host_phy_init() from the same place regardless of DP or
> eDP. Doing that would make it symmetric, per the commit text.

Agree, but  dp->phy_initialized variable used to track some other 
conditions.

For example, phy required to be re inited if dpcd read failed due to 
cable unplugged.

other dpcd read failed will not required to re inited.

Therefore I think dp->phy_initialized variable is still required.

>> +               dp_ctrl_phy_init(dp->ctrl);
>> +               dp->phy_initialized = true;
>> +       }
>> +}
>> +
>> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
>> +{
>> +       DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +                       dp->core_initialized, dp->phy_initialized);
>> +
>> +       if (dp->phy_initialized) {
>> +               dp_ctrl_phy_exit(dp->ctrl);
>> +               dp->phy_initialized = false;
>> +       }
>> +}
>> +
>> +static void dp_display_host_init(struct dp_display_private *dp)
>> +{
>>          DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
>>          if (dp->core_initialized) {
>>                  DRM_DEBUG_DP("DP core already initialized\n");
>>                  return;
>>          }
>>
>> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
>> -               flip = true;
>> +       dp_power_init(dp->power, false);
>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>> +
>> +       /*
>> +        * eDP is the embedded primary display and has its own phy
>> +        * initialize phy immediately
> Can we get some more details here? Why is it better to initialize the
> phy here vs. when HPD goes high on the panel? The comment says what the
> code is doing but it isn't telling us why that's OK.

Will do.

>
>> +        */
>> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
>> +               dp_display_host_phy_init(dp);
>>
>> -       dp_power_init(dp->power, flip);
>> -       dp_ctrl_host_init(dp->ctrl, flip, reset);
>>          dp_aux_init(dp->aux);
>>          dp->core_initialized = true;
>>   }
