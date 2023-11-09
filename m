Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953D7E6658
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317C910E1FB;
	Thu,  9 Nov 2023 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9803010E1FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:11:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01631CE12BD;
 Thu,  9 Nov 2023 09:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAD2C433C8;
 Thu,  9 Nov 2023 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699521114;
 bh=Y3CKbhnd8l5uvTZD8c8nwhx7Jwvg4a+GnVpeR9q8jhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=enMU5IrtTqaRNKsP2ZzJZHiXgI69VkwFCIc1UOUzg6f6u58c2FMzpn2hb+r0+GjD2
 XLB4kurmXL55DHIuFh8yY60pxcnMxDlbY2DXgIjoQCE/gK4pWGKnTo2OfL5UiOLurw
 S2QraWr6kPhCFVjEHTWXchMLhDjeRSrYiCdu29SEnAV5RVkpq5vyPmq8ScAMXvNAb3
 weDgxYVR1+WC5hZf9Tnt/JqDeQUGv4WJrsQufSculYDFYmBRU8MPjnBexEYI5flVst
 tUdwUl98It5W1sJmOZyIJWocdpqg1JVQcyh/U4X2wHg9UXwtXCEnPsCPpWlfhOkJxa
 +BDTyP+YXFrGQ==
Date: Thu, 9 Nov 2023 10:11:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wuk5qpuoqszc76gc"
Content-Disposition: inline
In-Reply-To: <20231109074545.148149-2-contact@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wuk5qpuoqszc76gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Thu, Nov 09, 2023 at 07:45:58AM +0000, Simon Ser wrote:
> User-space sometimes needs to allocate scanout-capable memory for
> GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> is achieved via DRM dumb buffers: the v3d user-space driver opens
> the primary vc4 node, allocates a DRM dumb buffer there, exports it
> as a DMA-BUF, imports it into the v3d render node, and renders to it.
>=20
> However, DRM dumb buffers are only meant for CPU rendering, they are
> not intended to be used for GPU rendering. Primary nodes should only
> be used for mode-setting purposes, other programs should not attempt
> to open it. Moreover, opening the primary node is already broken on
> some setups: systemd grants permission to open primary nodes to
> physically logged in users, but this breaks when the user is not
> physically logged in (e.g. headless setup) and when the distribution
> is using a different init (e.g. Alpine Linux uses openrc).
>=20
> We need an alternate way for v3d to allocate scanout-capable memory.
> Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> Preliminary testing has been done with wlroots [1].
>=20
> This is still an RFC. Open questions:
>=20
> - Does this approach make sense to y'all in general?

Makes sense to me :)

> - What would be a good name for the heap? "vc4" is maybe a bit naive and
>   not precise enough. Something with "cma"? Do we need to plan a naming
>   scheme to accomodate for multiple vc4 devices?

That's a general issue though that happens with pretty much all devices
with a separate node for modesetting and rendering, so I don't think
addressing it only for vc4 make sense, we should make it generic.

So maybe something like "scanout"?

One thing we need to consider too is that the Pi5 will have multiple
display nodes (4(?) iirc) with different capabilities, vc4 being only
one of them. This will impact that solution too.

> - Right now root privileges are necessary to open the heap. Should we
>   allow everybody to open the heap by default (after all, user-space can
>   already allocate arbitrary amounts of GPU memory)? Should we leave it
>   up to user-space to solve this issue (via logind/seatd or a Wayland
>   protocol or something else)?

I would have expected a udev rule to handle that?

> TODO:
>=20
> - Need to add !vc5 support.

If by !vc5 you mean RPi0-3, then it's probably not needed there at all
since it has a single node for both modesetting and rendering?

Maxime

--wuk5qpuoqszc76gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUyiTgAKCRDj7w1vZxhR
xfLOAP9pYjBj7/GXyVrvhT5cFsjvydFP0Km7fRgSwAbmApl10wD+PzPcoO+tlwWT
9UhtgyhiomIRDFFnUjgo0jTaBcjBXAg=
=iL85
-----END PGP SIGNATURE-----

--wuk5qpuoqszc76gc--
