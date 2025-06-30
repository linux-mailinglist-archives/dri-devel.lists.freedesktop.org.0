Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7543AAED78D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6B510E3C0;
	Mon, 30 Jun 2025 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PDL60iqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE310E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:40:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 000EDA53130;
 Mon, 30 Jun 2025 08:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CB6C4CEE3;
 Mon, 30 Jun 2025 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751272838;
 bh=lB8TRq8TTHPzjdVo79WO4ecRkc8FNlHlywZe0sSoqvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDL60iqd2lpzF4Bbktn/oHvxi+sCSFXAyFfthFUQv7xwUfhgP4ek2x+VbxUAxQ9Ef
 k1IKj7rZyZWjkl4Me8493b/LtR6Fa80gMJuuxRowXhhsiVOGpWq3XSE5qKwSsEzIDC
 cl6D3+Nm8xJn7Ey4URmnU9fbFhhvMeX4T20XVEl75MEp7Abe+M6fBLWjC2on2JWctw
 0yW+irIGqguPyitGZ74WVyEg2MbdcpnOGBxC87JeEG4Urmh3wrOoQKW84T52TWZoRB
 dt4ppSSmdKAeRSgZ/s9GLXi2/RrxH82JB61C0waeE5rWW6ZWV06PIksPq9vRSRttfw
 fRM9D5ENHcqJA==
Date: Mon, 30 Jun 2025 10:40:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Message-ID: <20250630-angelic-macaque-of-spirit-fadc59@houat>
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
 <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="izemynhnx7j6b5ge"
Content-Disposition: inline
In-Reply-To: <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
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


--izemynhnx7j6b5ge
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 09:46:40AM +0200, Loic Poulain wrote:
> Hi Maxime,
>=20
> On Mon, Jun 30, 2025 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> > > DRM checks EDID block count against allocated size in drm_edid_valid
> > > function. We have to allocate the right EDID size instead of the max
> > > size to prevent the EDID to be reported as invalid.
> > >
> > > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/=
drm/bridge/analogix/anx7625.c
> > > index 8a9079c2ed5c..5a81d1bfc815 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read=
(struct anx7625_data *ctx)
> > >               return NULL;
> > >       }
> > >
> > > -     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK_SI=
ZE);
> > > +     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num * ON=
E_BLOCK_SIZE);
> > >       kfree(edid_buf);
> >
> > Do we need to cache the whole EDIDs? AFAIU, it's only ever used to get
> > the manufacturer name, which fits into a u32 / 4 u8. We should probably
> > just cache that.
>=20
> While the cached EDID is indeed used internally to retrieve the
> product ID, its content is also returned via the DRM read_edid
> callback. This value is then used by the DRM core to enumerate
> available display modes, and likely also when reading EDID from sysfs.

You still don't need to allocate and store a copy of the EDIDs in your
driver to implement what you listed so far.

Maxime

--izemynhnx7j6b5ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJNgwAKCRAnX84Zoj2+
dlP8AX0fEWpohjkoghStxi3ngl3MO15qWgVfLAf0ckyTaNcPdkep3tEINsTtlLEQ
D8cPHdcBgPIs0ZPp0X+yhUqmq0Ut8TwXA64SnmgxxHlZxTjbqHWpG7Wwad071nQD
u8yXmW3fuw==
=WZ6Q
-----END PGP SIGNATURE-----

--izemynhnx7j6b5ge--
