Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8BE3E04B1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 17:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8E6E3EC;
	Wed,  4 Aug 2021 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AF66E3EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 15:48:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628092099; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=U04zS4aQmZ0a5D68P4sb04QFg2j4jgMCiJPHHK81Tac=;
 b=CqCEFn065jbthlpEHx/NpUEsGGE2RueHBtbVnL/OFjFCU9y0/00Q/nnwmrIiIFqQDY+MzfYF
 Sr/3odaO8JAKj5SAf8fW3qXr1fZ0CRpIgK01AlmQSMVrcksv5661ybOgXkx8zS1j+qlVGbZf
 OY/acntrD603G3bhwcMtqqZLSlg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 610ab6b53f14248172f609b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 15:48:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68760C43217; Wed,  4 Aug 2021 15:48:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2AD84C433F1;
 Wed,  4 Aug 2021 15:48:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 Aug 2021 08:48:04 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
In-Reply-To: <CAE-0n51yNrmrqgDrkj2+c2Bx-bYxNs1m2pQBxvVkSpBH2hxzoA@mail.gmail.com>
References: <1628007913-29892-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51yNrmrqgDrkj2+c2Bx-bYxNs1m2pQBxvVkSpBH2hxzoA@mail.gmail.com>
Message-ID: <ab2a7aadb6ada58246ec972c4938c627@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-03 12:05, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-08-03 09:25:13)
>> Currently at dp_pm_resume() is_connected state is decided base on hpd 
>> connection
>> status only. This will put is_connected in wrongly "true" state at the 
>> scenario
>> that dongle attached to DUT but without hmdi cable connecting to it. 
>> Fix this
>> problem by adding read sink count from dongle and decided is_connected 
>> state base
>> on both sink count and hpd connection status.
>> 
>> Changes in v2:
>> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>> 
>> Changes in v3:
>> -- delete status local variable from dp_pm_resume()
>> 
>> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update 
>> is_connected status")
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 78c5301..0f39256 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1313,7 +1313,7 @@ static int dp_pm_resume(struct device *dev)
>>         struct platform_device *pdev = to_platform_device(dev);
>>         struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>         struct dp_display_private *dp;
>> -       u32 status;
>> +       int sink_count = 0;
>> 
>>         dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> 
>> @@ -1327,14 +1327,26 @@ static int dp_pm_resume(struct device *dev)
>> 
>>         dp_catalog_ctrl_hpd_config(dp->catalog);
>> 
>> -       status = dp_catalog_link_is_connected(dp->catalog);
>> +       /*
>> +        * set sink to normal operation mode -- D0
>> +        * before dpcd read
>> +        */
>> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> +
>> +       /* if sink conencted, do dpcd read sink count */
> 
> s/conencted/connected/
> 
> This also just says what the code is doing. Why do we only read the 
> sink
> count if the link is connected? Can we read the sink count even if the
> link isn't connected and then consider sink count as 0 if trying to 
> read
> fails?
> 
yes, we can do that.
But it will suffer aux time out and retry.
i think it is better to avoid this overhead by check connection first.

>> +       if (dp_catalog_link_is_connected(dp->catalog)) {
>> +               sink_count = drm_dp_read_sink_count(dp->aux);
>> +               if (sink_count < 0)
>> +                       sink_count = 0;
>> +       }
>> 
>> +       dp->link->sink_count = sink_count;
>>         /*
>>          * can not declared display is connected unless
>>          * HDMI cable is plugged in and sink_count of
>>          * dongle become 1
>>          */
>> -       if (status && dp->link->sink_count)
>> +       if (dp->link->sink_count)
>>                 dp->dp_display.is_connected = true;
>>         else
>>                 dp->dp_display.is_connected = false;
