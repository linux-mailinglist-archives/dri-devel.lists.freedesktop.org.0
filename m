Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBE4F2084
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 02:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDB810E184;
	Tue,  5 Apr 2022 00:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1695310E184;
 Tue,  5 Apr 2022 00:53:27 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KXTf92gnvz4xXK;
 Tue,  5 Apr 2022 10:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649120003;
 bh=yWJj/XDly7PKBcBsIePwdijaqceEq7HoP2lgWDGUzjE=;
 h=Date:From:To:Cc:Subject:From;
 b=oZySHRRqJoqMe0goHMP66Ql+m2+0q3c8gww/7QVi+MZFoTWHqTeBgi9TpY2eRnnm6
 wp2Zn47wayZsgwnh6hqJQb7jtrfKpnEMLgANRZ1CAJlvXDF1qla1k5jjpcgM0UFMqm
 98/q8uvVAQcYMUjDwVgXpMV8uihbFemo3f3JS11wrre2Pf6dwZa5gnQoMLbzgiKmbT
 D4oybWFSxPZukv+gOxkpYc8BhDyeaCJOURTFjOL/dOMY6uD5Js/r/xKA7fKXJOh2VM
 YpqyAqNFeCda1qywMI2OHQIQSw2DY69ls+hPgCRQ01fy9p+2VzVA3uHBXMSCnxEmMp
 KUBE7+uoUPvAA==
Date: Tue, 5 Apr 2022 10:53:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20220405105319.2eb47e9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j==zcLUSd_ZwS9jYUrBZVK3";
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Juha-Pekka =?UTF-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/j==zcLUSd_ZwS9jYUrBZVK3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_pci.c

between commit:

  132aaaf01788 ("drm/i915: add needs_compact_pt flag")

from Linus' tree and commits:

  072ce4164f97 ("drm/i915/dg2: Tile 4 plane format support")
  412c942bdfae ("drm/i915/ats-m: add ATS-M platform info")

from the drm-intel tree.

I fixed it up (I think, see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_pci.c
index c32c0c6661c8,8e321d300e0c..000000000000
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@@ -1040,25 -1038,35 +1040,36 @@@ static const struct intel_device_info x
  	.require_force_probe =3D 1,
  };
 =20
+ #define DG2_FEATURES \
+ 	XE_HP_FEATURES, \
+ 	XE_HPM_FEATURES, \
+ 	DGFX_FEATURES, \
+ 	.graphics.rel =3D 55, \
+ 	.media.rel =3D 55, \
+ 	PLATFORM(INTEL_DG2), \
+ 	.has_4tile =3D 1, \
+ 	.has_64k_pages =3D 1, \
++	.needs_compact_pt =3D 1, \
+ 	.has_guc_deprivilege =3D 1, \
+ 	.platform_engine_mask =3D \
+ 		BIT(RCS0) | BIT(BCS0) | \
+ 		BIT(VECS0) | BIT(VECS1) | \
+ 		BIT(VCS0) | BIT(VCS2)
+=20
  __maybe_unused
  static const struct intel_device_info dg2_info =3D {
- 	XE_HP_FEATURES,
- 	XE_HPM_FEATURES,
+ 	DG2_FEATURES,
  	XE_LPD_FEATURES,
- 	DGFX_FEATURES,
- 	.graphics.rel =3D 55,
- 	.media.rel =3D 55,
- 	PLATFORM(INTEL_DG2),
- 	.has_guc_deprivilege =3D 1,
- 	.has_64k_pages =3D 1,
- 	.needs_compact_pt =3D 1,
- 	.platform_engine_mask =3D
- 		BIT(RCS0) | BIT(BCS0) |
- 		BIT(VECS0) | BIT(VECS1) |
- 		BIT(VCS0) | BIT(VCS2),
- 	.require_force_probe =3D 1,
  	.display.cpu_transcoder_mask =3D BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
  			       BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
+ 	.require_force_probe =3D 1,
+ };
+=20
+ __maybe_unused
+ static const struct intel_device_info ats_m_info =3D {
+ 	DG2_FEATURES,
+ 	.display =3D { 0 },
+ 	.require_force_probe =3D 1,
  };
 =20
  #undef PLATFORM

--Sig_/j==zcLUSd_ZwS9jYUrBZVK3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJLkwAACgkQAVBC80lX
0GwCmwf/YLukNlv4VfvGolLJqjb0d4+V3vRIOgWor4TZgbiIvKvEI7wcYjf1Xotp
hw7jpLNt7ameGWV5+pKmYmUybFgjJJofMSI0cQaYkByRfT7Yml3Ov29TbNV3Pfu+
lSCt7asqLuubKGMfov41OxfkDtKK6aaCbAOPmO0yORo6rHVWkce1hRHSCXTfBGKX
nNrqGYiHCZud8k8V7he8P3Zf2tBqz4FJ1o5nzoKled5MT8mSux8NyFTinbDdwIAe
3hbbWcOgqQqlROVkTcjLWbDP4F4xFMUFTofnZzaS1nBRpmK+ZN3a8dbRzaP/jISD
B0q4OkRNTVifbgmONUvcm9I+VX65uw==
=R9kd
-----END PGP SIGNATURE-----

--Sig_/j==zcLUSd_ZwS9jYUrBZVK3--
