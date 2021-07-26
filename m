Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DF3D6A5E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9FE6E8C5;
	Mon, 26 Jul 2021 23:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BCF6E8C5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:51:19 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u10so13054496oiw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6Gx3kdJFNm/135gslaiOBYRLWUB5Dek5XFa229mUI8k=;
 b=jE3Q3MYLf8EehxqYQYMhN3W4udoK0AqV8y3DHFgmw3ceKxfLhUI71lkzfZrz+ljuKv
 vgdCCNqFN491gJMsmja2VQ+r3WokPgTpKxjj4V2QWxJYr3TqYRBEo+7b/DfhtpezmTih
 94hnhrJ86/UPMDU7prDAkEsDJ/9AFUY4mA4X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6Gx3kdJFNm/135gslaiOBYRLWUB5Dek5XFa229mUI8k=;
 b=FuA8wpC7UDeW8XYIW4OAs++YrmqsvHRlvVxSZfq1ialEhZh/Wq6RVB5b/bcSCdDByb
 LPdPqyj+i8AjOFPbt8oJ7O8BBSChK4wZ/TsnLWC0zuoNnyzBmwxUkV68URqHeOdCDGmx
 a710HjebOXi1MQeME/lKH7hiEl+gwO0nHZ1Xn43I4iGWRAsYiYxaqbVPXjyTh/iKkQ36
 mYaTjiqiO5qzSqK2YP5nJUKAPcv+SH3ko3bzO3z9QZ0xyi7ZCf3PTp4SnnyPCwCK5x3z
 sef0JptbMSgKcYQOtYYKzezIPo+lYCkF2Z1Azm+FAfh+sLgL0Pt6A2D5hhZwYHeJJ2Ix
 s1pg==
X-Gm-Message-State: AOAM531+SNbN8+mFRm1EbEpVW/qQbkjNqBN9ZgfTuHATF3OrT/p4RUU4
 HvyjRXOUjeuT1VN8lZUb2emEhTuB96MOv3PSaMyN/w==
X-Google-Smtp-Source: ABdhPJyR/hPMj/JBDgQ7Gosvnha3oraHTfsR7P5yO7OaGxEOEaPtHvNbLcPBMmuLS2GpEGUajwjsuJ8amjXs6GxaPP4=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr13160515oiu.19.1627343478345; 
 Mon, 26 Jul 2021 16:51:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:51:17 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-4-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:51:17 -0400
Message-ID: <CAE-0n53k8k6jOmLDpUhKENP8jReodm8dMXG0U82HrnuSvaUouw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:33)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 59ffd6c8f41f..92b7646a1bb7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -238,8 +251,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
> +
>
>  end:
>         return rc;

This hunk looks useless. Drop it?

> @@ -1205,6 +1221,26 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static int dp_display_get_id(struct platform_device *pdev)
> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       for (i = 0; i < cfg->num_dp; i++) {
> +               if (cfg->io_start[i] == res->start)
> +                       return i;
> +       }
> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return -EINVAL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1219,6 +1255,10 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> +       dp->id = dp_display_get_id(pdev);
> +       if (dp->id < 0)
> +               return -EINVAL;
> +
>         dp->pdev = pdev;
>         dp->name = "drm_dp";
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e9232032b266..62d54ef6c2c4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -161,7 +161,7 @@ struct msm_drm_private {
>         /* DSI is shared by mdp4 and mdp5 */
>         struct msm_dsi *dsi[2];
>
> -       struct msm_dp *dp;
> +       struct msm_dp *dp[3];

It would be nice to either make this dynamically sized (probably little
gain), somehow make a BUILD_BUG_ON(), or have a WARN_ON if
ARRAY_SIZE(dp) is less than a num_dp so we know somebody messed up.
