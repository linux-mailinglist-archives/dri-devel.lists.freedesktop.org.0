Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1493BDF2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B71B10E3D4;
	Thu, 25 Jul 2024 08:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E7bSXh2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813810E3D4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93981CE1247;
 Thu, 25 Jul 2024 08:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CD9C32786;
 Thu, 25 Jul 2024 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721896122;
 bh=R+MoQiq0ezXB3XUgzyXzBvBtjpK07hHk3p2j78N9lh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7bSXh2QEpeFLrgo50q77a7Qc+a2y5K4KYSSMnartGgIIq5vN6vsVWubYTfWhdvMd
 Hb6DjsEEDIDysBiAcJgPmyZJN7Ft7TC0exOylfaP3DY2G7JoqMvGptcWtZ8wizpWgv
 TXEWbX5gMf5WG2ZoIYoea+4jhkR+CCrEZSW9WPBbKdjt9hpKYGVAfNTbEsWkNAMTll
 bIxpPK0z6nRrQPKivW0wGqdcizSMc4JajpVFdpskDVhyKf63dMsQy7s0wNV1qzuJXh
 Gu2mmhFSwZD6XkpRRoCmhPqH7UFATGBsU5aBLTalkqY9S7bwvtbg2cq0sQ+CMpzxwJ
 RnTMyouDUfTRw==
Date: Thu, 25 Jul 2024 10:28:39 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, dianders@chromium.org,
 airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet
 member of mipi_dsi_multi_context
Message-ID: <20240725-psychedelic-benevolent-muskrat-c7fd57@houat>
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
 <20240724122447.284165-3-tejasvipin76@gmail.com>
 <877cdakdq9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r2kg2p45e23w6s6x"
Content-Disposition: inline
In-Reply-To: <877cdakdq9.fsf@intel.com>
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


--r2kg2p45e23w6s6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 06:32:14PM GMT, Jani Nikula wrote:
> On Wed, 24 Jul 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> > Changes all the multi functions to check if the current context requires
> > errors to be printed or not using the quiet member.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_=
dsi.c
> > index a471c46f5ca6..cbb77342d201 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -814,6 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_m=
ulti_context *ctx,
> >  	ret =3D mipi_dsi_generic_write(dsi, payload, size);
> >  	if (ret < 0) {
> >  		ctx->accum_err =3D ret;
> > +		if (ctx->quiet)
> > +			return;
> >  		dev_err(dev, "sending generic data %*ph failed: %d\n",
> >  			(int)size, payload, ctx->accum_err);
>=20
> A maintainability nitpick. Imagine someone wishing to add some more
> error handling here. Or something else after the block.
>=20
> IMO the dev_err() should be wrapped in if (!ctx->quiet) instead of
> adding an early return.
>=20
> Ditto everywhere.

I'm not even sure why we need that parameter in the first place.

Like, what's the expected use of that parameter? Is it supposed to be
set in users of that function?

If so, wouldn't it prevent any sort of meaningful debugging if some
drivers set it and some don't?

It looks to me like you're reimplementing drm.debug.

Maxime

--r2kg2p45e23w6s6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqIMtwAKCRAnX84Zoj2+
dlgKAYCM7vThWWKXhQ8H0+codSU+dOKiX3sOnmy+JtM314VYoUeoIkOL/T5in0rI
XydYT+0BgKduy10xN7iJHLlze+TRKqBWe42kHDIufi1CXCQgHpWfKDiDlyEAVJsS
b625L4kCgg==
=LDgv
-----END PGP SIGNATURE-----

--r2kg2p45e23w6s6x--
