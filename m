Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4963187D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 03:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404A10E101;
	Mon, 21 Nov 2022 02:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68FD10E0F7;
 Mon, 21 Nov 2022 02:06:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NFrN03jyNz4x1D;
 Mon, 21 Nov 2022 13:06:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668996370;
 bh=1wBzHsAeVVrRJCJUDdbostIQLXeNLSDzuWh+o2GaUFQ=;
 h=Date:From:To:Cc:Subject:From;
 b=POoudHADR+ufkAmTrmN8ykUtKQDiFobuXdcLdlm+hqat92AIIujHtGHslHl70frZ/
 2BHjLTIYAlnh3gxJMhA87h4TyGbZVGguaxpCqKKqv9rHQdSfEi1ZQUmxItKGu6x1c7
 PTE/1l5bZMwpKCRO7N1GN0hkVHcT5R2gqAw8G9alfyeCr8poaDFY337FKzyMPUMW66
 bofINZflrVycZwiCmQshRceHYZkArShpDawr5tn7gfzyxpTtQwM6jFzNpayH6vzUKl
 A6NHI4SL9YbO63MB6vbZh/4bheC1I2FZnMpAObDuFR3p3S3+Ri/Bs2VNFFqmxYtGx+
 5zpSiAm0YTqJQ==
Date: Mon, 21 Nov 2022 13:06:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20221121130607.78449b87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N2g78LjmJ+RdmLzAk4jyxdu";
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N2g78LjmJ+RdmLzAk4jyxdu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commit:

  b09d6acba1d9 ("drm/amdgpu: handle gang submit before VMID")

from the drm-misc-fixes tree and commits:

  c5093cddf56b ("drm/amdgpu: drop the fence argument from amdgpu_vmid_grab")
  940ca22b7ea9 ("drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab v2")
  1b2d5eda5ad7 ("drm/amdgpu: move explicit sync check into the CS")
  1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index abb99cff8b4b,032651a655f0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -243,30 -242,18 +242,18 @@@ amdgpu_job_prepare_job(struct drm_sched
  {
  	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_entity->rq->sched);
  	struct amdgpu_job *job =3D to_amdgpu_job(sched_job);
- 	struct amdgpu_vm *vm =3D job->vm;
- 	struct dma_fence *fence;
+ 	struct dma_fence *fence =3D NULL;
  	int r;
 =20
- 	fence =3D amdgpu_sync_get_fence(&job->sync);
- 	if (fence && drm_sched_dependency_optimized(fence, s_entity)) {
- 		r =3D amdgpu_sync_fence(&job->sched_sync, fence);
- 		if (r)
- 			DRM_ERROR("Error adding fence (%d)\n", r);
- 	}
-=20
- 	if (!fence && job->gang_submit)
++	if (job->gang_submit)
 +		fence =3D amdgpu_device_switch_gang(ring->adev, job->gang_submit);
 +
- 	while (fence =3D=3D NULL && vm && !job->vmid) {
- 		r =3D amdgpu_vmid_grab(vm, ring, &job->sync,
- 				     &job->base.s_fence->finished,
- 				     job);
+ 	while (!fence && job->vm && !job->vmid) {
+ 		r =3D amdgpu_vmid_grab(job->vm, ring, job, &fence);
  		if (r)
  			DRM_ERROR("Error getting VM ID (%d)\n", r);
-=20
- 		fence =3D amdgpu_sync_get_fence(&job->sync);
  	}
 =20
 -	if (!fence && job->gang_submit)
 -		fence =3D amdgpu_device_switch_gang(ring->adev, job->gang_submit);
 -
  	return fence;
  }
 =20

--Sig_/N2g78LjmJ+RdmLzAk4jyxdu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN63Q8ACgkQAVBC80lX
0Gwf9wf/ZylZB4VDOa4uf9Vv+RmYSW/5LYWy/rUlxNF23ALMXV8Na41YozLEgUuC
FfGnbtUMMVQCzdcPtJ6jySnTl0eCIAw9HbNitz2urF8USvc7yZ7vf8nk8nKKuE9L
gRS8gz2y15q8ntIcD4gIizfr8ecZA2EGmmER63ewiOtmHbvZW4/kcakOpZV29fe1
SLvzDEHT91ZySVPeWMaMSMd/tj82wJ6Mr4+akti//eFR6qzF4dCD9InbMUOQ7L14
GQFU3gSuNhjg4YFVIZ7dUmNEt0cikiQm8fc5iSCIWZ0OL/TJKLxUY6/nGq2vI6fE
iW6acYFdLuS4vw7S/azPbtM6pX4tWQ==
=gi3n
-----END PGP SIGNATURE-----

--Sig_/N2g78LjmJ+RdmLzAk4jyxdu--
