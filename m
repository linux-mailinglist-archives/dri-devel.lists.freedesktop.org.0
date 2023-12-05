Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9C805670
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DCC10E548;
	Tue,  5 Dec 2023 13:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6710E547;
 Tue,  5 Dec 2023 13:50:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F32DCE1827;
 Tue,  5 Dec 2023 13:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4A7C433C7;
 Tue,  5 Dec 2023 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701784224;
 bh=qWUHln0TJp06ORs8walMJ6PunzC7TYXw6yHrQTcpoPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROm2MvhMPhWU+cwbMFCWKamRD4KzEaSmvrwFla9J1jbXz8suGGD/n5/D369Blq4nF
 eRZi0n4IocZ9wQaBPBVnP9noDTMjH2bkyjwtalNotv9/AYeoJiog+sWBUrkKhgAs2/
 iKi5uKqxbvi6lwgbTRBDE2BHnH0m3AGjwNZ+4kKIeYSy41FnJt7Yycz5L/4aeLxHBp
 qtTtpT4tuHTfoH9HB+iLM+EQSjFOatfleCmDhRWZng04ylxi91Rq69prso5xx7rdjr
 7mNHlJN9xfujWzXTTiXOXnwHMWgdztlu2KssVoSSGrbPymg39/VsM7llV3l+f49/nU
 ToGsibgKYKh1Q==
Date: Tue, 5 Dec 2023 14:50:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 3/3] drm/tests: managed: Add a simple test for
 drmm_managed_release
Message-ID: <okubt4juvgbya5ybtfhozaczqvjhzqrtz3ltw4vylbmme5dzff@27tazbke5j25>
References: <20231205012210.1491532-1-michal.winiarski@intel.com>
 <20231205012210.1491532-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vhxtrj4cat76vpkc"
Content-Disposition: inline
In-Reply-To: <20231205012210.1491532-4-michal.winiarski@intel.com>
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


--vhxtrj4cat76vpkc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the rework

On Tue, Dec 05, 2023 at 02:22:10AM +0100, Micha=C5=82 Winiarski wrote:
> Add a simple test that checks whether the action is indeed called right
> away and that it is not called on the final drm_dev_put().
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/tests/drm_managed_test.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/t=
ests/drm_managed_test.c
> index cabe6360aef71..8dfbea21c35c5 100644
> --- a/drivers/gpu/drm/tests/drm_managed_test.c
> +++ b/drivers/gpu/drm/tests/drm_managed_test.c
> @@ -44,6 +44,29 @@ static void drm_test_managed_run_action(struct kunit *=
test)
>  	KUNIT_EXPECT_GT(test, ret, 0);
>  }
> =20

We should have a description of the intent of the test here.

> +static void drm_test_managed_release_action(struct kunit *test)
> +{
> +	struct managed_test_priv *priv =3D test->priv;
> +	int ret;
> +
> +	ret =3D drmm_add_action_or_reset(&priv->drm, drm_action, priv);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	ret =3D drm_dev_register(&priv->drm, 0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drmm_release_action(&priv->drm, drm_action, priv);
> +	KUNIT_EXPECT_TRUE(test, priv->action_done);
> +	priv->action_done =3D false;
> +
> +	drm_dev_unregister(&priv->drm);
> +	drm_kunit_helper_free_device(test, priv->drm.dev);
> +
> +	ret =3D wait_event_interruptible_timeout(priv->action_wq, priv->action_=
done,
> +					       msecs_to_jiffies(TEST_TIMEOUT_MS));
> +	KUNIT_EXPECT_EQ(test, ret, 0);

This tests that we have reached the timeout, thus the action never ran.

It's not clear to me what your intent is here.

This test is:

  - Registering an action
  - Registering the DRM device
  - Calling drmm_release_action on the previously registered action
  - Checking that the action has been run
  - Clearing the flag saying the action has been run
  - Unregistering the DRM device
  - Freeing the DRM device
  - Waiting for the action to run, but expecting it to never do?

I guess something like

static void drm_test_managed_release_action(struct kunit *test)
{
	struct managed_test_priv *priv =3D test->priv;
	int ret;

	ret =3D drmm_add_action_or_reset(&priv->drm, drm_action, priv);
	KUNIT_ASSERT_EQ(test, ret, 0);

	KUNIT_ASSERT_FALSE(test, priv->action_done);

	drmm_release_action(&priv->drm, drm_action, priv);
	ret =3D wait_event_interruptible_timeout(priv->action_wq, priv->action_don=
e,
					       msecs_to_jiffies(TEST_TIMEOUT_MS));
	KUNIT_EXPECT_GT(test, ret, 0);
	KUNIT_EXPECT_TRUE(test, priv->action_done);
}

would be enough?

> +}
> +
>  static int drm_managed_test_init(struct kunit *test)
>  {
>  	struct managed_test_priv *priv;
> @@ -65,6 +88,7 @@ static int drm_managed_test_init(struct kunit *test)
> =20
>  static struct kunit_case drm_managed_tests[] =3D {
>  	KUNIT_CASE(drm_test_managed_run_action),
> +	KUNIT_CASE(drm_test_managed_release_action),

Also, tests should be organized by alphabetical order

Maxime

--vhxtrj4cat76vpkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW8qngAKCRDj7w1vZxhR
xS3aAP9ea8p8iqVNYFgkQf5dD9oheX8j1hbq55d51fmbOZOmjAEA0YOMEP0s+w8O
8tIyQHlWKkd0RJJJu4SBunN5Ox4VoAU=
=jlmj
-----END PGP SIGNATURE-----

--vhxtrj4cat76vpkc--
