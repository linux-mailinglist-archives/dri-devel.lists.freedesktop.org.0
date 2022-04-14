Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8155019D6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 19:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF3710E069;
	Thu, 14 Apr 2022 17:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE46910E021;
 Thu, 14 Apr 2022 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649956556; x=1681492556;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BF7u36Wb73cxpkjy9bfZRgOS+0WolmnhOmyAdga/rCk=;
 b=yQ4Tcv0+65RY+21QZCDpaj3hY5on4zoMDWYtWuORrtzclTgpqubBlhGf
 sJQ5kqVYfH7Y0nTjFNHKVTy1EXU1fXvwAB6djW1Pr5w8kypoNXEbQ/7k7
 zyhdjjlgZI5/UZHybHnKNPPGkeQ7cm6vxaa9iobufIZhi9BC7JjiGV8Gc 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Apr 2022 10:15:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 10:15:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 10:15:53 -0700
Received: from [10.110.19.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 10:15:52 -0700
Message-ID: <02faf872-8fef-342a-d070-67b68953b5f8@quicinc.com>
Date: Thu, 14 Apr 2022 10:15:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm/dp: stop event kernel thread when DP unbind
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1649883865-9012-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n5259qjMj12LXRp=7kQ7zT3bRMaHpSpwKMwZ8HL6rq7fbw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n5259qjMj12LXRp=7kQ7zT3bRMaHpSpwKMwZ8HL6rq7fbw@mail.gmail.com>
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


On 4/13/2022 4:19 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-13 14:04:25)
>> Current DP driver implementation, event thread is kept running
>> after DP display is unbind. This patch fix this problem by disabling
>> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>>
>> Changes in v2:
>> -- start event thread at dp_display_bind()
>>
>> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++++++++++++++++----------
>>   1 file changed, 30 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 01453db..943e4f1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -113,6 +113,7 @@ struct dp_display_private {
>>          u32 hpd_state;
>>          u32 event_pndx;
>>          u32 event_gndx;
>> +       struct task_struct *ev_tsk;
>>          struct dp_event event_list[DP_EVENT_Q_MAX];
>>          spinlock_t event_lock;
>>
>> @@ -230,6 +231,31 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>>          complete_all(&dp->audio_comp);
>>   }
>>
>> +static int hpd_event_thread(void *data);
> Is there a reason why this is needed vs. defining the kthread start
> function after hpd_event_thread()?
too many code need to be relocated.
>
>> +
>> +static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> Maybe dp_hpd_event_thread_start()?
>
>> +{
>> +       init_waitqueue_head(&dp_priv->event_q);
>> +       spin_lock_init(&dp_priv->event_lock);
>> +
>> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
>> +
>> +       if (IS_ERR(dp_priv->ev_tsk))
>> +               DRM_ERROR("failed to create DP event thread\n");
> Can we return an error from this function?
>
>> +}
>> +
>> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
> Maybe dp_hpd_event_thread_stop()?
>
>> +{
>> +       if (IS_ERR(dp_priv->ev_tsk))
>> +               return;
> If we handled the error then this check becomes impossible.
>
>> +
>> +       kthread_stop(dp_priv->ev_tsk);
>> +
>> +       /* reset event q to empty */
>> +       dp_priv->event_gndx = 0;
>> +       dp_priv->event_pndx = 0;
>> +}
>> +
>>   static int dp_display_bind(struct device *dev, struct device *master,
>>                             void *data)
>>   {
>> @@ -269,6 +295,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>          if (rc)
>>                  DRM_ERROR("Audio registration Dp failed\n");
>>
>> +       dp_hpd_event_setup(dp); /* start event thread */
> The comment is useless, please remove.
>
>>   end:
>>          return rc;
>>   }
>> @@ -280,6 +307,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>>          struct drm_device *drm = dev_get_drvdata(master);
>>          struct msm_drm_private *priv = drm->dev_private;
>>
>> +       disable_irq(dp->irq);
> Is the disable_irq() necessary? It would be nicer to silence the
> hardware and remove the disable_irq() so that we can reason about the
> code assuming the irq is always enabled after it is requested.
>
>> +       dp_hpd_event_stop(dp); /* stop event thread */
>>          dp_power_client_deinit(dp->power);
>>          dp_aux_unregister(dp->aux);
>>          priv->dp[dp->id] = NULL;
