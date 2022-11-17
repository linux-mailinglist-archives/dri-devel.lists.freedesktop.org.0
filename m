Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA662D10A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 03:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDBE10E51B;
	Thu, 17 Nov 2022 02:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8F910E51B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 02:13:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NCNk33kBPz4wgv;
 Thu, 17 Nov 2022 13:13:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1668651196;
 bh=0JvtbpFAWrozBSyXHaFd/9u1ToyjkJvQTSHxuUq3Bdw=;
 h=Date:From:To:Cc:Subject:From;
 b=TDn3pSd6Nh4nu23XHdcPEybqNyJZOFMO+s5Lq79WQMOvvUKeJWQtZLhOVnYs+I5am
 BdxWao9AvB22w2p40tLGoDu1Afg2lKnVVKo0Wz+ockZ5VZfvKR3RbJrAwrQSPv8kff
 ADV/Z+lr/X+VXuVbLtzLxgf6+Q7d7GoX0ukmWuH5hZc2cUdJkrQL/h7eGKIW7Clwgx
 2+d2zMnkA6nw378lYjoLmPFhHiLkY/myQ3ArLHJGvwyitGLQiDmeIXTTaj76+TjqJk
 8A4ckpuA6mjQ9nit8ejCtTIYL71MTWxJkR8pZLM4Kj9EL7utdw94HyqDT5xMQPh2B5
 gA/tDJvRmj/eg==
Date: Thu, 17 Nov 2022 13:13:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20221117131313.22294c0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/avrVP.quFIgEvsboga_6QhQ";
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
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/avrVP.quFIgEvsboga_6QhQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/rcar-du/Kconfig

between commit:

  a830a1567859 ("drm: rcar-du: Fix Kconfig dependency between RCAR_DU and R=
CAR_MIPI_DSI")

from Linus' tree and commit:

  7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")

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

diff --cc drivers/gpu/drm/rcar-du/Kconfig
index fd2c2eaee26b,f14686549cbe..000000000000
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@@ -41,21 -41,22 +41,27 @@@ config DRM_RCAR_LVD
  	depends on DRM_RCAR_USE_LVDS
  	select DRM_KMS_HELPER
  	select DRM_PANEL
- 	select OF_FLATTREE
- 	select OF_OVERLAY
 =20
 -config DRM_RCAR_MIPI_DSI
 -	tristate "R-Car DU MIPI DSI Encoder Support"
 -	depends on DRM && DRM_BRIDGE && OF
 -	select DRM_MIPI_DSI
 +config DRM_RCAR_USE_MIPI_DSI
 +	bool "R-Car DU MIPI DSI Encoder Support"
 +	depends on DRM_BRIDGE && OF
 +	default DRM_RCAR_DU
  	help
  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
 =20
 +config DRM_RCAR_MIPI_DSI
 +	def_tristate DRM_RCAR_DU
 +	depends on DRM_RCAR_USE_MIPI_DSI
 +	select DRM_MIPI_DSI
 +
+ config DRM_RZG2L_MIPI_DSI
+ 	tristate "RZ/G2L MIPI DSI Encoder Support"
+ 	depends on DRM_BRIDGE && OF
+ 	depends on ARCH_RENESAS || COMPILE_TEST
+ 	select DRM_MIPI_DSI
+ 	help
+ 	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
+=20
  config DRM_RCAR_VSP
  	bool "R-Car DU VSP Compositor Support" if ARM
  	default y if ARM64

--Sig_/avrVP.quFIgEvsboga_6QhQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN1mLoACgkQAVBC80lX
0GyUkggAgxPl5ad4oux+Odi1YzW4RXtRHV5kA+xQoaLJhBjmPKme9QmMRe29Aijr
8vMp6R7GcDutI9bLxQDQvWKu+vujEbpOjqMxnuVeDS9aVRUcdnFUDWHKiF2iJHBz
Oms8KelANSF7FiRgd+8BYBXrVk59IW4b2tDDyksCN+6Hi3gH5U1ZVrGdtgfEq/S5
S+eP0DyV8Giq/BVwNCvC+2sQ8V0vtP6bBW6/de44rD1hE5ZfdzfAChSeKRT+fivK
Nt5axRTxKTD6wvQM/PMyMxjp/eEbDeH5i4I5JBgmrKeKhXfDT0iIftjPN6N5l3Kt
flANopj0kXxHb2dfHeOTsHb8QDEWzw==
=ukZ2
-----END PGP SIGNATURE-----

--Sig_/avrVP.quFIgEvsboga_6QhQ--
