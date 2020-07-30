Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50831233722
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 18:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D765A6E926;
	Thu, 30 Jul 2020 16:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E86E926
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 16:49:05 +0000 (UTC)
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD733207F5;
 Thu, 30 Jul 2020 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596127745;
 bh=Wi7LMVSqES6xakVzVVsnmHXkISayOsW7D4YJWLJCn3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zmb7afjLpegOR3tGn/JpIIN/p+wE91ap2d1ddBb7IMI4D29F2LSRidnRC4T9hgdRw
 EGR6eiQ12u4hN1uU/fWn95U09rp862CWnpbcBnWPiH/a91DqtXmUFdEl8L3BpclCcu
 9iOiwe/u77goaNG9p4qTuNVuJKIZUWiBYh2kO0Oc=
Date: Thu, 30 Jul 2020 17:48:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v9 0/4] driver core: add probe error check helper
Message-ID: <20200730164845.GE5055@sirena.org.uk>
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
 <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1568517149=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1568517149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 09:18:30AM -0700, Dmitry Torokhov wrote:

> I believe it still has not been answered why this can't be pushed into
> resource providers (clock, regulators, gpio, interrupts, etc),
> especially for devm APIs where we know exactly what device we are
> requesting a resource for, so that individual drivers do not need to
> change anything.

The error messages are frequently in the caller rather than the
frameworks, it's often helpful for the comprehensibility of the error
messages especially in cases where things may be legitimately absent.

>                  We can mark the device as being probed so that probe
> deferral is only handled when we actually execute probe() (and for the
> bonus points scream loudly if someone tries to return -EPROBE_DEFER
> outside of probe path).

Is this a big issue?

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8i+ewACgkQJNaLcl1U
h9DueQf/QkO4v81CMD7SEApOvQjNBQ1RWfJ8Q/NBYJFxm8NmmOowBWYnNXFzRu1O
oCF+JukJ6znqRqsocboI/8sUkUQ7hWLi9S53VaUkYdArscPZ0myQ8/lb9nqKXqqi
NlCnEGNxEUprZBxyD1T/qOnoi1hFGko+shXG59pLoYD9SCA0sODJwONb4ktVuJ7J
7kG2/jF6y5Qs2tMNcDHklnrXZg9yWPIdD9ppl4K2soYw17TyIiF+UZdunZSlWFZ5
M3Sz+fbK3xPZodecRz6tqaDm48bAsqe51dFa5DbIt6/DPLBo/+cLzpSONZTCUxxs
hqEsIHEG2ZQ+9cGRQtCPFGruqG5tvA==
=SqHC
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--

--===============1568517149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1568517149==--
