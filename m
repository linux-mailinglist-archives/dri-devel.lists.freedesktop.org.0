Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2C63E03AA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2F6EA8F;
	Wed,  4 Aug 2021 14:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60186EAA3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
 bh=/gTUvzZRqZiXlxbXCZzobi/ma+XXdoIdUFXVrjdzny8=; 
 b=sy2rhOZzee7vA+7bZKe+S89AALNIA6IteaBILO9BbFOiZW9Wmy1dXcbfbizz1q1PloF0QJO2OgqGsJwG8tc2zWfjUFX6cRhDx0sPBj501EY9fOfxiWX/BOxs2020E5SjBbztbYUZph51APySKbETzdvK1efVEpoyP11cI223VeUG7D58rY6mkowFJW6pSQVdGM6DpqcU24ueKjadZyEJMiU9M00sGOisVg46BJE3tM2LxuCg9ukogk4J+DiwOd0sBQoOszHMCha3PmKCzBbHhWwQxJ95P4KVXwAWHQll4U/h9rbyTxpmV8HCnr5EiHbQiARwGPDjS7Kpv9dMZqH6Hg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mBIBw-00063t-5h; Wed, 04 Aug 2021 16:48:20 +0200
Date: Wed, 4 Aug 2021 15:47:47 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [RFC PATCH 0/3] drm/v3d: add multiple in/out syncobjs support
Message-ID: <cover.1628076510.git.mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gyzorwbssdhbbavd"
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


--gyzorwbssdhbbavd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Currently, v3d only supports single in/out syncobj per submission (in
v3d_submit_cl we have two in_sync, one for bin and another for render
job); however, Vulkan queue submit operations expect multiples wait and
signal semaphores. This series extending v3d interface and job
dependency operations to handle more than one in/out syncobj.

The first patch just decouples the steps to add job dependency from the
job init code since the operation repeats for every syncobj that a job
should wait before starting. So, we can just reuse it when handling
multiples wait for semaphores in the third patch of this series.

The second patch extends our interface by using a generic extension.
We chose this approach inspired by i915_user_extension[1] and
amd_cs_chunks[2] to give a little more flexibility in adding other
submission features in the future. Therefore, the list of extensions
will work as a hub of features that use an id to determine the
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

[1] https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/i915/i=
915_user_extensions.c?id=3D9d1305ef80b95dde0337106ed8b826604e2155ad
[2] https://cgit.freedesktop.org/drm/drm-misc/tree/include/uapi/drm/amdgpu_=
drm.h#n556

PS: I'm cc'ing more people to get any comments for the generic
extension approach and the multiple semaphores support too.

Melissa Wen (3):
  drm/v3d: decouple adding job dependencies from job init
  drm/v3d: add generic ioctl extension
  drm/v3d: add multiple syncobjs support

 drivers/gpu/drm/v3d/v3d_drv.c |   7 +-
 drivers/gpu/drm/v3d/v3d_drv.h |  14 ++
 drivers/gpu/drm/v3d/v3d_gem.c | 304 +++++++++++++++++++++++++++++-----
 include/uapi/drm/v3d_drm.h    |  76 ++++++++-
 4 files changed, 355 insertions(+), 46 deletions(-)

--=20
2.30.2


--gyzorwbssdhbbavd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmEKqI8ACgkQwqF3j0dL
ehzRgQ/+PJ3D3lfOzLpMRBsVqa6AtEwCs6GXHd6Vem6KQAW5Yi5k2J8vf0JhWSqj
BvleOqQO6m0Muk2wZLlchRYhLGuvOVezEO9VDcoWqcuK6KfqWjhddWtUZShdSMxz
5HuJTwn52FYCtArhk1EijdV+ZTYwXBvyG/13hR07a3NzZtkfHVjQ6sRFBIK8mlIJ
cKDfzHyF9APPbdWXaIaaMmN+G2i93qLOUnhs7Ol5Vtkl7aW7IaPOj9PlWA4ymjmn
JJw9u6FZrO9dwfns9th368sLLET4f7C+kIImgQFo4yl1hoDjNiyD1+0DUTxIj3QZ
DkQY311miDdTW2sZ96AlD3+FQ25bGH2Dq52Sy8Pilj6POua/DDPnykSNldKEE9Ic
lfcXrXHk2JDR2icnrEF2w290xXSHYVb/9b0LMAro52skFxQcLjQ1LBSr078eXFNl
z7YG1CNeDTkmnOqN3XEUOIJkBUq27UGkfQ5FLvkUpq711s17wtYp4IzhR11Gri4K
kpqXE+JquM5xx0W+jBwmMM42x0tp+yNXl97tB4dmaA1qwr4zW2IjGABntDG0nCOn
4dpKlOsKsuejF9Ehu0kiL9DbUvYYQfAKRT+WFQXgjDiiA8ZznHXoQTAgrC8MPcpj
15nFe5P9dQ6K8RgwFkirGV4E9ZmsFh2ciPsItRg1RKIQIMtQvEk=
=Y+6G
-----END PGP SIGNATURE-----

--gyzorwbssdhbbavd--
