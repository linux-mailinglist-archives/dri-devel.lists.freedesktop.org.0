Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE5C711F0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 22:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5DE10E696;
	Wed, 19 Nov 2025 21:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Wed, 19 Nov 2025 21:13:57 UTC
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9669D10E696
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 21:13:57 +0000 (UTC)
Received: from [192.168.0.66] (catv-89-134-15-182.catv.fixed.one.hu
 [89.134.15.182])
 by c64.rulez.org (Postfix) with ESMTPSA id B8E6A10035;
 Wed, 19 Nov 2025 22:05:16 +0100 (CET)
Message-ID: <03796e70-edd9-a6b5-525f-db6f9431aafe@c64.rulez.org>
Date: Wed, 19 Nov 2025 22:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: ssrane_b23@ee.vjti.ac.in, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
References: <20251119133821.89998-1-ssranevjti@gmail.com>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
In-Reply-To: <20251119133821.89998-1-ssranevjti@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WJxmulm40VN55lgQyh9DPoVg"
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
--------------WJxmulm40VN55lgQyh9DPoVg
Content-Type: multipart/mixed; boundary="------------0te3fv09PAuezi1F1iKIFdtQ";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: ssrane_b23@ee.vjti.ac.in, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Message-ID: <03796e70-edd9-a6b5-525f-db6f9431aafe@c64.rulez.org>
Subject: Re: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
References: <20251119133821.89998-1-ssranevjti@gmail.com>
In-Reply-To: <20251119133821.89998-1-ssranevjti@gmail.com>

--------------0te3fv09PAuezi1F1iKIFdtQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello!

> This patch replaces the insufficient check with a more precise one. It
> calculates the effective width in bytes of the image (accounting for
> clipping against xres_virtual) and ensures that the last byte of the
> operation falls within the screen buffer. Specifically, it checks if
> '(dy + height - 1) * line_length + effective_width_bytes' exceeds
> screen_size. If it does, the drawing height max_y is reduced to
> prevent the out-of-bounds access.
I know my opinion doesn't count much but would like make a note.

Any bound checks which are applied here or at the entry of the other 2
low level drawing routines are just masking an issue somewhere in the
console code. The text area should be entirely within bounds of the
screen memory. If that's always the case then there shouldn't be any
drawing request outside of the framebuffer either.

Please consider at least to add a warning instead of silent clipping, as
every time such clipping was done it was a result of a bug.

--=20
						    -soci-

--------------0te3fv09PAuezi1F1iKIFdtQ--

--------------WJxmulm40VN55lgQyh9DPoVg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAmkeMQwFAwAAAAAACgkQWOeEu4KftGsN
Ngf/R3WSkZ/NqLnkoDaG/U3o/KY7IofEoC+D499XmqTtb8scpAxKiDGZv+P69uTdfbjF3MnrBWVE
yZXbqS8DEUq+MS/AFP9Rfjxk9ysUKJJMT69NWwvQZoKaFN4p/Yyb02Ey5X3IP7mICyQmK9uNjphD
M/Abipc3uWDPgLqco7Vpf3S8qTDAR+BiiSdoRdl+s3350vMiijh2CMiDqpKW3E91ltTyK7yDtocU
tXV+K6NShxKiGulLQChEv5u755bXWNfffcbWyeAqR4Gn2iOR0jaRcLu1x5V0+paJAHzqrPrv0HNJ
e+a63bozv6QAz73rrIf367qgB20l1CYg+y41pI760g==
=mBm3
-----END PGP SIGNATURE-----

--------------WJxmulm40VN55lgQyh9DPoVg--
