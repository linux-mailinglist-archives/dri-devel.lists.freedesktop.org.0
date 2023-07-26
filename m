Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF397635CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE4F10E466;
	Wed, 26 Jul 2023 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1D10E466
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:04:26 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-583b4522927so51320317b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690373066; x=1690977866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8EFa5XQd76ZWyggXmDp/7dYxuK3+nTVxrOJ5ZnejRg=;
 b=S6irBrt9Ix/BKQ090eSt/Va/Uunh3xTWAvbEA7CjvL77cHPPendCOVA68jJjMubsKr
 +2PbCAahzd7fF5kqJo/T4ymmUfIcNZl0IJPLt7JVOHkneL5q6ABtrr/C3+eNwQY6+3k3
 h0aj1pQJG+hzna8LNn/XTnCcYZyDZyRhpMalJYymbr2U0Fgjh/k/8RHuVXJ9mXaf9rfz
 25SYwzl4vKmYa0DISLv+jOnjAgycpOx6+Ys9b0S0zlR2NM5zNiPI32lBch1QY9UN23CM
 tEurjENkMfHLKqB2giEtMzkn6ydGB08Nkh1TJkIz2xhHfl1F9bqZnEMtiKEKJCdWUiXx
 xiQA==
X-Gm-Message-State: ABy/qLZT2dxPeizn0ukNpDdsmYXkNYRBTeFbtgJc2bekUwUg4v+upbdH
 FeHyZqA/x18uWv9R6GztdYO2uyAwum8MBQ==
X-Google-Smtp-Source: APBJJlFvtBE4JAR3PHxQ4TEDpYYznZyD4EIvhTVXbl21iUJWzMyAXoDCNxD2ipJITsLIj/xsgBmPZw==
X-Received: by 2002:a81:5ec4:0:b0:569:e7cb:cd4e with SMTP id
 s187-20020a815ec4000000b00569e7cbcd4emr2250320ywb.48.1690373065856; 
 Wed, 26 Jul 2023 05:04:25 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 d82-20020a814f55000000b00583e52232f1sm2208986ywb.112.2023.07.26.05.04.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 05:04:25 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d075a831636so5203962276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:04:25 -0700 (PDT)
X-Received: by 2002:a05:6902:523:b0:ced:974a:1aae with SMTP id
 y3-20020a056902052300b00ced974a1aaemr1534872ybs.58.1690373065221; Wed, 26 Jul
 2023 05:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230726105433.389740-1-javierm@redhat.com>
 <20230726105433.389740-2-javierm@redhat.com>
In-Reply-To: <20230726105433.389740-2-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jul 2023 14:04:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1ECG44BMOb5zK_N1cZCpjoKmms2p_80+_F72HH0NBEA@mail.gmail.com>
Message-ID: <CAMuHMdX1ECG44BMOb5zK_N1cZCpjoKmms2p_80+_F72HH0NBEA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/ssd130x: Allocate buffer in the plane's
 .atomic_check() callback
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Jul 26, 2023 at 12:55=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Drivers are not allowed to fail after drm_atomic_helper_swap_state() has
> been called and the new atomic state is stored into the current sw state.
>
> Since the struct ssd130x_device .data_array is allocated in the encoder's
> .atomic_enable callback, the operation can fail and this is after the new
> state has been stored. So it can break an atomic mode settings assumption=
.
>
> Fix this by having custom helpers to allocate, duplicate and destroy the
> plane state, that will take care of allocating and freeing these buffers.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>
> Changes in v5:
> - Add collected tags from Maxime and Geert.
> - Update commit message to not mention the kernel oops (Geert Uytterhoeve=
n).
> - Drop Reported-by and Fixes tags (Geert Uytterhoeven).
> - Update comment about buffer and data_array fields (Geert Uytterhoeven).
> - Remove superfluous NULL check in ssd130x_fb_blit_rect() (Geert Uytterho=
even).
> - Reset .buffer to NULL if .data_array allocation fails (Geert Uytterhoev=
en).
> - Inline buffer alloc/free helper functions (Geert Uytterhoeven).

Thanks for the update!

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

> @@ -535,7 +550,8 @@ static int ssd130x_update_rect(struct ssd130x_device =
*ssd130x, struct drm_rect *
>         return ret;
>  }
>
> -static void ssd130x_clear_screen(struct ssd130x_device *ssd130x)
> +static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
> +                                struct ssd130x_plane_state *ssd130x_stat=
e)
>  {
>         struct drm_rect fullscreen =3D {
>                 .x1 =3D 0,
> @@ -544,21 +560,21 @@ static void ssd130x_clear_screen(struct ssd130x_dev=
ice *ssd130x)
>                 .y2 =3D ssd130x->height,
>         };
>
> -       ssd130x_update_rect(ssd130x, &fullscreen);
> +       ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);

I've just realized another issue: since 49d7d581ceaf4cf8 ("drm/ssd130x:
Don't allocate buffers on each plane update"). this no longer
clears the screens, but just updates the hardware with the data in
ssd130x_device.buffer, i.e. with the last image shown.
So this should at least clear all of ssd130x_device.buffer before
calling ssd130x_update_rect().

As it's a bit pointless to transpose a black image, a better fix would
be to just clear ssd130x.data_array, and call the low-level hardware
functions like ssd130x_update_rect() does.

>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
