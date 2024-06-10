Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B3902044
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 13:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5B10E3D8;
	Mon, 10 Jun 2024 11:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dfcb4ZPx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7F10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 11:23:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8B533CE1250;
 Mon, 10 Jun 2024 11:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80378C2BBFC;
 Mon, 10 Jun 2024 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718018584;
 bh=xowKy7ttHfMUaUM+uHdbEw6XGE6pguNqiKHZGtqPbXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dfcb4ZPx8lK0+yp2nxm1VEMH6eyt0gArCyyHnUbzNGjuRrzqbsdAmQsMjiAZJE6ge
 UuagH0heWS4ky5pn9iyhGhy0nKJEZSK3GWXOVvPjW+k4EUeZeYHU3ckiUkjN5GwyJO
 SQPVrxLOq9Sea2uwSeHBbF3SOQI57J6wKx/nnrodhkUddRp829osEuX+GV1WDUExHi
 HoAetAhuiNOaj/2A/bZ+aSRfGjEvIjYN/jZLHP7G+BmQPZAuofNaRdvvMP9d55d02o
 S9Xjot9PhoTDl5XTR47sacTcAG0qKEYsaCzqbTMNIHm/AVlzAGGYIZf4+TrXAKNKmY
 8VH7UukUcdffA==
Date: Mon, 10 Jun 2024 13:23:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Adam Miotk <adam.miotk@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Smitha T Murthy <smitha.tmurthy@arm.com>, Deepak Pandey <deepak.pandey@arm.com>
Subject: Re: [PATCH] drm/bridge/panel: Fix runtime warning on panel bridge
 release
Message-ID: <20240610-gigantic-devious-tuna-e8a4e8@houat>
References: <20240610102739.139852-1-adam.miotk@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cz6p5zxgrj6zwsge"
Content-Disposition: inline
In-Reply-To: <20240610102739.139852-1-adam.miotk@arm.com>
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


--cz6p5zxgrj6zwsge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 11:27:39AM GMT, Adam Miotk wrote:
> Device managed panel bridge wrappers are created by calling to
> drm_panel_bridge_add_typed() and registering a release handler for
> clean-up when the device gets unbound.
>=20
> Since the memory for this bridge is also managed and linked to the panel
> device, the release function should not try to free that memory.
> Moreover, the call to devm_kfree() inside drm_panel_bridge_remove() will
> fail in this case and emit a warning because the panel bridge resource
> is no longer on the device resources list (it has been removed from
> there before the call to release handlers).
>=20
> Signed-off-by: Adam Miotk <adam.miotk@arm.com>

I've added a Fixes tag and applied to drm-misc-fixes, thanks!
Maxime

--cz6p5zxgrj6zwsge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmbiFQAKCRDj7w1vZxhR
xXDaAQCXTckO6Gt0AQM1LwNgDv8fB3Wis8cB4feQmE+ZtENTUQEAzZxNfc0dd2KH
uUb331tpnU9u+D8haTTvx1aghreDcwo=
=LhxN
-----END PGP SIGNATURE-----

--cz6p5zxgrj6zwsge--
