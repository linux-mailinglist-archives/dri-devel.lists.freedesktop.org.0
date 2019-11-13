Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A3F9F96
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 01:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815976EC29;
	Wed, 13 Nov 2019 00:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17176EC29
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 00:50:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CQyd69NLz9sPh;
 Wed, 13 Nov 2019 11:50:49 +1100 (AEDT)
Date: Wed, 13 Nov 2019 11:50:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113115049.2d30b88c@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1573606250;
 bh=y2HIDRUkrrIBeYigQEgKBF8prcyYDSmPm3oxZWimhMQ=;
 h=Date:From:To:Cc:Subject:From;
 b=i1oPPqm4j9T7JQDA4WK7kCy+Ocfj14lfeA7k5C669xsEz32G8v74JeNvXrd4fuc2H
 5TwTLKwyHGsRRLVNO8q/pZWwdNFG+uligsMOFZl2mcROEVhME1gA8WD/r+H8UV7k2F
 yG/k3em8XRX5QvT1DynPpHaLDQ6njjVYnJGX/raz3e1H4U/ebdaurazBtxlfDDhHjv
 6EJZ1h6452J6yh14eh4cCR5XuI+dPJXefpKxAo8syUGp2hDC7j24Bj+trfw1LopOUj
 ujnZNFQTu9P6kwp8oDgyLkU5z67dVVhhd0WI5WEi7AlUNz+KFkh/ces7gYwBKLB7jZ
 EK881bIuBebbw==
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, Andi Shyti <andi@etezian.org>
Content-Type: multipart/mixed; boundary="===============1229948932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1229948932==
Content-Type: multipart/signed; boundary="Sig_/fhU9Km009fVWjlMp34IeRum";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fhU9Km009fVWjlMp34IeRum
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_gt_pm.c

between commit:

  7e34f4e4aad3 ("drm/i915/gen8+: Add RC6 CTX corruption WA")

from Linus' tree and commit:

  3e7abf814193 ("drm/i915: Extract GT render power state management")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gt/intel_gt_pm.c
index fac75afed35b,060a27d9af34..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@@ -38,20 -61,10 +61,13 @@@ static int __gt_unpark(struct intel_wak
  	gt->awake =3D intel_display_power_get(i915, POWER_DOMAIN_GT_IRQ);
  	GEM_BUG_ON(!gt->awake);
 =20
 +	if (NEEDS_RC6_CTX_CORRUPTION_WA(i915))
 +		intel_uncore_forcewake_get(&i915->uncore, FORCEWAKE_ALL);
 +
- 	intel_enable_gt_powersave(i915);
-=20
- 	i915_update_gfx_val(i915);
- 	if (INTEL_GEN(i915) >=3D 6)
- 		gen6_rps_busy(i915);
-=20
+ 	intel_rps_unpark(&gt->rps);
  	i915_pmu_gt_unparked(i915);
 =20
- 	intel_gt_queue_hangcheck(gt);
-=20
- 	pm_notify(i915, INTEL_GT_UNPARK);
+ 	intel_gt_unpark_requests(gt);
 =20
  	return 0;
  }
@@@ -64,17 -77,12 +80,17 @@@ static int __gt_park(struct intel_waker
 =20
  	GEM_TRACE("\n");
 =20
- 	pm_notify(i915, INTEL_GT_PARK);
+ 	intel_gt_park_requests(gt);
 =20
+ 	i915_vma_parked(gt);
  	i915_pmu_gt_parked(i915);
- 	if (INTEL_GEN(i915) >=3D 6)
- 		gen6_rps_idle(i915);
+ 	intel_rps_park(&gt->rps);
 =20
 +	if (NEEDS_RC6_CTX_CORRUPTION_WA(i915)) {
 +		i915_rc6_ctx_wa_check(i915);
 +		intel_uncore_forcewake_put(&i915->uncore, FORCEWAKE_ALL);
 +	}
 +
  	/* Everything switched off, flush any residual interrupt just in case */
  	intel_synchronize_irq(i915);
 =20

--Sig_/fhU9Km009fVWjlMp34IeRum
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LU2kACgkQAVBC80lX
0Gy6twf+PunW6hUvgwu55PeWS0uopLjp0iX14SVwP3Ia/i5RVgeXyeB2HGzFGVyp
jTFePWNcH26MsNm7RLWCtbisuqqYaiugEVAAX1chrv3KonvbaUlbUnrDnDSe0ZOb
qfL/s4XzpV5db042rQXwsQFHLIANKLoxC6ybmZ09n0B6JwfmTj0Xim5NX5rsCKAn
AwtpBc/p2mX4daBkmKLh/+qp8cUsTgSPBVJHSw+ee0AnEt/so0S4T2LHrzDq3qFS
dGR4weleYo5ddnrap6EHpPddxZAaUbm1ILhrgE5LKm4hUgXEZ5LU1Jxxb4pRUePm
IVCAPN00QAa4ftOzDmJ09bLer/iErg==
=hNS8
-----END PGP SIGNATURE-----

--Sig_/fhU9Km009fVWjlMp34IeRum--

--===============1229948932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1229948932==--
