Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2208CBE487
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8F10E1DB;
	Mon, 15 Dec 2025 14:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l4fdbQXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65EC10E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:29:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F8B9407C7;
 Mon, 15 Dec 2025 14:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3651BC4CEF5;
 Mon, 15 Dec 2025 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765808984;
 bh=IIlQ7Jpm1J4ASKEQEKqjtVdyfOiI54c8CBKZNP/oWHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4fdbQXGhu7aq4nVKW70uSZJdrfxRTKK/HurNg+8xQSMyqVXOMNaFdPMDj6p/0wge
 dL6Ylsn+hI1nsQ68Uykk/a3pTnGt56VVC7H9u7B+i/mqcRjnAYeNFBciU3k70OFeJV
 OztDw9Nnk0xFBd4DmlvtKwPSRmWl9W9HmdOOi8ywbkvkdw1DqTHb2VnQSXSW6DhSPT
 hE6dFUHqW+D55qc2j1QUG+oa9fz2HT71pIPf1H+gwq8hZMdvRlpig01sGEK39GaPvn
 MhoyfgniD3WE3qWWeZq2NsxbzLU26davCCtL+Xtoe9bMfXL4Kr21kcIiur8TbNAQbO
 rK0ErGqxpRGzw==
Date: Mon, 15 Dec 2025 15:29:40 +0100
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
Subject: Re: [PATCH v2 01/26] drm/bridge: add of_drm_get_bridge()
Message-ID: <20251215-quirky-encouraging-waxbill-5b04e6@penduick>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-1-88f8a107eca2@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jpxp2yuvxjnvtegw"
Content-Disposition: inline
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-1-88f8a107eca2@bootlin.com>
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


--jpxp2yuvxjnvtegw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/26] drm/bridge: add of_drm_get_bridge()
MIME-Version: 1.0

Hi,

On Fri, Nov 28, 2025 at 05:50:11PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some.
>=20
> Solve this issue by creating a new of_drm_get_bridge() function that is
> identical to of_drm_find_bridge() except it takes a reference. Then
> of_drm_find_bridge() will be deprecated to be eventually removed.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a=
18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I don't think it's a good name still. It's way too close to
drm_bridge_get it gets confusing. I still believe that
of_drm_find_and_get_bridge() is a better name. If you disagree, please
explain why.

Maxime

--jpxp2yuvxjnvtegw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUAbUwAKCRAnX84Zoj2+
djcYAX0XDI3qHEaKNThqzvK+xH7wgFSb4PSqArOG86oyKIGMi8pT7b5csS5bOuV5
2ctCO38BgN8OxOo0ee8AltSidRvxpQt71QwlpeJAk75pjrFZxR3ZmGp82TJ8I9q7
RSr1bb4kZw==
=txhL
-----END PGP SIGNATURE-----

--jpxp2yuvxjnvtegw--
