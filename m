Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308B904DA6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF43A10E199;
	Wed, 12 Jun 2024 08:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GyB3uyaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979E010E199
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:09:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F2E761203;
 Wed, 12 Jun 2024 08:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3688C3277B;
 Wed, 12 Jun 2024 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718179753;
 bh=qIdC5+lu1SEknjJJ51GXyfiihZ8p/z6UgJF+gLxllbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyB3uyawlYEjuE7xWe8gQxWLQJQZujpIg4lDjU1YaRJHiCJPrLWNWVWRMpVGtfr0S
 9UnBlSpAA4iuHCbJkGh9wXfZuWMb9DH6hbjSuAxDURlNmtx3IwE/qqjpJ7/9KhHVlv
 L5i/87ODm7q10P7s+kC6MTi5RH7Zhso85iAfodl22jM9A+yUqIm+UAVOGr26Kae2DU
 1qQ8A7QsQZTDWhQMhuQt2gyZnjQOAymuDqH+9Fi1JzU97Z8Z3sVsFV3EGM93J+4dND
 N8epbjclFpWzONEmcKbjZY5B3jnb/zBFcVnFfGyAow9HpoqIpe9FmwQKwiHhwGUO1/
 00HuDV+f3SD8g==
Date: Wed, 12 Jun 2024 10:09:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <20240612-garnet-condor-from-saturn-1c51bb@houat>
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="avglh3oymnxtl4ps"
Content-Disposition: inline
In-Reply-To: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
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


--avglh3oymnxtl4ps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 11, 2024 at 07:48:51AM GMT, Douglas Anderson wrote:
> At shutdown if you've got a _properly_ coded DRM modeset driver then
> you'll get these two warnings at shutdown time:
>=20
>   Skipping disable of already disabled panel
>   Skipping unprepare of already unprepared panel
>=20
> These warnings are ugly and sound concerning, but they're actually a
> sign of a properly working system. That's not great.
>=20
> It's not easy to get rid of these warnings. Until we know that all DRM
> modeset drivers used with panel-simple and panel-edp are properly
> calling drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
> then the panel drivers _need_ to disable/unprepare themselves in order
> to power off the panel cleanly. However, there are lots of DRM modeset
> drivers used with panel-edp and panel-simple and it's hard to know
> when we've got them all. Since the warning happens only on the drivers
> that _are_ updated there's nothing to encourage broken DRM modeset
> drivers to get fixed.
>=20
> In order to flip the warning to the proper place, we need to know
> which modeset drivers are going to shutdown properly. Though ugly, do
> this by creating a list of everyone that shuts down properly. This
> allows us to generate a warning for the correct case and also lets us
> get rid of the warning for drivers that are shutting down properly.
>=20
> Maintaining this list is ugly, but the idea is that it's only short
> term. Once everyone is converted we can delete the list and call it
> done. The list is ugly enough and adding to it is annoying enough that
> people should push to make this happen.
>=20
> Implement this all in a shared "header" file included by the two panel
> drivers that need it. This avoids us adding an new exports while still
> allowing the panel drivers to be modules. The code waste should be
> small and, as per above, the whole solution is temporary.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I came up with this idea to help us move forward since otherwise I
> couldn't see how we were ever going to fix panel-simple and panel-edp
> since they're used by so many DRM Modeset drivers. It's a bit ugly but
> I don't hate it. What do others think?

I don't think it's the right approach, even more so since we're so close
now to having it in every driver.

I ran the coccinelle script we started with, and here are the results:

=2E/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver vmw_p=
ci_driver is missing shutdown implementation
=2E/drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_platform=
_driver is missing shutdown implementation
=2E/drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_platf=
orm_driver is missing shutdown implementation

Looking at the drivers by hand, it seems consistent.

Moving forward, I think having a collection of coccinelle scripts that
we ask new driver authors to run or put them in CI somehow would be a
better path. We have other similar candidates that can't really be dealt
with any other way, like not using drmm_ memory allocations, or not
using drm_dev_enter / drm_dev_exit.

Maxime

--avglh3oymnxtl4ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmlXpQAKCRDj7w1vZxhR
xfYZAQCNE0EYHn2MLwCjQYIeOxpucznvCNyoclGbKw4F8J5smAD+NH27g4lOaipv
my3B4MclOH8NfBxWWBvKnT/LhTn1PAI=
=T2jV
-----END PGP SIGNATURE-----

--avglh3oymnxtl4ps--
