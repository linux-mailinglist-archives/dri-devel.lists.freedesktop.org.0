Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D57632FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 12:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2710E450;
	Wed, 26 Jul 2023 10:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F3910E44D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 10:00:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7BCC61A17;
 Wed, 26 Jul 2023 10:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B43C433C7;
 Wed, 26 Jul 2023 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690365601;
 bh=QkLFfIXX7QKXCZKwEwSrlhmVUv0XbDTrkJ+oGtM5Z3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxqYIoKmIkZKpEnvveTEkQAzUt6sKfLUy7MnlkajdbR4uHHciLFYy7CVrGrFfGgmD
 84YYuH4OAELFwnbayttE/g1GmgSDZhjTPBGS/Lb+4SgIJqQIxQPv+ebZXg9PmaNLYz
 DtoeQYPisRr3VcDup8b7c5ROZRaNiSVII/FDwZisOIqb1rw2ioLRq6iS5vyy1AW+NW
 fbWRdOhloWz4BPRqGnDWzVNF4G+tkSNGeDAXbh3kAzF7/hg3Up6IkIHNWdpkZeanjY
 Wlir/Zbly8NIOloEyjQE9bi9ARMIWC3YAC6qjDbBOo4SW+BP31vFY7MlYSFOPSZLAN
 YL2eh8qiqevsQ==
Date: Wed, 26 Jul 2023 11:59:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
Message-ID: <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="33ssxdeultiog556"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
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


--33ssxdeultiog556
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_variants[=
] =3D {
> >  };
> >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> >
> > +struct ssd130x_plane_state {
> > +       struct drm_plane_state base;
> > +       /* Intermediate buffer to convert pixels from XRGB8888 to R1 */
> > +       u8 *buffer;
> > +       /* Buffer that contains R1 pixels to be written to the panel */
> > +       u8 *data_array;
>=20
> The second buffer actually contains pixels in hardware format.
> For now that is a transposed buffer of R1 pixels, but that will change
> when you will add support for greyscale displays.
>=20
> So I'd write "hardware format" instead of R1 for both.
>
> BTW, I still think data_array should be allocated during probing,
> as it is related to the hardware, not to a plane.

I somewhat disagree.

If I understood right during our discussion with Javier, the buffer size
derives from the mode size (height and width).

In KMS, the mode is tied to the KMS state, and thus you can expect the
mode to change every state commit. So the more logical thing to do is to
tie the buffer size (and thus the buffer pointer) to the state since
it's only valid for that particular state for all we know.

Of course, our case is allows use to simplify things since it's a fixed
mode, but one of Javier's goal with this driver was to provide a good
example we can refer people to, so I think it's worth keeping.

> > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_devic=
e *ssd130x)
> >
> >         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
> >
> > -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNEL);
> > -       if (!ssd130x->buffer)
> > +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, GFP_K=
ERNEL);
> > +       if (!ssd130x_state->buffer)
> >                 return -ENOMEM;
> >
> > -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_KERN=
EL);
> > -       if (!ssd130x->data_array) {
> > -               kfree(ssd130x->buffer);
> > +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages, GF=
P_KERNEL);
> > +       if (!ssd130x_state->data_array) {
> > +               kfree(ssd130x_state->buffer);
>=20
> Should ssd130x_state->buffer be reset to NULL here?
> I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
> leading to a double free?

That's a good question.

I never really thought of that, but yeah, AFAIK atomic_destroy_state()
will be called when atomic_check() fails.

Which means that it's probably broken in a lot of drivers.

Also, Javier pointed me to a discussion you had on IRC about using devm
allocation here. We can't really do that. KMS devices are only freed
once the last userspace application closes its fd to the device file, so
you have an unbounded window during which the driver is still callable
by userspace (and thus can still trigger an atomic commit) but the
buffer would have been freed for a while.

The driver could use a bit more work on that area (by adding
drm_dev_enter/drm_dev_exit) but it still creates unnecessary risks to
use devm there.

> > +static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(s=
truct drm_plane *plane)
> > +{
> > +       struct ssd130x_plane_state *old_ssd130x_state;
> > +       struct ssd130x_plane_state *ssd130x_state;
> > +
> > +       if (WARN_ON(!plane->state))
> > +               return NULL;
> > +
> > +       old_ssd130x_state =3D to_ssd130x_plane_state(plane->state);
> > +       ssd130x_state =3D kmemdup(old_ssd130x_state, sizeof(*ssd130x_st=
ate), GFP_KERNEL);
>=20
> I know this is the standard pattern, but the "dup" part is a bit
> silly here:
>   - The ssd130x-specific parts in ssd130x_plane_state are zeroed below,
>   - The base part is copied again in
>     __drm_atomic_helper_plane_duplicate_state).
> So (for now) you might as well just call kzalloc() ;-)

Still if we ever add a field in the state structure, it will be
surprising that it's not copied over.

The code is there and looks good to me, so I'd rather keep it.

--33ssxdeultiog556
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMDumgAKCRDj7w1vZxhR
xcgOAP9rbkUy8jWdFUWoMJgWQmcP2f7Bxf5+j2rMz97lyzqaFQD+KlUaiQmYQxpj
XA/D7Omm1bNzTMaVrtoW/NcGxxU2rww=
=6Jaw
-----END PGP SIGNATURE-----

--33ssxdeultiog556--
