Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9678F9EE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205F10E749;
	Fri,  1 Sep 2023 08:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02F10E748
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:22:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B08D0B8250D;
 Fri,  1 Sep 2023 08:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B160C433C8;
 Fri,  1 Sep 2023 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693556550;
 bh=XVNvXX/bO1Ro06eni/vmFCMKGyb10EuUDjRJ/YuQe5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGpJZQeeoe17PB/NadGOgUFZG4t2IpUOtMbWOw00q1tzjtazKeKqTY77/pAY+2g2x
 IXLTrcNllVID6KXVtfS8ZPRwe6JbvUZ0f9ZOjvnSDR8fbySC6S+AAdLRlIJ/ETL3l/
 nAs6Zb/B1d/uvA+sJEdIADbdWEA14ARl08HsGdeTv72FNUTkn4KIGTtWNBjK1OLS2o
 koZbVa6Q6EOIuyT20iMz5IzZBpH58cn3z/ECYgn0axIToWd0YEFG55dqOcyKKOQL3+
 MWZdDC+YBOIMfKKFK3oXVYNQhpI4muXqFA2fCFSOShqXHD0g1GVDu00Yn9HRA0jtnz
 j/UUWNZOBmDYw==
Date: Fri, 1 Sep 2023 10:22:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Message-ID: <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
References: <20230830062546.720679-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vixf6243reldlhil"
Content-Disposition: inline
In-Reply-To: <20230830062546.720679-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vixf6243reldlhil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas wrote:
> The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
> .atomic_check() callback") moved the allocation of the intermediate and
> HW buffers from the encoder's .atomic_enable callback to primary plane's
> .atomic_check callback.
>=20
> This was suggested by Maxime Ripard because drivers aren't allowed to fail
> after drm_atomic_helper_swap_state() has been called, and the encoder's
> .atomic_enable happens after the new atomic state has been swapped.
>=20
> But that change caused a performance regression in very slow platforms,
> since now the allocation happens for every plane's atomic state commit.
> For example, Geert Uytterhoeven reports that is the case on a VexRiscV
> softcore (RISC-V CPU implementation on an FPGA).

I'd like to have numbers on that. It's a bit surprising to me that,
given how many objects we already allocate during a commit, two small
additional allocations affect performances so dramatically, even on a
slow platform.

Maxime

--vixf6243reldlhil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPGfQwAKCRDj7w1vZxhR
xfVLAP9dxCyR8NcP7vGi8pe9GAMot6B0+NAJGNbP1BSqAqT7AgEApq2pVdYbtyhJ
mus/ESrdgLkqvkCpz0hjM85UFKIMXAU=
=Lepu
-----END PGP SIGNATURE-----

--vixf6243reldlhil--
