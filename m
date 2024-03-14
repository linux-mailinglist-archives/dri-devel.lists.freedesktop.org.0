Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545087C0E2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 17:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440F10E295;
	Thu, 14 Mar 2024 16:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="29rXDjsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A8D10E295;
 Thu, 14 Mar 2024 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710432145;
 bh=OebvIykPnKzFMgLsQYXofT9STmJeJ3CQ/dvUuXmK/2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=29rXDjsTaXvDSR5XeYHhZalxfUGQcTCkmIKYraxN+mMpUOTNsGt4tLgKcSqWjuncX
 mGN+0z9gOemN8cRQHvnVaYqLI04kOJj2FoCHiqjuDP2vd3qKelULGy6ef3Met5tnNO
 /9P0QM/IqIpgEUJMcOmMUx9lLRRwPjKOJaBljV9rNsIkvrzM0pgRFMvWK1k8KXpYNM
 GfKD4HT/j2USDXqaMx1UNKqV7k1FbdBQAwqHMIOLLpvVX9PmOPKTTz5+oY/wPSX72a
 tjIC1dh0pkqTLkzN8TI/jClz9DWv2Kso4sA4grPyq1GQ6owKASZbcUL/cX4A/pzSEF
 742ZyrdQdPm3g==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7DF8B37820F5;
 Thu, 14 Mar 2024 16:02:25 +0000 (UTC)
Date: Thu, 14 Mar 2024 18:02:23 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 25/42] drm/vkms: Add tests for CTM handling
Message-ID: <20240314180223.65ab8777.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-26-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-26-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lB/ul+0s_RsGEiR.Q42ykxb";
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

--Sig_/lB/ul+0s_RsGEiR.Q42ykxb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:39 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> A whole slew of tests for CTM handling that greatly helped in
> debugging the CTM code. The extent of tests might seem a bit
> silly but they're fast and might someday help save someone
> else's day when debugging this.
>=20
> v4:
>  - Comment on origin of bt709_enc matrix (Pekka)
>  - Use full opaque alpha (Pekka)
>  - Add additional check for Y < 0xffff (Pekka)
>  - Remove unused code (Pekka)
>  - Rename red, green, blue to Y, U, V where applicable
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 251 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |   2 +-
>  2 files changed, 252 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/=
drm/vkms/tests/vkms_color_tests.c
> index e6ac01dee830..83d07f7bae37 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -3,6 +3,7 @@
>  #include <kunit/test.h>
> =20
>  #include <drm/drm_fixed.h>
> +#include <drm/drm_mode.h>
> =20
>  #define TEST_LUT_SIZE 16
> =20
> @@ -181,11 +182,261 @@ static void vkms_color_srgb_inv_srgb(struct kunit =
*test)
>  	}
>  }
> =20
> +#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
> +#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
> +
> +const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat =3D { {
> +	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0

These are supposed to be sign-magnitude, not fixed-point, to my
understanding. It just happens that these specific values have the same
bit pattern in both representations.


> +} };
> +
> +static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
> +{
> +	struct pixel_argb_s32 ref, out;
> +
> +	/* full white */
> +	ref.a =3D 0xffff;
> +	ref.r =3D 0xffff;
> +	ref.g =3D 0xffff;
> +	ref.b =3D 0xffff;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full black */
> +	ref.a =3D 0xffff;
> +	ref.r =3D 0x0;
> +	ref.g =3D 0x0;
> +	ref.b =3D 0x0;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* 50% grey */
> +	ref.a =3D 0xffff;
> +	ref.r =3D 0x8000;
> +	ref.g =3D 0x8000;
> +	ref.b =3D 0x8000;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full red to 50% desat */
> +	ref.a =3D 0xffff;
> +	ref.r =3D 0x7fff;
> +	ref.g =3D 0x3fff;
> +	ref.b =3D 0x3fff;
> +
> +	out.a =3D 0xffff;
> +	out.r =3D 0xffff;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +}
> +
> +/*
> + * BT.709 encoding matrix
> + *
> + * Values printed from within IGT when converting
> + * igt_matrix_3x4_bt709_enc to the fixed-point format expected
> + * by DRM/KMS.

Shouldn't that be sign-magnitude, not fixed point?

I was hoping to get a reference to a spec like BT.709 and a formula for
getting the blow out of it. IGT can change over time, and I don't know
where IGT for that matrix from.

But ok, this is a test with an arbitrary matrix, not necessarily the
BT.709 matrix specifically.

Btw. which BT.709 matrix is this? YUV->RGB, RGB->XYZ, or the inverse of
one of those? Limited or full quantization range?

Judging by the tests, I guess RGB->YUV full range.

> + */
> +const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc =3D { {
> +	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
> +	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
> +	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
> +} };
> +
> +static void vkms_color_ctm_3x4_bt709(struct kunit *test)
> +{
> +	struct pixel_argb_s32 out;
> +
> +	/* full white to bt709 */
> +	out.a =3D 0xffff;
> +	out.r =3D 0xffff;
> +	out.g =3D 0xffff;
> +	out.b =3D 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 255 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x10000);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);

For all of these U/V too, you may want to enforce a range. The value
must be approximately 0x100. Something like 0x17 would very wrong.

Hmm, wait...

Neutral color should have U and V neutral, that is, zero, right? So
what is zero in this integer representation?

You don't seem to be testing negative U or V...


Thanks,
pq

> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* full black to bt709 */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 0 */
> +	KUNIT_EXPECT_LT(test, out.r, 0x100);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* gray to bt709 */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x7fff;
> +	out.g =3D 0x7fff;
> +	out.b =3D 0x7fff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 127 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x8000);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D red 255 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0xffff;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 54 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x3500);
> +	KUNIT_EXPECT_LT(test, out.r, 0x3700);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 157 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
> +	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
> +
> +
> +	/* =3D=3D green 255 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x0;
> +	out.g =3D 0xffff;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 182 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xB500);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D blue 255 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 18 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1100);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1300);
> +
> +	/* U 111 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x7000);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* =3D=3D red 140 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x8c8c;
> +	out.g =3D 0x0;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* V 87 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x5600);
> +	KUNIT_EXPECT_LT(test, out.b, 0x5800);
> +
> +	/* =3D=3D green 140 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x0;
> +	out.g =3D 0x8c8c;
> +	out.b =3D 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x6400);
> +	KUNIT_EXPECT_LT(test, out.r, 0x6600);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +
> +	/* =3D=3D blue 140 - bt709 enc =3D=3D */
> +	out.a =3D 0xffff;
> +	out.r =3D 0x0;
> +	out.g =3D 0x0;
> +	out.b =3D 0x8c8c;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x900);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB00);
> +
> +	/* U 61 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +}
> +
>  static struct kunit_case vkms_color_test_cases[] =3D {
>  	KUNIT_CASE(vkms_color_test_get_lut_index),
>  	KUNIT_CASE(vkms_color_test_lerp),
>  	KUNIT_CASE(vkms_color_test_linear),
>  	KUNIT_CASE(vkms_color_srgb_inv_srgb),
> +	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
> +	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
>  	{}
>  };
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 8bbfce651526..2c5715242f91 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *c=
rtc_state, struct line_buff
>  	}
>  }
> =20
> -static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct =
drm_color_ctm_3x4 *matrix)
> +void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_col=
or_ctm_3x4 *matrix)
>  {
>  	s64 rf, gf, bf;
> =20


--Sig_/lB/ul+0s_RsGEiR.Q42ykxb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXzH5AACgkQI1/ltBGq
qqfFqhAAr0AiOdy/HOICE0PXjQKjyRXAaNot7DUhuQoJSQRxn9GjINFQXHLHL6eA
On9XjRidYCvlVs5tj9qCC0/1oZjvg1dML6G3E2fp2WDQWHdGaBiWt0JoZj4VniLE
QshBkrMmQBb05ITRzxkxRPyR6eRWJOomXkpHqL/U75oWnuwFJQqKT2ixvocbji3v
YpesxMGTSXag0G0o2nvJmLdApD/y6Heo6WvJQBW/7SL6IfGENzvrJ/QDMA4lAQNf
HYfFOzH6KqNlBQj5TOgGBKSJBzM7ZQ9pbwBfd5ZVg6Dhk6mVcQdo0IXw+IjI4o7u
Ose04PN9PWLaQgJAOUfz9J1Bxo/Bx+OgTpsu14npvPj886ejmCAgOnDqZWb+/icL
N2oozekELf3d67Ciwdkavm3seAvEsTxZ94JniraoSrHCsdFgSESkLIHZ9Q4CJU/X
/eVJrIxw8WkVk3W4V2eNzeaC5kgHbvmW/EE30+ZK8tdV21YAbif/TGgwUsISpi+R
U0V60hhzzxABCPe/tFOL0DuqZn9MhumpOJJIu4+qdgU6BhL2DfV8jQBV9pKDls+h
JNAyuG/SHVWTlVbvP1D/ODAQgEanqhnJd77SFPTJYo5457oe2PsqMwPvwF4/fR+9
uGCnaBK8yntCyR49ZHtpmgIyCYZ+5zGAd0XB77yTImhVv/aX9jo=
=Fj1L
-----END PGP SIGNATURE-----

--Sig_/lB/ul+0s_RsGEiR.Q42ykxb--
