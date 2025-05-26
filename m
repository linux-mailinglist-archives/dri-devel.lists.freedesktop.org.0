Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A406AC4375
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 19:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2C10E31D;
	Mon, 26 May 2025 17:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TLipo4G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0810E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 17:30:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C307744EFE;
 Mon, 26 May 2025 17:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEFAC4CEE7;
 Mon, 26 May 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748280637;
 bh=++BoeWAgoVok/kbNT/X+LVWuRHe4UOQ0Rg+rCYlkPWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TLipo4G1A4/dTZ2yoky4OJWMqtN5wnK1+8zs1tLfjZ37azdeDbxOn33urpKYPSj8R
 x7hghE+gkHJurHCis31OgpI80DarhFDkMPw0/4AiMVbZvClX1y7PyF1nC0d0BSbhAd
 InmAs8Nl5SeHnJo1wJwaLb9l1FkvqhO7yrPEEFr3H8O/iZUe7OhGgRsevEOX6YfFnQ
 CavK9GJ7YdSG+0+b2oCttmiBak6d5qtFueohieqLA++qkwJxVGAGkJ5Q77QSOoRTRt
 EtI238iv70lZ6dUrXk4VuvHpvcBa+jMrRI6Fp3gF/jGMs1q+OCI8lBa2nCsKMKHWht
 w9rxZuU6LjWrg==
Date: Mon, 26 May 2025 19:30:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael <michael@fossekall.de>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <20250526-refined-dog-of-blizzard-b48f11@houat>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wx3fp4rhvd2s43t7"
Content-Disposition: inline
In-Reply-To: <aCJZmm8rC0RwbcBX@a98shuttle.de>
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


--wx3fp4rhvd2s43t7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
MIME-Version: 1.0

Hi,

On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
> with v6.9 and later there is no output on the BananaPI HDMI connector.
>=20
> I have bisected the issue to the following commit:
>=20
>   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid=
")
>=20
> With this patch, sun4i_hdmi_connector_clock_valid() is occasionally called
> with clock=3D0, causing the function to return MODE_NOCLOCK.
> In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
> always!=3D0, maybe that gives someone a hint.

This doesn't make sense to me, if only because the two callers of
tmds_char_rate_valid (hdmi_compute_clock and
drm_hdmi_connector_mode_valid) have, right before calling it, checks to
make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
in such a case.

https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_h=
dmi_state_helper.c#L234
https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_h=
dmi_state_helper.c#L553

Do you have some logs (with dri.devel=3D0xff)? Does it happen with 6.15 as
well?

Maxime

--wx3fp4rhvd2s43t7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDSlOgAKCRAnX84Zoj2+
dsbbAX99s9kKf45MW0A0sRoR7VuFGBnreiDwHOLIAAo4qprwTU4rlEcbnOBL7Y1m
XpJezKkBgJizzKS4du2vMNyg/eBB/0g/gvrzOsCy21C78GxZsMiwUpQBB81Ja0fq
gR2HdeNy8w==
=UHi2
-----END PGP SIGNATURE-----

--wx3fp4rhvd2s43t7--
