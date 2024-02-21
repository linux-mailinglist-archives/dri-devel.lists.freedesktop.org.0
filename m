Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E121685DBCF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3D10E74C;
	Wed, 21 Feb 2024 13:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V9yvpKAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1891710E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:45:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A604ECE1DA4;
 Wed, 21 Feb 2024 13:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F00DC433B1;
 Wed, 21 Feb 2024 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708523122;
 bh=BJHfR2bAYcqfGE3I7jpnJmREd+wIkIHX/KEdFxdNxEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V9yvpKAHKX1WltEJ2II938p0AA1QC7vXzKkuglhObkdmrkGI5z3dEVYrLqvzXRS5q
 ZxvKUYAvry0BC6AUZ/fEdagJZBM6RSkLGSv73vgr/VMTXBeQj10kx3ErKew8sQTHdH
 OvtsBrQfIesfTbfzEmKe12ho/3+QVunU9VSGoLQIxz6Tio6jI3zflXXIZmkBGCbTjM
 dAdvonYr1+9buy8TNKH8cGh0bl8fO+m8whFR+tNkFViUy9R/fTyNfNboTCPjSAmHau
 2EGNIX6DOvb7Hl1UCKzNQAygYCtlgA9Ywyt8vbdQDwIThTHuMb18oPwkW/Rc9F7EYs
 o8ax3Vj4mLX3w==
Date: Wed, 21 Feb 2024 14:45:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/sun4i: Fix layer zpos change/atomic modesetting
Message-ID: <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-4-megi@xff.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xizgahp2qebktux3"
Content-Disposition: inline
In-Reply-To: <20240216190430.1374132-4-megi@xff.cz>
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


--xizgahp2qebktux3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 16, 2024 at 08:04:26PM +0100, Ond=C5=99ej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
>=20
> Identical configurations of planes can lead to different (and wrong)
> layer -> pipe routing at HW level, depending on the order of atomic
> plane changes.
>=20
> For example:
>=20
> - Layer 1 is configured to zpos 0 and thus uses pipe 0. No other layer
>   is enabled. This is a typical situation at boot.
>=20
> - When a compositor takes over and layer 3 is enabled,
>   sun8i_ui_layer_enable() will get called with old_zpos=3D0 zpos=3D1, whi=
ch
>   will lead to incorrect disabling of pipe 0 and enabling of pipe 1.
>=20
> What happens is that sun8i_ui_layer_enable() function may disable
> blender pipes even if it is no longer assigned to its layer.
>=20
> To correct this, move the routing setup out of individual plane's
> atomic_update into crtc's atomic_update, where it can be calculated
> and updated all at once.
>=20
> Remove the atomic_disable callback because it is no longer needed.
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>

I don't have enough knowledge about the mixers code to comment on your
patch, so I'll let Jernej review it. However, this feels to me like the
pipe assignment is typically the sort of things that should be dealt
with device-wide, and in atomic_check.

If I'm talking non-sense, it would be great to mention at least why that
can't be an option in the commit log.

Maxime

--xizgahp2qebktux3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdX+bwAKCRDj7w1vZxhR
xZNgAP0a4L6Azcg9V6BM/jsiHiwH17jM+P8Er1XqzO57EQIFCQD/WAIto3Vlp7l6
KwBXVWBIRLqnsTHnduB8s/JicR+nIgU=
=6/Lk
-----END PGP SIGNATURE-----

--xizgahp2qebktux3--
