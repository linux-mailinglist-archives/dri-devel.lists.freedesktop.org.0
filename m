Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C3EA9E68A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 05:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F1E10E0F5;
	Mon, 28 Apr 2025 03:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kd6k1BOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDE10E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 03:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1745811015;
 bh=jVsaLEXMNvidpLj40+o8rBlX0uwUjWHgmyDQFjNXlMI=;
 h=Date:From:To:Cc:Subject:From;
 b=kd6k1BOwa61cmlciiPYmM6pN5yRqfo+mp5qaCkWAQMzTzfa7DQBpUafIwraXz5flX
 MBIJprT0sKJtg4DqDrPmxbfreDAT0DKDKmMi+GgWWK4YbZ0l23rlyFo1QShfPPfg/E
 by3vnNN7vXKh9n+tQnKLRWX0MQRqej/kLgLj2VL++DKPlu91stKVNDOUDuD2oZ8ewp
 qlNPaIWUShf4jkJOaRYizzV8dsb29qf70bGqgrhXInYalUtHQNcZfWpCUnI3129New
 S/xQ+VqydPn9VBQ9CZKZpRRVj2umbNdKhYPIXpwIgaiBy1X8J1zi/cb1crlFvZLicf
 6FAmiNOFYOucA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm88k3gypz4wbb;
 Mon, 28 Apr 2025 13:30:14 +1000 (AEST)
Date: Mon, 28 Apr 2025 13:30:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20250428133013.5ad6b6b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ";
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

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/xe/xe_bo.c:3118:
drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to functi=
on 'xe_bo_evict'
   63 |         ret =3D xe_bo_evict(bo, true);
      |               ^~~~~~~~~~~
drivers/gpu/drm/xe/xe_bo.c:2939:5: note: declared here
 2939 | int xe_bo_evict(struct xe_bo *bo)
      |     ^~~~~~~~~~~

Caused by commit

  55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")

I have used the drm tree from next-20250424 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgO9kUACgkQAVBC80lX
0GyAnggAmHLlVC9qQysUQOD+ukgNvCJLzL3FXgmP2knj7KjKvyCQWOyErdEN3Jv9
6wrIetk12gRZ3mSzPtS1bhN5/s1l/a3CPaG7bXFUaTbwffTDetIA+gPWnDJJHaCb
eCVbVD+qM0lPWIMBJALxexRimirVBoAesxq+2CFO9bl3gUQo7Gg2eSbP5tUHLIfP
kUgUtSV6/MhlrqcRglU5TsyQI4LeU/XaxzTpAg36x4reRnJxKmV6soxDx7KmoteH
le3nYh2VZ6nCObeq9zs7AeZCeoLWFYHKqxX4Rjjis/L0sxeHXEXCa3IFyqM/I5oL
HgKeB1QmTqZoDVtp4n2/6WSISwZ0QQ==
=HIGf
-----END PGP SIGNATURE-----

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ--
