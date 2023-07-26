Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47F7638DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EC910E493;
	Wed, 26 Jul 2023 14:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7FC10E480
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690381022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xfoeVXfBOHJ6xNPRm1lolax9U1GPQkaLoExyQqtoZ4=;
 b=OJ4FAup47eA4ETNTEUUbpCqwCUPEXWkhmnzttFeP0SNOPMlKnlBf0UXsxSNxyn8beg5bmH
 5uDMvDntICiy9Uhl/if6w7FTbIv0C2jobKFb2/fmHuq0PCD0m/ger1qy5oNWU1vLuEK6KH
 J+cm5epPZDPtPE4yJokl3TLKHS88NPk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-tGC63e6OPmuYfi8RYB1twg-1; Wed, 26 Jul 2023 10:17:01 -0400
X-MC-Unique: tGC63e6OPmuYfi8RYB1twg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso3256885f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690381019; x=1690985819;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAuL4+5YqPsFeyK6NrPI2uxMlBvc8rq3rozZsgkt4vE=;
 b=JdN4p6aEHmncL34WsIz+vFZdd5gCFRcgN7gF+KDsT8DCh21659+w40huCcmCaHfBD1
 SZoLL+oC7aFzr7RrZPI43al8N+LUy6m0mivNe+RjkUslb5C/yJWcm/n/FZjpA+HLWsrN
 X01EnyRnPh7QfXwJnbbd1J+PcYaXl9MCVqjS2iiBFBa5ovQm6FVHPEO1fDyCUzP93beW
 47vs/q5aJ6vGGm+gQnSCI8T6ND1x7E4eSDx82e1v5QXp/Vw8r8eb8YK2gOPYN7N6WVkH
 7Xh6n7Up9NBaGgZOPRAyLhPv2R4UogbOcYJHJdyHw/4IC4FOH2AeG9jtjk0AJrYy3+84
 D9og==
X-Gm-Message-State: ABy/qLb6J5ru3/Ccy++wZayn5vgSQ9fhWALAHmmlfBuDbTzA8+iLS7gF
 /5CFwoPWronIZbk8EO/fD4zwB3CfbfM/aEu3TgnVR1JcGAq0HseGNQ0fMlhqOMvzBLlWzVbKIAI
 4JuR3YY5DjFQ71sL6rAogpIJmmjXM
X-Received: by 2002:adf:e4c1:0:b0:317:5d3d:d395 with SMTP id
 v1-20020adfe4c1000000b003175d3dd395mr1531985wrm.26.1690381019101; 
 Wed, 26 Jul 2023 07:16:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGC4/vZeq1fYioQNnewgVjsHgmtCNZsgzPYmCt9bBJfSd8T5JFsElNilbxTC3B9mWVXtiASrQ==
X-Received: by 2002:adf:e4c1:0:b0:317:5d3d:d395 with SMTP id
 v1-20020adfe4c1000000b003175d3dd395mr1531971wrm.26.1690381018778; 
 Wed, 26 Jul 2023 07:16:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfff86000000b0031274a184d5sm19960687wrr.109.2023.07.26.07.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:16:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <ciwm45vwqlzwfywzn55uitsbq4undb7xoau2rbaverra3gyfb3@khr2wdz67d74>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
 <ciwm45vwqlzwfywzn55uitsbq4undb7xoau2rbaverra3gyfb3@khr2wdz67d74>
Date: Wed, 26 Jul 2023 16:16:57 +0200
Message-ID: <87fs5a4v1i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Hi,
>
> On Wed, Jul 26, 2023 at 01:52:37PM +0200, Geert Uytterhoeven wrote:
>> On Wed, Jul 26, 2023 at 12:00=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
>> > On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:

[...]

>> The second buffer (containing the hardware format) has a size that
>> depends on the full screen size, not the current mode (I believe that's
>> also the size of the frame buffer backing the plane?).  So its size is
>> fixed.
>
> In KMS in general, no. For that particular case, yes.
>
> And about the framebuffer size =3D=3D full screen size, there's multiple
> sizes involved. I guess what you call full screen size is the CRTC size.
>
> You can't make the assumption in KMS that CRTC size =3D=3D (primary) plan=
e
> size =3D=3D framebuffer size.
>
> If you're using scaling for example, you will have a framebuffer size
> smaller or larger than it plane size. If you're using cropping, then the
> plane size or framebuffer size will be different from the CRTC size.
> Some ways to work around overscan is also to have a smaller plane size
> than the CRTC size.
>
> You don't have to have the CRTC size =3D=3D primary plane size, and then =
you
> don't have to have plane size =3D=3D framebuffer size.
>
> you can't really make that assumption in the general case either:
> scaling or cropping will have a different framebuffer size than the CRTC
> primary plane size (which doesn't have to be "full screen" either).
>

Yes, this particular driver is using the drm_plane_helper_atomic_check()
as the primary plane .atomic_check and this function helper calls to:

drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
=09=09=09=09=09=09   DRM_PLANE_NO_SCALING,
=09=09=09=09=09=09   DRM_PLANE_NO_SCALING,
=09=09=09=09=09=09   false, false);

so it does not support scaling nor positioning.

>> Given the allocations are now done based on plane state, I think the
>> first buffer should be sized according to the frame buffer backing
>> the plane? Currently it uses the full screen size, too (cfr. below).
>
> Yeah, probably.
>

Right, that could be fixed as another patch if anything to make it more
reable since it won't have any functional change.

>> > > > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_=
device *ssd130x)
>> > > >
>> > > >         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width)=
;
>> > > >
>> > > > -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KE=
RNEL);
>> > > > -       if (!ssd130x->buffer)
>> > > > +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, =
GFP_KERNEL);
>>=20
>> Based on full screen width and height.
>>=20
>> > > > +       if (!ssd130x_state->buffer)
>> > > >                 return -ENOMEM;
>> > > >
>> > > > -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP=
_KERNEL);
>> > > > -       if (!ssd130x->data_array) {
>> > > > -               kfree(ssd130x->buffer);
>> > > > +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, page=
s, GFP_KERNEL);
>>=20
>> Based on full screen width and height (hardware page size).
>>=20
>> > > > +       if (!ssd130x_state->data_array) {
>> > > > +               kfree(ssd130x_state->buffer);
>> > >
>> > > Should ssd130x_state->buffer be reset to NULL here?
>> > > I.e. if .atomic_check() fails, will .atomic_destroy_state() be calle=
d,
>> > > leading to a double free?
>> >
>> > That's a good question.
>> >
>> > I never really thought of that, but yeah, AFAIK atomic_destroy_state()
>> > will be called when atomic_check() fails.
>> >
>> > Which means that it's probably broken in a lot of drivers.
>> >
>> > Also, Javier pointed me to a discussion you had on IRC about using dev=
m
>> > allocation here. We can't really do that. KMS devices are only freed
>> > once the last userspace application closes its fd to the device file, =
so
>> > you have an unbounded window during which the driver is still callable
>> > by userspace (and thus can still trigger an atomic commit) but the
>> > buffer would have been freed for a while.
>>=20
>> It should still be safe for (at least) the data_array buffer. That
>> buffer is only used to store pixels in hardware format, and immediately
>> send them to the hardware.  If this can be called that late, it will
>> fail horribly, as you can no longer talk to the hardware at that point
>> (as ssd130x is an i2c driver, it might actually work; but a DRM driver
>>  that calls devm_platform_ioremap_resource() will crash when writing
>>  to its MMIO registers)?!?
>
> Yep, that's exactly why we have drm_dev_enter/drm_dev_exit :)
>

Thanks. As a follow-up I can also do that in another patch.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

