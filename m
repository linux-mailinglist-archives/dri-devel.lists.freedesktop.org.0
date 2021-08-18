Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA553F0A95
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FEE6E88D;
	Wed, 18 Aug 2021 17:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686F06E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
 bh=fcb8BZxgt3wrtxOZp2Hnxar34PEau/lLJzax/sMYtnA=; 
 b=FHdnd6sJuuS5lzS1io19aX3OBKUtd3tFcAkZjfuW6beB0rJvaLr+UGO04qbRABAJkA18CkqpsDUssuV5g53HKC1SrByhRmGAU8FqtRJJyE8aaG5IsdtlVLcMdywriLLuMo+uRXsQRGaYPDNl1UKKMwNc4LHumHI3YfMWV4ICRPOqXOZCKuN2wdrY0k1REQUi0ZM9kHZgOKO7kwaHlow91uzV0AagDMRU3vgNA2fHXNLgAQRmrQVHt7LDZTqRuXaJprfAYg6YW5xHoacN5hmL47mgipxxueybxp9Ll7fWACGQwZzJTEB6MFgJ+TzM2te0D+S9tLrSzTsaXhT42L8nMw==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mGPlc-0005Pf-EF; Wed, 18 Aug 2021 19:54:20 +0200
Date: Wed, 18 Aug 2021 18:54:08 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/3] drm/v3d: add multiple in/out syncobjs support
Message-ID: <cover.1629307160.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kuobdsbvgn2wdukj"
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


--kuobdsbvgn2wdukj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, v3d only supports single in/out syncobj per submission (in
v3d_submit_cl, there are two in_sync, one for bin and another for render
job); however, Vulkan queue submit operations expect multiples wait and
signal semaphores. This series extends v3d interface and job dependency
operations to handle more than one in/out syncobj.

The main difference from the RFC series[1] is that here I already worked
on top of Daniel Vetter's work for drm/scheduler[2] (even if the series
is missing a few acks).

The first patch just decouples the steps to lookup and add job
dependency from the job init code, since the operation repeats for every
syncobj that a job should wait before starting. So, the third patch of
this series will reuse it to handle multiples wait for semaphores.=20

The second patch extends our interface by using a generic extension.
This approach was inspired by i915_user_extension[3] and
amd_cs_chunks[4] to give a little more flexibility in adding other
submission features in the future. Therefore, the list of extensions
would work as a hub of features that use an id to determine the
corresponding feature data type.

With this base, the third patch adds multiple wait/signal semaphores
support. For this, we add to the list of the generic extensions a new
data type (drm_v3d_multi_sync) that points to two arrays of syncobjs
(in/out) and also determines (flags) if the dependencies must be added
to the bin job or render job (in the case of v3d_submit_cl). An
auxiliary struct (v3d_submit_ext) is used when parsing submission
extensions. Finally, we reserve some space in the semaphore struct
(drm_v3d_sem) to accommodate timeline semaphores that we aim to add
support soon (same reason for already defining v3d_submit_outsync).

[1] https://patchwork.freedesktop.org/series/93388/
[2] https://patchwork.freedesktop.org/series/93413/
[3] https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/i915/i=
915_user_extensions.c?id=3D9d1305ef80b95dde0337106ed8b826604e2155ad
[4] https://cgit.freedesktop.org/drm/drm-misc/tree/include/uapi/drm/amdgpu_=
drm.h#n556

In the mesa side, the work related to this series is available at
https://gitlab.freedesktop.org/mwen/mesa/-/commit/77bd2b21f61a9caeced934bd1=
3b99e675a428398
where I checked these changes using Mesa CI.

Melissa Wen (3):
  drm/v3d: decouple adding job dependencies steps from job init
  drm/v3d: add generic ioctl extension
  drm/v3d: add multiple syncobjs support

 drivers/gpu/drm/v3d/v3d_drv.c |   7 +-
 drivers/gpu/drm/v3d/v3d_drv.h |  14 ++
 drivers/gpu/drm/v3d/v3d_gem.c | 303 ++++++++++++++++++++++++++++------
 include/uapi/drm/v3d_drm.h    |  76 ++++++++-
 4 files changed, 350 insertions(+), 50 deletions(-)

--=20
2.30.2


--kuobdsbvgn2wdukj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEdSTsACgkQwqF3j0dL
ehywFA/9EonhSNuy6YEyFeJpa5f9bIKLdCfKg00Dp0CTHAChAVsFnoZ+IDtbb0SO
ldoisEOmXyehMonPnq6/mHmOz+ru68q3p+OweMwJIxWxZADF8opVbgvMKRBSeKYZ
z4FzsGP6icCYkWaVHcWACHtKL78eEg+vZmS+AsuviXA5eaFolzvJ/6/f26AOdaNI
Q/Bdbn8Ybxt/h6zEzd36TuaZxqjPT2O0GUn2hN9PwMyjxmy2K6FhUIszizcH0o0i
jflaV1ot0Qfq6ni2V2i+q5jlGYP0VzfZnzebjH3FcHiC2OPrdBptdeSuBxW3pHom
vJ0f6SjJhF6ldGeAEKO2HRl/HzcsPsoFAeljZGnO2f9DRuaN4avfE+L0VBWD6Phs
+mDQ1ucgwFBsRf4PpMgsXJ6k+asPjUSNbxuMRoZeTxVLkwSMtjI79WkOAu4k+ADU
G2OOjdyoeOrlfTVQZJHt57XGULWzGfl0EWiWN0XVbXNl+pzf08yGQL+nXv55Wt1g
3qXO4Nwyz6WLSqwUqNKJgtDeOolh6zMjwit4qKZ/K7RJFp3+2kyXfqpp/AlSVeMW
n1ZKbqVvF0CjL4OUdO+2b8K363JnyR4Hez5/ECeWG7tNymMmKWaGSqCf1enJU+Li
8KcxXm6rgY9jcOBMUStQk9LjIk25vZtiSOibgvopDv1PRwxHy7I=
=lJ/q
-----END PGP SIGNATURE-----

--kuobdsbvgn2wdukj--
