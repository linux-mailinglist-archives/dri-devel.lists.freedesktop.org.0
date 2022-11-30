Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BFE63E3CD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 23:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BEB10E4F3;
	Wed, 30 Nov 2022 22:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B38D10E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 22:57:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMvjD3ktTz4xGM;
 Thu,  1 Dec 2022 09:57:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1669849025;
 bh=lH3ZdNsbzBDqZQvPGPjYU5CgMs8PuJgaZZ7rFv3jwkY=;
 h=Date:From:To:Cc:Subject:From;
 b=dPhWv0FYg+1/xZLFLgSXaQDwgo7cEg9x/dRCSwEVx7gVbMk2Cpwx36VExiqtLvz+N
 l6Ncul0o4h0Ekk9S0/Qnne+YlEy4b+sG+chOKvsJ8y95cRg6RFfBLhnD2u7cE00vFC
 KChZxC+sbFwRBwAsm9bYhUBxRBwI7W58jkthMUz7tTwkGGrByD1VCOlrxKztTxsD6G
 QvcNU+qKTizVa8Xbk5h8RWRaUbdiCX7SI1WbW0QYCry00F2CrMXfU5h9KNJxVOF0Pb
 WfFfdf+i7i26kw+67Ru2ZjPeny7h43IVV0czp82qnDqnO8Vp/JPyaoJ+kHdVGCogX7
 HWAIwX2rsrfjg==
Date: Thu, 1 Dec 2022 09:57:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20221201095700.7325e73a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oxECwUXRyVqokrbyUg1Ffx.";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/oxECwUXRyVqokrbyUg1Ffx.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_gt.c

between commit:

  04aa64375f48 ("drm/i915: fix TLB invalidation for Gen12 video and compute=
 engines")

from Linus' tree and commit:

  46c507f03a46 ("drm/i915/gt: Always use MCR functions on multicast registe=
rs")

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

diff --cc drivers/gpu/drm/i915/gt/intel_gt.c
index 7caa3412a244,0325f071046c..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@@ -1018,16 -1103,17 +1108,22 @@@ static void mmio_invalidate_full(struc
  		if (!intel_engine_pm_is_awake(engine))
  			continue;
 =20
- 		rb =3D get_reg_and_bit(engine, regs =3D=3D gen8_regs, regs, num);
- 		if (!i915_mmio_reg_offset(rb.reg))
- 			continue;
-=20
- 		if (GRAPHICS_VER(i915) =3D=3D 12 && (engine->class =3D=3D VIDEO_DECODE_=
CLASS ||
- 		    engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS ||
- 		    engine->class =3D=3D COMPUTE_CLASS))
- 			rb.bit =3D _MASKED_BIT_ENABLE(rb.bit);
-=20
- 		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
+ 		if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50)) {
+ 			intel_gt_mcr_multicast_write_fw(gt,
+ 							xehp_regs[engine->class],
+ 							BIT(engine->instance));
+ 		} else {
+ 			rb =3D get_reg_and_bit(engine, regs =3D=3D gen8_regs, regs, num);
+ 			if (!i915_mmio_reg_offset(rb.reg))
+ 				continue;
+=20
++			if (GRAPHICS_VER(i915) =3D=3D 12 && (engine->class =3D=3D VIDEO_DECODE=
_CLASS ||
++			    engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS ||
++			    engine->class =3D=3D COMPUTE_CLASS))
++				rb.bit =3D _MASKED_BIT_ENABLE(rb.bit);
++
+ 			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
+ 		}
  		awake |=3D engine->mask;
  	}
 =20

--Sig_/oxECwUXRyVqokrbyUg1Ffx.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOH37wACgkQAVBC80lX
0GzfMwf/Qepx3h9aOZxYgOEt7rWD7j5qK0RXF6BWoM3cH7eFzzP5/+fFuLrXB2ma
ZVZVrSZYw3hUps2CuxGuPGGvlfl+p+PWT3r8RQYOeYeh1a9r2eFPIghL8k9PALz8
Qw0StT3jlOwiq4YiUNgKQL54SCG2AxLKZTRuzZ7rig1RWFASuOk6gCdMJZlcygjf
pA7WdCwXtJl+7dw9Qx5rJtdYXktuEiFeFz7Ne+Jw1bFjocKFOirlUsBuDfmOOcfn
bK2L1o8zU7WfJAKUXyfkVvgJniEkb1E0cV7O5ZmMdowXPV1b2AnD7mRZZVoDgqHO
L8tmtAccPuBye0y+9nrd8WUdcJG/ww==
=+Eex
-----END PGP SIGNATURE-----

--Sig_/oxECwUXRyVqokrbyUg1Ffx.--
