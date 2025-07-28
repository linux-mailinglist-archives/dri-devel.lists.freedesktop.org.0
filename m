Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FCB144BF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 01:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABC510E048;
	Mon, 28 Jul 2025 23:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pT7Bf6pB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86B10E048
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 23:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1753745737;
 bh=P6aPRjcgZ0UmDvuH8/g7TWfwU39ztlV1xDp/3KzlwlU=;
 h=Date:From:To:Cc:Subject:From;
 b=pT7Bf6pB7LH9+ttNeg4qPeyUhjtbKcgTAiU7O5QEn6pHm+E9sOsBbWtwv9AiQsJGS
 7/yIldnLGGL5ymbQwZLekZjbEWhVZ5i4kGOjLLBky6LM50UejZqrHPFTsaNqeMpUfV
 4CUQquBlsoII8rgpJEWm7VwwjrgU0CGFAJh6+E0WzilYr0GVptaf8SNmh8lpSBDqrW
 mvK5AiRphI3aEm+Zu8o1dZE2fdIQ0rIHc1i8hofXClzRBnBUU/DaIEEyjU38ipBZhf
 OEbR/7Tc93d2Y4P9eiWqcvyXBueNq95oA/sZe09I20Hm5Fm4ED6S+O2XGzZZctbxPe
 SHcZuPMxvqsMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4brZbY0xb2z4w2N;
 Tue, 29 Jul 2025 09:35:36 +1000 (AEST)
Date: Tue, 29 Jul 2025 09:39:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: bad merge of the drm tree with Linus' tree
Message-ID: <20250729093903.386848f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g_fgtX5w1WT5HzhjFJZq6Yr";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/g_fgtX5w1WT5HzhjFJZq6Yr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Merging the drm tree with Linus' tree results in two copies of the
dc_get_host_router_index() function (due to a duplicated commit in
Linus' tree).  I have been applying the following merge fix for a while
- originally to the merge of the amdgpu tree and recently to the merge
of the drm tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Jun 2025 14:51:48 +1000
Subject: [PATCH] fix up bad merge of the amdgpu tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 28 ------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd=
/display/dc/core/dc.c
index 2628f16f77c1..c744aa9d830f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -6384,35 +6384,6 @@ unsigned int dc_get_det_buffer_size_from_state(const=
 struct dc_state *context)
 	else
 		return 0;
 }
-/**
- *************************************************************************=
**********************
- * dc_get_host_router_index: Get index of host router from a dpia link
- *
- * This function return a host router index of the target link. If the tar=
get link is dpia link.
- *
- * @param [in] link: target link
- * @param [out] host_router_index: host router index of the target link
- *
- * @return: true if the host router index is found and valid.
- *
- *************************************************************************=
**********************
- */
-bool dc_get_host_router_index(const struct dc_link *link, unsigned int *ho=
st_router_index)
-{
-	struct dc *dc =3D link->ctx->dc;
-
-	if (link->ep_type !=3D DISPLAY_ENDPOINT_USB4_DPIA)
-		return false;
-
-	if (link->link_index < dc->lowest_dpia_link_index)
-		return false;
-
-	*host_router_index =3D (link->link_index - dc->lowest_dpia_link_index) / =
dc->caps.num_of_dpias_per_host_router;
-	if (*host_router_index < dc->caps.num_of_host_routers)
-		return true;
-	else
-		return false;
-}
=20
 /**
  * dc_get_host_router_index: Get index of host router from a dpia link

--=20
Cheers,
Stephen Rothwell

--Sig_/g_fgtX5w1WT5HzhjFJZq6Yr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIChcACgkQAVBC80lX
0Gx+wAgAoA8XH5Owmxu/ZtqVJWzPJw+fKh6dftKWQtxfCA0dwJpuyEcQHrUQ4FGj
P6fPu4noenV7yIfIbNEbzGygQn70Q8ymBxJR9MW+PuBP5Afc/GX/vIGeSxzSEbBa
LlFubqubLtRuCakrsISSU7FG3AnSW5yefte4Q6w8icENs+dP1I0wnIsIChN36eRo
tcYICIuUgMBfH7Dvm2A6rbWDQUUzqXsRpUbrh+hTQ6tOiMzCzEddyE8oiqpEnTc+
MYZ6JqZi0mzmDszBFBWuXNx3LxWXUCDCKR5XpDBOv3ty8zJWQ/TGnorFSs1ajLWd
nuz1Rn6gGx/zBueSsHFpG03CLtoNWg==
=jMID
-----END PGP SIGNATURE-----

--Sig_/g_fgtX5w1WT5HzhjFJZq6Yr--
