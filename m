Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C15255BD
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 21:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739910E67D;
	Thu, 12 May 2022 19:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECAC10E18C;
 Thu, 12 May 2022 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652384011; x=1683920011;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aF38eStTDqNFqz4Gx3c+CKSDyxaee9RhF1zN1sw4C8Q=;
 b=H2lc3a7LssmEuvsZDhwV4imFstLT5hVLEihTLCoGvBtsOrRg0JBUGT2q
 XvZ6e+2BfAsxFiK4loTO2P9B7gJMT048s9y7lIDSyZTZrDbC214iU1Jls
 U+6JAA5w6NzyDjjnjWEkufcbYiOERI3jTIDdXdKZHK/Wz+fi2Kow3zepb E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 May 2022 12:33:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 12:33:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 12 May 2022 12:33:28 -0700
Received: from [10.110.33.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 12:33:27 -0700
Message-ID: <45b7c7fd-9e77-a0f8-022b-27e874f4b3f0@quicinc.com>
Date: Thu, 12 May 2022 12:33:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>
References: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com>
 <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
 <CAE-0n53zHrczQAOWM5f_tafUVJxg7JU2NuC4sGcBZddwKr-dGA@mail.gmail.com>
 <CAA8EJppc9d+FjVzAX_KU2-akTc1vSmSHMeKr8dp2ynH2LLOyBQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJppc9d+FjVzAX_KU2-akTc1vSmSHMeKr8dp2ynH2LLOyBQ@mail.gmail.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/11/2022 6:03 PM, Dmitry Baryshkov wrote:
> On Thu, 12 May 2022 at 04:01, Stephen Boyd <swboyd@chromium.org> wrote:
>> Quoting Dmitry Baryshkov (2022-05-11 17:41:50)
>>> On 12/05/2022 03:02, Kuogee Hsieh wrote:
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index af7a80c..f3e333e 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>>>>
>>>>        dp_catalog_ctrl_reset(ctrl->catalog);
>>>>
>>>> -     if (enable)
>>>> -             dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>>>> +     /*
>>>> +      * all dp controller programmable registers will not
>>>> +      * be reset to default value after DP_SW_RESET
>>>> +      * therefore interrupt mask bits have to be updated
>>>> +      * to enable/disable interrupts
>>>> +      */
>>>> +     dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>>>>    }
>>>>
>>>>    void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index c388323..79439b8 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -98,6 +98,8 @@ struct dp_display_private {
>>>>        struct dp_ctrl    *ctrl;
>>>>        struct dp_debug   *debug;
>>>>
>>>> +     atomic_t suspended;
>>> I think it'd be better to protect it with event_lock rather than using
>>> atomics.
>> Agreed. I think the concern is that the event queue will have "stuff" in
>> it. If the event queue was all a threaded irq we could simply call
>> synchronize_irq() after disabling the irq bit in the DP hardware and
>> then we would know it is safe to power down the DP logic. Unfortunately
>> the event queue is a kthread so we can't do that and we have to rewrite
>> synchronize_irq() by checking that the event queue is empty and waiting
>> for it to empty out otherwise. It's not safe enough to simply do the
>> power operations underneath the event_lock because there's a queue in
>> the kthread that might be waiting to grab the event_lock to process.
> This sounds like a good reason to rewrite event_thread to use
> threaded_irq and/or workqueue.

I think we are facing two problems,

1) event q is not empty after suspend  (this scenario most likely will 
not happen since display is off already) -- anyway it should be  fixed 
by adding "suspended" flag checking

2) new events add after suspend  due to irq mask bits were not cleared 
(this scenario most likely the major culprit) -- this fixed by remove 
"enable" flag check at  dp_ctrl_reset_irq_ctrl().

I will have "suspended" flag protected by event_lock.


>
