Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B992FDEBD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 02:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D76E4B6;
	Thu, 21 Jan 2021 01:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662B6E4B0;
 Thu, 21 Jan 2021 01:24:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLl6M0M08z9sW1;
 Thu, 21 Jan 2021 12:24:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1611192251;
 bh=fJgsWSD+vSfoKKK5J0FULDzWwW0DmcDHglLGMSyXTz0=;
 h=Date:From:To:Cc:Subject:From;
 b=EKdThzj1fPxTC6h7erGvYI5qiJtbo774JaJyuVjY5dBJui2qZul7b1op6hVZndj0O
 ooQ6yp8pTjyaNJ6/IVzZxCvo+yE1Mn17UfLBZ76uOhO1NTeceNabumaj4z3KmT7H6s
 YhO/gWSrsi++Ct24PiRcKgpMCLELaDQLqIWAa+O67MPV5ZUrsBLpzjny17/ioVb3Jz
 9G+MadsR4BHT0grN8hliYqA+6PqqweiCYd7CxIBMj1rjhAyD1qiYU2fAsxQisZkxmr
 Ko2eS+bOP9PooY+RcE7OPjtB79BCju/L3Bi3fG6GDOZtO9wwwDrBfgheq1BQ4LcLlh
 MLUkamtJ7RLMA==
Date: Thu, 21 Jan 2021 12:24:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20210121122410.1b804d28@canb.auug.org.au>
MIME-Version: 1.0
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1065572929=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1065572929==
Content-Type: multipart/signed; boundary="Sig_/oXO+eC.o1Sp6EZP+P.ON6IT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oXO+eC.o1Sp6EZP+P.ON6IT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/ttm/ttm_pool.c

between commit:

  bb52cb0dec8d ("drm/ttm: make the pool shrinker lock a mutex")

from Linus' tree and commits:

  ba051901d10f ("drm/ttm: add a debugfs file for the global page pools")
  f987c9e0f537 ("drm/ttm: optimize ttm pool shrinker a bit")

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

diff --cc drivers/gpu/drm/ttm/ttm_pool.c
index 11e0313db0ea,e0617717113f..000000000000
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@@ -503,11 -505,14 +506,13 @@@ void ttm_pool_init(struct ttm_pool *poo
  	pool->use_dma_alloc =3D use_dma_alloc;
  	pool->use_dma32 =3D use_dma32;
 =20
- 	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
- 		for (j =3D 0; j < MAX_ORDER; ++j)
- 			ttm_pool_type_init(&pool->caching[i].orders[j],
- 					   pool, i, j);
+ 	if (use_dma_alloc) {
+ 		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
+ 			for (j =3D 0; j < MAX_ORDER; ++j)
+ 				ttm_pool_type_init(&pool->caching[i].orders[j],
+ 						   pool, i, j);
+ 	}
  }
 -EXPORT_SYMBOL(ttm_pool_init);
 =20
  /**
   * ttm_pool_fini - Cleanup a pool
@@@ -521,9 -526,34 +526,33 @@@ void ttm_pool_fini(struct ttm_pool *poo
  {
  	unsigned int i, j;
 =20
- 	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
- 		for (j =3D 0; j < MAX_ORDER; ++j)
- 			ttm_pool_type_fini(&pool->caching[i].orders[j]);
+ 	if (pool->use_dma_alloc) {
+ 		for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
+ 			for (j =3D 0; j < MAX_ORDER; ++j)
+ 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
+ 	}
+ }
 -EXPORT_SYMBOL(ttm_pool_fini);
+=20
+ /* As long as pages are available make sure to release at least one */
+ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
+ 					    struct shrink_control *sc)
+ {
+ 	unsigned long num_freed =3D 0;
+=20
+ 	do
+ 		num_freed +=3D ttm_pool_shrink();
+ 	while (!num_freed && atomic_long_read(&allocated_pages));
+=20
+ 	return num_freed;
+ }
+=20
+ /* Return the number of pages available or SHRINK_EMPTY if we have none */
+ static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
+ 					     struct shrink_control *sc)
+ {
+ 	unsigned long num_pages =3D atomic_long_read(&allocated_pages);
+=20
+ 	return num_pages ? num_pages : SHRINK_EMPTY;
  }
 =20
  #ifdef CONFIG_DEBUG_FS
@@@ -553,6 -594,35 +593,35 @@@ static void ttm_pool_debugfs_orders(str
  	seq_puts(m, "\n");
  }
 =20
+ /* Dump the total amount of allocated pages */
+ static void ttm_pool_debugfs_footer(struct seq_file *m)
+ {
+ 	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
+ 		   atomic_long_read(&allocated_pages), page_pool_size);
+ }
+=20
+ /* Dump the information for the global pools */
+ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
+ {
+ 	ttm_pool_debugfs_header(m);
+=20
 -	spin_lock(&shrinker_lock);
++	mutex_lock(&shrinker_lock);
+ 	seq_puts(m, "wc\t:");
+ 	ttm_pool_debugfs_orders(global_write_combined, m);
+ 	seq_puts(m, "uc\t:");
+ 	ttm_pool_debugfs_orders(global_uncached, m);
+ 	seq_puts(m, "wc 32\t:");
+ 	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
+ 	seq_puts(m, "uc 32\t:");
+ 	ttm_pool_debugfs_orders(global_dma32_uncached, m);
 -	spin_unlock(&shrinker_lock);
++	mutex_unlock(&shrinker_lock);
+=20
+ 	ttm_pool_debugfs_footer(m);
+=20
+ 	return 0;
+ }
+ DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_globals);
+=20
  /**
   * ttm_pool_debugfs - Debugfs dump function for a pool
   *
@@@ -565,23 -635,14 +634,14 @@@ int ttm_pool_debugfs(struct ttm_pool *p
  {
  	unsigned int i;
 =20
- 	mutex_lock(&shrinker_lock);
-=20
- 	seq_puts(m, "\t ");
- 	for (i =3D 0; i < MAX_ORDER; ++i)
- 		seq_printf(m, " ---%2u---", i);
- 	seq_puts(m, "\n");
-=20
- 	seq_puts(m, "wc\t:");
- 	ttm_pool_debugfs_orders(global_write_combined, m);
- 	seq_puts(m, "uc\t:");
- 	ttm_pool_debugfs_orders(global_uncached, m);
+ 	if (!pool->use_dma_alloc) {
+ 		seq_puts(m, "unused\n");
+ 		return 0;
+ 	}
 =20
- 	seq_puts(m, "wc 32\t:");
- 	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
- 	seq_puts(m, "uc 32\t:");
- 	ttm_pool_debugfs_orders(global_dma32_uncached, m);
+ 	ttm_pool_debugfs_header(m);
 =20
 -	spin_lock(&shrinker_lock);
++	mutex_lock(&shrinker_lock);
  	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
  		seq_puts(m, "DMA ");
  		switch (i) {
@@@ -597,12 -658,9 +657,9 @@@
  		}
  		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
  	}
-=20
- 	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
- 		   atomic_long_read(&allocated_pages), page_pool_size);
-=20
 -	spin_unlock(&shrinker_lock);
 +	mutex_unlock(&shrinker_lock);
 =20
+ 	ttm_pool_debugfs_footer(m);
  	return 0;
  }
  EXPORT_SYMBOL(ttm_pool_debugfs);

--Sig_/oXO+eC.o1Sp6EZP+P.ON6IT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAI17oACgkQAVBC80lX
0Gyttgf/S7HYCIBsCN70DVdqIdUxLAekKp2nj7dBoYmemiFGY1hGBVKfw8/ITi41
w7Q8HzGTayI0Ah8uXdvTMc69m4aH2ldDkYJSIyKq4CyFLeoDdsqa62sr3HsiDZkZ
JTFMFo7kKouUCMteBI96p30xl0hgvApIyRBrChtuXCAVrge9lWPzQsCECOyJLT5r
5WAvSUxRysQHXFoZ7nPRp7d7SYcJ+0HxYjMvnV8aULEE55vb2KjVy2j+Nju4xnV2
MCmp7JzUFpXazyKhjUfSFytIlCTmN2+HnQ5swuzGAVwPer0aei7VvU3SfmAwNRxp
jQ1QdGeqJGrCk6jlN9Rq1qmP0VJTAA==
=/m5T
-----END PGP SIGNATURE-----

--Sig_/oXO+eC.o1Sp6EZP+P.ON6IT--

--===============1065572929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1065572929==--
