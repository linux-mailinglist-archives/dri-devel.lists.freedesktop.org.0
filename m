Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95AAB2811
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 13:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDD510E033;
	Sun, 11 May 2025 11:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="DoYDfPaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC1610E033;
 Sun, 11 May 2025 11:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=vGym7rGe1iQ+E2ZmiutxY5zdXmAx4ZiCjyvvFV18j5E=; b=DoYDfPaNJ7XmBIBX
 UTeAx5Z1k7UqMokYldLbzzVDr61Kdq+VKzxVzl0Y9O3dEODGrWtIVkAP+QpVe1MfxvSeNyGxcfPXj
 qtIbPeayZ5sC/XkxhI9pCIgOoS7yuDuy8OZKTj97+0QsqasnFwNA5hdwTftXqvaF7dRm9YJb+EKxC
 ZsHUJ0F8yoc39AYD8sUMWE6sCDp0OzmSlsPqpFV1+e2Cr4ts9FnCOcTefEb0B3gq9u9JDLBTjdhx9
 z2t5OOxGr5HS4uk70lOoJjhp0Q/tzUb9OsU0/ymu53KSqPZEsZxN3+2NUMBlOm9cpMeh6VxmNPLYY
 PZGOG5q5/r9Te4BWFQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1uE5H8-002sl9-1b;
 Sun, 11 May 2025 11:55:22 +0000
Date: Sun, 11 May 2025 11:55:22 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Message-ID: <aCCQKkg6e3yPZmSU@gallifrey>
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:53:32 up 13 days, 20:07, 1 user, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Christophe JAILLET (christophe.jaillet@wanadoo.fr) wrote:
> Le 18/04/2025 =E0 02:21, linux@treblig.org a =E9crit=A0:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >=20
> > radeon_doorbell_free() was added in 2013 by
> > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > allocator")
> > but never used.
>=20
> Hi,
>=20
> I think than instead of being removed, it should be used in the error
> handling path of cik_init() and in cik_fini().

OK, here's an RFC that builds; but if I understand correctly only
some devices run this code, and I'm not sure mine does;

Thoughts?

Dave

=46rom 15b3830b4ee3eb819f86198dcbc596428f9ee0d0 Mon Sep 17 00:00:00 2001
=46rom: "Dr. David Alan Gilbert" <linux@treblig.org>
Date: Sun, 11 May 2025 02:35:41 +0100
Subject: [RFC PATCH] drm/radeon/cik: Clean up doorbells

Free doorbells in the error paths of cik_init and in cik_fini.

Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/radeon/cik.c | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 11a492f21157..3caa5a100f97 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
  */
 int cik_init(struct radeon_device *rdev)
 {
-	struct radeon_ring *ring;
+	struct radeon_ring *ring, *ringCP1, *ringCP2;
 	int r;
=20
 	/* Read BIOS */
@@ -8623,19 +8623,22 @@ int cik_init(struct radeon_device *rdev)
 	ring->ring_obj =3D NULL;
 	r600_ring_init(rdev, ring, 1024 * 1024);
=20
-	ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
-	ring->ring_obj =3D NULL;
-	r600_ring_init(rdev, ring, 1024 * 1024);
-	r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
+	ringCP1 =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
+	ringCP2 =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
+	ringCP1->ring_obj =3D NULL;
+	ringCP2->ring_obj =3D NULL;
+	ringCP1->doorbell_index =3D RADEON_MAX_DOORBELLS;
+	ringCP2->doorbell_index =3D RADEON_MAX_DOORBELLS;
+
+	r600_ring_init(rdev, ringCP1, 1024 * 1024);
+	r =3D radeon_doorbell_get(rdev, &ringCP1->doorbell_index);
 	if (r)
 		return r;
=20
-	ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
-	ring->ring_obj =3D NULL;
-	r600_ring_init(rdev, ring, 1024 * 1024);
-	r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
+	r600_ring_init(rdev, ringCP2, 1024 * 1024);
+	r =3D radeon_doorbell_get(rdev, &ringCP2->doorbell_index);
 	if (r)
-		return r;
+		goto out;
=20
 	ring =3D &rdev->ring[R600_RING_TYPE_DMA_INDEX];
 	ring->ring_obj =3D NULL;
@@ -8653,7 +8656,7 @@ int cik_init(struct radeon_device *rdev)
=20
 	r =3D r600_pcie_gart_init(rdev);
 	if (r)
-		return r;
+		goto out;
=20
 	rdev->accel_working =3D true;
 	r =3D cik_startup(rdev);
@@ -8678,10 +8681,16 @@ int cik_init(struct radeon_device *rdev)
 	 */
 	if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
 		DRM_ERROR("radeon: MC ucode required for NI+.\n");
-		return -EINVAL;
+		r =3D -EINVAL;
+		goto out;
 	}
=20
 	return 0;
+
+out:
+	radeon_doorbell_free(rdev, ringCP1->doorbell_index);
+	radeon_doorbell_free(rdev, ringCP2->doorbell_index);
+	return r;
 }
=20
 /**
@@ -8695,6 +8704,7 @@ int cik_init(struct radeon_device *rdev)
  */
 void cik_fini(struct radeon_device *rdev)
 {
+	struct radeon_ring *ring;
 	radeon_pm_fini(rdev);
 	cik_cp_fini(rdev);
 	cik_sdma_fini(rdev);
@@ -8708,6 +8718,10 @@ void cik_fini(struct radeon_device *rdev)
 	radeon_ib_pool_fini(rdev);
 	radeon_irq_kms_fini(rdev);
 	uvd_v1_0_fini(rdev);
+	ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
+	radeon_doorbell_free(rdev, ring->doorbell_index);
+	ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
+	radeon_doorbell_free(rdev, ring->doorbell_index);
 	radeon_uvd_fini(rdev);
 	radeon_vce_fini(rdev);
 	cik_pcie_gart_fini(rdev);
--=20
2.49.0


--=20
 -----Open up your eyes, open up your mind, open up your code -------  =20
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \=20
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
