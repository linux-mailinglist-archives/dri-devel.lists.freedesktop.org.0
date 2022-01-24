Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D602499D39
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CDF10E1FD;
	Mon, 24 Jan 2022 22:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0D10E1FD;
 Mon, 24 Jan 2022 22:33:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JjPsL1zWVz4y82;
 Tue, 25 Jan 2022 09:33:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1643063623;
 bh=Q7cV3zIVrbk4eZ0vx98E9oUuVG4Uaj8FKYUwZqQb2BU=;
 h=Date:From:To:Cc:Subject:From;
 b=tSstAJsmJEYLMABaBazIkF0XpBRW/SOMc3kdt6nXnj1hiPz7i2TIEQYfFawA6AqLs
 E4BTAf09G9wMUUQT7iFFAzJlyl93SJ0er4Ks7lKmeWg8Uq9EW3RjnnZySVqO9nllaC
 2s+opzEvyUCdMiZkIC3W8kMJRW9+8TpSJ3mP78M5WgIdiLGHi4Tkc0tvTWVEJoSR2C
 7C8kMDxFkKuhdh5ZG6fhaftYfGtDzst3My3BQlob8Nqk3F7VKppbVyq9FGDpbEAjuL
 O7KDgZkAwVEbNcyEUdmTca4BJBS76plaByzsvZTgVCv+iVIawleELHxs+oz4V0RAmA
 2duOdsAp+nW6Q==
Date: Tue, 25 Jan 2022 09:33:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20220125093341.15244634@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ZL55ve7xa9iF44s=AjpDmu";
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2ZL55ve7xa9iF44s=AjpDmu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  77cdd054dd2c ("drm/i915/pmu: Connect engine busyness stats from GuC to pm=
u")

from Linus' tree and commit:

  202b1f4c1234 ("drm/i915/gt: Move engine registers to their own header")

from the drm-intel tree.

I fixed it up (see below - maybe should be done better?) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_reg.h
index 971d601fe751,cf168c3e0471..000000000000
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@@ -2661,52 -1825,7 +1843,9 @@@
  #define   AUX_INV		REG_BIT(0)
  #define BLT_HWS_PGA_GEN7	_MMIO(0x04280)
  #define VEBOX_HWS_PGA_GEN7	_MMIO(0x04380)
- #define RING_ACTHD(base)	_MMIO((base) + 0x74)
- #define RING_ACTHD_UDW(base)	_MMIO((base) + 0x5c)
- #define RING_NOPID(base)	_MMIO((base) + 0x94)
- #define RING_IMR(base)		_MMIO((base) + 0xa8)
- #define RING_HWSTAM(base)	_MMIO((base) + 0x98)
- #define RING_TIMESTAMP(base)		_MMIO((base) + 0x358)
- #define RING_TIMESTAMP_UDW(base)	_MMIO((base) + 0x358 + 4)
- #define   TAIL_ADDR		0x001FFFF8
- #define   HEAD_WRAP_COUNT	0xFFE00000
- #define   HEAD_WRAP_ONE		0x00200000
- #define   HEAD_ADDR		0x001FFFFC
- #define   RING_NR_PAGES		0x001FF000
- #define   RING_REPORT_MASK	0x00000006
- #define   RING_REPORT_64K	0x00000002
- #define   RING_REPORT_128K	0x00000004
- #define   RING_NO_REPORT	0x00000000
- #define   RING_VALID_MASK	0x00000001
- #define   RING_VALID		0x00000001
- #define   RING_INVALID		0x00000000
- #define   RING_WAIT_I8XX	(1 << 0) /* gen2, PRBx_HEAD */
- #define   RING_WAIT		(1 << 11) /* gen3+, PRBx_CTL */
- #define   RING_WAIT_SEMAPHORE	(1 << 10) /* gen6+ */
 =20
 +#define GUCPMTIMESTAMP          _MMIO(0xC3E8)
 +
- /* There are 16 64-bit CS General Purpose Registers per-engine on Gen8+ */
- #define GEN8_RING_CS_GPR(base, n)	_MMIO((base) + 0x600 + (n) * 8)
- #define GEN8_RING_CS_GPR_UDW(base, n)	_MMIO((base) + 0x600 + (n) * 8 + 4)
-=20
- #define RING_FORCE_TO_NONPRIV(base, i) _MMIO(((base) + 0x4D0) + (i) * 4)
- #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
- #define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)    /* CFL+ & Gen11+ */
- #define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
- #define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
- #define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
- #define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
- #define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)     /* CFL+ & Gen11+ */
- #define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
- #define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
- #define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
- #define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
- #define   RING_FORCE_TO_NONPRIV_MASK_VALID	\
- 					(RING_FORCE_TO_NONPRIV_RANGE_MASK \
- 					| RING_FORCE_TO_NONPRIV_ACCESS_MASK)
- #define   RING_MAX_NONPRIV_SLOTS  12
-=20
  #define GEN7_TLB_RD_ADDR	_MMIO(0x4700)
 =20
  #define GEN9_GAMT_ECO_REG_RW_IA _MMIO(0x4ab0)
@@@ -2778,27 -1885,7 +1905,10 @@@
  #define GEN2_INSTDONE	_MMIO(0x2090)
  #define NOPID		_MMIO(0x2094)
  #define HWSTAM		_MMIO(0x2098)
- #define DMA_FADD_I8XX(base)	_MMIO((base) + 0xd0)
- #define RING_BBSTATE(base)	_MMIO((base) + 0x110)
- #define   RING_BB_PPGTT		(1 << 5)
- #define RING_SBBADDR(base)	_MMIO((base) + 0x114) /* hsw+ */
- #define RING_SBBSTATE(base)	_MMIO((base) + 0x118) /* hsw+ */
- #define RING_SBBADDR_UDW(base)	_MMIO((base) + 0x11c) /* gen8+ */
- #define RING_BBADDR(base)	_MMIO((base) + 0x140)
- #define RING_BBADDR_UDW(base)	_MMIO((base) + 0x168) /* gen8+ */
- #define RING_BB_PER_CTX_PTR(base)	_MMIO((base) + 0x1c0) /* gen8+ */
- #define RING_INDIRECT_CTX(base)		_MMIO((base) + 0x1c4) /* gen8+ */
- #define RING_INDIRECT_CTX_OFFSET(base)	_MMIO((base) + 0x1c8) /* gen8+ */
- #define RING_CTX_TIMESTAMP(base)	_MMIO((base) + 0x3a8) /* gen8+ */
-=20
- #define VDBOX_CGCTL3F10(base)		_MMIO((base) + 0x3f10)
- #define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
 =20
 +#define VDBOX_CGCTL3F18(base)		_MMIO((base) + 0x3f18)
 +#define   ALNUNIT_CLKGATE_DIS		REG_BIT(13)
 +
  #define ERROR_GEN6	_MMIO(0x40a0)
  #define GEN7_ERR_INT	_MMIO(0x44040)
  #define   ERR_INT_POISON		(1 << 31)

--Sig_/2ZL55ve7xa9iF44s=AjpDmu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHvKUUACgkQAVBC80lX
0Gwxewf+OMrUFaGLuYGYg5EgrZvYs6OAjlxGfiU6hn4qQimxLo0Idz+12DpIMtt1
NA/MxjY9MzpHj756KK+jGSzsS1HmUYXQvCw1uPBY/6XesaRpFio/iujoRLtJKo0c
KVK90J2IUv/Tj2XJg7KDWybDFBTTa7tyGWwIF6G10/i7vCplaswXERggRIdF+ACT
Ty3meYA8lKIAoGv8AP3ryEvKLFSsiTyF4+GSZQ/AZVPsh9vOy7gqhSUbRTyRHrwa
jK0Ucu/l5fHt7bbAVWePaHs1mkBA9PW6Kk7Eg7nN3i4C5PsSo/UyqbjOjnNXMY5Y
GpnYoinv6581dqwm8dzdxazwN6TQYg==
=WVH5
-----END PGP SIGNATURE-----

--Sig_/2ZL55ve7xa9iF44s=AjpDmu--
