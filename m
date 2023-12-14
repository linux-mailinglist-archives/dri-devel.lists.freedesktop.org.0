Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76F813106
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 14:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1C610E050;
	Thu, 14 Dec 2023 13:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCC110E050
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 13:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E5CECE238A;
 Thu, 14 Dec 2023 13:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A54C433C8;
 Thu, 14 Dec 2023 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702559459;
 bh=sB2vhNYyNztdd2YEqVUSws2NiTt9u4xI67gGa0TAi5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwHaIYHwi4vRi5W2N8ZpWR2whX0yubosaXDz1Bx+uZ3bbREjNeZeBbGe/WjaVwBKU
 LS08sqbExPjtZPjGgMyB1IjDniy8rV1j6QCs91+P8jnyPhaX4EEFNrBx9FlkQkWJB0
 JtOhdeXpHfztZ0IdljkKF717V79VPv8NgesGbeb1hX8PhyUe1A5x2m19p18rHGBRLT
 QkzQzXY2fCwwO3Qjkg77M0UgUEQA6+upyX7tVmFkNdFBPS1qMC7yQ7XlgJjy+EBv2R
 w/SEN6W8IMMBMnpOe4+G6OqIsz/HWB9wdw1aqnKqChU/lGES715IBtHaH82EZlqYI0
 LodQQX5htQ7Ww==
Date: Thu, 14 Dec 2023 14:10:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [RFC][PATCH v6 0/5] drm/panic: Add a drm panic handler
Message-ID: <qhkgcx3el7jkct7nfwln3asguot3gdqkmnhn4bt3hbmjnaj6nr@z3qkhisifzt2>
References: <20231205095051.269841-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zs5rws5dhrtiyych"
Content-Disposition: inline
In-Reply-To: <20231205095051.269841-1-jfalempe@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zs5rws5dhrtiyych
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for not taking a look at this sooner.

On Tue, Dec 05, 2023 at 10:48:22AM +0100, Jocelyn Falempe wrote:
> drm/panic: Add a drm panic handler
>=20
> This introduces a new drm panic handler, which displays a message when a =
panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
>=20
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen mu=
st be done in the kernel.
>=20
> This is a proof of concept, and works with simpledrm and mgag200, using a=
 new get_scanout_buffer() api
>=20
> To test it, make sure you're using the simpledrm driver, and trigger a pa=
nic:
> echo c > /proc/sysrq-trigger
>=20
> v2:
>  * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmer=
mann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
> =20
> v3:
>  * Rework the drawing functions, to write the pixels line by line and
>  to use the drm conversion helper to support other formats.
>  (Thomas Zimmermann)
> =20
> v4:
>  * Fully support all simpledrm formats using drm conversion helpers
>  * Rename dpanic_* to drm_panic_*, and have more coherent function name.
>    (Thomas Zimmermann)
>  * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>  * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>  * Add foreground/background color config option
>  * Fix the bottom lines not painted if the framebuffer height
>    is not a multiple of the font height.
>  * Automatically register the driver to drm_panic, if the function
>    get_scanout_buffer() exists. (Thomas Zimmermann)
>  * Add mgag200 support.
> =20
> v5:
>  * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>    (Thomas Zimmermann)
>  * Also add drm_fb_fill() to fill area with background color.
>  * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>  * Add a flush() callback for drivers that needs to synchronize the buffe=
r.
>  * Add a void *private field, so drivers can pass private data to
>    draw_pixel_xy() and flush().=20
>  * Add ast support.
>  * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripa=
rd)
>=20
> v6:
>  * Fix sparse and __le32 warnings
>  * Drop the IMX/IPUV3 experiment, it was just to show that it works also =
on ARM devices.
>=20
> With mgag200 support, I was able to test that the xrgb8888 to rgb565 conv=
ersion is working.
>=20
> IMX/IPUV3 support is not complete, I wasn't able to have etnaviv working =
on my board.

I'm not sure what you mean here, etnaviv shouldn't be involved in the
panic handling at all, so it's not super important that you couldn't get
it to work.

> But it shows that it can still work on ARM with DMA buffer in this
> case.

It simplifies the situation a bit, and looking at the v5 I think there's
a couple of things that we need to handle / document, so it would still
be very valuable.

I'll review that v5 patch

Maxime

--zs5rws5dhrtiyych
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXr+4AAKCRDj7w1vZxhR
xTIIAP4qZQi3c8BJ/ZO7lVYYSeDVcDVWrWFohs0ogvbP/7UGGQEA8Z0nYJa8vuyt
hTQdbjGOWWhBWJnyvk4+pKpZSK8P7wE=
=zuIJ
-----END PGP SIGNATURE-----

--zs5rws5dhrtiyych--
