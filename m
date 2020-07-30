Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B42338D5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA52C6E952;
	Thu, 30 Jul 2020 19:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB816E952
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 19:13:21 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EF14206F5;
 Thu, 30 Jul 2020 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596136401;
 bh=PV5FODCRSDHxtEwju8WDtbTuTj+tJ1owHOQIbejCcQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkX+IXJ4r7IdH+a+uhOklsUDzzaHzbIiK0/ITYUwqJVHC70xzFUFPC5OhubsDvdvy
 cNNpMTlFM39b8NAuDkiycPah71AGPiVA0crvSuvGxJG8Mx7slsacnD4VEZ1hQzz0Zz
 1KqsRhyiN9Znc7KNj+ulCq6utcocTyryEIk3BpUY=
Date: Thu, 30 Jul 2020 20:13:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight
 driver for RPi panel
Message-ID: <20200730191300.GJ5055@sirena.org.uk>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
MIME-Version: 1.0
In-Reply-To: <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1620954852=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1620954852==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1y6imfT/xHuCvpN0"
Content-Disposition: inline


--1y6imfT/xHuCvpN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 06:28:07PM +0200, Marek Vasut wrote:
> On 7/30/20 5:59 PM, Sam Ravnborg wrote:
> > On Wed, Jul 29, 2020 at 11:46:45PM +0200, Marek Vasut wrote:

> >> This regulator/backlight driver handles the ATTINY88 present on the
> >> RPi 7" touchscreen panel and exposes the power/backlight interfaces.

> > It looks strange that the regulator and the backligth are defined in the
> > same module like this.

> It's one chip, attiny with custom firmware, what do you want me to do
> about it ? I can over-complicate this and split it into multiple
> drivers, but I don't think it's worth the complexity, considering that
> this is likely a one-off device which will never be re-used elsewhere,
> except on this one particular display module for RPi.

Now you've written that you've pretty much guaranteed someone's going to
use the same component elsewhere :)

I think my main question would be that if this is going to be written
like this shouldn't it be a backlight driver rather than a regulator
driver?  I don't 100% follow how this would actually get used in a
system (perhaps the binding would help) but for these things if there's
only one tightly coupled user that's possible it's sometimes simpler to
just skip APIs and do things directly.

--1y6imfT/xHuCvpN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jG7sACgkQJNaLcl1U
h9Dgmgf/RAnBbSVgLzccn0FCMAgiB+Bxg59zrcQvMnVPw1oibOyryZYnEowVmHUT
ELHHSaZuRaTMAITKDLwa2xaJnkPq0Nh8URrLJKBSpulQD59YWYLe3rKY2/3p2O0e
AfR8Xo0TEH+e3Gl4EHPSJS/FKNTZNlYhRJM1531MoFcjJZ44ojiw+svpAEPaPLXE
Wl/rmU+I3UlI/UXNC6Ls6jC/Z4ymZaVHy+9Hy7fyYZIg2Eqj7FT5VK/yHq/l0+WX
DTClPpQwFw2Wm4sJELCF+CKsAYKlfQOFHeEz46vvvCSK55N2zxhZXPUM6D6W/TOO
Fbn8jPcLYiBejN2cYJQO7uEQTwVkKQ==
=TJya
-----END PGP SIGNATURE-----

--1y6imfT/xHuCvpN0--

--===============1620954852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1620954852==--
