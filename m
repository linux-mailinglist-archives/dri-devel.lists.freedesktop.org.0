Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92E40F2EB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 09:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB946EC07;
	Fri, 17 Sep 2021 07:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38136EC07;
 Fri, 17 Sep 2021 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631862598;
 bh=bp0ZUgxCQhZbRnxIHPQI96iWY/FZMiRUNVypU7TLoCE=;
 h=Date:From:To:Cc:Subject:From;
 b=iFXX8Rq0LD9Ebq6aGKM2Eqb/JrL4epmgtLmA8mPndCRIJNsC1o1HlLZEbU++LacWi
 PxsU5/2vdAkqjmzcTfHbeOoPc88kwJxbo0lFkgIf6JrARzJfKG8c5huL2+AHclw+0Z
 in7JBPNB9VXKAyDOWkZmXZ0QRk437VmpzjPOiqt2RYBcU3gOEKSJqul7CCLNrLvJyL
 WO98I/3Oacmp6aQi5YDmc37JnEZ7iwZ0KFt6aAHhe5clJvlrVENhDNX5j26tqofyJN
 9iDk7maTLlrSfAl+OyUIUbj+/BII5UT2DR4Mcm0qL7U9prEF5eQ+IcyHCfc1OAiLB6
 kzBCIZPYgrLRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9lT116S1z9sW4;
 Fri, 17 Sep 2021 17:09:55 +1000 (AEST)
Date: Fri, 17 Sep 2021 17:09:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210917170953.19d0177f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DbFq18WWwwrtySTT.BPm7f_";
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

--Sig_/DbFq18WWwwrtySTT.BPm7f_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
modules_install) failed like this:

depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
depmod: ERROR: Cycle detected: cec
depmod: ERROR: Found 2 modules in dependency cycles!

Caused by commit

  87ea95808d53 ("drm/bridge: Add a function to abstract away panels")

I have reverted these commits for today:

  a43dd76bacd0 ("drm/vc4: dsi: Switch to devm_drm_of_get_bridge")
  0caddbbfdfa2 ("drm/vc4: dpi: Switch to devm_drm_of_get_bridge")
  87ea95808d53 ("drm/bridge: Add a function to abstract away panels")

--=20
Cheers,
Stephen Rothwell

--Sig_/DbFq18WWwwrtySTT.BPm7f_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFEP0EACgkQAVBC80lX
0GzMtwf/cTt3xaEfQHZ7JsDX0+AwM/sYl4xNWtaU6fKrZi000GsPNbxx7xZSz7K7
5kW0VIM76nkMzTpV6y4midx25Tzgp8vMUnkbuiGUkHApIBRCNgCvRyweg0PsQFhS
jMVqc4UNxv4V+1OzC5PGXiEOhpLmYyPCGex5lyvibykvDUJ4F//brQKmKYTfkW3Y
6SukkK+u4M+e21vBNryrPcM4OJykoLh3kZgKrsM9DSpoAq3AZoYYTQOV7jbWC/MN
qn6+NoiQjraPIVRBrYa/mUHb6dGpeC9pwllOST9ijOMxrQ+zZpDj9aDJfFyJv7Yd
QrY/kuu4R7rtsriQNyuKy8f+jUKSWA==
=esFv
-----END PGP SIGNATURE-----

--Sig_/DbFq18WWwwrtySTT.BPm7f_--
