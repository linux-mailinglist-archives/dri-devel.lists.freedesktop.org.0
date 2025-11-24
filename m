Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECFC7FD81
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 11:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05A510E1FB;
	Mon, 24 Nov 2025 10:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MCFjtwHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2170810E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 10:21:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D5898601D0;
 Mon, 24 Nov 2025 10:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A31C4CEF1;
 Mon, 24 Nov 2025 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763979669;
 bh=OBgvU/HewE7AURcZkSTPDenefoBU8HiGHjgeE2JDZV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCFjtwHQ3V/pAkrHapvA+lllHrksyj0zfU/WZePoxPbbd8/fOMCfLEoE8Sfr/Hl5x
 wE+ZWjH5UoGzuGsysGziP14rgy2tPRwbBEGMpIiuY4WDYaq71697kYXYU/Dezdyx5i
 FlfICETC6R5HjGYmjb9NQIpIFNapyvhxh/gRBgDJyfQ/o0LNxUZAGksWZs8wUa2piR
 UVlMvWDFyhQNfYgK74HS9fmGGYBT1gGraQpnKezQdx6EzdrajqwclHxsp44VnlHxqh
 hUhG0Hx6fQTUyCMELPvKav+U9kKEbdIkhbLMfYRkBhzVqUYTbaCpfg+K7XXgykZQo2
 qfheB/yQc+XVQ==
Date: Mon, 24 Nov 2025 11:21:06 +0100
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
Subject: Re: [PATCH 03/26] drm/todo: add entry about converting to
 drm_of_find_bridge()
Message-ID: <lpu5lms6rk53xfgot2dltkcoa4m7gdckjow5khr7hppvpfieq6@fs5zzomieuzd>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-3-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4r6yluq4gkkddnih"
Content-Disposition: inline
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-3-0db98a7fe474@bootlin.com>
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


--4r6yluq4gkkddnih
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 03/26] drm/todo: add entry about converting to
 drm_of_find_bridge()
MIME-Version: 1.0

On Wed, Nov 19, 2025 at 02:05:34PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated, but converting some users is very
> complex and should be reasonably doable only after the DRM panel bridge
> lifetime rework. Add a TODO to track this.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a=
18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  Documentation/gpu/todo.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 9013ced318cb..1a4a11dee036 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -506,6 +506,22 @@ Contact: Maxime Ripard <mripard@kernel.org>,
> =20
>  Level: Intermediate
> =20
> +Convert users of of_drm_find_bridge() to drm_of_find_bridge()
> +-------------------------------------------------------------
> +
> +Taking a struct drm_bridge pointer requires getting a reference and putt=
ing
> +it after disposing of the pointer. Most functions returning a struct
> +drm_bridge pointer already call drm_bridge_get() to increment the refcou=
nt
> +and their users have been updated to call drm_bridge_put() when
> +appropriate. of_drm_find_bridge() does not get a reference and it has be=
en
> +deprecated in favor of drm_of_find_bridge() which does, but some users
> +still need to be converted.
> +
> +Contact: Maxime Ripard <mripard@kernel.org>,
> +         Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +Level: Intermediate
> +

My understanding is that there's no users left after this series, so do
we really need a todo?

Maxime

--4r6yluq4gkkddnih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQxkgAKCRAnX84Zoj2+
duD+AX9u2+TlkBeWYDhuk1Qks7O5LoJ/GJqUOWRWKucMSXXG0m3tGsfi6Epgaucu
bMpMP0gBgNzc3zm3QAihjM2NTWEx34nH5O6aoFpidyWNuv3rPcavDF7sK9120U7j
b/qTCRAFUQ==
=KQqV
-----END PGP SIGNATURE-----

--4r6yluq4gkkddnih--
