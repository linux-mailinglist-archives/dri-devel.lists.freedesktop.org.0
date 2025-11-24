Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76AFC7FF17
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 11:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903510E202;
	Mon, 24 Nov 2025 10:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="firEdU2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB93710E207
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 10:39:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C84AF60190;
 Mon, 24 Nov 2025 10:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0016EC4CEF1;
 Mon, 24 Nov 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763980780;
 bh=wG0LtNXrjp+tZ6+DjiOmVw4tWhV/2DPiV64zQMWzD6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=firEdU2gCtMh4N6YI19W5r3iOxB5sPvAIKExbAF0UKd6W/4+e4/WHnpUVVGhgtWBA
 a5pHIpAfdiYTEv1sen/+Y5y19BThHuf5QV7YsTbMjr03yNiePn6xxPFM9rBmFBGO/F
 TiEtraXUzP3fH1UnA4jBQAQTFMtojoqtoTg6/MraXPZFWcHy/puTwsedmw3WE0jHV2
 mylk4e1h00mN8rZh9xIGkDDB+u8aHBXDegba3zOnzn4UzfAVX9HfqEA2VqqP1N7+9d
 IFknDENgch1ihKzPP3CXf7xAiwSA7GPydZqDuHvGrkcGVvyUSstDSkj3J6juuaQQUN
 40rHR4ovEobtg==
Date: Mon, 24 Nov 2025 11:39:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Message-ID: <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wbm42ghgit2cp5t3"
Content-Disposition: inline
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
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


--wbm42ghgit2cp5t3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 02:05:37PM +0100, Luca Ceresoli wrote:
> Several drivers (about 20) follow the same pattern:
>=20
>  1. get a pointer to a bridge (typically the next bridge in the chain) by
>     calling of_drm_find_bridge()
>  2. store the returned pointer in the private driver data, keep it until
>     driver .remove
>  3. dereference the pointer at attach time and possibly at other times
>=20
> of_drm_find_bridge() is now deprecated because it does not increment the
> refcount and should be replaced with drm_of_find_bridge() +
> drm_bridge_put().
>=20
> However some of those drivers have a complex code flow and adding a
> drm_bridge_put() call in all the appropriate locations is error-prone,
> leads to ugly and more complex code, and can lead to errors over time with
> code flow changes.
>=20
> To handle all those drivers in a straightforward way, add a devm variant =
of
> drm_of_find_bridge() that adds a devm action to invoke drm_bridge_put()
> when the said driver is removed. This allows all those drivers to put the
> reference automatically and safely with a one line change:
>=20
>   - priv->next_bridge =3D of_drm_find_bridge(remote_np);
>   + priv->next_bridge =3D devm_drm_of_find_bridge(dev, remote_np);
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  5 +++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 09ad825f9cb8..c7baafbe5695 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct devic=
e_node *np)
>  }
>  EXPORT_SYMBOL(drm_of_find_bridge);
> =20
> +/**
> + * devm_drm_of_find_bridge - find the bridge corresponding to the device
> + *			     node in the global bridge list and add a devm
> + *			     action to put it
> + *
> + * @dev: device requesting the bridge
> + * @np: device node
> + *
> + * On success the returned bridge refcount is incremented, and a devm
> + * action is added to call drm_bridge_put() when @dev is removed. So the
> + * caller does not have to put the returned bridge explicitly.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure
> + */
> +struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct de=
vice_node *np)
> +{
> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
> +
> +	if (bridge) {
> +		int err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> +
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_find_bridge);

That's inherently unsafe though, because even if the bridge is removed
other parts of DRM might still have a reference to it and could call
into it.

We'd then have dropped our reference to the next bridge, which could
have been freed, and it's a use-after-free.

It's more complicated than it sounds, because we only have access to the
drm_device when the bridge is attached, so later than probe.

I wonder if we shouldn't tie the lifetime of that reference to the
lifetime of the bridge itself, and we would give up the next_bridge
reference only when we're destroyed ourselves.

Storing a list of all the references we need to drop is going to be
intrusive though, so maybe the easiest way to do it would be to create a
next_bridge field in drm_bridge, and only drop the reference stored
there?

And possibly tie the whole thing together using a helper?

Anyway, I'm not sure it should be a prerequisite to this series. I we do
want to go the devm_drm_of_find_bridge route however, we should at least
document that it's unsafe, and add a TODO entry to clean up the mess
later on.

Maxime

--wbm42ghgit2cp5t3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQ16QAKCRAnX84Zoj2+
drTLAX0QBwwX78SPwaYEqj6Om+7ADsxYhVrgX1HoD1xpc0ILj+Ur57K6wtKDIc5l
JWSP6zkBgJA2DSWw4vHzHhFRbZQ+eGEUkynilMkrpEr/EsrHbAzT3gfgz8IOyhGR
Vs8tk3i2Uw==
=/E1G
-----END PGP SIGNATURE-----

--wbm42ghgit2cp5t3--
