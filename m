Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA2BC290
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20D46E9E2;
	Tue, 24 Sep 2019 07:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2697C6E9E2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:26:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m7so798353lji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 00:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ahjgYf9GvxGfM5rnd96adz8/ao4fB/ggP+x4N4uf16M=;
 b=Sr+m/ZGMiUWKDaAhuTEvHT3N5iNes1FBMZSd/5pKYnKoHxkt0sxS5OT9rHSwA+Y9Jz
 YjKHXDWpb86A54EIeJN3HkhAJvtjl4Mmt8foauXF+A056gwg6IBnfljqKCcb5ADIHvms
 Flv7mIjiDLSnq3z2VRaxtNpdWk/4E6Ukj+VpL0ghbJld2B46/XAFVM0q/DSaQsYdEs0S
 es//VcXmZm+Hs199+8Y6JlU9D4FquhN7l9VEq5OScp6zECtoWudNQXPGREIEx5ujnTCf
 ZRvVm6ayHbkROsHkC3S3Kdt0GrswE45PoKTzX0zM45daPmOw350wwQ5wkxfno8tmm/OY
 wDTQ==
X-Gm-Message-State: APjAAAW7bzYgqYQcDBk0HrXcE6jqGb9BN97QYsaJv2HnMmokOjqO11bT
 HIhpY3iXq4gDaTd+v3FRoDM=
X-Google-Smtp-Source: APXvYqxLkSuJALN9ETw/F7zBsNNWDo36XyaN3egEh5l44tGA2yml98oCXohbo1r9V9G/oA2L6HE15Q==
X-Received: by 2002:a2e:87c8:: with SMTP id v8mr1003221ljj.24.1569310009433;
 Tue, 24 Sep 2019 00:26:49 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q5sm261216lfm.93.2019.09.24.00.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 00:26:48 -0700 (PDT)
Date: Tue, 24 Sep 2019 10:26:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] drm: two planes with the same zpos have undefined
 ordering
Message-ID: <20190924102639.6d8a334b@eldfell.localdomain>
In-Reply-To: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
 <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
 <CAKMK7uG1uXU5sO81VCN7zeNn62D-JHEW1QSSoJ695AULGt3zSQ@mail.gmail.com>
 <WHzXxgNIkxb4Mn1hdeAAwutlt0P-G2onwFr4FpA083VEVh1nIcstHOBRataUD7skpgtWd7BMDPF4v0GHJmQcLrnicVF1hpaUz_5WeSBUTWk=@emersion.fr>
 <20190919103414.08f81fda@eldfell.localdomain>
 <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=ahjgYf9GvxGfM5rnd96adz8/ao4fB/ggP+x4N4uf16M=;
 b=Lh34RNfV+y62kbzR+20vcPkg+C4jT8WTbk/W09ydVHioWYuLJk0KR005v4ECT1ETnL
 4PXtaNX2RkZa6ffKfugjcjJezCoAggIJvgCPu7dMlFzfy5WTurBLrVF5GX38InCGfrsS
 VhJyF3XM0FjMYG7zRGxkwukHaJiBsJUAmWpCYgJ8+IFfsx6tjLcKlcSpzQaMeOuJRkP4
 gib3VIia8a5jkfsIkbClEY8nAlqIfcshyeW32gTIqaaf70cXvs1h3gwERWo1G0P+45K5
 jiQeXQn3mZEG8yIcKbejy6gagpuweNic8bPKaR+mVB281M2YSbWqkRwk3oARFSsgGeKZ
 lJEg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0603403316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0603403316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JPDSRvR7zsOY3lDJotB0/0V"; protocol="application/pgp-signature"

--Sig_/JPDSRvR7zsOY3lDJotB0/0V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Sep 2019 12:39:20 +0000
Simon Ser <contact@emersion.fr> wrote:

> Currently the property docs don't specify whether it's okay for two plane=
s to
> have the same zpos value and what user-space should expect in this case.
>=20
> The rule mentionned in the past was to disambiguate with object IDs. Howe=
ver
> some drivers break this rule (that's why the ordering is documented as
> unspecified in case the zpos property is missing). Additionally it doesn't
> really make sense for a driver to user identical zpos values if it knows =
their
> relative position: the driver can just pick different values instead.
>=20
> So two solutions would make sense: either disallow completely identical z=
pos
> values for two different planes, either make the ordering unspecified. To=
 allow
> drivers that don't know the relative ordering between two planes to still
> expose the zpos property, choose the latter solution.

Hi Simon,

the commit message still talks about the drivers only, and I think that
is what lead me astray in the first place until I realized the
duplicate zpos value issue concerns only stupid userspace, not that
drivers were allowed to use duplicate zpos values which userspace then
needs to untangle with ID ordering. Drivers never have undefined plane
ordering themselves - if they do, that's a broken driver that doesn't
know what hardware it is driving. If the driver doesn't know, then
userspace definitely cannot know any better - if some userspace does,
that's a gfx driver stack misdesign. So there is no reason for a driver
to use ambiguous zpos values.

Anyway, it's fine. The actual doc below is what matters here.

>=20
> While at it, remove the assumption that zpos is only for overlay planes.
>=20
> Additionally, update the drm_plane_state.zpos docs to clarify that zpos
> disambiguation via plane object IDs is a recommendation for drivers, not
> something user-space can rely on.
>=20
> v2: clarify drm_plane_state.zpos docs (Daniel)
>=20
> v3: zpos is for all planes (Marius, Daniel)
>=20
> v4: completely reword the drm_plane_state.zpos docs to make it clear the
> recommendation to use plane IDs is for drivers in case user-space uses
> duplicate zpos values (Pekka)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Marius Vlad <marius.vlad@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 8 ++++----
>  include/drm/drm_plane.h     | 9 +++++----
>  2 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d02709dd2d4a..121481f6aa71 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -132,10 +132,10 @@
>   *	planes. Without this property the primary plane is always below the c=
ursor
>   *	plane, and ordering between all other planes is undefined. The positi=
ve
>   *	Z axis points towards the user, i.e. planes with lower Z position val=
ues
> - *	are underneath planes with higher Z position values. Note that the Z
> - *	position value can also be immutable, to inform userspace about the
> - *	hard-coded stacking of overlay planes, see
> - *	drm_plane_create_zpos_immutable_property().
> + *	are underneath planes with higher Z position values. Two planes with =
the
> + *	same Z position value have undefined ordering. Note that the Z positi=
on
> + *	value can also be immutable, to inform userspace about the hard-coded
> + *	stacking of planes, see drm_plane_create_zpos_immutable_property().
>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_property(=
).
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index cd5903ad33f7..328773690851 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -140,10 +140,11 @@ struct drm_plane_state {
>  	 * @zpos:
>  	 * Priority of the given plane on crtc (optional).
>  	 *
> -	 * Note that multiple active planes on the same crtc can have an
> -	 * identical zpos value. The rule to solving the conflict is to compare
> -	 * the plane object IDs; the plane with a higher ID must be stacked on
> -	 * top of a plane with a lower ID.
> +	 * User-space may set mutable zpos properties so that multiple active
> +	 * planes on the same CRTC have identical zpos values. This is a
> +	 * user-space bug, but drivers can solve the conflict by comparing the
> +	 * plane object IDs; the plane with a higher ID is stacked on top of a
> +	 * plane with a lower ID.
>  	 *
>  	 * See drm_plane_create_zpos_property() and
>  	 * drm_plane_create_zpos_immutable_property() for more details.
> --
> 2.23.0

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/JPDSRvR7zsOY3lDJotB0/0V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2JxS8ACgkQI1/ltBGq
qqfjEw//f5NInhhb6celHM5+F+h9II510PHDVNFWP1GnIl+fBWg0qo70T3Zh49Ay
Xoz0+TJd33D2IDrVyF2ZtHvuVI2nUif8ABXpohfLKos0edW6BGXOOks6ZONSydBR
/k8v4HN5XwmTvreWeUHi5hN1jrg6jkvCZsfSZFlNCKOnXmYWTZr+amt1qnW+/xnP
3uPtK3bsXMDjnEUg+QV6z3kIQCp83yIC9i5oPFP2efuumaz9RZCt2XERWENusoTH
HIgwyzUXISCJC51MNafCsJE+9DUxIS8h+fgozhdjCa3qeaicz5yEBjjsv5xnSGrx
mhrmAbooRLWD8J5CJQSTxv7zLmWGa4DN/3Cgjki1D0CUbmlThgtx3th1CzlSrrUA
gB5i49iIHbWHap0/KM2+46RTjjoGNLkN4Ad4AAXmHtbKli+JR+O/myJJw5Qo0A0l
mZ+b7y4PFbRrcHlA1jytAuJ4eXVltBSjAaupvzAnv8lLobFaIg5zpfRC50fFXj2/
O38Kd2Vkpi1QLudqetykWlBCweghl4abU0c+epJDcA0V9Iu5cIrnfjbYNXjMxo/7
ReH96KYJCVpo1yi09R1K+G0W5b4kDI5j3NZsf/s9mVxbQ6dcVssekwxKD9nGAhVR
oIgzE+JZ3+Qy9pWTqg7zohy01DAC/JmLYuIHprKrIlvAdpHLN5c=
=CD/y
-----END PGP SIGNATURE-----

--Sig_/JPDSRvR7zsOY3lDJotB0/0V--

--===============0603403316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0603403316==--
