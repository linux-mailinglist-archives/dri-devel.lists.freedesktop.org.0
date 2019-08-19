Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCD91B6F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 05:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691716E08C;
	Mon, 19 Aug 2019 03:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97526E08A;
 Mon, 19 Aug 2019 03:19:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46BfKG0rpHz9sMr;
 Mon, 19 Aug 2019 13:18:57 +1000 (AEST)
Date: Mon, 19 Aug 2019 13:18:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20190819131856.68011dc5@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566184741;
 bh=OTrmXf0uOG0N7D6X7l9rKsQkO1sx2kT2BAzJVGYG2wE=;
 h=Date:From:To:Cc:Subject:From;
 b=HHrKn+MhkE3vkrpJ7/YEyrwSmN79jYmc6PRcesSlI/yUMawmQTs/o+Rzhy9Yn3adf
 7W8vNUCI7leFnsxcqvB3y3q7qoAvHlWcFKs2YBSWZgv+MGznkHrnkg4UmYUluV9AZP
 2kpd8ZetSGvVTD+GclIphNbLczS0s0Je0plMdHKRRdYVJYD8X06KIvaTbjO8wJyIxb
 Gg7ufTnRlcXZ32+7DRIH50Qw/u+uWeQNJVZFsiogew8fKGVhwrWOfGvvPo4td/ijFu
 qdaXlBXL8urgCoVmiNlPBqIPpQ2fkJqO546S5AWzJP2fLIbaxxHi+v9QMGSdzPWp+N
 FvK+2ulfJkhzA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1212979353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1212979353==
Content-Type: multipart/signed; boundary="Sig_/FOF.KFeJWSV=W1SNSHyzZ.S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c

between commit:

  a0a63940b0c9 ("drm/vmwgfx: Assign eviction priorities to resources")

from the drm tree and commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 2eb3532e3291,0b5472450633..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@@ -33,36 -34,6 +33,36 @@@
 =20
  #define VMW_RES_EVICT_ERR_COUNT 10
 =20
 +/**
 + * vmw_resource_mob_attach - Mark a resource as attached to its backing m=
ob
 + * @res: The resource
 + */
 +void vmw_resource_mob_attach(struct vmw_resource *res)
 +{
 +	struct vmw_buffer_object *backup =3D res->backup;
 +
- 	reservation_object_assert_held(backup->base.base.resv);
++	dma_resv_assert_held(backup->base.base.resv);
 +	res->used_prio =3D (res->res_dirty) ? res->func->dirty_prio :
 +		res->func->prio;
 +	list_add_tail(&res->mob_head, &backup->res_list);
 +	vmw_bo_prio_add(backup, res->used_prio);
 +}
 +
 +/**
 + * vmw_resource_mob_detach - Mark a resource as detached from its backing=
 mob
 + * @res: The resource
 + */
 +void vmw_resource_mob_detach(struct vmw_resource *res)
 +{
 +	struct vmw_buffer_object *backup =3D res->backup;
 +
- 	reservation_object_assert_held(backup->base.base.resv);
++	dma_resv_assert_held(backup->base.base.resv);
 +	if (vmw_resource_mob_attached(res)) {
 +		list_del_init(&res->mob_head);
 +		vmw_bo_prio_del(backup, res->used_prio);
 +	}
 +}
 +
  struct vmw_resource *vmw_resource_reference(struct vmw_resource *res)
  {
  	kref_get(&res->kref);

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aFSAACgkQAVBC80lX
0Gyqdwf+Ps+56/U2wj4nXp8BIBq51rBPto7+yYUVy6oGFN9KkGsRaF4eDrY+MWu0
Z8XjwTLLXa4NrdfKVa/QAyFWr8IzZ57deJBdDwn5G0PH02R+zJZuW1RNhWry2jkS
D5QgBnOgkH4hx4swMcQXsAbgr8H9YnAxFo6qbYWLvjYiYEhISZkSNhAp0xz0IkJE
6IJ4hlwhhkByh8zArCHARhJKSSB/2VBLIF+E8eKVAjP2iQD2i4NMxmCRaIem1s0j
kBbOovVAywYVJxnctrmYqYuzweU8iEG4HniAobFhFPWtSWKAmNxH8ubKgQ+eVrl9
tAbZ2FYg3EhNUxW7nOCtx1TGWYzzRw==
=ujGK
-----END PGP SIGNATURE-----

--Sig_/FOF.KFeJWSV=W1SNSHyzZ.S--

--===============1212979353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1212979353==--
