Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA5207464
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8886EB3D;
	Wed, 24 Jun 2020 13:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679AA6EB3B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:25:35 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2EA720738;
 Wed, 24 Jun 2020 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593005135;
 bh=JmFbJS0PXLoFzco2T3g6Do+UUnsYW2aYLUOdaY8lj+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I0ghPOxMhm6dri4CB1uByEKsnodv/HbTXGlazQSBuzPHznhC5brjUCLVLAYURDLXq
 mRTxA2V01ONTgnjLhHWgAZqqulK4hB0upnbtXvRAMWEVVQngyoaecajufaz5tdIN9I
 YJrOr8x6CBw5QxolcEvBjTCMrqhBA8ziYD7lXAKU=
Date: Wed, 24 Jun 2020 14:25:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RESEND PATCH v5 4/5] drm/bridge/sii8620: fix resource
 acquisition error handling
Message-ID: <20200624132532.GC5472@sirena.org.uk>
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b@eucas1p1.samsung.com>
 <20200624114127.3016-5-a.hajda@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20200624114127.3016-5-a.hajda@samsung.com>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 andy.shevchenko@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1321484039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1321484039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 01:41:26PM +0200, Andrzej Hajda wrote:
> In case of error during resource acquisition driver should print error
> message only in case it is not deferred probe, using probe_err helper
> solves the issue. Moreover it records defer probe reason for debugging.

If we silently ignore all deferred probe errors we make it hard for
anyone who is experiencing issues with deferred probe to figure out what
they're missing.  We should at least be logging problems at debug level
so there's something for people to go on without having to hack the
kernel source.

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zVEwACgkQJNaLcl1U
h9Adowf/bt19xA4Q3/G5xTijEYnOc63YWxQGFynpEFvnpuQuTYuDRwL2ybQHpXkD
7dZqUsmE//n9XDWNSi6IHolSzWRtBVqD+LpF/gmGHcqGsPCstcSLeQMVM5b4l5KV
x59+x9cTfoYkQ2XoBNZmmWZwGBYqVJvhW+4TysUX+9JCZgxKOG1LXLuMlL7r9qP2
5nI549k1sjQdiC8pevFkysGucfiOGoKIQfcpMqqlIzCFkBCt5pRTYNQ0e4jUh3gT
8qVPKlbm99aJ5+TGjPWtUzndU9VM08psKQNnguznxAbaHhF+ZA11l1AiIPv2qHkn
YtM+Bz+sHfeDkTCKefTLds0G3+8Mmg==
=oY2K
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--

--===============1321484039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1321484039==--
