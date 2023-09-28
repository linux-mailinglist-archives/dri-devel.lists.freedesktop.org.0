Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42627B1096
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 04:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6724010E5CE;
	Thu, 28 Sep 2023 02:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E4410E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 02:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1695866761;
 bh=PiZdKhrE/o3h0tGaT8pGddKF7rJCeQnVsW/gwwhnafM=;
 h=Date:From:To:Cc:Subject:From;
 b=GRMuyIVD7OFAFCN42aro0PDyuSEH9y73kCbLx2Kq6Gj6YZz4fO3K+tOC6mLZAOhKi
 m4nmF7UufaQ0RlTPep1UXZWa94nbczGGUx+6VIh/1qkcjaLqKPqevlSYsHeyg3V4xb
 4FQMc7VvWSVDzuMglgD01IYfcECrX235HYTArXiql3omR+Aa216X0yud7VKulNojCa
 WDTxP01s19bHFCdmeI/q1BHVAVpWO1PjwbcET0J/9znllzN0TTBwh7WiaK6hNCbr2t
 geCDMMumUAFDJoyQdAyZOSXYqdBYDgEgAAAiSAHL+uVo1inIgzExsZ/YukqwA+bsew
 AS3DEUAWHkpqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RwxfJ5ksWz4xQb;
 Thu, 28 Sep 2023 12:06:00 +1000 (AEST)
Date: Thu, 28 Sep 2023 12:05:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <20230928120559.485eecd7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AI36QvNyIPurJhqGZN8m9Qs";
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/AI36QvNyIPurJhqGZN8m9Qs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/accel/ivpu/ivpu_fw.c

between commit:

  645d694559ca ("accel/ivpu: Use cached buffers for FW loading")

from the drm-misc-fixes tree and commit:

  53d98420f5f9 ("accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()")

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

diff --cc drivers/accel/ivpu/ivpu_fw.c
index 0191cf8e5964,d57e103aae1c..000000000000
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@@ -331,9 -332,7 +333,7 @@@ void ivpu_fw_load(struct ivpu_device *v
  		memset(start, 0, size);
  	}
 =20
 -	wmb(); /* Flush WC buffers after writing fw->mem */
 +	clflush_cache_range(fw->mem->kvaddr, fw->mem->base.size);
-=20
- 	return 0;
  }
 =20
  static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vp=
u_boot_params *boot_params)

--Sig_/AI36QvNyIPurJhqGZN8m9Qs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUU34cACgkQAVBC80lX
0Gx0vQf/YgJqpqoaLiWKBT81dUyyFB/aKPq0CvJARdYNvmu3n69BhK3qN+64FX4T
VQzi4wCZwgvErmnv1cJ83WliDY+UXTz/nTHNfzfttjI2nNbA9Lfc4qSRahhM/SXV
AlbD8wXdwTCm0MojHra6QXM8UiGafGbf+7PS9MadQ92WdCw+J3FCAZfCeWxSSo0U
QH5/EQ11G2NdmtkgMaSD2MCOW0vGoYfnfSjteHbcx/pak2hGKk+NBRWKcC5KagoV
SuRagK+4/Vn8Oy/g/lAb9SiiacZdjBzs9RftJyfJy2NXITTzOKYdok01IRRHVKpM
SK43I5VBEzCypRbTTDU7k88bCHe+mA==
=TbLq
-----END PGP SIGNATURE-----

--Sig_/AI36QvNyIPurJhqGZN8m9Qs--
