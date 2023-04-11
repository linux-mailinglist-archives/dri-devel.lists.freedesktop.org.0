Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC86DD345
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 08:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49E10E4C7;
	Tue, 11 Apr 2023 06:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8577F10E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 06:47:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwbxJ0dkbz4x1f;
 Tue, 11 Apr 2023 16:47:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681195637;
 bh=SVz5mmEnhm+60AEIU5V/bYGddcaKFGnrBQ+b9Dx8mms=;
 h=Date:From:To:Cc:Subject:From;
 b=ThG52KUrcJP87T9TycOJS3fU2Lo+MmXXO0FnMdPPlstT2usV+ueTnevOEgFk4Zbgc
 ERW++riqsUxZsYfSAXKeyS/0ndK4XLyiVjbjMAfBfnxT1GHbZ96c805I6zvKqTWlSl
 vOp4uAZds0FXBTzYj3vye3gJueQrzib2g/zRlVRC/7M5JLpXBn6DZPqDLRy3K5LG/G
 Lqe94NVocpi+nUdd9deIumwuP38BD9hsaFuvrEMh4VuyuDMzdMpPSQO5Jc+kNNz2yC
 6g6Dwcf9UenoTv8iJvGOe/kO75ow/fZya4IKKs6gjfFeSKqbPC6jgpCchvc2ZG9GXW
 S/9+uwCudiwOg==
Date: Tue, 11 Apr 2023 16:47:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20230411164714.2ce79bcb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M+1ebx7X3vKsgRZMb+5pd3Q";
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
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/M+1ebx7X3vKsgRZMb+5pd3Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/ttm/ttm_pool.c:73:29: error: variably modified 'global_writ=
e_combined' at file scope
   73 | static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:74:29: error: variably modified 'global_unca=
ched' at file scope
   74 | static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:76:29: error: variably modified 'global_dma3=
2_write_combined' at file scope
   76 | static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORD=
ER];
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/ttm/ttm_pool.c:77:29: error: variably modified 'global_dma3=
2_uncached' at file scope
   77 | static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
      |                             ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  322458c2bb1a ("drm/ttm: Reduce the number of used allocation orders for T=
TM pages")

PMD_SHIFT is not necessarily a constant on ppc (see
arch/powerpc/include/asm/book3s/64/pgtable.h).

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/M+1ebx7X3vKsgRZMb+5pd3Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ1AnIACgkQAVBC80lX
0GxolAgAjBZbaFJav9W9RpRcWLmU8P2Pe5CzLIBDlEF72z3C1dzbyk9gk9iDS87Q
bjR0gl4Kagjfrl8YR85C2vstZWX3btxMwkCmGbh/3FtRgvuRN+1kOaWHjTU41yi2
lHk8+PAla/vFytHXnCROu9QVDdUIKS4MmhDrESpbCFydsOSCl5RVDRw1bKpW6Xll
a6wZYavzCfgnPop9p9Wdx0rboRaE0H2syuElhmS0/yEaDSYmOICR+C5+ZpeJRpvu
7jWEQ6/i6WwiU3uNXY+oHwrmhiY6NEW/IhB8g/he+9ZeywJWFJlL4XLd94yOSdoq
OrJxUsZrncA97z2lAPPjchkFOuO0NQ==
=Jeaq
-----END PGP SIGNATURE-----

--Sig_/M+1ebx7X3vKsgRZMb+5pd3Q--
