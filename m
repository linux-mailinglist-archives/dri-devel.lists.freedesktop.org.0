Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E423F75A99B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303EE10E582;
	Thu, 20 Jul 2023 08:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876C410E582
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:51:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA08361926;
 Thu, 20 Jul 2023 08:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40F0C433C8;
 Thu, 20 Jul 2023 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689843112;
 bh=HawccqGqyVlf764W/NOFn3COnr0ylEZsAjLXeXUl4aQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pbWXZhSuzuJWM8r1yz8zhjekJhaboxy/BPX6nwNFV2643Qbt9n8mtAKNGzTrfZuiu
 hN8NjDFdh+mrP09j5lVx7/IWeEuS2hb+q/O0zwqiYev/WWOTdINVWjEjw6K2DjLqiO
 56rZjuXdaX7wk2dBUp1bs7wxr8GhysTWWinE7MBirGzR/DUzfNMZuMk+SUsykppW9a
 uwxECX3kUBuM02JNCVK+avI3+DwKZxfzDkIjgmjrTAZ7JcTBhfgD/keaEd0Gl+SazH
 4hghknlyh6GStTdcGMP7+4QQW+EIUEPKUZCc1F5xkwCGVe/w4WF0RlKfUdRXSQ+vps
 96f+fzGmXNJgQ==
Date: Thu, 20 Jul 2023 10:51:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 01/11] drm/tests: helpers: Switch to kunit actions
Message-ID: <d4mumwtbm57kit3lucpa33cgwh6eleca5mysmnl7gkum5nbppg@3vjsmurh4cpe>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-1-722c58d72c72@kernel.org>
 <871qh3ivys.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v5sjhm3u4teqa6wz"
Content-Disposition: inline
In-Reply-To: <871qh3ivys.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v5sjhm3u4teqa6wz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Thanks for reviewing the series

On Wed, Jul 19, 2023 at 08:42:51PM +0200, Javier Martinez Canillas wrote:
> > diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/dr=
m/tests/drm_kunit_helpers.c
> > index 4df47071dc88..38211fea9ae6 100644
> > --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> > @@ -35,8 +35,8 @@ static struct platform_driver fake_platform_driver =
=3D {
> >   * able to leverage the usual infrastructure and most notably the
> >   * device-managed resources just like a "real" device.
> >   *
> > - * Callers need to make sure drm_kunit_helper_free_device() on the
> > - * device when done.
> > + * Resources will be cleaned up automatically, but the removal can be
> > + * forced using @drm_kunit_helper_free_device.
> >   *
> >   * Returns:
> >   * A pointer to the new device, or an ERR_PTR() otherwise.
> > @@ -49,12 +49,31 @@ struct device *drm_kunit_helper_alloc_device(struct=
 kunit *test)
> >  	ret =3D platform_driver_register(&fake_platform_driver);
> >  	KUNIT_ASSERT_EQ(test, ret, 0);
> > =20
> > +	ret =3D kunit_add_action_or_reset(test,
> > +					(kunit_action_t *)platform_driver_unregister,
> > +					&fake_platform_driver);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> >  	pdev =3D platform_device_alloc(KUNIT_DEVICE_NAME, PLATFORM_DEVID_NONE=
);
> >  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> > =20
> > +	ret =3D kunit_add_action_or_reset(test,
> > +					(kunit_action_t *)platform_device_put,
> > +					pdev);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> >  	ret =3D platform_device_add(pdev);
> >  	KUNIT_ASSERT_EQ(test, ret, 0);
> > =20
> > +	kunit_remove_action(test,
> > +			    (kunit_action_t *)platform_device_put,
> > +			    pdev);
> > +
>=20
> I understand that this action removal is because platform_device_put() is
> not needed anymore after the platform_device_unregister() remove action is
> registered since that already takes care of the platform_device_put().

It's not so much that it's not needed after platform_device_unregister,
but rather that once you've called paltform_device_add my understanding
was that you didn't need it anymore.

I can't find where I got that from though, so I might be wrong. It also
looks like I could just use platform_device_del directly and not cancel
platform_device_put which will make it more obvious.

> But maybe add a comment to make more clear for someone who is not familiar
> with these details of the platform core ?
>=20
> >  EXPORT_SYMBOL_GPL(drm_kunit_helper_alloc_device);
> > @@ -70,8 +89,13 @@ void drm_kunit_helper_free_device(struct kunit *test=
, struct device *dev)
> >  {
> >  	struct platform_device *pdev =3D to_platform_device(dev);
> > =20
> > -	platform_device_unregister(pdev);
> > -	platform_driver_unregister(&fake_platform_driver);
> > +	kunit_release_action(test,
> > +			     (kunit_action_t *)platform_device_unregister,
> > +			     pdev);
> > +
> > +	kunit_release_action(test,
> > +			     (kunit_action_t *)platform_driver_unregister,
> > +			     &fake_platform_driver);
> >  }
> >  EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
> >
>=20
> I thought the point of using the kunit cleanup actions was that you could
> just make the kunit framework handle the release of resources and not do
> it manually?

You're right

> Can you just remove this function helper or is still needed in some cases?

We still need it for the drmm execution test where we would force the
removal of the device. All other tests at the moment shouldn't call it.

Maxime

--v5sjhm3u4teqa6wz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLj1pQAKCRDj7w1vZxhR
xTwiAQCj5aXu2IuAajHjVGN6or5R+COupohCAxVFuoNAD0BKPgEAk+7/v0U6jd6Z
pigQPBFRpCbbgmbH/3/GtUnb1TFoPwc=
=RE1j
-----END PGP SIGNATURE-----

--v5sjhm3u4teqa6wz--
