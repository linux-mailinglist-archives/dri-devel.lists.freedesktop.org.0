Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31455C0B2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 13:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C8411BB97;
	Tue, 28 Jun 2022 11:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA0811BB98
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 11:30:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d2so13373386ejy.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 04:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zaisvXvvH7suhogv4021RGw1f6s61n1ufp6Znm5Ry4=;
 b=EU8bxhuhNH5jnKW9XI4iDKQss4MbgU6MYcVLg6bUbB168vL/CqJeemT6dj6y4ZIaBl
 clir87/GTfHNr/4tbUCKnSLppM4j+Ayl/cck7LehwH/nnLjS7mou6BTZI0RmeCcL8WCP
 KaBIpieGlqqCgsRN8t4dzYUHRkFdcW7Mopgc+stVxuyIGBu2WrNux3P/UWEEFX3wHWO8
 Mzr76vpAx7N2dfuPs2oOhGadhuI3YtiQmkjf514i5LPlhDbnpAIjxeXG8vt+YkhZ4GZc
 5y7SgkOUVkVotubkIBvE8P9t7FoHjwUScjp+AIW8ZI+5TNMq8fkUmRHz7Zb3s4DMCaH+
 Z1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zaisvXvvH7suhogv4021RGw1f6s61n1ufp6Znm5Ry4=;
 b=jzDD3m+DeTsxtcW77r6IWzf2+e3q1nSJw34fYBpqdhc8PZld2d+3lkYeAXDMC3hI8M
 4e73/e4uUO0d/pq2AWtMHjc/yI80O5lGl59CgrQv8/uEAmn4cSEqxaOC04SO/L2gaymo
 J1vLLmov+0KeaWdiHyV8miHR9hQjg0WXHgnlOBKs22qn1Uev0tuvwi5dvYgM8ekc1qjy
 9vhsV+7hMRcoaFcoliJYdxsEO8ED0uZtjgEZCFbEi9tKItaXMubgHyHa6/biA3FxM+JP
 8MkUjRMzWeCmCSXKjtJgpbPy/Z+qf99D6G6BSMoPKH2UoviLQIyXmi6QK/A0PWq1c/tr
 9XCg==
X-Gm-Message-State: AJIora970i549L1rSyTO0W5R102ewSN0V3U/nIXcrkuylom653hT8smY
 9paMnQnSpenMGMYYyWa+kaAwwk5zeThlAha6Io024g==
X-Google-Smtp-Source: AGRyM1vbrMhibKwzLWTcRuK+4l4gnemPgtMBMyb2rGuvfydlMpWAmHHn5KotOhsyX4catr93VXO0BpyOVwBdS0eVEOc=
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id
 e21-20020a170906505500b006ff1dfb1e2cmr17798433ejk.200.1656415827276; Tue, 28
 Jun 2022 04:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-4-maxime@cerno.tech>
In-Reply-To: <20220613144800.326124-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jun 2022 12:30:11 +0100
Message-ID: <CAPY8ntBfM43ySG9Rdmn6=B8CfqdenxhxXrk6TtD5PExVAjncmg@mail.gmail.com>
Subject: Re: [PATCH 03/33] drm/vc4: kms: Use maximum FIFO load for the HVS
 clock rate
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 15:48, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The core clock computation takes into account both the load due to the
> input (ie, planes) and its output (ie, encoders).
>
> However, while the input load needs to consider all the planes, and thus
> sum all of their associated loads, the output happens mostly in
> parallel.
>
> Therefore, we need to consider only the maximum of all the output loads,
> and not the sum like we were doing. This resulted in a clock rate way
> too high which could be discarded for being too high by the clock
> framework.
>
> Since recent changes, the clock framework will even downright reject it,
> leading to a core clock being too low for its current needs.
>
> Fixes: 16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 7a7c90d8520b..69eae37e82f6 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -946,7 +946,9 @@ vc4_core_clock_atomic_check(struct drm_atomic_state *state)
>                         continue;
>
>                 num_outputs++;
> -               cob_rate += hvs_new_state->fifo_state[i].fifo_load;
> +               cob_rate = max_t(unsigned long,
> +                                hvs_new_state->fifo_state[i].fifo_load,
> +                                cob_rate);
>         }
>
>         pixel_rate = load_state->hvs_load;
> --
> 2.36.1
>
