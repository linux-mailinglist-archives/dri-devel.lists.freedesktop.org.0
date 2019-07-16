Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840116B273
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 01:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C71895F5;
	Tue, 16 Jul 2019 23:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12CCE895F5;
 Tue, 16 Jul 2019 23:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 9682C10A264A;
 Tue, 16 Jul 2019 16:39:13 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 12F3ajGnutvd; Tue, 16 Jul 2019 16:39:12 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 61F0710A1AE9;
 Tue, 16 Jul 2019 16:39:12 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 600D12FE2547; Tue, 16 Jul 2019 16:39:13 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/3] drm/vgem: use normal cached mmap'ings
In-Reply-To: <20190716213746.4670-3-robdclark@gmail.com>
References: <20190716213746.4670-1-robdclark@gmail.com>
 <20190716213746.4670-3-robdclark@gmail.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Tue, 16 Jul 2019 16:39:11 -0700
Message-ID: <87lfwxh7mo.fsf@anholt.net>
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1573619366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1573619366==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> From: Rob Clark <robdclark@chromium.org>
>
> Since there is no real device associated with VGEM, it is impossible to
> end up with appropriate dev->dma_ops, meaning that we have no way to
> invalidate the shmem pages allocated by VGEM.  So, at least on platforms
> without drm_cflush_pages(), we end up with corruption when cache lines
> from previous usage of VGEM bo pages get evicted to memory.
>
> The only sane option is to use cached mappings.

This may be an improvement, but...

pin/unpin is only on attaching/closing the dma-buf, right?  So, great,
you flushed the cached map once after exporting the vgem dma-buf to the
actual GPU device, but from then on you still have no interface for
getting coherent access through VGEM's mapping again, which still
exists.

I feel like this is papering over something that's really just broken,
and we should stop providing VGEM just because someone wants to write
dma-buf test code without driver-specific BO alloc ioctl code.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0uYB8ACgkQtdYpNtH8
nugJRw/9EiWQGRfpgMVOaSPrCIjAmsQZR/yI4mMxq6i3W567axR5MUXdes8PKkJW
5LDqVM4OBs7GY/Rl76LiSO+LeMXuUH57MYAhsvzeweB4vkuPibrFjPLhzHdRz5/P
augC8mcdlSuP7xZKKGlMuOHfNsMipAZR0lOT+yiVfZ+UfWLNXTky5moA33yyPT1n
d3YuPIYFWUrZxwGlEQocBJUE6Us5lMieNWdfuAFk9Uhqtz47N8KwbnKPW0FkVKuF
E3oedpmxIyySwWF16gJn0jwy9gYtnmxyFmSk57V2F8fNvnwGP9JWkpAZEEqv4NMy
vhWf+lUHxSVj48oWg0B7jXliFA50qjeJA3cQWujXyaKusV99ujoQzWzxAWCWhDCG
K/kSMHgkLTbz+hOSXfOupKLV7I0aysXZB/USQOln/wSk6AajkEzYMr6l2BxZWuko
BcGoBCmt6z77yqyAbQOPWuP0LivFore0bLQyXauOSOV8fkUpmx8gNXtkUPy9drCs
axR3qVp0pfLItCdFTUXhV594hX3J4aN9SMojcAW+Lfmw8/3xDwEPWM5eAR10b2uo
QioDDThXBXTrc6Vx/NEIouY9zMPuD/mWknuS06x84HmLmFNj0MaD96CQU4yjy5he
eg2k8an5SqjXoSVC2Pk3Cm3A3Yq4P9FHMiUh9wWtj78r0yIO9j8=
=koaP
-----END PGP SIGNATURE-----
--=-=-=--

--===============1573619366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1573619366==--
