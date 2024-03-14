Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F0F87BF2C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A0D10EAF4;
	Thu, 14 Mar 2024 14:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I/F+lDGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210C310EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 14:42:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F381614E6;
 Thu, 14 Mar 2024 14:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA74DC433C7;
 Thu, 14 Mar 2024 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710427347;
 bh=t15/fUG8eEoCH9k/jfp6Z2u74HuUtlgqyLfEcx09Zp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/F+lDGS2y5xE5a5YA7GzDQLaThIZmXKLcUXFYPQFaGsCyeslKqQd7z1bZgb+ttps
 p5mDSY9dX7k5N4dsQUhv1iOtQsRWuHo8AEQwqNHtJvj8iWE+28xfJ6cLUgkfpw5Dy6
 FbdjrkPuMlr12cVAvOmggmYlSPsWGdjjeyY6KKSz6ONecqBDXb7gNac7Wp4FoC3dLc
 6ZNoHDmv98FB+bCPD3Uy/z4vuqh9rh69Qy3RDzDbAMxENPSBF4hFT2fC09ubBRpWbv
 ZDZoRRNkfMhzvDAdhzqCrY2AYJmjVfor08S+wsnhihdijuUoj0jTst4SswmtBSPxBn
 G4RFR8dxu6BwA==
Date: Thu, 14 Mar 2024 15:42:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <uwu@icenowy.me>, Ondrej Jirman <x@xnux.eu>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: tcon: Support keeping dclk rate upon ancestor
 clock changes
Message-ID: <20240314-careful-silky-bear-8ee43f@houat>
References: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nskffof7joxt6vlb"
Content-Disposition: inline
In-Reply-To: <20240310-tcon_keep_stable_rate-v1-1-0296b0a85c02@oltmanns.dev>
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


--nskffof7joxt6vlb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 10, 2024 at 02:32:29PM +0100, Frank Oltmanns wrote:
> Allow the dclk to reset its rate when a rate change is initiated from an
> ancestor clock. This makes it possible to no longer to get an exclusive
> lock. As a consequence, it is now possible to set new rates if
> necessary, e.g. when an external display is connected.
>=20
> The first user of this functionality is the A64 because PLL-VIDEO0 is an
> ancestor for both HDMI and TCON0. This allows to select an optimal rate
> for TCON0 as long as there is no external HDMI connection. Once a change
> in PLL-VIDEO0 is performed when an HDMI connection is established, TCON0
> can react gracefully and select an optimal rate based on this the new
> constraint.
>=20
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
> I would like to make the Allwinner A64's data-clock keep its rate
> when its ancestor's (pll-video0) rate changes. Keeping data-clock's rate
> is required, to let the A64 drive both an LCD and HDMI display at the
> same time, because both have pll-video0 as an ancestor.
>=20
> TCONs that use this flag store the ideal rate for their data-clock and
> subscribe to be notified when data-clock changes. When rate setting has
> finished (indicated by a POST_RATE_CHANGE event) the call back function
> schedules delayed work to set the data-clock's rate to the initial value
> after 100 ms. Using delayed work maks sure that the clock setting is
> finished.
>=20
> I've implemented this functionality as a quirk, so that it is possible
> to use it only for the A64.
>=20
> This patch supersedes [1].
>=20
> This work is inspired by an out-of-tree patchset [2] [3] [4].
> Unfortunately, the patchset uses clk_set_rate() directly in a notifier
> callback, which the following comment on clk_notifier_register()
> forbids: "The callbacks associated with the notifier must not re-enter
> into the clk framework by calling any top-level clk APIs." [5]
> Furthermore, that out-of-tree patchset no longer works since 6.6,
> because setting pll-mipi is now also resetting pll-video0 and therefore
> causes a race condition.

Workqueues don't have an upper boundary on when they execute. As we
discussed multiple times, this should be solved in the clock framework
itself, not bypassing it.

Maxime

--nskffof7joxt6vlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfMMzwAKCRDj7w1vZxhR
xQ1CAQDtICAPI7t6iHcGTsvHtbMc/Xou8mIobymUHWIa2ywO5QEAyvQlO/lPQtZc
I6gmabMvtrOKzIunluaotAq5NsaVYQY=
=IRk2
-----END PGP SIGNATURE-----

--nskffof7joxt6vlb--
