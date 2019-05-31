Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0563118B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 17:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287E28934F;
	Fri, 31 May 2019 15:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 474D88934F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 15:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id ACFE010A2EEC;
 Fri, 31 May 2019 08:47:02 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 9SwidZ4aZes7; Fri, 31 May 2019 08:47:01 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 7035B10A1AE4;
 Fri, 31 May 2019 08:47:01 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id E45102FE3AAE; Fri, 31 May 2019 08:47:00 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH] drm/gem_shmem: Use a writecombine mapping for ->vaddr
In-Reply-To: <20190529065121.13485-1-boris.brezillon@collabora.com>
References: <20190529065121.13485-1-boris.brezillon@collabora.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Fri, 31 May 2019 08:46:58 -0700
Message-ID: <87woi6wrrh.fsf@anholt.net>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0713923449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0713923449==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@collabora.com> writes:

> Right now, the BO is mapped as a cached region when ->vmap() is called
> and the underlying object is not a dmabuf.
> Doing that makes cache management a bit more complicated (you'd need
> to call dma_map/unmap_sg() on the ->sgt field everytime the BO is about
> to be passed to the GPU/CPU), so let's map the BO with writecombine
> attributes instead (as done in most drivers).
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Found this issue while working on panfrost perfcnt where the GPU dumps
> perf counter values in memory and the CPU reads them back in
> kernel-space. This patch seems to solve the unpredictable behavior I
> had.
>
> I can also go for the other option (call dma_map/unmap/_sg() when
> needed) if you think that's more appropriate.

writecombined was the intent, and this makes kernel vmap match the
userspace mmap path.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzxTHIACgkQtdYpNtH8
nugtvBAAssEmMnaCHsUdVx4xVOZ73w3vzU/lv12CoK4zGxqq1ow4XYTVVWUyC6VK
1YWwEBqM/ml1gobHmJoZcHTHWnQO4GNeVNcOC4PWsC10UiUwi07Pdg981ajUSu87
0vWs8ZjtJWH4ZF702lnuyM7kzvHTAHTmJEyWfeRHhcKHsJH94c7kJ76Nxk3/7Ho3
t5XGdXcSuJknPEnyKrigDjMua+JHFcGYL6a5YZwEgLm1ZQXNDU4skuvICOXxTFBI
YAfTSjFQ1N5uspJKX1RljDiO1kNjdjYD+W5jgYB4eDMrPaeUBiT+F1dyNMUOIOx6
IWZemDgNBSkacvYkTqN7afFbNqy+8QLwnRZ8rwbga2etvrvsoQPn8UoyNPrKOcpG
0yOJpHxNpLHk5VHV3RBWi5OSdTjK21ZaXmkBaqpdl0IvSC5absizKph3qsW3iL1Y
uU5pSVV5l0ogwunb8WefgvavbWQtk6Fw2AXGoL+dDhvkHYgUZl6BjZnVCCs/MujS
2YVOb2mAgRwi9wCEuJkdzgJwj8RM6GBWuO9dCTVF3biOzmSwnY9CkhQCebMGSI/8
p9ZpEwHgB+pVJSIsSIXYo0VcCrZKuJHtwxumIDuALazlf7tkCGXqB/Yl8HF4j8YM
JMMV4iQUmxOxe9m9jn3nnZpaam1Q3LXfgo6PVQrmNVfgo8nYP4s=
=Pwh0
-----END PGP SIGNATURE-----
--=-=-=--

--===============0713923449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0713923449==--
