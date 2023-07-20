Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCF75AC8D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BDB10E083;
	Thu, 20 Jul 2023 11:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516EA10E083
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:06:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3F5A61943;
 Thu, 20 Jul 2023 11:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A048DC433C7;
 Thu, 20 Jul 2023 11:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689851215;
 bh=nW6GXJXezOzmxKL/mUK7YWV/NMfVem88eLoJC7XaP08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPXZJYsWPRAvaTWcfYGqmiW3vs3x0iPKKEk0GYNEYkOK9UkiAx7PPXWpWTOcy/s1A
 VXQ83P7k1kHTDazNqO/cqTcpQsFZ5WUScA4oWzS+8BxC24/9btrTtVrdHlVKZkkCDw
 30A2Lc98eVOYbxzfYhGr0e1y9UrNQ+kvWc4tsaFQTGL/M9BYXKswJiqyHHbRGPv85N
 Tcr+qMlV8MGewzEAcxaQhdidO0xzio7+V+FCqc1nFPmrXUj6arfGHufFQlmI+F/LFs
 ynBTcXbBL5tcoUA1Y5hXqg2MmmPzi8yAyKB4EOZTyTzuUUzONhNDTOB7jdZNhE2UWd
 G402Q/7XNRXZw==
Date: Thu, 20 Jul 2023 13:06:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [09/11] drm/vc4: tests: pv-muxing: Switch to managed locking init
Message-ID: <ofn74ygkyt7ms4rfe47rebf6anqnkeorytedtvctavpqwepaqy@gct4abic4wpq>
References: <20230710-kms-kunit-actions-rework-v1-9-722c58d72c72@kernel.org>
 <c1184f26-ac80-8138-6501-de0609d16004@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i6yioejuufk34fo2"
Content-Disposition: inline
In-Reply-To: <c1184f26-ac80-8138-6501-de0609d16004@loongson.cn>
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


--i6yioejuufk34fo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 01:24:29AM +0800, suijingfeng wrote:
> On 2023/7/10 15:47, Maxime Ripard wrote:
> > The new helper to init the locking context allows to remove some
> > boilerplate.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 42 ++++++++++++-----=
---------
> >   1 file changed, 19 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/g=
pu/drm/vc4/tests/vc4_test_pv_muxing.c
> > index 776a7b01608f..ff1deaed0cab 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> > @@ -20,7 +20,6 @@
> >   struct pv_muxing_priv {
> >   	struct vc4_dev *vc4;
> > -	struct drm_modeset_acquire_ctx ctx;
> >   	struct drm_atomic_state *state;
> >   };
> > @@ -725,6 +724,7 @@ static void drm_vc4_test_pv_muxing_invalid(struct k=
unit *test)
> >   static int vc4_pv_muxing_test_init(struct kunit *test)
> >   {
> >   	const struct pv_muxing_param *params =3D test->param_value;
> > +	struct drm_modeset_acquire_ctx *ctx;
> >   	struct drm_atomic_state *state;
> >   	struct pv_muxing_priv *priv;
> >   	struct drm_device *drm;
> > @@ -738,13 +738,14 @@ static int vc4_pv_muxing_test_init(struct kunit *=
test)
> >   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
> >   	priv->vc4 =3D vc4;
> > -	drm_modeset_acquire_init(&priv->ctx, 0);
> > +	ctx =3D drm_kunit_helper_acquire_ctx_alloc(test);
>=20
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>=20
> The pointer returned by drm_kunit_helper_acquire_ctx_alloc() function can=
't
> be NULL,
>=20
> if ctx is NULL, the current kthread will be terminated by the
> KUNIT_ASSERT_NOT_NULL() in the drm_kunit_helper_acquire_ctx_alloc().
>=20
> so only a PTR_ERR is possible, right?
>=20
> If so, probably invent a KUNIT_ASSERT_NOT_ERR() function to call is enoug=
h.
>=20
> I'm fine with this patch, but I feel the checking if the ctx is NULL is
> redundant.

I guess, but we're still reference that pointer later on, so making sure
that it's a valid pointer still makes sense.

Maxime

--i6yioejuufk34fo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLkVSwAKCRDj7w1vZxhR
xa9aAQDZyXaMtBF9l/m6WbuHQ7xXPN4u13bFG6gaQKEYJBXObQEAvvZ9chBq2mOw
+gey9Qa8fNru+HXpI0eQL4SLh5feZQo=
=AI02
-----END PGP SIGNATURE-----

--i6yioejuufk34fo2--
