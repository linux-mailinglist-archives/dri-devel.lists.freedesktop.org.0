Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A4DB04F8E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A6710E4FB;
	Tue, 15 Jul 2025 03:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C/yHqu7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6984E10E14C;
 Tue, 15 Jul 2025 03:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1752551605;
 bh=OhkOOt47JdseESe8RK+r92ft58pVEWn8H3iWaphyf04=;
 h=Date:From:To:Cc:Subject:From;
 b=C/yHqu7TQClDILJRuopUj0lV5SND1q4boALGG009VnV4wVTUJQZcQl8czC1U4cyV9
 ZNJ9k6A2gyj7XS0S0luesogKicHjZWfMLQGPsiFBHAvsX2HVW0slav58/yroynfx0e
 GW5zvr41afhK7ySVf2rRK9dmM80RvebBvagye01Q2+J3EuUUEoYEIgT1m4udI0Nu82
 paj8E/dDJBeDuKsFodQTOByNQ4Ns/L9xP88XtYRDwqvjCweWq32hvKJCV/heAtDbzf
 65cH0XLbwn9W7PmPrQNcQz4QVJYh2khP5ozZGj4khZcwFVlJnmeu6Vkp4BR4dTBvm1
 B6sqgzJCnSPfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh4zS58qKz4wb0;
 Tue, 15 Jul 2025 13:53:24 +1000 (AEST)
Date: Tue, 15 Jul 2025 13:55:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250715135511.63774cdb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6YDZpzCLRnEVVi85ze/GKj";
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

--Sig_/E6YDZpzCLRnEVVi85ze/GKj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c: In function 'ge_b=
850v3_lvds_detect':
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:145:16: error: too=
 few arguments to function 'ge_b850v3_lvds_bridge_detect'
  145 |         return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->br=
idge);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:124:1: note: decla=
red here
  124 | ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge, struct drm_=
connector *connector)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:146:1: error: cont=
rol reaches end of non-void function [-Werror=3Dreturn-type]
  146 | }
      | ^

Caused by commit

  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")

I have used the drm-misc tree from next-20250714 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/E6YDZpzCLRnEVVi85ze/GKj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh10R8ACgkQAVBC80lX
0GyjQAf+LeKu6+Iw/kgHxqZHyhgEEw9F5xWJ/3rp6/wQ/bSZmbx9RXWn1+DZUxpN
Y1L6Z6T7xeZh+ffh8w2nkPSJg4v9P5704xktvrSyrxStslr3k7gsdgdJdwYKeWYO
wX/25ahNKL7ZYWF8VGN6XpRylrW2G3amaurfISOdJuLuuh62TdCoXg3Ht45DCEK3
lhJY1/u69DnpAJ9wJmrKwnjOjII46WisxOZtiN5d5L5hcfDRRArGxBAxTQavon8g
LsE22IWmAoty9MoZlX2AAkSPQhGnJW7t+dawz5Gvfv5OQj8ahQxytTwOyrc2eFYK
TzBdyj2xcg05yfiBSZjJGV1dlIwQzw==
=845W
-----END PGP SIGNATURE-----

--Sig_/E6YDZpzCLRnEVVi85ze/GKj--
