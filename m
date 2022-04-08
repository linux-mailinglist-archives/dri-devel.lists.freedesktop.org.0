Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35974F8BCE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394710E049;
	Fri,  8 Apr 2022 01:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB0B10E049;
 Fri,  8 Apr 2022 01:10:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KZKtD1J46z4xR9;
 Fri,  8 Apr 2022 11:10:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649380213;
 bh=vcX4MhOwVA1LeMEowdgiUTbVi0yZ19UPaE1n3h2j1kw=;
 h=Date:From:To:Cc:Subject:From;
 b=i52oSShQe3jtquwqvSkQtRfQRB+TAxTK+HMdnw+NulpsBx5vSQ0+uiDUBmzEvAOJz
 nUcp09h5YnjxweCJNGzLFIW0fSHJ8e450O6BiYlvkds2H4F6ZS0rOs2Zo8oDp48jLW
 MrI0hySWMhCrvnyeFRQLZ05GQ1GZXeOLAZPmYW38ris+J3wAwSXNPzguYw0W62kyBz
 qJYVjX7W993aGXlQO6gaTct4Z0MjziuNUTfKrxorosCnuV0vrBlv+s3NYzWHqNhKr6
 U2R71crH8fqZNLojGDCoJ5DDfzBH5Vb0Io0YNahky2oMJ8RU0u7hbKFYbFvoVkC04e
 QqPlR4yqvzDhw==
Date: Fri, 8 Apr 2022 11:10:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20220408111010.31a7bc8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.SKFAt/wruZuvWlKvY6mSCm";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.SKFAt/wruZuvWlKvY6mSCm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/drm/drm_gem.h:38,
                 from include/drm/ttm/ttm_bo_api.h:34,
                 from drivers/gpu/drm/i915/i915_deps.c:9:
drivers/gpu/drm/i915/i915_deps.c: In function 'i915_deps_add_resv':
drivers/gpu/drm/i915/i915_deps.c:229:46: error: implicit conversion from 'e=
num <anonymous>' to 'enum dma_resv_usage' [-Werror=3Denum-conversion]
  229 |         dma_resv_for_each_fence(&iter, resv, true, fence) {
      |                                              ^~~~
include/linux/dma-resv.h:297:47: note: in definition of macro 'dma_resv_for=
_each_fence'
  297 |         for (dma_resv_iter_begin(cursor, obj, usage),   \
      |                                               ^~~~~
cc1: all warnings being treated as errors

Caused by commit

  7bc80a5462c3 ("dma-buf: add enum dma_resv_usage v4")

I have used the drm-misc tree from next-20220407 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.SKFAt/wruZuvWlKvY6mSCm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJPi3IACgkQAVBC80lX
0Gz+8Qf/drWgwj9Cac1navOGvFSwgy85VNIXr2xbcebnqAkPxMscSqiuphw7MSx9
/ekATn0qTatU6xvumrw4zz+hg2KmW46knsQKFMEbeLFRDkenq6PVbVL2v4hQnsp+
ADNJ3fV25mc4hK7fkzeGJkIUHtX3RK6bTsgMa+085w6RTo9WCEmPRP6eceWi9FlU
50rW8LXyQXtnh0dgbCa8UNoKUrwdn1+dBCyTW/r6bmBRzSxztkWINpxPmovXmanT
8EiJDCUAHFRoFdoBwK+13CYIhvNGE4Li99CF5/84a74SudmhMKNJbLqkoOxelbe4
kOHDmm0zlXM+1CmZcUbYuZ5cq6W6rQ==
=kY2o
-----END PGP SIGNATURE-----

--Sig_/.SKFAt/wruZuvWlKvY6mSCm--
