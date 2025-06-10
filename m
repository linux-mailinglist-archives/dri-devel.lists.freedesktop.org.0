Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36931AD2C02
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 04:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA310E0C9;
	Tue, 10 Jun 2025 02:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBA610E0A2;
 Tue, 10 Jun 2025 02:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749523691;
 bh=v8qGSKqYmLAneTxuYDnB1D6/yHuF6lrd/pyw2iVA0Bc=;
 h=Date:From:To:Cc:Subject:From;
 b=Catthj7jgd8LmNVunr8NjWZZxt0pgo/GPOA23t0oJUAS50BaRBEySdxR0uCglqGXh
 0gfozzpe1g4Fj5y5N2UErwC09iw7Q4LDwQSiXTKSrHHBEWmdR9kspTc3XrNslHVhwn
 FLSOsCsxiu9IxEiIL9ETmMsdDUg5Osvktag1mFLA7nyLB+5CqLLhO8rdsEEe9zn8ZS
 Sk+iKRo3TNduL1JytPdt5zKL14ie/Amr8y3MwhBg2r4vhhA1aY9GrdK8S/DfLlUfFP
 tuxtxBbmrpszAETtMOBU+2V5aEwUUojzd0LMVORgSmXJV+ogpDCqahtT7XcjcUMPXI
 3uD04eLzSxH5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGYBK6td8z4wj2;
 Tue, 10 Jun 2025 12:48:09 +1000 (AEST)
Date: Tue, 10 Jun 2025 12:48:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: semantic conflict  between  the drm-misc tree and
 Linus' tree
Message-ID: <20250610124809.1e1ff0cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T77Pp_HWM8GH0TUTsKa4OJM";
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

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of functi=
on 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
  325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s=
\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    =
0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%=
llx\n    0x%llx\n",
      |                 ^~~~~~~~~~
      |                 pci_intx

Caused by commit

  c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability=
 (RAS)")

interacting with commit

  1c8a0ed2043c ("PCI: Remove unused pci_printk()")

from Linus' tree (in v6.16-rc1).

As a fix up patch would be a bit of a mess, I have used the drm-misc
tree from next-20250606 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHnOkACgkQAVBC80lX
0GxP2ggAo19Tr02P/N3wNq2xlLcQEBlaxxHwXNEzxpmLQASTE3YmVgiOYa0AcDiv
qT29I817Qz6uZ390Om3YNOPp5GArsTWlt/Wl78qgZaAdU8ibbaQzVAYC99vAKJ9g
vtF3WbwzRxiuMQTN/fa7V6gByttn3yKS18v4Liw7U9bwXI1CvkPLST5JUvHfemrn
d+EX12x+nXWB/EGhQeUrt+aUq0OwZklaCe/2vsBkBxn1DP/6OY3dg85OwZTtUhJm
8LGrlDsedIeEeMCusbpnYIXmVXD2fGs4+DSTaMINOStlWgOrrLnf+rPnQ5oy88WY
TKKFQdZjYhli4bO03r4WV4HPrs6U8A==
=lo4c
-----END PGP SIGNATURE-----

--Sig_/T77Pp_HWM8GH0TUTsKa4OJM--
