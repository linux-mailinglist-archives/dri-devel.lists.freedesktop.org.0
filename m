Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E967A2BFC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 02:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B03E10E6B5;
	Sat, 16 Sep 2023 00:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1EB10E6B9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 00:30:06 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d8162698f0dso2658151276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694824205; x=1695429005; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UKG1f2vWtn3rxoFyylQkmHI05xPy2LbsMYzfeNRbE94=;
 b=OUVxALMBuWVIbrLFB4M6rXH9Cuui8UgvAYS33E1Ql2WSq+KokY4oMUUQ/1KtdgKpsD
 zzYEvl9tV3HHlPYvbGEnPn+T0P5Y/efDiectWbHiTh40LBOQRakcMzVy2lTuMN1WSSHW
 qAvM7QxR71Jit4LcSN2464wXU1IztnygbrbsaC8wTPiLrbt58Zf9+sD922JRWYNwXac4
 CxLFSk9W9pHvy3gv6/Prb5bfNo/zWr3KurHnmiR5rFgq4WE5XQJZUBH2o4nRnx8PIAhb
 FMWOySFTxLnqu/MckXYy0npYQpvz9DLMFtT17dNaHgyCKAbsqj5qpHUoPGzpxXPuQK8D
 Enag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694824205; x=1695429005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKG1f2vWtn3rxoFyylQkmHI05xPy2LbsMYzfeNRbE94=;
 b=m6FPOlMMQc0fQWugZk3zLszkvv68wmYKoOshRJ80sZ+NM/U6qGdLDjHLaGzqBffm8q
 MjWnM1Po7eLOdOP15x/YKnJsmM5y+hCrPzBFD4/FTYsNk3GF610gAT+hdtUAGGIdB2FU
 UfPKXOxMsYEX2qT+iRE3nRrKDHJRibXGGBZHTvr7YaarUb03M1dBwRPzjJmHH+quzBuH
 8oEVVPlZylyBR4UPHUnO9SOPya+2bQjcPPn0m9qjQXHnM2+YgeRI/E4W3HGXEfSWZ8Vy
 mx1CPV1kBqqvIu5Xb01L1vQBnOcpi+QzHDvwUN1XHxl+g3eN7d6S9C+MAeZu46teDQol
 Eecw==
X-Gm-Message-State: AOJu0Yx3dLh2CKYiGM4gU4wMYC6Q1e4IRZCRAv06oO+MBOFu0oqnAUq+
 qYu43LXi5JzXBap6KrnhMGtHUFYgeJsBn6Jh5uZlSQ==
X-Google-Smtp-Source: AGHT+IHhX/JKjbZ7l2rDepEtwshKF9tSkcCpppE/UlOx5xZD7LfakyNxo9z3pYuUtsI9K2yh4+/L5L/0ntvja0Xr3xI=
X-Received: by 2002:a25:b30f:0:b0:d7b:9f03:20cc with SMTP id
 l15-20020a25b30f000000b00d7b9f0320ccmr3240208ybj.32.1694824205419; Fri, 15
 Sep 2023 17:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1694813901-26952-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Sep 2023 03:29:54 +0300
Message-ID: <CAA8EJprRFYMF-6yxcL75rftfii0kt7hmg_+TeOMJw+BRyDYdeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] drm/msm/dp: tie dp_display_irq_handler() with dp
 driver
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently the dp_display_irq_handler() is executed at msm_dp_modeset_init()
> which ties irq registration to the DPU device's life cycle, while depending on
> resources that are released as the DP device is torn down. Move register DP
> driver irq handler at dp_display_probe() to have dp_display_irq_handler()
> is tied with DP device.
>
> Changes in v3:
> -- move calling dp_display_irq_handler() to probe

Was there a changelog for the previous reivions? What is the
difference between v1 and v2?

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++----------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>  2 files changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 76f1395..c217430 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1193,30 +1193,23 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>         return ret;
>  }
>
> -int dp_display_request_irq(struct msm_dp *dp_display)
> +static int dp_display_request_irq(struct dp_display_private *dp)
>  {
>         int rc = 0;
> -       struct dp_display_private *dp;
> -
> -       if (!dp_display) {
> -               DRM_ERROR("invalid input\n");
> -               return -EINVAL;
> -       }
> -
> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +       struct device *dev = &dp->pdev->dev;
>
> -       dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>         if (!dp->irq) {

What is the point in this check?

> -               DRM_ERROR("failed to get irq\n");
> -               return -EINVAL;
> +               dp->irq = platform_get_irq(dp->pdev, 0);
> +               if (!dp->irq) {
> +                       DRM_ERROR("failed to get irq\n");
> +                       return -EINVAL;
> +               }
>         }
>
> -       rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
> -                       dp_display_irq_handler,
> +       rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
>                         IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>         if (rc < 0) {
> -               DRM_ERROR("failed to request IRQ%u: %d\n",
> -                               dp->irq, rc);
> +               DRM_ERROR("failed to request IRQ%u: %d\n", dp->irq, rc);
>                 return rc;
>         }
>
> @@ -1287,6 +1280,10 @@ static int dp_display_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, &dp->dp_display);
>
> +       rc = dp_display_request_irq(dp);
> +       if (rc)
> +               return rc;

This way the IRQ ends up being enabled in _probe. Are we ready to
handle it here? Is the DP device fully setup at this moment?

> +
>         rc = component_add(&pdev->dev, &dp_display_comp_ops);
>         if (rc) {
>                 DRM_ERROR("component add failed, rc=%d\n", rc);
> @@ -1549,12 +1546,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
>         dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       ret = dp_display_request_irq(dp_display);
> -       if (ret) {
> -               DRM_ERROR("request_irq failed, ret=%d\n", ret);
> -               return ret;
> -       }
> -
>         ret = dp_display_get_next_bridge(dp_display);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 1e9415a..b3c08de 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -35,7 +35,6 @@ struct msm_dp {
>  int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>                 hdmi_codec_plugged_cb fn, struct device *codec_dev);
>  int dp_display_get_modes(struct msm_dp *dp_display);
> -int dp_display_request_irq(struct msm_dp *dp_display);
>  bool dp_display_check_video_test(struct msm_dp *dp_display);
>  int dp_display_get_test_bpp(struct msm_dp *dp_display);
>  void dp_display_signal_audio_start(struct msm_dp *dp_display);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
