Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6312389A64
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 02:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47496E2E1;
	Thu, 20 May 2021 00:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8246E112;
 Thu, 20 May 2021 00:19:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Flr2R3dkPz9sWF;
 Thu, 20 May 2021 10:19:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621469952;
 bh=CyvXAwtCsY9kS6t3E/YGwieNDin0H6EWJN+FUPoEw60=;
 h=Date:From:To:Cc:Subject:From;
 b=EPhm4xsDbtZWuJ4UutZHdBqVZhbjfJZcZlk75xXnoL/Ou5uIJligJUloaAXBF/UWR
 pM+HJ0AL1/ec+sWbxYdQB0p9E/X34aPSZFLwygjPX9g3l+Ra/z02k/F1Exmhvr4Xph
 ztjW7RacsU3XDSifXGEJsXJLAMxkZ29dnQzJxLzBauqX/rA5VqEBvC6X2rb1Ubrchs
 eLesIt0H5j3w321piyPjjqEVJhRSYoIjBmi+R1clYBkqpdg/IN6Xw0RvdIKlfc/+nW
 vMXq1V4ODfvPABf3/4YVVLbAcxeKkoBmD06TvyxQrCCv3TI6xaZl+QFVmwlUI0ctpP
 xByRD7BF0G6cw==
Date: Thu, 20 May 2021 10:19:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20210520101910.26606a78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//x1luGM18fkh2=2Mp.I+b59";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 James Ausmus <james.ausmus@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_//x1luGM18fkh2=2Mp.I+b59
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_mm.c

between commit:

  293837b9ac8d ("Revert "i915: fix remap_io_sg to verify the pgprot"")

from Linus' tree and commit:

  ec279384c6a0 ("drm/i915: Initialize err in remap_io_sg()")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_mm.c
index 9a777b0ff59b,25576fa73ff0..000000000000
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@@ -82,13 -46,8 +82,13 @@@ int remap_io_sg(struct vm_area_struct *
  		unsigned long addr, unsigned long size,
  		struct scatterlist *sgl, resource_size_t iobase)
  {
 -	unsigned long pfn, len, remapped =3D 0;
 +	struct remap_pfn r =3D {
 +		.mm =3D vma->vm_mm,
 +		.prot =3D vma->vm_page_prot,
 +		.sgt =3D __sgt_iter(sgl, use_dma(iobase)),
 +		.iobase =3D iobase,
 +	};
- 	int err;
+ 	int err =3D 0;
 =20
  	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) !=3D EXPECTED_FLAGS);

--Sig_//x1luGM18fkh2=2Mp.I+b59
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmClqv4ACgkQAVBC80lX
0Gx8rgf/fSYYr/Ro3uJFgGbnX2mFMuvsbi+Xj2mZk67meSrj/6/9Og9vGYkA3+IM
dzt1XqDdBbzWjvzKmztfsOvV8wcbdiQEKxKekUt7DsWi3aOZX+fiBBseXn8UHLE7
GTgRv9vvcahtF0AEaJ1D7kuOIFfDCHSSSc+Kqnq1TZ/t1TaIvAmLEziKqvK8mH22
VNo4G0Dg5H0gDKj6LxNDtKjnt44Iq/2As4RYRUqbh+VW/CVNAwFwYcD/3Wdawpny
ZaLMlfzisQuORMaA14xmTlqiWZf5+lIcjvzlYs1jByzcDFh01nekYlFUnG39QLnO
kau0Md6k/yQvicUoe4o3CB7MtdcdEw==
=kS7t
-----END PGP SIGNATURE-----

--Sig_//x1luGM18fkh2=2Mp.I+b59--
