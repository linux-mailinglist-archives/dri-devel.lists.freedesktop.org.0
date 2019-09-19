Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D1BB741E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5096EC9B;
	Thu, 19 Sep 2019 07:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95F6EC9B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:34:20 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x80so1595398lff.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 00:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=WVg0L4KY+NETuPAk7OLf4073AcExpvb9Y5kLaMRVg9g=;
 b=gJfW2dp8U02MyWb52l6gXb0T1yU69/cAF8rzbcTDstn9lyzeRWHd65QISW72Xnifqn
 gsRD1Dbj+YkmCY5d6c4HBnR9Y/A/o7IjH78tugSma7IHGaExsck1YfD6Cv6VjiYU44cb
 mhowy51P2J/RdJuvCaeXVj4iKbj+htwZmbxbCOa6DmcERdWpxL68FDwZ7U6kvH1t5MIq
 REDBrje5CbUG4N3xZEjZ+PsuAmvCsujv+/a3UsYsv9hkD2LW3p6VV1qkqwtDxWCMqs+m
 CkLKpbS4brWVMfj+ePnB50BblwjVwA2/kA3HXNgHZ0b8F6k/2ifyHhOEcIHbebanLCzo
 APZg==
X-Gm-Message-State: APjAAAV+0AoRigU7qZatnsbHnuFGXnU7mfzkCoVqqe0jSAiPm7DTMjHI
 XmoG7TQxnIkg07frZXNsMtY=
X-Google-Smtp-Source: APXvYqyoEaHNFRnNvPNPSTjVPrelvA7/CNqin8y3esF45JT/obK2Imcyk85z+OISj9RLO5A7pKoHmQ==
X-Received: by 2002:a19:5f55:: with SMTP id a21mr4502894lfj.56.1568878458405; 
 Thu, 19 Sep 2019 00:34:18 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x76sm1678691ljb.81.2019.09.19.00.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 00:34:18 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:34:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm: two planes with the same zpos have undefined
 ordering
Message-ID: <20190919103414.08f81fda@eldfell.localdomain>
In-Reply-To: <WHzXxgNIkxb4Mn1hdeAAwutlt0P-G2onwFr4FpA083VEVh1nIcstHOBRataUD7skpgtWd7BMDPF4v0GHJmQcLrnicVF1hpaUz_5WeSBUTWk=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
 <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
 <CAKMK7uG1uXU5sO81VCN7zeNn62D-JHEW1QSSoJ695AULGt3zSQ@mail.gmail.com>
 <WHzXxgNIkxb4Mn1hdeAAwutlt0P-G2onwFr4FpA083VEVh1nIcstHOBRataUD7skpgtWd7BMDPF4v0GHJmQcLrnicVF1hpaUz_5WeSBUTWk=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=WVg0L4KY+NETuPAk7OLf4073AcExpvb9Y5kLaMRVg9g=;
 b=IPg+mHvHBmz9AZONVOtWuC5tg83adVUTh3aYJGMWiMHFQnJbLbeQSciyxxj2E3+0kI
 /PRxUWl8ELNHqqrx6ORQM3/TCdl8bZdWx7sm3XIinSJHCxcQHue5bekVkFwKs0hA0y+F
 j5shOIkJZNyZzpSUjeWWW7pM0KXjdgbA1O2P/JiDQ7T9J3IaXZ9McskO9hZVLc61eIVu
 63H0Xe6EtOQno75t5q9CmG31wpCgifu9m6W7wkV2BRIVqPNOdoEsRqOF6aeJPLWKd423
 vAjB5j4pRYEjvHLCuDPT3sGjJibJIPalEXWv3VI4LJtUpDJiO/OZ+GP6FVjSDME8NUIJ
 9W9A==
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
Content-Type: multipart/mixed; boundary="===============0229338350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0229338350==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GR4m.VYohElHLB_djicxg3c"; protocol="application/pgp-signature"

--Sig_/GR4m.VYohElHLB_djicxg3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Sep 2019 16:33:47 +0000
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
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Marius Vlad <marius.vlad@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c | 8 ++++----
>  include/drm/drm_plane.h     | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
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

Hi,

the above looks good to me.

>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_property(=
).
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index cd5903ad33f7..7ac68057b19d 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -141,9 +141,9 @@ struct drm_plane_state {
>  	 * Priority of the given plane on crtc (optional).
>  	 *
>  	 * Note that multiple active planes on the same crtc can have an
> -	 * identical zpos value. The rule to solving the conflict is to compare
> -	 * the plane object IDs; the plane with a higher ID must be stacked on
> -	 * top of a plane with a lower ID.
> +	 * identical zpos value. To solve the conflict, the recommendation to
> +	 * drivers to avoid surprises is to compare the plane object IDs; the
> +	 * plane with a higher ID is stacked on top of a plane with a lower ID.

While better, I think this would need a less subtle clarification:

+ "Userspace should never rely on stacking order derived from IDs."

Oh, I think I realised it only now. This comment is for the drivers to
handle a case where userspace is being stupid and assigns mutable zpos
properties with duplicate values, right?

It does *not* allow drivers themselves to assign duplicate zpos values.
So I've been looking at this from the wrong angle.

Maybe it should just say that then?

Instead of:

	"Note that multiple active planes on the same crtc can have an
	identical zpos value. The rule to solving the conflict is to
	compare the plane object IDs;"

The paragraph could start with:

	"Userspace may set mutable zpos properties so that multiple
	active planes on the same crtc have identical zpos value. This
	is a userspace bug, but drivers can solve the conflict
	deterministically by comparing the plane object IDs;"


Thanks,
pq

>  	 *
>  	 * See drm_plane_create_zpos_property() and
>  	 * drm_plane_create_zpos_immutable_property() for more details.
> --
> 2.23.0
>=20
>=20


--Sig_/GR4m.VYohElHLB_djicxg3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2DL3YACgkQI1/ltBGq
qqfE8Q/5ASD2FPprvH7B64pD8JTerq/YAHEfjLt7JdfUVbdP5pSe+TvT4AoxuyHL
lT9y+Rlw+nYSZd9t3R2Wnbtub1pA/8pH7U4fh6URCCCG5ngwd0pu26DGBgeyyY0R
vUpBc4Mjdcnj3PqB9lxk6DplJgS9PElKZ/bnFZlN4EZZb0H9G9K31QEq3d/xfI3M
zLQUMLXgP4o2RXJnPn8vZnJJ0BR7HDyo5mWX5VJ4JfzD7ELK3LdB+zHPTuAqdY3N
FJYtAghQzl09+Zhcq0NredEXW2YGYHXAprHoAPF0a2MbNclObZ4au4KjTR8f/L0T
/xs53sJ2t1IfUUZzszxoiUnU8gcNqGMMtt9gDrpwx3v9k20x5SCvBXFOvu9EZWYC
JokMHubJFgvBg1h6w1S3XOfnZSMc6rQt0Ooqze4z0bgF2L7649lectHk6QHppGIK
S5QnpMUnb8MrJDfmnWoD/6HnsvQ+fO/C7dLC8Fr679zSpKPDYp9CKxwaVwEz9elw
QimFzBsrAyhav0VEYupaVykmW3ufqUtPLeUTVS2iLFJGqck57ePMbTiKHQ+AgHdI
tbwx44Xk2hPqqxIm4GDNKR8+oabW6W5syrmCtAU/dGx5utedyCvgd80EicX6L4f7
YujV/R20tbOInNnq5RFtZmUaD+LLhKghqdL1EXr6PNz1NeI4z4Y=
=mAH6
-----END PGP SIGNATURE-----

--Sig_/GR4m.VYohElHLB_djicxg3c--

--===============0229338350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0229338350==--
