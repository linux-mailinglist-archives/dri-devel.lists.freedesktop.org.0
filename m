Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D172F8498
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67B0899DE;
	Fri, 15 Jan 2021 18:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441108938B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:40:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91D6423A58;
 Fri, 15 Jan 2021 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610736024;
 bh=mO3XhvFOk3R5foObxpWtALslCOZa2SOfM2jSF1K/mkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMbL7zxdW3erlSJLo0Y9VrdBNwA5CHUaFPoNJ+wE9ePWMWWiewEuMqbWLBpzC8I1A
 XqtSPUJY43Ogy2Kt4au0Js4in6ie3qCXaj3e99YTgSyLP1FNuc4ScP0KPZjwY1WYmX
 N/kECUhjkdM2JRG54EuhdfuPmzSMGLncsyJcHhfz8F9VST7pKs3KXCSH9lZ9/VwA9p
 wVVoH72Ska8FVlgIB4Jxe5e7IJZzOAiGsJ2CZ6bEdlZv2vteygw133f/9AFEH6jW8v
 rVT7+NckOhmrtlXja+aXYh/d/KBBRDS2/B51RwqWIRrTKjAfBFgAUeVInb8GzwQlFB
 6nilcQJcbyDLA==
Date: Fri, 15 Jan 2021 18:39:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
Message-ID: <20210115183949.GH4384@sirena.org.uk>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
 <ab03444f-feb2-fbab-97fc-a070ccbe06b4@i2se.com>
 <20210113091957.odclfwmeykrkyq7v@gilmour>
 <20210113114223.GB4641@sirena.org.uk>
 <20210115181437.uqlkrbapv6ydswuy@gilmour>
MIME-Version: 1.0
In-Reply-To: <20210115181437.uqlkrbapv6ydswuy@gilmour>
X-Cookie: Debug is human, de-fix divine.
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============2091446273=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2091446273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N8ia4yKhAKKETby7"
Content-Disposition: inline


--N8ia4yKhAKKETby7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 15, 2021 at 07:14:37PM +0100, Maxime Ripard wrote:
> On Wed, Jan 13, 2021 at 11:42:23AM +0000, Mark Brown wrote:
> > On Wed, Jan 13, 2021 at 10:19:57AM +0100, Maxime Ripard wrote:

> > > I'd like to get Mark's opinion before merging though

> > I'm not sure what the question is here?  I get CCed on a bunch of not
> > obviously relevant DRM patches so there's a good chance I've just
> > deleted some relevnat discussion.

> The patch is question is here:
> https://lore.kernel.org/dri-devel/1609256210-19863-1-git-send-email-stefan.wahren@i2se.com/

> In particular, I'm not so sure whether it's fine to return -EPROBE_DEFER
> in the startup hook.

I wouldn't expect that to do anything useful and IIRC that error code
will end up in userspace which isn't good.  If the driver wants to defer
probe it should defer it from the probe() routine, after the driver has
been instantiated I'm not sure what the expectation would be.  In
general a driver should acquire all resources it needs when probing.

--N8ia4yKhAKKETby7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAB4XQACgkQJNaLcl1U
h9BQDAf9FHR/IVHZ1TPR7BC2v1+LXlV7cqx7U0OEwlSjz2yZx6Io359B4pi5XBYG
22cgLCPqTUifqagmPWtJfK6msaiALHky3o8KWVjNMh2J9su88nKcLD4LMCCpAltq
JvW6XhaivY+FE1T90p08LDidTnQZGGgGNijyuXdpSqo5RnZgci2sGU2dsJMEOpnE
iLNe6Eq4WyrI25hXLgDbVkniyOSInaSAY3JtWDI1SMGfZZ5eK/CNRa2bIGtZIG7L
CyxjLgCZLjOVr3zRZDmgefMy8GEaheynLdNi0bh0Umb6mya+5Nrj76TiBAdsryJX
F3sdId5g1vjY4463/T3wabMwX0oGVw==
=upjq
-----END PGP SIGNATURE-----

--N8ia4yKhAKKETby7--

--===============2091446273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2091446273==--
