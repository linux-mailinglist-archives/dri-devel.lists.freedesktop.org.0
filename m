Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EFB918544
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA210E901;
	Wed, 26 Jun 2024 15:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l79HF2tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E610E901
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:07:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C5F40CE1F2F;
 Wed, 26 Jun 2024 15:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD35BC116B1;
 Wed, 26 Jun 2024 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719414443;
 bh=8YbKPg4TH0BC9rgNk25pmOEVOwAaOWPwPd5XpI7GyLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l79HF2tudG6y/4LacGEmIzyqanrFY4qJLdhDHWHoayA9S/SPVKJfwlRiJFc/ZLmBL
 pxk5SruUJyQLU258DbEUdNhcVW5ef2Xl9iOTc991bkOlkKgTH5yP1aFkMffun9uWag
 n1eosgnZpDGNdHm0npm8arvFUS73RbIgjusSyMoufg0GYYw+zDXrct57mYGbzOXgnl
 683M8W3FynL7SSOfM35bpdcjp1qEfwNCWr0UGKCIeRQzjACOgai/jgEgJcZa0otq8A
 jC0llHIcb65n+0I3T7cpxwZCGRhpqZnPxd0ATG/1/hqM5CEvax4Ws+nKzL4t/1EFH+
 6a0fL/4hdvc6w==
Date: Wed, 26 Jun 2024 17:07:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/mipi-dsi: Fix devm unregister & detach
Message-ID: <20240626-warping-nondescript-mustang-bfce27@houat>
References: <20240619-dsi-devres-fix-v1-1-a5c59310a52e@ideasonboard.com>
 <20240626-gabby-ladybug-of-freedom-08e6eb@houat>
 <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4khqpx6p275qalu4"
Content-Disposition: inline
In-Reply-To: <66ab4206-d1c8-4aad-99a7-c4c316e343a9@ideasonboard.com>
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


--4khqpx6p275qalu4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:55:39PM GMT, Tomi Valkeinen wrote:
> On 26/06/2024 11:49, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Jun 19, 2024 at 12:07:48PM GMT, Tomi Valkeinen wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >=20
> > > When a bridge driver uses devm_mipi_dsi_device_register_full() or
> > > devm_mipi_dsi_attach(), the resource management is moved to devres,
> > > which releases the resource automatically when the bridge driver is
> > > unbound.
> > >=20
> > > However, if the DSI host goes away first, the host unregistration code
> > > will automatically detach and unregister any DSI peripherals, without
> > > notifying the devres about it. So when the bridge driver later is
> > > unbound, the resources are released a second time, leading to crash.
> >=20
> > That's super surprising. mipi_dsi_device_unregister calls
> > device_unregister, which calls device_del, which in turn calls
> > devres_release_all.
>=20
> Hmm, right.
>=20
> > If that doesn't work like that, then it's what needs to be fixed, and
> > not worked around in the MIPI-DSI bus.
>=20
> Well, something causes a crash for both the device register/unregister ca=
se
> and the attach/detach case, and the call stacks and debug prints showed a
> double unregister/detach...
>=20
> I need to dig up the board and check again why the devres_release_all() in
> device_del() doesn't solve this. But I can probably only get back to this=
 in
> August, so it's perhaps best to ignore this patch for now.
>=20
> However, the attach/detach case is still valid? I see no devres calls in =
the
> detach paths.

I'm not sure what you mean by the attach/detach case. Do you expect
device resources allocated in attach to be freed when detach run?

Maxime

--4khqpx6p275qalu4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnwuqAAKCRDj7w1vZxhR
xelYAP9rq4DgTOaWAG1GpentPFM+Oa9rCBemRAdO5P0rv5Pk3gEA6OdubZA8Txgw
Q5vjke+QG9l7PrrBtNutY58rA4DaqQ4=
=8rll
-----END PGP SIGNATURE-----

--4khqpx6p275qalu4--
