Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF15843DE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 18:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA3310E53D;
	Thu, 28 Jul 2022 16:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD9E10E9DA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QX9Hvrhq1tv4fuik2gar58r4BELAfbzt39ubLuFRRa0=; b=Ifec17vWKOORU7KJ0UJ0qxyM7V
 BfbF1rc539Oq5wXb9QGSZDhcZIxZrMfngNDwDuR4D+GSRfUyIo8Fe/Xaqkfn5Cs1wzUc6F3ZVHwwe
 mtO12JyefeJ7YdQmoOuRZQCqE572PizMAdBqXJ8mUOd5jCCSuS+GTUt1Nw+l1+FkON8j4UXVeCl96
 6MU8fzYK9ecQS31LIlcFNfz+XChPvIfmAgZ+xlR2xC4fOR27U3A0wrrIkHf0K8Defjfv0PnUtg7tI
 mmj+4hZuc8EF5rXHdTzBcy4JvZ+MN536BLqZ7b5+38+RKCN49IC8+cCL7wNRdpdz12jaiiAvRoNli
 9P6xh4NA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oH67S-00A3YA-MD; Thu, 28 Jul 2022 18:12:14 +0200
Date: Thu, 28 Jul 2022 15:11:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH] drm/tests: Split up test cases in
 igt_check_drm_format_min_pitch
Message-ID: <20220728161155.tzjalvrxaezk556t@mail.igalia.com>
References: <20220717184336.1197723-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cycfpb3jug72cn35"
Content-Disposition: inline
In-Reply-To: <20220717184336.1197723-1-mairacanal@riseup.net>
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Daniel Latypov <dlatypov@google.com>, brendanhiggins@google.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kunit-dev@googlegroups.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cycfpb3jug72cn35
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/17, Ma=EDra Canal wrote:
> The igt_check_drm_format_min_pitch() function had a lot of
> KUNIT_EXPECT_* calls, all of which ended up allocating and initializing
> various test assertion structures on the stack.
>=20
> This behavior was producing -Wframe-larger-than warnings on PowerPC, i386,
> and MIPS architectures, such as:
>=20
> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_forma=
t_min_pitch':
> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of
> 3712 bytes is larger than 2048 bytes
>=20
> So, the igt_check_drm_format_min_pitch() test case was split into three
> smaller functions: one testing single plane formats, one testing multiple
> planes formats, and the other testing tiled formats.
>=20
Hi Ma=EDra,

Could you add a Fixes tag to indicate the commit that introduces the
issue?

Thanks,

Melissa

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ma=EDra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/tests/drm_format_test.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/te=
sts/drm_format_test.c
> index 056cb8599d6d..28f2b8f88818 100644
> --- a/drivers/gpu/drm/tests/drm_format_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_test.c
> @@ -91,7 +91,7 @@ static void igt_check_drm_format_block_height(struct ku=
nit *test)
>  	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
>  }
> =20
> -static void igt_check_drm_format_min_pitch(struct kunit *test)
> +static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit=
 *test)
>  {
>  	const struct drm_format_info *info =3D NULL;
> =20
> @@ -175,6 +175,11 @@ static void igt_check_drm_format_min_pitch(struct ku=
nit *test)
>  			(uint64_t)UINT_MAX * 4);
>  	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)=
),
>  			(uint64_t)(UINT_MAX - 1) * 4);
> +}
> +
> +static void igt_check_drm_format_min_pitch_for_multiple_planes(struct ku=
nit *test)
> +{
> +	const struct drm_format_info *info =3D NULL;
> =20
>  	/* Test 2 planes format */
>  	info =3D drm_format_info(DRM_FORMAT_NV12);
> @@ -249,6 +254,11 @@ static void igt_check_drm_format_min_pitch(struct ku=
nit *test)
>  			(uint64_t)(UINT_MAX - 1) / 2);
>  	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, (UINT_MAX - 1)=
 / 2),
>  			(uint64_t)(UINT_MAX - 1) / 2);
> +}
> +
> +static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit=
 *test)
> +{
> +	const struct drm_format_info *info =3D NULL;
> =20
>  	/* Test tiled format */
>  	info =3D drm_format_info(DRM_FORMAT_X0L2);
> @@ -273,7 +283,9 @@ static void igt_check_drm_format_min_pitch(struct kun=
it *test)
>  static struct kunit_case drm_format_tests[] =3D {
>  	KUNIT_CASE(igt_check_drm_format_block_width),
>  	KUNIT_CASE(igt_check_drm_format_block_height),
> -	KUNIT_CASE(igt_check_drm_format_min_pitch),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_single_plane),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_multiple_planes),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_tiled_format),
>  	{ }
>  };
> =20
> --=20
> 2.36.1
>=20

--cycfpb3jug72cn35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLitTIACgkQwqF3j0dL
ehwt4A/+IqGJpHDAaqlrXh3uSs6Sz5+Ca8yyh0YOHdzqDY64qUdT1DYXohXpy7MV
fmgbtKGJL5erww3V5Jqg01+zpV1Q9MaC02Nb1txXqBreI1k8c1ALkB/m1Mlj6nLl
UavoEhVhxA5utbETxtATCoEq3C/LxC65hZ6LPdwj2kQQaPOOHEccpuPC3CYTu9do
qRblunLb6+VKPxdSmUFVwK2Ocshg1Efoa3ZJ9AipJjVmOQUSzXI644hr9l6biPOF
a/5aS8R08FL7QhQQU9lzNU2zUeJuPSXdXDcUnZ3vkcOFR5bXejdedlMcK/SPbJbA
4W5u6fNjE5PBer3AZDyc33xWUNUbc7kevBJj2oiqAGikQ6gLwJxTnQo8vRHwHoW0
psyGiheXTlpMo4CPBmsHvGDSDSo8eQ6GNiyoXdMNC6LMal++ly/DgH7nMlhA83SS
G2QwCvmHVgpR3BJ/R7voFcFoMn9DpTnwjvcAZqoXribwbOA9CIEhV0zVejlBbGoR
HoassarpIU+B+I/c6i19qXt+crD4MW2x3W+X7hbrFTuOvE30QGtpFqP3CLBPUj3E
ySNjplYAP3ZrK6ZGERzPThNavFDQB4ZzSUUclTRo0KxFqY2kNZfbc3ZVeg71UriN
mPtuXUUC9tb7xsRRVaKCoJcRyur/nSG0RKce7dSUbdI5OdPVsHg=
=OvDL
-----END PGP SIGNATURE-----

--cycfpb3jug72cn35--
