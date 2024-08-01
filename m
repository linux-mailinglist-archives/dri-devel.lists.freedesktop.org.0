Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72D943E21
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 03:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23610E7F1;
	Thu,  1 Aug 2024 01:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lm2uO4v7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D1310E7F1;
 Thu,  1 Aug 2024 01:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1722475084;
 bh=tW1zyvH/+6rUIbk5j37lWHaekfpVhhTK6eHLoZm/4/s=;
 h=Date:From:To:Cc:Subject:From;
 b=Lm2uO4v7fTcHRevDxyMxdQu+GY2ebNGU5bHwdbc42y7ghNo511pJ/FjkCWAAUUdzC
 4GzxseVNmpeEkBjfgwdClfce/vyhlceik1jEjYBhU8s07SyGdncuLkxUCcW7wZqv30
 PTEuw7TKiMDR+8bZnYUzGfpmh9+W3NhLJRJyIGKD85rAHFXY0hvAA8QZiNERPOK/Da
 w1nvr6rCj+ADbjqMaHoEca705hmcWiEDwIfgMcCR3wg2jnSNGOdVGIPQcGB4Rg1zWH
 2axnKB0LCXr/LiTZBaYnsa0hYymJfZ+TIViYhJn59xG7eZHgs45Qalhm+Vyn84pZ1c
 qmq38hoyxGqGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZB0q4cg6z4wZx;
 Thu,  1 Aug 2024 11:18:03 +1000 (AEST)
Date: Thu, 1 Aug 2024 11:18:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20240801111802.3723a203@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l3o_30aUQRg51Gmy=WMn7mu";
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

--Sig_/l3o_30aUQRg51Gmy=WMn7mu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/ast/ast_drv.h

between commit:

  0ce91928ec62 ("drm/ast: astdp: Wake up during connector status detection")

from the drm-misc-fixes tree and commit:

  c91d75a3c6a2 ("drm/ast: astdp: Test firmware status once during probing")

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

diff --cc drivers/gpu/drm/ast/ast_drv.h
index 47bab5596c16,b54a89676e9f..000000000000
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@@ -471,9 -471,9 +471,10 @@@ void ast_init_3rdtx(struct drm_device *
  /* aspeed DP */
  bool ast_astdp_is_connected(struct ast_device *ast);
  int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
- void ast_dp_launch(struct drm_device *dev);
+ int ast_dp_launch(struct ast_device *ast);
 +bool ast_dp_power_is_on(struct ast_device *ast);
  void ast_dp_power_on_off(struct drm_device *dev, bool no);
+ void ast_dp_link_training(struct ast_device *ast);
  void ast_dp_set_on_off(struct drm_device *dev, bool no);
  void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *v=
bios_mode);
 =20

--Sig_/l3o_30aUQRg51Gmy=WMn7mu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq4koACgkQAVBC80lX
0GxA2Af/cbNs2BlwTCMCerVN8tIWLM0msFK9LFtdyB0zCfl+8Gm/Irj+65HHRss5
+lkLZ+ioNnmIOmHWgztZ6aKaw0YEHHHKukg9wYiUH+fG99m83/1axl7pO3V5SjRY
I92L5jEPjlqLGxjGLZ62m8CXJoaZuL6DyGYCfJ6HwXrDoYoq+gQJIU/cdw+0HZO0
xJM6jWlUjDDiwbzLkGLxw5VHKtZeLV7CwjwpBpnvikNKIPqH5iyf5og9XxC8JtaG
zkOErxxoUyj+8BKWFoWYukTrKSqjnsG1wzqoIQAgn2znixBLZg4fVMXtwCK1Q1uS
etNwUEiLyxVp3LtFJsnLtWnOHXeB5w==
=Eaeh
-----END PGP SIGNATURE-----

--Sig_/l3o_30aUQRg51Gmy=WMn7mu--
