Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6F29A233
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 02:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EB96EAB4;
	Tue, 27 Oct 2020 01:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5D6EAB4;
 Tue, 27 Oct 2020 01:26:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKvDh5MJ1z9sSs;
 Tue, 27 Oct 2020 12:26:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1603761989;
 bh=xJK4s5+Fq4J95fHuYwEaGr9RLSssEmH01jmBaMhYu64=;
 h=Date:From:To:Cc:Subject:From;
 b=DSzs3E4y79+TznZdAoPBqPe3rI32YZew8wAGwNizz2H1rkgJoAOB/GKZScXUdlpbO
 g4MSsSSvErQKi4eYd68Oiwh534Ix1LKk0UCiNnmskO/zfJ0s2/2ioS567GEKU9gG2c
 froIPEP6QeSOF2pyLfeEj8EmggzwRqi5t/nEQ1D5NZPdrsHM7afxQnv3sNqBFwVwOE
 tR8J1ZZnluaR5hUUpPr59OP1Z8Wt2+ROuP8bQPP216oA4Gz+lqAyzsSTK00Rq5AAMh
 UBieqZSJDjByo2OO54eNpPynzKzDR8yAr5ypCAGvNtfbzECrSho39zuKWx81cw7bnw
 1Rj4el/jk6EWg==
Date: Tue, 27 Oct 2020 12:26:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20201027122628.18babff3@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1282089274=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1282089274==
Content-Type: multipart/signed; boundary="Sig_/wTISgeN+CU8wMMLX0ZYPJyf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/virtio/virtgpu_vq.c

between commit:

  75ef337bdba4 ("drm: virtio: fix common struct sg_table related issues")

from Linus' tree and commit:

  50c3d1938ee3 ("drm/virtio: implement blob resources: fix stride discrepan=
cy")

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

diff --cc drivers/gpu/drm/virtio/virtgpu_vq.c
index 07945ca238e2,c1824f536936..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@@ -1024,11 -1027,14 +1026,13 @@@ void virtio_gpu_cmd_transfer_to_host_3d
  	struct virtio_gpu_transfer_host_3d *cmd_p;
  	struct virtio_gpu_vbuffer *vbuf;
  	bool use_dma_api =3D !virtio_has_dma_quirk(vgdev->vdev);
- 	struct virtio_gpu_object_shmem *shmem =3D to_virtio_gpu_shmem(bo);
 =20
- 	if (use_dma_api)
+ 	if (virtio_gpu_is_shmem(bo) && use_dma_api) {
+ 		struct virtio_gpu_object_shmem *shmem =3D to_virtio_gpu_shmem(bo);
+=20
 -		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
 -				       shmem->pages->sgl, shmem->pages->nents,
 -				       DMA_TO_DEVICE);
 +		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
 +					    shmem->pages, DMA_TO_DEVICE);
+ 	}
 =20
  	cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
  	memset(cmd_p, 0, sizeof(*cmd_p));

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Xd0QACgkQAVBC80lX
0GwLQAgAgEyFbdDHC/NUR4XVrq+lPOOduxdbH9nv8tbpYQkooQoXWD6lJwDuwFLU
ky79EfkENcZHmfCNp31/YkySPCrWgr+0g3X+yKoJc6w3yavsE+/dqKEUniaViHQi
NbQ9qNatU7CDoh/9IVCsiIWAtIrSLlFDmUsTh7NdKLU2wk6vniz945tFPYiWBQ19
vn4ZvqEaAPUH3mjiJHoqGH26NlDQTA2tU+eRcu9lc3hJXhDRPSXwq8scKJRqyrWf
hX57vZF9oTY0fThcf1Wfz7ZLO5F2zPLte2e2DzTfy4hNDkZ2AWm9vyHoaWOb5tYG
rMNAUiBqzDQX/U/3e82SUhiqbXozwg==
=2mB9
-----END PGP SIGNATURE-----

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf--

--===============1282089274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1282089274==--
