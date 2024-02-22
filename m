Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E3D85F67F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E7D10E8B4;
	Thu, 22 Feb 2024 11:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iVhjiO9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155D610E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:08:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E0F7617A8;
 Thu, 22 Feb 2024 11:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DFEC433C7;
 Thu, 22 Feb 2024 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708600094;
 bh=3o+yjEOmzEAHMWmAs/2aQHBmCyuuFhKadyiGa73qocM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iVhjiO9/ryG0HtP5+vJ2YWmbhCXPcsGGNk7emS65u1Cv4J0/9Q2lHzIoUGx2F6l2n
 lHYnhMONnVOjH4wWbbvfkKqWvI7P4g+PVJo1FkaagQP2gWr3n5PdUvOAYHng85FLno
 IHz2X9htzZGEBTIQo9QF0WImEF1Dzt7AZ7Bx+sVExZ9pjwobF6m8H4lvHa3gGtRCDj
 AmQIAttPkrzst/fFIC93ZnH2flF/7F3a63jaYqBlb7+l1qeteVLDQdeRlU1siKLlaS
 KRlVInkxvJ/u8bJ/1Ty9IhPZ7Pbypd+ov9tAGUoOWoK4bHdHFNxy42DMPQT0nL6bC1
 HtgZdqP/vcd0A==
Date: Thu, 22 Feb 2024 12:08:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Message-ID: <rwifwv74dhd5dipnoi2txnecsydvfnrbog2ntk76hplf3tpdzt@5d4goejupypn>
References: <bb8d631d-9f6c-48e8-a504-8931ee21014d@amd.com>
 <20240219090239.22568-1-daniel.van.vugt@canonical.com>
 <20240219090239.22568-2-daniel.van.vugt@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pvd2vhdd32pzrrsm"
Content-Disposition: inline
In-Reply-To: <20240219090239.22568-2-daniel.van.vugt@canonical.com>
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


--pvd2vhdd32pzrrsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Feb 19, 2024 at 05:02:34PM +0800, Daniel van Vugt wrote:
> Until now, deferred console takeover only meant defer until there is
> output. But that risks stepping on the toes of userspace splash screens
> as console messages may appear before the splash screen.
>=20
> This becomes more likely the later the splash screen starts, but even
> systems whose splash exists in initrd may not be not immune because they
> still rely on racing against all possible kernel messages that might
> trigger the fbcon takeover. And those kernel messages are hardware
> dependent so what boots silently on one machine may not be so quiet on
> the next. We also want to shield users from seeing warnings about their
> hardware/firmware that they don't always have the power to fix themselves,
> and may not be deemed worthy of fixing by the vendor.
>=20
> So now we check the command line for the expectation of userspace splash
> (CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION) and if present
> then defer fbcon's takeover until the first console switch. In the case
> of Plymouth, its value would typically be "splash". This keeps the boot
> experience clean and silent so long as the command line requests so.
>=20
> Closes: https://bugs.launchpad.net/bugs/1970069
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>

It's not clear to me why we should want to make it an option? If one
strategy is better than the other, and I guess the new one is if you
consider it fixes a bug and bothered to submit it upstream, why not just
get rid of the old one entirely?

I guess my question is: why do we want the choice, and what are the
tradeoff each strategy brings?

Maxime

--pvd2vhdd32pzrrsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdcrGgAKCRDj7w1vZxhR
xaWTAQCGNckiumaOI6zifOp2sbK3AemQ51LpaqAihgsRhuAKzgD8CyvObKZWGIBl
E7dbvsR5McDa3GsUg5v5r9ThU+B/QA8=
=1pEj
-----END PGP SIGNATURE-----

--pvd2vhdd32pzrrsm--
