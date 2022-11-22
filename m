Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D83633225
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 02:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0936310E1D8;
	Tue, 22 Nov 2022 01:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7099610E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 01:29:00 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NGRVZ3Nzsz4xGK;
 Tue, 22 Nov 2022 12:28:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1669080535;
 bh=r3Zq9zUP7eX1Hv56Y96Fbj75FRnDNCrFb/0crgzsSjE=;
 h=Date:From:To:Cc:Subject:From;
 b=ubAVMvdBvdfQKmzNayTxaIXvNdbm3RNy/BzJ4K62wszd/FAHKru/sdHvZ6qDAxD+K
 Ch+Hlp1t+RVGRT6fqZmp4kj02njXynLoKGis4Zq+JaI/yd2nF7UxVINAnKU9nQ3l3W
 qz6NJ3po/bkyotVTntTWCeQN1FUtgM06cB5Ep9DneDAZXzcMhe+l4bnv9ADVIANBO+
 U2zaTaeAlHw2LJHdnlF6N4wDYtASgo/ai/5IaoqlpwbOJb34KzQohsVaSMx8rEbwog
 +aLBa65/8I9+CceKzVxX8N2D9dQg711NDHvrAm3fKSu5zzWX+0WUNkCCUyshMZAebo
 lPZPFd74XcVuw==
Date: Tue, 22 Nov 2022 12:28:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20221122122850.3cd9657a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/meyUr.nqIgyWpregzYFRhPm";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/meyUr.nqIgyWpregzYFRhPm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commits:

  1b2d5eda5ad7 ("drm/amdgpu: move explicit sync check into the CS")
  1728baa7e4e6 ("drm/amdgpu: use scheduler dependencies for CS")

from the drm tree and commit:

  a61bf2f7299a ("drm/amdgpu: fix use-after-free during gpu recovery")

from the amdgpu tree.

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
index ffaac1c21c91,f4a3122352de..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -173,8 -166,14 +173,13 @@@ static void amdgpu_job_free_cb(struct d
 =20
  	drm_sched_job_cleanup(s_job);
 =20
 -	amdgpu_sync_free(&job->sync);
 -	amdgpu_sync_free(&job->sched_sync);
 +	amdgpu_sync_free(&job->explicit_sync);
- 	dma_fence_put(&job->hw_fence);
+=20
+ 	/* only put the hw fence if has embedded fence */
+ 	if (!job->hw_fence.ops)
+ 		kfree(job);
+ 	else
+ 		dma_fence_put(&job->hw_fence);
  }
 =20
  void amdgpu_job_set_gang_leader(struct amdgpu_job *job,

--Sig_/meyUr.nqIgyWpregzYFRhPm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN8JdIACgkQAVBC80lX
0Gxr+ggAoEPA1Y5lY/moFfUzHLgC6Q90pZRowb1WMlyJO78su6vpDIOm0v5yJFF7
cB2ijv3IeJhXZ1c4nOFNFxtGunE+dg37JYf+1yQHQ2nlWKAOTEjsxOobIH7ctdrc
WK8exzRcUV770i0L1D8hDb5FUpiFxnaLXAMkG7SvDCSjat8hNLAlYuUo7D5PH+2P
ePhxVqS32PrbhtGguLZxxHvkUcA0GJvYg4cT5Eg60LRG7mslNaorlAl/eUtc2U4C
Uw1p+Uq0TmkogWbIjijbK1647BtEB6SfOqRQoLOrTj49Vy+Z6UPR0rUCUQ6dN2f6
JkY9CwNMGmfhcaYWL0ZHousiKTMDPA==
=aSEP
-----END PGP SIGNATURE-----

--Sig_/meyUr.nqIgyWpregzYFRhPm--
