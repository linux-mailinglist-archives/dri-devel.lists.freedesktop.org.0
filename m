Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E60E5BABE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 13:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5189A4E;
	Mon,  1 Jul 2019 11:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5A489A4E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 11:33:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45clc33R99z9sPM;
 Mon,  1 Jul 2019 21:33:07 +1000 (AEST)
Date: Mon, 1 Jul 2019 21:33:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the hmm tree
Message-ID: <20190701213304.34eeaef8@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1561980789;
 bh=C8KL78jLCoDFJ1Bb+OIqrAImaLk0QK9iv7sc8TkvVx0=;
 h=Date:From:To:Cc:Subject:From;
 b=gTyP6v2/8pcb2Dz3UJFcp7ZuSvKfY+fzxNdReNZr6bfbHRMlvSjTRIkwx1XFIRVpk
 kdonvaUwJZaimvau5BLDhDCMFRYQhqQyMMfZGc9hT2fHIBhJTwQaeF0dG0zMPkxlb/
 8/99N7Ex8jVNArXN+/ZVweaYPJoC5yAAqzQmxFfX7Yccta/5ZpyJlRwlW5SXa78Vvz
 uFXzwmqJcJ0MMFeogb4gPhFarPCLQSNY37MLnLZzdj592v9DBedYIYhUqSkLDtQJfG
 QY6i218xlHBAgaH1z675EG8Hih4GTLBj+zIEzfjUNthZPK+woBDQ4pEspbE96SK7SD
 2Np5CgOksel/g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0233149506=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0233149506==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.ggz7+WEN9pPwWsG36IPyVN"; protocol="application/pgp-signature"

--Sig_/.ggz7+WEN9pPwWsG36IPyVN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

mm/hmm.c: In function 'hmm_get_or_create':
mm/hmm.c:50:2: error: implicit declaration of function 'lockdep_assert_held=
_exclusive'; did you mean 'lockdep_assert_held_once'? [-Werror=3Dimplicit-f=
unction-declaration]
  lockdep_assert_held_exclusive(&mm->mmap_sem);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  lockdep_assert_held_once
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_ttm_tt_get_use=
r_pages':
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:778:28: error: passing argument 2 o=
f 'hmm_range_register' from incompatible pointer type [-Werror=3Dincompatib=
le-pointer-types]
  hmm_range_register(range, mm, start,
                            ^~
In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:35:
include/linux/hmm.h:464:29: note: expected 'struct hmm_mirror *' but argume=
nt is of type 'struct mm_struct *'
          struct hmm_mirror *mirror,
          ~~~~~~~~~~~~~~~~~~~^~~~~~

Caused by commit

  e36acfe6c86d ("mm/hmm: Use hmm_mirror not mm as an argument for hmm_range=
_register")

interacting with commit

  66c45500bfdc ("drm/amdgpu: use new HMM APIs and helpers")

from the drm tree.

All I could do for now was to mark the AMDGPU driver broken.  Please
submit a merge for for me (and later Linus) to use.

--=20
Cheers,
Stephen Rothwell

--Sig_/.ggz7+WEN9pPwWsG36IPyVN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0Z73AACgkQAVBC80lX
0GxpLQf+LMHL2mWfHS5YvdE3KHF60hv56K27v0dIs3yDycw9f5yhztFHHogleIUr
xpVg9DRfLoUlPtCRzP05CWFSGp24bbDsTl+EQrk+sfNbmRmDkWo7zeFd4DUdhe2e
MgT9FqipJnbFqXSwpyZzstUa8CdnxlRUOZdlJIwqgdRX4u4g+hlE+45YjmE009pV
lRES1OjZED4t4QcfxQjCNFuLlUoZm+CgppPcp4x+KovYEYSl1iHThGlVYMkbqb1C
o6LY8LdBK+D1PHpVr23ODTpFL4n25jI8YgQwk/1a8B063GhNz362+oyG3oWY9y7G
LZC8K+Xam6sbTcaDrUrNrh7ydo5Zww==
=hKxP
-----END PGP SIGNATURE-----

--Sig_/.ggz7+WEN9pPwWsG36IPyVN--

--===============0233149506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0233149506==--
