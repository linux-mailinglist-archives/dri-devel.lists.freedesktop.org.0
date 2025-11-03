Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74EC29B36
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 01:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8292D10E1B1;
	Mon,  3 Nov 2025 00:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H9heTeJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6DB10E1B1;
 Mon,  3 Nov 2025 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762129459;
 bh=Iy94SWbg1+RQ4Kuynk8DOKGrvK0LPLOCMyntYUWRNLQ=;
 h=Date:From:To:Cc:Subject:From;
 b=H9heTeJrqmE8UuajRxoJsONK2bQsP8jqTOFQ35+XxoSgcyR2QFPxDg6qXBYBHx2jz
 68texnh7DpH2jRsHC/9x3tcgBaZ5u4apJWc3fjFaEgJK5Tn5M5bwGE1Dr8G8RFFiZq
 VSez0aOBaB5VG0a3e705BwOp1AvdM7hANCoUsy5e83byHoVT46kn0dkULI//njub5P
 jPQgOp77Dn3KBuV7d+qEoyA3rsc3m5UwgnExhWSdovjOGCLl6kBrdWCCzObj8i1IGP
 CAW/Zv2q9OxORRj4ZgrBlhs2UfyzfhP1+gp+Nv/ip97DLlFiv1lPx/Qb6/9gzUwkSD
 Q8V/oZ7G6Z3tQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0C4z2VW2z4w9q;
 Mon, 03 Nov 2025 11:24:19 +1100 (AEDT)
Date: Mon, 3 Nov 2025 11:24:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20251103112418.031b3f8c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KlBPDI1Nmz+Tm.siOFEFuQt";
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

--Sig_/KlBPDI1Nmz+Tm.siOFEFuQt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c: In function 'rzg2l_du_probe':
drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c:173:9: error: implicit declara=
tion of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-d=
eclaration]
  173 |         drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev-=
>dev));
      |         ^~~~~~~~
      |         pr_info

Presumably caused by commit

  9695c143b72a ("drm/buddy: replace drm_print.h include with a forward decl=
aration")
or
  ea722522d505 ("drm/mm: replace drm_print.h include with a forward declara=
tion")
or
  d7a849d126d0 ("drm/ttm: replace drm_print.h include with a forward declar=
ation")

I have applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 3 Nov 2025 11:12:27 +1100
Subject: [PATCH] fix up for dropping drm_print.h includes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm=
/renesas/rz-du/rzg2l_du_drv.c
index e1aa6a719529..c34b1a13e685 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_print.h>
=20
 #include "rzg2l_du_drv.h"
 #include "rzg2l_du_kms.h"
--=20
2.51.1

Which lead to this:

drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_convert_for=
mat':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:17: error: implicit declar=
ation of function 'DRM_ERROR'; did you mean 'SO_ERROR'? [-Wimplicit-functio=
n-declaration]
  215 |                 DRM_ERROR("unsupported format[%08x]\n", format);
      |                 ^~~~~~~~~
      |                 SO_ERROR
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rockchip_vop2_mo=
d_supported':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:33: error: implicit declar=
ation of function 'drm_dbg_kms' [-Wimplicit-function-declaration]
  395 |                                 drm_dbg_kms(vop2->drm,
      |                                 ^~~~~~~~~~~
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_setup_scale=
':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:25: error: implicit declar=
ation of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-d=
eclaration]
  602 |                         drm_dbg(vop2->drm, "%s dst_w[%d] should ali=
gn as 2 pixel\n",
      |                         ^~~~~~~
      |                         dev_dbg
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_core_clks_p=
repare_enable':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:17: error: implicit declar=
ation of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-de=
claration]
  763 |                 drm_err(vop2->drm, "failed to enable hclk - %d\n", =
ret);
      |                 ^~~~~~~
      |                 pr_err
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic=
_disable':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:17: error: implicit declar=
ation of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-=
declaration]
  967 |                 drm_info(vop2->drm, "wait for vp%d dsp_hold timeout=
\n", vp->id);
      |                 ^~~~~~~~
      |                 pr_info
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic=
_enable':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1758:41: error: implicit decla=
ration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-functio=
n-declaration]
 1758 |                                         drm_warn(vop2->drm,
      |                                         ^~~~~~~~
      |                                         dev_warn
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rk3576_vp_isr':
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2198:17: error: implicit decla=
ration of function 'drm_err_ratelimited'; did you mean 'pr_err_ratelimited'=
? [-Wimplicit-function-declaration]
 2198 |                 drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY irq =
err at vp%d\n", vp->id);
      |                 ^~~~~~~~~~~~~~~~~~~
      |                 pr_err_ratelimited

So, I have instead used the drm-misc tree from next-20251031 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/KlBPDI1Nmz+Tm.siOFEFuQt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH9jIACgkQAVBC80lX
0GyxLwf+K1ygjtBBNcNgTPWtGNQp75QVY0hRVBj1BczKJcoXQ8OjJHdIP7UfCaz6
kjmLSWm19LAx2XwKNgf+S4OqGAmWDHxXM3eHIPrGrYcy+B7udmXdN8EYClaj+qlH
I+V/II8nUI5lqDNFrJnSMGClVJLYmkiKlT3Bf2pB6Y3mnxyCApxsGZGXJ9lV5jZ7
1mRw94CMV+WQrsI4nke4e6jxo7OoLTk68Lr4GtviGzF9XVpUhOIQzDEl5pN3MWdL
aoMsKfT8XBo5iZ84yXUL0hB05PTLkxO1KMpgzIFrrOVwf8/6DBoCJQaEA/Wc/jrR
zD5Y1te9+YDa1/O07EppD5U1YXsbqg==
=waFo
-----END PGP SIGNATURE-----

--Sig_/KlBPDI1Nmz+Tm.siOFEFuQt--
