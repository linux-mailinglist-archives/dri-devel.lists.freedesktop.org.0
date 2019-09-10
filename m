Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED95AE848
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 12:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B036E8B2;
	Tue, 10 Sep 2019 10:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69F6E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 10:38:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h2so9384216ljk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 03:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=WKirQEasQ2U2paLa4+4mHfae8agPz9B2HqahuZg12IE=;
 b=ocAhCBPaUPJL2vogPMTMPN1ua+56VPll5fb1wlKe8T1n2CH13I1HywosIJiVYUlxv+
 9eDF0rnxgIk9JvvGrG+4iEraZBCPTs1oV8BDTcnbCh/6EhVemD4gq+y+ZpJmXTgu2oSw
 SAuQl5i8YWU3ssx2rnalTkHHaTPGYNwo/u8rgPnSLCXdcyMYjUEURYUj20BqZrlRQm8j
 fUmGrEFy4dV5GwO3sdfY72mAIQe7NwQ3za4OrwSwlsVYx+XxMpScy2ZxjmfrBSwKdN5T
 hlsOvzzC0Vu0HExMpfSBrtFWBA4FucSlhfZhBCtLTS/b5ZFHxXLHnBXOFx+mSjCqKFAr
 kdtg==
X-Gm-Message-State: APjAAAX0iWmGYIn8LZQjXzNyrqxHD4x7BUHb0LqUcZvIQJ738NUOf6z9
 lhN/cO3XxbMOzjvYwW1Ws7I=
X-Google-Smtp-Source: APXvYqygJav1qGcEoaF4YArHmxDRB740R9TUhHrbxttWet/Iwy3l0rQe8WC3yP1tluZrASdWdf4udA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr19036345ljk.201.1568111900145; 
 Tue, 10 Sep 2019 03:38:20 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r22sm3752953ljr.43.2019.09.10.03.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 03:38:19 -0700 (PDT)
Date: Tue, 10 Sep 2019 13:38:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: two planes with the same zpos have undefined ordering
Message-ID: <20190910133810.64e973f4@eldfell.localdomain>
In-Reply-To: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=WKirQEasQ2U2paLa4+4mHfae8agPz9B2HqahuZg12IE=;
 b=E3xrJOKncUtjAY9NaG2iy/7ckK5SV+OnV28xTibYkLFmv883sEZVZsXTmBsU2GpAi3
 jdMGqzogDp4jmJ/I5PDHaFmtZ5HlfDgjNrXRI2NAz0IYUhD1SEc9/amzI6CoG+2RjFGO
 Y2sBigN7TbpLGBJxbprUJuOfh96AhhVd3NaCWmYtBLKIUgHqD+rl52C2ZCMaa2P7cnGM
 tyy4OkLEGMqFxHOmm88GeNS3CxkA/KmuDRezgUxNq/yCGxKYdM1rKLctbp+razkZh8wG
 DvQFp3WsRa6oHRrSn+d3c0t37iBiJ8wmhq1b7D6aqe0K1l3qEDHlZeEVNTnIxZWeB0KA
 BbmQ==
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
Cc: daniel.vetter@ffwll.ch, daniels@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2026983682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2026983682==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//gtCSdyY62X5MQU2H4TNP5j"; protocol="application/pgp-signature"

--Sig_//gtCSdyY62X5MQU2H4TNP5j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Sep 2019 10:09:55 +0000
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
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>=20
> Err, I'm sorry about the double-post. I sent this to intel-gfx by mistake.
>=20
>  drivers/gpu/drm/drm_blend.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d02709dd2d4a..51bd5454e50a 100644
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
> + *	stacking of overlay planes, see drm_plane_create_zpos_immutable_prope=
rty().
>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_property(=
).

Hi,

this seems to contradict what the docs say in another place:

zpos

    Priority of the given plane on crtc (optional).

    Note that multiple active planes on the same crtc can have an
    identical zpos value. The rule to solving the conflict is to
    compare the plane object IDs; the plane with a higher ID must be
    stacked on top of a plane with a lower ID.

    See drm_plane_create_zpos_property() and
    drm_plane_create_zpos_immutable_property() for more details.

from https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-funct=
ions-reference


Thanks,
pq

--Sig_//gtCSdyY62X5MQU2H4TNP5j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl13fRIACgkQI1/ltBGq
qqfvNg/8Cqph//kCT2wciQJpUTo5IGWulqSPsx6erRI1cTLfozPpo2+Srm5JOc2v
Sm2DerETOl6X8HsU0tQ5Eo6jlesEuYxQ3Rb22dLw9pb+X0+ZR4gWwID56FSQoCD6
uXJmJR8JF9gdYJmS4VF/CNzw+bSHl9YdZEXP/m6wrLhtWMRYOm+x7bIlH/xsAXYp
17ev71E/uDJuZKPEF4OPELCSg+ClMZuec6/xlNW/R8eAZnlvoWQD4/qTKPh6ZLbt
5dhg9u+OAjvex+2HJRbu+3LZZY0GGrZqiy0M1nTjtBHknxiVPuYY3yKiGMWVSJnv
dieYi3gyrL6cgbNGszSElZLIWDu+ffR048cHS0Ed8JYR81OkKCTbnEpokhezj5Fl
esUzQSkjXWubMXCzocZBho0NdEMmPM2X2OaTuXA2NA8vBU7bpxVZ5sO/f4s+Oli6
BoS42vscgNBT1pO3KQTih3BxmdsxN5I1X15rKgr7PCFTRaYOUGTxMJoL0j04Il9C
eVgMHcmxguU05DaNtRDRvkfEUqvaPpDkivJPa4jeR/RBG956lBkG52iB1bUVYwBV
8HZ82q/t2OrF+JQl6Ry/nC/W2jNO9dmmGIDeVbvzxV42MYT8fOYNPl1RfNGW9eoV
VTriWvcQkrJkOPDlWu2nRVnXJYBj/mdd9lfN2yQswEeWloIlUXs=
=7hXS
-----END PGP SIGNATURE-----

--Sig_//gtCSdyY62X5MQU2H4TNP5j--

--===============2026983682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2026983682==--
