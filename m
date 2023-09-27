Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C57B0DF6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DBE10E5B2;
	Wed, 27 Sep 2023 21:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8200510E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 21:18:57 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-59f1dff5298so139452167b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695849536; x=1696454336; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UiA24Vnoe9mDlXFXQmDQoe2D01RtP5rHlDPFXWiZnis=;
 b=svkEBd+7bZ55Btw8tpSRGdn6K/q1iASlA4myglOeMsWKfhEgvjkh+c22q8tIL04kYM
 oyy6PZbEoIVZTd7xwqoLyPe9EicJeL04S0mGxqTvYUH6X/Bb8/Dp/2SzsgeWyUpLlOYK
 FuNY/rqyT2jP3rBxz0R/uPwRlXbGWl5o8SgGuVVIlNKm5PqrSogMoEvWn/1D6hhpDrAT
 EI4bYYAfH71OwIfAicmX1TykM7cIJUnCLz999W4QV38qf5e0rNVClsjnNRVmAbd8b77z
 eGtPW4VmHV6kCHlcznQBgZOH02RAqsKDpKv4Hvg97kxNxtZFbiNwRQKoKUPXgvUFih21
 qVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695849536; x=1696454336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UiA24Vnoe9mDlXFXQmDQoe2D01RtP5rHlDPFXWiZnis=;
 b=i2psgU5yAm00CF7muwhwIytg/f4Peo6e+qPXV0RkNlyRFfrICGH4NhQOMtPo01ex0S
 4W8xg/fam0UarVvJsU3HXKKnXHqNxC/4onrAiCnujx6HkOpwuThVeyNOXqa7Q1rxMsZo
 fFX5WsCpK2dOwk6IVPMQ3qHfvD7bq9IltqKANyqwy9dVSpkSxD33DZ5EbLqGIVjlGhFb
 g6Kol0hkpxefrAWDimmE1HXPKX3sQAEnq0jYaxHzHlDRYK3xLKjD1FO6gISq1g2DMFhX
 xLgAlA2CW5fvbEvnragb7/upfSj7K1kN3xl8wvK1SZLv5JUyPva/igNj7Z9sZyi50wq3
 7iVg==
X-Gm-Message-State: AOJu0YzKiOozDIpdGyIcyplfHbPfVMXTq46ZnCBSOAuiewm/PkPA7uVH
 xmPmeP7wk27CxMhHB6oJDWBfIsI12UjwCCFT631NzQ==
X-Google-Smtp-Source: AGHT+IG1QuRlqd5WUg5LSq9Sa+2WG3+pH9aEWm6KmPW4M8nLweQkVnYD51xD/qDJ9L+z4gIuMfCpNnkLCGu0v7Z3tZY=
X-Received: by 2002:a81:6f03:0:b0:59f:773a:b14c with SMTP id
 k3-20020a816f03000000b0059f773ab14cmr3251803ywc.37.1695849536678; Wed, 27 Sep
 2023 14:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:17:50 +0300
Message-ID: <CAA8EJpqwDOPD3dkWO1ap2pjMVnP1r2giUE0bAjTYzPBiz1aewA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
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
> Move parser->parse() and dp_power_client_init() from dp_display_bind()
> to dp_display_probe() in preparation of adding pm_runtime framework
> at next patch.
>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7ae3b8b..3ef141c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         dp->dp_display.drm_dev = drm;
>         priv->dp[dp->id] = &dp->dp_display;
>
> -       rc = dp->parser->parse(dp->parser);
> -       if (rc) {
> -               DRM_ERROR("device tree parsing failed\n");
> -               goto end;
> -       }
>
>
>         dp->drm_dev = drm;
> @@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> -       rc = dp_power_client_init(dp->power);
> -       if (rc) {
> -               DRM_ERROR("Power client create failed\n");
> -               goto end;
> -       }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
>         if (rc) {
> @@ -1249,6 +1239,18 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       rc = dp->parser->parse(dp->parser);
> +       if (rc) {
> +               DRM_ERROR("device tree parsing failed\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       rc = dp_power_client_init(dp->power);
> +       if (rc) {
> +               DRM_ERROR("Power client create failed\n");
> +               return -EPROBE_DEFER;
> +       }

Hit enter too soon. No submodules teardown, so NAK.

Also please propagate returned error codes instead of inventing
EPROBE_DEFER on your own.

> +
>         /* setup event q */
>         mutex_init(&dp->event_mutex);
>         init_waitqueue_head(&dp->event_q);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
