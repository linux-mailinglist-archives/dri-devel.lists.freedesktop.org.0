Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A982C7D35C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18256E32E;
	Thu,  1 Aug 2019 02:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C5D6E32E;
 Thu,  1 Aug 2019 02:30:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45zZ596mjNz9sBF;
 Thu,  1 Aug 2019 12:30:04 +1000 (AEST)
Date: Thu, 1 Aug 2019 12:30:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20190801123004.2aa5c658@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1564626608;
 bh=F6yYrwA8wrWGh9l/at9G7REoMS60ygdsyKPlul1m6gI=;
 h=Date:From:To:Cc:Subject:From;
 b=QaZhCL+WBLqKyRiIv9LmrKpl6lnFiNtDPMGJjUMSdtQB5AlMbdwTBaGZToKG2k1KZ
 TaJr26TJisLqZUDxc8IkpNs1ba5SnN7mTN/ImIzh6uDuOIWVMVZyIdfO4Eg8KB/Axf
 ElH6m8mo/b5MTfuEAxx/4m3d/uo2O4ynHbto1kTGnzgnFdH11dj/DrebsXuz/9PYNP
 B8nKHzGj9g7aeu30cMPwOijKPeQDMUtwSPPjLp1IbiKtRGDbWby9nFPRyKdS87NSYE
 89+ZD7dRbn/ljDySH7NtC4YKAH7ANEkUs5mwRRzQLNzl2lQpjfps7656qoOZiMxceu
 HJmQNdoVeUHeQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: multipart/mixed; boundary="===============1875799226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1875799226==
Content-Type: multipart/signed; boundary="Sig_/1rIQwGsme1TfqSXECl9f2.Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1rIQwGsme1TfqSXECl9f2.Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/radeon/radeon_connectors.c: In function 'radeon_add_legacy_=
connector':
drivers/gpu/drm/radeon/radeon_connectors.c:2433:5: error: 'ddc' undeclared =
(first use in this function)
     ddc =3D &radeon_connector->ddc_bus->adapter;
     ^~~
drivers/gpu/drm/radeon/radeon_connectors.c:2433:5: note: each undeclared id=
entifier is reported only once for each function it appears in

Caused by commit

  bed7a2182de6 ("drm/radeon: Provide ddc symlink in connector sysfs directo=
ry")

I have used the drm-misc tree from next-20190731 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1rIQwGsme1TfqSXECl9f2.Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1CTqwACgkQAVBC80lX
0GwQFwf/bkQ4sQR7J6NB16AEgGu/p2R8lXhPjZa2XtdZY+zrfKDcD1fhlriYJaIf
ZalH+q0oPJmGm53OhaeLMmTVF0lOWEoEtVZFto+YEtoqTILgMwRu47dXhanM4iJT
qxe0Rq8haX/zCypvqrFMTStQmOzg0AZcRKYPWtvnrQBFx6PGwpr6A94ajjxIbW0o
FMyXrW2deieI0Gx8PLD/Z3q29V30fKNcxVoHMCyLsvQaItqnTwYJTKR/iLDioaAM
wSPsUMpNGDPTOWPe2+gItHWQTGDFua9tJB/iglf28rOi8rZSEFUuhlclg5fV97Ti
GGXVLs46KPRtNUXiKaBdZVDkwtgegg==
=2y3a
-----END PGP SIGNATURE-----

--Sig_/1rIQwGsme1TfqSXECl9f2.Z--

--===============1875799226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1875799226==--
