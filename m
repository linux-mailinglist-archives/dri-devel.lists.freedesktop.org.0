Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2898814D14
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A98A10E125;
	Fri, 15 Dec 2023 16:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8410E125;
 Fri, 15 Dec 2023 16:31:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5ACCACE3057;
 Fri, 15 Dec 2023 16:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E71C433C7;
 Fri, 15 Dec 2023 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702657900;
 bh=0LosaE7u8eBehBbtOhhzbFfU8u6hU9TUHpdDqS95mg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SY43EWQGoVCv6gr4NvXcCWAkQbCPGd2r0YmySPpP5h7SBC63JBgxNxcMtxvu7IDds
 6Kog+3oBVOvPm2LUvZ9PPkNH9P2cxlEmt9RmSC35gGR3ChvMvbanuKlXifEYY7q3bX
 iSNvLRo9KdNrCbCOlPLPORYLV6FN1WaBZXtiMzpEOUA7glVs/R2hjNyvOn3XCFW8ze
 mA5mT6A/OjkQ6tKIxMNQiHNEogOIaboPeXGr3T2oFBMLfooOtX6ApP1z1Hr/tDHINC
 yeWAdFwRTw2T3zLe01ilRW5hN3VcyabKv2gtFedEQeBxv8sQI9iolXp9WscdC0Uhoa
 PU6sCApIKlPXQ==
Date: Fri, 15 Dec 2023 17:31:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v3 3/3] drm/tests: managed: Add a simple test for
 drmm_managed_release
Message-ID: <mwdzi5424bvw57pqred3e2hcq7tp6xkaywj3dabixkbmq5hkbf@emquthxzlth3>
References: <20231211220939.215024-1-michal.winiarski@intel.com>
 <20231211220939.215024-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="awnvecwbuslupev3"
Content-Disposition: inline
In-Reply-To: <20231211220939.215024-4-michal.winiarski@intel.com>
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


--awnvecwbuslupev3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 11, 2023 at 11:09:39PM +0100, Micha=C5=82 Winiarski wrote:
> Add a simple test that checks whether the action is indeed called right
> away and that it is not called on the final drm_dev_put().
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_managed_test.c | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/t=
ests/drm_managed_test.c
> index 15bd2474440b5..ef5e784afbc6d 100644
> --- a/drivers/gpu/drm/tests/drm_managed_test.c
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -48,6 +48,34 @@ static void drm_test_managed_run_action(struct kunit *=
test)
>  	KUNIT_EXPECT_GT_MSG(test, ret, 0, "Release action was not called");
>  }
> =20
> +/*
> + * The test verifies that the release action is called immediately when
> + * drmm_release_action is called and that it is not called for a second =
time
> + * when the device is released.
> + */

Thanks, it's much clearer now.

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

We should call wait_event_* here.

> +
> +	drm_dev_unregister(priv->drm);
> +	drm_kunit_helper_free_device(test, priv->drm->dev);
> +
> +	ret =3D wait_event_interruptible_timeout(priv->action_wq, priv->action_=
done,
> +					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> +	KUNIT_EXPECT_EQ_MSG(test, ret, 0, "Unexpected release action call durin=
g cleanup");
> +}
> +

Tests should in general be as fast as possible. Waiting for 100ms for
the success case is not ok. We have ~500 tests at the moment, if every
test was doing that it would take at least 50s to run all our unit
tests, while it takes less than a second at the moment on a capable
machine.

And also, I'm not sure we actually need to make sure it never happened.
If only because nothing actually guarantees it wouldn't have happened
after the timeout anyway, so the test isn't definitive.

I guess what we could test is whether the action is still in the actions
list through a function only exported to tests. If it's no longer in the
action list, then it won't be run.

But unless we ever have a bug, I'm not sure it's worth testing for that.

Maxime

--awnvecwbuslupev3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXx/agAKCRDj7w1vZxhR
xajGAQDG1s2HQsiewBHqi42fHEPuZViUskhPW+PJ7c8GfgqlEQD/RTukNbiKlM+1
Zl51xfDs0C5H73DX+sfNPRh3vIiq3AQ=
=VvLf
-----END PGP SIGNATURE-----

--awnvecwbuslupev3--
