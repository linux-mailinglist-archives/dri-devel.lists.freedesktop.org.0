Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D81B0011
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 05:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9266E139;
	Mon, 20 Apr 2020 03:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544506E139;
 Mon, 20 Apr 2020 03:01:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 495BKr4jMzz9sR4;
 Mon, 20 Apr 2020 13:01:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587351684;
 bh=EXvHwasEn6ueQoK02J1mxsjP8ImqNeLDZvYXLJk2orA=;
 h=Date:From:To:Cc:Subject:From;
 b=emt3bcMEsDH5vmmqPQiBP3gcl4rZHI2up2/XiFFrXibOgLWmBkjo+PkAj1R8ZlrAd
 1RMeRnfmHGBvQdZPtQtH8G8Utleb4/HOXfPQQJTod4Zmv3eup++c3+RNNCDE9+z+Aq
 755auWX6RjVrl6kbA/GF8KE6h8F28n2BTiBzPzX//KSZQY/mv7VANCGECvrtSujneH
 zcErS5NPGkztXzUutCEdkdZYVJ4YRWiWvmK9lkHmFt6JCNq4P84jr6NoxHALEhxlDV
 Zy3gCI1iJJY+fLDdmE6e35l1wf9AwTFrsiqBUHoLzIHQ3VuZrQO1fQMr1vIxsVMooN
 ew1DR6lx31usQ==
Date: Mon, 20 Apr 2020 13:01:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200420130118.7a866fd5@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: multipart/mixed; boundary="===============1894740234=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1894740234==
Content-Type: multipart/signed; boundary="Sig_/TQAAgXi.j+9sTT+m4qv9GoZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TQAAgXi.j+9sTT+m4qv9GoZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of func=
tion 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=3Dimplic=
it-function-declaration]
  756 |   vma->vm_page_prot =3D pgprot_cached_wthru(vma->vm_page_prot);
      |                       ^~~~~~~~~~~~~~~~~~~
      |                       pgprot_cached
drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assi=
gning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'

Presumably exposed by commit

  a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")

I just turned off COMPILE_TEST again for today.  Please let me know when
this is fixed.

--=20
Cheers,
Stephen Rothwell

--Sig_/TQAAgXi.j+9sTT+m4qv9GoZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6dEH4ACgkQAVBC80lX
0GzkQAf+NYTRus1sYkOm7D8jCQ3yofQuSbktV19Rv+ynryJTfHkb6cncymKSaDyM
u/nzABHVAnKABm7hjUQrJTTmXD7j5irg0YcFgTlwM4mTTNol7vMQvVio7lDfS2bm
4F7rdrvgzTQWn8sMrKhc5QLDzdVOUZJl30Z2Iov3ddDoZ+g4JAGIej6tSJGX6Gs+
xMnI3MowjKR1eU+3rp2r+mtQpahSBQYI9uFFaSQasS1PEq955Zc7ifGi6laYjHfQ
ozoTfzEK934KVOG1vCCQt44XacBr6ek9o2wHcn3ZAuf0Eco4n1DUI6qzAvi9P5XX
YtoxihgKOyJtuHOi7E+w7cwvs8oM5w==
=2xmG
-----END PGP SIGNATURE-----

--Sig_/TQAAgXi.j+9sTT+m4qv9GoZ--

--===============1894740234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1894740234==--
