Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFCCA2391
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 04:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302CF10E07A;
	Thu,  4 Dec 2025 03:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BB/qJqaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D236F10E07A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 03:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1764817615;
 bh=3VDbv8be7WXmqziqx3UIDm831ej/hZpH03IJPhmPaT0=;
 h=Date:From:To:Cc:Subject:From;
 b=BB/qJqaKvbBqZK2NrUbwN1BiB5KTOn3484/e+6JcajzmWy4qoEk8aupltwIRLDq22
 L1g6uH5TRE7ggIC6KMgyIVyBtJi4ZH/CjLXObn8aODqRRUQb9moxiJiEyFZZ0qVX+9
 5VYgxw0coNgnXF0Pi3fegWUwFkVCb4TyIXtHD7NECNtrptiyJf2vfXe22952RtcxOE
 o+1VdeLe0bh/5ig9z8npMntQ5TVyhaUDxlF08JXOPdfNRAsgF8LZW08FUQUxhfDp3b
 7yhJ/RzjXOh872H1lxZcjVT0Mhp/NY7+YAAUdSLS3NGW/U7AvMwRA3yZkLN+TTxXER
 ARjGAumMMnBBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMKDH3tnhz4w2J;
 Thu, 04 Dec 2025 14:06:55 +1100 (AEDT)
Date: Thu, 4 Dec 2025 14:06:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20251204140654.1cba1aeb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AXumj+EMN1pf_6OiZG45q/O";
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

--Sig_/AXumj+EMN1pf_6OiZG45q/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_fb_helper.c

between commit:

  eb76d0f55535 ("drm, fbcon, vga_switcheroo: Avoid race condition in fbcon =
setup")

from Linus' tree and commit:

  6915190a50e8 ("drm/client: Support emergency restore via sysrq for all cl=
ients")

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

diff --cc drivers/gpu/drm/drm_fb_helper.c
index 0b3ee008523d,be790fc68707..000000000000
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@@ -31,7 -31,8 +31,6 @@@
 =20
  #include <linux/console.h>
  #include <linux/export.h>
- #include <linux/sysrq.h>
 -#include <linux/pci.h>
 -#include <linux/vga_switcheroo.h>
 =20
  #include <drm/drm_atomic.h>
  #include <drm/drm_drv.h>

--Sig_/AXumj+EMN1pf_6OiZG45q/O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw+s4ACgkQAVBC80lX
0GykkAgAiuS/bCiTzN8kqRw+NJMXeQO/6QoHVyVD1x+n6Sy42jpFpv7QDfe1izps
uQpSGD+UcSZ9CQG6tbUXA9IdiYXbvD1E+U1ftiumi1ci2IjMsJHpr6IbH6u39RQq
OtoVvVb7Fa2oBa9c9mvok5iU5gbZlu1qZx5coObTmTGbq7Oeikzhn5C35uQ1RwY4
Cz12bGYGG2E+GKa7/myFt9zroAy6v8M+C5+AFlghyotLj30YWvtZl2DesS9+VDfI
myHFxRKYJKI8JKAopz5v9SQKTGfqklz3f2RzUdOhU2N21mU6wg8DKbtdfVCtvKMk
HHtgcOD/2BeOtwDl+7BoEZctYQ4t/g==
=Kzxx
-----END PGP SIGNATURE-----

--Sig_/AXumj+EMN1pf_6OiZG45q/O--
