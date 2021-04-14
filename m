Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223835FA1E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 19:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320589BF8;
	Wed, 14 Apr 2021 17:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495F89BF8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 17:55:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618422916; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3uShNxK5FJYLasDW+nrg03JrG9d+DonaEeEOaVhcnHk=;
 b=aIGYwUrSOsg3xM0j5kTcfpNwBQNGCFSGD2aYnS5TjDFDmIvQNaLvQOzjocS7A1B2H/L0S2X/
 lXqiiPvjsPnIu1gi5eudsTQtk6bEmxuZ9Fe4nnFh0sRcnmqMyGiufcxfn5lQWAURaZhSl+D2
 cSDvQ1+ApvVVWy2AwddlGXOw9ZM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60772c7f03cfff3452b380a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 17:55:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C876FC43463; Wed, 14 Apr 2021 17:55:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CE1CCC433CA;
 Wed, 14 Apr 2021 17:55:09 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 14 Apr 2021 10:55:09 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 2/3] drm/msm/dp: do not re initialize of audio_comp at
 display_disable()
In-Reply-To: <161837022104.3764895.807226402876043006@swboyd.mtv.corp.google.com>
References: <1618355490-5292-1-git-send-email-khsieh@codeaurora.org>
 <161837022104.3764895.807226402876043006@swboyd.mtv.corp.google.com>
Message-ID: <cf72c919404a5bb4d0bdf101a341b074@codeaurora.org>
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

On 2021-04-13 20:17, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-13 16:11:30)
>> At dongle unplug, dp initializes audio_comp followed by sending 
>> disconnect
>> event notification to audio and to make sure audio had shutdown 
>> completely
>> by wait for audio completion notification at display_disable(). This 
>> patch
> 
> Is this dp_display_disable()? Doubtful that display_disable() is the
> function we're talking about.
yes
> 
>> will not re initialize audio_comp at display_disable() if audio 
>> shutdown
>> is triggered by dongle unplugged.
> 
> This commit text seems to say the why before the what, where why is "dp
> initializes audio_comp followed by sending disconnect.." and the what 
> is
> "this patch will no re-initialized audio_comp...". Can you reorder this
> so the what comes before the why?
> 
ok
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 0ba71c7..1d71c95 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -894,8 +894,10 @@ static int dp_display_disable(struct 
>> dp_display_private *dp, u32 data)
>>         /* wait only if audio was enabled */
>>         if (dp_display->audio_enabled) {
>>                 /* signal the disconnect event */
>> -               reinit_completion(&dp->audio_comp);
>> -               dp_display_handle_plugged_change(dp_display, false);
>> +               if (dp->hpd_state != ST_DISCONNECT_PENDING) {
>> +                       reinit_completion(&dp->audio_comp);
> 
> Why is this reinitialized here at all? Wouldn't it make more sense to
> initialize the completion once at cable plug in and then not initialize
> the completion anywhere else? Or initialize the completion whenever
> dp_display->audio_enabled is set to true and then only wait for the
> completion here if that boolean is true? Or initialize the completion
> when dp_display_handle_plugged_change() is passed true for the 
> 'plugged'
> argument?
> yes, i think it is better approach, this will take care of both unplug 
> and suspend.

> I started reading the code and quickly got lost figuring out how
> dp_display_handle_plugged_change() worked and the interaction between
> the dp display code and the audio codec embedded in here. There seem to
> be a couple of conditions that cut off things early, like
> dp_display->audio_enabled and audio->engine_on. Why? Why does
> dp_display_signal_audio_complete() call complete_all() vs. just
> complete()? Please help! :(
> 
>> +                       dp_display_handle_plugged_change(dp_display, 
>> false);
> 
> I think it's this way because dp_hpd_unplug_handle() is the function
> that sets the hpd_state to ST_DISCONNECT_PENDING and then reinitializes
> the completion (why?) and calls dp_display_handle_plugged_change(). So
> the commit text could say that reinitializing the completion again here
> at dp_display_disable() is racing with the audio code in the case that
> dp_hpd_unplug_handle() already called
> dp_display_handle_plugged_change() and it would make more sense. But 
> the
> question still stands why that race even exists in the first place vs.
> initializing the completion variable in only one place unconditionally
> when the cable is connected, in dp_hpd_plug_handle() or
> dp_display_post_enable().
> 
>> +               }
>>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>>                                 HZ * 5))
>>                         DRM_ERROR("audio comp timeout\n");
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
