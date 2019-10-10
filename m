Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFEDD1E58
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 04:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4577E89DBA;
	Thu, 10 Oct 2019 02:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC3C89DBA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 02:14:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46pZRF0SZzz9sCJ;
 Thu, 10 Oct 2019 13:14:49 +1100 (AEDT)
Date: Thu, 10 Oct 2019 13:14:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20191010131448.482da2b2@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570673689;
 bh=US5I/EC1xPBjcQV9p/7vh2IOLopNQKaX8IfXhKo0P3A=;
 h=Date:From:To:Cc:Subject:From;
 b=JYqoesr60pub86cCjT+cgHuw7g24ZA8AxQ52D09Dto/OtUaukQ3MeAJYP1aR1/KIu
 X4g0Bg5Gsxv6i9d1Aql2vHpW5OR52l3jvh8QAYxre5voqiIFbK86TcxJEFBKHrpFlF
 eZ4vEZ3qhBgMohrR3+pEa9iIoOEHStDVtZxHVNlgsF+cBOnUKsqQ4Od4PyN5g+tXeV
 FmJE0S0Jtz2jin/6KcQE1SSFMfdvIrkmllkH//VSCQNEHraM++Np8frKh0++tJ1VmK
 DcPLzBFs0j2CBNurPZUYMrWowJYtRYHDvmp2e8AHrY/Qtr1aHS8e85HkOIHF6jU+kU
 ncM4jn8GBUNwg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1544103332=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1544103332==
Content-Type: multipart/signed; boundary="Sig_/tve78WH0Gamrq1gOajK=ZLX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tve78WH0Gamrq1gOajK=ZLX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/gt/intel_gt_pm.c: In function 'intel_gt_resume':
drivers/gpu/drm/i915/gt/intel_gt_pm.c:183:54: error: macro "mutex_release" =
passed 3 arguments, but takes just 2
  183 |    mutex_release(&ce->pin_mutex.dep_map, 0, _THIS_IP_);
      |                                                      ^
In file included from include/linux/spinlock_types.h:18,
                 from include/linux/spinlock.h:83,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from include/linux/io-mapping.h:10,
                 from drivers/gpu/drm/i915/i915_drv.h:36,
                 from drivers/gpu/drm/i915/gt/intel_gt_pm.c:7:
include/linux/lockdep.h:605: note: macro "mutex_release" defined here
  605 | #define mutex_release(l, i)   lock_release(l, i)
      |=20
drivers/gpu/drm/i915/gt/intel_lrc.c: In function '__context_pin_release':
drivers/gpu/drm/i915/gt/intel_lrc.c:245:51: error: macro "mutex_release" pa=
ssed 3 arguments, but takes just 2
  245 |  mutex_release(&ce->pin_mutex.dep_map, 0, _RET_IP_);
      |                                                   ^
In file included from include/linux/hardirq.h:6,
                 from include/linux/interrupt.h:11,
                 from drivers/gpu/drm/i915/gt/intel_lrc.c:134:
include/linux/lockdep.h:605: note: macro "mutex_release" defined here
  605 | #define mutex_release(l, i)   lock_release(l, i)
      |=20

Caused by commit

  5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_=
release()")

interacting with commits

  dffa8feb3084 ("drm/i915/perf: Assert locking for i915_init_oa_perf_state(=
)")
  fcde8c7eea60 ("drm/i915/selftests: Exercise potential false lite-restore")
  b1e3177bd1d8 ("drm/i915: Coordinate i915_active with its own mutex")

from the drm tree.

I added the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 10 Oct 2019 13:08:43 +1100
Subject: [PATCH] drm/i915: update for mutex_release API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c   | 2 +-
 drivers/gpu/drm/i915/i915_active.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/g=
t/intel_gt_pm.c
index b52e2ba3d092..d195e05a701f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -180,7 +180,7 @@ int intel_gt_resume(struct intel_gt *gt)
 			GEM_BUG_ON(!intel_context_is_pinned(ce));
 			mutex_acquire(&ce->pin_mutex.dep_map, 0, 0, _THIS_IP_);
 			ce->ops->reset(ce);
-			mutex_release(&ce->pin_mutex.dep_map, 0, _THIS_IP_);
+			mutex_release(&ce->pin_mutex.dep_map, _THIS_IP_);
 		}
=20
 		engine->serial++; /* kernel context lost */
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/=
intel_lrc.c
index a2155d6bcdd2..aa61b0101bf8 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -242,7 +242,7 @@ static void __context_pin_acquire(struct intel_context =
*ce)
=20
 static void __context_pin_release(struct intel_context *ce)
 {
-	mutex_release(&ce->pin_mutex.dep_map, 0, _RET_IP_);
+	mutex_release(&ce->pin_mutex.dep_map, _RET_IP_);
 }
=20
 static void mark_eio(struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915=
_active.c
index aa37c07004b9..a47387174434 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -385,7 +385,7 @@ void i915_active_set_exclusive(struct i915_active *ref,=
 struct dma_fence *f)
 	mutex_acquire(&ref->mutex.dep_map, 0, 0, _THIS_IP_);
 	if (!__i915_active_fence_set(&ref->excl, f))
 		atomic_inc(&ref->count);
-	mutex_release(&ref->mutex.dep_map, 0, _THIS_IP_);
+	mutex_release(&ref->mutex.dep_map, _THIS_IP_);
 }
=20
 bool i915_active_acquire_if_busy(struct i915_active *ref)
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/tve78WH0Gamrq1gOajK=ZLX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2elBgACgkQAVBC80lX
0Gw2egf/Y4FgkdtrPAbnehtM6s8zKblYjS1EPTxKNIG06WFjRhtl1bJJBJ+/2ush
fXn3h+p06DWXyvvQmohuHtuwljf13Ratu9ao118WXWwIObmkTTSo4Uh+W3QZOXCb
kr/UB+6oZE7n5UtzHg4zi1KtKPL5e1XpHd7xfpF4UoWkllnf3IDCsdz81JZqINlj
uKspqQ4YfZpfRO86a9JDS0thNztxiv+T9AZc9P/32mujz/I7NCCI219j+7S2qYv/
HfNdWh9+DqNirqPjpFLza7VzonkwDiIxuyCBq2WUpgxPQtgcxQayOXU3Sw1y/wEB
4XLB1K8QlUdvDB8OjLqtqTRIur9N3w==
=FtTq
-----END PGP SIGNATURE-----

--Sig_/tve78WH0Gamrq1gOajK=ZLX--

--===============1544103332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1544103332==--
