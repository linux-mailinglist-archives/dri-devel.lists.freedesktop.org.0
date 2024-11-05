Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3D9BC28D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 02:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B602610E157;
	Tue,  5 Nov 2024 01:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VHDXD2pr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952FB10E157
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 01:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730770117;
 bh=2ydqDCJfAjTtRMwJu/mQEQxyknSlntFKqHzTV922HGY=;
 h=Date:From:To:Cc:Subject:From;
 b=VHDXD2prYvHJgPnsosEFKbXN3LOAiXXc5QHEpEOPOQ8TcBS7u5TOXJlGdFMgpcTcY
 IyB6RFz65R6htaYjxmtb3peh3XuDdWyQAGY2Tc7JheXAuSI+gG70A4kKSGERuM0k87
 kvR0cItdrz7BLN8I+Yi0Z53QfdOCsFclO9QAokVybbW1Rvx0ATLPxKZ+ZOXJcecaNe
 dU+GE94deNxTOU4MqhVSkzTEOVvDhwggbkkb54qSEO14q/ZgmhSzokGZRuPSycJVed
 xidPgXiWegIudT7T8C/rJSFdE7ZvBkXyUTOCu7j8bKstUHWoyfdEo0AKBPA6/Kr3/C
 SoHBqTNPqakeQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xj9hj1PPLz4w2N;
 Tue,  5 Nov 2024 12:28:37 +1100 (AEDT)
Date: Tue, 5 Nov 2024 12:28:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20241105122838.0d6d94eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xzOYzmjgbeNdirBYSiBDDcK";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xzOYzmjgbeNdirBYSiBDDcK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commit:

  b2ef808786d9 ("drm/sched: add optional errno to drm_sched_start()")

from the drm tree and commit:

  35984fd4a093 ("drm/amdgpu: add ring reset messages")

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
index ea2663169bf3,cbae2fc7b94e..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -149,9 -150,11 +150,11 @@@ static enum drm_gpu_sched_stat amdgpu_j
  			atomic_inc(&ring->adev->gpu_reset_counter);
  			amdgpu_fence_driver_force_completion(ring);
  			if (amdgpu_ring_sched_ready(ring))
 -				drm_sched_start(&ring->sched);
 +				drm_sched_start(&ring->sched, 0);
+ 			dev_err(adev->dev, "Ring %s reset success\n", ring->sched.name);
  			goto exit;
  		}
+ 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
  	}
 =20
  	if (amdgpu_device_should_recover_gpu(ring->adev)) {

--Sig_/xzOYzmjgbeNdirBYSiBDDcK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcpdMYACgkQAVBC80lX
0Gym1Af/fOAJCphNBfESpwoprBZW3i+sAFLXwoyDMHJihVIOcu34HxOhtQdcGb/t
9RVd9C3OQrVPsvlaR00Pqzu7DJkln+rOV5hrjZp/LHco8aXOFgHCTA54yekV+zik
gPkvvJVlAcZL1DQ3Hw6+ijFXIRDUtmw/89cSMpO+LJC67UbJ3qYov425tN49k3+J
naaCSqQFqxsAcdoWEgsNMCzYnreNjH+T0Hsk6KlCUg/MIPkVJm8FRzu8XP2JAM76
sjt1hQsQbKQQGzTXJjfptDOVciktcOemISdfrlZL7OHIeMGWS5UHQoQYDDBb090t
I577QL60ex3URgouFkalMf8O8zS22Q==
=U35C
-----END PGP SIGNATURE-----

--Sig_/xzOYzmjgbeNdirBYSiBDDcK--
