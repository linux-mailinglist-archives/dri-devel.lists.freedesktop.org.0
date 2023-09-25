Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBA7ACDA3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 03:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A313D10E14D;
	Mon, 25 Sep 2023 01:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DEE10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 01:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1695606096;
 bh=3qefOlEg3x4dwzzWD/jkdN7oH40vPOPDnPJgAYifuiQ=;
 h=Date:From:To:Cc:Subject:From;
 b=X0l3c6dGWJPDd5HdxoQWXlpvWMdaxWBTnexLtUogMmcjGsfQ3nF8xfRByjpifZ03m
 GSA34KCAdtya2EA2QD3qk7Z+ZTz7wD0tq/k57omodgHaAaWewoe/F7O2jmu7fgh9ny
 9QkKXZyG0nSAoSZGHi4SbtCIZTdcBu8vwkm0b7kpQJHaqfQ9O4hDg0vfFW6hAt+Sku
 0klREyor1Wfu2Hhr+ffOuLl8r1sXdyQf7csGsECojMVc/9mSKgDOMhaYuUDB71JLN1
 xZPV8fAtWT+LkN7wnsW319xziwLFWI1nfh5blzWzGI0MrZFw0s3BxWivJptNMc9TUH
 JIsl4iztQVPEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rv5FW5G5tz4xKl;
 Mon, 25 Sep 2023 11:41:35 +1000 (AEST)
Date: Mon, 25 Sep 2023 11:41:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230925114133.7d891b33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RbmAZgHc0GBl.JjN607XT0W";
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
Cc: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RbmAZgHc0GBl.JjN607XT0W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/accel/qaic/qaic_data.c

between commit:

  2d956177b7c9 ("accel/qaic: Fix slicing memory leak")

from Linus' tree and commit:

  217b812364d3 ("accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL")

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

diff --cc drivers/accel/qaic/qaic_data.c
index f4b06792c6f1,c90fa6a430f6..000000000000
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@@ -1018,10 -1031,10 +1031,11 @@@ int qaic_attach_slice_bo_ioctl(struct d
  	if (args->hdr.dir =3D=3D DMA_TO_DEVICE)
  		dma_sync_sgtable_for_cpu(&qdev->pdev->dev, bo->sgt, args->hdr.dir);
 =20
- 	bo->dbc =3D dbc;
+ 	bo->sliced =3D true;
+ 	list_add_tail(&bo->bo_list, &bo->dbc->bo_lists);
  	srcu_read_unlock(&dbc->ch_lock, rcu_id);
- 	drm_gem_object_put(obj);
+ 	mutex_unlock(&bo->lock);
 +	kfree(slice_ent);
  	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
  	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
 =20

--Sig_/RbmAZgHc0GBl.JjN607XT0W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUQ5U0ACgkQAVBC80lX
0GxHdwf+LeLIjLrum0MCeoAcgOiIkJNyqnt2kIi3R2qiQ7bwXAops7rbEYgLpg4b
RUhp/Q0Qt94yjSBvaygiQ3XJeVzm8ctUjv+WgUqCEgaIBWTVXIhlDWsOVU+OvG9m
6/9keitbScPIXPRxaSAkvb/Ch9OrRjQGXtydEe8ZD6GESGTxJhSX/JPw7JBrzl5E
sPWotXsJpIVebKV4YFrDuGszc2P+8vGBRZ0rWz4y7npI8FRJ7pcRnPxTQXWGodcm
lguZntcE++V+uVvkA0I7NNQTizgv369h/6UxM0088O1IGahgOc1LRxxe78AiYoiu
20UStKZDEtfXcu/4658GGVY+APkrGQ==
=o1w0
-----END PGP SIGNATURE-----

--Sig_/RbmAZgHc0GBl.JjN607XT0W--
