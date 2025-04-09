Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC7A81A06
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 02:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4EC10E7A9;
	Wed,  9 Apr 2025 00:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GVs/iIyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30E010E7A9;
 Wed,  9 Apr 2025 00:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1744159580;
 bh=fj4z+jwqUz9HAkrp3iXCm4kGifaxbWJ+n8E7OIJrNTg=;
 h=Date:From:To:Cc:Subject:From;
 b=GVs/iIyOhOEWBjz5ExtZd4IasR1JkT8R/gCQdsUGwKlin6hZSq9Icrkp5fAgTtLqZ
 n0rRjlZRdqtkL1OzHEz8vlzfN6WcQBzbyq57c9rs3Uu7hxrdagASkAtmP4OmTzvSgH
 lt3uP/oEUASpzvsEY5fnK3lp/YFfDbRCtwXGXOjDxN57BElv/m72aphJXK5Mx86xFg
 StnQ63YUB1Ru3O1QQHO60cn4OCyErDnqzNywNU6oIzPAPLW0J5ycZOn1ItKxpqSz2K
 TqOODcOswJhftEr1svTCIbwe7eB/hTQ2xt7pijVykFKNSQmKOs5h/7pTPZceS0XkY9
 vDLSt/7KkqvAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXPQN0qRcz4wbv;
 Wed,  9 Apr 2025 10:46:19 +1000 (AEST)
Date: Wed, 9 Apr 2025 10:46:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20250409104618.55387b4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YKIWsIhWe7WzZE3Mv8tAKKR";
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

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_kunit_helpers.h

between commit:

  13c1d5f3a7fa ("drm/tests: helpers: Create kunit helper to destroy a drm_d=
isplay_mode")

from the drm-misc-fixes tree and commit:

  e4e3de631d14 ("drm/tests: helpers: Create new helper to enable output")

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

diff --cc include/drm/drm_kunit_helpers.h
index 1c62d1d4458c,1cda7281f300..000000000000
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@@ -118,9 -119,13 +119,16 @@@ drm_kunit_helper_create_crtc(struct kun
  			     const struct drm_crtc_funcs *funcs,
  			     const struct drm_crtc_helper_funcs *helper_funcs);
 =20
+ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
+ 					   struct drm_device *drm,
+ 					   struct drm_crtc *crtc,
+ 					   struct drm_connector *connector,
+ 					   const struct drm_display_mode *mode,
+ 					   struct drm_modeset_acquire_ctx *ctx);
+=20
 +int drm_kunit_add_mode_destroy_action(struct kunit *test,
 +				      struct drm_display_mode *mode);
 +
  struct drm_display_mode *
  drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device=
 *dev,
  				    u8 video_code);

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf1w1oACgkQAVBC80lX
0Gx6JAf+JbuQC1niQEhpYqJHkvlr4X8gfepMRKYQ2dh3PQXJUIesnkZ8+3PvJsiZ
jxTgAGExYiH6gJVapSnVWPYke2D01Lz6cvEyr7OubrYgHPBWE7dkPsl4uMCtnE6N
Ln8QL8Z9M54TwR1evo69OKTcphdl0qjG9pwS8KcTap0ad+6NJegXoHc4WUMVm7NH
8Rvd3VCwwBxE3pzXVTVDw1UyB7t2EPcckgv1Q6wZVU3iJw3Z/LGzvrlk+x4uNoC1
U40SQS5vNhoX9wYfigBbBVy8sfVko6zdA6TcbcFbQyEFihCE8efSdvhHxXTlXxb2
YGIP/3gmWoUvEYceK66INaaS5HN/+w==
=La3O
-----END PGP SIGNATURE-----

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR--
