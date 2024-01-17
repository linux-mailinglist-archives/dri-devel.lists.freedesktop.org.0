Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656683026C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E247910E63F;
	Wed, 17 Jan 2024 09:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F0910E63F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:36:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EBC11CE1BDA;
 Wed, 17 Jan 2024 09:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6FDC433C7;
 Wed, 17 Jan 2024 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484150;
 bh=znmTNnnON1xAmvIdkiTAtEl/30Rg5OxKTetGP2gbTiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRqpWm8EYw+VIG3YTD4htbP4pGw4w17GXw4tJMYQjbYo0+1vtuZgGCSbQXb3x61fR
 khkosklsPRQA5w+5hqQJ4RunTLGNza2t2McdEJsgoMDyeTBzKuH9BpT0EoWwOeZw41
 gTDTsVgJyp89SPnlANu3nj9FElynHHM+Oz73X9hCD6rmx/ht54iub1PVyNPffNAakq
 ZFrMVPNW3ZvWJyRrXz5VfXHUy0ypJdH85kyJYjnnFNccF3MVd36S+le1VP17EUF5O9
 Y6Nzhfc84FXT9ZBlbjReVM6KviyzLW1OPTOQT/3hvBdQtSoKAB/mOl62JJNRk0+E6L
 HfmLSH9LvpqMQ==
Date: Wed, 17 Jan 2024 10:35:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dipam Turkar <dipamt1729@gmail.com>
Subject: Re: [PATCH v4 1/1] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Message-ID: <mk34n3vslyf6srydefxubwfst6bgymu27fabtdhopv3fi2hc7y@vpm6naewdorw>
References: <20240114105337.480807-1-dipamt1729@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7a4kvqwq7nylyz27"
Content-Disposition: inline
In-Reply-To: <20240114105337.480807-1-dipamt1729@gmail.com>
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
Cc: tzimmermann@suse.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, daniel@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7a4kvqwq7nylyz27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 14, 2024 at 04:23:38PM +0530, Dipam Turkar wrote:
> Introduce unit tests for the drm_mode_create_dvi_i_properties() function =
to ensure
> the proper creation of DVI-I specific connector properties and success if=
 called=20
> multiple times.
>=20
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm=
/tests/drm_connector_test.c
> index c66aa2dc8d9d..217c0988171e 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -4,6 +4,9 @@
>   */
> =20
>  #include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_kunit_helpers.h>
> =20
>  #include <kunit/test.h>
> =20
> @@ -70,7 +73,62 @@ static struct kunit_suite drm_get_tv_mode_from_name_te=
st_suite =3D {
>  	.test_cases =3D drm_get_tv_mode_from_name_tests,
>  };
> =20
> +/*
> + * Test that drm_mode_create_dvi_i_properties() succeeds and
> + * DVI-I subconnector and select subconectors properties have
> + * been created.
> + */
> +static void drm_test_mode_create_dvi_i_properties(struct kunit *test)
> +{
> +	struct drm_device *drm;
> +	struct device *dev;
> +
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,=
 DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subcon=
nector_property);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_=
property);
> +}
> +
> +/*
> + * Test that drm_mode_create_dvi_i_properties() doesn't fail if called t=
wice.
> + */
> +static void drm_test_mode_create_dvi_i_properties_repeated(struct kunit =
*test)
> +{
> +	struct drm_device *drm;
> +	struct device *dev;
> +
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,=
 DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subcon=
nector_property);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_=
property);
> +
> +	/* Expect the function to return 0 if called twice. */
> +	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
> +}
> +
> +static struct kunit_case drm_mode_create_dvi_i_properties_tests[] =3D {
> +	KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
> +	KUNIT_CASE(drm_test_mode_create_dvi_i_properties_repeated),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_mode_create_dvi_i_properties_test_suite =
=3D {
> +	.name =3D "drm_mode_create_dvi_i_properties",
> +	.test_cases =3D drm_mode_create_dvi_i_properties_tests,
> +};
> +
>  kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
> +kunit_test_suite(drm_mode_create_dvi_i_properties_test_suite);

You should use kunit_test_suites here

Maxime

--7a4kvqwq7nylyz27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaefcgAKCRDj7w1vZxhR
xboWAQCphb6s5xjeFPpUgmXj/Xhz4QvE4u/AEpVQ3B5C4PKABAD9GOVRjkZDxTsf
yKBJJ1wi4YkmZlhNTZjd/nx45LN36A4=
=MDzt
-----END PGP SIGNATURE-----

--7a4kvqwq7nylyz27--
