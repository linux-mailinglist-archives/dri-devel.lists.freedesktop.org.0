Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C6B2EBA3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B40A10E102;
	Thu, 21 Aug 2025 03:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9810E102
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:05:09 +0000 (UTC)
Received: from [192.168.1.73] (4F7A343C.dsl.pool.telekom.hu [79.122.52.60])
 by c64.rulez.org (Postfix) with ESMTPSA id 137441020F;
 Thu, 21 Aug 2025 05:05:08 +0200 (CEST)
Message-ID: <9473ef5b-c298-56b1-0051-e10bb3b4dd67@c64.rulez.org>
Date: Thu, 21 Aug 2025 05:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: Erhard Furtner <erhard_f@mailbox.org>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <1fda26b1-f988-449d-834d-b185d3ebf5c6@mailbox.org>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: UBSAN: shift-out-of-bounds in
 drivers/video/fbdev/core/fb_fillrect.h:100:21 (v6.17-rc2)
In-Reply-To: <1fda26b1-f988-449d-834d-b185d3ebf5c6@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------465X0dp0dcCFUbYFICqAZu59"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------465X0dp0dcCFUbYFICqAZu59
Content-Type: multipart/mixed; boundary="------------bY0FFrD4MbwWZx0CYx98LZ0G";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: Erhard Furtner <erhard_f@mailbox.org>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9473ef5b-c298-56b1-0051-e10bb3b4dd67@c64.rulez.org>
Subject: Re: UBSAN: shift-out-of-bounds in
 drivers/video/fbdev/core/fb_fillrect.h:100:21 (v6.17-rc2)
References: <1fda26b1-f988-449d-834d-b185d3ebf5c6@mailbox.org>
In-Reply-To: <1fda26b1-f988-449d-834d-b185d3ebf5c6@mailbox.org>

--------------bY0FFrD4MbwWZx0CYx98LZ0G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Greetings!
>=20
> Getting this UBSAN hit on my PowerMac G4 DP with kernel 6.17-rc2:
>=20
> [...]
> Console: switching to colour frame buffer device 240x67
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/video/fbdev/core/fb_fillrect.h:10=
0:21
> shift exponent 32 is too large for 32-bit type 'unsigned long'

Thanks for reporting!

> I guess this would be a problem on other 32bit arches too?

It's only on 32 bit big endian. I don't have UBSAN for MIPS on my setup
so haven't noticed it.

#ifndef __LITTLE_ENDIAN
        pattern <<=3D (BITS_PER_LONG % bpp);
        pattern |=3D pattern >> bpp;          <-
#endif

In the 32 BPP case the result is identical in both the no shift and zero
result implementations.

I've patched it by skipping this realignment as it's only needed if the
BPP is smaller than the word length.

--=20
						    -soci-

--------------bY0FFrD4MbwWZx0CYx98LZ0G--

--------------465X0dp0dcCFUbYFICqAZu59
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAmimjNkFAwAAAAAACgkQWOeEu4KftGv7
bgf+NaPv0Y8aB946BhEzP2K6F5FMVuSdCRFFOABPx7zxh3RrJRki+Sb0g2sT8U0Ku9BTnw1DUPzC
wBi6O7iXZzdRCxrnbjQyo68lQOIQ2iJhHUieT6M2fyyX1Qqv+1FB2aSVpfi1Lb/xlS7ndUsxwD1A
RJGGddTsQzc6OoRZn1KgCUf3JdWylU86c7Oe5zhLBo5hRW2qCAjjt4dCfBqNLH8brw4oJU5uAa3s
xi8rgqbfi8yBuGDz88oHlwzonDRjsV71Xxy8WdV2RzqsGM2BgK0bBvIudg5FQihM2ZNqoW1YIjhj
Wl3NSwYM6bv8dZ//S6hDzNsB0BNYCBi4SpwLLQCV+Q==
=v2Nq
-----END PGP SIGNATURE-----

--------------465X0dp0dcCFUbYFICqAZu59--
