Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20703917B59
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487310E7D0;
	Wed, 26 Jun 2024 08:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OYGQ2IbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03FF10E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:49:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3C1C618A6;
 Wed, 26 Jun 2024 08:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C088C2BD10;
 Wed, 26 Jun 2024 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719391790;
 bh=x2FQqs4Sx0iJn0+hfgdF3u+B2PEHaqqKDMTHL+Hlyu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYGQ2IbGRTMrHKwG4fIR9ePAyoeTZCAVRGxiy9a7ZhDnz/t11Ps202E2sT+ZsKKbM
 XUtr+ozeoGNb3FWN36aN0Z6Mm5iNQ4nCVaEg3RptIoKGfhZSplP++PEMnmq8yPWqqc
 Dpx3vSlrc+lF/rwYamEsNcD+dGgRZho+fVh22thNfkvdyIOZtG0cnBH8lea7iHzV4o
 PK50q/u+0lo7gaQOa96DZ966nan/1EIv7vrA6bn1hR5E1F71ZBZl+PbPf40VaUOGlP
 oPQHILH6IJaaqc2iAbUJhfnwLdipDfRWFqwcPevbEHdslAxVGb/TC35xyUjrr8dRp0
 QZqRchXBTvhHA==
Date: Wed, 26 Jun 2024 10:49:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <20240626-gabby-ladybug-of-freedom-08e6eb@houat>
References: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ma4ycpybtoh2dbzf"
Content-Disposition: inline
In-Reply-To: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
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


--ma4ycpybtoh2dbzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> When a bridge driver uses devm_mipi_dsi_device_register_full() or
> devm_mipi_dsi_attach(), the resource management is moved to devres,
> which releases the resource automatically when the bridge driver is
> unbound.
>=20
> However, if the DSI host goes away first, the host unregistration code
> will automatically detach and unregister any DSI peripherals, without
> notifying the devres about it. So when the bridge driver later is
> unbound, the resources are released a second time, leading to crash.

That's super surprising. mipi_dsi_device_unregister calls
device_unregister, which calls device_del, which in turn calls
devres_release_all.

If that doesn't work like that, then it's what needs to be fixed, and
not worked around in the MIPI-DSI bus.

Maxime

--ma4ycpybtoh2dbzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnvWKwAKCRDj7w1vZxhR
xV+RAQDxPPXHzU0G5JIlvexkx+UGfN/vqNUmfWcE/Uf5o9YCBgD6AxDzso4qILCM
yKnz2Ap02KUvyMTtu1qzFLkfRoYDzAI=
=Paf6
-----END PGP SIGNATURE-----

--ma4ycpybtoh2dbzf--
