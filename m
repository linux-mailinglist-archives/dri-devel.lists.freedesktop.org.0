Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFF2FFFDC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141876E9B9;
	Fri, 22 Jan 2021 10:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B06E9CB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:12:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m4so4514083wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LOo+lzhGZEKUcgcULWlVpSFsUUxLMr5cvl3DuWaTOWk=;
 b=TKfQenioJRtU2Uv/wHQ9qA+X00XVl4M4kw5vXIpz9PcGQDe/Nrl6XlKZBThNjlYHG+
 07PGMkr/mbJ/pBTO0VYkLRcJk7YZblOijJV+Ul6rYRzKMIzV9hHS0auc9Y2VUybISDbU
 tv5FuZwm+dfFx9bevXtCob2by2j8AFFcnNkvOPelBmGqHyItTRw2gJIalmcM4toE9UiK
 nVC+7gygw59LiZS9Zki9ME6hb96A38UWZJBHF8C0Yuhz1/9oXML3g+o/nLq/qCJLI8FS
 kqxBcb0dvHK8us9UMYA/C90lYyw43SktPu4Or8U7JIUMAfSyn/tpJQTfm5AD/MvKJt8i
 MtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LOo+lzhGZEKUcgcULWlVpSFsUUxLMr5cvl3DuWaTOWk=;
 b=nYcM7+rtN3Bou33Apb5T5T8aBH1iPRS/fWkbhUgOuHlzC/pKtpQMT8P6oUty+H1yQ6
 DNUd9rY7ZxzI0equKkOT6SZ3a2g6ammH7hxhsGBDsbhOxRAZnOuDwSYaiu0Qz0MvbWfM
 /4GDdLGsPrVaD7UpPgkBzjaOEaYbSMWhEFTlIXxCSGpmylOiSjeI6osu9Yt/6326wRHT
 v9IwRT2dVo0rrFk02WlxzIbFqJHET7VWncdnXhYUoPfOml4s8SC54vKqj9sZHvideRqi
 3T881QADWWs5gEvgjGWKfWcdI/voKrW4rUBWBbZNy7Jj8lGSKFiU/P9pHmDcWBayj5xz
 8d4g==
X-Gm-Message-State: AOAM5313zfEzz/1Pkk/lp996MyQ2htr1mNsTAoowG/aJNa4+q4mTYZk4
 wMmgPn3MX5DxJJhizNxgCn2QT12BhsF+avXLwfG4T2dyw9I=
X-Google-Smtp-Source: ABdhPJz+pV6UWxoGXAoZhYQ1iKxH4ijitAEMwgsP9J3x2eiyJR5TQoxlWy/+uIObGNKxa9YfachaDv9HdFtFUlGYOXA=
X-Received: by 2002:a5d:5042:: with SMTP id h2mr3757608wrt.42.1611310358388;
 Fri, 22 Jan 2021 02:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20210121105759.1262699-1-maxime@cerno.tech>
In-Reply-To: <20210121105759.1262699-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 10:12:23 +0000
Message-ID: <CAPY8ntB9kmnCjN0xXmmzR6Uve2+f9UjeYqn6rFTmNOsof4RoXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: Correct lbm size and calculation
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, Lucas Nussbaum <lucas@debian.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 21 Jan 2021 at 10:58, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> LBM base address is measured in units of pixels per cycle.
> That is 4 for 2711 (hvs5) and 2 for 2708.
>
> We are wasting 75% of lbm by indexing without the scaling.
> But we were also using too high a size for the lbm resulting
> in partial corruption (right hand side) of vertically
> scaled images, usually at 4K or lower resolutions with more layers.
>
> The physical RAM of LBM on 2711 is 8 * 1920 * 16 * 12-bit
> (pixels are stored 12-bits per component regardless of format).
>
> The LBM adress indexes work in units of pixels per clock,
> so for 4 pixels per clock that means we have 32 * 1920 = 60K
>
> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c   | 8 ++++----
>  drivers/gpu/drm/vc4/vc4_plane.c | 7 ++++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 2b3a597fa65f..c239045e05d6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -622,11 +622,11 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>          * for now we just allocate globally.
>          */
>         if (!hvs->hvs5)
> -               /* 96kB */
> -               drm_mm_init(&hvs->lbm_mm, 0, 96 * 1024);
> +               /* 48k words of 2x12-bit pixels */
> +               drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
>         else
> -               /* 70k words */
> -               drm_mm_init(&hvs->lbm_mm, 0, 70 * 2 * 1024);
> +               /* 60k words of 4x12-bit pixels */
> +               drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
>
>         /* Upload filter kernels.  We only have the one for now, so we
>          * keep it around for the lifetime of the driver.
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 6bd8260aa9f2..b98eabb52920 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -437,6 +437,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
>  static u32 vc4_lbm_size(struct drm_plane_state *state)
>  {
>         struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
> +       struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
>         u32 pix_per_line;
>         u32 lbm;
>
> @@ -472,7 +473,11 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
>                 lbm = pix_per_line * 16;
>         }
>
> -       lbm = roundup(lbm, 32);
> +       /* Align it to 64 or 128 (hvs5) bytes */
> +       lbm = roundup(lbm, vc4->hvs->hvs5 ? 128 : 64);
> +
> +       /* Each "word" of the LBM memory contains 2 or 4 (hvs5) pixels */
> +       lbm /= vc4->hvs->hvs5 ? 4 : 2;
>
>         return lbm;
>  }
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
