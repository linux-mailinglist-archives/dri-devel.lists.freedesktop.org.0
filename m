Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75A7717D0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 03:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63510E04A;
	Mon,  7 Aug 2023 01:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FE510E04A;
 Mon,  7 Aug 2023 01:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1691371716;
 bh=9EOU9Lr1L/yLncGxZ2eseBzA+sEBN/Cq/jOgQHKB73U=;
 h=Date:From:To:Cc:Subject:From;
 b=czAMJREYCFB3ynUo407xErJS4H9iT0ZMkT6ky/Ou2CSrOmCRX5B4SeL6i4dR4JN+5
 suJoft7xOVpCBX2uB5zPlpzgBjfATgVx1iC0inHjzlogEU+wAiXWV1rln1f2lOnS1G
 LLHPKn0NUb3pZ9bFuG5RTvkz5VxaZoJaGlHiLrJLQ7OYyLkEVD2QLGWNV4jpUky/4I
 1KDV0F1D5pLNM559R+0tLpRPUe/1n8wM+WZzL/KdDeyf8H79C1pNCxPIPLVUbflF0p
 j1hvxUYIg8RdY9EA0TOTjlsohlbHOsPjKT2Pvki6RlsyWXyoQZHg/pr6C83GgEP+wX
 srD6fcIbRABTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RJzH80wxMz4wy5;
 Mon,  7 Aug 2023 11:28:35 +1000 (AEST)
Date: Mon, 7 Aug 2023 11:28:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20230807112833.18c27533@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vXP_Tmv8IxGXgCoJ65F7EE1";
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
 Danilo Krummrich <dakr@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vXP_Tmv8IxGXgCoJ65F7EE1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:4,
                 from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h:5,
                 from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:22:
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c: In function 'nvkm_uvmm_mthd=
_raw_map':
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to poi=
nter from integer of different size [-Wint-to-pointer-cast]
  422 |                               (void *)args->argv, args->argc);
      |                               ^
drivers/gpu/drm/nouveau/include/nvkm/core/memory.h:66:43: note: in definiti=
on of macro 'nvkm_memory_map'
   66 |         (p)->func->map((p),(o),(vm),(va),(av),(ac))
      |                                           ^~

Introduced by commit

  6b252cf42281 ("drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm")

--=20
Cheers,
Stephen Rothwell

--Sig_/vXP_Tmv8IxGXgCoJ65F7EE1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTQSMIACgkQAVBC80lX
0GyuRwf8CLC4YuxQWPn+FtMx6gDDPL0s5OLlTE9sTygM9Ke4RR9uSZOg4+Zjpa8H
/D28couYVXEsMmJcCRD263gxpCEWVmwN5uf5/hQBu+jFlB5QQzKRApPIhER+Cpuv
HAxp9PUfdLKgxF6ZKw8GEW2SEfa2su0EcUWkZ4JqDCT1T6V+Hpye5DNCNYTxsHjD
B5eDSRBhGOT6sjFo1KpbZnw4A5LgqSPd65OnZxHlNZbBYhReT5gdOw5WALfzEfOs
sj4x8ixxEJYMBPZ/Asouo9xoyOc5qRPHAqA+1Drzc64gs1IJnj0LxJaWY1vBn9T3
d+0Y7z52aaXUNHj6Zdw7HJHCQGY31w==
=U/Y0
-----END PGP SIGNATURE-----

--Sig_/vXP_Tmv8IxGXgCoJ65F7EE1--
