Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD61D1E16
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 03:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25F16E97B;
	Thu, 10 Oct 2019 01:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAD86E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 01:51:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46pYvw4h3xz9sDQ;
 Thu, 10 Oct 2019 12:51:07 +1100 (AEDT)
Date: Thu, 10 Oct 2019 12:51:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20191010125106.4627d1b5@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570672270;
 bh=zX+1heiX5+wURfoQzJjphbOrjKq5PIeg3JiROszV/WI=;
 h=Date:From:To:Cc:Subject:From;
 b=MiJmo8xL4YfK56PWgibSj+FYZEe7mjB6TrscvBqBcrGq+Qzwicdld4IWgBmvuea7R
 x/RjIKfwIIgSU3gEac1dq0FFkaorXOmbetVQSjBmnuDHhHvwfsIpa09ce8JMTI/RjD
 9P/xBkZ4n+u2xuo2DeqyZb1V1aFlhp3/HgIHzvleULRdqMz5SifqCHewZ3c1QfB0I8
 Bn2/U6lEzThnX73kJS+TDsp6ZgHhUKwtceArlsBSlM6kRYcrybjr+0REr1uTtAj3/L
 pID7VI3pMSY6WVQ+czgWaSmWqOGs3kN2liUj2BaUkLlD6aL/1osE38CFXrHk2o76GX
 T2X/Q0ObVzHkg==
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
Content-Type: multipart/mixed; boundary="===============1358765209=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1358765209==
Content-Type: multipart/signed; boundary="Sig_/4i+.YcjNlq6PDs=9i46LRA=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4i+.YcjNlq6PDs=9i46LRA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c

between commit:

  2850748ef876 ("drm/i915: Pull i915_vma_pin under the vm->mutex")

from the drm tree and commit:

  5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_=
release()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging. You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index fd3ce6da8497,1a51b3598d63..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@@ -436,9 -497,22 +436,9 @@@ void i915_gem_shrinker_taints_mutex(str
 =20
  	fs_reclaim_acquire(GFP_KERNEL);
 =20
 -	/*
 -	 * As we invariably rely on the struct_mutex within the shrinker,
 -	 * but have a complicated recursion dance, taint all the mutexes used
 -	 * within the shrinker with the struct_mutex. For completeness, we
 -	 * taint with all subclass of struct_mutex, even though we should
 -	 * only need tainting by I915_MM_NORMAL to catch possible ABBA
 -	 * deadlocks from using struct_mutex inside @mutex.
 -	 */
 -	mutex_acquire(&i915->drm.struct_mutex.dep_map,
 -		      I915_MM_SHRINKER, 0, _RET_IP_);
 -
  	mutex_acquire(&mutex->dep_map, 0, 0, _RET_IP_);
- 	mutex_release(&mutex->dep_map, 0, _RET_IP_);
+ 	mutex_release(&mutex->dep_map, _RET_IP_);
 =20
 -	mutex_release(&i915->drm.struct_mutex.dep_map, _RET_IP_);
 -
  	fs_reclaim_release(GFP_KERNEL);
 =20
  	if (unlock)

--Sig_/4i+.YcjNlq6PDs=9i46LRA=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ejooACgkQAVBC80lX
0GwaXggAnnxyO+HFQGahgej37ABRMyZ4xijjtQwdYC7VEXWCn4X7/5+a27aXQuQe
EtQb5An4ch2BgShLPEJvEK/6DtUENZaTfjR5Ag7ItL82e+X/+tkEUhZJM91BLIge
Yma5nF/tgD/0B6mXa4Oxr+6VUzNW9SfnfWpgCcG/Sap25MtLEBSiMFkB47eJqmWy
RkFmsdN5onSr4sjGoyTW1Qhb+td8GGSrCBzOpF5ze2Y5zsGlgrgTWgXhPgSp3orZ
WXXTfKr0+CqfvWywm0OyBSOkW+jqxIRES/RlRnl89A25b2oLDjc9mbdP0Fhl0HDM
CTt+X6gt8/ACsRgq2CyoqaR14qw+Lg==
=IrTm
-----END PGP SIGNATURE-----

--Sig_/4i+.YcjNlq6PDs=9i46LRA=--

--===============1358765209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1358765209==--
