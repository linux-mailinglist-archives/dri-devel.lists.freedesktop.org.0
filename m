Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603252A770
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 17:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6411F10EF0D;
	Tue, 17 May 2022 15:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA2810ECB5;
 Tue, 17 May 2022 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652802961; x=1684338961;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iFNC9pJMxKmwTNanwEvj72sYQG04wOKPy2LjfMmbxhE=;
 b=EvjzUniyvnV8yRX/rMqx0IiTRCIqMES+MFatEZEfsXYZbulDoDjY8fi7
 GDEwvNP6zSgPzUfsR8VpvHgA6lEyaWYahKSt2+6EXQ76cwGrCWzn9DiLD
 h0QkDMIB+vQWE3we4suMxq3lIdWicolmyX8WS7POyLtnyEf1VYxXRQKYp k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 17 May 2022 08:56:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 08:55:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 17 May 2022 08:55:40 -0700
Received: from [10.110.42.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 17 May
 2022 08:55:39 -0700
Message-ID: <55093da8-1354-957f-70f1-9db56e0665fc@quicinc.com>
Date: Tue, 17 May 2022 08:55:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n5277_-=ZYprmF6JcVfrnG0aZVXqXq092VS=mkDtrOB_wg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n5277_-=ZYprmF6JcVfrnG0aZVXqXq092VS=mkDtrOB_wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


On 5/17/2022 1:25 AM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-05-12 12:43:18)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index af7a80c..f3e333e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>>
>>          dp_catalog_ctrl_reset(ctrl->catalog);
>>
>> -       if (enable)
>> -               dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>> +       /*
>> +        * all dp controller programmable registers will not
>> +        * be reset to default value after DP_SW_RESET
>> +        * therefore interrupt mask bits have to be updated
>> +        * to enable/disable interrupts
>> +        */
>> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> I think Dmitry requested that this part be split off to a different
> patch. It's fixing the call to dp_ctrl_reset_irq_ctrl() for the disable
> case.
ok, will do that
>>   }
>>
>>   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c388323..ab691aa 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -98,6 +98,8 @@ struct dp_display_private {
>>          struct dp_ctrl    *ctrl;
>>          struct dp_debug   *debug;
>>
>> +       bool suspended;
>> +
> Can we not have this flag? I also don't understand how this patch waits
> for the event queue to drain. There are now multiple places we check to
> see if we've suspended, but is it even possible to be in those places
> during suspend? What is wrong with moving to an irq thread? Is it
> because we want to wait for a modeset (EV_USER_NOTIFICATION)?

dp_pm_suspend happen after display off. therefore event q should be 
emptied when dp_pm_suspend called.

since dp_pm_suspend and event_thread share an mutex, if suspended flag 
set at dp_pm_suspend which guarantee

event thread will not be wakeed up to process since event q is empty.

We used event q is to guarantee all events (irqs) are kept in event q 
with timing order (no any events missed) and executed later in timing 
order too to work the scenario likes dongle plug/unplugged several times 
consecutively.

We used to workqueue but cause many synchronization issues.

I will try thread_irq to see it will yield any advantage over kernel thread.

>>          struct dp_usbpd_cb usbpd_cb;
>>          struct dp_display_mode dp_mode;
>>          struct msm_dp dp_display;
