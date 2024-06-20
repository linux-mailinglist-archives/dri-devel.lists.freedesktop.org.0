Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C290FE59
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292EC10E2E9;
	Thu, 20 Jun 2024 08:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rYE2yPy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000FB10E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5663E61DEF;
 Thu, 20 Jun 2024 08:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA670C2BD10;
 Thu, 20 Jun 2024 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718870988;
 bh=jrrSqU84/DPW3glgOS9SXkJoeE3n1m5khf/oFlnH6I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rYE2yPy1EOjHxTIrWKC5MlwHfKPJ4803tannNALmHpOWwgN/1E5oN8D/9FnEJXYzp
 /+qXgtmpPciznka1W8uLOBQ7lx2AojZ71BNPeLqoIj2nO8B1HXWdK/wKSQEfCCHBh2
 R33lgru+G7NfKGZoeOcZgiEhv7QADDmDDkrjwy4xjxe0mUP4AwbiMuvaw/MPcruBy3
 922SnrPdoEVOunHPA8VYIQJwOV4KFZ+Y0WbYdMj9vAO8T3+IF+OryleEqSNbk+B7Py
 kD3i6gUjX6JjHy/vcalCE81as176gnQ3m9fKparaHCnCZnyAdP+SS0fTbAFPqtocOr
 f4pTGiE10RhkA==
Date: Thu, 20 Jun 2024 10:09:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/tests: Add tests for the new Monochrome value
 of tv_mode
Message-ID: <20240620-excellent-white-dingo-eabd6f@houat>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
 <20240619153913.2804051-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lv4tznhgurzs5l7x"
Content-Disposition: inline
In-Reply-To: <20240619153913.2804051-2-dave.stevenson@raspberrypi.com>
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


--lv4tznhgurzs5l7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for working on the tests

On Wed, Jun 19, 2024 at 04:39:11PM GMT, Dave Stevenson wrote:
> Adds test for the cmdline parser, connector property, and
> drm_analog_tv_mode to ensure the behaviour of the new value is
> correct.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../gpu/drm/tests/drm_cmdline_parser_test.c   | 20 ++++++------
>  drivers/gpu/drm/tests/drm_connector_test.c    |  1 +
>  drivers/gpu/drm/tests/drm_modes_test.c        | 31 +++++++++++++++++++
>  3 files changed, 43 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gp=
u/drm/tests/drm_cmdline_parser_test.c
> index 6f1457bd21d9..95fb379c69eb 100644
> --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> @@ -976,22 +976,24 @@ static void drm_test_cmdline_tv_options(struct kuni=
t *test)
>  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
>  }
> =20
> -#define TV_OPT_TEST(_opt, _cmdline, _mode_fn)		\
> +#define TV_OPT_TEST(_opt, _cmdline, _mode_fn, _tvmode)		\
>  	{						\
>  		.name =3D #_opt,				\
>  		.cmdline =3D _cmdline,			\
>  		.mode_fn =3D _mode_fn,			\
> -		.tv_mode =3D DRM_MODE_TV_MODE_ ## _opt,	\
> +		.tv_mode =3D DRM_MODE_TV_MODE_ ## _tvmode,	\
>  	}
> =20
>  static const struct drm_cmdline_tv_option_test drm_cmdline_tv_option_tes=
ts[] =3D {
> -	TV_OPT_TEST(NTSC, "720x480i,tv_mode=3DNTSC", drm_mode_analog_ntsc_480i),
> -	TV_OPT_TEST(NTSC_443, "720x480i,tv_mode=3DNTSC-443", drm_mode_analog_nt=
sc_480i),
> -	TV_OPT_TEST(NTSC_J, "720x480i,tv_mode=3DNTSC-J", drm_mode_analog_ntsc_4=
80i),
> -	TV_OPT_TEST(PAL, "720x576i,tv_mode=3DPAL", drm_mode_analog_pal_576i),
> -	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=3DPAL-M", drm_mode_analog_ntsc_480=
i),
> -	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=3DPAL-N", drm_mode_analog_pal_576i=
),
> -	TV_OPT_TEST(SECAM, "720x576i,tv_mode=3DSECAM", drm_mode_analog_pal_576i=
),
> +	TV_OPT_TEST(NTSC, "720x480i,tv_mode=3DNTSC", drm_mode_analog_ntsc_480i,=
 NTSC),
> +	TV_OPT_TEST(NTSC_443, "720x480i,tv_mode=3DNTSC-443", drm_mode_analog_nt=
sc_480i, NTSC_443),
> +	TV_OPT_TEST(NTSC_J, "720x480i,tv_mode=3DNTSC-J", drm_mode_analog_ntsc_4=
80i, NTSC_J),
> +	TV_OPT_TEST(PAL, "720x576i,tv_mode=3DPAL", drm_mode_analog_pal_576i, PA=
L),
> +	TV_OPT_TEST(PAL_M, "720x480i,tv_mode=3DPAL-M", drm_mode_analog_ntsc_480=
i, PAL_M),
> +	TV_OPT_TEST(PAL_N, "720x576i,tv_mode=3DPAL-N", drm_mode_analog_pal_576i=
, PAL_N),
> +	TV_OPT_TEST(SECAM, "720x576i,tv_mode=3DSECAM", drm_mode_analog_pal_576i=
, SECAM),
> +	TV_OPT_TEST(MONO_525, "720x480i,tv_mode=3DMono", drm_mode_analog_ntsc_4=
80i, MONOCHROME),
> +	TV_OPT_TEST(MONO_625, "720x576i,tv_mode=3DMono", drm_mode_analog_pal_57=
6i, MONOCHROME),
>  };

I assume you did that because, otherwise, the name for both mono
variants would have been the same and the test generation wouldn't work
anymore?

If so, I think I'd prefer to not use the macro in this case but define
the struct by hand. It keeps the general case clean, while allowing to
deal with our odd case still.

Maxime

--lv4tznhgurzs5l7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnPjyAAKCRDj7w1vZxhR
xS8bAQCqhb4VSkyyySgHKeezopgaUMbd1fQ0XgcHj0uG0t3hVwEA62EHUXpIlV+w
wOhozqWHvAvJZZQLx58YxKDJoWZ8zA8=
=kOJT
-----END PGP SIGNATURE-----

--lv4tznhgurzs5l7x--
