Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A015C299BB
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1E10E11F;
	Sun,  2 Nov 2025 23:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yt8NQl0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6410E11F;
 Sun,  2 Nov 2025 23:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762125231;
 bh=UrApUplrhg650aeZjiGycPOh3SlW4EIV3RN/nqafq1E=;
 h=Date:From:To:Cc:Subject:From;
 b=Yt8NQl0BCT6YyP6Ob7vUHE3jJT/zHLqfXClfbB4WesXkBOO2tzgl/AeTUbFcXcaNW
 vF5WawPsb2+39n/qKKELR7EYcSFRWEms+6RtK/xJBKPMOA14yRqojVY31ePzLGRfgv
 MeKs5Ap0F2EVAAzfqroqW1QCzhTLVC+lUADd8HUXYQQH2ux90jT4/BcuH95b6ibifO
 p2V2Uoq/fTS6ZmR6Hfiz7xJRWO+BxlsHqujChOZKQORAdZ8Y3frMI9Z9/JXwpLHA6S
 53LH2sLMw75+SssbBnKvt4mOLPZQhZMah5YnryLgw22t6L3YUaZFJQM3lEIIL3Mths
 Do70td8lTNP+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09Wf1QQXz4w0p;
 Mon, 03 Nov 2025 10:13:49 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:13:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc tree
Message-ID: <20251103101349.5af777a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z21a/cOLsFpemMoUDjgkfrw";
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

--Sig_/z21a/cOLsFpemMoUDjgkfrw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gt/intel_rc6.c

between commit:

  f6e8dc9edf96 ("drm: include drm_print.h where needed")

from the drm-misc tree and commits:

  8c2833ff1df3 ("drm/i915: add vlv_clock_get_czclk()")
  5615e78e813e ("drm/i915: split out vlv_clock.[ch]")

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

diff --cc drivers/gpu/drm/i915/gt/intel_rc6.c
index 13721c9081b6,932f9f1b06b2..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@@ -6,8 -6,7 +6,9 @@@
  #include <linux/pm_runtime.h>
  #include <linux/string_helpers.h>
 =20
 +#include <drm/drm_print.h>
 +
+ #include "display/vlv_clock.h"
  #include "gem/i915_gem_region.h"
  #include "i915_drv.h"
  #include "i915_reg.h"

--Sig_/z21a/cOLsFpemMoUDjgkfrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH5a0ACgkQAVBC80lX
0GwATAf+IaMAVNnjxQs9NAYsjoodKNpiqtMya/5O4WpRBOXablOVAi64oRQ1fViR
SJJx3BBzT+wgoQOiiw8Cbt9yYumCNVAfNGfpUEBXxPbkXr4S9gioxVI88eMhn4Ob
OjJrzUCbQFAz3yORvpZ5g/opYgkFdVQRxHtw0QgS5QOxFcIvWzWD3vFOAnuj1yL2
Vui1+OAVM+dqVa4V2+A9ITd+KeArkOr9J220hDlx8wU7efheCh8deoHJ9nndlCl2
lGmq92cRH0CAfjXsxq0IDnTz58//cobXBUWj2Peaxxnd52o7rfWbn9EgN/khgCHK
EKJZs8U03LQ1G+FidjQVmPmbvWqXwQ==
=BAmB
-----END PGP SIGNATURE-----

--Sig_/z21a/cOLsFpemMoUDjgkfrw--
