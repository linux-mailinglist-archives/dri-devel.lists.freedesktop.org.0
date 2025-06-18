Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3EADE58F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83510E05E;
	Wed, 18 Jun 2025 08:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XhylNVb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0DF10E05E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:32:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D7A45C5D17;
 Wed, 18 Jun 2025 08:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA55DC4CEE7;
 Wed, 18 Jun 2025 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750235564;
 bh=PJ6j+8ZdYsZHp7QWIcTY310+ctKE6geptGnMh8L2Mt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XhylNVb1gqxkx5X7CHQ6fLstVuEo4fA9mTr19b0NQb22/UDJ9XGvasSa8bePDJhJq
 XhBXPknvjUaH2PVrGjKxy3yT60SeiFw5IoBWNTOAsSbSCvqnQncmgTA05FjTkntHWa
 qIgR3qU0vWk9RsVdGGA0rvsvWb4CLK8SM6A4BXusrkJS8r899nOft2/QDmDYs1H37m
 BXyqPkJ+U0xVmrTam/RGWmU4pOU7YsBX2gChrwTdU0RQeW5QmRV+Szh4QtDw/CXZwz
 3dE9DuHqS2hBjcFIk2U5SjPLKtADkMUjaVaz2G9NLAvJISPz+GvHgmvm4m3t6xiOX/
 /Lq8QSIXegA6Q==
Date: Wed, 18 Jun 2025 10:32:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: jyri.sarha@iki.fi, dri-devel@lists.freedesktop.org, devarsht@ti.com, 
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
Message-ID: <20250618-groovy-stereotyped-aardwolf-27bb40@houat>
References: <20250618075804.139844-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="o3iuasowtw5fgira"
Content-Disposition: inline
In-Reply-To: <20250618075804.139844-1-j-choudhary@ti.com>
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


--o3iuasowtw5fgira
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
MIME-Version: 1.0

Hi,

On Wed, Jun 18, 2025 at 01:28:04PM +0530, Jayesh Choudhary wrote:
> TIDSS hardware by itself does not have variable max_pclk for each VP.
> Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
> devices uses "ultra-light" version where each VP supports a max of
> 300MHz whereas J7* devices uses TIDSS where all VP can support a
> max pclk of 600MHz.
> The limitation that has been modeled till now comes from the clock
> (PLL can only be programmed to a particular max value). Due to this
> we end up using different compatible for each SoC when the clocking
> architecture changes for VPs, even when the hardware is essentially
> the same.
> max_pclk cannot be entirely removed since the display controller
> should tell if a particular mode clock can be supported or not in crtc's
> "mode_valid()" call. So remove "max_pclk_khz" from the static display
> feat and add it to "tidss_device" structure which would be modified in
> runtime. In mode_valid() call, check if a best frequency match for mode
> clock can be found or not using "clk_round_rate()". Based on that,
> propagate "max_pclk" and check max_clk again only if the requested mode
> clock is greater than saved value. (As the preferred display mode is
> usually the max resolution, driver ends up checking the maximum clock
> the first time itself which is used in subsequent checks)
> Since TIDSS display controller provides clock tolerance of 5%, we use
> this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
> before it is called.
>=20
> This will make the existing compatibles reusable.
>=20
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

We've generally used 0.5% in drivers with similar requirements, because
that's what VESA requires for some mode generation techniques (and
what's required by HDMI too iirc).

We've never had to revisit it on any driver afaik, so unless you have a
specific reason to do so, I'd really prefer if you stuck with that as
well.

Maxime

--o3iuasowtw5fgira
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFJ5qAAKCRAnX84Zoj2+
dgJFAYDGvW6I2k43jc31wGvUwVP7jxtWW8ARqty16W/rDRc+402Bx5u70qFJCLzp
fN7Lu+wBf0R+rjsLdxyS1sSix3d7Jr7xFSWRfcpHZT4JUOF/0VnYa8ISb0/up2xT
p1JUhFoifg==
=NPEJ
-----END PGP SIGNATURE-----

--o3iuasowtw5fgira--
