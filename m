Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05C8BC85C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48A010E1F1;
	Mon,  6 May 2024 07:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LTT6vfcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FFF10E237
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 07:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98ECA60F73;
 Mon,  6 May 2024 07:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDF3C116B1;
 Mon,  6 May 2024 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714980579;
 bh=6EAfDReBTGm2/618iI3K5J9zc5rNJX39dIPTNS7/tC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTT6vfcvkv+HM+jrI2Ok6j4+eJlWYmbJn2/gUqM4HBexny+ZPOtF3kTZ7bla4jK9f
 NoyyXaR6xdUl7F8hPvO63U5xyg28jtKJmAORVdzwL5lYHrGBu5t8bAKih3aAu9frYI
 0gDlAz9fp8Bzc09RCv/Ei4+F3oPBKcXU4JeOlMaEnfmFfinRMiw3YLVp8/AiFYjxAz
 jUL+BuUNplEfy/8S6WKjIylgkGqdkwPqRHI283ob1XYdgBdcnOfA021042v77EAdx0
 B5iXaAm0LRAjr+PqEszgHpTWuE3BfKRgRKHYmLvj31BMeqgUK5eE333c/+lxQmYSP2
 pGJHumzUzEY5w==
Date: Mon, 6 May 2024 09:29:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
Message-ID: <20240506-charcoal-griffin-of-tact-174dde@houat>
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <20240504122118.GB24548@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ocucrrp6xgvwroku"
Content-Disposition: inline
In-Reply-To: <20240504122118.GB24548@pendragon.ideasonboard.com>
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


--ocucrrp6xgvwroku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent, Sean,

On Sat, May 04, 2024 at 03:21:18PM GMT, Laurent Pinchart wrote:
> On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
> > I have discovered a bug in the displayport driver on drm-misc-next. To
> > trigger it, run
> >=20
> > echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
> >=20
> > The system will become unresponsive and (after a bit) splat with a hard
> > LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
> > zynqmp_dp_bridge_detect.
> >=20
> > I believe the issue is due the registers being unmapped and the block
> > put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release.
>=20
> That is on purpose. Drivers are not allowed to access the device at all
> after .remove() returns.

It's not "on purpose" no. Drivers indeed are not allowed to access the
device after remove, but the kernel shouldn't crash. This is exactly
why we have drm_dev_enter / drm_dev_exit.

Maxime

--ocucrrp6xgvwroku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjiG4AAKCRAnX84Zoj2+
dgeOAX9MWR6b74vbLNz7k9jf5IToCNO+03AZ7DaUKMEY6avOZ4UMCs5HJXcFnAR+
/TeAmFIBgJyNn/OtniP2Hp5Bfq8TvJKZl8ZZ6WzuVaWny/ME4+2poozKoG2ZNm0K
70BmtsE9YA==
=rd0O
-----END PGP SIGNATURE-----

--ocucrrp6xgvwroku--
