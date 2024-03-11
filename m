Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A478780D4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4C112A80;
	Mon, 11 Mar 2024 13:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="v4iEn+1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE64E112A80;
 Mon, 11 Mar 2024 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710164728;
 bh=etQPVIeGvQgyTSZasgOHIek7mA2WMk1LPG637qsf5+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=v4iEn+1nUs5M4IHZTU+k9h5Suiq7v0BGy8IwTM+3BIJQQo5iG+VJP/M/zKNFFGG3M
 QMCFj9cvEXmfJGoFiMBXcBeBz3pG2gwnZUCMb/ZV+EpQtWkasc8UPCsmiCWgcIiGEQ
 SrC9FeZ8DGaf+UtipLs4qa7VpufCVkzjpYgIwi6zOQcuOfgWX3RbnPS8R8b1MwfFPf
 C7SAuBk1vdvs7KbJMuW3Q5u/V7R0YcH2Z8lbe9wxG9LffcHHwXBT979NoG6ayZ4K5H
 pyoktUSgSLqCC05DKZya8aVNjiSS/Yl82N3cE6TEn+YPrJT4bq7GIHSdtCtz5HIZYJ
 fPrM/zCcN948A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D5213780894;
 Mon, 11 Mar 2024 13:45:28 +0000 (UTC)
Date: Mon, 11 Mar 2024 15:45:26 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, Arthur Grillo
 <arthurgrillo@riseup.net>
Subject: Re: [RFC PATCH v4 06/42] drm/vkms: Add kunit tests for VKMS LUT
 handling
Message-ID: <20240311154526.1f8f6c4b.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-7-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-7-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ma91tD+lI03d5cv3keYP/l";
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

--Sig_/3ma91tD+lI03d5cv3keYP/l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:20 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
>=20
> v4:
>  - Test the critical points of the lerp function (Pekka)
>=20
> v3:
>  - Use include way of testing static functions (Arthur)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 163 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |   8 +-
>  4 files changed, 178 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>=20

Hi Harry,

since fixed point math is hard, please allow me to nitpick so maybe
these patches could be landed ahead of time.

> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..c1f8b343ff0e 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,8 @@ config DRM_VKMS
>  	  a VKMS.
> =20
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vk=
ms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_VKMS=3Dy
> +CONFIG_DRM_VKMS_KUNIT_TESTS=3Dy
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/=
drm/vkms/tests/vkms_color_tests.c
> new file mode 100644
> index 000000000000..fc73e48aa57c
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> @@ -0,0 +1,163 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +
> +#define TEST_LUT_SIZE 16
> +
> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] =3D {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x1111, 0x1111, 0x1111, 0 },
> +	{ 0x2222, 0x2222, 0x2222, 0 },
> +	{ 0x3333, 0x3333, 0x3333, 0 },
> +	{ 0x4444, 0x4444, 0x4444, 0 },
> +	{ 0x5555, 0x5555, 0x5555, 0 },
> +	{ 0x6666, 0x6666, 0x6666, 0 },
> +	{ 0x7777, 0x7777, 0x7777, 0 },
> +	{ 0x8888, 0x8888, 0x8888, 0 },
> +	{ 0x9999, 0x9999, 0x9999, 0 },
> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut test_linear_lut =3D {
> +	.base =3D test_linear_array,
> +	.lut_length =3D TEST_LUT_SIZE,
> +	.channel_value2index_ratio =3D 0xf000fll

Where does 0xf000f come from? Could it be computed from DRM_FIXED_ONE
and ARRAY_LENGTH()?

> +};
> +
> +
> +static void vkms_color_test_get_lut_index(struct kunit *test)
> +{
> +	int i;
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test=
_linear_array[0].red)), 0);
> +
> +	for (i =3D 0; i < TEST_LUT_SIZE; i++)
> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut=
, test_linear_array[i].red)), i);

Why this instead of

+	for (i =3D 0; i < TEST_LUT_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, get_lut_index(&test_linear_lut, test_linear_array[=
i].red), drm_int2fixp(i));

and

+	for (i =3D 0; i < 0xffff; i++)
+		KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, i)), =
i / 0x1111);

?

I think your original form is leaving quite much room for error in
precision.

> +}
> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	/*** half-way round down ***/
> +	s64 t =3D 0x80000000 - 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +
> +	/*** half-way round up ***/
> +	t =3D 0x80000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t =3D 0.0 ***/
> +	t =3D 0x0;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t =3D 1.0 ***/
> +	t =3D 0x100000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +
> +	/*** t =3D 0.0 + 1 ***/
> +	t =3D 0x0 + 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t =3D 1.0 - 1 ***/
> +	t =3D 0x100000000 - 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b =3D a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b =3D a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +
> +	/*** t chosen to verify the flipping point of result a (or b) to a+1 (o=
r b-1) ***/
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);

What about b =3D 0xfffd also? The smaller number in b, and especially in
b - a, the more precision error the rounding will forgive.

> +}
> +
> +static struct kunit_case vkms_color_test_cases[] =3D {
> +	KUNIT_CASE(vkms_color_test_get_lut_index),
> +	KUNIT_CASE(vkms_color_test_lerp),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_color_test_suite =3D {
> +	.name =3D "vkms-color",
> +	.test_cases =3D vkms_color_test_cases,
> +};
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index e70cd473e3be..d178f2a400f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16=
 *background_color,
>  }
> =20
>  // lerp(a, b, t) =3D a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +u16 lerp_u16(u16 a, u16 b, s64 t)
>  {
>  	s64 a_fp =3D drm_int2fixp(a);
>  	s64 b_fp =3D drm_int2fixp(b);
> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>  	return drm_fixp2int_round(a_fp + delta);

Given the past, I guess it wouldn't hurt if all drm fixp functions had
a few tests of their own.


Thanks,
pq

>  }
> =20
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_v=
alue)
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>  {
>  	s64 color_channel_fp =3D drm_int2fixp(channel_value);
> =20
> @@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const =
char *src_name)
> =20
>  	return ret;
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_color_tests.c"
> +#endif


--Sig_/3ma91tD+lI03d5cv3keYP/l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXvCvYACgkQI1/ltBGq
qqd0Hg//cupZg7EUEcGvadI9RT13UFBDy/nncgdbp1qQw9c9b1+sKhn90aTSA0jz
4TKULCnuNco2I/HrNk+U/ftNDIV9L5/YSk+iYmvn3c+PgkK7lwsvkUARZZTJiixV
GRZopuJifTnvwTlLGUJ70+coVfySznKnycSs2S1wVN8GdquMB+G0v/zxSe1XDkJi
lYqZBJwAugm3he2aCddtGAgd0mlUwJr9jM0s+VdPyOAzsVritzFMEbGTwgaqDRSm
H45dNpwVgbkDY8zVhrheX0PhidWKa4iM6UkXzs77AAEKaFv0Sy9vuhN4Jzuzao4g
3GXvmko9+0Y2xf02BvDhbB58j7OEq8YkmKpGO0RiuymGZ0pmQDgeeiAjWD537b1W
aooj4cUjjjj7/tb46tsjhh1r0tidqng2SAnpDEG8vj8KKWIwlmMBm5TEhOqLf942
6FP23kZNsvKAfq70Z8vaRdBjdfTKCoZnFfHNDKcIfBFnbcjd0+bI5TYqsfDT91QX
aEBDQ/iM6OMmFGMsu2gjWEtlRTvSWASoJaRUxZUQwhUqFiD4bjVn1+/xEuafg9iu
dh4jZZWtp7Jcgr9TaA+0AwWAqvJjtbJjejSwqqHopu3Iu23M/R9Rv/LIz4+0bQ0K
1hD/mF9CfiqOnpVYzq34Nqx9q++8ScnHJ64hvamja2RLymNEV0A=
=2rEQ
-----END PGP SIGNATURE-----

--Sig_/3ma91tD+lI03d5cv3keYP/l--
