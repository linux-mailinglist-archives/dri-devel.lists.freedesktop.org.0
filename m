Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB462E7BB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340410E69E;
	Thu, 17 Nov 2022 22:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2610E69F;
 Thu, 17 Nov 2022 22:07:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NCvCQ0h9qz4x1T;
 Fri, 18 Nov 2022 09:06:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668722819;
 bh=ubzMaTeqc2N8hOGbp/joqdOXRMohY2fnfb5NRDEwpwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LtczShpY+5xR9TzvTUkamSbhgrVOkMH9PDdezEssYPItKv0chL/QXpZEVSVRv7gEC
 qL0IRFVLh19U2k2fUMGbnlbG59TuTpNKQtn08E+lofuxAHsvL37LA1weNGMTK2IMgd
 P+sovcBv9hFj94JsqHlfgQ0Y4Gwh/2NllrEBeE0iFIeS4uAveNEoLlSTfcHazO11tL
 QbAiKPNgj3MaVD7ekp0RVNW9H7yMrxOVrKG8J83LYnpkiWJ3gA1Z+R8x5fwCd5ouKn
 Rdwxdgw6xfXzB38r5Mpj72/sDgsCWVYLOmnTWYIn5r1ZsxiWltwRdz320vmCidLjc8
 LYRsw7qwGjHow==
Date: Fri, 18 Nov 2022 09:06:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20221118090636.00bfc293@canb.auug.org.au>
In-Reply-To: <Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X>
References: <20221116105702.746ce3cf@canb.auug.org.au>
 <Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cORwCokXw/BRPsMTVykVrdV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/cORwCokXw/BRPsMTVykVrdV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Thu, 17 Nov 2022 10:29:33 -0700 Nathan Chancellor <nathan@kernel.org> wr=
ote:
>
> This resolution is not quite right, as pointed out by clang:
>=20
>     drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: error: variable 'vc4_hdmi' is =
uninitialized when used here [-Werror,-Wuninitialized]
>             mutex_lock(&vc4_hdmi->mutex);
>                         ^~~~~~~~
>     ./include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
>     #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                                ^~~~
>     drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the variable =
'vc4_hdmi' to silence this warning
>             struct vc4_hdmi *vc4_hdmi;
>                                      ^
>                                       =3D NULL
>     1 error generated.
>=20
> Obviously, the assignment of vc4_hdmi should be before mutex_lock().

Thanks for pointing that out (silly me :-) ).  I have fixed up the
resolution for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/cORwCokXw/BRPsMTVykVrdV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN2sGwACgkQAVBC80lX
0GwqVgf7BKhwAejB2647+YTzGJFG5ESClma/Q+FqHOzAU5APyVxww5lrT7m+1h+w
l+jNOiRIU9g4WG7zOHY7MW/cOYUSCDv1XmuK4JBhI+JnMffY7vt8FxnDYYFvDiE9
VHgYmM/uzu6VgWBjp4pV+bHmqbE0zkMSVeUd9fI8qmkuzydCSWu1wiYx3ihXaTLw
1gWzctWRm+7eQMVgPI09oV2ev1VbDXh5xkzjh11Fuj02he89O0eVUt9XVJkUB0SZ
4MGRrU0SKUx5SulxF7G2ELKYI/fJVz0tTbkPxLVUfY2MGMxQWbgZVHqJwDtZNs2c
y3B3jrqzs40nAcfF7CQ/7qTj18mr6g==
=qG1K
-----END PGP SIGNATURE-----

--Sig_/cORwCokXw/BRPsMTVykVrdV--
