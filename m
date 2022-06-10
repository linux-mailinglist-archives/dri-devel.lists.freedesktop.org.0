Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851C545943
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 02:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C610E307;
	Fri, 10 Jun 2022 00:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609210E807
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 00:44:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LK2K13shsz4xZ0;
 Fri, 10 Jun 2022 10:44:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1654821847;
 bh=z5V4Kzg505bmetiWUu8deQBFvo/TnO9WAFuswm4qLfE=;
 h=Date:From:To:Cc:Subject:From;
 b=GAT56PA56PKZFF/+5hXfVt7MwON0elT30oY3ENoKyFkX4xuv5l1l7NEKKDLNW16wi
 VSjtFWevJ47/SsbFQ7AO6zMdWnGGprmljgxDUYhbpE2XiGMz/UMPS0Qw4VwlcUJK7c
 oqAqJ7FSrpZqfIr7ae0dLQsV+9hnKgmGeRDEZXwfCzmrZaHvmCaAnBer0RUxKIVO6/
 kQcczSdCnUF/Q45sN/BUl4JCr61I9cOuxklu9HvqhxcTaRtZwvzZuS7PiWgU3BJpO/
 QDdGgI3D+zu43ItuAvpzY/wDs7InvINHnoaU0RzqkZpY+woTlTsbdrijmbsVnk7JXh
 FwaJDKwUz2bhg==
Date: Fri, 10 Jun 2022 10:44:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20220610104403.02453bdb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//n1q_nVPZI353vHmpReO.BO";
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
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//n1q_nVPZI353vHmpReO.BO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/uapi/linux/dma-buf.h

between commit:

  7c3e9fcad9c7 ("dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace")

from Linus' tree and commits:

  20e10881a043 ("dma-buf: Add an API for exporting sync files (v14)")
  594740497e99 ("dma-buf: Add an API for importing sync files (v10)")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/dma-buf.h
index b1523cb8ab30,30fb8834aa3c..000000000000
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@@ -92,7 -174,9 +174,9 @@@ struct dma_buf_import_sync_file=20
   * between them in actual uapi, they're just different numbers.
   */
  #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 -#define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
 -#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
 +#define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, __u32)
 +#define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
+ #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_=
buf_export_sync_file)
+ #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_b=
uf_import_sync_file)
 =20
  #endif

--Sig_//n1q_nVPZI353vHmpReO.BO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKik9MACgkQAVBC80lX
0Gz0UQf+If52KGnDNPV8aqFJ40yP0mwNtBGMkc6Nh2Qyi2ag1uUk/NE5ncbOwlo1
bbV2b26RGai+ioUJwA3t0AXAfO+M/uSbeKmrBoAh5sLpavykLtVTi5zGltqNZ1Fi
AqxE9tkOqJNxTCzpqY/VUcSNAnKx/L3b1orKI3YkqaPawWcrB5JSw6zkPXpM0pHl
sMp77SSVQTxCpUT810jJ0AV3aaSVGnmol0GECQpB2qp4B6n6xaIwDu0o3k10oBlT
t49weWXmCL4F0DDSsxwfPw6H8Xe+5DmVT+cNpXHkAOrwDfAgPutQ1nsnFMoCGdV9
iKZ9B1PPTsyhQwzROCjeR8QCc5g0ag==
=T98u
-----END PGP SIGNATURE-----

--Sig_//n1q_nVPZI353vHmpReO.BO--
