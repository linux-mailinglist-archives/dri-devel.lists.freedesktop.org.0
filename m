Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A6A48F1C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 04:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30F10EBE2;
	Fri, 28 Feb 2025 03:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DgJFafhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145310E274;
 Fri, 28 Feb 2025 03:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1740713241;
 bh=+vkTQWZvrTkY3NHMs6bF+Gg5uGq6JZsOy6k++k+VoSg=;
 h=Date:From:To:Cc:Subject:From;
 b=DgJFafhqp0Tf0b5/Msn3Owfmet/yhAk5TYr71a2rAGC4AkM/SvEjLSLN7btYm0aag
 s/nueTsTg9C3spXsZPofCfJJZgJxgJsAJB3Q6I4S+W3ysNNAzpQ0mZlKIDo51iTXPX
 3Z0Vt833ll3ejmM7ESBSRNmVBDwpbzynO7krCH8E11E7hyhr91QwDpN2UYwxamWX+w
 nY6J942tg0HWzUQpIN28+7c7dQPY31bQheRpRwTmaZTQoYhXMmQfSeFuyrpIf952EG
 FrGGlBYivoTAO8SRRXgXaDQ2ZWojC8mr3WDaFlEHrYJE7MC5Gdi/mQ0oPOTQOfoduV
 3Ktt/tqvkjedA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3ttc5H3dz4wcD;
 Fri, 28 Feb 2025 14:27:19 +1100 (AEDT)
Date: Fri, 28 Feb 2025 14:27:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Dave Airlie
 <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm tree
Message-ID: <20250228142718.22d73660@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mRNMB9qxAl_F7qe05VE6zJz";
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

--Sig_/mRNMB9qxAl_F7qe05VE6zJz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  1b242ceec536 ("drm/i915/audio: convert to struct intel_display")

from the drm tree and commit:

  d41d048043c4 ("drm/xe/display: Drop xe_display_driver_remove()")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index 02a413a07382,279b786d64dc..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -169,7 -169,8 +169,8 @@@ static void xe_display_fini(void *arg
 =20
  	intel_hpd_poll_fini(xe);
  	intel_hdcp_component_fini(display);
 -	intel_audio_deinit(xe);
 +	intel_audio_deinit(display);
+ 	intel_display_driver_remove(display);
  }
 =20
  int xe_display_init(struct xe_device *xe)

--Sig_/mRNMB9qxAl_F7qe05VE6zJz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBLRYACgkQAVBC80lX
0GwnWgf/anbPSw8zaLHQp0GtPQyCyrHG5NBHPw+8w4XhF95LRlCHLSTOfvtvdxji
pSMFuh8TDVbyEEJ1Q6agd/5szH5iIOoCkLI7iUC7MUR3U4EwFuze1siuBQUA/HsS
pSovjWGwXtjIUou7g4aUUr10ZfqiCwqAY913Gwex9fO+Uc8/JbJ9T4hFXq0deYoK
VzaZyVUxW0Kgpc7F+yZyfi1+edVqm9Z9QG3C6cOslpu52BVNVWShsuNsELbjS2b3
ZXkle4q7J9rpFxcaVbPa5DNOcPdtrm9VQRgf8IP21TmBexBGg9mefN53m+ejqU3e
K4Pi5MBxeHW+1x4HaDP88cz8wOOJmQ==
=ZoYa
-----END PGP SIGNATURE-----

--Sig_/mRNMB9qxAl_F7qe05VE6zJz--
