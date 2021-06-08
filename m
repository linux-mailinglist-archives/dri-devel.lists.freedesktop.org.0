Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E739EC5C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 04:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F716EA8B;
	Tue,  8 Jun 2021 02:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6EE6EA8B;
 Tue,  8 Jun 2021 02:50:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FzZVf0SyWz9sW6;
 Tue,  8 Jun 2021 12:50:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1623120651;
 bh=DiTGmecdZYHMMtAdC/UcRL7S4kOx9dLsyL3eCfsThzw=;
 h=Date:From:To:Cc:Subject:From;
 b=EbZFANXYGN9AFjHGMwewWEcnIKn6Ghu3VXJEEsKDZEyLJPYPLsF/H2Sk1OXz9n13r
 xTAlKxVOkd4OCn925RiW4qj2h5/i/AJ4gE3GiDMdVDUCUvAkB0CgzKzzTn+H5KxDel
 JT61KpK/O62xU3xW1P4DpL+SW4iZZBrNZj40gzvHAe26MeuLWZtY1u2JD5GYjPBCSE
 7aQk/+DXEkLe5A7sR4kBrq7xthQouzjAo4BPT4eGWPKieIBZtDdUxIs3VuafVfoNmL
 kWvxr/IFaNdcmPcRDVvBgczfuZj+xDWczeG+0SV6rg1gC7tlQJLI+c1/o0QxneQv64
 X0X6gfwjH/6nw==
Date: Tue, 8 Jun 2021 12:50:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20210608125046.07c6deca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HN8jrUNGDvei7eQWFTM0ikT";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HN8jrUNGDvei7eQWFTM0ikT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preemp=
t_mgr_new':
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct ttm_re=
source' has no member named 'mm_node'
   75 |  mem->mm_node =3D NULL;
      |     ^~
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: At top level:
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error: initializati=
on of 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, c=
onst struct ttm_place *, struct ttm_resource **)' from incompatible pointer=
 type 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, c=
onst struct ttm_place *, struct ttm_resource *)' [-Werror=3Dincompatible-po=
inter-types]
  129 |  .alloc =3D amdgpu_preempt_mgr_new,
      |           ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: note: (near initial=
ization for 'amdgpu_preempt_mgr_func.alloc')

Caused by commit

  cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2=
")

from the drm-misc tree interacting with commit

  b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")

from the drm tree.

I don't know how to fix this, so I added the following hack (a better
fix would be nice):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jun 2021 12:41:16 +1000
Subject: [PATCH] hack fix up for needed amdgpu_preempt_mgr_new() fix up

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_preempt_mgr.c
index d607f314cc1b..e1a7b3e967b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -66,14 +66,16 @@ static DEVICE_ATTR_RO(mem_info_preempt_used);
 static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
 				  struct ttm_buffer_object *tbo,
 				  const struct ttm_place *place,
-				  struct ttm_resource *mem)
+				  struct ttm_resource **res)
 {
+#if 0
 	struct amdgpu_preempt_mgr *mgr =3D to_preempt_mgr(man);
=20
 	atomic64_add(mem->num_pages, &mgr->used);
=20
 	mem->mm_node =3D NULL;
 	mem->start =3D AMDGPU_BO_INVALID_OFFSET;
+#endif
 	return 0;
 }
=20
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/HN8jrUNGDvei7eQWFTM0ikT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC+2wYACgkQAVBC80lX
0GwewAf/YdnB2DjDpowhM9Z2I9YaWjY1BfFNOG7wQukpUA7AmIE/X31CbfnKoCO2
0+dh43WnBMPN8oeacSSUlM3AnmR90KJOcuD6fTSolwcduGaHr3BzBaUa7C6/aZBz
ie25b3tZNLlOTfmtz5NBRPehKoyhVNCCjsN/31d4saOQfBQOi6IJyafj1FT1UQdr
L1N9SZayk7WThMlJtFdYznNAvWkceENP6tgtp6Dhfd1ZIlOqa2TrdAch9SDScn5Q
U20aIjVuJNowdpm5KaKQZam+cZcjcvx+heWkeBRU7escFIoCzqDTkdPXHyYapmua
C79HmqkJiW4ryYyOt3wQK7Bv30h1XQ==
=12WW
-----END PGP SIGNATURE-----

--Sig_/HN8jrUNGDvei7eQWFTM0ikT--
