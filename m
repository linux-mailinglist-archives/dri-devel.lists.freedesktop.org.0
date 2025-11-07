Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D372C3ED8B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9569B10EA3A;
	Fri,  7 Nov 2025 08:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BcNo7yOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473BB10EA3A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F60342088;
 Fri,  7 Nov 2025 08:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3FCC19425;
 Fri,  7 Nov 2025 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762502435;
 bh=P7ZsXVZ5D+nou8fyFSMubqNvS7kqSRhtQ9PwJwCoJkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcNo7yOZT1jkpyWS4u6YnPy1HO10kxTlk7MC4tbkaKMsqRxBk5gwqAxAWfYFkBZyR
 vd9RLqUR1f72CsIpW+c8NZdsIywk7YrQAtyy57r/uPSGo0BMezEBL3MtggnvTWuFGT
 3VFLcZaEMp2Rfn5mt37yLuY6gY28paY0j03PDdmFGDWHM2jSOMl67g7KOnrmIxBAL3
 L2h4uuC9d6i77RZJkl3rqdxl7XQpV1YiuKrxPgAcUmw4vJxjLyJL1SsJBKW7ymQKBE
 Tlh7wAMDwIVRMLgpil8+OIRdicO0HI64UHu58bwxskFdZuh2IWtyRO8fz5PWR3dBxi
 2GkbeX6NPpyZg==
Date: Fri, 7 Nov 2025 09:00:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <t6wtfnmnclnzwdpbmdcalvyf3mulmpexnryolxkygqkpx7vdwz@dqwbwvlzawrr>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
 <aQNRK5ksNDMMve0x@aspen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qigqjtkdfszv4wy2"
Content-Disposition: inline
In-Reply-To: <aQNRK5ksNDMMve0x@aspen.lan>
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


--qigqjtkdfszv4wy2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
MIME-Version: 1.0

On Thu, Oct 30, 2025 at 11:51:07AM +0000, Daniel Thompson wrote:
> On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> > Currently when calling pwm_apply_might_sleep in the probe routine
> > the pwm will be configured with an not fully defined state.
> >
> > The duty_cycle is not yet set in that moment. There is a final
> > backlight_update_status call that will have a properly setup state.
> > However this change in the backlight can create a short flicker if the
> > backlight was already preinitialised.
> >
> > We fix the flicker by moving the pwm_apply after the default duty_cycle
> > can be calculated.
> >
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

I guess this tag resulted in Lee picking up the change. I wonder if you
share my concern and who's responsibility it is now to address it.

Best regards
Uwe

--qigqjtkdfszv4wy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkNpx4ACgkQj4D7WH0S
/k50PAf+IL1eJnMB5Bc+pOBZif5QNae5oi/5ejE0PPkWIN339t1izDRdG7l7rxI5
sFlCu92yzN97wTnCfw5cxG1oXvWCeKGICnsHpOSQz7S4qKBGlLKND1ZMrvNzlrF1
8gDDGpIht68sLPqKS71QEp9AWXUEwIU9NNRfKQPFURkbrmb3y0Z09Oxys1aADOCu
3q9jLSveFh5pdwAAIdcwpYnPNyOopVZAwdClNk0p1yhrpfc6UDHHRjMiZMgQr1Zo
1YMYSwDjQpFpvPXwoqkJjqf0yw7fFONQ+Ou53DBl6STPb7Z2RGenxV1CVZyUWWSc
KDlsKS4KzVLDGPqdERwCEXlCx3sGPg==
=2JkS
-----END PGP SIGNATURE-----

--qigqjtkdfszv4wy2--
