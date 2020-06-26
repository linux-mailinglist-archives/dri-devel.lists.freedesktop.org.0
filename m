Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEC020AA3D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 03:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409086E3B5;
	Fri, 26 Jun 2020 01:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F436E39E;
 Fri, 26 Jun 2020 01:43:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49tKR64GvLz9sQx;
 Fri, 26 Jun 2020 11:43:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1593135812;
 bh=eQESNewGabImUpWknhGtlDqUX7u13gKZdpajK88V8Oc=;
 h=Date:From:To:Cc:Subject:From;
 b=r3wAAoWynW5ofY6RB24a7e7af76CCzxYSz/3hdzPSfdS+Q5jCfAFiBFGjsJlgihHz
 vtXiF4a8VZdVSynnc5fWgRkrpvAUQbF6xer84Uc3a5p3a2KVn8Vpv89H3jDBcqI4pp
 rl2xlVl4wHlRoEtSD1SVJ/4rhryOyBOTJKPk+RYxC06lkgYa5dBUX/64mOiPchwy3X
 qqnJPtFGkqmJ+O69ih0d5Bcu21MPl+TV9MVaal3apLrZT0r24WwkpxHKZGbQhEV+mu
 zIzVAM19iZjes9p9YijPWrb8I2q1P4r4fPCjjHawZJrbbLimnNKmNUiXzxTkxrttM7
 z6hPbmOhSb0DQ==
Date: Fri, 26 Jun 2020 11:43:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200626114328.71ae6193@canb.auug.org.au>
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: multipart/mixed; boundary="===============0748285900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0748285900==
Content-Type: multipart/signed; boundary="Sig_/SQrTN=RMELoppdikG/Zdzo0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SQrTN=RMELoppdikG/Zdzo0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c

between commit:

  eaad0c3aa978 ("drm/amdgpu: rename direct to immediate for VM updates")

from the Linus' and commit:

  b1a8ef952a25 ("drm/amdgpu: move ttm bo->offset to amdgpu_bo")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 28bdfb3ac33d,2a7a6f62d627..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@@ -144,8 -141,8 +144,8 @@@ static void amdgpu_vm_sdma_copy_ptes(st
 =20
  	src +=3D p->num_dw_left * 4;
 =20
- 	pe +=3D amdgpu_gmc_sign_extend(bo->tbo.offset);
+ 	pe +=3D amdgpu_bo_gpu_offset_no_check(bo);
 -	trace_amdgpu_vm_copy_ptes(pe, src, count, p->direct);
 +	trace_amdgpu_vm_copy_ptes(pe, src, count, p->immediate);
 =20
  	amdgpu_vm_copy_pte(p->adev, ib, pe, src, count);
  }
@@@ -171,8 -168,8 +171,8 @@@ static void amdgpu_vm_sdma_set_ptes(str
  {
  	struct amdgpu_ib *ib =3D p->job->ibs;
 =20
- 	pe +=3D amdgpu_gmc_sign_extend(bo->tbo.offset);
+ 	pe +=3D amdgpu_bo_gpu_offset_no_check(bo);
 -	trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags, p->direct);
 +	trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags, p->immediate);
  	if (count < 3) {
  		amdgpu_vm_write_pte(p->adev, ib, pe, addr | flags,
  				    count, incr);

--Sig_/SQrTN=RMELoppdikG/Zdzo0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl71UsAACgkQAVBC80lX
0GyshQf/UnKvDsr4a32M1T4MZmRytJslGTYMmhzZWQbg6MPDHbbBQ2kgA9vE8ngN
ICbfjJLPISBHaPhUkB7M5s/vCIDfYokSkL7SSoZzTlSBxq34e6WBF38T8Z4IjOIQ
C7TmliGkh51hE1Pk4D0ylTjURIO04r0OzGFNK9Pp/W5ZLp/l1Bi3asmg5zebRFHi
eaz0ONQjJcku5m1boIATljAB6xIY0NZxm77qWDlSykZ5CwvRyK+33ETDUBbb8V/7
TgoGxfN41FObP2qKLqE3LR9PV673OGttXTtuqb6aYBF6VHIFm+U6AmZJPMGSczKT
RTpdOzrCezHI9uIMRypvP2/apR1/Ng==
=UgZP
-----END PGP SIGNATURE-----

--Sig_/SQrTN=RMELoppdikG/Zdzo0--

--===============0748285900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0748285900==--
