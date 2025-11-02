Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F5C299FE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B510E12E;
	Sun,  2 Nov 2025 23:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mfG+CMex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716E910E12A;
 Sun,  2 Nov 2025 23:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762125754;
 bh=2rNjtOI2mww09uharcAW9DKM4SCrFQrcePKn6Adh+n0=;
 h=Date:From:To:Cc:Subject:From;
 b=mfG+CMexHVEfMn3XGPzUyXvEjUu1LqUoNtF+InvzBVCkEMXKMEarUI88/zOD5lxlG
 qem25g7hWN2y8mHmJmlqw0ePJKNVOkCJSu5KFVi/kKlAg05LK9Ia5HQmZhQV5dsOEX
 fAlytqfzGSAjxvov8UQT5Tw80nJKtSbG6rM0bmDLf1I31a0bUw+8SVVjQAKfsnV+tM
 nbr+bkqHUj1pe6FULUN5iXqFed0eoA9+OlfWhWynMF7rN4SASamgjDdyKhLKmb66Gx
 FfCAmpvXU9+hFXO6xv9cT2pZwOSZ422NbaWBN98KO/uWDMgXSMv71dp0N4LFSd0LIa
 nF+ICqKnc7Qwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09jj6TLhz4w93;
 Mon, 03 Nov 2025 10:22:33 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:22:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc tree
Message-ID: <20251103102233.7c6adc9a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fUz4vqoMbt2t_KNm2IayWRr";
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

--Sig_/fUz4vqoMbt2t_KNm2IayWRr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_bw.c

between commit:

  f6e8dc9edf96 ("drm: include drm_print.h where needed")

from the drm-misc tree and commit:

  ac930bab1c89 ("drm/i915/bw: Untangle dbuf bw from the sagv/mem bw stuff")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_bw.c
index b3e4cc9985e9,3033c53e61d1..000000000000
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@@ -3,9 -3,6 +3,8 @@@
   * Copyright =C2=A9 2019 Intel Corporation
   */
 =20
- #include <drm/drm_atomic_state_helper.h>
 +#include <drm/drm_print.h>
 +
  #include "soc/intel_dram.h"
 =20
  #include "i915_drv.h"

--Sig_/fUz4vqoMbt2t_KNm2IayWRr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH57kACgkQAVBC80lX
0GzFmQf+J56RnPQxGAMIrZg2X4PAPoS7F6DlQhHOjBxn07eOrXCTErRQqEeN+Rlp
6iFvL9UdMmiVi5qBo3riK92kx2sfLZdVXq0zs2TZbARlW/SDt0AaslUZEHz408t/
7EVXxdxvOIkPr1D/lANCVsjvhk21L7EeTlbT61EFF8ccsOQArMR4F/pNM4uxhm6P
zLRCNQR5Jpz9UOk6MrTtUKNiFD0SYGaHTgf+6sVDBZMGz1s5XpcuA5K6GyhaPSEZ
/tvnHyfc9oBFrCFUqrC4MJZ0UlP54j9Mn6Z+jOEXqjg9ZgtHbCmT4AdNSahMo9Xv
UNWjtDWGl6tnpMs/QW0yZzPXUFV2cQ==
=ynOq
-----END PGP SIGNATURE-----

--Sig_/fUz4vqoMbt2t_KNm2IayWRr--
