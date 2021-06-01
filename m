Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D07396A49
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 02:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836B6E83C;
	Tue,  1 Jun 2021 00:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CC06E83C;
 Tue,  1 Jun 2021 00:33:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvCmk0ctBz9sSs;
 Tue,  1 Jun 2021 10:32:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622507582;
 bh=uT+f9seNtqv+rBUDfpbtocFbnuU+Usvrb1hEKeN4IkE=;
 h=Date:From:To:Cc:Subject:From;
 b=APtKHPvBdzmra7MUh9f3i1vY8HvFOYLLqJ4+cbRTt0sCMOJnV/MWp8bHi/hDFjNmH
 CDDpr7mIuHJOK5N+3fdY9Ffi7cR2Hn769ml8/+chmVrJAYh7nJ5g+NwYRo7lUPAsjV
 ErzLil1IhleL/WrAYX1S38IAo/fvlSoLfsuqRtptVF6vaSqgIcaNV7CJaUEBKwcoRw
 LZri6y94vxq/rvDOgteQHoh4Pn2rrqQtbKM5M9K/AjDtvQEV7p4JS+cc3BTOOCvF/d
 p8LrXfBXSDGkDaxGkdoOMh4QT/0xilyEeMuuQzSi9jqxYlzvT9ly//ADEu6zB2O9lD
 /FdDIL1bPQ0Fw==
Date: Tue, 1 Jun 2021 10:32:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>, Chris Wilson <chris@chris-wilson.co.uk>
Subject: linux-next: build failure after merge of the i2c tree
Message-ID: <20210601103250.07301254@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ou=NQ8ZD7IfuNCXYZAlReGG";
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ou=NQ8ZD7IfuNCXYZAlReGG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/i915/i915_gem.c:1250:
drivers/gpu/drm/i915/selftests/i915_gem.c:97:13: error: conflicting types f=
or 'pm_suspend'
   97 | static void pm_suspend(struct drm_i915_private *i915)
      |             ^~~~~~~~~~
In file included from include/linux/regulator/consumer.h:35,
                 from include/linux/i2c.h:18,
                 from drivers/gpu/drm/i915/i915_drv.h:39,
                 from drivers/gpu/drm/i915/gt/intel_context.h:14,
                 from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                 from drivers/gpu/drm/i915/i915_gem.c:44:
include/linux/suspend.h:331:12: note: previous declaration of 'pm_suspend' =
was here
  331 | extern int pm_suspend(suspend_state_t state);
      |            ^~~~~~~~~~

Caused by commit

  5a7b95fb993e ("i2c: core: support bus regulator controlling in adapter")

interacting with commit

  3f51b7e1f36a ("drm/i915/selftests: Add a simple exerciser for suspend/hib=
ernate")

from Linus' tree (v4.20-rc1)

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Jun 2021 10:25:49 +1000
Subject: [PATCH] drm/i915/selftests: Avoid name clash with pm_ global funct=
ions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i9=
15/selftests/i915_gem.c
index dc394fb7ccfa..5d674708b047 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -87,14 +87,14 @@ static void simulate_hibernate(struct drm_i915_private =
*i915)
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
=20
-static int pm_prepare(struct drm_i915_private *i915)
+static int test_pm_prepare(struct drm_i915_private *i915)
 {
 	i915_gem_suspend(i915);
=20
 	return 0;
 }
=20
-static void pm_suspend(struct drm_i915_private *i915)
+static void test_pm_suspend(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
=20
@@ -104,7 +104,7 @@ static void pm_suspend(struct drm_i915_private *i915)
 	}
 }
=20
-static void pm_hibernate(struct drm_i915_private *i915)
+static void test_pm_hibernate(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
=20
@@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
 	}
 }
=20
-static void pm_resume(struct drm_i915_private *i915)
+static void test_pm_resume(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
=20
@@ -148,16 +148,16 @@ static int igt_gem_suspend(void *arg)
 	if (err)
 		goto out;
=20
-	err =3D pm_prepare(i915);
+	err =3D test_pm_prepare(i915);
 	if (err)
 		goto out;
=20
-	pm_suspend(i915);
+	test_pm_suspend(i915);
=20
 	/* Here be dragons! Note that with S3RST any S3 may become S4! */
 	simulate_hibernate(i915);
=20
-	pm_resume(i915);
+	test_pm_resume(i915);
=20
 	err =3D switch_to_context(ctx);
 out:
@@ -183,16 +183,16 @@ static int igt_gem_hibernate(void *arg)
 	if (err)
 		goto out;
=20
-	err =3D pm_prepare(i915);
+	err =3D test_pm_prepare(i915);
 	if (err)
 		goto out;
=20
-	pm_hibernate(i915);
+	test_pm_hibernate(i915);
=20
 	/* Here be dragons! */
 	simulate_hibernate(i915);
=20
-	pm_resume(i915);
+	test_pm_resume(i915);
=20
 	err =3D switch_to_context(ctx);
 out:
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Ou=NQ8ZD7IfuNCXYZAlReGG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC1gDIACgkQAVBC80lX
0GzH1gf/UGyYLcozbfcYhQ3Pz+8dBAL61LG9IcPII5mD27h4tAzXw0clnFYW/Esi
jqnG7bkrEyyyhWA/mr/4ESE5qVL9JTaNLjgdRMqsxDaOA6R9Mfqi4grbilKJseWb
q+b4CReChUYCm1JOAw2zwDhX+EV3X4UVSmua4yW1UCDm3UU6pDzJYyx7n1ZoiNRn
q4h2r6+B3zFHsFqnZMMjm+/Vrr3VobcpeeWDqc4S6CN5sPkWuYkvdCFQOJWRzD5x
ThivC1Sse6TDbUgFwQtWLg+NNV0LutWHnatyVcC1k6BCY03tChioJ3phFNMgl2ZB
1+iwOB13j9UmES0ArupFAYpPY3fkjQ==
=+chF
-----END PGP SIGNATURE-----

--Sig_/Ou=NQ8ZD7IfuNCXYZAlReGG--
