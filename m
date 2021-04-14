Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972B35FD17
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 23:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10A76E975;
	Wed, 14 Apr 2021 21:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497E6E975
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 21:19:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id w8so8526865plg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LcOc4JlIYDboURYMkcvr8SNtAziTFL1D41weTgPLTsw=;
 b=VG6MIZyisv7JYepLL9z7oA0Y9Nxg8R0YWSjk8tfVBod5e4RAWtVwiL3M3guGCVha2K
 lCS920xReB/AV6By58fHqFsrJDW08Yq2FQrHo8U9M0TOx37djAijHQSeCqF4EHsLXaX+
 3KWc/Bx2DbJ5fWKiFHYzrvJyFB6nqjUrKOa8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LcOc4JlIYDboURYMkcvr8SNtAziTFL1D41weTgPLTsw=;
 b=JltFVRx4iQRnRw1vcwGRym1ntSvx5A1aymeAG3FUMSQWviuiyKWwt9dnPnk1Xo3QRn
 Hr12vQbzg4xg9SAEF2kd+t8ncn5HL1UFMQE/UMdWhyf3dRCNm413S4Aw5EK8jyTjangX
 2nub/9zKhn2BHIWy38AMuzS9D6E+8Xyj6hFIXr4cjvCe6H6SbGmeGiHfw1BGreRUK6p2
 Jq44HW4+HN53VJIc3UJgHJruHrVnw+fDOQiSDtJTD+ssA+jRLv0vgSi3YvkP8XgMmXma
 21YKu9tYkUctTNh639nEC6Ag+/q/uo4I9i23sO+kfOzl+Tf0DOkktRso3B1MNcckwWrw
 7Iog==
X-Gm-Message-State: AOAM5311A/dOtZQX9D3LNxsrN6KSty8zNnh/urLwXBu2rXE+CCmPIvfT
 nSGj1wUq0cortK5Zy+dlEI2cQg==
X-Google-Smtp-Source: ABdhPJxGCQP3KYUFO8ly/GrqLFZX3A5UWMJ3VX3pPVI5/QsxfJ55s9l4d5dNVg23uJhu+r5B26INSg==
X-Received: by 2002:a17:902:d911:b029:ea:cc53:5501 with SMTP id
 c17-20020a170902d911b02900eacc535501mr213198plz.21.1618435141650; 
 Wed, 14 Apr 2021 14:19:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
 by smtp.gmail.com with ESMTPSA id q18sm290934pfj.131.2021.04.14.14.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 14:19:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618434154-28255-1-git-send-email-khsieh@codeaurora.org>
References: <1618434154-28255-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 1/3] drm/msm/dp: check sink_count before update
 is_connected status
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Wed, 14 Apr 2021 14:18:59 -0700
Message-ID: <161843513989.46595.8623474483864386727@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-14 14:02:34)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
> 
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can you please thread your emailed patches? I see them all as toplevel
messages in my inbox :(


>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..0ba71c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -586,10 +586,8 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>         mutex_lock(&dp->event_mutex);
>  
>         state = dp->hpd_state;
> -       if (state == ST_CONNECT_PENDING) {
> -               dp_display_enable(dp, 0);
> +       if (state == ST_CONNECT_PENDING)
>                 dp->hpd_state = ST_CONNECTED;
> -       }
>  
>         mutex_unlock(&dp->event_mutex);
>  
> @@ -669,10 +667,8 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>         mutex_lock(&dp->event_mutex);
>  
>         state =  dp->hpd_state;
> -       if (state == ST_DISCONNECT_PENDING) {
> -               dp_display_disable(dp, 0);
> +       if (state == ST_DISCONNECT_PENDING)
>                 dp->hpd_state = ST_DISCONNECTED;
> -       }
>  
>         mutex_unlock(&dp->event_mutex);
>  
> @@ -1272,7 +1268,12 @@ static int dp_pm_resume(struct device *dev)
>  
>         status = dp_catalog_link_is_connected(dp->catalog);
>  
> -       if (status)
> +       /*
> +        * can not declared display is connected unless
> +        * HDMI cable is plugged in and sink_count of
> +        * dongle become 1
> +        */
> +       if (status && dp->link->sink_count)
>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;

With this patch applied things still go wrong for me sometimes. I can
connect the apple dongle and then disconnect the apple dongle, instead
of connect and disconnect the HDMI cable, and sometimes the external
display doesn't come on. I'm still investigating but just wanted to let
you know.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
