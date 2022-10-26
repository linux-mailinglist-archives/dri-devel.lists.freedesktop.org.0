Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A760E53F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B81F10E3EE;
	Wed, 26 Oct 2022 16:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A909810E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:09:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt23so17080418ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v4TjJfHoFen8k91HvZEu2vMEr0hcvOdzlk4V3gwZmwo=;
 b=hnNrWvxMjwCLbbsqFBUQlHWS/cSpVem1riuEADioRpL8usOiencOo+gNqDDS46qkRU
 IIN5Axth1gM49TNoCnFOF0yW4lY6N60VOXIuk6DmidKtCZ0fQXLjADom0pQ68RWOAZMU
 XGDCAMVYf7oeqgzW+O3I1WjVo4Z/Uc8t+TS4NkEdTtN0Wvs6bFd/Jc9BIKT+hy7M1icf
 btAeXwmANbEC2ADqiER4P6sQMwy8vlrX19wdRo0+u4bVHGJtxUWdQhZPzWzvlrUGYvTA
 3L+rqLFTBaqrUhGgUmXo6NoE9JZedkJgCtkjIbSLezec9ZWcSJy1SpFpO5/EBeoNdXnB
 gkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v4TjJfHoFen8k91HvZEu2vMEr0hcvOdzlk4V3gwZmwo=;
 b=CFJayjfBAINNk+9vPIdXRRjxX4T9sZj4pGjxrNhc/a3FqDFu+rNcxO7X8A3an9pUG1
 EkRPmGEdtzAas91YHzeTbHf4EGHHvxmhImxbR8WHs3wGSyx+jjERI5kaO8PKx3eW8Uul
 lCgmlFEtEJZPfqU+/5qTUhTtpjmOSbzdenLvzQ4bZDYAAHFctNBzOywx6VsGZbsLqY8W
 Nl5pnMQ6Lxhm+YqwmJLLNhtm4XVDEb1rgx7H40E7SlIaowNsJ7nEmI96unHMoKgWJ+mt
 zQRb4lEvHdtqjvyJZoTCOl1u8gh8YJZYUEG8cOnaSGXSrIjxL7AsO7mP4NBhQul8dUIa
 8GXQ==
X-Gm-Message-State: ACrzQf32WWYyUsSGCn0IMo67SRUZiezYH9FkgTiolyKRYYFYcuAkj7JI
 bxCU03kR4BH6/QuZOiuQ5OtAdygslb6vDq1S4won3KZKkqo=
X-Google-Smtp-Source: AMsMyM5aJtEhnKAeLvrxz6KK33kFn+/f1RoIKweC5DbUEpqqf8knVV8v92IAI++i5aotttyiBb9K+2I05FUrrST4V04=
X-Received: by 2002:a17:907:3e11:b0:78d:9918:217f with SMTP id
 hp17-20020a1709073e1100b0078d9918217fmr37159234ejc.742.1666800586213; Wed, 26
 Oct 2022 09:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-7-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-7-a1b40526df3e@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Oct 2022 17:09:31 +0100
Message-ID: <CAPY8ntDvg4Ei-b=adWHi5A8BKamd53Q3FnoyOXvW5zeuYyLArg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/vc4: Make sure we don't end up with a core
 clock too high
To: maxime@cerno.tech
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
>
> Following the clock rate range improvements to the clock framework,
> trying to set a disjoint range on a clock will now result in an error.
>
> Thus, we can't set a minimum rate higher than the maximum reported by
> the firmware, or clk_set_min_rate() will fail.
>
> Thus we need to clamp the rate we are about to ask for to the maximum
> rate possible on that clock.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks Maxime.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 4419e810103d..5c97642ed66a 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -396,8 +396,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         if (vc4->is_vc5) {
>                 unsigned long state_rate = max(old_hvs_state->core_clock_rate,
>                                                new_hvs_state->core_clock_rate);
> -               unsigned long core_rate = max_t(unsigned long,
> -                                               500000000, state_rate);
> +               unsigned long core_rate = clamp_t(unsigned long, state_rate,
> +                                                 500000000, hvs->max_core_rate);
>
>                 drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
>
> @@ -431,14 +431,17 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         drm_atomic_helper_cleanup_planes(dev, state);
>
>         if (vc4->is_vc5) {
> -               drm_dbg(dev, "Running the core clock at %lu Hz\n",
> -                       new_hvs_state->core_clock_rate);
> +               unsigned long core_rate = min_t(unsigned long,
> +                                               hvs->max_core_rate,
> +                                               new_hvs_state->core_clock_rate);
> +
> +               drm_dbg(dev, "Running the core clock at %lu Hz\n", core_rate);
>
>                 /*
>                  * Request a clock rate based on the current HVS
>                  * requirements.
>                  */
> -               WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
> +               WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
>
>                 drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
>                         clk_get_rate(hvs->core_clk));
>
> --
> b4 0.10.1
