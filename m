Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465526F69F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 09:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32C66E113;
	Fri, 18 Sep 2020 07:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFC36E424
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 23:20:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600384850; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T7ysh9tpMGUKbj6iCLW+ji7IKFLZoCynE1RzCH7rHBw=;
 b=J3nL9tHhU2PqfPEQyKLvXtA4vRSyEIBx+BD7XiDGGFXPdnvv2Id4zJtyIlyJ+jWF7uG1Z4N1
 vlYX7NQpaWlwEm0/BS6Ar9Y2iukE3v0/aAfSWTo8mR6aPUc2VVmsso8CyIs/3v1vV7W2Wjbr
 Xn4kqxYf2lWennUL5e4ebl1On2s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f63ef5136c8ce93e82fab7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 23:20:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8066BC433FF; Thu, 17 Sep 2020 23:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82A8DC433CA;
 Thu, 17 Sep 2020 23:20:48 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 17 Sep 2020 16:20:48 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Sleep properly in dp_hpd_handler kthread
In-Reply-To: <20200917224425.2331583-1-swboyd@chromium.org>
References: <20200917224425.2331583-1-swboyd@chromium.org>
Message-ID: <e4dcf0230a9d2528862ce61aac0439cf@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:21:19 +0000
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-17 15:44, Stephen Boyd wrote:
> We shouldn't be waiting for an event here with a timeout of 100ms when
> we're not in the 'timeout' arm of the if condition. Instead we should 
> be
> sleeping in the interruptible state (S) until something happens and we
> need to wakeup. Right now this kthread is running almost all the time
> because it sleeps for 100ms, wakes up, sees there's nothing to do, and
> then starts the process all over again. Looking at top it shows up in
> the D state (uninterruptible) because it uses wait_event_timeout(). FIx
> this up.
> 
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
> Snapdragon Chipsets")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> 
> Based on msm-next-dp of https://gitlab.freedesktop.org/drm/msm.git
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 05a97e097edf..e175aa3fd3a9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -970,9 +970,8 @@ static int hpd_event_thread(void *data)
>  				(dp_priv->event_pndx == dp_priv->event_gndx),
>  						EVENT_TIMEOUT);
>  		} else {
> -			wait_event_timeout(dp_priv->event_q,
> -				(dp_priv->event_pndx != dp_priv->event_gndx),
> -						EVENT_TIMEOUT);
> +			wait_event_interruptible(dp_priv->event_q,
> +				(dp_priv->event_pndx != dp_priv->event_gndx));
>  		}
>  		spin_lock_irqsave(&dp_priv->event_lock, flag);
>  		todo = &dp_priv->event_list[dp_priv->event_gndx];
> 
> base-commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
