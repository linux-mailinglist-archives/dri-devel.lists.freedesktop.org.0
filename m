Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DDE829E0A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592DA10E61F;
	Wed, 10 Jan 2024 15:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF72F10E614;
 Wed, 10 Jan 2024 15:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B300ACE1CDD;
 Wed, 10 Jan 2024 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85F1C433C7;
 Wed, 10 Jan 2024 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704902190;
 bh=Mev9R+M1cLaYjYBU2ZgT5jQ2ZNfBaieaMpJ0LyeLUqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IeDcPZYqZH/yosqHy6J0lKKIXTr87XKELYPhOa4vt9rK8HdOlohar0v95Bx8OTdGH
 qFkCOu0OtN6mz/BohFHwbJekpq/cRig3FNJMy81gq7ZjCx4Q+GqZRFbdFk2LWKfLwU
 UqW8AC16aRfgHhoGD+CVoZibaW2tuPgF5iuMbzilseJNpgvVjFgYAZrwuFPgEB78OG
 WV0NkkyJ+qt57r+azS6oThayuTFamklZZWYXTFl52aiYMK+5hVeAsy/CZ3k7mu4Zvw
 gsotv0QM55jZHaZKlclvTSBRs5wPTZS/GgIMp2z1pttlcZwrYyX+zCDFpfpMi3TWWO
 PcI2MR49Yy+Rw==
Date: Wed, 10 Jan 2024 16:56:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 6/6] drm/tests: managed: Add a simple test for
 drmm_managed_release
Message-ID: <2mgrb5lrm5oskkcauhdbegdb5jwhqx6unzlaltz6e2bzaqrzyr@dnkbsr3ykj7k>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
 <20240105101324.26811-7-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="low44rvsz3fnl7ut"
Content-Disposition: inline
In-Reply-To: <20240105101324.26811-7-michal.winiarski@intel.com>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--low44rvsz3fnl7ut
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 11:13:24AM +0100, Micha=C5=82 Winiarski wrote:
> Add a simple test that checks whether the action is indeed called right
> away and that it is not called on the final drm_dev_put().
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_managed_test.c | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/t=
ests/drm_managed_test.c
> index c1fc1f0aac9b2..91863642efc13 100644
> --- a/drivers/gpu/drm/tests/drm_managed_test.c
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -41,6 +41,33 @@ static void drm_test_managed_run_action(struct kunit *=
test)
>  	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not =
called");
>  }
> =20
> +/*
> + * The test verifies that the release action is called immediately when
> + * drmm_release_action is called and that it is not called for a second =
time
> + * when the device is released.
> + */
> +static void drm_test_managed_release_action(struct kunit *test)
> +{
> +	struct managed_test_priv *priv =3D test->priv;
> +	int ret;
> +
> +	ret =3D drmm_add_action_or_reset(priv->drm, drm_action, priv);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	ret =3D drm_dev_register(priv->drm, 0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drmm_release_action(priv->drm, drm_action, priv);
> +	KUNIT_EXPECT_TRUE_MSG(test, priv->action_done, "Release action was not =
called");
> +	priv->action_done =3D false;
> +
> +	drm_dev_unregister(priv->drm);
> +	drm_kunit_helper_free_device(test, priv->drm->dev);
> +
> +	KUNIT_EXPECT_FALSE_MSG(test, priv->action_done,
> +			       "Unexpected release action call during cleanup");
> +}
> +

I guess we can have something simpler if we switch action_done to a
counter and just check that the counter didn't increase.

And I think the custom messages should be removed there too.

Maxime

--low44rvsz3fnl7ut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ6+KwAKCRDj7w1vZxhR
xTSyAP9WBatDxCR53O+71y/N+u/TGRvmdsq04Tz8iV4qA/vs8wD9E/+kUzgF0hBT
sPyni9+ICPNJdDcxH9Yh9B/2rk4Z6AY=
=1Mfc
-----END PGP SIGNATURE-----

--low44rvsz3fnl7ut--
