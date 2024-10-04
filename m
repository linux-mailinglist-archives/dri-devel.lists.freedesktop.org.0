Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0D98FC3B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 04:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D3C10E23D;
	Fri,  4 Oct 2024 02:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G4NRfL6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422F010E1B6;
 Fri,  4 Oct 2024 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728008281;
 bh=PltzQyGOsappo7+6bKToHM0oOpnfQxAb9D8FQdYGGLw=;
 h=Date:From:To:Cc:Subject:From;
 b=G4NRfL6gvV9RuGYHaywEujfDQWkt/AhGxC9D8VHBi8lEl6810zAkKgiI1D8+4Fc6K
 9lvj/4RbPjsz2koRZes4v8PJWBK3LM7pbuzT0TrumMF6b1uV9jQGBVC+FkhzK1oQWq
 h+ijXi0OJGUrcherZwxl/9bSEzJLJ7e6VJKDeh9XnVbKg2zvzCfX4iyoed55hOi1QW
 gRY2DZb0X8C7G+/UjMd63Ggwp3/XSGCRgEV58dxiUmNAYr9ib+bBqzK6QFxvWsFWGX
 b+u6U9K60KMElMqhi0RPPa/RBouYmYYRs5WZ+i9CLvvI4bFygUaj1l1KHath6U4SrK
 yIAEzELzVw6Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKXJS2ycQz4x8h;
 Fri,  4 Oct 2024 12:18:00 +1000 (AEST)
Date: Fri, 4 Oct 2024 12:18:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-misc-fixes
 tree
Message-ID: <20241004121800.7ab3214b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jD=fq14.FzymV123VlZ2qFF";
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

--Sig_/jD=fq14.FzymV123VlZ2qFF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  9286a191abe2 ("drm/xe: Drop GuC submit_wq pool")

from the drm-misc-fixes tree and commit:

  861108666cc0 ("drm/xe: fix UAF around queue destruction")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_guc_submit.c
index 17c25f18e286,8a5c21a87977..000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@@ -224,11 -224,80 +224,27 @@@ static bool exec_queue_killed_or_banned
  		 EXEC_QUEUE_STATE_BANNED));
  }
 =20
 -#ifdef CONFIG_PROVE_LOCKING
 -static int alloc_submit_wq(struct xe_guc *guc)
 -{
 -	int i;
 -
 -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i) {
 -		guc->submission_state.submit_wq_pool[i] =3D
 -			alloc_ordered_workqueue("submit_wq", 0);
 -		if (!guc->submission_state.submit_wq_pool[i])
 -			goto err_free;
 -	}
 -
 -	return 0;
 -
 -err_free:
 -	while (i)
 -		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
 -
 -	return -ENOMEM;
 -}
 -
 -static void free_submit_wq(struct xe_guc *guc)
 -{
 -	int i;
 -
 -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i)
 -		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
 -}
 -
 -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 -{
 -	int idx =3D guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
 -
 -	return guc->submission_state.submit_wq_pool[idx];
 -}
 -#else
 -static int alloc_submit_wq(struct xe_guc *guc)
 -{
 -	return 0;
 -}
 -
 -static void free_submit_wq(struct xe_guc *guc)
 -{
 -
 -}
 -
 -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 -{
 -	return NULL;
 -}
 -#endif
 -
+ static void xe_guc_submit_fini(struct xe_guc *guc)
+ {
+ 	struct xe_device *xe =3D guc_to_xe(guc);
+ 	struct xe_gt *gt =3D guc_to_gt(guc);
+ 	int ret;
+=20
+ 	ret =3D wait_event_timeout(guc->submission_state.fini_wq,
+ 				 xa_empty(&guc->submission_state.exec_queue_lookup),
+ 				 HZ * 5);
+=20
+ 	drain_workqueue(xe->destroy_wq);
+=20
+ 	xe_gt_assert(gt, ret);
+ }
+=20
  static void guc_submit_fini(struct drm_device *drm, void *arg)
  {
  	struct xe_guc *guc =3D arg;
 =20
+ 	xe_guc_submit_fini(guc);
  	xa_destroy(&guc->submission_state.exec_queue_lookup);
 -	free_submit_wq(guc);
  }
 =20
  static void guc_submit_wedged_fini(void *arg)

--Sig_/jD=fq14.FzymV123VlZ2qFF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/UFgACgkQAVBC80lX
0GxVsAf/ZYVWAcXeYUGDOHAeO28Sf2yjhVR2ORN42Cc3+vf+jbnmMzSM21w/jSC3
i00ah/BnLAel8+9vAi+F/TiH+jpJLvHQSPMeAfQ5I3na2S6ocz6U2X05Yjg6FaH3
6a23FL4lh+Chm9cOTw7WR+OqPu1//x3n1xRtZLTNB/tdvbF0UqCZYa2i2ia2IfMQ
nmt6vCmMgL1mRCiDSiDR61D1puW9FD8Poilv82Lta2YpHuiryfurQhF7hREAKIaF
dutvRlioCDCVsHQ1I8RRH28KOgvWfg0gbGHBkfJASbeuAP/rKDGx97/5HGTS98EO
P6hC7Tnd2lnMCnoUNOXg70kypy1Cgw==
=6604
-----END PGP SIGNATURE-----

--Sig_/jD=fq14.FzymV123VlZ2qFF--
