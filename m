Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9986379E9E
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B21D6E9B2;
	Tue, 11 May 2021 04:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D028E6E9B2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:34:35 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id c3so16079302ils.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4tpZentr0TR2+FXTu3cAIgvwuk8SCd5AACOcGsFclc=;
 b=bG2CP+eF8OkjQT3EabsJgsO+73FTRrGWVbWePSQEyPiCfhCMqDrNIsf8IlatXcwIxQ
 zKGRkGZffuLgiROFw15VfNpKCNxsszcOMz+wxPgK3NaJOyQsfkzdFHkifcFrshkW4psZ
 zsTmYDUhLk7v4sGXObhL+8wTZ6GnlKXSWFbzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4tpZentr0TR2+FXTu3cAIgvwuk8SCd5AACOcGsFclc=;
 b=NDVOsHMv61Vktbww6JpycAJIjUAzp8qBjkkdmabkndz+eXrag8g+2zKIdu87qR/Hai
 nGDAoZh6ncxfqWNGTHUI2R/efbMTUdG5xwMpbRE93sSuUhQhOjTnwg5h7EOvNwwwMSNd
 bDjto9k/Dwcxes+TPu6syq74CCpaGVOgk99VbkC8EbyFlsNgYnyeMtEna82EiVmV9CZr
 D0KTiGLkVO7wpmcrwwxlE4v2JzZvo1Y63RD6w0sW7ElbbPZH6LYdywfLkd77Tbb0/ctn
 dJPwMmkxmrxxq7BjxyiQTqUKjT+VA+OpFI6DSXrxsOwEJ3wfA39nioje5ObPLHsuVGtj
 2dNA==
X-Gm-Message-State: AOAM532c9UmCY/MLnom9rRHcr50pqhw36L5wXhfe1qiu7xN3+JYNXEls
 tPTcgCT2p/4CJ2P7nLDpqsz+8fTZWwKu6Q794rfx5w==
X-Google-Smtp-Source: ABdhPJzFflNdpVJDf+0TIvFgpzzopa1uxa/OtJjcqRcc+rKSCn9UlaFhW0oFRTdjhXoBDVY9BBfp5kygW6IDQzpOHmI=
X-Received: by 2002:a92:cd52:: with SMTP id v18mr24668263ilq.308.1620707675024; 
 Mon, 10 May 2021 21:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210510053125.1595659-1-pihsun@chromium.org>
 <20210510053125.1595659-2-pihsun@chromium.org>
In-Reply-To: <20210510053125.1595659-2-pihsun@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 11 May 2021 12:34:09 +0800
Message-ID: <CAJMQK-jYb_0+AA_bBrvkJ4JaT1mQTr6uGZQbbpnyA1CJ_NLKuw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: anx7625: add suspend / resume hooks
To: Pi-Hsun Shih <pihsun@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 1:31 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> Add suspend / resume hooks for anx7625 driver, that power off the device
> on suspend and power on the device on resume if it was previously
> powered.
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on a mt8183 juniper device.

> ---
>
> Changes from v2:
> * No change.
>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index e1bf31eafe22..b165ef71e00f 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1705,7 +1705,34 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
>         return 0;
>  }
>
> +static int __maybe_unused anx7625_resume(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       if (!ctx->pdata.intp_irq)
> +               return 0;
> +
> +       if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
> +               anx7625_runtime_pm_resume(dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused anx7625_suspend(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       if (!ctx->pdata.intp_irq)
> +               return 0;
> +
> +       if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev))
> +               anx7625_runtime_pm_suspend(dev);
> +
> +       return 0;
> +}
> +
>  static const struct dev_pm_ops anx7625_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
>         SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
>                            anx7625_runtime_pm_resume, NULL)
>  };
> --
> 2.31.1.607.g51e8a6a459-goog
>
