Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24D4FC942
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E0F10FA92;
	Tue, 12 Apr 2022 00:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D310FA90;
 Tue, 12 Apr 2022 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649723384; x=1681259384;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sTXpV5DW8lvf+IzZXjWtfGRdgfLj3MQBE9SGJw2TAZQ=;
 b=Y/yrn0LLSx6CsqCRCOeF8pBJokYmVJA1Gi0LGH8d4oA1fchN877dnoP0
 5Zptp/aUBnfuniTp+dSF/MO1XN/xf0prdP0HPvfbjcDrBylOaNq/fkL/n
 HIT+wcBzLPND6XGSLa4sZmQosblV1qWkcfTMyN5QxKQ0rKNMFL1TloR5S E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 11 Apr 2022 17:29:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:29:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Apr 2022 17:29:22 -0700
Received: from [10.111.166.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Apr
 2022 17:29:19 -0700
Message-ID: <dcdae9ca-1896-e632-17f3-ffd4de7c9c1b@quicinc.com>
Date: Mon, 11 Apr 2022 17:29:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 <agross@kernel.org>, <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
 <daniel@ffwll.ch>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
 <7529d921-0b12-d162-416d-3542933a0aed@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7529d921-0b12-d162-416d-3542933a0aed@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2022 5:22 PM, Dmitry Baryshkov wrote:
> On 12/04/2022 03:21, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-04-11 17:08:49)
>>> Current DP driver implementation, event thread is kept running
>>> after DP display is unbind. This patch fix this problem by disabling
>>> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>>>
>>> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on 
>>> Snapdragon Chipsets")
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>
>> Should add a Reported-by tag from Dmitry here.
>>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 01453db..fa1ef8e 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, 
>>> struct device *master,
>>>          return rc;
>>>   }
>>>
>>> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv);
>>
>> Why can't the function be defined here?
>>
>>> +
>>>   static void dp_display_unbind(struct device *dev, struct device 
>>> *master,
>>>                                void *data)
>>>   {
>>> @@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, 
>>> struct device *master,
>>>          struct drm_device *drm = dev_get_drvdata(master);
>>>          struct msm_drm_private *priv = drm->dev_private;
>>>
>>> +       disable_irq(dp->irq);
>>> +       dp_hpd_event_stop(dp);
>>>          dp_power_client_deinit(dp->power);
>>>          dp_aux_unregister(dp->aux);
>>>          priv->dp[dp->id] = NULL;
>>> @@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
>>>
>>>          dp_priv = (struct dp_display_private *)data;
>>>
>>> -       while (1) {
>>> +       while (!kthread_should_stop()) {
>>>                  if (timeout_mode) {
>>>                          wait_event_timeout(dp_priv->event_q,
>>>                                  (dp_priv->event_pndx == 
>>> dp_priv->event_gndx),
>>> @@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct 
>>> dp_display_private *dp_priv)
>>>          init_waitqueue_head(&dp_priv->event_q);
>>>          spin_lock_init(&dp_priv->event_lock);
>>>
>>> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
>>> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, 
>>> "dp_hpd_handler");
>>> +
>>> +       if (IS_ERR(dp_priv->ev_tsk))
>>> +               DRM_ERROR("failed to create DP event thread\n");
>>
>> Why can't we error out? Why can't this kthread be started in probe?
> 
> Just my 2c. I don't think starting it in probe is a good idea. The 
> driver uses components, so, in my opinion, the thread should be started 
> from bind and stopped in unbind.

Yes, I also agree it should be started in bind and stopped in unbind.

> 
>>
>>> +}
>>> +
>>> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
>>> +{
>>> +       if (IS_ERR(dp_priv->ev_tsk))
>>> +               return;
>>> +
>>> +       kthread_stop(dp_priv->ev_tsk);
>>> +
>>> +       /* reset event q to empty */
>>> +       dp_priv->event_gndx = 0;
>>> +       dp_priv->event_pndx = 0;
>>>   }
>>>
> 
> 
