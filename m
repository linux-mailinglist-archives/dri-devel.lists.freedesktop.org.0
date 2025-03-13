Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47AA5EA16
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 04:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC5F10E0BE;
	Thu, 13 Mar 2025 03:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OxjSIy1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3D410E0BE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 03:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741835575;
 bh=umnF84Dfi3Nfa6Na8lFbRSU0J6LQFik/70/YubuMr4o=;
 h=Date:From:To:Cc:Subject:From;
 b=OxjSIy1MmXeePd5sIIGR9eQJJUTQlK/MMC5GIO6h0rJhjI70fgqpdTyrsd49sPv2T
 CP0Y0D8uyHSh9gmldX3iJ/ZLYZ83WogH2T9YW66rLHntyCFtt7lOZ/v8otlgI0ADBj
 4UgDJC/Rj9qGvofmzdffJNFJ91CsTf9veDNH21dr9eIp0jDOJ/qtM3uvBsj5dtyjzW
 smV3RruxnjLUh/IwCE3MljFWhqn4DMc1gCnx9pi4ivYr8FwWIpRoMPGM8L3LNWrl6c
 SsFl4xfSWJ2LHMlxdHgQ0jZW2aUnB/C1SZjiu/3JJOtCTX+T30bhe6vqDLsm8Ul0gK
 gVZt2aCTGj7fA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCsxy6lWZz4wgp;
 Thu, 13 Mar 2025 14:12:54 +1100 (AEDT)
Date: Thu, 13 Mar 2025 14:12:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Nam Cao <namcao@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20250313141253.0c5a7520@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pZeEYs9fPa13vl4Du59hHnf";
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

--Sig_/pZeEYs9fPa13vl4Du59hHnf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/i915_pmu.c

between commit:

  87b593d79864 ("drm/i915/pmu: Drop custom hotplug code")

from the drm tree and commit:

  82ad584eed8b ("drm/i915/pmu: Switch to use hrtimer_setup()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pmu.c
index 69a109d02116,0ce87f188d11..000000000000
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@@ -1155,8 -1264,8 +1155,7 @@@ void i915_pmu_register(struct drm_i915_
  	int ret =3D -ENOMEM;
 =20
  	spin_lock_init(&pmu->lock);
- 	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
- 	pmu->timer.function =3D i915_sample;
+ 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
 -	pmu->cpuhp.cpu =3D -1;
  	init_rc6(pmu);
 =20
  	if (IS_DGFX(i915)) {

--Sig_/pZeEYs9fPa13vl4Du59hHnf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfSTTUACgkQAVBC80lX
0GwYpQf/SKAOOH/Oph01KSqzkDqHAGb9+XkiZ+ZoEEa+RaxaUjuAfbE3V5i7e+2k
h89+AoELiv+kwMCrx6wAMqVCyikB1578QZah4eN1BR9mZZQ7oLpywlNQ6duTH7Ad
EdeP4E5Se/GBbgTVcDR6bfhpc94wlLtmWe2JTq03eAJpg/X7siYFyoLP9icK+xh6
Son0p1Q7lSdZMFfqqRl0YW25QFfejrCFOM1TaBhEPQvuKEmUOV89wO4tCck9o6ai
NQaXs6KeJYk+uUnvpk8Mbm+q98lPLR3PsXfG5uBL8aNEyS7mbQhZd/I3qub0CnYr
+M6+juEg9pFXSPs5QH2T+uGeDPBMoQ==
=WiEi
-----END PGP SIGNATURE-----

--Sig_/pZeEYs9fPa13vl4Du59hHnf--
