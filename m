Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88806DD098
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 05:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EB510E475;
	Tue, 11 Apr 2023 03:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BCE10E475
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:59:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwXCL52fyz4xGq;
 Tue, 11 Apr 2023 13:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681185551;
 bh=PSnq4tRQyq3JySukDjQbFoPm5z5kwIh+DBQ57ICUdtg=;
 h=Date:From:To:Cc:Subject:From;
 b=nPcZq8NBvd4BfeoqNtwk4KK8wEqzBEsJNfxjTcixOIzvivA5EmOP/0ujAdqHuz6cC
 QZAaTd/MHXZ/+c+aOgqylWtvlNvxwl90uY0kpY/3nlA+8Ha2Hs/BuUZ3KkJcdUSJF9
 kGPhnblfzQRyPNCfmR0D7ZDPXsjzn6ou0xoDJF4CjDeZcPCHnt6ZB4TRRHIdnFCTDB
 6QBfE7fsE/S1pfuPLbQiK2h/3dfBE2+BQyh9WIj5rJpKSJ6rdvvf/uA1+pNzo8useX
 zFTJoNnUYIr7nWflpwVOlZ5ncM/D2ZiRCfpXFqO8p21wXXpucieOzZQLl3eFcJ1T0X
 knKwZ8wQ6Q/LQ==
Date: Tue, 11 Apr 2023 13:59:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20230411135909.140d2560@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.NNZGSTud6NfEMVRK7cv_aG";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.NNZGSTud6NfEMVRK7cv_aG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_rc6.c

between commit:

  3735040978a4 ("drm/i915/mtl: Synchronize i915/BIOS on C6 enabling")

from the drm tree and commit:

  f7faedffa92c ("drm/i915/gt: use __xchg instead of internal helper")

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

diff --cc drivers/gpu/drm/i915/gt/intel_rc6.c
index 8f3cd68d14f8,3d6109f1d05c..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@@ -733,11 -710,7 +733,11 @@@ void intel_rc6_fini(struct intel_rc6 *r
 =20
  	intel_rc6_disable(rc6);
 =20
 +	/* We want the BIOS C6 state preserved across loads for MTL */
 +	if (IS_METEORLAKE(rc6_to_i915(rc6)) && rc6->bios_state_captured)
 +		set(uncore, GEN6_RC_STATE, rc6->bios_rc_state);
 +
- 	pctx =3D fetch_and_zero(&rc6->pctx);
+ 	pctx =3D __xchg(&rc6->pctx, 0);
  	if (pctx)
  		i915_gem_object_put(pctx);
 =20

--Sig_/.NNZGSTud6NfEMVRK7cv_aG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ02w0ACgkQAVBC80lX
0Gzz6Af+Kqi6ltNLwjSVgFO/jvvYFbgsdgms1KACMQ+OHv1UUAEfkRCvWVpCs/kr
qYJErWGOYMLEo0aV/ij9wemmh6ANm80tFbk1dFZATl8XAvqnjKYUIDcprBFE5How
ic+rIc5CEhZj4xRcnlLMt68YOp/8NMI4s7kBzqCUv0B15oE2QqtxKvc0bcWXu1IK
norQvy4Zg9EnEQ+YNkLnio6oYUzmRYX6GGgFWuuJdEJLP3or5AiYKXRC1BpNmzHp
jklfoDET9DyfdAq7Sig1+MhMVkQ4gLpTQ6h0VpoUbChtqRq4hL9qoC+gwdkpbSTo
EaTNu8peSj5SOE1pqJM5YZ5VfTDWig==
=Agzv
-----END PGP SIGNATURE-----

--Sig_/.NNZGSTud6NfEMVRK7cv_aG--
