Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621985E06C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 16:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAD310E52F;
	Wed, 21 Feb 2024 15:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DYKgfjgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124910E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDB73614E9;
 Wed, 21 Feb 2024 15:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0CFC433F1;
 Wed, 21 Feb 2024 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708527627;
 bh=tNI8DAwQiS3U+76WDXOGwjlOGOodCQKmY967vv8zU5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYKgfjgSYhcfzOxTLQ+TShQCkLSDx8rtyl7O/tYwb9Mon6JcgeuntWvh6LIoZuYKO
 LhVXGJHabc7eoHTUjmSCeZAy4yK2wypJFTmEJrvOV3XVLeeKNRFpL7glBVnJRxHKjt
 zWuru70nZKxp4IaAffNjHsUMxAOJ3cFQEbEWzXJ6h/pVI3LbX4rZnvzlthymDCLL7G
 RgRc3TZnNMq/OngUz88MzXD/HL05DnCofhTv+OeUKp2r9gXEhVKki1v7jQX56et/0l
 vq2e7vnKXIPfJfVtE/8X9Y+kklAuIZ/Q6O742a8eKhoXwEDenRhrVND5dDBatcvyub
 e/twrekwkSlVw==
Date: Wed, 21 Feb 2024 16:00:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH] drm/vc4: drv: Avoid possible NPD when booted without KMS
Message-ID: <temxzpaakaonl4fdl2sfke624cahlaqpjtrkcgtsbh34fzuju5@iwwhjq6hneh7>
References: <20240217150720.33257-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ueblwykal2ggprco"
Content-Disposition: inline
In-Reply-To: <20240217150720.33257-1-wahrenst@gmx.net>
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


--ueblwykal2ggprco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 17, 2024 at 04:07:20PM +0100, Stefan Wahren wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> In case there is no matching KMS,

Sorry, I'm not sure what a matching KMS is supposed to be here?

> the function vc4_match_add_driver won't change the match pointer which
> is initialized with NULL. Since component_master_add_with_match
> doesn't expected match to be a NULL pointer, this results into a NPD.
>=20
> Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index c133e96b8aca..4f17840df9d3 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -439,6 +439,8 @@ static int vc4_platform_drm_probe(struct platform_dev=
ice *pdev)
>=20
>  	vc4_match_add_drivers(dev, &match,
>  			      component_drivers, ARRAY_SIZE(component_drivers));
> +	if (!match)
> +		return -ENODEV;

=46rom the looks of it, it would return the pointer to the last matched
driver. I'm not sure how useful it is, but if it's NULL it would mean
that the main brcm,bcm2835-vc4 device would have probed, but not any of
its subdevice? How can that happen?

Maxime

--ueblwykal2ggprco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdYQBwAKCRDj7w1vZxhR
xVUaAQDL/mm0hSJhd/Im/xKHEHG4W/2LbD4+9++WgS21RlO4mQEAiX9Sosp+Ukgd
j1HDuVgFLplZZ0BqKbnpaIIRbnnTHAw=
=pbZX
-----END PGP SIGNATURE-----

--ueblwykal2ggprco--
