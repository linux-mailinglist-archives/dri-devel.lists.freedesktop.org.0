Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E367DD5E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 07:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4810E3F2;
	Fri, 27 Jan 2023 06:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2239210E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:16:22 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P36ll1z3Cz4xGM;
 Fri, 27 Jan 2023 17:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1674800181;
 bh=VhTAOPrR41Xg1IzRQ17uQEaagP6uPDMc4j791sT8zEA=;
 h=Date:From:To:Cc:Subject:From;
 b=r6bc8cFO/RdP1CxwcD75JPkpbxG4nBrymxSzuPj7IrlcntYBSc7BPqe/cLAjWcAUs
 vOn+pcsfSgmTGIf6RPv2bkR4mZ3YxeyUurDRHevvW71Blik/2V2/IwJG8pEu8lUK7A
 FVv9XCWVoKmcH471pfx9xQuKfBUStu74i0lOZsVFUl3f5yPWYwi0jB6XtvSMtqB/Jq
 k/ukKGp4MV9pqXIQERVzdjlnHY7WftvIey4VecmxhyCbrBwP5iDBZsqsjL53x3isMm
 LN8on3aSyI7zghDPLbzztn8Bb77SdTEhdENG3zpll9V/DilUE2Ji0voEiHjM9/vBbm
 qKVKFBcsSKRTQ==
Date: Fri, 27 Jan 2023 17:16:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20230127171618.79cead50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yAe8Kl73kuJv_dCjTOMdg.Q";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Suren Baghdasaryan <surenb@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yAe8Kl73kuJv_dCjTOMdg.Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/accel/ivpu/ivpu_gem.c: In function 'ivpu_bo_mmap':
drivers/accel/ivpu/ivpu_gem.c:449:23: error: assignment of read-only member=
 'vm_flags'
  449 |         vma->vm_flags |=3D VM_PFNMAP | VM_DONTEXPAND;
      |                       ^~

Caused by commit

  b95a895848b9 ("mm: introduce vma->vm_flags wrapper functions")

interacting with commit

  647371a6609d ("accel/ivpu: Add GEM buffer object management")

from the drm tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Jan 2023 17:12:37 +1100
Subject: [PATCH] accel/ivpu: fix up for "mm: introduce vma->vm_flags wrappe=
r functions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/accel/ivpu/ivpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d1f923971b4c..12b219dd4f36 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -446,7 +446,7 @@ static int ivpu_bo_mmap(struct drm_gem_object *obj, str=
uct vm_area_struct *vma)
 		return dma_buf_mmap(obj->dma_buf, vma, 0);
 	}
=20
-	vma->vm_flags |=3D VM_PFNMAP | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND);
 	vma->vm_page_prot =3D ivpu_bo_pgprot(bo, vm_get_page_prot(vma->vm_flags));
=20
 	return 0;
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/yAe8Kl73kuJv_dCjTOMdg.Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPTbDIACgkQAVBC80lX
0GzSIgf/b7KHPO4scsTzokPV5z4OBxlpegEhuzziCz19qpHAQyMW+AgBCS7jziDr
eljFLxzebi0p8vzsRmwVtsQXFt9PH8KPZsOAbOUqQxYMnFwoTZbF/gIZU2BamVJI
c6BHCxxXxRmlj862Edds7VlSUZQ0YdIuv8jqg28yonguHQ+5zWf4TFYmLs2Zi2nC
HEMHQtJNCkkWh1FVsxL6zJz0nXGC5w/KK6x/+Lidh6TtNmAefXaIUwJXIbay9Dr6
Ph+grPflixawhg/QHkKphbl0JjPlXlxSlZYtyoRd5iCBuTAnh5/OkhqlL0jDYmew
0nEJWVhNnh78pWLCUq3Aa6XA6B3Uzw==
=Z4ND
-----END PGP SIGNATURE-----

--Sig_/yAe8Kl73kuJv_dCjTOMdg.Q--
