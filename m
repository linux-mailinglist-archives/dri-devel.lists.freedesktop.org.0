Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BC3DE902
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 10:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC6089F5F;
	Tue,  3 Aug 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9C89F5F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 08:55:26 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q6so27364257oiw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EsZwJNaFBYTAyGw1Pi5XpaVhjkvXKuF34mVyc2ioH2g=;
 b=IQMWqByHfAHErosenpOGw+Z00xebZ/uwdcJyLC9k0SMgw0Qz8mvFGTR9ZrCS7wDNJG
 NywBXlnKE3SSvaSXH2G9q56JAlZstr+y8CkEo+eq1XJoXbBV8YbhKqvec+sD4BkA4YDP
 ZqasbQQrUYT2J/E4jt1DxssJF1OACAU11iCZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EsZwJNaFBYTAyGw1Pi5XpaVhjkvXKuF34mVyc2ioH2g=;
 b=hSSAeNl9qsQ2g9mhqjW76+nxiLgEGNmSPg4/ch1cM0JmY+np82BMrrifWBG0N4lsEN
 3DwfDJsi7PzDdYznMT5Mx5feFvO8qXDCqawkbMU6dnfnjPg8kukJZ5O4VoSbIoTeSL2a
 z0at+HkAB5H9LNnyCehwDd2ti8xROewcfxQcZFUDD4jyGAJhRZL1VZFgVvKvzSHjo1Mr
 DYruCsPwoCamgws+RY2S+jIO8KJcZdinqbPNYHUmj2utnh+cutRXjbzvpFVkJB+vBikt
 liP6dOLn4RuPALLmtqcEqVQz2Ccm4Kb7b4AGqb+yP8jqCKUdCmblBuc0l+NicausiPLH
 f0OA==
X-Gm-Message-State: AOAM530145WgIfkqoURI5dIMqhIwbKeU9KuysNOeK+MT9Q8qh8fktKBM
 YV0vcFvmhNfaIQhioFOcYNFf+LR1pHtUZ9ShVvNwqA==
X-Google-Smtp-Source: ABdhPJzwpHkcVQ7Aar0ILGc3CwQvololSXJOgi1sdQHYLOY3sdJq+SQ3C6QiLVfDbKdEgtRgfxMFN8Uc2/Gok62IF7Y=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr2386771oih.166.1627980925750; 
 Tue, 03 Aug 2021 01:55:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 01:55:25 -0700
MIME-Version: 1.0
In-Reply-To: <1627935655-4090-1-git-send-email-khsieh@codeaurora.org>
References: <1627935655-4090-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 3 Aug 2021 01:55:25 -0700
Message-ID: <CAE-0n51qc7LX-hWiFEGWRAZqNUgQAQ3XCxO6oEYWZh7wvkxs5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: update is_connected status base on sink
 count at dp_pm_resume()
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Kuogee Hsieh (2021-08-02 13:20:55)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8b69114..6dcb78e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1403,6 +1403,7 @@ static int dp_pm_resume(struct device *dev)
>         struct msm_dp *dp_display = platform_get_drvdata(pdev);
>         struct dp_display_private *dp;
>         u32 status;

'status' is unused now, right? The compiler should be complaining about
unused local variables.

> +       int sink_count = 0;
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>  xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
> @@ -1417,15 +1418,26 @@ xlog(__func__, 1,0,0, dp->core_initialized, dp_display->power_on);
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       status = dp_catalog_link_is_connected(dp->catalog);
> +       /*
> +        * set sink to normal operation mode -- D0
> +        * before dpcd read
> +        */
> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> +
> +       /* if sink conencted, do dpcd read sink count */
> +       if ((status = dp_catalog_link_is_connected(dp->catalog))) {
> +               sink_count = drm_dp_read_sink_count(dp->aux);
> +               if (sink_count < 0)
> +                       sink_count = 0;
> +       }
>
> +       dp->link->sink_count = sink_count;
>         /*
>          * can not declared display is connected unless
>          * HDMI cable is plugged in and sink_count of
>          * dongle become 1
>          */
> -xlog(__func__, 0x12,0,0, 0, dp->link->sink_count);
> -       if (status && dp->link->sink_count)
> +       if (dp->link->sink_count)
>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;
