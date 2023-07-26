Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24785763663
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435A10E46D;
	Wed, 26 Jul 2023 12:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70D10E46D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:33:20 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-583f036d50bso41301417b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690374799; x=1690979599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LHJHUg6BbctGmVEztBEPwgY6VD1uKA+BUZbOC1niEM=;
 b=dFxe3ploy0b6T5IHX9RF8gBR4Hq15b7/7KLIR0RLunlnHg/OCIDi08G3OKxzE4Amf6
 oJS6blwF9eWTMIs7r7+O3pyt99EsmXLVUFKtoP3DlacGwKZJKa/hDV9RUrD6R2SfZmPL
 zDOggEDakyesrqtBkKvSIG3jXG3w7FMO25rqgbpcmwEieWxp55d9jN519cZrmACsR/ku
 1c5XoKAVAJLHuJZjCHE90kxs7Viluf3hR439HRiWGNKWNBbfvSwsslZjCLgbXwKzlyuI
 jNyGfO/YmABQbIskSMNAIOOCEzZKBgwWIGcRfuMq6+FwGAjyEfeqYP0VK9kD2z3mSfan
 iKpQ==
X-Gm-Message-State: ABy/qLZrN0UdkcKL414ZtnqHLXNCf5OsPc4culS+rFZHGSOl/ymd4EI1
 9/kdkqD9TYSkkQNycEQUjSiuhRn+E5T/rQ==
X-Google-Smtp-Source: APBJJlFSJbJ+P4mN933tyqXVEm3vhTftveuDroePeunl/b3YrVNurbTuY/didff0CJ1UV3sAtnSlvg==
X-Received: by 2002:a81:6743:0:b0:56f:eaef:9d40 with SMTP id
 b64-20020a816743000000b0056feaef9d40mr2129714ywc.46.1690374799072; 
 Wed, 26 Jul 2023 05:33:19 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 d123-20020a0ddb81000000b00570589c5aedsm4157335ywe.7.2023.07.26.05.33.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 05:33:18 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so7363780276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:33:18 -0700 (PDT)
X-Received: by 2002:a25:9c08:0:b0:c76:173c:6718 with SMTP id
 c8-20020a259c08000000b00c76173c6718mr1840007ybo.1.1690374798490; Wed, 26 Jul
 2023 05:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
 <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jul 2023 14:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
Message-ID: <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
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

On Wed, Jul 26, 2023 at 2:22=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Wed, Jul 26, 2023 at 12:00=E2=80=AFPM Maxime Ripard <mripard@kernel.=
org> wrote:
> >> On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
> >> > > --- a/drivers/gpu/drm/solomon/ssd130x.c
> >> > > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> >> > > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_vari=
ants[] =3D {
> >> > >  };
> >> > >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> >> > >
> >> > > +struct ssd130x_plane_state {
> >> > > +       struct drm_plane_state base;
> >> > > +       /* Intermediate buffer to convert pixels from XRGB8888 to =
R1 */
> >> > > +       u8 *buffer;
> >> > > +       /* Buffer that contains R1 pixels to be written to the pan=
el */
> >> > > +       u8 *data_array;
> >> >
> >> > The second buffer actually contains pixels in hardware format.
> >> > For now that is a transposed buffer of R1 pixels, but that will chan=
ge
> >> > when you will add support for greyscale displays.
> >> >
> >> > So I'd write "hardware format" instead of R1 for both.
> >> >
> >> > BTW, I still think data_array should be allocated during probing,
> >> > as it is related to the hardware, not to a plane.
> >>
> >> I somewhat disagree.
> >>
> >> If I understood right during our discussion with Javier, the buffer si=
ze
> >> derives from the mode size (height and width).
> >>
> >> In KMS, the mode is tied to the KMS state, and thus you can expect the
> >> mode to change every state commit. So the more logical thing to do is =
to
> >> tie the buffer size (and thus the buffer pointer) to the state since
> >> it's only valid for that particular state for all we know.
> >>
> >> Of course, our case is allows use to simplify things since it's a fixe=
d
> >> mode, but one of Javier's goal with this driver was to provide a good
> >> example we can refer people to, so I think it's worth keeping.
> >
> > The second buffer (containing the hardware format) has a size that
> > depends on the full screen size, not the current mode (I believe that's
> > also the size of the frame buffer backing the plane?).  So its size is
> > fixed.
> >
>
> Yes, is fixed. But Maxime's point is that this is a characteristic of thi=
s
> particular device and even when the display resolution can't be changed,
> the correct thing to do is to keep all state related to the mode (even th=
e
> buffer used to store the hardware pixels that are written to the display)
>
> > Given the allocations are now done based on plane state, I think the
> > first buffer should be sized according to the frame buffer backing
> > the plane? Currently it uses the full screen size, too (cfr. below).
> >
>
> But can the mode even be changed if ssd130x_connector_helper_get_modes()
> just adds a single display mode with mode->hdisplay =3D=3D ssd130x->width=
 and
> mode->vdisplay =3D=3D ssd130x->height.

No, the mode cannot be changed.

At first, I thought you could still create a smaller frame buffer,
and attach that to the (single, thus primary) plane, but it turns out
I was wrong[*], so you can ignore that.

[*] ssd130x_primary_plane_helper_atomic_check() calls
    drm_plane_helper_atomic_check(), which calls
    drm_atomic_helper_check_plane_state() with can_position =3D false.
    As the position of planes is actually a software thing on ssd130x,
    positioning support could be added later, though...

> >> Also, Javier pointed me to a discussion you had on IRC about using dev=
m
> >> allocation here. We can't really do that. KMS devices are only freed
> >> once the last userspace application closes its fd to the device file, =
so
> >> you have an unbounded window during which the driver is still callable
> >> by userspace (and thus can still trigger an atomic commit) but the
> >> buffer would have been freed for a while.
> >
> > It should still be safe for (at least) the data_array buffer. That
> > buffer is only used to store pixels in hardware format, and immediately
> > send them to the hardware.  If this can be called that late, it will
> > fail horribly, as you can no longer talk to the hardware at that point
> > (as ssd130x is an i2c driver, it might actually work; but a DRM driver
> >  that calls devm_platform_ioremap_resource() will crash when writing
> >  to its MMIO registers)?!?
>
> At the very least the SPI driver will fail since the GPIO that is used to
> toggle the D/C pin is allocated with devm_gpiod_get_optional(), but also
> the regulator, backlight device, etc.
>
> But in any case, as mentioned it is only relevant if the data_array buffe=
r
> is allocated at probe time, and from Maxime's explanation is more correct
> to do it in the .atomic_check handler.

You need (at least) data_array for clear_screen, too, which is called
from .atomic_disable().

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
