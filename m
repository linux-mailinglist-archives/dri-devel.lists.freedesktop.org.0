Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC16161D8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 23:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FAF6E109;
	Mon, 17 Feb 2020 22:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A8EA6E109
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 22:44:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5FCD30E;
 Mon, 17 Feb 2020 14:44:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58EF93F703;
 Mon, 17 Feb 2020 14:44:40 -0800 (PST)
Date: Mon, 17 Feb 2020 22:44:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 1/9] regmap: Add USB support
Message-ID: <20200217224438.GW9304@sirena.org.uk>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
 <20200217121149.GB9304@sirena.org.uk>
 <f9cb6d05-300b-f6c8-8f88-2e6c014c1ba3@tronnes.org>
 <20200217213911.GV9304@sirena.org.uk>
 <34adf00c-a465-6d6d-23bd-a2a00290c1fa@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <34adf00c-a465-6d6d-23bd-a2a00290c1fa@tronnes.org>
X-Cookie: There was a phone call for you.
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2122317601=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2122317601==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oNLI4EWr1RPQuPCf"
Content-Disposition: inline


--oNLI4EWr1RPQuPCf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 11:15:37PM +0100, Noralf Tr=F8nnes wrote:
> Den 17.02.2020 22.39, skrev Mark Brown:

> > Out of interest why are 8 bit registers going to be a problem?

> I have written 3 drivers so far and they all have some registers that
> need to deal with values larger than 255. If I would need to add a lot
> of code because of dropping regmap, then I would have looked at ways to
> work around this in order to keep regmap, hi/lo registers perhaps with
> wrapping access functions. But it looks like the LOC won't change much,
> I need a few lines to ensure values are little endian, but I can also
> remove some lines that's not needed anymore.

Right, so you effectively have mixed register sizes which regmap isn't
going to be super happy with (assuming you need all the actual display
data to be 8 bit "registers").  One thing you could do there if you
wanted to try the regmap route is to have multiple regmaps but since
it's not clear what you're really getting from regmap other than the
trace functionality you're probably right that it's not worth bothering.

The only other thing I can think of is packing RGB into a single
register so you're display data isn't 8 bit but that's probably not
sensible from a graphics point of view (I didn't really look at that
code so no idea what you're doing there).

--oNLI4EWr1RPQuPCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5LF1YACgkQJNaLcl1U
h9C17gf+LW0MiRGt3Fci2RzupS0KkyZ3xZcQm50J9WCU00F/z7d7k5Kk/NZ6phiG
OwaQx7NqVn4LqW/5u8Z61xDSQsLbSrFGxywGXZJ8XbCTlO/FKnwUdBi+CG9t2L4o
0mWT6+sxJjCG8vPjW2MREmL77ojYOwW4RHenz0rZN/lW+B3LUw5Mw3eaUbBEZU8f
Zb4RsdO4yQqj1l8QPY7RcE+IuL981NUQ45GjzmJ4j7nbwn764C0bJcZYUyn3yRwJ
7tqp95eReMshjsfyhcb5OBqSEOnJO5n/XDrslxbBhLwS0zqZ2HbpYii9rzoPU8f+
0+D0lVq2cr6XJe4CYU1V5b15BTfRcA==
=LL2z
-----END PGP SIGNATURE-----

--oNLI4EWr1RPQuPCf--

--===============2122317601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2122317601==--
