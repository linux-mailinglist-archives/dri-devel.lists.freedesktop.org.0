Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83184AB8E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 02:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F403112770;
	Tue,  6 Feb 2024 01:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p3Xvi+hM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06811276F;
 Tue,  6 Feb 2024 01:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707182905;
 bh=zKY0CiN5eVCwjR4J5nAX4GlXw1p1JS0IYgVBmlyJXhU=;
 h=Date:From:To:Cc:Subject:From;
 b=p3Xvi+hMgs/tLQ65WhXY7emQZorkU4vGyAiUEQbvWBp1E981nzdmSgyKCCXXuf7Na
 blaobyUTeSuF1zEg0PR5GrBjvuOgKjy+D+XB/AiawYhwC1Z6Z4DdVUJZezpvl/6OkZ
 +xplFY/nIQV5Bfu0dUqTUlnEHdEAKoDBrpBC9lUCkRNrbZjuqDlDCrpfXj2Ir4BOLA
 CkrTYUobEbgY0e7DYRsUUkc2xxG7MgDjbIP95NJsY8diIbX7AyAxgj5mMu86Ml/lv4
 BWk5g1OMgbHjtRIuOAmzM14lqUw1KD6LP9KbDI8AT5ev+rJN9Fn+SxH5mk5RpQLEnw
 fBfhei6CorH1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTQcR1p92z4wcJ;
 Tue,  6 Feb 2024 12:28:23 +1100 (AEDT)
Date: Tue, 6 Feb 2024 12:28:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240206122822.12a2df89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qoofQSLe6__zbq+lF9FrpkO";
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

--Sig_/qoofQSLe6__zbq+lF9FrpkO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")

interacting with commit

  dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

(and maybe others) from Linus' tree (v6.8-rc1).

I have applied the following merge fix patch for today.  This makes it buil=
d,
but more is likely needed ...

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Feb 2024 12:21:07 +1100
Subject: [PATCH] fix up for "drm/ttm: replace busy placement with flags v6"

interacting with commit

  dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0b0e262e2166..280dbda8ae5a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -38,8 +38,6 @@ static const struct ttm_place sys_placement_flags =3D {
 static struct ttm_placement sys_placement =3D {
 	.num_placement =3D 1,
 	.placement =3D &sys_placement_flags,
-	.num_busy_placement =3D 1,
-	.busy_placement =3D &sys_placement_flags,
 };
=20
 static const struct ttm_place tt_placement_flags =3D {
@@ -52,8 +50,6 @@ static const struct ttm_place tt_placement_flags =3D {
 static struct ttm_placement tt_placement =3D {
 	.num_placement =3D 1,
 	.placement =3D &tt_placement_flags,
-	.num_busy_placement =3D 1,
-	.busy_placement =3D &sys_placement_flags,
 };
=20
 bool mem_type_is_vram(u32 mem_type)
@@ -230,8 +226,6 @@ static int __xe_bo_placement_for_flags(struct xe_device=
 *xe, struct xe_bo *bo,
 	bo->placement =3D (struct ttm_placement) {
 		.num_placement =3D c,
 		.placement =3D bo->placements,
-		.num_busy_placement =3D c,
-		.busy_placement =3D bo->placements,
 	};
=20
 	return 0;
@@ -251,7 +245,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tb=
o,
 		/* Don't handle scatter gather BOs */
 		if (tbo->type =3D=3D ttm_bo_type_sg) {
 			placement->num_placement =3D 0;
-			placement->num_busy_placement =3D 0;
 			return;
 		}
=20
@@ -1353,8 +1346,6 @@ static int __xe_bo_fixed_placement(struct xe_device *=
xe,
 	bo->placement =3D (struct ttm_placement) {
 		.num_placement =3D 1,
 		.placement =3D place,
-		.num_busy_placement =3D 1,
-		.busy_placement =3D place,
 	};
=20
 	return 0;
@@ -2112,9 +2103,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
=20
 	xe_place_from_ttm_type(mem_type, &requested);
 	placement.num_placement =3D 1;
-	placement.num_busy_placement =3D 1;
 	placement.placement =3D &requested;
-	placement.busy_placement =3D &requested;
=20
 	/*
 	 * Stolen needs to be handled like below VRAM handling if we ever need
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/qoofQSLe6__zbq+lF9FrpkO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXBizYACgkQAVBC80lX
0GyAJgf9Hild1zSurCMflzSa/SDNJVx/KSmIxojPE0TyUGi7s03D5gM99mKXR30J
yRSZ1KM8B41FEGlmQRMoNHBnkUk8tYz7aajNjxnhIXXcIxU8xiGqgsjQ+bJ2kimg
+xkn/SB7HMKW761o4k3ETBJKDUmOw9lUEGW4KCpmzM446mxF8Lc2RoqHWWSzggfS
9nVAH9NcStDpFWT6vCYY19fmd1g8S+LSAYE0Z5wFu088tJd+8liM/8l/+NBihDRV
n0cR9Gec6OmN2YTozZrqRnVgRi/Cd90NzTdA9c2VHb2x4dK3/GlA3qZfnl1DEXjF
1Rg3OYiVjN3JObhHkODbJgQNsLJZDQ==
=xKqJ
-----END PGP SIGNATURE-----

--Sig_/qoofQSLe6__zbq+lF9FrpkO--
