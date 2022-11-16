Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AD462AFDC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 01:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0186E10E115;
	Wed, 16 Nov 2022 00:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934B510E0F9;
 Wed, 16 Nov 2022 00:09:27 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NBk1c5hkTz4xGH;
 Wed, 16 Nov 2022 11:09:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668557365;
 bh=6Nu4z6TdAZbmv8KRjIMPAWBQTNbHXtov0C66FP7Dsyw=;
 h=Date:From:To:Cc:Subject:From;
 b=sy0p4glJEpPzZDYl5SH1/6Kbi9cBB9sNJHISD+khwc9+U+vnu8uKbOp5pLviPLjA0
 Fbgg3XBylRV5yRmJ3y1qE9UUPDigVuldmHq7QHZ/Qma9ld1/mhBJ7Uu937Ini4dhzp
 dHPno5qkkHPpir6KsRyfCPBaCQ65CzNAOpTEXGI667WgzVjlF5MUCi/diYvmqx1kZs
 yIDuAdgGXhSvZPb5Ip+Hh1pEppQPp8GDJ1WJJ8S5JmAjhwinUrd0dxwF4cilUyzLnW
 H+m6WLVHvH9yRE746Yeky2CbEWWWA6r9MD7hNdAua18V1X/HtC9Oz4vJLiwG8bwg23
 wWoUN9+wEe13A==
Date: Wed, 16 Nov 2022 11:09:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20221116110923.0b6b04da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r_DbATAmjPh=+MAx6uZqSW_";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/r_DbATAmjPh=+MAx6uZqSW_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  include/drm/gpu_scheduler.h

between commit:

  2cf9886e2816 ("drm/scheduler: remove drm_sched_dependency_optimized")

from the drm-misc tree and commit:

  06a2d7cc3f04 ("drm/amdgpu: revert "implement tdr advanced mode"")

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

diff --cc include/drm/gpu_scheduler.h
index cec147f7c50b,0168ff469ae0..000000000000
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@@ -532,10 -528,9 +532,7 @@@ void drm_sched_wakeup(struct drm_gpu_sc
  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job=
 *bad);
  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
- void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max=
);
  void drm_sched_increase_karma(struct drm_sched_job *bad);
- void drm_sched_reset_karma(struct drm_sched_job *bad);
- void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
 -bool drm_sched_dependency_optimized(struct dma_fence* fence,
 -				    struct drm_sched_entity *entity);
  void drm_sched_fault(struct drm_gpu_scheduler *sched);
  void drm_sched_job_kickout(struct drm_sched_job *s_job);
 =20

--Sig_/r_DbATAmjPh=+MAx6uZqSW_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN0KjMACgkQAVBC80lX
0GyuAwf+M10fb+ko1NtpmFHEMA41pxXR9JSkAVY5/dvaeMlHcxDpVxhQH8W1Dwvn
UOvsPYKeWYu9j9hA6advozzvrnlvckmk9XQamQapL54rQE5r7x37QazHHXv1ZCuv
vzmSf10kEKCkyzyctpne0Ud287VdueXEHYNt+eayzNHk1MTG+LkZzZDSBBsCPK/N
mvnSJ47TY5Zxu3+4xeG8TRiSEsuECGLGV8dl9JPE7Fyfrza837RY1eMwPxkqsdLL
j7ncxqwDIW3VC/0l2IhN1zSiwyU2FAV0UB1c43Kvva0pH9vxzZJfvUDgFNcJfO16
opoGpRNpa6umSU3ONqFGKUeDYgYKmA==
=fp2y
-----END PGP SIGNATURE-----

--Sig_/r_DbATAmjPh=+MAx6uZqSW_--
