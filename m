Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8FE639E50
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 00:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABBA10E140;
	Sun, 27 Nov 2022 23:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C53B89BEC
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 23:58:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NL5Cn0xg5z4xG6;
 Mon, 28 Nov 2022 10:58:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1669593525;
 bh=OJSDg8a6HJNUOP/vNpbbgLyUfGhTD1XU/yKZbzxlDFo=;
 h=Date:From:To:Cc:Subject:From;
 b=Fb8Sq1hVzxRrR/VcV4OAXw5rmNhJUrWkx0VZEN+aGx4egFsEgqdWrRd57r0TPvrgN
 +8St/MJIKIrbAy2jX/3m2Ijv41Wj3ikCCVvOBZ844fodDHQNeemtg11L+bUgAUxpgA
 En1wNoAowF7u4pTY3jSZeI5t8tffUBfyiKjeRhbEX0yQ612ECH2pOkM9Oyh/eKpZzE
 1SRi5hRdSPrpZlLio3jupyDBH8illcPQXLbtckSdziZzCqcdjA25vfpYDjLYV1PfB/
 Ug76tg4dNLOB7jzc1S5/XGM9c51HQxZhPYLJr2asxfttZ7HGA13rjAg6Z6zmswb26R
 ngP81+d2l4asQ==
Date: Mon, 28 Nov 2022 10:58:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20221128105844.315bb58a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W0voG2EGpTFfKO3uf4VT.DP";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/W0voG2EGpTFfKO3uf4VT.DP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commits:

  3cb93f390453 ("drm/amdgpu: fix use-after-free during gpu recovery")
  b09d6acba1d9 ("drm/amdgpu: handle gang submit before VMID")

from Linus' tree and commits:

  1b2d5eda5ad7 ("drm/amdgpu: move explicit sync check into the CS")
  1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")
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
index adac650cf544,032651a655f0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -166,14 -173,8 +173,12 @@@ static void amdgpu_job_free_cb(struct d
 =20
  	drm_sched_job_cleanup(s_job);
 =20
- 	amdgpu_sync_free(&job->sync);
- 	amdgpu_sync_free(&job->sched_sync);
-=20
+ 	amdgpu_sync_free(&job->explicit_sync);
 -	dma_fence_put(&job->hw_fence);
 +	/* only put the hw fence if has embedded fence */
 +	if (!job->hw_fence.ops)
 +		kfree(job);
 +	else
 +		dma_fence_put(&job->hw_fence);
  }
 =20
  void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
@@@ -247,30 -242,18 +246,18 @@@ amdgpu_job_prepare_job(struct drm_sched
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

--Sig_/W0voG2EGpTFfKO3uf4VT.DP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOD+bQACgkQAVBC80lX
0Gzpiwf/ficuEmJ3Oy2dWdmnPpvN/InNkvbSVJQqBwoFvNtZ4j8bhqsHhdUrod9/
zQSIEq72EAVW+SRowYNbQR8zzeNZ0AxcK0oo3l430OOxPi9WeA4L5rgicUdS5uQx
MQQnJmKDJIigVWdBQKcq3CGt0NDF3M1JwCUhf26qEcANTIG94Mh1ZN6RjocKerzX
5sci6z52EVKB+SUTSjCW2/l82tml3CdU1rT9kqsio4eC9+YcudepWGE5ZCeuGKVc
u2DFg8RuPnTlEJb/+Ee35j7jAfPUpMoLFNwPdT7JUsaRL/I/Vx2zg76g2lpX5DMi
LvbNBXsJ8wSu8bdTitK4SXcCK0fSIw==
=AqTq
-----END PGP SIGNATURE-----

--Sig_/W0voG2EGpTFfKO3uf4VT.DP--
