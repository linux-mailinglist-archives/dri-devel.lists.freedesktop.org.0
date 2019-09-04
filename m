Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F0A7BEB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 08:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669C689654;
	Wed,  4 Sep 2019 06:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114D89654
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 06:46:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46NZ9D5dXFz9s7T;
 Wed,  4 Sep 2019 16:46:24 +1000 (AEST)
Date: Wed, 4 Sep 2019 16:46:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20190904164622.57f69595@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1567579585;
 bh=/9Z2sNkRT/o08P4aiLvvwhSdCvWMznDFuM2DsfxuXjw=;
 h=Date:From:To:Cc:Subject:From;
 b=qpsN4vYxsxNjngjD8lHP8pmaiuwazbhwfLCnCIis4F7wejqKJCyZojUlexWVanwOM
 A0Iy61TYSgszKS7XTHRgpDWQrRIEAzEHFnN7PN/hmLTRMczB9/8l/ar7AXG/Vyo7Qs
 Jfbw8b4EGmP8iLk0Qj9fUizCE6AK0jLeU0kRE7oXWBVbmWhkL99Z7I6KIgmgCMPeX4
 GYdBbanjXMIy/jYIzLsOg1ar306FdNdynuliwriGJ1yzsgaRGUB75X0k6e4mlnLybO
 H2b0M9PR55CT8+kyowzRsQhwTNAuHRk/yL0eEvfIIR1cfS0SlpGOBc8ccgdoPxIbvK
 OTgR5Jcy+EcJQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0458412173=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0458412173==
Content-Type: multipart/signed; boundary="Sig_/jUz8nlZ8JiYQFsxYrK+5AeD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jUz8nlZ8JiYQFsxYrK+5AeD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/display/dc/calcs/Makefile
  drivers/gpu/drm/amd/display/dc/dml/Makefile
  drivers/gpu/drm/amd/display/dc/dsc/Makefile

between commit:

  30851871d5ab ("kbuild: change *FLAGS_<basetarget>.o to take the path rela=
tive to $(obj)")

from the kbuild tree and commit:

  0f0727d971f6 ("drm/amd/display: readd -msse2 to prevent Clang from emitti=
ng libcalls to undefined SW FP routines")

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

diff --cc drivers/gpu/drm/amd/display/dc/calcs/Makefile
index d930df63772c,16614d73a5fc..000000000000
--- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
@@@ -32,9 -32,13 +32,13 @@@ endi
 =20
  calcs_ccflags :=3D -mhard-float -msse $(cc_stack_align)
 =20
+ ifdef CONFIG_CC_IS_CLANG
+ calcs_ccflags +=3D -msse2
+ endif
+=20
 -CFLAGS_dcn_calcs.o :=3D $(calcs_ccflags)
 -CFLAGS_dcn_calc_auto.o :=3D $(calcs_ccflags)
 -CFLAGS_dcn_calc_math.o :=3D $(calcs_ccflags) -Wno-tautological-compare
 +CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calcs.o :=3D $(calcs_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o :=3D $(calcs_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_math.o :=3D $(calcs_ccflags) -Wno-=
tautological-compare
 =20
  BW_CALCS =3D dce_calcs.o bw_fixed.o custom_float.o
 =20
diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
index 83792e2c0f0e,95fd2beca80c..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@@ -32,16 -32,25 +32,20 @@@ endi
 =20
  dml_ccflags :=3D -mhard-float -msse $(cc_stack_align)
 =20
+ ifdef CONFIG_CC_IS_CLANG
+ dml_ccflags +=3D -msse2
+ endif
+=20
 -CFLAGS_display_mode_lib.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
 =20
  ifdef CONFIG_DRM_AMD_DC_DCN2_0
 -CFLAGS_display_mode_vba.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20v2.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20v2.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o :=3D $(dml_ccflag=
s)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o :=3D $(dml_ccf=
lags)
  endif
 -ifdef CONFIG_DRM_AMD_DCN3AG
 -CFLAGS_display_mode_vba_3ag.o :=3D $(dml_ccflags)
 -endif
 -CFLAGS_dml1_display_rq_dlg_calc.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_helpers.o :=3D $(dml_ccflags)
 -CFLAGS_dml_common_defs.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dml_common_defs.o :=3D $(dml_ccflags)
 =20
  DML =3D display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_c=
alc.o \
  	dml_common_defs.o
diff --cc drivers/gpu/drm/amd/display/dc/dsc/Makefile
index c3922d6e7696,17db603f2d1f..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
@@@ -9,9 -9,14 +9,13 @@@ endi
 =20
  dsc_ccflags :=3D -mhard-float -msse $(cc_stack_align)
 =20
+ ifdef CONFIG_CC_IS_CLANG
+ dsc_ccflags +=3D -msse2
+ endif
+=20
 -CFLAGS_rc_calc.o :=3D $(dsc_ccflags)
 -CFLAGS_rc_calc_dpi.o :=3D $(dsc_ccflags)
 -CFLAGS_codec_main_amd.o :=3D $(dsc_ccflags)
 -CFLAGS_dc_dsc.o :=3D $(dsc_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc.o :=3D $(dsc_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc_dpi.o :=3D $(dsc_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dsc/dc_dsc.o :=3D $(dsc_ccflags)
 =20
  DSC =3D dc_dsc.o rc_calc.o rc_calc_dpi.o
 =20

--Sig_/jUz8nlZ8JiYQFsxYrK+5AeD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vXb4ACgkQAVBC80lX
0Gyl1gf/T4Q64/PkBZgiqA96i3WZIdEakmu3YfXXK8oNnifXzASlIhm1lJHpfOB0
8h4lRzBAdPv3TpwNQdS1feaClA15b7WbyNheU8owBzhHruhNGXraVeuLVY09sELX
T74qyxl8WKa2fiTATkhouwozUL/iUiCuUn2EQi1O50JdgJXqzn1kUeLiSSh/XtBV
bAXnV9hxA6Ydjq6L2PZNfOJA3CCJqqNCVL+L4haU4uulQeg31mjJfeDCc7Z1aKDl
6+p9qYYEMN4RmZLsS8ERd+7XbwyL23j/y0OnNV6g01hCDKBXWyvyFpFMM5s3KdsO
/gu4M9CAvMLl9JcD/0+TbAY2vcqivA==
=4QMz
-----END PGP SIGNATURE-----

--Sig_/jUz8nlZ8JiYQFsxYrK+5AeD--

--===============0458412173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0458412173==--
