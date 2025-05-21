Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B580AABEAAD
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD2F10E656;
	Wed, 21 May 2025 04:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KOynMY+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437D10E656
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747800638;
 bh=B/CK2s1nq8WYq4cdcoFZ9+BOemGBGQlObXiO7rnkFGY=;
 h=Date:From:To:Cc:Subject:From;
 b=KOynMY+1RS5oi3p8J7UV/6yC0ge1XdFiwOpXIqRNcy8ESFmf4joS9QuKPLityilGj
 VBQHblyCnV9VxO32r4Esun5MyE262vgrw0NSzegjJKcPsdYuXnQ2FgDWBFOakA3SNm
 UK4Uqc99HsA4ksSHOFB4AnutKcujAGq+JnRiuJ6AuyqK2mc/50GlTw2gf0W2g21mRR
 vpQ/x/C65F5i36boa2/ssC2+aZkwK7bHtcQdvVKIEcSVY3LXZQcdKWVfdD4Mv+Nclp
 YM7O25mv/NuF3l1ZreowscnUq1gTnVne87S+5Ny+JxG7glfLk4fVxgU4vAj3nZfbll
 MwGkP7L0My5yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Hyj2MMDz4xTx;
 Wed, 21 May 2025 14:10:37 +1000 (AEST)
Date: Wed, 21 May 2025 14:10:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20250521141036.4eeb38a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zx8.6xAwQ71JOs25jJ0yFmv";
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

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_lrc.c

between commit:

  617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")

from Linus' tree and commits:

  bac016066536 ("drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()")
  7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")

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

diff --cc drivers/gpu/drm/xe/xe_lrc.c
index 03bfba696b37,855c8acaf3f1..000000000000
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@@ -651,8 -654,6 +655,7 @@@ u32 xe_lrc_pphwsp_offset(struct xe_lrc=20
  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
- #define LRC_PPHWSP_SIZE SZ_4K
 =20
  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
  {

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtUjwACgkQAVBC80lX
0Gw1BAf+JtPdOzwJVks/SWd9on2mw4Qjq0SA0AWDjREmD4QzgGOUmluUy5F5pXVD
PKxt/lYYkNE11j964l7eaZg+bA/uxtjDsyI5nyrvgW7ymtLd8Mem2yShcHVJc3/z
c9zJYTZfIxl0NTQkvFwhsKelfDat1y0UPshL3lp+1uQR3moZJvfJVxUv546is7tr
KKEXJA1Z/uU7vFYY2ADX1N9Y+JeRyJcMs6SUUxUfMowr04qyF3IDpYzRAZw4GngL
AT0lUkOK3+SQo3YGLLRRW3AsCYaiLNBsESNXPtaB0951ZxmztNgW4YnQYYW6D310
fNAUKIbzZtxEYgHCPOQ5e5C4KeQXXQ==
=qFZ3
-----END PGP SIGNATURE-----

--Sig_/zx8.6xAwQ71JOs25jJ0yFmv--
