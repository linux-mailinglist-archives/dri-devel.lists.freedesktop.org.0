Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6E41DE9E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 18:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CA36EBA7;
	Thu, 30 Sep 2021 16:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CDE6E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
 bh=v9WIc4f5PlL6tj7GzG4diPUDtLb5L8QC0S7j3j6I/Lw=; 
 b=EYJYhebsB0RNNrsfy/5OCgJoB5JwnyqA+JB4uUXkdDtW5HnfsmND+xPj2+ElOrq8kuBQseLMETDGa9YUOtb3UPK2aAYRKNWapKS3Kmoo1PPLDj6lthaYXjsWhpgmN83JNMxMagX16OugvOW27KCM0GP9PXQJaAKI5rO4pBhlwPWRCH8TWeuv4FV/xoNQ0XzhnygwTSK2Ddxl13F22xrYB9tvTQG8YfG8KhYXQyr/YijumwYKEaPzvAYVFXxfeHEXGsH2lfneKcTBESSXjJojunn2OoCasr334x9h6KMZMnJ4vNmoImROQMsVdQEcNwcgLpiG893Xn5CFBXPC2JxetQ==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVyi5-0000zG-Ua; Thu, 30 Sep 2021 18:15:02 +0200
Date: Thu, 30 Sep 2021 17:14:27 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v3 0/4] drm/v3d: add multiple in/out syncobjs support
Message-ID: <cover.1633016479.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tml5egw2fc3vstkd"
Content-Disposition: inline
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


--tml5egw2fc3vstkd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, v3d only supports single in/out syncobj per submission (in
v3d_submit_cl, there are two in_sync, one for bin and another for render
job); however, Vulkan queue submit operations expect multiples wait and
signal semaphores. This series extends v3d interface and job dependency
operations to handle more than one in/out syncobj.

The first patch just decouples the steps to lookup and add job
dependency from the job init code, since the operation repeats for every
syncobj that a job should wait before starting. So, the fourth patch of
this series will reuse it to handle multiples wait for semaphores.

The second patch moves job memory allocation to v3d_job_init() for any
type of v3d_job-based job. The main goal is to prevent errors when
handling job initialization failures (doing a proper cleanup).=20

The third patch extends our interface by using a generic extension.
This approach was inspired by i915_user_extension[1] and
amd_cs_chunks[2] to give a little more flexibility in adding other
submission features in the future. Therefore, the list of extensions
would work as a hub of features that use an id to determine the
corresponding feature data type.

With this base, the fourth patch adds multiple wait/signal semaphores
support. For this, we add to the list of the generic extensions a new
data type (drm_v3d_multi_sync) that points to two arrays of syncobjs
(in/out) and also determines (wait_stage) the job to add wait
dependencies (v3d_queue). An auxiliary struct (v3d_submit_ext) is used
when parsing submission extensions. Finally, we reserve some space in
the semaphore struct (drm_v3d_sem) to accommodate timeline semaphores
that we aim to add support soon (same reason for already defining
v3d_submit_outsync).

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/i915/i=
915_user_extensions.c?id=3D9d1305ef80b95dde0337106ed8b826604e2155ad
[2] https://cgit.freedesktop.org/drm/drm-misc/tree/include/uapi/drm/amdgpu_=
drm.h#n556

In the mesa side, the work related to this series is in progress at
https://gitlab.freedesktop.org/mwen/mesa/-/commit/6c340bb35203a0418af87a792=
1d7295a4047b77f

v2:
- move job mem alloc to v3d_job_init (Iago)
- simplify and subclass the generic extension struct (Daniel)
- make job dependency conditions more understandable (Iago)

v3 (Iago):
- job should be initialized NULL
- fix error handling for pm ops in v3d_job_init
- remove irrelevant comment
- fix multisync conditions to multiple vs single sempahores

Melissa Wen (4):
  drm/v3d: decouple adding job dependencies steps from job init
  drm/v3d: alloc and init job in one shot
  drm/v3d: add generic ioctl extension
  drm/v3d: add multiple syncobjs support

 drivers/gpu/drm/v3d/v3d_drv.c |  10 +-
 drivers/gpu/drm/v3d/v3d_drv.h |  24 ++-
 drivers/gpu/drm/v3d/v3d_gem.c | 390 +++++++++++++++++++++++++---------
 include/uapi/drm/v3d_drm.h    |  78 +++++++
 4 files changed, 389 insertions(+), 113 deletions(-)

--=20
2.30.2


--tml5egw2fc3vstkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFV4l4ACgkQwqF3j0dL
ehyGnw/+IXajs0h3bnFK6C4mVQjNh0nGnGAIvYiE+Y5QaOMs1haz068S9DV8d5Fd
+wX3fVMqWG89vlTZCJ+YyJzCDfkExX8v9hosTzex9y/GGFXkEcmTBIOASNSVRobI
NcTvHaiq3aFLkrNVUxI97C7ldIbSbs3YXNL2nggBvOpL3blGRwyx5bhvoz/f6mc4
GZYB054Wd/VBOy9t4MYV4ukO//s8KBYSOaa1biE9TGh8KkwdpQdXVNDSaJALcoVo
zXcuBigOPRNJ4ZMhbCe1urUgRqbFiX49MMfk0cbid3Bxz4tIdd4Ft8HjQhTLALgx
ASsAhSye3H9UXSVFMJQyZ8Fxou7gwbKcqu4tAAf0oKrVGAjkGjw+DMPGU10FHAFY
hKvzA5LBEbkOhR9STGhZfjHeIMwkGRBlD5LRhpPGIsQPRNs2wAyuFdtioVxtEFen
8M9lKhiHyONRnre9xJMbVaatDt38BKFT8pCmXp1pzrcBM4/zpkNCEOZtjFRamuuy
2NDVa6UBidiopJ+fnJFZrpJ7CXpnIhJZVx1dsfFoySbrfJ0qiKhIb1ovAcMUDCHy
RhXnLMqisspUENW2VJtcuyiJ+srRBG9XnOVE7jeEuNvpknBEXwUeg3its5l3u9YQ
jJgwn92yr4sCQwxokO2c8+YwlZ95Usf5e1BRbIwG4ccoh9EX6N8=
=UTyI
-----END PGP SIGNATURE-----

--tml5egw2fc3vstkd--
