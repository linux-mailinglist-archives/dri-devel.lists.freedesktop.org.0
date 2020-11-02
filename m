Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90B2A36C2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 23:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251EA6E448;
	Mon,  2 Nov 2020 22:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8406E448
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 22:43:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604357026; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=No1dw23Jupa6r4Z7k6+IW7A6Z2ze/zie3cCEHSJziO4=;
 b=JpGi8LX4R9LhOQHvYMBhf8oWTDsZJfrnvEzPKkL81nfx5Y5D9EGaBhcoT9bjgJWZh5T02hzy
 zPDsGTouJh6uWW5dHQmz+kUPO160+gbyEGByfyqceDsXmn41Dhe6zaxn7RjMwslaDrHEFpo0
 8MiM8cvNuPYBVrFI01Psi8lh6BM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa08b97fcec43b7832a7afd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 22:43:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A7DBDC433F0; Mon,  2 Nov 2020 22:43:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF469C433C9;
 Mon,  2 Nov 2020 22:43:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 02 Nov 2020 14:43:33 -0800
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not notify audio subsystem if
 sink doesn't support audio
In-Reply-To: <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
 <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
Message-ID: <99476b913b8b6ed28fc7af8e80c6db52@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 cychiang@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

Thanks for the review.

On 2020-11-02 13:19, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2020-10-29 13:55:09)
>> For sinks that do not support audio, there is no need to notify
>> audio subsystem of the connection event.
>> 
>> This will make sure that audio routes only to the primary display
>> when connected to such sinks.
>> 
> 
> Does this need a Fixes tag? Or it's just an optimization patch?
This is an unhandled corner case ( VGA dongle ) for DP audio and will 
make
sure we do not switch audio output from primary to external when 
connected to
a sink which does not support audio.
I thought of adding a fixes tag pointing to 
https://patchwork.freedesktop.org/patch/390236/.
But at the same time, thought this can go in as a standlone patch as 
well.
If you think its required, I will add the fixes tag pointing to the base 
audio patch.
> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4a5735564be2..d970980b0ca5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct 
>> dp_display_private *dp, u32 data)
>>  static void dp_display_handle_plugged_change(struct msm_dp 
>> *dp_display,
>>                 bool plugged)
>>  {
>> -       if (dp_display->plugged_cb && dp_display->codec_dev)
>> -               dp_display->plugged_cb(dp_display->codec_dev, 
>> plugged);
>> +       struct dp_display_private *dp;
>> +
>> +       dp = container_of(g_dp_display,
> 
> What is g_dp_display? I guess this doesn't compile?
g_dp_display is the global dp_display pointer in the dp_display.c file. 
It does compile.
> 
>> +                       struct dp_display_private, dp_display);
>> +
>> +       if (dp_display->plugged_cb && dp_display->codec_dev) {
>> +               /* notify audio subsystem only if sink supports audio 
>> */
>> +               if (dp->audio_supported)
> 
> Can we combine this into the above if statement?
> 
>> +                       dp_display->plugged_cb(dp_display->codec_dev, 
>> plugged);
> 
> Then this isn't as nested.
Ok, will do ...
> 
>> +       }
>>  }
>> 
>>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 
>> data)
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
