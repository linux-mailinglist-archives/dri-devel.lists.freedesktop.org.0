Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9F9B2B6B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841ED10E371;
	Mon, 28 Oct 2024 09:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gjj/iyF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDC910E371
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:25:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6161A41AF2;
 Mon, 28 Oct 2024 09:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291B7C4CEC3;
 Mon, 28 Oct 2024 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730107520;
 bh=ZDBAj7j8x9t+PZ+zlb7c45pnOmhAZ+sPJU14dOaUCeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gjj/iyF9sWHcsQh5et3qXZnrqu7XwUKxUiP6OU9onHiCfztJ2i6w0oi/uXgHWZryO
 vTW53dY2nf51HOwjNfl1vQdo8JVqHKIGXaSI7eWi+eKNUqKGAAT1JwIs5pBzUcXDc7
 AiefirClBUlLz7mNeGvbON7ACj8ZU0HSsBOlYVjY6mmWjXS+/9kG2O4tBwz2ekISvp
 pDIT9Pkr4bR3PtjZUUN1ohgIorA+JTJmQIFtb2Ey1PjMY+u87B4lqQigSXtsyVbqQR
 7rR2j5FBO6WC8oc5fbc2+vZvGY5iqQmQdkO7XqMwbWpbKo5i9ggCqmTCmbTR0Nvyk0
 e0kKTUlsI8GRA==
Date: Mon, 28 Oct 2024 10:25:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
Message-ID: <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
References: <20241026041019.247606-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zeujnngppvsvu3fx"
Content-Disposition: inline
In-Reply-To: <20241026041019.247606-1-marex@denx.de>
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


--zeujnngppvsvu3fx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
MIME-Version: 1.0

On Sat, Oct 26, 2024 at 06:10:01AM +0200, Marek Vasut wrote:
> Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> bitfields description state "These bits must be multiple of even
> pixel". It is not possible to simply align every bitfield to the
> nearest even pixel, because that would unalign the line width and
> cause visible distortion. Instead, attempt to re-align the timings
> such that the hardware requirement is fulfilled without changing
> the line width if at all possible.
>=20
> Warn the user in case a panel with odd active pixel width or full
> line width is used, this is not possible to support with this one
> bridge.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 63 +++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 0a6894498267e..7968183510e63 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct tc_data *=
tc,
>  	int vsync_len =3D mode->vsync_end - mode->vsync_start;
>  	int ret;
> =20
> +	/*
> +	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> +	 * bitfields description state "These bits must be multiple of even
> +	 * pixel". It is not possible to simply align every bitfield to the
> +	 * nearest even pixel, because that would unalign the line width.
> +	 * Instead, attempt to re-align the timings.
> +	 */
> +
> +	/* Panels with odd active pixel count are not supported by the bridge */
> +	if (mode->hdisplay & 1)
> +		dev_warn(tc->dev, "Panels with odd pixel count per active line are not=
 supported.\n");
> +
> +	/* HPW is odd */
> +	if (hsync_len & 1) {
> +		/* Make sure there is some margin left */
> +		if (left_margin >=3D 2) {
> +			/* Align HPW up */
> +			hsync_len++;
> +			left_margin--;
> +		} else if (right_margin >=3D 2) {
> +			/* Align HPW up */
> +			hsync_len++;
> +			right_margin--;
> +		} else if (hsync_len > 2) {
> +			/* Align HPW down as last-resort option */
> +			hsync_len--;
> +			left_margin++;
> +		} else {
> +			dev_warn(tc->dev, "HPW is odd, not enough margins to compensate.\n");
> +		}
> +	}
> +
> +	/* HBP is odd (HPW is surely even now) */
> +	if (left_margin & 1) {
> +		/* Make sure there is some margin left */
> +		if (right_margin >=3D 2) {
> +			/* Align HBP up */
> +			left_margin++;
> +			right_margin--;
> +		} else if (hsync_len > 2) {
> +			/* HPW is surely even and > 2, which means at least 4 */
> +			hsync_len -=3D 2;
> +			/*
> +			 * Subtract 2 from sync pulse and distribute it between
> +			 * margins. This aligns HBP and keeps HPW aligned.
> +			 */
> +			left_margin++;
> +			right_margin++;
> +		} else {
> +			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensate.\n");
> +		}
> +	}
> +
> +	/* HFP is odd (HBP and HPW is surely even now) */
> +	if (right_margin & 1)
> +		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per full li=
ne are not supported.\n");
> +

This should all happen in atomic_check, and reject modes that can't be supp=
orted.

Maxime

--zeujnngppvsvu3fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx9YeQAKCRAnX84Zoj2+
dhsMAYD2B4XiRB+C3Drxd/D7G1xdToa6NwHhTEN21n3VVWkTUn2cQbrVkYCj2Chx
rd7WliUBfiKU9sUxY84sk5Xl55+3h7aQBWyE93+ZXweu4Gn+v0M1+fDeo3zbVXAi
c1jCXtYi5g==
=Xs9F
-----END PGP SIGNATURE-----

--zeujnngppvsvu3fx--
