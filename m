Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04C232125
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8104C8951B;
	Wed, 29 Jul 2020 15:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139DD6E536
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 15:02:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a14so21984527wra.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WGOW+4ED6By0KB5WrYSp9CvcqoKzYJSfhBgGcHuafBg=;
 b=orYEuU8o/GDPhYnOGzfx57QASwqpEIZoDm/xxfftrzRdtI0uqeCC4iHYKn7NFYTV4f
 KeJmDJjL+Rc2grMpL+jqLp4JEoXEcUBt/yYr+8KjrB/As0pJRdj9NkxcpJCh1QgA21/r
 0CzGdw+Uf5iqy8NIQapkdVjptLD8AWiaVxdc9F17evrdOWcSRSrnf7Lb1byyXwV2op26
 ecAwye9TLPD7MWudrrHQvAkNOCM7AJWXZ+r12RUpT0slzlQqHjJkOeYZnefZQX4kv/5c
 lLQWxOHM//odrJUMYt/FIBv1r6qGijXMx23gd1nSetLSZOZbrfPi8Rkk67b+lqzB5NV1
 7cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WGOW+4ED6By0KB5WrYSp9CvcqoKzYJSfhBgGcHuafBg=;
 b=fzirZ4CarLpo8qsAcalbGSsZ5J2sd8S1GD2XbLVvF8/JdYnJurXpMf7r2lSkS0k9AT
 AZCfbKy07/dG4dyHJqnkTI5XYQ6tzyiG5dkmVM7wMbeywEEVup7dLOsIvVlZ4roqmv2B
 lyeYgEde/ZywlIZQDG4DPJg3YId/XNbwsjeTk+AIA6La2192iIHrN0JO3mjIwsHo7HCZ
 gIgVjEugJa3dWFIZrnu8rcholgWVOMUkzN+N1FW5Ur/48aMtrmxttF05X5TWzViqbJNy
 SHSsTLDOGXmabuaJvJeYoN0nb3M9mX2ApyTYONHqbMtSQHmcZIrVI2iepF/8YcXQ7fYm
 vEBQ==
X-Gm-Message-State: AOAM531CQHPLPyGIabNLinb+UcMHjUgTeCjEuIPJPdBXOnqowAld/rfF
 qA9CYhJSgilnOLhB4nA416SgcR/UhW5G2Y6XKZxg/g==
X-Google-Smtp-Source: ABdhPJwAhGfe4OeCtpo2EckPieAyN/CBzAB0X9eafg6qiHj37yAK2qTcWVp20qGk1/k6Ulm7rTvD+Z1zdSQwb2lqJ9k=
X-Received: by 2002:adf:fdce:: with SMTP id i14mr24624163wrs.273.1596034942775; 
 Wed, 29 Jul 2020 08:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <8af06b31c58ec9745ce13c2aca4e532d6ca340e0.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <8af06b31c58ec9745ce13c2aca4e532d6ca340e0.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jul 2020 16:02:06 +0100
Message-ID: <CAPY8ntBpGsak=s8tOmmDA-2kE5mp6+TrqyK3930Ypm7Q9gcUJw@mail.gmail.com>
Subject: Re: [PATCH v4 13/78] drm/vc4: kms: Convert to for_each_new_crtc_state
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:42, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4 atomic commit loop has an handrolled loop that is basically
> identical to for_each_new_crtc_state, let's convert it to that helper.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_kms.c |  9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 210cc2408087..717673b18132 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -152,14 +152,13 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>         struct drm_device *dev = state->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_hvs *hvs = vc4->hvs;
> -       struct vc4_crtc *vc4_crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +       struct drm_crtc *crtc;
>         int i;
>
> -       for (i = 0; i < dev->mode_config.num_crtc; i++) {
> -               if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
> -                       continue;
> +       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);

for_each_new_crtc_in_state doesn't check !state->crtcs[i].commit as
the hand rolled loop did. Sorry, this is my lack of knowledge, but
does that actually make any real difference?

I see nothing wrong in calling vc4_hvs_mask_underrun multiple times
anyway, so it's most likely going to be harmless anyway, but wanted to
query it.

  Dave

>
> -               vc4_crtc = to_vc4_crtc(state->crtcs[i].ptr);
>                 vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
>         }
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
