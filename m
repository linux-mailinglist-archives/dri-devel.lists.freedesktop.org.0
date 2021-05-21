Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64338BBC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 03:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C90E6F59F;
	Fri, 21 May 2021 01:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8DD6F59F;
 Fri, 21 May 2021 01:42:38 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmTrD23Djz9sPf;
 Fri, 21 May 2021 11:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621561356;
 bh=NBPy0katuLaiq6HfjHUfCP+UbzPEkChk6oOJ+Kv8W9Y=;
 h=Date:From:To:Cc:Subject:From;
 b=d4pGBhhzPoc7bV5S1aKKCJFZhh1xLKOEqKwGL7irZfseHPUFbLT802VtxwH/Tk0rp
 AN3krvv2i3IY/9ZdVu/6iwJ2LslJ/KU3v9l0I8aKkHVxavLHTLb8ia/Fkr9o9Am7ir
 uE5IDt0yf6+QpGDchDkD7S1ty0xsqI+HDwtRY8ujVTvSCflrwMvEhd37cReCWl7Lt9
 iCI0ZWrhmNF/jyL1CqjtCK/93+b4LWtEe5o8fJ8inXCxdWnkTSdOBkN18r0K8susQ1
 ix8ofMIJf/ESyyINauEmJDspTSdJyxPOP/3mUhpxFG+yalCGMVBYtIr4x8+IDCn8X/
 iJIDKrEYZfL4g==
Date: Fri, 21 May 2021 11:42:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210521114235.1a93dc84@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2nmcL0k5P3rGcxbDxz1_kb=";
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
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2nmcL0k5P3rGcxbDxz1_kb=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_device.c

between commit:

  e9669fb78262 ("drm/amdgpu: Add early fini callback")

from the drm-misc tree and commit:

  814ab9930cfd ("drm/amdkfd: register HMM device private zone")

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

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_device.c
index b066aa009b6f,80015e866498..000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@@ -861,6 -891,8 +891,7 @@@ out
  void kgd2kfd_device_exit(struct kfd_dev *kfd)
  {
  	if (kfd->init_complete) {
 -		kgd2kfd_suspend(kfd, false);
+ 		svm_migrate_fini((struct amdgpu_device *)kfd->kgd);
  		device_queue_manager_uninit(kfd->dqm);
  		kfd_interrupt_exit(kfd);
  		kfd_topology_remove_device(kfd);

--Sig_/2nmcL0k5P3rGcxbDxz1_kb=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnEAsACgkQAVBC80lX
0GwbGgf9Fk1L6PTwLhwv/ZSbDY2fR/t1hlUJs/K4w8YCIMpLzm8k8CT0NAf1LCi+
3FCSD1MQVYUJSswkePHNK9+a7fJBCnOaucwma0NfB+2it4gQGRsPARGtslFPxwgj
BNnJXTECGnj2n98EvETF1WFyTHhYkAM9AA0vKz2ImhKYf7Yma4zqlLSV4WhIKSfd
+3S+JaLQ6pdL1+xzUBXD1LuP0l5vcJ8p8NKHjpp0WXHdDYZ898XHXYmeJa3c8dZa
PuC9zhfYLTupfWBuVe+oXumu7HC8JW2YFTdDdyISBLvT9pnuz1SAoSQjP1+WiZvj
lQf+DRW3X12HZGhfwW123OoMMPmByQ==
=PfAS
-----END PGP SIGNATURE-----

--Sig_/2nmcL0k5P3rGcxbDxz1_kb=--
