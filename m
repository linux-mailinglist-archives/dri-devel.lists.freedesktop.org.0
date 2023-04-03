Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1B6D3BBD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 04:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E7210E0CC;
	Mon,  3 Apr 2023 02:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2510E0CA;
 Mon,  3 Apr 2023 02:16:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PqZJM4875z4x4r;
 Mon,  3 Apr 2023 12:16:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1680488180;
 bh=8/ow9EqjQRLyTBH/E6pNwk1eGI50p/rFF1fmRMHgGPw=;
 h=Date:From:To:Cc:Subject:From;
 b=DPPYQSymeYS1YHjGCU5ee4tf0Azrp6u6GhVEdZlr+PRekvsj2CryVfz54gwaIcgBD
 y0vHSuWkiaZNgXJ2diTdpONQz4FwfzDA9SK7IkhVQOm6XO3w91tPbDPe4nuVs4b6hM
 KFBwYnlgg07V5ReOKkCUZgzJoeJPshRydm4G/0iL+Rn+M4B5Uqa3X5R6/eEnwvMmzu
 1R/DAnwe+C+qBXxGe3X5Qgf2AVuIPi3K4/gx5cODFrNo/jvPEn7PGKq+64l2L3ScBG
 bHs9DXvcftc5VGeNIBekjGTLjIDL82lkPEMlm6P/Y/W3fGqoGEpSnWydcH8lVyAUXk
 Wcom/NhksUg8Q==
Date: Mon, 3 Apr 2023 12:16:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20230403121617.61e2a929@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/99x8/wsHoIWkJU5fp4LPTfP";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/99x8/wsHoIWkJU5fp4LPTfP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_do_release':
drivers/gpu/drm/lima/lima_ctx.c:53:45: error: 'struct drm_sched_entity' has=
 no member named 'elapsed_ns'
   53 |                 mgr->elapsed_ns[i] +=3D entity->elapsed_ns;
      |                                             ^~
drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_mgr_usage':
drivers/gpu/drm/lima/lima_ctx.c:125:43: error: 'struct drm_sched_entity' ha=
s no member named 'elapsed_ns'
  125 |                         usage[i] +=3D entity->elapsed_ns;
      |                                           ^~

Caused by commit

  bccafec957a5 ("drm/lima: add usage counting method to ctx_mgr")

interacting with commit

  baad10973fdb ("Revert "drm/scheduler: track GPU active time per entity"")

from Linus' tree.

I can't see any obvious way to fix this up, so I have used teh drm-misc
tree from next-20230331 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/99x8/wsHoIWkJU5fp4LPTfP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQqNvEACgkQAVBC80lX
0GzhMAf/aB3U7EaruCbAPtIg/NZHTMQtKDNx2chmb1w0dByE5gqHB+sXR9ShSHdt
/32R+31qT1mFHUtE5msZb58GIWyEpuvkqnxpOK44q03mojLAuClNQ/jBPkfmFyMZ
jDLeUXGGwU/HoehEBwmdnI2Oc9dkKt13kjqtY6pS0+xuJkcCGqMmvqwk2sYhX1k3
z3ao4YislWMD0E0lELkw9C9ZyHL8uqd7ewE0G9qNqt4igi5IRRQPJ/DpKxlqxnwI
eF622CwUgAOfhL/vlso2DVReSJ1TaXxrX0RRDGnC+hwufCrHaluwlMkUPUAWsx+l
ng5hDhUlXsLP6Ym/Lr2BWf4jtVSZPA==
=X4Ur
-----END PGP SIGNATURE-----

--Sig_/99x8/wsHoIWkJU5fp4LPTfP--
