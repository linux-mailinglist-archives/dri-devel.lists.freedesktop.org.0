Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45AE9560F9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 03:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC76610E18E;
	Mon, 19 Aug 2024 01:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eidlqQiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C2610E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 01:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1724032616;
 bh=Z9ua4HYe3l27bRihDl//IsW8kp5DNKDWbNNkXdoETLM=;
 h=Date:From:To:Cc:Subject:From;
 b=eidlqQiDy0N8xz8ZMdsnu9naWVy88+E7JY2AoYtXST/m6SbHWo7/IPR/4PzxOBG7v
 ZjxMa0ZP5sX3XbPyDuPVxmexvbWdcVE9oXIsr0A0zbNP5qC2uZFDJoWbK4HVUyiVAi
 2UpDKslndhOemttxBUUAeANSBPzG7UzSJC9QUha8tc/TlIa4qXlx7y3AvxP/RPhp8R
 X0qrLQ5lRGVYLHVFpAVwYPXoTmL/a9QqbmpBTiRS0/IJaVpQQSM+9PpL9NOGzXTIOb
 sFZ565WxBD1CvmytXJESfBc6+gBmvnkl61PkTLPEPqZKRK+ti+7bSb4lHUbHIWndPS
 yhGN0Odrc+4+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnG1M2MMsz4wb0;
 Mon, 19 Aug 2024 11:56:55 +1000 (AEST)
Date: Mon, 19 Aug 2024 11:56:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20240819115654.77aeabcc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t_c0q45LlXL1EPMNS1P.A24";
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

--Sig_/t_c0q45LlXL1EPMNS1P.A24
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_job.c: In function 'amdgpu_job_timedout':
drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:90:33: error: too many arguments to=
 function 'drm_sched_start'
   90 |                                 drm_sched_start(&ring->sched, true);
      |                                 ^~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:28,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:29,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:30:
include/drm/gpu_scheduler.h:582:6: note: declared here
  582 | void drm_sched_start(struct drm_gpu_scheduler *sched);
      |      ^~~~~~~~~~~~~~~

Caused by commit

  15789fa0f0e2 ("drm/amdgpu: add per ring reset support (v5)")

interacting with commit

  83b501c1799a ("drm/scheduler: remove full_recover from drm_sched_start")

from the drm tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 Aug 2024 11:46:24 +1000
Subject: [PATCH] fixup for "drm/amdgpu: add per ring reset support (v5)"

interacting with "drm/scheduler: remove full_recover from drm_sched_start"
from the drm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_job.c
index c6a1783fc9ef..597489dea114 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -87,7 +87,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct=
 drm_sched_job *s_job)
 			atomic_inc(&ring->adev->gpu_reset_counter);
 			amdgpu_fence_driver_force_completion(ring);
 			if (amdgpu_ring_sched_ready(ring))
-				drm_sched_start(&ring->sched, true);
+				drm_sched_start(&ring->sched);
 			goto exit;
 		}
 	}
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/t_c0q45LlXL1EPMNS1P.A24
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCpmYACgkQAVBC80lX
0GxPqQf/cMKY1d8GDXBEnR3Uqre4pyfcrR1gNfkAA88HldPdvHn2fgvNQ4TfTL3/
CLuQzPDFdcvAerPtJs54epGSbEZHGNFCw1evq5rMtxBgcth/rCMxXhrqo8nue1Gv
SauDUJqFKt7fsw9sXHXOBekxhWds34BuaEO5D+9379Io2+6PT17deRY0fmOrRrmf
O9Pkch3+MeZnCySTRrcJ6uL6TaXmSdX6fa0eR1ufwK4e73OVCmpclxr6JEGDQS70
JA/TByNqYAqaWtOI0BjvjDb9foimXuaLB9h6wSDuMERJ+O6/y1N1qmQqQ4MVgGFU
QpIsI+JPYRO9300PAQlSZg6+W9AHJA==
=0kIr
-----END PGP SIGNATURE-----

--Sig_/t_c0q45LlXL1EPMNS1P.A24--
