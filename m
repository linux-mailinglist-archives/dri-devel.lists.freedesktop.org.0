Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5B758F83
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21E010E079;
	Wed, 19 Jul 2023 07:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BCA10E079
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:49:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E40660C89;
 Wed, 19 Jul 2023 07:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BA7C433C7;
 Wed, 19 Jul 2023 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689752965;
 bh=mF4dbEudJosNd2gUrfziOoqeAdsxHgZxKqo0+MCKbck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2f9KVLEJLh2bnCfWwJj+hugRbZZmk128vtG+TnwIUqulL6heuNz0ZV1LC8CCtzCg
 ce5DNO2Erj6AFZaoQZzoggmDb4VjshcTYTDdmZUbbXRTnbvbmH3BlgA1g+QI8adVnr
 mDRipbpTG3qSTGrxVyBwJmy/K73LU7tH+niiwGwSpD+LGovJ0lGDCBf+M5Ur9fTMdZ
 ptLtoLWoPQ8kiSeiRaYcEvUO+ZJgU2KiuhS23uhuqkDQPdcWFAbhH+bmxFEA/j4U86
 E1j72i+6SrmVR27mdXMXI9g45EffIW7kkaFI0VKmW7EwlonaXfUOR7QzDSgb6Zv0VB
 SEHG1oFUiya4w==
Date: Wed, 19 Jul 2023 09:49:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <4tsh53x6qrbgjdbx46cwiwoltcdlrd4hpuxba7kw4graqlauyr@7pkedsasswff>
References: <20230718181726.3799-1-gcarlos@disroot.org>
 <20230718181726.3799-3-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rp3rhcuhfapu4gag"
Content-Disposition: inline
In-Reply-To: <20230718181726.3799-3-gcarlos@disroot.org>
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


--rp3rhcuhfapu4gag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 18, 2023 at 03:17:24PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a parametrized test for the drm_framebuffer_check_src_coords function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 126 +++++++++++++++++++
>  1 file changed, 126 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index f759d9f3b76e..ee92120cd8e9 100644
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
> @@ -366,7 +367,132 @@ static void drm_framebuffer_test_to_desc(const stru=
ct drm_framebuffer_test *t, c
>  KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>  		  drm_framebuffer_test_to_desc);
> =20
> +/* Parameters for testing drm_framebuffer_check_src_coords function */
> +struct check_src_coords_case {
> +	const char *name; /* Description of the parameter case */
> +	const int expect; /* Expected returned value by the function */
> +
> +	/* All function args */
> +	const uint32_t src_x;
> +	const uint32_t src_y;
> +	const uint32_t src_w;
> +	const uint32_t src_h;
> +	const struct drm_framebuffer fb;
> +};
> +
> +static const struct check_src_coords_case check_src_coords_cases[] =3D {
> +	/* Regular case where the source just fit in the framebuffer */
> +	{ .name =3D "source inside framebuffer with normal sizes and coordinate=
s",
> +	  .expect =3D 0,
> +	  .src_x =3D 500 << 16, .src_y =3D 700 << 16,
> +	  .src_w =3D 100 << 16, .src_h =3D 100 << 16,

I don't think we need to duplicate the << 16 everywhere, this can be
added by the test function.

Maxime

--rp3rhcuhfapu4gag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLeVggAKCRDj7w1vZxhR
xfLQAP4/0RCw1Lor/q9MBkrTLMf3Jj+GW7PhpOQLxHoCq4sXzAEAw3TdJGxmDhgO
hYCFdz+G0oevOh8wwd9cWWPCY0TxHQs=
=i9pZ
-----END PGP SIGNATURE-----

--rp3rhcuhfapu4gag--
