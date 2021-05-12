Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB137B539
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 07:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5876E02B;
	Wed, 12 May 2021 05:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F596E02B;
 Wed, 12 May 2021 05:00:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg2fL143zz9sWX;
 Wed, 12 May 2021 15:00:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620795611;
 bh=QUroELMBcg2yl0c8Ocr3GIPaSGOYYWLIChZdl8QSxTc=;
 h=Date:From:To:Cc:Subject:From;
 b=b14pM2A1SRpKW0kl9mTkAQZd6+AnoKrF0R9QjS2bsiDAhKgiDi7YPorLWiwLWjB6E
 LoIpgAkWjdSi6EacTMXczcAoEztkxFPAZAYMzmwm+mLnvXxtqj13a3ff9uXPz90G1m
 cqlP3ClFyzARQOsPH5U8I3gvQSS95Ev3PN5dPD5/QCtFqQuZtwcALY/fmGdc6KMN/M
 2COUpgzI0bd9GZxZu4brbjkrssTk4KqFVeSjbRipVAZ3oFq8w5KZnej6883sniTnrH
 m2710bNFD3eL18wQjgIKKWv2nCwK8YouLTwLHdptOOSNxvleEg9MUryWRyrcpa5wTk
 +E6pY+JiGNeSQ==
Date: Wed, 12 May 2021 15:00:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210512150008.52f92c26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Z92Gv.P.iwuhI+YMz0./pR";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6Z92Gv.P.iwuhI+YMz0./pR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/nouveau/nouveau_connector.c: In function 'nouveau_connector=
_of_detect':
drivers/gpu/drm/nouveau/nouveau_connector.c:463:59: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
  463 |  struct device_node *cn, *dn =3D pci_device_to_OF_node(dev->pdev);
      |                                                           ^~~~
      |                                                           dev

Caused by commit

  b347e04452ff ("drm: Remove pdev field from struct drm_device")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6Z92Gv.P.iwuhI+YMz0./pR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbYNgACgkQAVBC80lX
0GyESgf/T07rjtpKJQjtzWk/qYdBRCC+Q8ax5RfJORk8UpqNlJqy9ZGe1FPXkn1D
wJdnx9eI8J19CgueHZWJP57lp754E0NCC9Y7rG1nfqzY5JJIKRnw8kL7oJRGItQ/
hbddLG4ddkG5bo73Z0xxDOFy8yINUsQmt0uy/tuK28fqOqVjaFU1WyBbrb5Gb3qG
26nM90fBzqbnsO8Tz5Z8xA/DBSTJGM6ame7m1qvQ2w0/U9QhkWSEjhE50/niZWtC
nJqdajEDtDCCKzn/9W2uV//+q9+pxYykTHBuBmbn9u06SdxmgsV24398P9Ni6tdl
jZ+NeX33AlOhXTSdre1aAATiOjuljg==
=uEFp
-----END PGP SIGNATURE-----

--Sig_/6Z92Gv.P.iwuhI+YMz0./pR--
