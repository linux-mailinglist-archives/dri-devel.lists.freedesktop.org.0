Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D009B3224
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E25C10E4BC;
	Mon, 28 Oct 2024 13:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uIwz3ov9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4910E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:52:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20F22A41903;
 Mon, 28 Oct 2024 13:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E33BC4CEC3;
 Mon, 28 Oct 2024 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730123528;
 bh=0wNjqv0ym0irSoWGdsBqYkqo3fWgWY7OGoig5WHCR/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uIwz3ov9+H/dO5cRPpJSy8qfXTbCBQ0IMYXbNYWALlidad3+8mEAh1eonzDessjQ+
 tYW2vQiDJa6Puyq48vBwjkmTigbof4W//hZOVEwe+6be2lK/8+tT+zwn0wUDiYEmKa
 IRc5GiHnMn6y7lyfWVTqCYllINaROFWeCu7k0xI8PJaJ/m1t6EV53ormYgwoNLmXPb
 C1rAQxM3txMXKnOTMXLHYDCZB5odDZ9DL+9bzXTWxByhaxDkl4cyTLU8qe59a8F06T
 zkUjLFpN1SBegizTrzqwigNA0BMprI5bDIS4+ETicC7bTcnHHIQ0SXmKjNNU9Tnl05
 W84sAecpk2/sQ==
Date: Mon, 28 Oct 2024 14:52:05 +0100
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
Message-ID: <20241028-mellow-ostrich-of-novelty-dcf6e6@houat>
References: <20241026041019.247606-1-marex@denx.de>
 <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
 <0b1ffd41-f8e8-4e75-af35-0f410a34b3ae@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="la4rc4tc4ypp3emp"
Content-Disposition: inline
In-Reply-To: <0b1ffd41-f8e8-4e75-af35-0f410a34b3ae@denx.de>
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


--la4rc4tc4ypp3emp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 01:36:58PM +0100, Marek Vasut wrote:
> On 10/28/24 10:25 AM, Maxime Ripard wrote:
> > On Sat, Oct 26, 2024 at 06:10:01AM +0200, Marek Vasut wrote:
> > > Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> > > bitfields description state "These bits must be multiple of even
> > > pixel". It is not possible to simply align every bitfield to the
> > > nearest even pixel, because that would unalign the line width and
> > > cause visible distortion. Instead, attempt to re-align the timings
> > > such that the hardware requirement is fulfilled without changing
> > > the line width if at all possible.
> > >=20
> > > Warn the user in case a panel with odd active pixel width or full
> > > line width is used, this is not possible to support with this one
> > > bridge.
> > >=20
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Robert Foss <rfoss@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: dri-devel@lists.freedesktop.org
> > > ---
> > >   drivers/gpu/drm/bridge/tc358767.c | 63 ++++++++++++++++++++++++++++=
+--
> > >   1 file changed, 60 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/brid=
ge/tc358767.c
> > > index 0a6894498267e..7968183510e63 100644
> > > --- a/drivers/gpu/drm/bridge/tc358767.c
> > > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > > @@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct tc_da=
ta *tc,
> > >   	int vsync_len =3D mode->vsync_end - mode->vsync_start;
> > >   	int ret;
> > > +	/*
> > > +	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> > > +	 * bitfields description state "These bits must be multiple of even
> > > +	 * pixel". It is not possible to simply align every bitfield to the
> > > +	 * nearest even pixel, because that would unalign the line width.
> > > +	 * Instead, attempt to re-align the timings.
> > > +	 */
> > > +
> > > +	/* Panels with odd active pixel count are not supported by the brid=
ge */
> > > +	if (mode->hdisplay & 1)
> > > +		dev_warn(tc->dev, "Panels with odd pixel count per active line are=
 not supported.\n");
> > > +
> > > +	/* HPW is odd */
> > > +	if (hsync_len & 1) {
> > > +		/* Make sure there is some margin left */
> > > +		if (left_margin >=3D 2) {
> > > +			/* Align HPW up */
> > > +			hsync_len++;
> > > +			left_margin--;
> > > +		} else if (right_margin >=3D 2) {
> > > +			/* Align HPW up */
> > > +			hsync_len++;
> > > +			right_margin--;
> > > +		} else if (hsync_len > 2) {
> > > +			/* Align HPW down as last-resort option */
> > > +			hsync_len--;
> > > +			left_margin++;
> > > +		} else {
> > > +			dev_warn(tc->dev, "HPW is odd, not enough margins to compensate.\=
n");
> > > +		}
> > > +	}
> > > +
> > > +	/* HBP is odd (HPW is surely even now) */
> > > +	if (left_margin & 1) {
> > > +		/* Make sure there is some margin left */
> > > +		if (right_margin >=3D 2) {
> > > +			/* Align HBP up */
> > > +			left_margin++;
> > > +			right_margin--;
> > > +		} else if (hsync_len > 2) {
> > > +			/* HPW is surely even and > 2, which means at least 4 */
> > > +			hsync_len -=3D 2;
> > > +			/*
> > > +			 * Subtract 2 from sync pulse and distribute it between
> > > +			 * margins. This aligns HBP and keeps HPW aligned.
> > > +			 */
> > > +			left_margin++;
> > > +			right_margin++;
> > > +		} else {
> > > +			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensate.\n=
");
> > > +		}
> > > +	}
> > > +
> > > +	/* HFP is odd (HBP and HPW is surely even now) */
> > > +	if (right_margin & 1)
> > > +		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per ful=
l line are not supported.\n");
> > > +
> >=20
> > This should all happen in atomic_check, and reject modes that can't
> > be supported.

> No, that would reject panels I need to support and which can be
> supported by this bridge.

Then drop the warnings, either you support it or you don't.

Maxime

--la4rc4tc4ypp3emp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx+XAQAKCRAnX84Zoj2+
dg/dAYDdAqjcnq9Ud7Vz1uWHNUpfiRGiuHZMTX0OID9YW3x98XxleRqRTsbv8vCt
8lUFeagBfAqUJrPjlLDYN47CGCi60wyo7CW6vwqfN0l9qnjJTxD1x71FtRC8OOWW
r/tExmwMTA==
=alpV
-----END PGP SIGNATURE-----

--la4rc4tc4ypp3emp--
