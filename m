Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1805F4D1C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 02:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345310E417;
	Wed,  5 Oct 2022 00:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B3610E078;
 Wed,  5 Oct 2022 00:43:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhwls35XYz4wgv;
 Wed,  5 Oct 2022 11:43:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1664930586;
 bh=u3+7g8/NTQ+C/yLguEF4M8kLu7VY03qew1r8TYkvPPA=;
 h=Date:From:To:Cc:Subject:From;
 b=oBhrBU/3DRwuDLjK5j0hbncOUx9U10IYEQMQzYxE2hDdCsF6Zcb52Y9oY/kfPEy3c
 r69oi4wYEDAcJeD+x3hWlCpkJkiYPsAR0GgnS7dXqqBXQSWAOX4P8uoaAWD/TaEebC
 GHZV9OJvIKvBM7rk6AGkssVa+NsrGkrsZTLMMFo3sM80zFGlI4vVXt/toLEEKwFLRL
 34bjkGHVyljwh4W0D/WgDYeZ8uHxoG0edkEHcsgCpNEzVhrGVIVci4cyMOp3G1ZM+p
 7DyFdtoL82uyV6khe8HYOLTOGKlYzeQojRuHDDtqzg6/odpwTaPGNpMTGBCgqoYC6O
 hH0OlSvqJzEzA==
Date: Wed, 5 Oct 2022 11:43:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20221005114303.0e4b0881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Dkv2l7meS3IrTp5418XXDy";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2Dkv2l7meS3IrTp5418XXDy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_edid.h

between commit:

  c7943bb324e5 ("drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets=
")

from Linus' tree and commit:

  afd4429eba28 ("drm/edid: Define more flags")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_edid.h
index 1ed61e2b30a4,28dd80343afa..000000000000
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@@ -92,15 -92,13 +92,18 @@@ struct detailed_data_string=20
  	u8 str[13];
  } __attribute__((packed));
 =20
 +#define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0) /* 1.4 */
 +#define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1) /* 1.4 */
 +#define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2) /* 1.4 */
 +#define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3) /* 1.4 */
 +
- #define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
- #define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
- #define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
- #define DRM_EDID_CVT_SUPPORT_FLAG           0x04
+ #define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00 /* 1.3 */
+ #define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01 /* 1.4 */
+ #define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02 /* 1.3 */
+ #define DRM_EDID_CVT_SUPPORT_FLAG           0x04 /* 1.4 */
+=20
+ #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
+ #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 =20
  struct detailed_data_monitor_range {
  	u8 min_vfreq;

--Sig_/2Dkv2l7meS3IrTp5418XXDy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM80xcACgkQAVBC80lX
0GxVjAf8CbvSrDGOmZ0YmOS+1QnJPPSnHY7WlsmNF+xMUM0oojq68RJpO4BRCKxT
FcyI7b8MU/MaQR6oFasXAuGM6mlZ8dq10Apyo79v8u45puNakdUknQC5wyrMW02d
eddRk1/RGxTLMkBx8JvM+s8S/X+RLc9Kqhu8qSC7boupKOR1mclAZ2p0XJxK5KaS
+iTm530JKlx8lTdFLgMe63LAvBCYQSmjljuaFSWcAWbDVXH8YNNykQhD7+jovqR0
GudyBypeoXh5UGrTynzLnTRASVCU7xDX8Oz9Teh1MJ2cmPDOoEfP81KJpPrQmv5Z
AsFbyrQGvAbJVDZSvpfw8A7RqA6MlA==
=rmrf
-----END PGP SIGNATURE-----

--Sig_/2Dkv2l7meS3IrTp5418XXDy--
