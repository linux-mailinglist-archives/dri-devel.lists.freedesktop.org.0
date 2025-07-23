Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9CB0EB0E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 08:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047DF10E755;
	Wed, 23 Jul 2025 06:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sPIhSHHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A61E10E755
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:57:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CB1CA54AD9;
 Wed, 23 Jul 2025 06:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07A4C4CEE7;
 Wed, 23 Jul 2025 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753253830;
 bh=RVU+KRzzrapNt7trRutwG9dz5pii8N4G+QFx0z4cerQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sPIhSHHApLwAe8MDh8immv2YlR4w5M5EDhf4iqfHnjzuZz8vL2u3OQIHagkAxFANG
 lgAf8+r0FAN7aT/it8TYikZHG2B7EmGSVETevK4eBpu4mrznYrgzDQzO2GDPMXEpTJ
 kHePx1XtvlGSgMWKMNnSHX/SYogNSarb/xLytKjP8TspjTd9px7JnInVI1aIgUVlPq
 U4+dW+xWLzI442+HOug3/PKwvJ3Q/7MgaV15udoT5uBQ3v9RuX5p/idiQ94KAvGt9C
 ClH/Dj6yDKOJMAXAbMC60+dTQkCOiC2bwAKAI3x7lt5F0oZBrS4sJxmgK/cHSnR2i9
 gl+KOcvf/Kmxw==
Date: Wed, 23 Jul 2025 08:57:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 biju.das.jz@bp.renesas.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
Message-ID: <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
References: <20250722204114.3340516-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="v64vw7w5u4nnxhww"
Content-Disposition: inline
In-Reply-To: <20250722204114.3340516-1-chenyuan0y@gmail.com>
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


--v64vw7w5u4nnxhww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 03:41:14PM -0500, Chenyuan Yang wrote:
> drm_atomic_get_new_connector_for_encoder and
> drm_atomic_get_new_connector_state could return Null.

They can, but not in that scenario. atomic_enable will never be called
if either would return NULL.

In which situation did you trigger this bug?

> Thus, add the null pointer check for them with a similar format with
> it6505_bridge_atomic_enable in ITE IT6505.
>=20
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index a3a63a977b0a..3a20b2088bf9 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  	struct drm_connector *connector;
>  	bool is_stable =3D false;
>  	struct drm_crtc *crtc;
> +	struct drm_connector_state *conn_state;
>  	unsigned int val;
>  	bool pclk_high;
>  	int i, ret;
> =20
>  	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
> -	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc =3D conn_state->crtc;
>  	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
>  	mode =3D &crtc_state->adjusted_mode;
> +	if (WARN_ON(!mode))
> +		return;

And that condition can never be true.

Maxime

--v64vw7w5u4nnxhww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaICHvgAKCRAnX84Zoj2+
dswIAYCeMGJa7sCOX8bvJRHr3W2xrdlJl81rl4rZOgrggToExAt6Y5mIXlMzNLM/
zGTl6qIBgNrjx+dqnhqGxGwmdIKU/Nd0ludwq2bakr3C+JWeHRCfcQk+hLK7ns/c
KXvBJLcxSA==
=sF80
-----END PGP SIGNATURE-----

--v64vw7w5u4nnxhww--
