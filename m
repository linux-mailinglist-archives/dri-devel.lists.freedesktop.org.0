Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835B36113C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 19:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476A16EAA7;
	Thu, 15 Apr 2021 17:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0D06EAA6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 17:40:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618508448; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1h4g4HCpxjuVIRzjGY/X9sGZ4OJArnjvLpi4gAm/6E4=;
 b=nfdBhNP4LPjX1Uen38k98H1eTDRuCC046RGTkbLgpkzTSWEW0AEhlUT4p5C2/mRpFZZLrQlQ
 thq2zcIu3q+sqkx0IK9LquipPsYUa/zlG6q2XpAxBuLZmRGOkBrRYdgvIYNVLlREVY7LcjhZ
 5AFold0xb2E9Nc+vkXymyDuqqxc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60787a9d2cc44d3aeaffb238 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Apr 2021 17:40:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 78840C43461; Thu, 15 Apr 2021 17:40:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A32CFC433CA;
 Thu, 15 Apr 2021 17:40:44 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 15 Apr 2021 10:40:44 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 2/3] drm/msm/dp: initialize audio_comp when audio starts
In-Reply-To: <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
References: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
 <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
Message-ID: <645818ed642db192a252343199ecbcc5@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-14 14:22, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-14 14:02:50)
>> Initialize audio_comp when audio starts and wait for audio_comp at
>> dp_display_disable(). This will take care of both dongle unplugged
>> and display off (suspend) cases.
>> 
>> Changes in v2:
>> -- add dp_display_start_audio()
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Looking better. Thanks!
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 0ba71c7..8a69bcd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -177,6 +177,14 @@ static int dp_del_event(struct dp_display_private 
>> *dp_priv, u32 event)
>> 
>>         return 0;
>>  }
>> +void dp_display_start_audio(struct msm_dp *dp_display)
> 
> Please unstick this from previous function by adding a newline above.
> 
>> +{
>> +       struct dp_display_private *dp;
>> +
>> +       dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> +
>> +       reinit_completion(&dp->audio_comp);
>> +}
>> 
>>  void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>>  {
>> @@ -648,10 +656,6 @@ static int dp_hpd_unplug_handle(struct 
>> dp_display_private *dp, u32 data)
>>         /* start sentinel checking in case of missing uevent */
>>         dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, 
>> DP_TIMEOUT_5_SECOND);
>> 
>> -       /* signal the disconnect event early to ensure proper teardown 
>> */
> 
> This doesn't need to be done early anymore? Please mention why in the
> commit text.
> 
This is my mistake, it still need signal audio here, will fix it

>> -       reinit_completion(&dp->audio_comp);
>> -       dp_display_handle_plugged_change(g_dp_display, false);
>> -
>>         dp_catalog_hpd_config_intr(dp->catalog, 
>> DP_DP_HPD_PLUG_INT_MASK |
>>                                         DP_DP_IRQ_HPD_INT_MASK, true);
>> 
>> @@ -894,7 +898,6 @@ static int dp_display_disable(struct 
>> dp_display_private *dp, u32 data)
>>         /* wait only if audio was enabled */
>>         if (dp_display->audio_enabled) {
>>                 /* signal the disconnect event */
>> -               reinit_completion(&dp->audio_comp);
>>                 dp_display_handle_plugged_change(dp_display, false);
>>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>>                                 HZ * 5))
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
