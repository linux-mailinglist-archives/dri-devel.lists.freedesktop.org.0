Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8041C1D2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8458E89D8A;
	Wed, 29 Sep 2021 09:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8989CCB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
 bh=njtY0zMgDjWtrEIqm/lJQijm8aGKNfX0oTCq5sgzS8w=; 
 b=EGFnwyPxnoFh+TVuawUBVaOk7Khqa9+RJidBHtED1vKzAMxuLgdRTVoNVq+/1DhqJKJqZ+0cHn5N34wrf+Rno3Bd8oaozDB734q3CYzj0w1IBFkXuSDp7bRnwTn3aItg8Xzt7QWoCUE1tW3aDhNz2oOUDqUij+eiN1njbVRUocB9QT+Kig4VtTIj+aqrv6W7zFsMuI91ZPQ/hyzdDffClLC2ab0e4cw0aJKx0FX3dBfjloCmlwBz/exGvDp6ax5lt4R4EMlvU+UKLXhfdOYlDLUNPVFcq6M43M0lgV/gtX2S3ZwwPkpukJ5TAQzSFGa7jlSqNH4wKZt73GN7hPgTlg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mVW5t-0005Xv-Qq; Wed, 29 Sep 2021 11:41:41 +0200
Date: Wed, 29 Sep 2021 10:41:29 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Iago Toral <itoral@igalia.com>
Subject: [PATCH v2 0/4] drm/v3d: add multiple in/out syncobjs support
Message-ID: <cover.1632905676.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6vvr6dh43r35jgcc"
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


--6vvr6dh43r35jgcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, v3d only supports single in/out syncobj per submission (in
v3d_submit_cl, there are two in_sync, one for bin and another for render
job); however, Vulkan queue submit operations expect multiples wait and
signal semaphores. This series extends v3d interface and job dependency
operations to handle more than one in/out syncobj.

This version differs from the previous one by adding a prep work patch
that synthesizes job memory allocation and initialization into a single
function. Also, the design for ioctl extensions changed to subclass
drm_v3d_extension (generic type) as base element of any specific
extension (here is drm_v3d_multisync). Finally, in the multisync
extension, flags was replaced by wait_stage and it uses v3d_queue to
define sync stage (i.e. which queue to add wait semaphores)

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


Melissa Wen (4):
  drm/v3d: decouple adding job dependencies steps from job init
  drm/v3d: alloc and init job in one shot
  drm/v3d: add generic ioctl extension
  drm/v3d: add multiple syncobjs support

 drivers/gpu/drm/v3d/v3d_drv.c |  10 +-
 drivers/gpu/drm/v3d/v3d_drv.h |  23 ++-
 drivers/gpu/drm/v3d/v3d_gem.c | 360 +++++++++++++++++++++++++---------
 include/uapi/drm/v3d_drm.h    |  78 ++++++++
 4 files changed, 368 insertions(+), 103 deletions(-)

--=20
2.30.2


--6vvr6dh43r35jgcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFUNMQACgkQwqF3j0dL
ehwoQg/6Aqr8kcba4bkidK1xWXqA+PF1iaeofG6RBk3RWXj+HHWe8OdXdIdcgD8w
OYbnMZiF79XQP7ZzI2IFiwizseqeuSjybyxXVmEKdgWXL0qlpHKHM5iPG0PGmeVw
4HQaHUIzrOYi59wvW1Jv13KjtvUjGXzazNA5uXY3yII5FgCbDE0Sq/68PPkC/AjD
1UWeVpmIDOycNlIPWyuf8V+Nx8NpuMTijqn5oDar3DIemm4j6fTwCOrQP/TB6W1u
tuezG1rqPWbwdonQKsE0S+9KNYcucbVtT7TDL2o/m7Lbqv+8KHZ/NXZ987y7tQ2N
wMhSvL/5J7Lx+2I4NsSjTGuo6tVo3kkcJdgKxiVfA9Ey9DjgXwjWldx+NIdQ0pNg
OJvhhUOU10O2l6pWD73fP/dEWy4xrAG0wDv5sOj8oDujTtMP8exZ65mA/sMeiyFw
w6MzrrX8VipnQe/69G8+Ns3hXCNWUnLbgTPrPq/UJrQkYo2R/UJivsN7Wd7qax/9
tEwkgw4fQnAAaaONeyaR/1QWH5urPeUyAC7mJ1MzLzVfoqp2pXOq3BN3+e3ueyS5
F54ji3nEQ6kDOIo6/ladcAiL64I/CDDv1nxmd90RCZhLrdkyOoHxgGlqehXzGiH2
CIOe/Of/N4gC4uAhNrrWkN6xLbH5TMzWSnQCqcuhOoyU1WcE32w=
=rX10
-----END PGP SIGNATURE-----

--6vvr6dh43r35jgcc--
