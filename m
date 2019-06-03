Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA1333CC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 17:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CD38919D;
	Mon,  3 Jun 2019 15:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id C475A8919D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 377C110A1128;
 Mon,  3 Jun 2019 08:43:38 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id vPop5WYHdg61; Mon,  3 Jun 2019 08:43:36 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id AAF0210A1AEB;
 Mon,  3 Jun 2019 08:43:36 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id C02692FE3AAE; Mon,  3 Jun 2019 08:43:35 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
In-Reply-To: <20190603072133.GY21222@phenom.ffwll.local>
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
 <87woi6wrrh.fsf@anholt.net> <20190603072133.GY21222@phenom.ffwll.local>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Mon, 03 Jun 2019 08:43:33 -0700
Message-ID: <871s0aznbu.fsf@anholt.net>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0854774123=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0854774123==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Fri, May 31, 2019 at 08:46:58AM -0700, Eric Anholt wrote:
>> Boris Brezillon <boris.brezillon@collabora.com> writes:
>>=20
>> > Right now, the BO is mapped as a cached region when ->vmap() is called
>> > and the underlying object is not a dmabuf.
>> > Doing that makes cache management a bit more complicated (you'd need
>> > to call dma_map/unmap_sg() on the ->sgt field everytime the BO is about
>> > to be passed to the GPU/CPU), so let's map the BO with writecombine
>> > attributes instead (as done in most drivers).
>> >
>> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> > ---
>> > Found this issue while working on panfrost perfcnt where the GPU dumps
>> > perf counter values in memory and the CPU reads them back in
>> > kernel-space. This patch seems to solve the unpredictable behavior I
>> > had.
>> >
>> > I can also go for the other option (call dma_map/unmap/_sg() when
>> > needed) if you think that's more appropriate.
>>=20
>> writecombined was the intent, and this makes kernel vmap match the
>> userspace mmap path.
>
> Since I missed that obviously: Where do the shmem helpers set write
> combined mode for userspace mmap?

That was the trick when I asked the question, too.  drm_gem.c is what
sets WC by default.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlz1QCUACgkQtdYpNtH8
nugRgw//SS3ZkwuWzsaSiFf1aPyHfgbZse1kB4qxsaCp5otb2Ice2cucAqKp9Jnu
Iy4dMsx3y/i3rXpZCA4CuFWFPol1J7Zf0jWm4lTKstxEhZXlcQOvhDxbHtJmaYpO
xJKHNfaXJNu83fdPyUoq8H7QF9SsW9sE63I0NbWYTE8yzkwZBsCtbHIiP5PYoYlO
FDENZ0vGyLbTCHHeBeEUmleQ2Ua4czcKMu7x99ysV0KAymKvKsrRd+mg+8zJmxjf
pE6RK/ElB8qd2wNLRp5oAqiRJnjbnAowQHBeAQ07dX/XU8bu8IGVUZaAYSxlZBsC
IdJaC3NASk7eBkO6cbXXQIvQX+1c0vUzUsQQiTEcsJe9TZ3neN0aIjVq2MxSzJ5D
qSkP1TYJ5tx0rRy/O25mmESkNH+U9v6UQDGb3swRU6RI5Lj2xJRQCS282JGXO56W
zPuqmCW0xWSE5SZ4N03h0Ha8VY3ZZ6T8hfRpioSsqMk+L2N0osgbf2gtjjv92OKI
TxcObmEOjNuQQswR3PnYuCiBVqxtK5HKOfXFs0B/LG5F/IuIrG82pp63ND4SMRj2
5TF8x+mBh88UBlhcwTr5aHVfcJWw3nARbczF08OksN5r5KOhFuDsveW7hFBRrGbS
pVmE2K78CTXPFwDDNrpm79WCkwqoKHr89CU7qM+wTu9GK7n40R8=
=8swC
-----END PGP SIGNATURE-----
--=-=-=--

--===============0854774123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0854774123==--
