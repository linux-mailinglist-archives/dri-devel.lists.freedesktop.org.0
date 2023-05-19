Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD45708CA4
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 02:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0973B10E594;
	Fri, 19 May 2023 00:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266110E594
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 00:06:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QMnDy1WNgz4x47;
 Fri, 19 May 2023 10:06:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1684454771;
 bh=JiBDtPCRXHkVessovV0aGuRxTIbh8SExP1OLz/sR2t8=;
 h=Date:From:To:Cc:Subject:From;
 b=g7SJnREGs0jH3Y2xQht0mVwYhy1SdYn138OaUVyTFqC3kPr71GOHczVplEtWpS4dx
 p5Iht+O6Ifq+g3c/fCpI0rr+HC0JcOU5O1xCPuLjmr89sJtp9wRt9iqpu9ebWfJbUi
 CdZEShDvp1p9PqU09dJnwA34fIdRWFimCaGVkEfpg4YebK8jipLYsuW9HM/klISN/Q
 /TvXe8aMLhwXJeDrDvQS17EoEEm8dtexUiR4talTngM6ULmRQJgwclSYUewjpamusv
 fobt8xTfKu+c8iok6VmnOO4VZZRpKlnZSGAL8wlGeSPwfhZkCany0Oqa8VG9Jy4kLD
 vxnlZTDvgBdeg==
Date: Fri, 19 May 2023 10:06:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20230519100608.7e836126@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c262WyEoSEonV2KE3p0wkvu";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 James Zhu <James.Zhu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/c262WyEoSEonV2KE3p0wkvu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c: In function 'amdgpu_ctx_init':
drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:348:26: error: 'fpriv' undeclared (=
first use in this function)
  348 |         ctx->ctx_mgr =3D &(fpriv->ctx_mgr);
      |                          ^~~~~

Caused by commit

  2458393a4e98 ("drm/amdgpu: keep amdgpu_ctx_mgr in ctx structure")

I have used the amdgpu tree from next-20230518 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/c262WyEoSEonV2KE3p0wkvu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRmvXAACgkQAVBC80lX
0GzFYwf7ByLWzDf6IlJ6fQB7OaBwE2EBv08ctssID0CcIgUjrREIr3LWTAJYzOcv
T0FAH5+yl/3C9kdC1kujLk9cVDLLYdTsNxFBdLDu/vqdbuj60sQbSumcsvvWK7zg
pNsKIOIc/CbtIicJ5guLrz49sqKQIdjp+CWv/4AlBzKUEHq2C7J9PY4cNVVOa8Iz
BAfVEGftfrYsAxmtnUCLqgCdILOVnqaFfF16iXXwsiVXyuNi75yZCozlbGHryD8B
k0xkcOWWwaHpqG+8vs7a0RI+GLBzEPia0BUOrUwiiPWeGVK4VRI7b03kEinR+eFs
15PbN2rS3kPOa0UK2HatttUarmW+Pw==
=uY02
-----END PGP SIGNATURE-----

--Sig_/c262WyEoSEonV2KE3p0wkvu--
