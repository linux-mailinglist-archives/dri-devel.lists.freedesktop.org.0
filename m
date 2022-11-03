Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C4618CA8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 00:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2E710E6D2;
	Thu,  3 Nov 2022 23:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E0D10E6CE;
 Thu,  3 Nov 2022 23:15:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N3KNm1zvPz4xGQ;
 Fri,  4 Nov 2022 10:15:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1667517320;
 bh=tM1MvXcfRBx2uPm9hhpVrMwKQf2k9tr/drdD63iQNfU=;
 h=Date:From:To:Cc:Subject:From;
 b=K4uh6ywNakRILCxgMKWHWpuhkXJELXpJf8gQCbflffySvh5IRmhSkBryXHRfp4TyI
 tyU97ExysDFENluBp5qiSSpVDotqtmr8Kq3ohSkKJskxSbmkTll/dOPIf01R8p9og2
 LMXNUPSPCn/UJfyk69AVvofEzJWoW3Ha5rWI7uG8XBIElCq8upUjetEbCMTVjCOkvD
 6grOmFvDO9LmLzKFLypA3K3cF87oa1Nylw61ujG5cfvoZQPxAyQjFoVJlbPv8djpPy
 /q0r58w7G9tnCFXHQtb3ymFSINiEwihGsw6BVQEMoTLZ2qN2Sb8x0Phseh1bM6OMSR
 W4LyR9Y/ycH2A==
Date: Fri, 4 Nov 2022 10:15:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20221104101503.777fa92f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mDKJXgG2m49_Fc0CtbeXI4i";
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

--Sig_/mDKJXgG2m49_Fc0CtbeXI4i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/gpu_scheduler.h

between commit:

  7b476affcccf ("drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag")

from Linus' tree and commit:

  4d5230b50dd4 ("drm/scheduler: add drm_sched_job_add_resv_dependencies")

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

diff --cc include/drm/gpu_scheduler.h
index ca11716d084a,e40baefadc3a..000000000000
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@@ -32,15 -32,8 +32,17 @@@
 =20
  #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 =20
 +/**
 + * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
 + *
 + * Setting this flag on a scheduler fence prevents pipelining of jobs dep=
ending
 + * on this fence. In other words we always insert a full CPU round trip b=
efore
 + * dependen jobs are pushed to the hw queue.
 + */
 +#define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
 +
+ enum dma_resv_usage;
+ struct dma_resv;
  struct drm_gem_object;
 =20
  struct drm_gpu_scheduler;

--Sig_/mDKJXgG2m49_Fc0CtbeXI4i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNkS3cACgkQAVBC80lX
0Gzoogf+PjKbLtC+rWkutwb/8LqNSr7RAmnRG4hhHsoDFLBPL+Rg49YffUffl1Ry
pnWa6Hyrn096EHmEhxQbY+BaLua+QMYK7Xpnuj1EFozTR3pmCUbaoAg46DkurLZi
Cx6Qg6Uyz8EGc0zGdk6SaJ1vBL5VLgtApSPlQGV34YQ6+KuaOjwOmn40JCX82Jt/
HlpG25xghWi3mGW5fcVVQmDANCErKkYJFRYuuEdJI6lcK3mv4gvBaEp4+83kcoDz
lQ5DDV+KJ1qMkzKiROe3dBaT+Xesj9idVFXnCI6sc0txOEmsDuDCxYEvf0MICxaR
t0/alE3ohS5HE0G3IRevwKWxRTschA==
=F7+Q
-----END PGP SIGNATURE-----

--Sig_/mDKJXgG2m49_Fc0CtbeXI4i--
