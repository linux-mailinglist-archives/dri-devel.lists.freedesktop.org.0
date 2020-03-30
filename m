Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C114C1983C8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B866E488;
	Mon, 30 Mar 2020 18:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF716E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 18:55:40 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id z125so11752991vsb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
 b=PF9JCctEmZbycQHUREYCFpB93WZDn96lnP3Obqh6+qo2li0m+PomDclPw436h+k5nE
 HPlEJnAMbHLsbEzWSUiQzAE/czvmUKvzYnBU/0y75CHLnzbcOLHIgDqMclZpnP93bXel
 +PqZr9hZkasdPSR3g/8xLCfssCG0GE51W/VMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
 b=avq3ny3JzA7QXV9Szt/Dvz6RRHwYdhBAd1pTC9MpFL31+gWs2neWT1PN+/lAVwnwPA
 D3PL+GFxeapCs99WGsxYkRyeVXHmqfqqqwfqWBjcKAG0ra1jHFClLrMIVRw1u28aL5nw
 QSLDhCp1m8KpQwp5xkSU7ynegqpWX0f5q0z24hew5Tdmy0bzM1hBtadYNJpt3SRssfkA
 gLG+JTqrNy0BQgiisK9wqa1wPqAee7DhW4nZakFp3LWsdW94zsyZ2j639wbzM1DFKVSe
 5JgBwBf19TY27YWbz27ff+EzoMmzVAGkz9CyywvwOsG6KeoidLYZDIrorHcOxpvptjeQ
 ToTQ==
X-Gm-Message-State: AGi0PuZ5QDahty/N+RQsLYNVlEBq75DSrQic/C1RqrXyKWQsh6A0EPUT
 pgjhOoh4RlzGPsWB4DoSDrl/iNMpE7E=
X-Google-Smtp-Source: APiQypLwZmQ59rdWmr8pBMHU/gOIy9Zswz6V8j++l+o9mNcdww1eOMC/M6ZtapGigJWsE1zLfbv8tw==
X-Received: by 2002:a67:907:: with SMTP id 7mr9061482vsj.42.1585594539082;
 Mon, 30 Mar 2020 11:55:39 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id o130sm5869441vke.28.2020.03.30.11.55.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id y138so11793995vsy.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr9594577vss.198.1585594536858; 
 Mon, 30 Mar 2020 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Mar 2020 11:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 30, 2020 at 2:04 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>    _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  3 files changed, 39 insertions(+)

I am still 100% baffled by your patch and I never did quite understand
your response to my previous comments [1].  I think you're saying that
the problem you were facing is that if you call "suspend" but never
called "runtime_suspend" that the device stays active.  Is that right?
 If that's true, did you try something like this suggestion I made?

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..2343cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -325,6 +326,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_device *dev = dpu_kms->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_dsi *dsi;
> +       int i;
> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +       pm_runtime_put_sync(dev->dev);
> +
> +       /* Increment the usagecount without triggering a resume */
> +       pm_runtime_get_noresume(dev->dev);
> +
> +       pm_runtime_get_noresume(&dpu_kms->pdev->dev);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_get_noresume(&dsi->pdev->dev);
> +       }
> +}

My pm_runtime knowledge is pretty weak sometimes, but the above
function looks crazy.  Maybe it's just me not understanding, but can
you please summarize what you're trying to accomplish?

-Doug

[1] https://lore.kernel.org/r/114130f68c494f83303c51157e2c5bfa@codeaurora.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
