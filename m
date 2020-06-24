Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E9207523
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EBB6EB58;
	Wed, 24 Jun 2020 14:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C866EB58
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:02:09 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12E0D20724;
 Wed, 24 Jun 2020 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593007329;
 bh=s+1HAUIY2ezRPN9ikTWdmNZ/f74VfGJEUMykCgxzPp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvMqMbMXnzntY2cbHHv2NFh1lurxHqBVMlX/8+FwpGRUFpWvaKkUbEXVtSuxRIWqj
 X1BBeGLwPjStyj1wpXUaK8X0g5WEx5EGLpryhfdCCj+x6QMdLSqX2kNkvHr1N5rEP6
 WizhFksWnAeJfSPjiqQ5CqrQI74m++Ml7fv0wO8s=
Date: Wed, 24 Jun 2020 15:02:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
Message-ID: <20200624140207.GE5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
 <20200624132714.GD5472@sirena.org.uk>
 <CAHp75Ve9V1Vyxe3bEeHJ9H2J900wUXHMmXFJt-dn9sO5OMejHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve9V1Vyxe3bEeHJ9H2J900wUXHMmXFJt-dn9sO5OMejHA@mail.gmail.com>
X-Cookie: So this is it.  We're going to die.
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============0072180547=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0072180547==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 04:45:28PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 24, 2020 at 4:27 PM Mark Brown <broonie@kernel.org> wrote:

> > As I said down the thread that's not a great pattern since it means that
> > probe deferral errors never get displayed and users have a hard time
> > figuring out why their driver isn't instantiating.

> Don't we have a file in the debugfs to list deferred drivers?

Part of what this patch series aims to solve is that that list is not
very useful since it doesn't provide any information on how things got
deferred which means it's of no use in trying to figure out any
problems.

> In the case of deferred probes the errors out of it makes users more
> miserable in order to look through tons of spam and lose really useful
> data in the logs.

I seem to never manage to end up using any of the systems which generate
excessive deferrals.

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zXN4ACgkQJNaLcl1U
h9CyQwf9GPTQ3AWT49MYS86gakGp3fOn+3DWHi2eBTCNBr7+ZbT6K2LjaeEZdWbq
LZqNijKZemXRSHuHANCslwlM29eVG8h/SpYsVVQxdK5k5OlqTDhTkuyfEsEnoF26
AaLhYtMt2MJjbZjxgu2TbKlC+jIwYA9nluB7r2HCm2hOydqWvtd3OR+l74EUwRWn
4CQdokPv6h315Sym12/8bwVOeYExOZcc4HvB0D1XqwzniNUqHI9Bp9q4d1vidjmS
AE2vI8rQoD+nKnKUD1BvHzHlJLdyeBuxMbnHypqIFEDeCc4Zvfm60U68qq5umxSe
0CPvHqLPG05cUToWTXrruMFr2Otvjg==
=96Vi
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--

--===============0072180547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0072180547==--
