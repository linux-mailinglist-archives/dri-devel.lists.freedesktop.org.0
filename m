Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDD79732D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7E710E7FC;
	Thu,  7 Sep 2023 14:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B1510E7FC;
 Thu,  7 Sep 2023 14:52:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B3950CE19A9;
 Thu,  7 Sep 2023 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C69C36AF0;
 Thu,  7 Sep 2023 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694098327;
 bh=x6NiQyILoj1eqyGKlm/443rpiPj2WXFz+DcvuAxNQsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egP+5SjdR4QoNpCt3aXtos81w3vmTl/OGF9jNyFqP0JrwW2Ci1qj1eClbhXpe0uIG
 fDhDZV9Vau6OqITXXygaMUBDS9dtLzf34BPI+ZHijVvekvvpJ8asNGC8qLzbXsslr1
 aQId5Et9XE1G3fxV6XbrKftiW97mePnWRoGMjwAMIwhqISYgRIbO9Xfen1g4bDMZB3
 B3PrxR+cVGqMNPca+RPEfi6zTybHtJ/jQLcy5ENh7pPbokid1/GiuBc9LkjJAcf+1O
 0jKP6TqsspaipflXVuoREox/IDryhTrv0WQQxcfvttFwpGvjhs86sK5ymaLsQCzQO7
 yUIfN+CsQNJSA==
Date: Thu, 7 Sep 2023 16:52:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/tests/drm_exec: Add a test for object freeing
 within drm_exec_fini()
Message-ID: <wamimmsyk4wo4pawajfxdpzvjxldzka7hcvamf2b5pge2r4uzk@2cyjpckmry6k>
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <20230907135339.7971-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v5ld24ocpa6gn6ea"
Content-Disposition: inline
In-Reply-To: <20230907135339.7971-3-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v5ld24ocpa6gn6ea
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, Sep 07, 2023 at 03:53:39PM +0200, Thomas Hellstr=F6m wrote:
> Check that object freeing from within drm_exec_fini() works as expected
> and is unlikely to generate any warnings.
>=20
> v3:
> - Condition the test on CONFIG_DEBUG_LOCK_ALLOC
> - Make the test fail if the situation that generates the lockdep
>   warning occurs. (Maxime Ripard)
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 82 +++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index 563949d777dd..83fddc6fe1ae 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -21,6 +21,9 @@
>  struct drm_exec_priv {
>  	struct device *dev;
>  	struct drm_device *drm;
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	struct drm_exec *exec;
> +#endif
>  };
> =20
>  static int drm_exec_test_init(struct kunit *test)
> @@ -170,6 +173,82 @@ static void test_prepare_array(struct kunit *test)
>  	drm_gem_private_object_fini(&gobj2);
>  }
> =20
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +static void drm_exec_test_obj_free(struct drm_gem_object *gem)
> +{
> +	struct kunit *test =3D current->kunit_test;
> +	struct drm_exec_priv *priv =3D test->priv;
> +	bool resv_class_held;
> +	bool first_object_locked;
> +
> +	/*
> +	 * The lock alloc tracking code may warn if the dma_resv lock
> +	 * class is still held, and we're freeing the first object we
> +	 * locked.
> +	 */
> +	resv_class_held =3D (lockdep_is_held(&gem->resv->lock.base) =3D=3D
> +			   LOCK_STATE_HELD);
> +	first_object_locked =3D (gem =3D=3D priv->exec->objects[0]);
> +	KUNIT_EXPECT_FALSE(current->kunit_test,
> +			   resv_class_held && first_object_locked);
> +
> +	dma_resv_fini(gem->resv);
> +	kfree(gem);
> +}
> +
> +static const struct drm_gem_object_funcs put_funcs =3D {
> +	.free =3D drm_exec_test_obj_free,
> +};
> +
> +/*
> + * Check that freeing objects from within drm_exec_fini()
> + * doesn't trigger a false lock alloc warning due to
> + * the dma_resv lock *class* still being held and we're
> + * freeing the first object locked, which *might* be
> + * registered as the address of the held lock of that
> + * lock class.
> + */
> +static void test_early_put(struct kunit *test)
> +{
> +	struct drm_exec_priv *priv =3D test->priv;
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[2];
> +	struct drm_exec exec;
> +	int ret;
> +
> +	priv->exec =3D &exec;
> +
> +	gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, gobj1);
> +	if (!gobj1)
> +		return;
> +
> +	gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, gobj2);
> +	if (!gobj2) {
> +		kfree(gobj1);
> +		return;
> +	}
> +
> +	gobj1->funcs =3D &put_funcs;
> +	gobj2->funcs =3D &put_funcs;
> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
> +	array[0] =3D gobj1;
> +	array[1] =3D gobj2;
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec)
> +		ret =3D drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> +					     1);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	drm_gem_object_put(gobj1);
> +	drm_gem_object_put(gobj2);
> +	drm_exec_fini(&exec);
> +}
> +#endif

We might want to revisit this later depending on the answer from the
kunit maintainers, but for now

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--v5ld24ocpa6gn6ea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPnjlAAKCRDj7w1vZxhR
xWUmAP94u+ah97I8fXQYrry8snHAsldRlP/jHJ/tafLvg/d07AEAyRGN2TzDrvCK
onYrCg3a+6UPq12s6kh6z66A2yhjyAc=
=gS6k
-----END PGP SIGNATURE-----

--v5ld24ocpa6gn6ea--
