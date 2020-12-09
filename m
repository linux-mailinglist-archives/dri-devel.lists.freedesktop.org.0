Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319792D3872
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 02:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CFF89D77;
	Wed,  9 Dec 2020 01:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1789D77;
 Wed,  9 Dec 2020 01:54:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrKpd66Q7z9sWC;
 Wed,  9 Dec 2020 12:54:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607478845;
 bh=XkobUWF4UCE6YB4ZVvIM/Nb3XrVq1YtY0YGEJG7PsOA=;
 h=Date:From:To:Cc:Subject:From;
 b=tSgLF5vL0Ol3CumHzKUtpGQTFwtVmISJo4eb/2X6cx/yTfI9JvzCDTTUJfWeUMqdg
 P29NZQlaqV/Nbg94gMaLMXZ4WSovUCFV9r9H9KKMb26rNUuQbsZjmAyfu7wuhm62Jk
 L0SuD2iiZjxKoKMNkkl7I72TJxwPpJrP7jH4Re/PxkVCwbwnbEixS3a7+cc0X+kapM
 mI7zooQxcG1yxXBibrFPs8JaEaoFn9hzXsxXRrPgaDX4rRE4WbjBctON7H2g5D2vj1
 OxXSi45W3kkaRoJBroV2qhj9QXM1ISAFea1QvABBB++5wbYaTddLESjLCC0St1wXK7
 UaHzGPBSf+vHw==
Date: Wed, 9 Dec 2020 12:53:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20201209125357.64825ba6@canb.auug.org.au>
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1407848182=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1407848182==
Content-Type: multipart/signed; boundary="Sig_/HfdbGgst59xfm+MdcwzgdOm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HfdbGgst59xfm+MdcwzgdOm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/gt/intel_mocs.c: In function 'get_mocs_settings':
drivers/gpu/drm/i915/gt/intel_mocs.c:363:22: error: 'GEN11_NUM_MOCS_ENTRIES=
' undeclared (first use in this function); did you mean 'GEN9_NUM_MOCS_ENTR=
IES'?
  363 |   table->n_entries =3D GEN11_NUM_MOCS_ENTRIES;
      |                      ^~~~~~~~~~~~~~~~~~~~~~
      |                      GEN9_NUM_MOCS_ENTRIES
drivers/gpu/drm/i915/gt/intel_mocs.c:363:22: note: each undeclared identifi=
er is reported only once for each function it appears in

Caused by commit

  2606b269234b ("drm/i915/dg1: Define MOCS table for DG1")

interacting with commit

  7c5c15dffe1e ("drm/i915/gt: Declare gen9 has 64 mocs entries!")

from the drm-intel-fixes tree.

I have applied the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Dec 2020 12:47:45 +1100
Subject: [PATCH] fixup for "drm/i915/gt: Declare gen9 has 64 mocs entries!"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_mocs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt=
/intel_mocs.c
index c60ca62b38df..ab6870242e18 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -360,7 +360,7 @@ static unsigned int get_mocs_settings(const struct drm_=
i915_private *i915,
 	if (IS_DG1(i915)) {
 		table->size =3D ARRAY_SIZE(dg1_mocs_table);
 		table->table =3D dg1_mocs_table;
-		table->n_entries =3D GEN11_NUM_MOCS_ENTRIES;
+		table->n_entries =3D GEN9_NUM_MOCS_ENTRIES;
 	} else if (INTEL_GEN(i915) >=3D 12) {
 		table->size  =3D ARRAY_SIZE(tgl_mocs_table);
 		table->table =3D tgl_mocs_table;
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/HfdbGgst59xfm+MdcwzgdOm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/QLjUACgkQAVBC80lX
0Gz5ggf+NrbactnKgEiOkh1f2npSckBhtJB9lyQ9hAWTDv3JexDzJ/WU2iDD5Xnb
J7xKsPQ8DNL35r7oedLYPG+NgV5lUT5XsOdNZkbKij1GRscgZK7g1wgPX/F/zHZD
OlR0BVllXJpHTpf1IOvN/1yOS1+Scf3fNe5YBiCJ9DiYUe9SvuPrS9Q8tj3OLzLg
y+EnDROuyboeR3qaDresZFPJbIKC+3WsugjDbTUk9U5H/A+kZhogJYUohLebbiJx
ng7b3IgualZb+yDxi40FPx+IM1HAYx7ngn78v7zet9psY8jyVdYu8PoqjdJ6Jlk5
UDxP/sCwHfSpZObfw3ljf2ijTk0d2A==
=aGSv
-----END PGP SIGNATURE-----

--Sig_/HfdbGgst59xfm+MdcwzgdOm--

--===============1407848182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1407848182==--
