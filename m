Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6964BEFE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 23:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5710E1FC;
	Tue, 13 Dec 2022 22:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (unknown [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03210E1F6;
 Tue, 13 Dec 2022 22:00:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NWsrC2Dlkz4xYQ;
 Wed, 14 Dec 2022 09:00:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1670968844;
 bh=dnKDY1oXjcC0Tv/ElhCbaTcvHEJsm3IIOdeK96sWOaY=;
 h=Date:From:To:Cc:Subject:From;
 b=KOjC+qxk0SniGC3699LJGn3Mg13cGc6AbZqjHItVe0afRcsZhGlepkXm823jdSow3
 fxDbJxNyhhACD9dP+5wteSajpQeL4k2s1CPW2IPz8c3ss2A1VrA+67Lt9qpIoyDqal
 HmD7qTWzBAQXGL7kMDaaLDMuSSBcT8erlr39fryDQcqWma+kPbPqoj0m9uiSWWeSPK
 gZtzXJwFRZUpKeLryTkoQ3DKE4IsWd2iwiJ4wdo5Yo+Mj0f2csW+0lmYao+19FAhME
 7s8OUbl+9wwmHuxBc/gm/KmpMek204qf5H4Id/wkIdjU1eZFc2k+XqoWuhPx7TdC4L
 C078cxdVu37Dw==
Date: Wed, 14 Dec 2022 09:00:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm-misc-fixes tree with Linus' tree
Message-ID: <20221214090042.1da0da04@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yyb61wh00qLWsTl=2x39==M";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Yyb61wh00qLWsTl=2x39==M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/dma-buf/dma-buf.c

between commit:

  28743e25fa1c ("dma-buf: Remove obsoleted internal lock")

from Linus' tree and commit:

  f728a5ea27c9 ("dma-buf: fix dma_buf_export init order v2")

from the drm-misc-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma-buf/dma-buf.c
index b6c36914e7c6,eb6b59363c4f..000000000000
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@@ -658,23 -655,24 +660,23 @@@ struct dma_buf *dma_buf_export(const st
  	init_waitqueue_head(&dmabuf->poll);
  	dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
  	dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
 -	mutex_init(&dmabuf->lock);
+ 	INIT_LIST_HEAD(&dmabuf->attachments);
 =20
  	if (!resv) {
- 		resv =3D (struct dma_resv *)&dmabuf[1];
- 		dma_resv_init(resv);
+ 		dmabuf->resv =3D (struct dma_resv *)&dmabuf[1];
+ 		dma_resv_init(dmabuf->resv);
+ 	} else {
+ 		dmabuf->resv =3D resv;
  	}
- 	dmabuf->resv =3D resv;
 =20
- 	file =3D dma_buf_getfile(dmabuf, exp_info->flags);
- 	if (IS_ERR(file)) {
- 		ret =3D PTR_ERR(file);
+ 	ret =3D dma_buf_stats_setup(dmabuf, file);
+ 	if (ret)
  		goto err_dmabuf;
- 	}
 =20
+ 	file->private_data =3D dmabuf;
+ 	file->f_path.dentry->d_fsdata =3D dmabuf;
  	dmabuf->file =3D file;
 =20
- 	INIT_LIST_HEAD(&dmabuf->attachments);
-=20
  	mutex_lock(&db_list.lock);
  	list_add(&dmabuf->list_node, &db_list.head);
  	mutex_unlock(&db_list.lock);

--Sig_/Yyb61wh00qLWsTl=2x39==M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOY9goACgkQAVBC80lX
0GxE4wf/YfEkxbiaehvNd37ZMtx4/2ICMz4VIuMhpjRmPrbP99hv6PHome3nja0A
4ZVm0zvHSQmrDzNEMQnONhqqZ1kxc9WW5/6Nz0yos/mUUCnAxv6TiadvmxSpOivL
uV2KW/dorfwLYkmjkycrCq/YYBN9boB3eTShqyBAY/cx4XWc7+klNd0uv+IuNgxN
/HMZAv2m6C8Lb5W4HbUhUKp99xKRh4Wf08tZu8Gxe8MDwMA4xP/gW3ZBj6EflRT0
MFm+yvyf3Fmpb8zFAAY+b4tnUyGakJDiX8OX+o4Djtu4jIf40IFE/8ZmcmCQ+B2V
XWVlge0T8cQ+WrnZ3cXQE+sMhqTacQ==
=fKvB
-----END PGP SIGNATURE-----

--Sig_/Yyb61wh00qLWsTl=2x39==M--
