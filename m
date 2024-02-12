Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81D850C95
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 02:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957F310E950;
	Mon, 12 Feb 2024 01:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uPvcybLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71510E950;
 Mon, 12 Feb 2024 01:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707701213;
 bh=c1V4UZpnkpJEnpxJR1UunCWkI7w4Qm3h7J75TTX31co=;
 h=Date:From:To:Cc:Subject:From;
 b=uPvcybLyD/abO7VVspmzRmsFWwdXWM8P+wCqGlaKKb1xUaOPzGe4l0MgFKb1lHzpw
 gXHf4uQaTKOLs0BiafO5Kas/TP8DxE5LFRUSIcWoCDGu5fnek8DZpKiTctt4wnO7a2
 vs4FlsYvDH6dmpTJprW9P8xrzyHaSqLaeJiSGSAaR1zAAqoqGQCUGVno647kuNPZQG
 6zfIVWRlQHsPYXP/RQISASNgJTPXBSwe7R+dJ6gm9hJ02d045OsN3RfiETZHAYcBTX
 jWcZLibvBN8Lh3a2MJOpB57BxvbIWIInuILj3lpK49wnXlW0mz3LOrEJJ87gcbkBbB
 z+vmZ6ZljLqBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TY6Hw6s7Qz4wcH;
 Mon, 12 Feb 2024 12:26:52 +1100 (AEDT)
Date: Mon, 12 Feb 2024 12:26:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240212122652.0961dc7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eFcTj/wAxAvOE7aVXOUTEDZ";
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

--Sig_/eFcTj/wAxAvOE7aVXOUTEDZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/tests/drm_mm_test.c: In function 'drm_test_mm_debug':
drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: implicit declaration of =
function 'drm_debug_printer'; did you mean 'drm_dbg_printer'? [-Werror=3Dim=
plicit-function-declaration]
  191 |         struct drm_printer p =3D drm_debug_printer(test->name);
      |                                ^~~~~~~~~~~~~~~~~
      |                                drm_dbg_printer
drivers/gpu/drm/tests/drm_mm_test.c:191:32: error: invalid initializer
cc1: all warnings being treated as errors

Caused by commit

  e154c4fc7bf2 ("drm: remove drm_debug_printer in favor of drm_dbg_printer")

I have used the drm-misc tree from next-20240209 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/eFcTj/wAxAvOE7aVXOUTEDZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXJc9wACgkQAVBC80lX
0Gz6pAf+NHxW65EDQac00DilG4U3sGl8cumRDWWGwm1q9bliw+IeN/8bmbPVx7W9
ct+yUcZtez7TUdirEqyMl/I/m1TNZkiIPQQu59v/KFP+AUBYRrbbHySIxaKT4osI
S/g5hbwlyROP6tY0afZAbgQSv+EneMa0JzoAeF2oLcTButaIq5Aoo4s7fvfcWHmv
YEqMLiVS2VAG/oG60N7veEtw7u2BR9zMvXZ32CZ7xNP69YpRWgEnArJddJcNIrHj
JCjhNvP0z5954qh1hMu5w3qjVYGn/4gtj0DrjkJxjbwBNpUDeImzb3jUgIBD1cIQ
ezgYJ/CPaS7jM7gYgqTUyKueVvT/RA==
=mWi8
-----END PGP SIGNATURE-----

--Sig_/eFcTj/wAxAvOE7aVXOUTEDZ--
