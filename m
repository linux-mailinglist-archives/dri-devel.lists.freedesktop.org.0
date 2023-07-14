Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260687532F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCB910E7D6;
	Fri, 14 Jul 2023 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEDF10E7D6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:18:30 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5701eaf0d04so13917067b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689319109; x=1691911109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAao7P7chUwnMdkU8LunFgLkqh5TGQLJMNbk3gX+1fs=;
 b=T6iy9du13TPutIhljjOm1d2urQ1l1cjBdqHAPVL41YpMz7iSgpQ70K+c1CU/pV8TO/
 DapxuBCirx7yNnVtYd/VJj0FKcy94ktmclVC7dSGsScOY9kBChRxmPr+5nsYxyiIvo9K
 TBL3UwNhvWv2jtdXmcWzIXTBNnA2KWfT2RcEgVANbY2dYhQ32QIidv7r5wiMUomi2JKI
 LiBVJezGp4311i3Lo3nplaPDu/PwkTfkf6AcHbqY+1/8ipQHPGkFKPM3eG7PUTlzHdFi
 hZyPticRWnCdoGG47YRig3gsB7u14yjnfBZ56dUAf7WoXIJ6TNwNY9fWojscTwos1y+a
 bZjA==
X-Gm-Message-State: ABy/qLYpPOkTqmD4YdBgxzNfV44TvEpO+v7XHPHCCaZP327OkUZkmc4L
 vFebhtasFROOdvvg+gaNBgG1kRzNqB+wrXPZ
X-Google-Smtp-Source: APBJJlE5iTsF4y5RkelFjTPwu5Cv2RcFjtLu3okmgJau+u6V5QwUeTqfK/qxuAJD0R7w6/4dlBZYCA==
X-Received: by 2002:a81:7741:0:b0:577:60d3:e5fd with SMTP id
 s62-20020a817741000000b0057760d3e5fdmr3948583ywc.28.1689319109314; 
 Fri, 14 Jul 2023 00:18:29 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 z123-20020a0dd781000000b00576c534115bsm2191888ywd.34.2023.07.14.00.18.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 00:18:28 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-cb7b6ecb3cdso944933276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:18:28 -0700 (PDT)
X-Received: by 2002:a25:1854:0:b0:c6b:ffe2:1431 with SMTP id
 81-20020a251854000000b00c6bffe21431mr3074682yby.24.1689319107977; Fri, 14 Jul
 2023 00:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230713163213.1028952-1-javierm@redhat.com>
In-Reply-To: <20230713163213.1028952-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 09:18:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbboXGYVezzw3_TEu8U6WR=q2x2NjD-aqeF91-DXOD3Q@mail.gmail.com>
Message-ID: <CAMuHMdXbboXGYVezzw3_TEu8U6WR=q2x2NjD-aqeF91-DXOD3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Jul 13, 2023 at 6:32=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert reports that the following NULL pointer dereference happens for him
> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
> plane update"):
>
>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
>     and format(R1   little-endian (0x20203152))
>     Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000
>     Oops [#1]
>     CPU: 0 PID: 1 Comm: swapper Not tainted
>     6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>     ...
>     status: 00000120 badaddr: 00000000 cause: 0000000f
>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>     [<c02f94fc>] commit_tail+0x190/0x1b8
>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
>     [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
>     [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
>     [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
>     [<c02cd064>] drm_client_modeset_commit+0x34/0x64
>     [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
>     [<c0303424>] drm_fb_helper_set_par+0x38/0x58
>     [<c027c410>] fbcon_init+0x294/0x534
>     ...
>
> The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
> and this leads to drm_atomic_helper_commit_planes() attempting to commit
> the atomic state for all planes, even the ones whose CRTC is not enabled.
>
> Since the primary plane buffer is allocated in the encoder .atomic_enable
> callback, this happens after that initial modeset commit and leads to the
> mentioned NULL pointer dereference.
>
> Fix this by not using the default drm_atomic_helper_commit_tail() helper,
> but instead the drm_atomic_helper_commit_tail_rpm() function that doesn't
> attempt to commit the atomic state for planes related to inactive CRTCs.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_mo=
de_config_funcs =3D {
>         .atomic_commit =3D drm_atomic_helper_commit,
>  };
>
> +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_hel=
pers =3D {
> +       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,

The docs say this is intended for drivers that support runtime_pm or
need the CRTC to be enabled to perform a commit.  Might be worthwhile
to add basic Runtime PM, so the I2C controller can go to sleep when
the display is not used.

> +};
> +
>  static const uint32_t ssd130x_formats[] =3D {
>         DRM_FORMAT_XRGB8888,
>  };

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
