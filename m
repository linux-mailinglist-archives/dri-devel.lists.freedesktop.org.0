Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7287C06B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2257110F486;
	Thu, 14 Mar 2024 15:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TczOxxB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5B10F486;
 Thu, 14 Mar 2024 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710430595;
 bh=QX+7qSR8qbS3NbGcqoa/9nM94Jmg78tNOrKERGsp4wI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TczOxxB9Sb87m3f8+Xi7PtL7Vj7ThDOduyZPiA8StoUGlYKHvVPJ6rsY5VaRZjqRp
 CdRouQOBFH23EedZq+guvX11Z4+rTEvEBRb4Tl7IeeV1jj7FuCHNvu080S+4sxwwkS
 ohgk4Syd8OwenXdbLoNeLnjP8vkhVXt0zgku4HUya7SrjEoTutkCZhtttra6REehni
 SxXmoQePG+qSx5xBHX4lCKPfDyMe3mzoF7/5t7qBEvwaOYrj/UmcoS0lcbD9JE6HVk
 3/COqW4AcLraYW7YwniGL2YIVFa1Ub0m7k8S4W9RQMBN8e2BepJqidy9WqeQU7TOSM
 hfBnancG/dmMg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 780E437820F5;
 Thu, 14 Mar 2024 15:36:35 +0000 (UTC)
Date: Thu, 14 Mar 2024 17:36:34 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 24/42] drm/tests: Add a few tests around drm_fixed.h
Message-ID: <20240314173634.743be67a.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-25-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-25-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zpAeDeeK6W8Kkey9FfQ2AyH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/zpAeDeeK6W8Kkey9FfQ2AyH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:38 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> While working on the CTM implementation of VKMS I had to ascertain
> myself of a few assumptions. One of those is whether drm_fixed.h
> treats its numbers using signed-magnitude or twos-complement. It is
> twos-complement.
>=20
> In order to make someone else's day easier I am adding the
> drm_test_int2fixp test that validates the above assumption.
>=20
> I am also adding a test for the new sm2fixp function that converts
> from a signed-magnitude fixed point to the twos-complement fixed
> point.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/tests/Makefile        |  3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c | 69 +++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>=20
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> index d6183b3d7688..98468f7908dd 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o	\
> +	drm_fixp_test.o
> =20
>  CFLAGS_drm_mm_test.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/test=
s/drm_fixp_test.c
> new file mode 100644
> index 000000000000..f420f173ff66
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_fixp_test.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#include <kunit/test.h>
> +#include <drm/drm_fixed.h>
> +
> +static void drm_test_sm2fixp(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
> +
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_PO=
INT));

This sounds like confusing two different APIs.

DRM_FIXED_POINT is for the two's complement representation, and sm is
not.

It does not look like there is a #define for the signed-magnitude UAPI
construct, otherwise drm_color_ctm_s31_32_to_qm_n() would be using it.

It's just an accident that DRM_FIXED_POINT has the right value for sm.

Hm, drm_color_ctm_s31_32_to_qm_n() produces two's complement. Why not
use that for implementing drm_sm2fixp()?


Thanks,
pq

> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ul=
l << DRM_FIXED_POINT)));
> +
> +	/* 0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull <<=
 (DRM_FIXED_POINT - 1)));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull =
<< 63) | (1ull << (DRM_FIXED_POINT - 1))));
> +
> +}
> +
> +static void drm_test_int2fixp(struct kunit *test)
> +{
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
> +
> +	/* 1 + (-1) =3D 0 */
> +	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
> +
> +	/* 1 / 2 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
> +
> +	/* (1 / 2) + (-1) =3D 0.5 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_in=
t2fixp(1));
> +
> +	/* (1 / 2) - 1) =3D 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_=
int2fixp(-1));
> +
> +	/* (1 / 2) - 1) =3D 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_=
int2fixp(1));
> +
> +}
> +
> +static struct kunit_case drm_fixp_tests[] =3D {
> +	KUNIT_CASE(drm_test_int2fixp),
> +	KUNIT_CASE(drm_test_sm2fixp),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_rect_test_suite =3D {
> +	.name =3D "drm_fixp",
> +	.test_cases =3D drm_fixp_tests,
> +};
> +
> +kunit_test_suite(drm_rect_test_suite);
> +
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");
> \ No newline at end of file


--Sig_/zpAeDeeK6W8Kkey9FfQ2AyH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXzGYIACgkQI1/ltBGq
qqeQvhAAkwPoFk8RGRfQvAuZA3rgL+1fkYkbLINMYOCsI08Gxbm/A5SqHJkN9QwF
8fRLTYgstLqQe8Xb1ZxaO6HyrSeYUyLOeGMBphFJ0EVumSnG14awQYD6yzf2hAXo
6UMaChz7D5lpoueuwa0ZH4DDvAysy3w8WnNCOaLrOTzYgdOS8ZTuQ4+NYf1PZZi/
hZF+qOA72jcsFxFUKKGvvkzvcYPeGmy2UkYO0xt/baTtwpJV66RkLhxbriDKFIk0
ValOnVJEyC1K5UR17641KSfxfNyQTtPDV/q2OGy9YSwa2O985kCZeC6GtLLpMEZs
Fpd/AbKUVV0s5bdKzmypIn8O7nw/R9/cXIpdKLI+qktYmozPP4BRuJOPYb39qbF+
3NLBE9URMV51Hs8E+38pJQWTh2UQ8fEa4PnNBhX/Mk0vlxXQqxYT1Fcm8+HIiV7I
1FLYdPSM7bWvdDVFbi4/yYnQbBmVWMXIVrQi+9O2QO3x7bax063llzDm7LybFjPC
dCzwiLubcCEfWpy4Isgwj7qSH49BZXs8pFJSpZ5ObQ8e2IKRFWjCvQ3p5+egwUjN
WU0RaH6n64J6ohcsq7MQ1IFcrlkJncU3GWa7ycaSNWxel788xtZ25/qoKWa9H4a7
EeThiY5rl5VSrTMMQdADHhFaBt0sY1AW4zkpxGb2vzeP2/UfJT8=
=HFG/
-----END PGP SIGNATURE-----

--Sig_/zpAeDeeK6W8Kkey9FfQ2AyH--
