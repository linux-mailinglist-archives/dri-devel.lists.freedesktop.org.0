Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3C1513FEC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 03:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624D110E721;
	Fri, 29 Apr 2022 01:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700610E721
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:03:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KqDkp6DzMz4xLb;
 Fri, 29 Apr 2022 11:03:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1651194212;
 bh=xo1K2yhVNcgqOXprCRsSenw+oPXTxS/DnUeEiRmb6Rw=;
 h=Date:From:To:Cc:Subject:From;
 b=i5aBr1flOKZzH+G5Q1/erhaYZaSb2KKccduJM5dJAkP00PFpPC5w3C684D3tduHOS
 zmp5E8A4KAXZRqPonwiTtH63EU25+FZ34V1voTHJt0tY+bweUnY7JYT5NYL4iZAtqD
 l95MA/dJJF74Q5TVFjXkYhVJ64LwUSe6jm1vWu8cZa6ZvEWDon7wihT6e1dNT+jQaQ
 hxKKfoWeG1jMVTus8CeWl/2nUEAvvI5AgcAv8quyCvXOs1WbVv7lmUYx+27NF/kqNr
 T8SgklxIDxssBG+Ym5EkGeB5tDf0k1xSmtWPIajP9QBt/8G542kVhS7M9WqwYJBAdb
 CPNvccwanrFNQ==
Date: Fri, 29 Apr 2022 11:03:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20220429110329.79f6b628@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_ZRu82WkLRPVC.nC+GhUmxt";
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_ZRu82WkLRPVC.nC+GhUmxt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

between commit:

  047a1b877ed4 ("dma-buf & drm/amdgpu: remove dma_resv workaround")

from the drm tree and commit:

  3da2c38231a4 ("drm/amdgpu: Free user pages if amdgpu_cs_parser_bos failed=
")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 01853431249d,67bd506fa141..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@@ -636,9 -642,26 +636,21 @@@ static int amdgpu_cs_parser_bos(struct=20
  	}
 =20
  error_validate:
 -	if (r) {
 -		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 -			dma_fence_chain_free(e->chain);
 -			e->chain =3D NULL;
 -		}
 +	if (r)
  		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
- out:
 -	}
+=20
+ out_free_user_pages:
+ 	if (r) {
+ 		amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+ 			struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
+=20
+ 			if (!e->user_pages)
+ 				continue;
+ 			amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
+ 			kvfree(e->user_pages);
+ 			e->user_pages =3D NULL;
+ 		}
+ 	}
  	return r;
  }
 =20

--Sig_/_ZRu82WkLRPVC.nC+GhUmxt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJrOWEACgkQAVBC80lX
0GyGKAf/ehT5fosMx9Vc4L1ZZG/fp3A3g1odV2zqD7lEc9m4qTzdzYK6klwEr3qa
qljZB5lzWiFHcqELkbYLrIAreffkoVamMTyilcsZSYDynFmh06TQx5qCxkYobffQ
Vjvl6Pqn4CqAjOJ7s9SlgR4cm5Bqv/PrgudjQLJFyTwxTsLt+Cc2I0h7ax1QxQvq
a/0gLli9LgcFyTth5PfhvzSkN4irJHubZBQAcQ1qgla0St1el0qfHcUPxP1VxTTC
mSag4rMy/Vji4ZFxGfVBn6OfQtghu7ev7T3oBD6DS1sAjupiVHh0/XDRhILKvI3m
5KaSAH4XKKi1YLadEePyc1H6ycFa5Q==
=+m8V
-----END PGP SIGNATURE-----

--Sig_/_ZRu82WkLRPVC.nC+GhUmxt--
