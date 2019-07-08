Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57700619CE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 06:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317B18999E;
	Mon,  8 Jul 2019 04:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974028999E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 04:17:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45hscg58vyz9s3l;
 Mon,  8 Jul 2019 14:17:54 +1000 (AEST)
Date: Mon, 8 Jul 2019 14:17:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@ZenIV.linux.org.uk>
Subject: linux-next: manual merge of the drm tree with the vfs tree
Message-ID: <20190708141754.64d32ebe@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562559476;
 bh=VieVy7UWn7o5F9dBWHqJRxeZCvRi9w06XTxRVgaaLSo=;
 h=Date:From:To:Cc:Subject:From;
 b=nCctON+2mEZ27IiocbsqLKyxSCENVjWSU9x7Tcp7egEBJWMEo+WVMLGy4Dptq5sAG
 TMEqZd/cyEKNVqIoSYQFCIpSBV5QcAuZlNp1+cmxK73L6sodwH1lfSib76PjoJvjNh
 hSgWdK/t0ZC19MZk0+sLV5eMvvT5L287XP3PjMXoRVcqq412MC3OGeIMNadzwjG8z2
 DeIFTfUCZXf4WoAh3zCtEqKXRS4yCXaK1Xi0lKN6Q2OOxex0dOvV2HXKGw8jdi4GTn
 QUxq06GYcN1LzvZpBr3OnHHg13XgWbyAaUBzgN7jhir6moezog7492chDqB/I+LTlN
 +WuLel+ynccwQ==
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
Cc: David Howells <dhowells@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Hackmann <ghackmann@google.com>
Content-Type: multipart/mixed; boundary="===============1207568216=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1207568216==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u04U78ytM4vB=CX3N=GbpPy"; protocol="application/pgp-signature"

--Sig_/u04U78ytM4vB=CX3N=GbpPy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  include/uapi/linux/magic.h

between commit:

  ea8157ab2ae5 ("zsfold: Convert zsfold to use the new mount API")

from the vfs tree and commit:

  ed63bb1d1f84 ("dma-buf: give each buffer a full-fledged inode")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/magic.h
index 85c1119d0b0b,665e18627f78..000000000000
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@@ -91,6 -91,6 +91,7 @@@
  #define UDF_SUPER_MAGIC		0x15013346
  #define BALLOON_KVM_MAGIC	0x13661366
  #define ZSMALLOC_MAGIC		0x58295829
 +#define Z3FOLD_MAGIC		0x33
+ #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
 =20
  #endif /* __LINUX_MAGIC_H__ */

--Sig_/u04U78ytM4vB=CX3N=GbpPy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0iw/IACgkQAVBC80lX
0Gw5VAf8DDgJkQqJA0KHL5lzWfnr+HAflbMU2MMXJBSG3NsClNnp1GE5JDyRxueR
HXZqxdX8X0pQ9bNsELol5xB75QB5cTedZdc29EFeTcB7EB95DSzzBHRBrL/ygvJg
d43wZR3GJtnKPRiOajlXwfE13piL2v8iJzarCmsVwC8Qr3cOqScUxsk0xaCMVfxK
fFLbdrW9J04vf+iS//JLLdvDboj1xtQIN2I/kWIklV06+QwxI1ThjX/PpMUocHbb
DWZSW41v4wjv+IqHqElhL4ZyQRuPcIQVPGtDdGPTXndClaKfCD7P/WNyoCRNtycG
l8NnwvFCccaiCnsaFDBrWHl0bOQihA==
=8SNV
-----END PGP SIGNATURE-----

--Sig_/u04U78ytM4vB=CX3N=GbpPy--

--===============1207568216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1207568216==--
