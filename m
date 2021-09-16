Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1DF40ECA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D76E8E5;
	Thu, 16 Sep 2021 21:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1886E8E5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
 bh=LSg5nqY71lwKzR27KlZInkjrvBbvnlFaDI0LBxG80tc=; 
 b=dxfF5RzfTBGVUZouE3FOQ9VAc1jEhMljgjHb3IHgsoaziHaXzrnCNEh1lDRLXLpZEaGcHdLFn1nUqYsfptd0aYATZg2EzypJLi0ado0ufNaooMgxVGCNySXpl+u5wlfO5YEqUQ4mFWUggl3tjH23ZiRdnL6TvlZNBh/0rEEWjPKF4lDN4QESp6bEJSHDZIzsSF9Xxq8NQBLgYayMwPsVYJNiTdbRUvkUFB6rhYtUrNWmPTT1PFYTFLkvwSSodoTXXfg7VJoG3OEOjO/5AbSNSO9Z9MJP4FpRJqw9acMlfD0GTLz5uoiqDGrGMwOKGhQGex0l5VTmEp2FVyuJY4powg==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQyuy-0007og-Te; Thu, 16 Sep 2021 23:27:41 +0200
Date: Thu, 16 Sep 2021 22:27:26 +0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Iago Toral <itoral@igalia.com>
Subject: [PATCH] drm/v3d: fix sched job resources cleanup when a job is aborted
Message-ID: <20210916212726.2u2psq2egwy2mdva@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ih32c5ijzknmu2ad"
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


--ih32c5ijzknmu2ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In a cl submission, when bin job initialization fails, sched job resources
were already allocated for the render job. At this point,
drm_sched_job_init(render) was done in v3d_job_init but the render job is
aborted before drm_sched_job_arm (in v3d_job_push) happens; therefore, not
only v3d_job_put but also drm_sched_job_cleanup should be called (by
v3d_job_cleanup). A similar issue is addressed for csd and tfu submissions.

The issue was noticed from a review by Iago Toral in a patch that touches
the same part of the code.

Fixes: 916044fac8623 ("drm/v3d: Move drm_sched_job_init to v3d_job_init")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 1953706bdaeb..ead0be8d48a7 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -567,14 +567,14 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
 	if (args->bcl_start !=3D args->bcl_end) {
 		bin =3D kcalloc(1, sizeof(*bin), GFP_KERNEL);
 		if (!bin) {
-			v3d_job_put(&render->base);
+			v3d_job_cleanup(&render->base);
 			return -ENOMEM;
 		}
=20
 		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
 				   v3d_job_free, args->in_sync_bcl, V3D_BIN);
 		if (ret) {
-			v3d_job_put(&render->base);
+			v3d_job_cleanup(&render->base);
 			kfree(bin);
 			return ret;
 		}
@@ -716,7 +716,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 	job->base.bo =3D kcalloc(ARRAY_SIZE(args->bo_handles),
 			       sizeof(*job->base.bo), GFP_KERNEL);
 	if (!job->base.bo) {
-		v3d_job_put(&job->base);
+		v3d_job_cleanup(&job->base);
 		return -ENOMEM;
 	}
=20
@@ -810,14 +810,13 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *da=
ta,
=20
 	clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
 	if (!clean_job) {
-		v3d_job_put(&job->base);
-		kfree(job);
+		v3d_job_cleanup(&job->base);
 		return -ENOMEM;
 	}
=20
 	ret =3D v3d_job_init(v3d, file_priv, clean_job, v3d_job_free, 0, V3D_CACH=
E_CLEAN);
 	if (ret) {
-		v3d_job_put(&job->base);
+		v3d_job_cleanup(&job->base);
 		kfree(clean_job);
 		return ret;
 	}
--=20
2.30.2


--ih32c5ijzknmu2ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFDtrkACgkQwqF3j0dL
ehw0gg/4/ur/Qr3orkVDu++/mCechkhQaHvLAXSaMZOYTXDbJTE2tzYQNdbg6PeD
0S6i6m7A0TlZUGiATgA+rjvxcgdvsxrhhuIVXxaV/DW5BwVW4k/aaAtbiPmZ1oe0
XgbPOXRSxVo4L5SK73KeZiNnahuj4lftWeZ0V0HSxoHGAiQIdTJhOgbKVcq1OM6r
RcwUKbblFGdoF5iG7i9/177H2a8+QZVhEVtfY3Gc+mf974GqlP1ATD9YWAoB8RqV
EOHb08L2FfLrUkc4vck8L17Y9dAe9IiyWrr0VsK2z4euNqn6L76ikBmk9cjec8J3
VnUKpz3XgoF1X0hQ2cfWE/5LJ5HToIqqiCQyLHUtjZAOAeYKwq++1UF3SUMwIpWN
064iJw0y5L32o+sJdXDTZNbo5e32L4M/2l9YwH553l728Y9M+MCjf+yzXWfRoej6
g73lgssErdLmn/pVb0CfRAvErMQGs9F0zobho+RLnUgpAqSEjPLP46LlPvMP2Yzi
Wb4INPGEqXtGt2GTSEFq2mgC3A6HvIfotOFFTl6lwYfVmC7ovkRxxk6xDp9NYNGT
hY6oSGaCdXNm3liEtsH+xGk6wyW6L1bhqMVdBH8VK8694nI6l9gXnXcbY1UDhVL6
N/f4/zgNAiGE0Scuj++gqMBCahS8PV3sXnd6Qc7WZetxiPvArg==
=mYng
-----END PGP SIGNATURE-----

--ih32c5ijzknmu2ad--
