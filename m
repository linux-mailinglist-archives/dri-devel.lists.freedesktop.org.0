Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484E7635A8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 13:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9D10E45F;
	Wed, 26 Jul 2023 11:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A13010E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:52:52 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-cc4f4351ac7so7241769276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690372371; x=1690977171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPtaMIBhEp1qtmBi548Qk+tYezhqSNhMl5ojZr1tw5E=;
 b=dSEaXwMEgYSR65LulXlp5A3ZeBcMYhvY4kEb89SLi4PJe9PB5o6MA25Efkw64GRjzl
 la1WP3tXzv7YUPZwCiltB4YkV2KCP3635szy7Murocs+FYUOcNJkKRetYh+sTI7I4q6/
 ZZvuKLDef25IekCJfjdp6LdxVJiP1EEXilWgqc7huPidNIE5ZfSN44I+HlMuxYIkX+V2
 QckBpZZolaW5AKJjA2/87lFMLlLqjhuG7964ostc/o1v84vbRJu2zWC6ddY/UwpWxl92
 1nA3WLm34gPw97PxzJT5VQPNEkQbv3muCuIz4YAOo1KFLyTaZLE9dLYN19xxuSw+Mx45
 JICA==
X-Gm-Message-State: ABy/qLbvESYuQuhQi1xOVDOCKglsTrB/tm7O7WvXZ63pDEh6yIAISBr9
 e2I1FrhrcTW22K50UGiVM7xU49q93/PE4g==
X-Google-Smtp-Source: APBJJlG/BHSyJu7Yx/vEgU7JDTie1D+zjMMZn6e7aALVcJZtrucSk2je8woeJpTQNVZTZOVJfV/MuA==
X-Received: by 2002:a25:be0d:0:b0:d15:e204:a7be with SMTP id
 h13-20020a25be0d000000b00d15e204a7bemr1413831ybk.8.1690372370833; 
 Wed, 26 Jul 2023 04:52:50 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 1-20020a250401000000b00d1890dac6a7sm809848ybe.29.2023.07.26.04.52.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 04:52:50 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d0548cf861aso5620302276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:52:50 -0700 (PDT)
X-Received: by 2002:a05:6902:4eb:b0:c3c:8d58:6f15 with SMTP id
 w11-20020a05690204eb00b00c3c8d586f15mr1437165ybs.47.1690372370413; Wed, 26
 Jul 2023 04:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
In-Reply-To: <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jul 2023 13:52:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
Message-ID: <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
To: Maxime Ripard <mripard@kernel.org>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Jul 26, 2023 at 12:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
> > > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_variant=
s[] =3D {
> > >  };
> > >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> > >
> > > +struct ssd130x_plane_state {
> > > +       struct drm_plane_state base;
> > > +       /* Intermediate buffer to convert pixels from XRGB8888 to R1 =
*/
> > > +       u8 *buffer;
> > > +       /* Buffer that contains R1 pixels to be written to the panel =
*/
> > > +       u8 *data_array;
> >
> > The second buffer actually contains pixels in hardware format.
> > For now that is a transposed buffer of R1 pixels, but that will change
> > when you will add support for greyscale displays.
> >
> > So I'd write "hardware format" instead of R1 for both.
> >
> > BTW, I still think data_array should be allocated during probing,
> > as it is related to the hardware, not to a plane.
>
> I somewhat disagree.
>
> If I understood right during our discussion with Javier, the buffer size
> derives from the mode size (height and width).
>
> In KMS, the mode is tied to the KMS state, and thus you can expect the
> mode to change every state commit. So the more logical thing to do is to
> tie the buffer size (and thus the buffer pointer) to the state since
> it's only valid for that particular state for all we know.
>
> Of course, our case is allows use to simplify things since it's a fixed
> mode, but one of Javier's goal with this driver was to provide a good
> example we can refer people to, so I think it's worth keeping.

The second buffer (containing the hardware format) has a size that
depends on the full screen size, not the current mode (I believe that's
also the size of the frame buffer backing the plane?).  So its size is
fixed.

Given the allocations are now done based on plane state, I think the
first buffer should be sized according to the frame buffer backing
the plane? Currently it uses the full screen size, too (cfr. below).

> > > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_dev=
ice *ssd130x)
> > >
> > >         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
> > >
> > > -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNE=
L);
> > > -       if (!ssd130x->buffer)
> > > +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, GFP=
_KERNEL);

Based on full screen width and height.

> > > +       if (!ssd130x_state->buffer)
> > >                 return -ENOMEM;
> > >
> > > -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_KE=
RNEL);
> > > -       if (!ssd130x->data_array) {
> > > -               kfree(ssd130x->buffer);
> > > +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages, =
GFP_KERNEL);

Based on full screen width and height (hardware page size).

> > > +       if (!ssd130x_state->data_array) {
> > > +               kfree(ssd130x_state->buffer);
> >
> > Should ssd130x_state->buffer be reset to NULL here?
> > I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
> > leading to a double free?
>
> That's a good question.
>
> I never really thought of that, but yeah, AFAIK atomic_destroy_state()
> will be called when atomic_check() fails.
>
> Which means that it's probably broken in a lot of drivers.
>
> Also, Javier pointed me to a discussion you had on IRC about using devm
> allocation here. We can't really do that. KMS devices are only freed
> once the last userspace application closes its fd to the device file, so
> you have an unbounded window during which the driver is still callable
> by userspace (and thus can still trigger an atomic commit) but the
> buffer would have been freed for a while.

It should still be safe for (at least) the data_array buffer. That
buffer is only used to store pixels in hardware format, and immediately
send them to the hardware.  If this can be called that late, it will
fail horribly, as you can no longer talk to the hardware at that point
(as ssd130x is an i2c driver, it might actually work; but a DRM driver
 that calls devm_platform_ioremap_resource() will crash when writing
 to its MMIO registers)?!?

> > > +static struct drm_plane_state *ssd130x_primary_plane_duplicate_state=
(struct drm_plane *plane)
> > > +{
> > > +       struct ssd130x_plane_state *old_ssd130x_state;
> > > +       struct ssd130x_plane_state *ssd130x_state;
> > > +
> > > +       if (WARN_ON(!plane->state))
> > > +               return NULL;
> > > +
> > > +       old_ssd130x_state =3D to_ssd130x_plane_state(plane->state);
> > > +       ssd130x_state =3D kmemdup(old_ssd130x_state, sizeof(*ssd130x_=
state), GFP_KERNEL);
> >
> > I know this is the standard pattern, but the "dup" part is a bit
> > silly here:
> >   - The ssd130x-specific parts in ssd130x_plane_state are zeroed below,
> >   - The base part is copied again in
> >     __drm_atomic_helper_plane_duplicate_state).
> > So (for now) you might as well just call kzalloc() ;-)
>
> Still if we ever add a field in the state structure, it will be
> surprising that it's not copied over.
>
> The code is there and looks good to me, so I'd rather keep it.

Fair enough, let's keep it.

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
