Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9271672DE2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83F10E221;
	Thu, 19 Jan 2023 01:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C1510E21E;
 Thu, 19 Jan 2023 01:13:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ny4Pc5V6hz4xN4;
 Thu, 19 Jan 2023 12:13:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1674090789;
 bh=38gPF9WCNIwlhkWACirRWDyLEnGY8N9VoQR90tcBLPk=;
 h=Date:From:To:Cc:Subject:From;
 b=O41Z/jl7V5AgTg3n9R89wwqYHhQ9FBmo8jn4bbdq+gNvn9l8LLXZtDBUuK/qEDKm0
 fEu/SDHgizpb6gt7U+H5uL/bqEjlV/5OtR/ru/gFZV8vJ+9BgZGrdfClFJzp9tBzK0
 K2dylru46iFKsrsLaRZIljFdFLAKyk2Hu80pag74XGEydZjo8ssmHaySWGNCkKzxRc
 7bzNiUapvHuBqbZCZH8blOSqpawUw871sW/U1m4gYpbuOCkufbrNZbBXBxwSaBYAw6
 rRhVPec2HTD4E7VkptANc5f1VzfczIUuX6WoBrkMQdG6lKZkEqnn7ne0QBW1FbJgmT
 x0kvLn+5rwxSw==
Date: Thu, 19 Jan 2023 12:13:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230119121307.4366ac4e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0hwf36qt=q.5jX13Fkq2FrR";
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/0hwf36qt=q.5jX13Fkq2FrR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vmwgfx/ttm_object.h

between commit:

  a309c7194e8a ("drm/vmwgfx: Remove rcu locks from user resources")

from Linus' tree and commit:

  13acb368bf02 ("drm/ttm/vmwgfx: move ttm_bo_wait into VMWGFX")

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

diff --cc drivers/gpu/drm/vmwgfx/ttm_object.h
index 8098a3846bae,95a9679f9d39..000000000000
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@@ -307,4 -309,27 +309,12 @@@ extern int ttm_prime_handle_to_fd(struc
  #define ttm_prime_object_kfree(__obj, __prime)		\
  	kfree_rcu(__obj, __prime.base.rhead)
 =20
 -struct ttm_base_object *
 -ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint64_t key);
 -
 -/**
 - * ttm_base_object_noref_release - release a base object pointer looked up
 - * without reference
 - *
 - * Releases a base object pointer looked up with ttm_base_object_noref_lo=
okup().
 - */
 -static inline void ttm_base_object_noref_release(void)
 -{
 -	__acquire(RCU);
 -	rcu_read_unlock();
 -}
 -
+ static inline int ttm_bo_wait(struct ttm_buffer_object *bo, bool intr,
+ 			      bool no_wait)
+ {
+ 	struct ttm_operation_ctx ctx =3D { intr, no_wait };
+=20
+ 	return ttm_bo_wait_ctx(bo, &ctx);
+ }
+=20
  #endif

--Sig_/0hwf36qt=q.5jX13Fkq2FrR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPImSMACgkQAVBC80lX
0GzCQAf/fIL3znz6gmPHSw9S8jB8gAKcOvfDx0QLArZSqxKxRDe+Oj0DkYOA7e2L
mBvET7giBmk9c2WcmTWv5vrHqSN3hNaXWySj0f3EzJd7PTkfigxKd4EOJEJOHnOz
tB8P0T/gykg2kJoGPQ10/FHd9d19Wx7r1rB5Wd7Lw3r8YHmudkKiDii89EH7aYX+
RZ8gD919W10NfaeKFjU7Ea6vkL+bIezQB28GOZFqXNSXupsI12BI+C1ivr17HSQD
fqgH49OfuOR7xkWUiT+YVJnWaXq+oYSACTxFJtYTIFfmEDYJUGnxhiMHP1uy99sD
xk19NQbhmoshnAiLvBexpnMB+yGS/g==
=IJWR
-----END PGP SIGNATURE-----

--Sig_/0hwf36qt=q.5jX13Fkq2FrR--
