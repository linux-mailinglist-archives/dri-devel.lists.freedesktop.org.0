Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8B755EB3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F7A10E033;
	Mon, 17 Jul 2023 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD910E033
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:45:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEC6760FCD;
 Mon, 17 Jul 2023 08:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4765C433C8;
 Mon, 17 Jul 2023 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689583558;
 bh=hdOCg7+PatqDTYJfrUrBETRxlBmQzetLFDdS6hsvDy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cf5RGabV6Qg2m89nTGUfoUqkuwrJ77zVBZ6t4xcHkuiNkmCa3bsv8q83jkQFq3ySr
 5YEncGXGUSwuT2n0+0svt1tXGQKREsIHCl5fIvmu1kJjFkykKpAzKXtyc5V81p8KK5
 cYDytXaZm+liX7HhEL4TvQakNrbr3Et/KqNZQqeOA1sVWjZmd4pCC4H+vRWszmLrnN
 wBKAytfEU8v8RVAdLAA3T09HeunAg1buPcUqDHIf/7M9haqchQp/xE0mrUc6jKJGJu
 Kicl4DKd21X4NgQthcF6Sl6Ru3LtOj3dIFP0MLSlpkHDqCdMX8ZfvqeqEHYBQ//zw7
 iBVh9TWbuer2Q==
Date: Mon, 17 Jul 2023 10:45:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <os25nxijhqvw77mn7v4fuuobv4qlrdtylkctuxj4ca6lb6rxfz@ummy4rrlksoz>
References: <20230714180619.15850-1-gcarlos@disroot.org>
 <20230714180619.15850-3-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wwthgkudc4rd2o45"
Content-Disposition: inline
In-Reply-To: <20230714180619.15850-3-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wwthgkudc4rd2o45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2023 at 03:06:17PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a parametrized test for the drm_framebuffer_check_src_coords function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 107 +++++++++++++++++++
>  1 file changed, 107 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index f759d9f3b76e..175146f7ac9e 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -9,6 +9,7 @@
> =20
>  #include <drm/drm_device.h>
>  #include <drm/drm_mode.h>
> +#include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
> =20
> @@ -366,8 +367,114 @@ static void drm_framebuffer_test_to_desc(const stru=
ct drm_framebuffer_test *t, c
>  KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>  		  drm_framebuffer_test_to_desc);
> =20
> +struct check_src_coords_case {
> +	const int expect;
> +	const uint32_t src_x;
> +	const uint32_t src_y;
> +	const uint32_t src_w;
> +	const uint32_t src_h;
> +	const struct drm_framebuffer fb;
> +	const char *name;
> +};
> +
> +static const struct check_src_coords_case check_src_coords_cases[] =3D {
> +	{ .name =3D "source inside framebuffer",
> +	  .expect =3D 0,
> +	  .src_x =3D 500 << 16, .src_y =3D 700 << 16,
> +	  .src_w =3D 100 << 16, .src_h =3D 100 << 16,
> +	  .fb =3D { .width =3D 600, .height =3D 800 }
> +	},

Generally speaking, a small comment explaining what the test is doing
and what is the expected result is would be nice. A couple of
months/years down the line, obvious tests might not be so obvious
anymore.

=2E..
> +static void check_src_coords_test_to_desc(const struct check_src_coords_=
case *t,
> +					  char *desc)
> +{
> +	strcpy(desc, t->name);
> +}

strscpy

> +KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
> +		  check_src_coords_test_to_desc);
> +
>  static struct kunit_case drm_framebuffer_tests[] =3D {
>  	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_ge=
n_params),
> +	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coord=
s_gen_params),

I'd prefer to keep them ordered alphabetically.

Thanks!
Maxime

--wwthgkudc4rd2o45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLT/wwAKCRDj7w1vZxhR
xb/xAP4ilO0Nt3tob0onXviITVF6PHUQqwlWqx82BKZj2bxZLgEAyTlXFallFOhb
16ZY0yt740DRF8NMdpcRDlvEapgcHww=
=/Tlf
-----END PGP SIGNATURE-----

--wwthgkudc4rd2o45--
