Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF78B2E93
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 04:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C9811A98A;
	Fri, 26 Apr 2024 02:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FRT4dQh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B04610FF09;
 Fri, 26 Apr 2024 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1714097429;
 bh=1ojHsRPiRsoir+Q24y/ktvG1Mk3MRS2GO165P9N7x8Y=;
 h=Date:From:To:Cc:Subject:From;
 b=FRT4dQh+esGSDeX4HQBZcy8sf1DcR9wTgS+M9YzHA0H3gSIlF0aGr5VI+LxRaCZwc
 mUPj6ZxwlTAPou1JnofUpDb5AeldQ1Etu17O3TBLPeE/6nYLDb97p3xKOMGTUqmRGa
 sTurosRmQG733M2gXQgED4UrPVW9LNAbtyZbkZsB4Y+YFqHgXrkmOwo+sGtkFnNbxo
 6V+G5aFqgE6q2UvABAQW/de+3rWAao83AivEec/KI4eypJ14pPzQulmud1Z7jsbRVt
 u+yv/X6MRrnLbBRgqOViujI9tMfDtn7WXG9/IvxlaZ2169X1wafOv5YMAeZ7a5C7SA
 hDYqpYzbvWQdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VQbm43Gzhz4wyQ;
 Fri, 26 Apr 2024 12:10:28 +1000 (AEST)
Date: Fri, 26 Apr 2024 12:10:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failures after merge of the drm-misc tree
Message-ID: <20240426121027.2033ddd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=Ij.CB74ner2v2IZJgS4KBc";
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

--Sig_/=Ij.CB74ner2v2IZJgS4KBc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next builds (arm
multi_v7_defconfig and x86_64 allmodconfig) failed like this:

(from the arm build)

drivers/gpu/drm/omapdrm/omap_fb.c: In function 'omap_framebuffer_describe':
drivers/gpu/drm/omapdrm/omap_fb.c:325:9: error: implicit declaration of fun=
ction 'seq_printf'; did you mean 'drm_printf'? [-Werror=3Dimplicit-function=
-declaration]
  325 |         seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
      |         ^~~~~~~~~~
      |         drm_printf

(from the x86_64 build)

drivers/gpu/drm/loongson/lsdc_crtc.c: In function 'lsdc_crtc_late_register':
drivers/gpu/drm/loongson/lsdc_crtc.c:692:9: error: implicit declaration of =
function 'debugfs_create_file'; did you mean 'bus_create_file'? [-Werror=3D=
implicit-function-declaration]
  692 |         debugfs_create_file("ops", 0644, crtc->debugfs_entry, lcrtc,
      |         ^~~~~~~~~~~~~~~~~~~
      |         bus_create_file

Caused by commits

  9e2b84fb6cd7 ("drm/print: drop include seq_file.h")
  33d5ae6cacf4 ("drm/print: drop include debugfs.h and include where needed=
")

I have used the drm-misc tree from next-20240423 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=Ij.CB74ner2v2IZJgS4KBc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYrDRMACgkQAVBC80lX
0Gxm3wf+PzMwQe47NtzpGc7OV20UnbDTHUsuVa7yxfjlFoBSlXTjPSnUA6a9zmEM
AsjgmuA3Iog1k902zOmLAGzZN928mcTskkkYE3sRRZnJSK4rGOcwrTOZ8/ycq6lD
DqMLIo7SNHaRbaOGVzKhVVVhK6W2mrlohWogu5Ec8goHo1KuIDKESZywaUzmKC8i
vD6JzLAELe8U4NTAormWzo9RFKGItIJ1zks6NkdrTBA8icKkbxOFP+5A2zwnysx/
xr1dQzDX7c76toSQIjfqaY1cEcYCPQMFjcDLVpW7d09DwEEThNp3FLXu1165hh1L
hMEjYQvfxBZbD+AKY6HkanPo1y7tRQ==
=huZo
-----END PGP SIGNATURE-----

--Sig_/=Ij.CB74ner2v2IZJgS4KBc--
