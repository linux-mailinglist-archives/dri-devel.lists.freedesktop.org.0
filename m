Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8662AFA3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 00:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE61A10E0D0;
	Tue, 15 Nov 2022 23:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D66010E0A5;
 Tue, 15 Nov 2022 23:47:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NBjXn6LxNz4xTg;
 Wed, 16 Nov 2022 10:47:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668556074;
 bh=mNBclmwaAQTxYMzZYFdEyX+gKdInfl7kuoGFMn09KBE=;
 h=Date:From:To:Cc:Subject:From;
 b=VSBRMDX7d+o9U9vMdOkJFHDqhGZZpXmU1SF9zkKv+LvurcZNq+W66tBxTt9ArbT0p
 Puva/8Di6LF2Z1Q/TQb5Vzf90i1/4hFWHUotU+H8u5iyk/DbzxogZvIbzjcrCOqNZV
 fZdaZuguvV6MVMuqJG/CqR6dR+UyGPNxKJD8Il1th71kdbqwzf2F0NfvLwGtyTEz7z
 nGKpPzpV4A3GWAX5c/PTIrCISK4ki7IHi+AfYi4JxcoNxdDfzTZsSxd7DWiO7jaLTw
 JptBX61a7jj9+u4GEbZ+N+PK4xmNmhdv1R9LrYQe02zszVqfeS0q9kwScGoo5CiF+I
 QLGKVNzyAeFuQ==
Date: Wed, 16 Nov 2022 10:47:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20221116104752.4c64495a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wjgPxu/WZguAY0NUMy/Wf_I";
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wjgPxu/WZguAY0NUMy/Wf_I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

between commit:

  eca13f3c67b6 ("drm/amdgpu: use the last IB as gang leader v2")

from the drm-misc-fixes tree and commit:

  1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index de5cb056c9ad,0528c2b1db6e..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@@ -1197,10 -1201,7 +1203,10 @@@ static int amdgpu_cs_sync_rings(struct=20
  	}
 =20
  	for (i =3D 0; i < p->gang_size; ++i) {
 +		if (p->jobs[i] =3D=3D leader)
 +			continue;
 +
- 		r =3D amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
+ 		r =3D amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
  		if (r)
  			return r;
  	}
@@@ -1241,14 -1243,11 +1247,14 @@@ static int amdgpu_cs_submit(struct amdg
  	for (i =3D 0; i < p->gang_size; ++i)
  		drm_sched_job_arm(&p->jobs[i]->base);
 =20
 -	for (i =3D 0; i < (p->gang_size - 1); ++i) {
 +	for (i =3D 0; i < p->gang_size; ++i) {
  		struct dma_fence *fence;
 =20
 +		if (p->jobs[i] =3D=3D leader)
 +			continue;
 +
  		fence =3D &p->jobs[i]->base.s_fence->scheduled;
- 		r =3D amdgpu_sync_fence(&leader->sync, fence);
+ 		r =3D drm_sched_job_add_dependency(&leader->base, fence);
  		if (r)
  			goto error_cleanup;
  	}

--Sig_/wjgPxu/WZguAY0NUMy/Wf_I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN0JSgACgkQAVBC80lX
0GxUwAgAoWI36aevpcyI9lzL7qDXiwqHVX3Vr5ed8U4YFtRFEOCr8jK+zBq4DnQK
RTORhliDSaGNM4mZAbYeUcqPcIGEWBqcIYKmpwNPihBWP85dcO1LXN8r1Zxb33/y
tuniOCKdJtCExKjq7b5I1FPkFxKMFND/MCkcWzMur4b/F8KedMYfczRqD1N1uU2C
Nrrq88G/KeTj/3nqeH0+ErAdl++9zlLmWOHpzGUXJmjGmcVb7gHhZapFpNYbIhEB
8OqKTU38GWuz+okJdR4wx4WIbcAQYbr+yO7nPKOgrwnjRlYEpJcdhCFh0jN/RwrG
Etxmk8SdRn4TLVl1kX/HxmWAGDEs8A==
=2ttS
-----END PGP SIGNATURE-----

--Sig_/wjgPxu/WZguAY0NUMy/Wf_I--
