Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0E755EF0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C710E0D0;
	Mon, 17 Jul 2023 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD87A10E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:04:32 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-c11e2b31b95so4500366276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689584671; x=1692176671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBuZRI7F/H2C0zseA6/qfKbTJuHceDqhSk1/NhSUIjI=;
 b=JO0VSzTL7gj3yDk9UaIG83sIjVF915hh/JQALIFHucBLQ/1Hgd2sF21FX1MCaNlG/S
 CvTwZijApsQZi0uMjof43xq5LVpH5zZ8JLR2/UBh0Y55TBJdGYwogoYVkVN7ailX6zcP
 9K0CZw67ecWB8pfdX4PfWvwtIk8jDNvk0O1qkh+/3FHf/w0FxF2DslQxxe1iddCnBipR
 O8k2Jhd87xV1S/jzl+GUScnjXEO0R/gFlEE9V2OLr2xjugY/jurvltHbcKBM28xk0yC8
 R+uRDpfbXANKHsFmL8aGmJt3VzfBaEeUwbx3obYqcqgxPn/kEdi8mQXq6KzWQ5f+GfUg
 cELw==
X-Gm-Message-State: ABy/qLZlYe7DUnJUbKFSsiXdkj12IKuhHKor/UBwGuLW4jzAVwMCPbd/
 1lUTV1zw0MzfulSarjlLubLVleJ72NVGJg==
X-Google-Smtp-Source: APBJJlEDUroNz9nYOMDFKSzxedo6XpSvCy+eZfup8ukCc/C/cEV9ZuVqMKDlZIzBoph5R5wSii41TQ==
X-Received: by 2002:a25:aab3:0:b0:c74:a36f:671f with SMTP id
 t48-20020a25aab3000000b00c74a36f671fmr12177627ybi.12.1689584671366; 
 Mon, 17 Jul 2023 02:04:31 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 m189-20020a2571c6000000b00c5f4d06fb1asm2940790ybc.59.2023.07.17.02.04.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 02:04:31 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-cada5e4e40cso4513565276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:04:30 -0700 (PDT)
X-Received: by 2002:a25:abc5:0:b0:c24:4536:170c with SMTP id
 v63-20020a25abc5000000b00c244536170cmr12584321ybi.0.1689584670645; Mon, 17
 Jul 2023 02:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
In-Reply-To: <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 11:04:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
Message-ID: <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 17, 2023 at 10:48=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 13.07.23 um 18:32 schrieb Javier Martinez Canillas:
> > Geert reports that the following NULL pointer dereference happens for h=
im
> > after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
> > plane update"):
> >
> >      [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
> >      ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
> >      and format(R1   little-endian (0x20203152))
> >      Unable to handle kernel NULL pointer dereference at virtual addres=
s 00000000
> >      Oops [#1]
> >      CPU: 0 PID: 1 Comm: swapper Not tainted
> >      6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
> >      epc : ssd130x_update_rect.isra.0+0x13c/0x340
> >       ra : ssd130x_update_rect.isra.0+0x2bc/0x340
> >      ...
> >      status: 00000120 badaddr: 00000000 cause: 0000000f
> >      [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
> >      [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x28=
4
> >      [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
> >      [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
> >      [<c02f94fc>] commit_tail+0x190/0x1b8
> >      [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
> >      [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
> >      [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
> >      [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
> >      [<c02cd064>] drm_client_modeset_commit+0x34/0x64
> >      [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
> >      [<c0303424>] drm_fb_helper_set_par+0x38/0x58
> >      [<c027c410>] fbcon_init+0x294/0x534
> >      ...
> >
> > The problem is that fbcon calls fbcon_init() which triggers a DRM modes=
et
> > and this leads to drm_atomic_helper_commit_planes() attempting to commi=
t
> > the atomic state for all planes, even the ones whose CRTC is not enable=
d.
> >
> > Since the primary plane buffer is allocated in the encoder .atomic_enab=
le
> > callback, this happens after that initial modeset commit and leads to t=
he
> > mentioned NULL pointer dereference.
> >
> > Fix this by not using the default drm_atomic_helper_commit_tail() helpe=
r,
> > but instead the drm_atomic_helper_commit_tail_rpm() function that doesn=
't
> > attempt to commit the atomic state for planes related to inactive CRTCs=
.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_=
mode_config_funcs =3D {
> >       .atomic_commit =3D drm_atomic_helper_commit,
> >   };
> >
> > +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_h=
elpers =3D {
> > +     .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > +};
> > +
>
> After some discussion on IRC, I'd suggest to allocate the buffer
> somewhere within probe. So it will always be there when the plane code ru=
ns.
>
> A full fix would be to allocate the buffer memory as part of the plane
> state and/or the plane's atomic_check. That's a bit more complicated if
> you want to shared the buffer memory across plane updates.

Note that actually two buffers are involved: data_array (monochrome,
needed for each update), and buffer (R8, only needed when converting
from XR24 to R1).

For the former, I agree, as it's always needed.
For the latter, I'm afraid it would set a bad example: while allocating
a possibly-unused buffer doesn't hurt for small displays, it would
mean wasting 1 MiB in e.g. the repaper driver (once it has gained
support for R1 ;^).

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
