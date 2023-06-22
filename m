Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B973ACEF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1586210E38B;
	Thu, 22 Jun 2023 23:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313AC10E012;
 Thu, 22 Jun 2023 23:10:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QnGL06y7Dz4x04;
 Fri, 23 Jun 2023 09:10:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1687475401;
 bh=Au03f7xLQfTU2zow8kOeULaIyTtn+azYlLTURG5opPk=;
 h=Date:From:To:Cc:Subject:From;
 b=lM2ZH+CLh6C8eUltDZw1FWOHmaJFteS6TZ39ccZ35Vzg02rPzOwR7geK+K5CqSyLk
 g76xi9QVCbQCxz6GZOElpmzn+u1RWzGnrJuLYuuGR6qH1hqi9UTa3Ma3AZAvZJpl7B
 8NwB9+T+sg7pwH71Ixkk+2ecL3o9dDcVjE2T/E4BvNoC+2nqLQ2JB8z0/pRmwKGARk
 1hulHaqZ0hne9wb6CPHX9xsw9M6u/PzqUS744bJDGr8BuoFoDIPt0SzDW3HNIFLhCI
 s/fTPeedv+jGLq/jOe8eFxRcOznx6p0zNFrFg26dC5qRWyPBxivIaYm35Mh+UINVHE
 goEH2oekgaFGA==
Date: Fri, 23 Jun 2023 09:09:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc-fixes tree
Message-ID: <20230623090959.7b5ce510@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v9Y/GsEo/xYLhTB/J0WD7wg";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Yunxiang Li <Yunxiang.Li@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/v9Y/GsEo/xYLhTB/J0WD7wg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/build_bug.h:5,
                 from include/linux/init.h:5,
                 from include/linux/io.h:10,
                 from include/linux/iosys-map.h:10,
                 from drivers/gpu/drm/ttm/ttm_resource.c:25:
drivers/gpu/drm/ttm/ttm_resource.c: In function 'ttm_lru_bulk_move_del':
drivers/gpu/drm/ttm/ttm_resource.c:117:40: error: suggest parentheses aroun=
d '&&' within '||' [-Werror=3Dparentheses]
  117 |                      pos->first =3D=3D res && pos->last =3D=3D res)=
) {
      |                      ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
   77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
      |                                             ^
cc1: all warnings being treated as errors

Caused by commit

  4481913607e5 ("drm/ttm: fix bulk_move corruption when adding a entry")

I have used the drm-misc-fixes tree from next-20230622 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/v9Y/GsEo/xYLhTB/J0WD7wg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSU1McACgkQAVBC80lX
0GzBhwf9HFCkLl4s9TP1QEAZRSX6wn7Ei8uIrr3+3jSl5+3CWcHQI8+36xX+xKHt
MNWV+SXZ4slmE+jh8Lr5dWIO5LdnjahB5YEsDfh3ZIQEFEMNzLK5ar+SZ95LZGZM
7mrD4N35iI8s0z50WifBB5vK201vPtbwXA9y+Gzr7lvvSuLYSHRWYc3fJN/S1PpZ
pyM9fTc1dr51Ul8cEXgHhWSR5VDScR5SdxoXoVuC34QcdS8GmPAEEBUxZeQ0GxIO
QzZbs2p2wyHSknvv3Sto9eEkgxp0iQ/67237xMr+6LjRFTU67tIaIk9kVB7rOQVg
spL5OnukNcjZ5sJmNar2vieHB9IYVw==
=v0YD
-----END PGP SIGNATURE-----

--Sig_/v9Y/GsEo/xYLhTB/J0WD7wg--
