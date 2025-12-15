Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC111CBE997
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2D910E54E;
	Mon, 15 Dec 2025 15:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mj4Td7K0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532D10E54E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 162DE60133;
 Mon, 15 Dec 2025 15:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F5FC4CEF5;
 Mon, 15 Dec 2025 15:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765812080;
 bh=MDT80+HnOqYoPF13DdZpWx5G4AfuEz3zXo+tGv3k9kQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mj4Td7K0i4vUtxfzfd4iz6hFgePmUEer1942TVlrOA9Rbo6KvDvecd5Lli1q1L0Ki
 qwX1zEN+87kYjIn6DV6wYqWZRKVMwNvpQa4jEjTL9uPBHyRmUnmY2xIAjK5iuiqLqe
 bjzy0N3KtEFKcXpYw1Wh2EY2Embua4NWw0NJYGmDKo1LaYMjGfA5f/yu8lYIO/U2wJ
 f6/WXWqXXpCwoGGuurff9s6rE7Cg5YolT6INs7hv7P89urh23hiSktIY2x4SePTR3l
 uJ8XJJiwQNMQeZk/C0HUNeYFUsapSWw+zpS3mE17LWGU92a0gGGB4/j5bp1IZYXceo
 QKJPdZygpvl5w==
Date: Mon, 15 Dec 2025 16:21:17 +0100
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/26] drm/bridge: add devm_of_drm_get_bridge
Message-ID: <20251215-amigurumi-bullmastiff-of-witchcraft-0dc22a@penduick>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-6-88f8a107eca2@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gsdrqopk6hwziqn7"
Content-Disposition: inline
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-6-88f8a107eca2@bootlin.com>
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


--gsdrqopk6hwziqn7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/26] drm/bridge: add devm_of_drm_get_bridge
MIME-Version: 1.0

On Fri, Nov 28, 2025 at 05:50:16PM +0100, Luca Ceresoli wrote:
> Several drivers (about 20) follow the same pattern:
>=20
>  1. get a pointer to a bridge (typically the next bridge in the chain) by
>     calling of_drm_find_bridge()
>  2. store the returned pointer in the private driver data, keep it until
>     driver .remove
>  3. dereference the pointer at attach time and possibly at other times
>=20
> of_drm_find_bridge() is now deprecated because it does not increment the
> refcount and should be replaced with of_drm_get_bridge() +
> drm_bridge_put().
>=20
> However some of those drivers have a complex code flow and adding a
> drm_bridge_put() call in all the appropriate locations is error-prone,
> leads to ugly and more complex code, and can lead to errors over time with
> code flow changes.
>=20
> To handle all those drivers in a straightforward way, add a devm variant =
of
> of_drm_get_bridge() that adds a devm action to invoke drm_bridge_put()
> when the said driver is removed. This allows all those drivers to put the
> reference automatically and safely with a one line change:
>=20
>   - priv->next_bridge =3D of_drm_find_bridge(remote_np);
>   + priv->next_bridge =3D devm_of_drm_get_bridge(dev, remote_np);
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> Changes in v2:
> - fix return value: NULL on error, as documented, not an ERR_PTR
> ---
>  drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  5 +++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 9b7e3f859973..59575a84eff6 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1442,6 +1442,34 @@ struct drm_bridge *of_drm_get_bridge(struct device=
_node *np)
>  }
>  EXPORT_SYMBOL(of_drm_get_bridge);
> =20
> +/**
> + * devm_of_drm_get_bridge - find the bridge corresponding to the device
> + *			    node in the global bridge list and add a devm
> + *			    action to put it
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

I still think that, if we want to introduce it, we need to be very clear
that it's not safe, and we need to add a TODO to remove it later on. But
why should we introduce a helper, and convert dozens of drivers to it,
for something that is neutral?

If anything, I'd rather see them call of_drm_get_bridge(under the new
name), and put back the reference in destroy.

Maxime

--gsdrqopk6hwziqn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUAnbQAKCRAnX84Zoj2+
dp5VAX9vgUBVKAQimc/xE5mx+OZGGMP2AAkyV8RQCAm07C/CeB4TANSmR+vX8fQm
oJBQh0ABfiGrjZ9H25V8ZEx7mg3ywz982YYke557o8h2KLo5yCMDUxK0PVo9ZwYr
bI9HAJ7y/g==
=YBE0
-----END PGP SIGNATURE-----

--gsdrqopk6hwziqn7--
