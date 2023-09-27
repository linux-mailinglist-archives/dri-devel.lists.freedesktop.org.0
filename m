Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727127B0DD2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2310E090;
	Wed, 27 Sep 2023 21:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2210E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 21:05:55 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59f7cc71e2eso93837997b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695848755; x=1696453555; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uStOTeDx0/Ukuzu0JJvG25AFIJvkKa932ouE8HZ3uLs=;
 b=ab1sPjLb+Qyq5EqW+9/XGX1l7RY/sh/pZT/7xmo7a87UQ8/9/h64pLgtJLfgtArr5b
 9nCTr2QnO4x7FuFUILeYbVu9m/5yRKv16EBQWO20MWFnFbp54NtILgbgQrpbML3hN73U
 sDPwyBPsN9vPUF9uT59XXq5fSld8Mr7E4/DfjICuUx/6laIRsKBlFjWB4vxisfHQvn2C
 CKYj+i6rCgtIniTF/pWTAKO4t73OEGaT3c4+B/LJciJFri5r8z48ls4KOJT3LdmeJp/n
 aMh7LAjFHB35szrO7fDADs7IjL+hlJkT236sdQPVIwjnXMKJhC/5gAqb6Xjj0HySqAjr
 TyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695848755; x=1696453555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uStOTeDx0/Ukuzu0JJvG25AFIJvkKa932ouE8HZ3uLs=;
 b=Q05CVB1gDdv4qYkx6xFRJS2i6/drSactVn5Rsv0aghyXIQU+CZPg6VG3h05YzVfoSp
 IzlMyxzx0mgpbAYZGJZsrvWsX6DhViU8qN1orrSu43hEZc5Y8c84ewyDsmurWcVydro6
 DwKLQA7Rms2/ADmgdWv2O/ladyFpFQWXmY7n5qKXlnbNvZ7yaxQQpFJkCCzgXfFZ4mqi
 ZegwzukErGSyAldOlnflTSEZIe3TCdQQYM2kMssWWUBbWDFN9DHlgw68TtLCIN2S6Pun
 QH0kPEg0lC5Ty6xnyJG4+3l4sH4oqXGxBDJpGjCEBB4ZjRCpCK9k6iHLlxciKwqHvJiY
 KpiA==
X-Gm-Message-State: AOJu0YyTL6UecjjZWLDPD5d4/mVxJIciKPyl/24ZWcqKpu3SZQMgMnk5
 BEac10UNrm15SdIGcngbp+Ufmfp31Ab12DoR/ASPiw==
X-Google-Smtp-Source: AGHT+IE0km6y8O5Y6e29Gn2cDaSHvokzeKWCzYSEz0u70AbH6xc5f8kdSMkaI9/l/srJYZ/TK7N++QbvgI4+vUtVqkk=
X-Received: by 2002:a0d:e684:0:b0:576:93f1:d118 with SMTP id
 p126-20020a0de684000000b0057693f1d118mr3624518ywe.2.1695848754752; Wed, 27
 Sep 2023 14:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:04:47 +0300
Message-ID: <CAA8EJpqB-sDsQiWmqQS+cxnupTeGBv4G9RcV8vJT3CnWqEbP8g@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/msm/dp: tie dp_display_irq_handler() with dp
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

On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently the dp_display_irq_handler() is executed at msm_dp_modeset_init()

dp_display_request_irq()

> which ties irq registration to the DPU device's life cycle, while depending on
> resources that are released as the DP device is torn down. Move register DP

`registering` or `registration of`

> driver irq handler at dp_display_probe() to have dp_display_irq_handler()

IRQ, s/at/to/

> is tied with DP device.

s/is //

Moreover, your commit does more that you have described in the commit
message. It also e.g. switches to platform_get_irq().

>
> Changes in v4:
> -- delete dp->irq check at dp_display_request_irq()
>
> Changes in v3:
> -- move calling dp_display_irq_handler() to probe
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>  2 files changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 76f1395..5645178 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1193,30 +1193,21 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
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
> +       dp->irq = platform_get_irq(dp->pdev, 0);
>         if (!dp->irq) {
>                 DRM_ERROR("failed to get irq\n");
>                 return -EINVAL;
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

Please don't mix functional changes with code reformatting.

>                 return rc;
>         }
>
> @@ -1287,6 +1278,10 @@ static int dp_display_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, &dp->dp_display);
>
> +       rc = dp_display_request_irq(dp);
> +       if (rc)
> +               return rc;

Who will perform component teardown for you if the driver just returns
an error here?

> +
>         rc = component_add(&pdev->dev, &dp_display_comp_ops);
>         if (rc) {
>                 DRM_ERROR("component add failed, rc=%d\n", rc);
> @@ -1549,12 +1544,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
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
