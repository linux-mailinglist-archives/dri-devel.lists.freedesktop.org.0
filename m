Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAB2A22C9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 02:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9B6E101;
	Mon,  2 Nov 2020 01:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0E56E101;
 Mon,  2 Nov 2020 01:43:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CPbKX75Bbz9sVM;
 Mon,  2 Nov 2020 12:43:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604281410;
 bh=UZJnKassjurkUYFn1LtRDB9BZRJJwQe2Tnjaoo+5sn4=;
 h=Date:From:To:Cc:Subject:From;
 b=qJJ77BWKgBSEYT1T0APFfbFUmxFDp1zG+Xl0da8byynuYDWHynqj2B3frfb6OIj1I
 BZkDmLDZACg3kYkE6Bnl+1CVlTbGKvii/aJT4rrz3oxQUbXrQgoabudv0QqA3e9/85
 cP8KSzulqTqbVH6a/4/U5NHS2H+V1S6mNizZJ8N6l2AONn6AlG4mzBiiRRyDWGJdCx
 udpa7J9FmDXxP/yDS+Q13Uo1ubpKKCPNEu737132g75XlevRlrySViqUEYa7ADM/L7
 LbkM8OQffJmpFnWLc7Ljtpva2YOkbQC67ONYcC5MHfKWOmbgF0oRusuDuicdWZuaN/
 5KKSxL0Np484A==
Date: Mon, 2 Nov 2020 12:43:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102124327.2f82b2a7@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/mixed; boundary="===============0206207039=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0206207039==
Content-Type: multipart/signed; boundary="Sig_/+6=teLWTuoxG+moGZWw9H_h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+6=teLWTuoxG+moGZWw9H_h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in th=
is function)
   99 |  return SIZE_MAX;
      |         ^~~~~~~~
include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint=
.h>'; did you forget to '#include <stdint.h>'?
    6 | #include <linux/init.h>
  +++ |+#include <stdint.h>
    7 | #include <linux/types.h>
include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported =
only once for each function it appears in
   99 |  return SIZE_MAX;
      |         ^~~~~~~~

Caused by commit

  abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")

but only exposed by commit

  4dbafbd30aef ("drm/nouveu: fix swiotlb include")

I applied the following fix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Nov 2020 12:34:57 +1100
Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included

Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/swiotlb.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 513913ff7486..ed9de7855d3b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -5,6 +5,9 @@
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
+#ifndef CONFIG_SWIOTLB
+#include <linux/limits.h>
+#endif
=20
 struct device;
 struct page;
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/+6=teLWTuoxG+moGZWw9H_h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+fZD8ACgkQAVBC80lX
0Gy4Ewf/Xax561099MjSc01Qu4bldqQsUT2wm0XpotqdqEpG3jwA8Ixs1ZaKsvtL
nh2037AUrfl1VhjwWYw9kKulwOjN4aCRF+Ek7FblCuCH4yJryxMfyxSwFmHLr1p1
Y95gO09HP/mFLPVt1BHIcUU/0BY98vd0I1D2EaZB1GpniqwX4tg79Mad1C4293ub
vhWq2Ql+4HMHYoXdy7MZQ6+Q0Vr4Dn09HLLZGCyLFguHlVmUkdQmXjXjuqU/eIDy
l3SEfaxSxJNDfGDwPLaKUUUVZCKroxGArj8pHTW8VWByPxnYu+W12seT13eFu7e7
oVruhcMLwfxJG/jqHqd6kdhZ4YSvrQ==
=h4wL
-----END PGP SIGNATURE-----

--Sig_/+6=teLWTuoxG+moGZWw9H_h--

--===============0206207039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0206207039==--
