Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E78215EF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 00:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E791910E091;
	Mon,  1 Jan 2024 23:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3AB10E091
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 23:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1704153147;
 bh=fT41D17aS053xSaBSdZ3kdXTNCwLSGWr3ETa4koZxS8=;
 h=Date:From:To:Cc:Subject:From;
 b=P8mvohA+p/ebDhIvw/T9nlWkUTd4qKsZrS1kZ9xSZHdCPrD2x8VU2+Y2ULHn3xIS7
 5RZRSn0M7HvtfLGubOmmZEntUqUwtg3IIDSgPZhbQBKxCkRgomKYRlpuDMil2EWRsy
 KZ6++jVYDmBN7kfBA5s3pHnVMQTgC79zU4UUlrLh71Wc9DU4TFwZCN5Znb3DmTkiyj
 8tLf8LNIS2KxQdPH/Q8MgQpMNJ6JBN1UNQW1N5aUfG4nqQ0p8prZHrHQsKB+4B/drI
 TZE/qIQM2qoimJfB6TZShNhxJeFqBpBGmu5203dgW484W0rvzQjm5aV1DBiqmQSa6d
 siM3uTWu4yLXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T3t7s510tz4wny;
 Tue,  2 Jan 2024 10:52:25 +1100 (AEDT)
Date: Tue, 2 Jan 2024 10:52:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: manual merge of the drm tree with the mm tree
Message-ID: <20240102105223.7634699d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nj3n3oz8ER.n_Fp.+QqdXTS";
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nj3n3oz8ER.n_Fp.+QqdXTS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/accel/qaic/qaic_data.c

between commit:

  78f5d33f3dd4 ("mm, treewide: rename MAX_ORDER to MAX_PAGE_ORDER")

from the mm tree and commit:

  47fbee5f27ed ("accel/qaic: Update MAX_ORDER use to be inclusive")

from the drm tree.

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
index 24e886f857d5,cf2898eda7ae..000000000000
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@@ -451,7 -452,7 +452,7 @@@ static int create_sgt(struct qaic_devic
  		 * later
  		 */
  		buf_extra =3D (PAGE_SIZE - size % PAGE_SIZE) % PAGE_SIZE;
- 		max_order =3D min(MAX_PAGE_ORDER - 1, get_order(size));
 -		max_order =3D min(MAX_ORDER, get_order(size));
++		max_order =3D min(MAX_PAGE_ORDER, get_order(size));
  	} else {
  		/* allocate a single page for book keeping */
  		nr_pages =3D 1;

--Sig_/nj3n3oz8ER.n_Fp.+QqdXTS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWTUDcACgkQAVBC80lX
0GwR1Af+MZT5Ie1hMcp412OyeJLJP0VMgjSICZYZoyTVEuZm4DiYz+eWPvLkvOh8
rmdRatJrE/Y29xaFjIHtAiCv0ab4M+f50hkw3p/6aA4PHCUKf8+Zg5bRQqjAcXB+
O8TQ6K+ZrrLSgbkCSPuhJa1aiSXL3jlraM6MPBrkepIWeTw53aBS80BnRXO0kZh0
+5gwMvO2UqZ/9t/vEH0TYVrVmau1zAiRx+20miBvHlk8wlF0gStwWuhKrRxZkMqE
4gzZnQGqbpTEpyqlodNQO9AIhHH3vu/p5CYrrluEplEGsH54Cel091bvjXyoEALF
ETWtLZ+Ng6X289xTrivLUWqYUc3N9w==
=eTR6
-----END PGP SIGNATURE-----

--Sig_/nj3n3oz8ER.n_Fp.+QqdXTS--
