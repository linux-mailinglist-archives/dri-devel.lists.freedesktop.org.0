Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC862A3E67
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7286EBA5;
	Tue,  3 Nov 2020 08:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5BC6E558
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 21:19:57 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i7so9940445pgh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 13:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
 b=YTyfXrFe7avSZYrfT69J72tFfPArIv0rq/MD9TDv0mLzf6VGWkkmFcKLaIhBwmtYUV
 OfI7prs1PEvecIN7s+lp+6dqs88D/AcB5zxmRQbRU5+T7LYqs5YcZXW2j/TeqUUSvLym
 IX+z+LzhG5wJpNoytNzrqunBgNq55+SHD64dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
 b=LYdvn5tJ08qxpsjUpZp3HXlitfXvbh2wa4zQn+BdcSNfELzs3QskgRXuxO1wK4FrwV
 V8PM4o++S0jDiG/su6WWsTHVDqYwgvHUkXYHLyVKjn37H+IWpgTKIfhC0IxuP5tRvBSX
 KX8eATUDhdfJ3x3+y66n49/Vdndb72hvZOev36Sqe16+iIv70BV8cBMCtZ9l2ysBEyEL
 HBiKrosJy3uwgZnU6T1K6Ou8PhiZW5BuSkvLa5oujR24hxLfDb+EvFxVVLRAUglLU5mO
 x//jj5d/e25YmmuYLdz5uwmC0cTQxlFM+M//JtZLN0qNSmY9yRS/o3G3+ugT3qbCwlGX
 +mWw==
X-Gm-Message-State: AOAM533ljSVeISA09ofNGP+eJ6K1mIU3OpADkd8c+tiKNYYujCsM6Fam
 6Cnl/lvWm58eNzGN/PwAsLMGIQ==
X-Google-Smtp-Source: ABdhPJxfOk0mmqX0RpZ2O0ZHRlCvjeMDUMHlxvxspXmVFF9ZtFhc0xavIb+wi6/woPUaiNH7hebN0g==
X-Received: by 2002:a63:4f5f:: with SMTP id p31mr12022620pgl.158.1604351996950; 
 Mon, 02 Nov 2020 13:19:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u124sm15320487pfc.21.2020.11.02.13.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 13:19:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201029205509.13192-1-abhinavk@codeaurora.org>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: do not notify audio subsystem if sink doesn't
 support audio
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Mon, 02 Nov 2020 13:19:54 -0800
Message-ID: <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-10-29 13:55:09)
> For sinks that do not support audio, there is no need to notify
> audio subsystem of the connection event.
> 
> This will make sure that audio routes only to the primary display
> when connected to such sinks.
> 

Does this need a Fixes tag? Or it's just an optimization patch?

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4a5735564be2..d970980b0ca5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> -       if (dp_display->plugged_cb && dp_display->codec_dev)
> -               dp_display->plugged_cb(dp_display->codec_dev, plugged);
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(g_dp_display,

What is g_dp_display? I guess this doesn't compile?

> +                       struct dp_display_private, dp_display);
> +
> +       if (dp_display->plugged_cb && dp_display->codec_dev) {
> +               /* notify audio subsystem only if sink supports audio */
> +               if (dp->audio_supported)

Can we combine this into the above if statement?

> +                       dp_display->plugged_cb(dp_display->codec_dev, plugged);

Then this isn't as nested.

> +       }
>  }
>  
>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
