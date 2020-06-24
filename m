Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD9207558
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 16:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582F56EB5C;
	Wed, 24 Jun 2020 14:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1A6EB5B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 14:11:42 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A54DE2076E;
 Wed, 24 Jun 2020 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593007902;
 bh=dZNin8SmpQq7p18Ft1Jea35GMdNCC7HEuuzLiyxrh8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJWXKwa+oiCswSJrlk0nUsRRcjJZTvJbk1QUt2J19HQvSy75D3MM8h43yhNwhFks+
 RIIlbLOH6u0VB+IZN5vCizuHwbxa9qK+DYorhJgtXwA3RjuB9v8fCFEozXI2fzF+Lo
 v2Mm7zxAjso+NP/P8KcDJ6PRqpvyjUOHLo7BsDL0=
Date: Wed, 24 Jun 2020 15:11:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v5 4/5] drm/bridge/sii8620: fix resource
 acquisition error handling
Message-ID: <20200624141139.GF5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b@eucas1p1.samsung.com>
 <20200624114127.3016-5-a.hajda@samsung.com>
 <20200624132532.GC5472@sirena.org.uk>
 <cf95aac3-fef5-29d0-d94e-ce6cce4ccdb4@samsung.com>
MIME-Version: 1.0
In-Reply-To: <cf95aac3-fef5-29d0-d94e-ce6cce4ccdb4@samsung.com>
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
Cc: andy.shevchenko@gmail.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1186990252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1186990252==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 03:43:10PM +0200, Andrzej Hajda wrote:
>=20
> On 24.06.2020 15:25, Mark Brown wrote:

> > If we silently ignore all deferred probe errors we make it hard for
> > anyone who is experiencing issues with deferred probe to figure out what
> > they're missing.  We should at least be logging problems at debug level
> > so there's something for people to go on without having to hack the
> > kernel source.

> But you can always do:

> cat /sys/kernel/debug/devices_deferred

> And you will find there deferred probe reason (thanks to patch 2/5).

Right, my point is more that we shouldn't be promoting discarding the
diagnostics entirely but rather saying that we want to redirect those
somewhere else.

> Eventually if you want it in dmesg anyway, one can adjust probe_err funct=
ion
> to log probe error on debug level as well.

That would most likely be very useful as a boot option for problems that
occur before we get a console up.

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zXxsACgkQJNaLcl1U
h9C/2wf/YBbKSbShg3LyXqrQ3TXwZGSL43JPPExpduhQPiAEn9LJIa1bgE640xzI
0v5GUg3chRw9YilP9SA5RZ9ODZNo1fw9TwXaIhTVJgbeqc8PVadTm96IOEJj9Tgg
VSxnkPB4Az6RoG1462+Aov9q7/CaAfRmedwIECmapT16oJx+yh1cwzEkxez8koQM
QyQHrYH4IrDb8W160DbdiDuW2hYQia+4BybDU5MJ6B85QmAq++aqb77ocgfL2mIs
GYbKKyBTaPKw8VukABV8X5ZEBOM6xh5yGRJ8KIQmBQQi8cCM6HdEq0eOvwe30FaX
nVihsz6PcEAZZwx/wBTXKxgmzZv3hQ==
=iEvE
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--

--===============1186990252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186990252==--
