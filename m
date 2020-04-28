Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9E1BD010
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 00:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF626EC07;
	Tue, 28 Apr 2020 22:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF366EC1F;
 Tue, 28 Apr 2020 22:33:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Bbyf4z3Bz9sSX;
 Wed, 29 Apr 2020 08:33:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588113214;
 bh=uF9jTsPem/DV1ITxLtEQfZ0b/1wCIoJnnwNR9iBcZWw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A6Qr1MDOkhEDmPWqTAmkW6Q4GCkRNiYqvEcp0R+eVDPB3s4A2ccfrpYS1escF2DKU
 8GGeCsx8vhGRwLm6aDwXWBbCFRYCmPNy+xDqtVS3uqhXQaGyg648cdJ2b4k5w9dm3b
 w8JU/EMpuDDkOwk9yVOxL7JBLmeNfpWLuP/jmpPf7cDYtHciCvGkQT7lbyDbHttOAy
 9aQ6xyw4Q12NXwgcaa2BAcO1vlZGCiEOP+l731ZH15DddwzQVHjp5LlTjW9wzIznaX
 W09JJGqULfffE0fpJ/+mvgtjPAwMgU+sV6aCjB50s1x+IMqwdYD8xBbAukEGhHe9G3
 agG7bQJTFhKgg==
Date: Wed, 29 Apr 2020 08:33:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200429083329.30ff39a1@canb.auug.org.au>
In-Reply-To: <20200420130118.7a866fd5@canb.auug.org.au>
References: <20200420130118.7a866fd5@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1918450908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1918450908==
Content-Type: multipart/signed; boundary="Sig_/dDJJ.aCsF+jJXjljCKelcwt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dDJJ.aCsF+jJXjljCKelcwt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Apr 2020 13:01:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
> drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of fu=
nction 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=3Dimpl=
icit-function-declaration]
>   756 |   vma->vm_page_prot =3D pgprot_cached_wthru(vma->vm_page_prot);
>       |                       ^~~~~~~~~~~~~~~~~~~
>       |                       pgprot_cached
> drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when as=
signing to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
>=20
> Presumably exposed by commit
>=20
>   a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
>=20
> I just turned off COMPILE_TEST again for today.  Please let me know when
> this is fixed.

This still appears to have not been addressed.

--=20
Cheers,
Stephen Rothwell

--Sig_/dDJJ.aCsF+jJXjljCKelcwt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6orzkACgkQAVBC80lX
0Gy4Dgf/bbH2FoAF3e4cOY6NEO6bgilUq/iWrSZpE68n8E4vpUYxj8buZrgeqtnw
EfgJ/oIUvdn7qGotbzGNbolIQYd93tVqDOTuKu6GO9D4zgN8tpg8qATHXRyyD903
L4b8GRVVmPX/xqLvWV7wjYIwGT8IJHockOSl8KDwcZI1b+CR7U4KicnLQ5+GrREJ
0w2iTXn7aTYc6A2mybo+eczofNx9JCWkcDVLpxzkLBSGXmIOyMMWPMMQxgGk7zx3
tvWivMNERFbYLHTkI7u7fm4cF2EH5xtcTHvBfhN/7nw9REymaIfeGSX7HRRaXxO3
ao3ZJJecZA8Crzo0u15bMogPUSwS7A==
=pvTD
-----END PGP SIGNATURE-----

--Sig_/dDJJ.aCsF+jJXjljCKelcwt--

--===============1918450908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1918450908==--
