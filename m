Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76013D33ED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 07:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4E6F446;
	Fri, 23 Jul 2021 05:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCD16F446
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 05:09:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWHS96R4dz9sT6;
 Fri, 23 Jul 2021 15:09:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1627016987;
 bh=+N6PcGKTR+DbBT3V1RblqjraQfF6pgnYdiVqbtEWQoE=;
 h=Date:From:To:Cc:Subject:From;
 b=Z5BZaoGdWfIEMF9W3yW48wwmCnTf5IbiRMO3eB3dI/V4NTerkKQm5kD6xyxDZfaY4
 33wHvBD2uCNeLoGCLaqF3Pd98jTHSSdoU1cORW6ufkJY8+rLXVbPDjEKmzpD8Ukf5K
 x0PXqGA/FxRxGW2vduxF6UvKfj/j+/A11fJDVJkaQVj9xBVdht02iDoS13RzodQgLc
 Y1ZvQn9t5WJseMRyA8gRZY0R51UbYih9Lf+T9QTWwFyvZXi7JO27cykJt04CfCLcZw
 QdOuJaK3OzlB5p6YKX5PvB+FgGz4p+HVg0aVj2s7/NmWbPGdqHDyP+98K4JSd3wC1w
 sB5j0dobpuHnw==
Date: Fri, 23 Jul 2021 15:09:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20210723150944.528c10af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N.p3av4.tDKwa2IJNFAHPjL";
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Uwe =?UTF-8?B?S2xl?= =?UTF-8?B?aW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N.p3av4.tDKwa2IJNFAHPjL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'void (*)=
(struct device *)' from incompatible pointer type 'int (*)(struct device *)=
' [-Werror=3Dincompatible-pointer-types]
  106 |  .remove  =3D dp_aux_ep_remove,
      |             ^~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization for 'dp=
_aux_bus_type.remove')

Caused by commit

  aeb33699fc2c ("drm: Introduce the DP AUX bus")

from the drm tree interacting with commit

  fc7a6209d571 ("bus: Make remove callback return void")

from the driver-core tree.

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jul 2021 14:58:25 +1000
Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"

interaction with "bus: Make remove callback return void"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_aux_=
bus.c
index e49a70f3691b..298ea7a49591 100644
--- a/drivers/gpu/drm/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/drm_dp_aux_bus.c
@@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
  *
  * Calls through to the endpoint driver remove.
  *
- * Return: 0 if no error or negative error code.
  */
-static int dp_aux_ep_remove(struct device *dev)
+static void dp_aux_ep_remove(struct device *dev)
 {
 	struct dp_aux_ep_driver *aux_ep_drv =3D to_dp_aux_ep_drv(dev->driver);
 	struct dp_aux_ep_device *aux_ep =3D to_dp_aux_ep_dev(dev);
@@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
 	if (aux_ep_drv->remove)
 		aux_ep_drv->remove(aux_ep);
 	dev_pm_domain_detach(dev, true);
-
-	return 0;
 }
=20
 /**
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/N.p3av4.tDKwa2IJNFAHPjL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6TxgACgkQAVBC80lX
0Gy+Lgf9FGVOJRXFvvJLtV6FWF56PwDTTK0Yl3W7qqVr656qhOjnlWgoS/SfR+DV
SpaU+wjOGEBqJ7cNF9nrfx1fcvRDGpd4sfIyo6WDNbiLKVGw0TVFtuf5VAThZrie
uRBZJ2i4Cn993JgtWon1ZJb3UeD9WMgHYkmXMBdt6edvm7a8eBzjQxJMTGmDEDyr
5KIC85CWI36jtbuFRlj6bCrHKml0hy3mLGFN8Le2vuea3krLHYFd0Liu/rtV2PIz
tvsxO7Xi1W3o+po+/eRtjs3TVtOWQ3j8g7yCehodLpw9YiGaB+K1Doa/mhaaiiAS
bJxasXotd3oUD6B2sXe5BXQ+kS565g==
=Piz8
-----END PGP SIGNATURE-----

--Sig_/N.p3av4.tDKwa2IJNFAHPjL--
